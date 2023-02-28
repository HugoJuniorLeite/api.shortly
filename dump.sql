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
    token text NOT NULL,
    "createAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
-- Name: shortUrls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."shortUrls" (
    id integer NOT NULL,
    "urlId" integer NOT NULL,
    "shortUrl" text NOT NULL,
    "linksCount" integer DEFAULT 0 NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: shortUrls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."shortUrls_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shortUrls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."shortUrls_id_seq" OWNED BY public."shortUrls".id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "userId" integer,
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
    password text NOT NULL,
    "createAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
-- Name: shortUrls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortUrls" ALTER COLUMN id SET DEFAULT nextval('public."shortUrls_id_seq"'::regclass);


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

INSERT INTO public.sessions VALUES (36, 27, 'bb041bcb-1c7d-4209-bc63-cb18bda26e6d', '2023-02-26 22:37:25.800313');
INSERT INTO public.sessions VALUES (37, 27, '08fa6faf-e4d3-4544-9701-14c9aadda6b0', '2023-02-27 22:07:55.850576');
INSERT INTO public.sessions VALUES (38, 27, '98d94cad-9a0f-400f-afc6-3c444f2660bf', '2023-02-27 22:09:03.98937');


--
-- Data for Name: shortUrls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."shortUrls" VALUES (1, 61, 'pfYvqbse', 0, 0, '2023-02-26 23:22:35.622552');
INSERT INTO public."shortUrls" VALUES (2, 61, 'Mj9KSsuO', 0, 0, '2023-02-26 23:30:51.525251');
INSERT INTO public."shortUrls" VALUES (3, 61, 'NoZ0JynS', 0, 0, '2023-02-26 23:33:05.341687');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (61, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 27, '2023-02-26 23:16:31.256125');
INSERT INTO public.urls VALUES (62, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 27, '2023-02-26 23:17:33.13068');
INSERT INTO public.urls VALUES (63, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 27, '2023-02-26 23:18:06.535054');
INSERT INTO public.urls VALUES (64, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 27, '2023-02-26 23:19:33.076975');
INSERT INTO public.urls VALUES (65, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 27, '2023-02-26 23:21:50.042491');
INSERT INTO public.urls VALUES (66, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 27, '2023-02-26 23:22:35.615522');
INSERT INTO public.urls VALUES (67, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 27, '2023-02-26 23:30:51.519004');
INSERT INTO public.urls VALUES (68, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5EubENGUWySnBOxaEU1pOazGsc_e7F_jwrs44RJpc0Q&s', 27, '2023-02-26 23:33:05.326236');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (27, 'Lorenzoo', 'Lolo@lo.com.br', '$2b$10$SMX98mqKpRxYRo10p3wxdemXVBWU1kTmX1mT2w.oDv8zt9MhFVmRu', '2023-02-26 22:37:14.87308');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 38, true);


--
-- Name: shortUrls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."shortUrls_id_seq"', 3, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 68, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 27, true);


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
-- Name: shortUrls shortUrls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortUrls"
    ADD CONSTRAINT "shortUrls_pkey" PRIMARY KEY (id);


--
-- Name: shortUrls shortUrls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortUrls"
    ADD CONSTRAINT "shortUrls_shortUrl_key" UNIQUE ("shortUrl");


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
-- Name: shortUrls shortUrls_urlId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortUrls"
    ADD CONSTRAINT "shortUrls_urlId_fkey" FOREIGN KEY ("urlId") REFERENCES public.urls(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

