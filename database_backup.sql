--
-- PostgreSQL database dump
--

-- Dumped from database version 10.2
-- Dumped by pg_dump version 10.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: doctors; Type: TABLE; Schema: public; Owner: maggie
--

CREATE TABLE doctors (
    id integer NOT NULL,
    name character varying,
    speciality character varying
);


ALTER TABLE doctors OWNER TO maggie;

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: maggie
--

CREATE SEQUENCE doctors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE doctors_id_seq OWNER TO maggie;

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maggie
--

ALTER SEQUENCE doctors_id_seq OWNED BY doctors.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: maggie
--

CREATE TABLE patients (
    id integer NOT NULL,
    name character varying,
    birthdate character varying,
    doctor_id integer
);


ALTER TABLE patients OWNER TO maggie;

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: maggie
--

CREATE SEQUENCE patients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patients_id_seq OWNER TO maggie;

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maggie
--

ALTER SEQUENCE patients_id_seq OWNED BY patients.id;


--
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: maggie
--

ALTER TABLE ONLY doctors ALTER COLUMN id SET DEFAULT nextval('doctors_id_seq'::regclass);


--
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: maggie
--

ALTER TABLE ONLY patients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: maggie
--

COPY doctors (id, name, speciality) FROM stdin;
157	Hoyt	General Practice
158	Nugget	Vet 
159	Maggie	Surgeon 
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: maggie
--

COPY patients (id, name, birthdate, doctor_id) FROM stdin;
71	Scout	1988-02-14	158
72	nugget	2017-03-02	157
73	nugget	2017-03-02	157
74	maggie		157
75	maggie		157
76	maggie		157
77	maggie		157
78	maggie		157
79	nugget 		157
80	nugget		157
81	nugget		159
82	nugget		159
83	nug		157
84	nug		157
85	nug		157
86	nug		157
87	Faye		158
88	Faye		158
89	Hello		158
90	maggie		158
91	maggie		158
\.


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maggie
--

SELECT pg_catalog.setval('doctors_id_seq', 159, true);


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maggie
--

SELECT pg_catalog.setval('patients_id_seq', 91, true);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: maggie
--

ALTER TABLE ONLY doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: maggie
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

