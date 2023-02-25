--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "shortUrl" text NOT NULL,
    url text NOT NULL,
    "userId" integer,
    "linksCount" integer DEFAULT 0,
    "visitCount" integer DEFAULT 0,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (8, 16, '2a691c3b-742e-44c8-8318-0dc2c62e5ea9');
INSERT INTO public.sessions VALUES (9, 16, '0b44484b-d1d5-48ed-9b6c-410363d99d9e');
INSERT INTO public.sessions VALUES (10, 16, 'fae3b2ef-e388-452d-ba14-99edc930b4ef');
INSERT INTO public.sessions VALUES (11, 16, 'e258c236-89c6-4f05-9d34-faab5fd3af3b');
INSERT INTO public.sessions VALUES (12, 16, '38403e8c-dc58-409b-9015-4a7275df9cf2');
INSERT INTO public.sessions VALUES (13, 16, '42d900af-e837-48c4-adf5-cce85a8e35e2');
INSERT INTO public.sessions VALUES (14, 16, 'a8d4c128-08e0-48be-af08-08456ded253e');
INSERT INTO public.sessions VALUES (15, 16, '78a51040-7198-4cc0-9e99-c2e5c7abfe42');
INSERT INTO public.sessions VALUES (16, 16, '2ccff5b0-a3b7-4f94-95f6-3f79acd5cebd');
INSERT INTO public.sessions VALUES (17, 16, '1deb12ba-73af-4f43-a80d-18ebc8f0c255');
INSERT INTO public.sessions VALUES (18, 16, '8278ef82-97be-4d52-9eae-a8c24c3ef9e7');
INSERT INTO public.sessions VALUES (19, 16, '89b29cfd-2cc3-44f5-97cd-d22fee69c26f');
INSERT INTO public.sessions VALUES (20, 16, '627baddd-3c1c-4304-8615-a4dd85db25cb');
INSERT INTO public.sessions VALUES (21, 17, '2e01aba2-73a3-4442-bef4-07808c84d5f5');
INSERT INTO public.sessions VALUES (22, 17, 'e35eaf3b-5cea-4fab-8228-58c43980669d');
INSERT INTO public.sessions VALUES (23, 17, 'e4391fd2-2c53-4b18-9760-b3ad4b1b7972');
INSERT INTO public.sessions VALUES (24, 17, '737def99-72d5-462a-b00f-bd562556acbf');
INSERT INTO public.sessions VALUES (25, 17, 'f8e5ff08-64f1-4da6-995d-b3fef6031cf3');
INSERT INTO public.sessions VALUES (26, 17, '6a2a9b74-bc6a-451c-943c-9f80364618b9');
INSERT INTO public.sessions VALUES (27, 17, 'ffb760bc-3cc2-4076-a431-3c68407a6798');
INSERT INTO public.sessions VALUES (28, 17, '6b62425d-1ff5-48d8-a96a-567d7a66482f');
INSERT INTO public.sessions VALUES (29, 17, '6e54a608-894b-40a6-80b5-0673937e7ace');
INSERT INTO public.sessions VALUES (30, 17, 'f8306496-2226-4324-b818-18c29cefe38d');
INSERT INTO public.sessions VALUES (31, 17, '8995bf64-c2ae-4950-8c2f-290320edfbec');
INSERT INTO public.sessions VALUES (32, 17, 'e1ae8b12-8d82-4531-a9b2-4d5d4fd71be3');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (13, 'JBlSnz3r', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-21 23:10:29.07106');
INSERT INTO public.urls VALUES (14, 'WezMQys2', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-21 23:11:49.327091');
INSERT INTO public.urls VALUES (15, '2VRISR74', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-24 22:17:40.256069');
INSERT INTO public.urls VALUES (16, 'yNL9KwFt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-24 22:18:19.685833');
INSERT INTO public.urls VALUES (17, 'f_vO5Rrf', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-24 22:19:10.73813');
INSERT INTO public.urls VALUES (18, 'I84G9ku2', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-24 22:23:09.64983');
INSERT INTO public.urls VALUES (19, '63iqTpkH', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-24 22:23:47.435061');
INSERT INTO public.urls VALUES (20, 'rBHS_nUC', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-24 22:24:18.729857');
INSERT INTO public.urls VALUES (21, 'twXFDCbF', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-24 22:24:20.31655');
INSERT INTO public.urls VALUES (22, '2Tqkf2pu', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-24 22:25:13.742207');
INSERT INTO public.urls VALUES (23, 'QogqbmyZ', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-24 22:25:23.599771');
INSERT INTO public.urls VALUES (24, 'rkpDsoCe', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-24 22:25:48.183788');
INSERT INTO public.urls VALUES (25, 'rBdU4ZF2', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-24 22:29:30.923968');
INSERT INTO public.urls VALUES (26, 'GRcykUFj', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-24 22:29:33.123718');
INSERT INTO public.urls VALUES (27, 'XDOOnNPH', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-24 22:30:19.119719');
INSERT INTO public.urls VALUES (28, 'R8-AGfP6', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-25 07:28:03.109879');
INSERT INTO public.urls VALUES (29, 'p-lA_UTX', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-25 07:32:37.462566');
INSERT INTO public.urls VALUES (30, '1n2UudNl', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-25 07:33:13.989927');
INSERT INTO public.urls VALUES (31, 'nNOyQR_-', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-25 07:33:38.787294');
INSERT INTO public.urls VALUES (32, 'OCSWXp0u', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-25 07:34:10.907206');
INSERT INTO public.urls VALUES (33, 'Y_rMhLy8', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-25 07:34:30.110933');
INSERT INTO public.urls VALUES (34, 'igBWFQVw', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-25 07:34:32.453659');
INSERT INTO public.urls VALUES (35, 'Z4PrN8id', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-25 07:34:49.839912');
INSERT INTO public.urls VALUES (36, 'qMyaJUBf', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-25 07:35:11.829555');
INSERT INTO public.urls VALUES (37, 'jvnZslQl', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-25 07:35:41.52085');
INSERT INTO public.urls VALUES (38, 'MzAunuVB', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', NULL, 0, 0, '2023-02-25 07:36:13.095443');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'pan', 'pan@pan.com', '$2b$10$YIj1YJdRP0PRON8yfWjteO4P.v./VVYnCiP6uGsfjLOZF6FzmnM/G');
INSERT INTO public.users VALUES (3, 'pan', 'pan@.com', '$2b$10$F4mCMpI9Mrsgdet8QcCNHehkPcSilGo4zR/PnbOEso0lbKXlxa6f6');
INSERT INTO public.users VALUES (5, 'pan', 'panqueca@hotmail.com', '$2b$10$acbru6xf8DpDd8bSdsp3/eQoPPMLazgpjmEM4U2DqwVXQUexTwjwm');
INSERT INTO public.users VALUES (7, 'Negão', 'negao@hotmail.com', '$2b$10$JL5tVEmeHNHkOqv9gdgJDuQBR3Ckto5K47DXgB6gRiuafNjQptwtm');
INSERT INTO public.users VALUES (10, 'nego', 'negao@gmail.com', '$2b$10$Z9mt0V/ecPyfw/PHFSw/He4lTUEUrQGejrSaTrUA9gfOMvj98sO62');
INSERT INTO public.users VALUES (13, 'nego', 'negao@msn.com', '$2b$10$bvVZbWk0dcztVZ2okvgCUuWgd6APtRfz33K4vfvixskMAkLD2290u');
INSERT INTO public.users VALUES (14, 'nego', 'negao@yahhoo.com', '$2b$10$Wf34UuEilSgTeSUooyv7jeanCmf7.66PCCqp91sqqkiUs5o.YSfHG');
INSERT INTO public.users VALUES (15, 'nego', 'negao@uol.com', '$2b$10$4q7EbnvuC/.o0MFFgnC1Ze3tutyRTOljPV/XTGXSa/BCUmfsZ9bDS');
INSERT INTO public.users VALUES (16, 'lorenzo', 'lorenzo@hotmail.com', '$2b$10$UakaKzF4fUlW1IEYukAxqu464G.sdwX25YcO.fpDJ/nNNIjN6QHNO');
INSERT INTO public.users VALUES (17, 'lorenzo', 'lorenzo@lolo.com.br', '$2b$10$uK3swzu2dU2kV9xnsn2Y9uoY8ZnzvQOf4UkIi/Ty4fxMi0S2zgcLi');
INSERT INTO public.users VALUES (18, 'lorenzo', 'lorenzo@lol.com.br', '$2b$10$COMSLwczYsuyYZzbXlrBRuXxoc/HJndZwNWMWmKYkT067Q8FHBJdq');
INSERT INTO public.users VALUES (19, 'DeccaDecca', 'loorrenzo@lolo.com.br', '$2b$10$/U..942/9bniBKDeV3X7.e3YRh3qtLCnPMWg6nkg0hX6VjboNLK1.');
INSERT INTO public.users VALUES (20, 'DeccaDecca', 'loorrenzo@lo.com.br', '$2b$10$wO/YgqGze7B82S9qW1po9ugiCeCG8WV6u2jfFhg0sCpmwh3Fx4qiq');
INSERT INTO public.users VALUES (21, 'DeccaDecca', 'loorrenzo@l.com.br', '$2b$10$pUWk5iMA2f56Yf3YxOELRuozPuy8Z2PIsnSTHSTZFshQPXXWebyeS');
INSERT INTO public.users VALUES (22, 'lorenzo', 'lorenzo@lololo.com.br', '$2b$10$Fg1WLGC.oYLgPKy5F.njD.5u43ouuRtowzuzHHyIPFZEqnV8zGMKe');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 32, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 38, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 22, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

