--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: org_enum; Type: TYPE; Schema: public; Owner: jerry
--

CREATE TYPE public.org_enum AS ENUM (
    'Fokontany',
    'Commune',
    'Ville',
    'Association',
    'Syndicat',
    'Organisation',
    'MinistŠre'
);


ALTER TYPE public.org_enum OWNER TO jerry;

--
-- Name: sexe_enum; Type: TYPE; Schema: public; Owner: jerry
--

CREATE TYPE public.sexe_enum AS ENUM (
    'Masculin',
    'F‚minin'
);


ALTER TYPE public.sexe_enum OWNER TO jerry;

--
-- Name: type_event_enum; Type: TYPE; Schema: public; Owner: jerry
--

CREATE TYPE public.type_event_enum AS ENUM (
    'Social',
    'Politique',
    'Culturel'
);


ALTER TYPE public.type_event_enum OWNER TO jerry;

--
-- Name: alpha_num; Type: SEQUENCE; Schema: public; Owner: jerry
--

CREATE SEQUENCE public.alpha_num
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100000
    CACHE 1;


ALTER TABLE public.alpha_num OWNER TO jerry;

--
-- Name: alpha_num_carte; Type: SEQUENCE; Schema: public; Owner: jerry
--

CREATE SEQUENCE public.alpha_num_carte
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100000
    CACHE 1;


ALTER TABLE public.alpha_num_carte OWNER TO jerry;

--
-- Name: alpha_num_event; Type: SEQUENCE; Schema: public; Owner: jerry
--

CREATE SEQUENCE public.alpha_num_event
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100000
    CACHE 1;


ALTER TABLE public.alpha_num_event OWNER TO jerry;

--
-- Name: alpha_num_feed; Type: SEQUENCE; Schema: public; Owner: jerry
--

CREATE SEQUENCE public.alpha_num_feed
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100000
    CACHE 1;


ALTER TABLE public.alpha_num_feed OWNER TO jerry;

--
-- Name: alpha_num_img; Type: SEQUENCE; Schema: public; Owner: jerry
--

CREATE SEQUENCE public.alpha_num_img
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100000
    CACHE 1;


ALTER TABLE public.alpha_num_img OWNER TO jerry;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: carte; Type: TABLE; Schema: public; Owner: jerry
--

CREATE TABLE public.carte (
    code_carte text DEFAULT ('map'::text || nextval('public.alpha_num_carte'::regclass)) NOT NULL,
    coord_lat numeric(10,7),
    coord_long numeric(10,7),
    CONSTRAINT carte_code_carte_check CHECK ((code_carte ~ '^map[0-9]+$'::text))
);


ALTER TABLE public.carte OWNER TO jerry;

--
-- Name: evenement; Type: TABLE; Schema: public; Owner: jerry
--

CREATE TABLE public.evenement (
    id_evenement text DEFAULT ('ev2024'::text || nextval('public.alpha_num_event'::regclass)) NOT NULL,
    intitule_evenement text NOT NULL,
    date_evenement date NOT NULL,
    lieu_evenement character varying(250) NOT NULL,
    type_evenement public.type_event_enum,
    description text NOT NULL,
    id_organisateur text NOT NULL,
    code_carte text NOT NULL,
    CONSTRAINT evenement_id_evenement_check CHECK ((id_evenement ~ '^ev2024[0-9]+$'::text))
);


ALTER TABLE public.evenement OWNER TO jerry;

--
-- Name: feedback; Type: TABLE; Schema: public; Owner: jerry
--

CREATE TABLE public.feedback (
    id_feedback text DEFAULT ('feed2024'::text || nextval('public.alpha_num_feed'::regclass)) NOT NULL,
    date_envoi date NOT NULL,
    message text NOT NULL,
    cin character varying(30) NOT NULL,
    CONSTRAINT feedback_id_feedback_check CHECK ((id_feedback ~ '^feed[0-9]+$'::text))
);


ALTER TABLE public.feedback OWNER TO jerry;

--
-- Name: image_evenement; Type: TABLE; Schema: public; Owner: jerry
--

CREATE TABLE public.image_evenement (
    id_img text DEFAULT ('img2024'::text || nextval('public.alpha_num_img'::regclass)) NOT NULL,
    img_evenement bytea NOT NULL,
    id_evenement text NOT NULL,
    CONSTRAINT image_evenement_id_img_check CHECK ((id_img ~ '^img2024[0-9]+$'::text))
);


ALTER TABLE public.image_evenement OWNER TO jerry;

--
-- Name: organisateur; Type: TABLE; Schema: public; Owner: jerry
--

CREATE TABLE public.organisateur (
    id_organisateur text DEFAULT ('org2024'::text || nextval('public.alpha_num'::regclass)) NOT NULL,
    intitule character varying(200) NOT NULL,
    type public.org_enum,
    img bytea NOT NULL,
    siege character varying(200) NOT NULL,
    contact character varying(15) NOT NULL,
    email character varying(100) NOT NULL,
    description text,
    nb_evenement integer,
    CONSTRAINT organisateur_id_organisateur_check CHECK ((id_organisateur ~ '^org2024[0-9]+$'::text))
);


ALTER TABLE public.organisateur OWNER TO jerry;

--
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: jerry
--

CREATE TABLE public.utilisateur (
    nom character varying(200) NOT NULL,
    prenom character varying(250) NOT NULL,
    age integer NOT NULL,
    sexe public.sexe_enum NOT NULL,
    date_naissance date NOT NULL,
    lieu_naissance character varying(100) NOT NULL,
    img bytea NOT NULL,
    cin character varying(30) NOT NULL,
    adresse character varying(200) NOT NULL,
    fokontany character varying(200) NOT NULL,
    commune character varying(200) NOT NULL,
    ville character varying(200) NOT NULL,
    contact character varying(15) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.utilisateur OWNER TO jerry;

--
-- Data for Name: carte; Type: TABLE DATA; Schema: public; Owner: jerry
--

COPY public.carte (code_carte, coord_lat, coord_long) FROM stdin;
\.


--
-- Data for Name: evenement; Type: TABLE DATA; Schema: public; Owner: jerry
--

COPY public.evenement (id_evenement, intitule_evenement, date_evenement, lieu_evenement, type_evenement, description, id_organisateur, code_carte) FROM stdin;
\.


--
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: jerry
--

COPY public.feedback (id_feedback, date_envoi, message, cin) FROM stdin;
\.


--
-- Data for Name: image_evenement; Type: TABLE DATA; Schema: public; Owner: jerry
--

COPY public.image_evenement (id_img, img_evenement, id_evenement) FROM stdin;
\.


--
-- Data for Name: organisateur; Type: TABLE DATA; Schema: public; Owner: jerry
--

COPY public.organisateur (id_organisateur, intitule, type, img, siege, contact, email, description, nb_evenement) FROM stdin;
\.


--
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: jerry
--

COPY public.utilisateur (nom, prenom, age, sexe, date_naissance, lieu_naissance, img, cin, adresse, fokontany, commune, ville, contact, email) FROM stdin;
\.


--
-- Name: alpha_num; Type: SEQUENCE SET; Schema: public; Owner: jerry
--

SELECT pg_catalog.setval('public.alpha_num', 1, false);


--
-- Name: alpha_num_carte; Type: SEQUENCE SET; Schema: public; Owner: jerry
--

SELECT pg_catalog.setval('public.alpha_num_carte', 1, false);


--
-- Name: alpha_num_event; Type: SEQUENCE SET; Schema: public; Owner: jerry
--

SELECT pg_catalog.setval('public.alpha_num_event', 1, false);


--
-- Name: alpha_num_feed; Type: SEQUENCE SET; Schema: public; Owner: jerry
--

SELECT pg_catalog.setval('public.alpha_num_feed', 1, false);


--
-- Name: alpha_num_img; Type: SEQUENCE SET; Schema: public; Owner: jerry
--

SELECT pg_catalog.setval('public.alpha_num_img', 1, false);


--
-- Name: utilisateur cin_pk; Type: CONSTRAINT; Schema: public; Owner: jerry
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT cin_pk PRIMARY KEY (cin);


--
-- Name: carte code_carte_pk; Type: CONSTRAINT; Schema: public; Owner: jerry
--

ALTER TABLE ONLY public.carte
    ADD CONSTRAINT code_carte_pk PRIMARY KEY (code_carte);


--
-- Name: evenement id_evenement_pk; Type: CONSTRAINT; Schema: public; Owner: jerry
--

ALTER TABLE ONLY public.evenement
    ADD CONSTRAINT id_evenement_pk PRIMARY KEY (id_evenement);


--
-- Name: feedback id_feedback_pk; Type: CONSTRAINT; Schema: public; Owner: jerry
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT id_feedback_pk PRIMARY KEY (id_feedback);


--
-- Name: image_evenement id_img_pk; Type: CONSTRAINT; Schema: public; Owner: jerry
--

ALTER TABLE ONLY public.image_evenement
    ADD CONSTRAINT id_img_pk PRIMARY KEY (id_img);


--
-- Name: organisateur id_org_pk; Type: CONSTRAINT; Schema: public; Owner: jerry
--

ALTER TABLE ONLY public.organisateur
    ADD CONSTRAINT id_org_pk PRIMARY KEY (id_organisateur);


--
-- Name: feedback cin_fk; Type: FK CONSTRAINT; Schema: public; Owner: jerry
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT cin_fk FOREIGN KEY (cin) REFERENCES public.utilisateur(cin) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: evenement code_carte_fk; Type: FK CONSTRAINT; Schema: public; Owner: jerry
--

ALTER TABLE ONLY public.evenement
    ADD CONSTRAINT code_carte_fk FOREIGN KEY (code_carte) REFERENCES public.carte(code_carte) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: image_evenement id_evenement_fk; Type: FK CONSTRAINT; Schema: public; Owner: jerry
--

ALTER TABLE ONLY public.image_evenement
    ADD CONSTRAINT id_evenement_fk FOREIGN KEY (id_evenement) REFERENCES public.evenement(id_evenement) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: evenement id_organisateur_fk; Type: FK CONSTRAINT; Schema: public; Owner: jerry
--

ALTER TABLE ONLY public.evenement
    ADD CONSTRAINT id_organisateur_fk FOREIGN KEY (id_organisateur) REFERENCES public.organisateur(id_organisateur) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

