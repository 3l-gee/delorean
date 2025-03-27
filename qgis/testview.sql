--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7
-- Dumped by pg_dump version 16.3

-- Started on 2025-03-27 22:26:56

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
-- TOC entry 2 (class 3079 OID 2927940)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 4279 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- TOC entry 991 (class 1255 OID 2929058)
-- Name: feature_view_insert_trigger(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.feature_view_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    new_feature_a_id BIGINT;
    new_feature_b_id BIGINT;
BEGIN
    -- Insert into feature_a and get its auto-incremented id
    INSERT INTO feature_a (name) 
    VALUES (NEW.name) 
    RETURNING id INTO new_feature_a_id;

    -- Insert into feature_b and get its auto-incremented id
    INSERT INTO feature_b (age) 
    VALUES (NEW.age) 
    RETURNING id INTO new_feature_b_id;

    -- Insert into the junction table to link feature_a and feature_b
    INSERT INTO feature_a_feature_b (feature_a_id, feature_b_id) 
    VALUES (new_feature_a_id, new_feature_b_id);

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.feature_view_insert_trigger() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 2929023)
-- Name: feature_a; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feature_a (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.feature_a OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 2929033)
-- Name: feature_a_feature_b; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feature_a_feature_b (
    feature_a_id bigint NOT NULL,
    feature_b_id bigint NOT NULL
);


ALTER TABLE public.feature_a_feature_b OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 2929053)
-- Name: feature_a_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feature_a_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feature_a_id_seq OWNER TO postgres;

--
-- TOC entry 4280 (class 0 OID 0)
-- Dependencies: 224
-- Name: feature_a_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feature_a_id_seq OWNED BY public.feature_a.id;


--
-- TOC entry 221 (class 1259 OID 2929028)
-- Name: feature_b; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feature_b (
    id bigint NOT NULL,
    age bigint
);


ALTER TABLE public.feature_b OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 2929055)
-- Name: feature_b_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feature_b_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feature_b_id_seq OWNER TO postgres;

--
-- TOC entry 4281 (class 0 OID 0)
-- Dependencies: 225
-- Name: feature_b_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feature_b_id_seq OWNED BY public.feature_b.id;


--
-- TOC entry 223 (class 1259 OID 2929045)
-- Name: feature_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.feature_view AS
 SELECT feature_a.name,
    feature_b.age
   FROM ((public.feature_a
     JOIN public.feature_a_feature_b ON ((feature_a.id = feature_a_feature_b.feature_a_id)))
     JOIN public.feature_b ON ((feature_a_feature_b.feature_b_id = feature_b.id)));


ALTER VIEW public.feature_view OWNER TO postgres;

--
-- TOC entry 4111 (class 2604 OID 2929054)
-- Name: feature_a id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_a ALTER COLUMN id SET DEFAULT nextval('public.feature_a_id_seq'::regclass);


--
-- TOC entry 4112 (class 2604 OID 2929056)
-- Name: feature_b id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_b ALTER COLUMN id SET DEFAULT nextval('public.feature_b_id_seq'::regclass);


--
-- TOC entry 4269 (class 0 OID 2929023)
-- Dependencies: 220
-- Data for Name: feature_a; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature_a (id, name) FROM stdin;
3	steve
4	Bob
\.


--
-- TOC entry 4271 (class 0 OID 2929033)
-- Dependencies: 222
-- Data for Name: feature_a_feature_b; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature_a_feature_b (feature_a_id, feature_b_id) FROM stdin;
3	2
4	3
\.


--
-- TOC entry 4270 (class 0 OID 2929028)
-- Dependencies: 221
-- Data for Name: feature_b; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature_b (id, age) FROM stdin;
2	10
3	21
\.


--
-- TOC entry 4110 (class 0 OID 2928258)
-- Dependencies: 216
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 4282 (class 0 OID 0)
-- Dependencies: 224
-- Name: feature_a_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feature_a_id_seq', 4, true);


--
-- TOC entry 4283 (class 0 OID 0)
-- Dependencies: 225
-- Name: feature_b_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feature_b_id_seq', 3, true);


--
-- TOC entry 4117 (class 2606 OID 2929027)
-- Name: feature_a feature_a_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_a
    ADD CONSTRAINT feature_a_pkey PRIMARY KEY (id);


--
-- TOC entry 4119 (class 2606 OID 2929032)
-- Name: feature_b feature_b_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_b
    ADD CONSTRAINT feature_b_pkey PRIMARY KEY (id);


--
-- TOC entry 4120 (class 2620 OID 2929059)
-- Name: feature_view feature_view_insert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER feature_view_insert INSTEAD OF INSERT ON public.feature_view FOR EACH ROW EXECUTE FUNCTION public.feature_view_insert_trigger();


-- Completed on 2025-03-27 22:26:57

--
-- PostgreSQL database dump complete
--

