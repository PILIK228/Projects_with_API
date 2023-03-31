--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(30),
    country character varying(30),
    lat numeric,
    lon numeric
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: prediction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prediction (
    id integer NOT NULL,
    cities_id integer NOT NULL,
    dates character varying(30),
    temperature integer,
    description character varying(30)
);


ALTER TABLE public.prediction OWNER TO postgres;

--
-- Name: prediction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prediction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prediction_id_seq OWNER TO postgres;

--
-- Name: prediction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prediction_id_seq OWNED BY public.prediction.id;


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: prediction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prediction ALTER COLUMN id SET DEFAULT nextval('public.prediction_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, country, lat, lon) FROM stdin;
1	Москва	RU	55.7504461	37.6174943
2	Лондон	GB	51.5073219	-0.1276474
3	Дубай	AE	25.2653471	55.2924914
4	Нью-Йорк	US	40.7127281	-74.0060152
5	Калининград	RU	54.710128	20.5105838
6	Стамбул	TR	41.0091982	28.9662187
7	Сидней	AU	-33.8698439	151.2082848
8	городской округ Казань	RU	55.7823547	49.1242266
9	Берлин	DE	52.5170365	13.3888599
10	Париж	FR	48.8588897	2.3200410217200766
11	Варшава	PL	52.2319581	21.0067249
12	Берн	CH	46.9482713	7.4514512
13	Токио	JP	35.6828387	139.7594549
14	Киото	JP	35.021041	135.7556075
15	Каунас	LT	54.8982139	23.9044817
16	Барселона	ES	41.3828939	2.1774322
17	Осло	NO	59.9133301	10.7389701
18	Тбилиси	GE	41.6934591	44.8014495
19	Столица Прага	CZ	50.0874654	14.4212535
20	Вена	AT	48.2083537	16.3725042
\.


--
-- Data for Name: prediction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prediction (id, cities_id, dates, temperature, description) FROM stdin;
511	1	2023-03-31 21:00:00	1	небольшой снег
512	1	2023-04-01 00:00:00	0	небольшой снег
513	1	2023-04-01 03:00:00	0	небольшой снег
514	1	2023-04-01 06:00:00	0	небольшой снег
515	1	2023-04-01 09:00:00	2	пасмурно
516	2	2023-03-31 21:00:00	10	небольшой дождь
517	2	2023-04-01 00:00:00	9	небольшой дождь
518	2	2023-04-01 03:00:00	8	небольшой дождь
519	2	2023-04-01 06:00:00	8	небольшой дождь
520	2	2023-04-01 09:00:00	7	пасмурно
521	3	2023-03-31 21:00:00	23	ясно
522	3	2023-04-01 00:00:00	23	ясно
523	3	2023-04-01 03:00:00	23	ясно
524	3	2023-04-01 06:00:00	25	ясно
525	3	2023-04-01 09:00:00	25	ясно
526	4	2023-03-31 21:00:00	9	пасмурно
527	4	2023-04-01 00:00:00	10	пасмурно
528	4	2023-04-01 03:00:00	11	пасмурно
529	4	2023-04-01 06:00:00	11	пасмурно
530	4	2023-04-01 09:00:00	12	небольшой дождь
531	5	2023-03-31 21:00:00	5	облачно с прояснениями
532	5	2023-04-01 00:00:00	4	облачно с прояснениями
533	5	2023-04-01 03:00:00	4	пасмурно
534	5	2023-04-01 06:00:00	4	пасмурно
535	5	2023-04-01 09:00:00	5	пасмурно
536	6	2023-03-31 21:00:00	10	ясно
537	6	2023-04-01 00:00:00	10	небольшая облачность
538	6	2023-04-01 03:00:00	9	небольшая облачность
539	6	2023-04-01 06:00:00	10	переменная облачность
540	6	2023-04-01 09:00:00	14	пасмурно
541	7	2023-03-31 21:00:00	14	переменная облачность
542	7	2023-04-01 00:00:00	17	небольшой дождь
543	7	2023-04-01 03:00:00	17	дождь
544	7	2023-04-01 06:00:00	17	небольшой дождь
545	7	2023-04-01 09:00:00	17	небольшой дождь
546	8	2023-03-31 21:00:00	3	облачно с прояснениями
547	8	2023-04-01 00:00:00	2	переменная облачность
548	8	2023-04-01 03:00:00	1	небольшая облачность
549	8	2023-04-01 06:00:00	4	облачно с прояснениями
550	8	2023-04-01 09:00:00	6	небольшой дождь
551	9	2023-03-31 21:00:00	9	небольшой дождь
552	9	2023-04-01 00:00:00	9	небольшой дождь
553	9	2023-04-01 03:00:00	8	небольшой дождь
554	9	2023-04-01 06:00:00	8	небольшой дождь
555	9	2023-04-01 09:00:00	8	небольшой дождь
556	10	2023-03-31 21:00:00	11	небольшой дождь
557	10	2023-04-01 00:00:00	10	небольшой дождь
558	10	2023-04-01 03:00:00	10	небольшой дождь
559	10	2023-04-01 06:00:00	10	пасмурно
560	10	2023-04-01 09:00:00	10	небольшой дождь
561	11	2023-03-31 21:00:00	9	небольшой дождь
562	11	2023-04-01 00:00:00	9	небольшой дождь
563	11	2023-04-01 03:00:00	8	небольшой дождь
564	11	2023-04-01 06:00:00	8	небольшой дождь
565	11	2023-04-01 09:00:00	8	небольшой дождь
566	12	2023-03-31 21:00:00	7	небольшой дождь
567	12	2023-04-01 00:00:00	6	небольшой дождь
568	12	2023-04-01 03:00:00	5	дождь
569	12	2023-04-01 06:00:00	4	небольшой дождь
570	12	2023-04-01 09:00:00	5	небольшой дождь
571	13	2023-03-31 21:00:00	12	ясно
572	13	2023-04-01 00:00:00	15	ясно
573	13	2023-04-01 03:00:00	19	ясно
574	13	2023-04-01 06:00:00	20	ясно
575	13	2023-04-01 09:00:00	17	небольшой дождь
576	14	2023-03-31 21:00:00	9	ясно
577	14	2023-04-01 00:00:00	14	ясно
578	14	2023-04-01 03:00:00	22	ясно
579	14	2023-04-01 06:00:00	21	ясно
580	14	2023-04-01 09:00:00	16	переменная облачность
581	15	2023-03-31 21:00:00	6	пасмурно
582	15	2023-04-01 00:00:00	5	облачно с прояснениями
583	15	2023-04-01 03:00:00	5	пасмурно
584	15	2023-04-01 06:00:00	5	пасмурно
585	15	2023-04-01 09:00:00	6	пасмурно
586	16	2023-03-31 21:00:00	16	переменная облачность
587	16	2023-04-01 00:00:00	15	облачно с прояснениями
588	16	2023-04-01 03:00:00	14	пасмурно
589	16	2023-04-01 06:00:00	14	небольшой дождь
590	16	2023-04-01 09:00:00	15	пасмурно
591	17	2023-03-31 21:00:00	-1	облачно с прояснениями
592	17	2023-04-01 00:00:00	-3	переменная облачность
593	17	2023-04-01 03:00:00	-6	ясно
594	17	2023-04-01 06:00:00	-4	ясно
595	17	2023-04-01 09:00:00	1	ясно
596	18	2023-03-31 21:00:00	4	небольшой дождь
597	18	2023-04-01 00:00:00	3	пасмурно
598	18	2023-04-01 03:00:00	1	пасмурно
599	18	2023-04-01 06:00:00	5	облачно с прояснениями
600	18	2023-04-01 09:00:00	9	облачно с прояснениями
601	19	2023-03-31 21:00:00	9	небольшой дождь
602	19	2023-04-01 00:00:00	9	небольшой дождь
603	19	2023-04-01 03:00:00	8	небольшой дождь
604	19	2023-04-01 06:00:00	8	небольшой дождь
605	19	2023-04-01 09:00:00	9	облачно с прояснениями
606	20	2023-03-31 21:00:00	12	небольшой дождь
607	20	2023-04-01 00:00:00	11	облачно с прояснениями
608	20	2023-04-01 03:00:00	9	пасмурно
609	20	2023-04-01 06:00:00	9	пасмурно
610	20	2023-04-01 09:00:00	12	пасмурно
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 20, true);


--
-- Name: prediction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prediction_id_seq', 610, true);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: prediction prediction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prediction
    ADD CONSTRAINT prediction_pkey PRIMARY KEY (id);


--
-- Name: prediction prediction_cities_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prediction
    ADD CONSTRAINT prediction_cities_id_fkey FOREIGN KEY (cities_id) REFERENCES public.cities(id);


--
-- PostgreSQL database dump complete
--

