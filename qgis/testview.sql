--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7
-- Dumped by pg_dump version 16.3

-- Started on 2025-03-28 19:03:20

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
-- TOC entry 4293 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- TOC entry 993 (class 1255 OID 2929058)
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

--
-- TOC entry 994 (class 1255 OID 2977859)
-- Name: feature_view_update_trigger(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.feature_view_update_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	-- Update feature_a
	UPDATE feature_a
	SET name = NEW.name
	WHERE id = NEW.a_id;

	-- Update feature_b
	UPDATE feature_b
	SET age = NEW.age
	WHERE id = NEW.a_id;

	RETURN NEW;
END;
$$;


ALTER FUNCTION public.feature_view_update_trigger() OWNER TO postgres;

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
-- TOC entry 4294 (class 0 OID 0)
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
-- TOC entry 4295 (class 0 OID 0)
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
    feature_b.age,
    feature_a.id AS a_id,
    feature_b.id AS b_id
   FROM ((public.feature_a
     JOIN public.feature_a_feature_b ON ((feature_a.id = feature_a_feature_b.feature_a_id)))
     JOIN public.feature_b ON ((feature_a_feature_b.feature_b_id = feature_b.id)));


ALTER VIEW public.feature_view OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 2977862)
-- Name: layer_styles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.layer_styles (
    id integer NOT NULL,
    f_table_catalog character varying,
    f_table_schema character varying,
    f_table_name character varying,
    f_geometry_column character varying,
    stylename text,
    styleqml xml,
    stylesld xml,
    useasdefault boolean,
    description text,
    owner character varying(63) DEFAULT CURRENT_USER,
    ui xml,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    type character varying
);


ALTER TABLE public.layer_styles OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 2977861)
-- Name: layer_styles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.layer_styles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.layer_styles_id_seq OWNER TO postgres;

--
-- TOC entry 4296 (class 0 OID 0)
-- Dependencies: 226
-- Name: layer_styles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.layer_styles_id_seq OWNED BY public.layer_styles.id;


--
-- TOC entry 4117 (class 2604 OID 2929054)
-- Name: feature_a id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_a ALTER COLUMN id SET DEFAULT nextval('public.feature_a_id_seq'::regclass);


--
-- TOC entry 4118 (class 2604 OID 2929056)
-- Name: feature_b id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_b ALTER COLUMN id SET DEFAULT nextval('public.feature_b_id_seq'::regclass);


--
-- TOC entry 4119 (class 2604 OID 2977865)
-- Name: layer_styles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.layer_styles ALTER COLUMN id SET DEFAULT nextval('public.layer_styles_id_seq'::regclass);


--
-- TOC entry 4281 (class 0 OID 2929023)
-- Dependencies: 220
-- Data for Name: feature_a; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature_a (id, name) FROM stdin;
3	steve
4	Bob
5	ArthurEEEEE
\.


--
-- TOC entry 4283 (class 0 OID 2929033)
-- Dependencies: 222
-- Data for Name: feature_a_feature_b; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature_a_feature_b (feature_a_id, feature_b_id) FROM stdin;
3	2
4	3
5	4
\.


--
-- TOC entry 4282 (class 0 OID 2929028)
-- Dependencies: 221
-- Data for Name: feature_b; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature_b (id, age) FROM stdin;
2	10
3	21
4	99
\.


--
-- TOC entry 4287 (class 0 OID 2977862)
-- Dependencies: 227
-- Data for Name: layer_styles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.layer_styles (id, f_table_catalog, f_table_schema, f_table_name, f_geometry_column, stylename, styleqml, stylesld, useasdefault, description, owner, ui, update_time, type) FROM stdin;
1	testview	public	feature_view	\N	def_feature_view	<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>\n<qgis version="3.34.8-Prizren" styleCategories="Forms">\n <fieldConfiguration>\n  <field name="name">\n   <editWidget type="TextEdit">\n    <config>\n     <Option/>\n    </config>\n   </editWidget>\n  </field>\n  <field name="age">\n   <editWidget type="TextEdit">\n    <config>\n     <Option type="Map">\n      <Option type="bool" name="IsMultiline" value="false"/>\n      <Option type="bool" name="UseHtml" value="false"/>\n     </Option>\n    </config>\n   </editWidget>\n  </field>\n  <field name="a_id">\n   <editWidget type="TextEdit">\n    <config>\n     <Option type="Map">\n      <Option type="bool" name="IsMultiline" value="false"/>\n      <Option type="bool" name="UseHtml" value="false"/>\n     </Option>\n    </config>\n   </editWidget>\n  </field>\n  <field name="b_id">\n   <editWidget type="TextEdit">\n    <config>\n     <Option type="Map">\n      <Option type="bool" name="IsMultiline" value="false"/>\n      <Option type="bool" name="UseHtml" value="false"/>\n     </Option>\n    </config>\n   </editWidget>\n  </field>\n </fieldConfiguration>\n <editform tolerant="1"></editform>\n <editforminit/>\n <editforminitcodesource>0</editforminitcodesource>\n <editforminitfilepath></editforminitfilepath>\n <editforminitcode><![CDATA[# -*- coding: utf-8 -*-\n"""\nQGIS forms can have a Python function that is called when the form is\nopened.\n\nUse this function to add extra logic to your forms.\n\nEnter the name of the function in the "Python Init function"\nfield.\nAn example follows:\n"""\nfrom qgis.PyQt.QtWidgets import QWidget\n\ndef my_form_open(dialog, layer, feature):\n    geom = feature.geometry()\n    control = dialog.findChild(QWidget, "MyLineEdit")\n]]></editforminitcode>\n <featformsuppress>0</featformsuppress>\n <editorlayout>tablayout</editorlayout>\n <attributeEditorForm>\n  <labelStyle overrideLabelColor="0" overrideLabelFont="0" labelColor="0,0,0,255">\n   <labelFont style="" underline="0" italic="0" strikethrough="0" bold="0" description="Segoe UI,8,-1,5,50,0,0,0,0,0"/>\n  </labelStyle>\n  <attributeEditorField verticalStretch="0" name="name" index="0" showLabel="1" horizontalStretch="0">\n   <labelStyle overrideLabelColor="0" overrideLabelFont="0" labelColor="0,0,0,255">\n    <labelFont style="" underline="0" italic="0" strikethrough="0" bold="0" description="Segoe UI,8,-1,5,50,0,0,0,0,0"/>\n   </labelStyle>\n  </attributeEditorField>\n  <attributeEditorField verticalStretch="0" name="age" index="1" showLabel="1" horizontalStretch="0">\n   <labelStyle overrideLabelColor="0" overrideLabelFont="0" labelColor="0,0,0,255">\n    <labelFont style="" underline="0" italic="0" strikethrough="0" bold="0" description="Segoe UI,8,-1,5,50,0,0,0,0,0"/>\n   </labelStyle>\n  </attributeEditorField>\n </attributeEditorForm>\n <editable>\n  <field name="a_id" editable="0"/>\n  <field name="age" editable="1"/>\n  <field name="b_id" editable="0"/>\n  <field name="name" editable="1"/>\n </editable>\n <labelOnTop>\n  <field labelOnTop="0" name="a_id"/>\n  <field labelOnTop="0" name="age"/>\n  <field labelOnTop="0" name="b_id"/>\n  <field labelOnTop="0" name="name"/>\n </labelOnTop>\n <reuseLastValue>\n  <field name="a_id" reuseLastValue="0"/>\n  <field name="age" reuseLastValue="0"/>\n  <field name="b_id" reuseLastValue="0"/>\n  <field name="name" reuseLastValue="0"/>\n </reuseLastValue>\n <dataDefinedFieldProperties/>\n <widgets/>\n <layerGeometryType>4</layerGeometryType>\n</qgis>\n	<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ogc="http://www.opengis.net/ogc" xmlns:se="http://www.opengis.net/se" xmlns:xlink="http://www.w3.org/1999/xlink">\n <NamedLayer/>\n</StyledLayerDescriptor>\n	f	Fri Mar 28 18:58:39 2025	postgres	\N	2025-03-28 18:58:39.950225	Unknown geometry
\.


--
-- TOC entry 4116 (class 0 OID 2928258)
-- Dependencies: 216
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 4297 (class 0 OID 0)
-- Dependencies: 224
-- Name: feature_a_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feature_a_id_seq', 5, true);


--
-- TOC entry 4298 (class 0 OID 0)
-- Dependencies: 225
-- Name: feature_b_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feature_b_id_seq', 4, true);


--
-- TOC entry 4299 (class 0 OID 0)
-- Dependencies: 226
-- Name: layer_styles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.layer_styles_id_seq', 1, true);


--
-- TOC entry 4126 (class 2606 OID 2929027)
-- Name: feature_a feature_a_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_a
    ADD CONSTRAINT feature_a_pkey PRIMARY KEY (id);


--
-- TOC entry 4128 (class 2606 OID 2929032)
-- Name: feature_b feature_b_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_b
    ADD CONSTRAINT feature_b_pkey PRIMARY KEY (id);


--
-- TOC entry 4130 (class 2606 OID 2977871)
-- Name: layer_styles layer_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.layer_styles
    ADD CONSTRAINT layer_styles_pkey PRIMARY KEY (id);


--
-- TOC entry 4131 (class 2620 OID 2929059)
-- Name: feature_view feature_view_insert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER feature_view_insert INSTEAD OF INSERT ON public.feature_view FOR EACH ROW EXECUTE FUNCTION public.feature_view_insert_trigger();


--
-- TOC entry 4132 (class 2620 OID 2977860)
-- Name: feature_view feature_view_update_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER feature_view_update_trigger INSTEAD OF UPDATE ON public.feature_view FOR EACH ROW EXECUTE FUNCTION public.feature_view_update_trigger();


-- Completed on 2025-03-28 19:03:20

--
-- PostgreSQL database dump complete
--

