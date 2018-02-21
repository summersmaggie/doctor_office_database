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
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: maggie
--

ALTER TABLE ONLY patients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: maggie
--

COPY patients (id, name, birthdate, doctor_id) FROM stdin;
\.


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maggie
--

SELECT pg_catalog.setval('patients_id_seq', 1, false);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: maggie
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

