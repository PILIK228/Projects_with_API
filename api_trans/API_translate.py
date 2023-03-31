# ZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmxlSEFpT2pFMk9EQXhPVEkxT0Rjc0lrMXZaR1ZzSWpwN0lrTm9ZWEpoWTNSbGNuTlFaWEpFWVhraU9qVXdNREF3TENKVmMyVnlTV1FpT2pnMk1EY3NJbFZ1YVhGMVpVbGtJam9pWXpFeE56ZGtaREV0TlRNek9TMDBNemswTFdKa1pEZ3RObVJqTjJJeE0yUTVaalV4SW4xOS5fdkUyTkFYSmFDV2YwX25xUEFqMU4zTlA2V3dWTmwyZUp4anZacWNrY2tR
import requests

URL_AUTH = 'https://developers.lingvolive.com/api/v1.1/authenticate'
URL_TRANSLATE = 'https://developers.lingvolive.com/api/v1/Minicard'
KEY = 'YzExNzdkZDEtNTMzOS00Mzk0LWJkZDgtNmRjN2IxM2Q5ZjUxOjgwOWE4YzBhNDBjNTRhNzVhZWVlYjU0MjEwNGY2NDU5'

headers_auth = {'Authorization': 'Basic ' + KEY}
auth = requests.post(URL_AUTH, headers=headers_auth)

if auth.status_code == 200:
    token = auth.text
    while True:
        word = input("Введите слово для перевода: ")
        if word:
            headers_translate = {
                'Authorization': 'Bearer ' + token
            }
            params = {
                'text': word,
                'srcLang': 1033,
                'dstLang': 1049
            }
            r = requests.get(URL_TRANSLATE, headers=headers_translate, params=params)
            res = r.json()
            try:
                print(res["Translation"]['Translation'])
            except:
                print('Не найдено варианта для перевода')

else:
    print('Error!')
