--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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
    id serial primary key,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
   id serial primary key,
    url text NOT NULL,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "shortUrl" text NOT NULL
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
   id serial primary key,
    name character varying(50) NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "linksCount" integer DEFAULT 0 NOT NULL
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

INSERT INTO public.sessions VALUES (39, 28, 'd53cff5c-a044-4e0c-9916-f8b3d0491267', '2023-03-02 21:16:57.086885');
INSERT INTO public.sessions VALUES (40, 29, '6d633203-3156-4310-9f3e-9fdafb3f50c7', '2023-03-02 22:23:33.418294');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (95, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 28, '2023-03-02 23:31:52.179456', 0, 'CrW_ocGy');
INSERT INTO public.urls VALUES (98, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 28, '2023-03-02 23:33:19.722489', 0, 'Bn6RrOnw');
INSERT INTO public.urls VALUES (102, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 28, '2023-03-02 23:37:16.813563', 0, 'KPWOQ-42');
INSERT INTO public.urls VALUES (103, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 28, '2023-03-02 23:37:18.187442', 0, '7Asfjyff');
INSERT INTO public.urls VALUES (94, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 28, '2023-03-02 22:22:19.768171', 3, 'LEVrFtv4');
INSERT INTO public.urls VALUES (96, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 28, '2023-03-02 23:32:39.531643', 0, 'FRCp3quM');
INSERT INTO public.urls VALUES (97, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 28, '2023-03-02 23:32:41.281748', 0, 'WlM537No');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (29, 'Lorenzoo', 'Lolo@lolo.com.br', '$2b$10$vHUGABSGYOBqBXZqQtvB2eyvPIFpAMSjlXDSY7dxq8PRF/QfHfZGy', '2023-03-02 22:23:23.293935', 0, 0);
INSERT INTO public.users VALUES (28, 'Lorenzoo', 'Lolo@lo.com.br', '$2b$10$xSXCyLqleD9/CLgkSY.vm.qtUkaIMM3tEHf.Hz7J.abSSQ/.I72xy', '2023-03-02 21:16:53.068438', 3, 3);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 40, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 103, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 29, true);


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

