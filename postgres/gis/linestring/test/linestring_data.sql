--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7
-- Dumped by pg_dump version 16.3

-- Started on 2024-12-26 11:45:59

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
-- TOC entry 4262 (class 0 OID 391420)
-- Dependencies: 221
-- Data for Name: linestring; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.linestring VALUES (1, '0102000020E61000000200000075029A081B9A5DC0F085C954C1F840406DC5FEB27B720440454772F90F814840', 'linestring');
INSERT INTO public.linestring VALUES (2, '0102000020E61000000200000075029A081B9A5DC0F085C954C1F840406DC5FEB27B720440454772F90F814840', 'geodesic');


--
-- TOC entry 4104 (class 0 OID 383539)
-- Dependencies: 216
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4271 (class 0 OID 0)
-- Dependencies: 220
-- Name: linestring_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.linestring_id_seq', 2, true);


-- Completed on 2024-12-26 11:45:59

--
-- PostgreSQL database dump complete
--

