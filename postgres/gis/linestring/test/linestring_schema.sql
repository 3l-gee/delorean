--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7
-- Dumped by pg_dump version 16.3

-- Started on 2024-12-26 11:47:16

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4261 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 391420)
-- Name: linestring; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.linestring (
    id integer NOT NULL,
    geom public.geometry(LineString,4326),
    type character varying(200),
    CONSTRAINT linestring_type_check CHECK (((type)::text = ANY ((ARRAY['linestring'::character varying, 'geodesic'::character varying])::text[])))
);


ALTER TABLE public.linestring OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 391419)
-- Name: linestring_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.linestring_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.linestring_id_seq OWNER TO postgres;

--
-- TOC entry 4262 (class 0 OID 0)
-- Dependencies: 220
-- Name: linestring_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.linestring_id_seq OWNED BY public.linestring.id;


--
-- TOC entry 222 (class 1259 OID 391459)
-- Name: rep_linestrings; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.rep_linestrings AS
 SELECT (row_number() OVER ())::integer AS id,
    public.st_union(combined_geometries.geom) AS merged_geometry
   FROM ( SELECT (public.st_segmentize((linestring.geom)::public.geography, (1000)::double precision))::public.geometry AS geom
           FROM public.linestring
          WHERE ((linestring.type)::text = 'geodesic'::text)
        UNION ALL
         SELECT linestring.geom
           FROM public.linestring
          WHERE ((linestring.type)::text = 'linestring'::text)) combined_geometries;


ALTER VIEW public.rep_linestrings OWNER TO postgres;

--
-- TOC entry 4101 (class 2604 OID 391423)
-- Name: linestring id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.linestring ALTER COLUMN id SET DEFAULT nextval('public.linestring_id_seq'::regclass);


--
-- TOC entry 4107 (class 2606 OID 391428)
-- Name: linestring linestring_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.linestring
    ADD CONSTRAINT linestring_pkey PRIMARY KEY (id);


-- Completed on 2024-12-26 11:47:17

--
-- PostgreSQL database dump complete
--

