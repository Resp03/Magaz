--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE avtosalon;
DROP DATABASE gaz;




--
-- Drop roles
--

DROP ROLE admin;
DROP ROLE gaz;
DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE admin;
ALTER ROLE admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:6b6p36JbmfqO3aqCPZot5g==$HBAVBiaMWKB5f4dW4J5OvyyRFC/lsN+uOyvBYUr/a54=:4qfFWxa4jnfwgJMShpJZHp9m0Gffj0tR6q+agx2FTW8=';
CREATE ROLE gaz;
ALTER ROLE gaz WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:twbn0Q4cpC4bEqqbPeZJuA==$g0EA8YDWxi44IkeP2UP8MZT0dpXT8vpoLYbrGJ1bmdg=:pC90I4FE0Olqq1aM1EJrKtVyDziEdM37bl7WsxqkPTY=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:AifntuBbgHavc1rK1tSBiQ==$RBFvZH2UvGerc5yt9MTP7WHdi5a4DlB0isKYPpSsoNA=:nei+LXyCwWdYspI53A8xpOWRmufCmE5eWxFzRVcdrFA=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "avtosalon" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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

--
-- Name: avtosalon; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE avtosalon WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE avtosalon OWNER TO postgres;

\connect avtosalon

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

--
-- Name: after_inset(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.after_inset() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    insert into trigger_tab(name, vendor_id, date) VALUES
        (NEW.name, NEW.vendor_id, current_date);

    return new;

end;
$$;


ALTER FUNCTION public.after_inset() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: avto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avto (
    id integer NOT NULL,
    price character varying(50) NOT NULL,
    nalichie integer,
    salon_id integer
);


ALTER TABLE public.avto OWNER TO postgres;

--
-- Name: avto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.avto_id_seq OWNER TO postgres;

--
-- Name: avto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avto_id_seq OWNED BY public.avto.id;


--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    patronymic character varying(50) NOT NULL,
    number character varying(50) NOT NULL,
    num_pas integer NOT NULL,
    ser_pas integer NOT NULL,
    address_pas character varying(200) NOT NULL,
    address_propiski character varying(255) NOT NULL,
    email character varying(50)
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_id_seq OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- Name: datauser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.datauser (
    id integer NOT NULL,
    login character varying(50) NOT NULL,
    pass character varying(50)
);


ALTER TABLE public.datauser OWNER TO postgres;

--
-- Name: datauser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.datauser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.datauser_id_seq OWNER TO postgres;

--
-- Name: datauser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.datauser_id_seq OWNED BY public.datauser.id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    patronymic character varying(50) NOT NULL,
    num_pas integer NOT NULL,
    ser_pas integer NOT NULL,
    address_pas character varying(200) NOT NULL,
    address_propiski character varying(255) NOT NULL,
    post character varying(50) NOT NULL,
    email character varying(50),
    salon_id integer NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_id_seq OWNER TO postgres;

--
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- Name: harackter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.harackter (
    id integer,
    znach_harackter character varying(50) NOT NULL,
    avto integer NOT NULL
);


ALTER TABLE public.harackter OWNER TO postgres;

--
-- Name: salon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salon (
    id integer NOT NULL,
    address character varying(200) NOT NULL,
    numder integer NOT NULL,
    name_salon character varying(50) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.salon OWNER TO postgres;

--
-- Name: salon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.salon_id_seq OWNER TO postgres;

--
-- Name: salon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salon_id_seq OWNED BY public.salon.id;


--
-- Name: tip_harackter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tip_harackter (
    id integer NOT NULL,
    name_harackter character varying(50) NOT NULL,
    ed_izmer character varying(50)
);


ALTER TABLE public.tip_harackter OWNER TO postgres;

--
-- Name: tip_harackter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tip_harackter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tip_harackter_id_seq OWNER TO postgres;

--
-- Name: tip_harackter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tip_harackter_id_seq OWNED BY public.tip_harackter.id;


--
-- Name: trigger_tab; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trigger_tab (
    name character varying,
    vendor_id integer,
    date date
);


ALTER TABLE public.trigger_tab OWNER TO postgres;

--
-- Name: zakazy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zakazy (
    id integer NOT NULL,
    avto_id integer NOT NULL,
    client_id integer NOT NULL,
    data_start date NOT NULL,
    data_end date NOT NULL
);


ALTER TABLE public.zakazy OWNER TO postgres;

--
-- Name: zakazy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.zakazy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.zakazy_id_seq OWNER TO postgres;

--
-- Name: zakazy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zakazy_id_seq OWNED BY public.zakazy.id;


--
-- Name: zarplata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zarplata (
    id integer NOT NULL,
    oklad double precision NOT NULL,
    data date
);


ALTER TABLE public.zarplata OWNER TO postgres;

--
-- Name: avto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avto ALTER COLUMN id SET DEFAULT nextval('public.avto_id_seq'::regclass);


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- Name: datauser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datauser ALTER COLUMN id SET DEFAULT nextval('public.datauser_id_seq'::regclass);


--
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- Name: salon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salon ALTER COLUMN id SET DEFAULT nextval('public.salon_id_seq'::regclass);


--
-- Name: tip_harackter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tip_harackter ALTER COLUMN id SET DEFAULT nextval('public.tip_harackter_id_seq'::regclass);


--
-- Name: zakazy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zakazy ALTER COLUMN id SET DEFAULT nextval('public.zakazy_id_seq'::regclass);


--
-- Data for Name: avto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avto (id, price, nalichie, salon_id) FROM stdin;
1	800000	4	1
2	650000	20	1
3	1200000	30	1
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, last_name, first_name, patronymic, number, num_pas, ser_pas, address_pas, address_propiski, email) FROM stdin;
1	Иванов	Иван	Иванович	8-918-455-67-89	595687	7867	г. Белгород, ул. Маусов, 11	г. Ростов, ул. Пушкина, д.20	qwerty@gmail.com
2	Шишкин	Александр	Антонович	8-665-465-46-54	625894	5444	г. Ростов, ул. Ворошиловская, д 11	г. Ростов, ул. Ленина, д.22, кв.71	king@yandex.ru
3	Ким	Алексей	Павлович	8-354-534-53-4	362695	8121	г. Ростов, ул. Ворошиловская, д 11	г. Ростов, ул. Мечникова, д. 228, кв 26	NULL
4	АПИапиа	апи	апи	98989898	5454	454545	лорлол	лорло	kjh@mail.ru
\.


--
-- Data for Name: datauser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.datauser (id, login, pass) FROM stdin;
1	1	1
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (id, last_name, first_name, patronymic, num_pas, ser_pas, address_pas, address_propiski, post, email, salon_id) FROM stdin;
1	Кондратенко	Игорь	Семёнович	653434	7119	г. Ростов, пр. Ворошиловский, д 11	г. Ростов, ул. Нансена, д. 5	Уборщик	kondrat@mail.com	1
2	Токарева	Екатерина	Сергеевна	455461	5483	г. Ростов, пр. Ворошиловский, д 11	г. Ростов, ул. Нагибина, д. 30, кв. 4е	Консультант по кредитованию и страхованию	aarty1190@yandex.ru	1
3	Козакевич	Татьяна	Сергеевна	947812	3258	г. Ростов, пр. Ворошиловский, д 11	г. Ростов, ул. Малюгиной, 119	Администратор	Kelenin@gmail.com	1
\.


--
-- Data for Name: harackter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.harackter (id, znach_harackter, avto) FROM stdin;
1	BMW	1
2	X6	1
3	АКПП	1
4	407	1
5	Чёрный	1
6	2130	1
7	4,5	1
8	80	1
9	7-11	1
10	2011	1
1	Honda	2
2	City	2
3	МКПП	2
4	130	2
5	Серый	2
6	1250	2
7	10,9	2
8	56	2
9	4,5	2
10	2010	2
1	Audi	3
2	A7	3
3	АКПП	3
4	324	3
5	Серый	3
6	1560	3
7	4	3
8	72	3
9	8,8	3
10	2010	3
\.


--
-- Data for Name: salon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salon (id, address, numder, name_salon, email) FROM stdin;
1	г. Ростов, ул. Пушкинская, 127	7385790	Kamaz	kamaz@mail.ru
\.


--
-- Data for Name: tip_harackter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tip_harackter (id, name_harackter, ed_izmer) FROM stdin;
1	Марка	\N
2	Модель	\N
3	КПП	\N
4	Мощьность	л.с.
5	Цвет	\N
6	Вес	кг.
7	Разгон до 100кмч.	с.
8	Объём бака	л.
9	Расход топлива	л.
10	Год выпуска	\N
\.


--
-- Data for Name: trigger_tab; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trigger_tab (name, vendor_id, date) FROM stdin;
\.


--
-- Data for Name: zakazy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zakazy (id, avto_id, client_id, data_start, data_end) FROM stdin;
2	2	3	2019-10-03	2019-10-04
3	3	1	2019-10-11	2019-10-11
1	1	2	2019-10-19	2024-05-01
\.


--
-- Data for Name: zarplata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zarplata (id, oklad, data) FROM stdin;
1	45000	2019-01-11
2	15000	2019-02-11
3	40000	2019-02-11
\.


--
-- Name: avto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.avto_id_seq', 3, true);


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 4, true);


--
-- Name: datauser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.datauser_id_seq', 1, true);


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_id_seq', 3, true);


--
-- Name: salon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salon_id_seq', 1, true);


--
-- Name: tip_harackter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tip_harackter_id_seq', 10, true);


--
-- Name: zakazy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zakazy_id_seq', 3, true);


--
-- Name: avto avto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avto
    ADD CONSTRAINT avto_pkey PRIMARY KEY (id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: datauser datauser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datauser
    ADD CONSTRAINT datauser_pkey PRIMARY KEY (id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: salon salon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salon
    ADD CONSTRAINT salon_pkey PRIMARY KEY (id);


--
-- Name: tip_harackter tip_harackter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tip_harackter
    ADD CONSTRAINT tip_harackter_pkey PRIMARY KEY (id);


--
-- Name: zakazy zakazy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zakazy
    ADD CONSTRAINT zakazy_pkey PRIMARY KEY (id);


--
-- Name: zarplata zarplata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zarplata
    ADD CONSTRAINT zarplata_pkey PRIMARY KEY (id);


--
-- Name: zakazy after_insert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER after_insert AFTER INSERT ON public.zakazy FOR EACH ROW EXECUTE FUNCTION public.after_inset();


--
-- Name: harackter avto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.harackter
    ADD CONSTRAINT avto_fk FOREIGN KEY (avto) REFERENCES public.avto(id);


--
-- Name: zakazy avto_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zakazy
    ADD CONSTRAINT avto_id_fk FOREIGN KEY (avto_id) REFERENCES public.avto(id);


--
-- Name: zakazy client_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zakazy
    ADD CONSTRAINT client_id_fk FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: avto id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avto
    ADD CONSTRAINT id_fk FOREIGN KEY (salon_id) REFERENCES public.salon(id);


--
-- Name: harackter id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.harackter
    ADD CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES public.tip_harackter(id);


--
-- Name: employee salon_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT salon_id_fk FOREIGN KEY (salon_id) REFERENCES public.salon(id);


--
-- Name: zarplata zarplata_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zarplata
    ADD CONSTRAINT zarplata_id_fk FOREIGN KEY (id) REFERENCES public.employee(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "gaz" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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

--
-- Name: gaz; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE gaz WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE gaz OWNER TO postgres;

\connect gaz

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO gaz;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: gaz
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO gaz;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: gaz
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO gaz;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: gaz
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cart; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public.cart (
    id bigint NOT NULL,
    quantity smallint NOT NULL,
    session_key character varying(32),
    created_timestamp timestamp with time zone NOT NULL,
    product_id bigint NOT NULL,
    user_id bigint,
    CONSTRAINT cart_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.cart OWNER TO gaz;

--
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: gaz
--

ALTER TABLE public.cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: category; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public.category (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    slug character varying(200)
);


ALTER TABLE public.category OWNER TO gaz;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: gaz
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO gaz;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: gaz
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO gaz;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: gaz
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO gaz;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: gaz
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO gaz;

--
-- Name: order; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public."order" (
    id bigint NOT NULL,
    created_timestamp timestamp with time zone NOT NULL,
    phone_number character varying(20) NOT NULL,
    requires_delivery boolean NOT NULL,
    delivery_address text,
    payment_on_get boolean NOT NULL,
    is_paid boolean NOT NULL,
    status character varying(50) NOT NULL,
    user_id bigint
);


ALTER TABLE public."order" OWNER TO gaz;

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: gaz
--

ALTER TABLE public."order" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: order_item; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public.order_item (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    price numeric(7,2) NOT NULL,
    quantity integer NOT NULL,
    created_timestamp timestamp with time zone NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint,
    CONSTRAINT order_item_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.order_item OWNER TO gaz;

--
-- Name: order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: gaz
--

ALTER TABLE public.order_item ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public.product (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    slug character varying(200),
    description text,
    image character varying(100),
    price numeric(7,2) NOT NULL,
    discount numeric(4,2) NOT NULL,
    quantity integer NOT NULL,
    category_id bigint NOT NULL,
    CONSTRAINT product_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.product OWNER TO gaz;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: gaz
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public."user" (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    image character varying(100),
    phone_number character varying(10)
);


ALTER TABLE public."user" OWNER TO gaz;

--
-- Name: user_groups; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public.user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.user_groups OWNER TO gaz;

--
-- Name: user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: gaz
--

ALTER TABLE public.user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: gaz
--

ALTER TABLE public."user" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_user_permissions; Type: TABLE; Schema: public; Owner: gaz
--

CREATE TABLE public.user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.user_user_permissions OWNER TO gaz;

--
-- Name: user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: gaz
--

ALTER TABLE public.user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Категорию	6	add_categories
22	Can change Категорию	6	change_categories
23	Can delete Категорию	6	delete_categories
24	Can view Категорию	6	view_categories
25	Can add Продукт	7	add_products
26	Can change Продукт	7	change_products
27	Can delete Продукт	7	delete_products
28	Can view Продукт	7	view_products
29	Can add Пользователя	8	add_user
30	Can change Пользователя	8	change_user
31	Can delete Пользователя	8	delete_user
32	Can view Пользователя	8	view_user
33	Can add Корзина	9	add_cart
34	Can change Корзина	9	change_cart
35	Can delete Корзина	9	delete_cart
36	Can view Корзина	9	view_cart
37	Can add Заказ	10	add_order
38	Can change Заказ	10	change_order
39	Can delete Заказ	10	delete_order
40	Can view Заказ	10	view_order
41	Can add Проданный товар	11	add_orderitem
42	Can change Проданный товар	11	change_orderitem
43	Can delete Проданный товар	11	delete_orderitem
44	Can view Проданный товар	11	view_orderitem
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public.cart (id, quantity, session_key, created_timestamp, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public.category (id, name, slug) FROM stdin;
6	Все товары	all
13	Колонки газовые (ВПГ)	kolonki-gazovye-vpg
14	Водонагреватели проточные газовые	vodonagrevateli-protochnye-gazovye
15	Конвекторы газовые	konvektory-gazovye
16	Котлы, АОГВ	kotly-aogv
17	Обогреватели инфракрасные газовые	obogrevateli-infrakrasnye-gazovye
19	Устройства газогорелочные печные	ustrojstva-gazogorelochnye-pechnye
20	Плиты газо-электрические	plity-gazo-elektricheskie
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-05-23 19:14:32.807624+00	7	Кухня	3		6	1
2	2024-05-23 19:15:16.134346+00	13	Колонки газовые (ВПГ)	1	[{"added": {}}]	6	1
3	2024-05-23 19:16:00.074364+00	14	Водонагреватели проточные газовые	1	[{"added": {}}]	6	1
4	2024-05-23 19:16:25.194905+00	15	Конвекторы газовые	1	[{"added": {}}]	6	1
5	2024-05-23 19:16:42.615281+00	16	Котлы, АОГВ	1	[{"added": {}}]	6	1
6	2024-05-23 19:17:04.259567+00	17	Обогреватели инфракрасные газовые	1	[{"added": {}}]	6	1
7	2024-05-23 19:17:13.061038+00	18	Пушки тепловые газовые	1	[{"added": {}}]	6	1
8	2024-05-23 19:17:34.949884+00	19	Устройства газогорелочные печные	1	[{"added": {}}]	6	1
9	2024-05-23 19:17:48.645426+00	20	Плиты газо-электрические	1	[{"added": {}}]	6	1
10	2024-05-23 19:17:56.825422+00	21	Плиты газовые	1	[{"added": {}}]	6	1
11	2024-05-23 19:18:21.540135+00	22	Плиты - запчасти	1	[{"added": {}}]	6	1
12	2024-05-23 19:18:39.232794+00	23	Комплектующие счётчиков газа	1	[{"added": {}}]	6	1
13	2024-05-23 19:19:15.966343+00	24	Счётчики газа мембранные	1	[{"added": {}}]	6	1
14	2024-05-23 19:20:01.580323+00	24	Счётчики газа мембранные	3		6	1
15	2024-05-23 19:20:07.551958+00	25	Счётчики газа мембранные (мех)	1	[{"added": {}}]	6	1
16	2024-05-23 19:20:49.014543+00	26	Счётчики газа мембранные (электро)	1	[{"added": {}}]	6	1
17	2024-05-23 19:21:37.505993+00	27	Счётчики газа струйные (электро)	1	[{"added": {}}]	6	1
18	2024-05-23 19:30:42.614293+00	13	"Ладогаз" ВПГ-10Е Количество - 7	1	[{"added": {}}]	7	1
19	2024-05-23 19:31:32.124332+00	12	Декор	3		6	1
20	2024-05-23 19:31:32.128781+00	11	Фурнитура	3		6	1
21	2024-05-23 19:31:32.132007+00	10	Офис	3		6	1
22	2024-05-23 19:31:32.135007+00	9	Гостинная	3		6	1
23	2024-05-23 19:31:32.139028+00	8	Спальня	3		6	1
24	2024-05-23 19:38:08.158418+00	14	"Ладогаз" ВПГ-11PL-01 Количество - 10	1	[{"added": {}}]	7	1
25	2024-05-23 19:41:29.166921+00	15	"Bosch" 13L Количество - 10	1	[{"added": {}}]	7	1
26	2024-05-23 19:42:52.676775+00	16	"Electrolux" 285 RN Количество - 5	1	[{"added": {}}]	7	1
27	2024-05-23 19:51:04.936081+00	17	Данко-Бриз-2С Количество - 15	1	[{"added": {}}]	7	1
28	2024-05-23 19:52:26.646573+00	18	EUROSIT 630 Количество - 3	1	[{"added": {}}]	7	1
29	2024-05-23 19:53:19.157825+00	19	АРБАТ [САБК-Т], L-1000 Количество - 5	1	[{"added": {}}]	7	1
30	2024-05-23 19:55:09.589311+00	20	L-265 Количество - 20	1	[{"added": {}}]	7	1
31	2024-05-23 19:57:05.351776+00	21	Запальник 144 Количество - 4	1	[{"added": {}}]	7	1
32	2024-05-23 19:59:04.64429+00	22	ГИИ-3.65 Количество - 5	1	[{"added": {}}]	7	1
33	2024-05-23 20:00:25.88668+00	23	Прометей - 2.3кВт Количество - 3	1	[{"added": {}}]	7	1
34	2024-05-23 20:01:39.570547+00	18	Пушки тепловые газовые	3		6	1
35	2024-05-23 20:04:24.146784+00	24	УГОП-16 Количество - 6	1	[{"added": {}}]	7	1
36	2024-05-23 20:07:15.075129+00	25	УГОП 16 с датчиком Количество - 5	1	[{"added": {}}]	7	1
37	2024-05-23 20:08:04.190578+00	24	УГОП-16 Количество - 6	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	7	1
38	2024-05-23 20:16:37.997395+00	26	Плита-чемодан Количество - 6	1	[{"added": {}}]	7	1
39	2024-05-23 20:18:04.10003+00	27	Счётчики газа струйные (электро)	3		6	1
40	2024-05-23 20:18:04.104328+00	26	Счётчики газа мембранные (электро)	3		6	1
41	2024-05-23 20:18:04.106302+00	25	Счётчики газа мембранные (мех)	3		6	1
42	2024-05-23 20:18:04.109306+00	23	Комплектующие счётчиков газа	3		6	1
43	2024-05-23 20:18:04.112303+00	22	Плиты - запчасти	3		6	1
44	2024-05-23 20:18:22.388047+00	21	Плиты газовые	3		6	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	goods	categories
7	goods	products
8	users	user
9	carts	cart
10	orders	order
11	orders	orderitem
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-05-23 18:49:39.610048+00
2	contenttypes	0002_remove_content_type_name	2024-05-23 18:49:39.622047+00
3	auth	0001_initial	2024-05-23 18:49:39.683373+00
4	auth	0002_alter_permission_name_max_length	2024-05-23 18:49:39.691789+00
5	auth	0003_alter_user_email_max_length	2024-05-23 18:49:39.700539+00
6	auth	0004_alter_user_username_opts	2024-05-23 18:49:39.709417+00
7	auth	0005_alter_user_last_login_null	2024-05-23 18:49:39.71942+00
8	auth	0006_require_contenttypes_0002	2024-05-23 18:49:39.726463+00
9	auth	0007_alter_validators_add_error_messages	2024-05-23 18:49:39.735475+00
10	auth	0008_alter_user_username_max_length	2024-05-23 18:49:39.743476+00
11	auth	0009_alter_user_last_name_max_length	2024-05-23 18:49:39.752015+00
12	auth	0010_alter_group_name_max_length	2024-05-23 18:49:39.762253+00
13	auth	0011_update_proxy_permissions	2024-05-23 18:49:39.769773+00
14	auth	0012_alter_user_first_name_max_length	2024-05-23 18:49:39.780771+00
15	users	0001_initial	2024-05-23 18:49:39.856863+00
16	admin	0001_initial	2024-05-23 18:49:39.888667+00
17	admin	0002_logentry_remove_auto_add	2024-05-23 18:49:39.897671+00
18	admin	0003_logentry_add_action_flag_choices	2024-05-23 18:49:39.909671+00
19	goods	0001_initial	2024-05-23 18:49:39.969209+00
20	carts	0001_initial	2024-05-23 18:49:39.990184+00
21	carts	0002_initial	2024-05-23 18:49:40.011184+00
22	orders	0001_initial	2024-05-23 18:49:40.052332+00
23	orders	0002_initial	2024-05-23 18:49:40.077334+00
24	sessions	0001_initial	2024-05-23 18:49:40.10136+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
cxs4rdr4nyta1umoham4chk8bic21v90	.eJxVjMsOwiAQRf-FtSHQ4dFx6d5vIDADUjU0Ke3K-O_apAvd3nPOfYkQt7WGreclTCzOQovT75YiPXLbAd9ju82S5rYuU5K7Ig_a5XXm_Lwc7t9Bjb1-a2CnQWFhZ1XkCIoTaU8ZEyiXCQnQJ-tIazu60RbyYAYDzAMjmpLE-wPj6DfX:1sADrm:j96mh9_bWhlMLKLGpZzoZHYF41pXyuS8k_CiuHmaO_k	2024-06-06 19:12:42.031433+00
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public."order" (id, created_timestamp, phone_number, requires_delivery, delivery_address, payment_on_get, is_paid, status, user_id) FROM stdin;
\.


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public.order_item (id, name, price, quantity, created_timestamp, order_id, product_id) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public.product (id, name, slug, description, image, price, discount, quantity, category_id) FROM stdin;
13	"Ладогаз" ВПГ-10Е	ladogaz-vpg-10e	ВПГ (колонка) "Ладогаз" ВПГ-10Е, NEW, белый, н.т.м.-15.85кВт, ^20*C-10L, 8.6кг (г.Тула)	goods_images/ВПГ_Ладогаз_-10e.jpg	10500.00	5.00	7	13
14	"Ладогаз" ВПГ-11PL-01	ladogaz-vpg-11pl-01	ВПГ (колонка) "Ладогаз" ВПГ-11PL-01, ,белый, н.т.м.-15.85кВт, ^20*C-10L, 8.6кг (г.Тула)	goods_images/ВПГ_Ладогаз_-11_PL.png	12400.00	0.00	10	13
15	"Bosch" 13L	bosch-13l	Теплообменник ВПГ "Bosch" 13L	goods_images/Теплообменник_Bosh_13_кВт.JPG	9600.00	15.00	10	14
16	"Electrolux" 285 RN	electrolux-285-rn	Теплообменник ВПГ "Electrolux-285 RN"	goods_images/Теплообменник_Electrolux__285_JPG.JPG	6150.00	0.00	5	14
17	Данко-Бриз-2С	danko-briz-2s	Конвектор "Данко-Бриз-2С" т.медь, сетевой газ	goods_images/Трубка_запальника_Данко.jpg	8300.00	0.00	15	15
18	EUROSIT 630	eurosit-630	Автоматика EUROSIT 630 (0.630.093), для конвекторов	goods_images/Автоматика_EUROSIT.jpg	4000.00	0.00	3	16
19	АРБАТ [САБК-Т], L-1000	arbat-sabk-t-l-1000	Автоматика АРБАТ [САБК-Т], L-1000мм, с гайкой Тр1/2" вн. со встроенным редуктором	goods_images/Автоматика_Арбат.png	8000.00	0.00	5	16
20	L-265	l-265	Термопара L-265, АРБАТ и КГЭ	goods_images/Термопара_Арбат_L-265.jpg	200.00	0.00	20	16
21	Запальник 144	zapalnik-144	Запальник [пилотная горелка] (1443-200) длинная ГАЛАНТ	goods_images/Запальник_пилотная_горелка_114jpeg.jpeg	500.00	0.00	4	16
22	ГИИ-3.65	gii-365	Горелка инфракрасная газовая ГИИ-3.65 кВт "Солярогаз"	goods_images/Горелка_инфокрасная_3.6_кВт13hq.jpeg	1540.00	0.00	5	17
23	Прометей - 2.3кВт	prometej-23kvt	Горелка инфракрасная газовая "Прометей" - 2.3кВт "Умница"	goods_images/Инфокрасная_горелка.jpg	1650.00	0.00	3	17
25	УГОП 16 с датчиком	ugop-16-2	УГ печное УГОП-16 (ТМЗ) с датчиком тяги	goods_images/6485747638_kbBhf3X.jpg	1950.00	30.00	5	19
24	УГОП-16	ugop-16	УГ печное УГОП-16 (ИГН), п. справа	goods_images/6822686995_WP0wY2L.jpg	2100.00	0.00	6	19
26	Плита-чемодан	plita-chemodan	В натуре чемодан	goods_images/Плита_в_чемодане.jpeg	2000.00	0.00	6	20
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public."user" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, image, phone_number) FROM stdin;
2	pbkdf2_sha256$600000$PaAYkWQwgQ6OT6CQvykxHT$TuYH9IBijwb61clVIHi+Jwn1QCbYQ1eK2YvrnY0XaoY=	2024-05-23 19:09:20.178811+00	f	olega	Олег	Коваль	olega@mail.ru	f	t	2024-05-23 19:09:19.600557+00	users_images/pngwing.com_1.png	\N
1	pbkdf2_sha256$600000$tJm0LY0E5AxcPjZxjunSKQ$8bAFHX2/JEQbP7pIqR/panW/ncSB0sQTclcT9CGGO8U=	2024-05-23 19:12:41.990217+00	t	root				t	t	2024-05-23 18:50:34.765233+00		\N
\.


--
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public.user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: user_user_permissions; Type: TABLE DATA; Schema: public; Owner: gaz
--

COPY public.user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gaz
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gaz
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gaz
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gaz
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, false);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gaz
--

SELECT pg_catalog.setval('public.category_id_seq', 27, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gaz
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 44, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gaz
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gaz
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gaz
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- Name: order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gaz
--

SELECT pg_catalog.setval('public.order_item_id_seq', 1, false);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gaz
--

SELECT pg_catalog.setval('public.product_id_seq', 26, true);


--
-- Name: user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gaz
--

SELECT pg_catalog.setval('public.user_groups_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gaz
--

SELECT pg_catalog.setval('public.user_id_seq', 2, true);


--
-- Name: user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gaz
--

SELECT pg_catalog.setval('public.user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: category category_name_key; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: category category_slug_key; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_slug_key UNIQUE (slug);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: product product_name_key; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_name_key UNIQUE (name);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: product product_slug_key; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_slug_key UNIQUE (slug);


--
-- Name: user_groups user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_groups user_groups_user_id_group_id_40beef00_uniq; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_user_id_group_id_40beef00_uniq UNIQUE (user_id, group_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_user_permissions user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_user_permissions user_user_permissions_user_id_permission_id_7dc6e2e0_uniq; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_user_id_permission_id_7dc6e2e0_uniq UNIQUE (user_id, permission_id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: cart_product_id_508e72da; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX cart_product_id_508e72da ON public.cart USING btree (product_id);


--
-- Name: cart_user_id_1361a739; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX cart_user_id_1361a739 ON public.cart USING btree (user_id);


--
-- Name: category_name_15cb1e98_like; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX category_name_15cb1e98_like ON public.category USING btree (name varchar_pattern_ops);


--
-- Name: category_slug_fd4fc841_like; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX category_slug_fd4fc841_like ON public.category USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: order_item_order_id_0ca9e92e; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX order_item_order_id_0ca9e92e ON public.order_item USING btree (order_id);


--
-- Name: order_item_product_id_62a1cc4c; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX order_item_product_id_62a1cc4c ON public.order_item USING btree (product_id);


--
-- Name: order_user_id_e323497c; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX order_user_id_e323497c ON public."order" USING btree (user_id);


--
-- Name: product_category_id_640030a0; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX product_category_id_640030a0 ON public.product USING btree (category_id);


--
-- Name: product_name_af48c283_like; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX product_name_af48c283_like ON public.product USING btree (name varchar_pattern_ops);


--
-- Name: product_slug_c4732ed0_like; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX product_slug_c4732ed0_like ON public.product USING btree (slug varchar_pattern_ops);


--
-- Name: user_groups_group_id_b76f8aba; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX user_groups_group_id_b76f8aba ON public.user_groups USING btree (group_id);


--
-- Name: user_groups_user_id_abaea130; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX user_groups_user_id_abaea130 ON public.user_groups USING btree (user_id);


--
-- Name: user_user_permissions_permission_id_9deb68a3; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX user_user_permissions_permission_id_9deb68a3 ON public.user_user_permissions USING btree (permission_id);


--
-- Name: user_user_permissions_user_id_ed4a47ea; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX user_user_permissions_user_id_ed4a47ea ON public.user_user_permissions USING btree (user_id);


--
-- Name: user_username_cf016618_like; Type: INDEX; Schema: public; Owner: gaz
--

CREATE INDEX user_username_cf016618_like ON public."user" USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart cart_product_id_508e72da_fk_product_id; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_product_id_508e72da_fk_product_id FOREIGN KEY (product_id) REFERENCES public.product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart cart_user_id_1361a739_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_1361a739_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_item order_item_order_id_0ca9e92e_fk_order_id; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_order_id_0ca9e92e_fk_order_id FOREIGN KEY (order_id) REFERENCES public."order"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_item order_item_product_id_62a1cc4c_fk_product_id; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_product_id_62a1cc4c_fk_product_id FOREIGN KEY (product_id) REFERENCES public.product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order order_user_id_e323497c_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_e323497c_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product product_category_id_640030a0_fk_category_id; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_640030a0_fk_category_id FOREIGN KEY (category_id) REFERENCES public.category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_groups user_groups_group_id_b76f8aba_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_group_id_b76f8aba_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_groups user_groups_user_id_abaea130_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_user_id_abaea130_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_permissions user_user_permission_permission_id_9deb68a3_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permission_permission_id_9deb68a3_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_permissions user_user_permissions_user_id_ed4a47ea_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gaz
--

ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_user_id_ed4a47ea_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

