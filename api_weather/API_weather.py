import configparser
import requests
import psycopg2

config = configparser.ConfigParser()
config.read("settings.ini")

DB_NAME = config['Postgres_DB']['dbname']
DB_HOST = config['Postgres_DB']['host']
DB_USER = config['Postgres_DB']['user']
DB_PASS = config['Postgres_DB']['password']
APPID = config["Weather_API"]["APPID"]
URL_GEO = config["Weather_API"]["URL_GEO"]
URL_FC = config["Weather_API"]["URL_FC"]


# Получение координат города и его фк
def coord_from_db(city):
    with conn.cursor() as cur:
        cur.execute("""SELECT lat, lon, id FROM cities
        WHERE name=(%s)""", (city,))
        coord = cur.fetchone()
        lat = float(coord[0])
        lon = float(coord[1])
        id_city = int(coord[2])
        return lat, lon, id_city


# Получение полного прогноза по АПИ
def forecast(lat: float = 55.68, lon: float = 12.57, cnt: int = 5, id: int = 524901, lang: str = "ru", appid: str = APPID, units: str = "metric") -> dict:
    return requests.get(URL_FC, params=locals()).json()


# Получение списка городов
def get_all_cities():
    with conn.cursor() as cur:
        cur.execute("SELECT name FROM cities")
        res = cur.fetchall()
        res = list(map(lambda x: x[0], res))
        return res


# Обновление данных прогноза в БД
def update_pred():
    s = get_all_cities()
    for city in s:
        lat, lon, fk = coord_from_db(city)
        w = (forecast(lat, lon))
        cnt = w['cnt']
        for i in range(cnt):
            date = w['list'][i]['dt_txt']
            temp = int(w['list'][i]['main']['temp'])
            desc = w['list'][i]['weather'][0]['description']
            with conn.cursor() as cur:
                cur.execute("""INSERT INTO prediction(cities_id, dates, temperature, description)
                           VALUES (%(id)s, %(dt)s, %(t)s, %(dc)s);
                           """, {'id': fk, 'dt': date, 't': temp, 'dc': desc})
                conn.commit()
    return None


# Удаление старого прогноза в БД
def clear_pred():
    with conn.cursor() as cur:
        cur.execute("DELETE FROM prediction")
        conn.commit()
    return None


# Получение прогноза по городу из БД
def get_pred(city):
    with conn.cursor() as cur:
        cur.execute("""SELECT dates, temperature, description
                FROM prediction inner join cities on prediction.cities_id = cities.id 
                WHERE name=(%s)""", (city,))
        res = cur.fetchall()
        return res


if __name__ == "__main__":
    try:
        conn = psycopg2.connect(dbname=DB_NAME, host=DB_HOST, user=DB_USER, password=DB_PASS)
    except Exception as i:
        print(i)
    else:
        cities = get_all_cities()
        print(clear_pred(), update_pred(), *cities, sep='\n')
        while True:
            print("Для получения прогноза погоды введите название города из списка сверху: ",
                  "Для заверешения программы введите '0' ", sep='\n')
            answ = input()
            if answ in cities:
                print(f'Близжайший прогноз в городе {answ}: ', end='\n')
                s = get_pred(answ)
                for i in s:
                    print(f'Дата и время: {i[0]}, температура {i[1]} град. по Цельсию, {i[2]}')
            elif answ == '0':
                print('Завершение программы')
                break
            else:
                print('ОШИБКА')
