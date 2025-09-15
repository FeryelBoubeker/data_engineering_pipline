--
-- PostgreSQL database dump
--

\restrict 7x6Gnsuyt6lQINcVdbPJEVV4Kpp2EWza4yAmlb5SpvlvAbv88AFvrsSKHCan2ac

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-0+deb13u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors (
    actor_id integer NOT NULL,
    actor_name character varying(255) NOT NULL
);


ALTER TABLE public.actors OWNER TO postgres;

--
-- Name: actors_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actors_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actors_actor_id_seq OWNER TO postgres;

--
-- Name: actors_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actors_actor_id_seq OWNED BY public.actors.actor_id;


--
-- Name: film_actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_actors (
    film_id integer NOT NULL,
    actor_id integer NOT NULL
);


ALTER TABLE public.film_actors OWNER TO postgres;

--
-- Name: film_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_category (
    category_id integer NOT NULL,
    film_id integer,
    category_name character varying(50) NOT NULL
);


ALTER TABLE public.film_category OWNER TO postgres;

--
-- Name: film_category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.film_category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.film_category_category_id_seq OWNER TO postgres;

--
-- Name: film_category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.film_category_category_id_seq OWNED BY public.film_category.category_id;


--
-- Name: films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films (
    film_id integer NOT NULL,
    title character varying(255) NOT NULL,
    release_date date,
    price numeric(5,2),
    rating character varying(10),
    user_rating numeric(2,1),
    CONSTRAINT films_user_rating_check CHECK (((user_rating >= (1)::numeric) AND (user_rating <= (5)::numeric)))
);


ALTER TABLE public.films OWNER TO postgres;

--
-- Name: films_film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.films_film_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.films_film_id_seq OWNER TO postgres;

--
-- Name: films_film_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.films_film_id_seq OWNED BY public.films.film_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    date_of_birth date
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: actors actor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors ALTER COLUMN actor_id SET DEFAULT nextval('public.actors_actor_id_seq'::regclass);


--
-- Name: film_category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_category ALTER COLUMN category_id SET DEFAULT nextval('public.film_category_category_id_seq'::regclass);


--
-- Name: films film_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films ALTER COLUMN film_id SET DEFAULT nextval('public.films_film_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors (actor_id, actor_name) FROM stdin;
1	Leonardo DiCaprio
2	Tim Robbins
3	Marlon Brando
4	Christian Bale
5	John Travolta
6	Keanu Reeves
7	Tom Hanks
8	Tom Hanks
9	Sam Neill
10	Sam Worthington
11	Ryan Gosling
12	Tom Hardy
13	Anthony Gonzalez
14	Fionn Whitehead
15	Shameik Moore
16	Song Kang-ho
17	Miles Teller
18	Amy Poehler
19	Ralph Fiennes
20	Emma Stone
\.


--
-- Data for Name: film_actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.film_actors (film_id, actor_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
11	11
12	12
13	13
14	14
15	15
16	16
17	17
18	18
19	19
20	20
\.


--
-- Data for Name: film_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.film_category (category_id, film_id, category_name) FROM stdin;
1	1	Sci-Fi
2	1	Thriller
3	2	Drama
4	3	Crime
5	3	Drama
6	4	Action
7	4	Thriller
8	5	Crime
9	5	Drama
10	6	Sci-Fi
11	6	Action
12	7	Drama
13	7	Romance
14	8	Animation
15	8	Family
16	9	Action
17	9	Adventure
18	10	Sci-Fi
19	10	Adventure
20	11	Sci-Fi
21	11	Drama
22	12	Action
23	12	Adventure
24	13	Animation
25	13	Family
26	14	War
27	14	Drama
28	15	Animation
29	15	Action
30	16	Drama
31	16	Thriller
32	17	Drama
33	17	Music
34	18	Animation
35	18	Family
36	19	Comedy
37	19	Drama
38	20	Drama
39	20	Music
\.


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films (film_id, title, release_date, price, rating, user_rating) FROM stdin;
1	Inception	2010-07-16	12.99	PG-13	4.8
2	The Shawshank Redemption	1994-09-23	9.99	R	4.9
3	The Godfather	1972-03-24	14.99	R	4.7
4	The Dark Knight	2008-07-18	11.99	PG-13	4.8
5	Pulp Fiction	1994-10-14	10.99	R	4.6
6	The Matrix	1999-03-31	9.99	R	4.7
7	Forrest Gump	1994-07-06	8.99	PG-13	4.5
8	Toy Story	1995-11-22	7.99	G	4.4
9	Jurassic Park	1993-06-11	9.99	PG-13	4.3
10	Avatar	2009-12-18	12.99	PG-13	4.2
11	Blade Runner 2049	2017-10-06	13.99	R	4.3
12	Mad Max: Fury Road	2015-05-15	11.99	R	4.6
13	Coco	2017-11-22	9.99	PG	4.8
14	Dunkirk	2017-07-21	12.99	PG-13	4.5
15	Spider-Man: Into the Spider-Verse	2018-12-14	10.99	PG	4.9
16	Parasite	2019-10-11	14.99	R	4.6
17	Whiplash	2014-10-10	9.99	R	4.7
18	Inside Out	2015-06-19	9.99	PG	4.8
19	The Grand Budapest Hotel	2014-03-28	10.99	R	4.4
20	La La Land	2016-12-09	11.99	PG-13	4.5
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, email, date_of_birth) FROM stdin;
1	John	Doe	john.doe@example.com	1990-01-01
2	Jane	Smith	jane.smith@example.com	1992-05-15
3	Alice	Johnson	alice.johnson@example.com	1985-10-20
4	Bob	Williams	bob.williams@example.com	1998-07-30
5	Emily	Clark	emily.clark@example.com	1987-02-14
6	Michael	Robinson	michael.robinson@example.com	1995-06-05
7	Sarah	Lewis	sarah.lewis@example.com	1989-03-25
8	David	Walker	david.walker@example.com	1992-11-12
9	Sophia	Hall	sophia.hall@example.com	1996-08-08
10	James	Allen	james.allen@example.com	1984-04-20
11	Olivia	Young	olivia.young@example.com	1993-12-30
12	Chris	King	chris.king@example.com	1990-09-15
13	Grace	Wright	grace.wright@example.com	1997-05-10
14	William	Scott	william.scott@example.com	1986-07-22
\.


--
-- Name: actors_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actors_actor_id_seq', 20, true);


--
-- Name: film_category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.film_category_category_id_seq', 39, true);


--
-- Name: films_film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.films_film_id_seq', 20, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 14, true);


--
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (actor_id);


--
-- Name: film_actors film_actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_actors
    ADD CONSTRAINT film_actors_pkey PRIMARY KEY (film_id, actor_id);


--
-- Name: film_category film_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT film_category_pkey PRIMARY KEY (category_id);


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (film_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: film_actors film_actors_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_actors
    ADD CONSTRAINT film_actors_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actors(actor_id);


--
-- Name: film_actors film_actors_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_actors
    ADD CONSTRAINT film_actors_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.films(film_id);


--
-- Name: film_category film_category_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT film_category_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.films(film_id);


--
-- PostgreSQL database dump complete
--

\unrestrict 7x6Gnsuyt6lQINcVdbPJEVV4Kpp2EWza4yAmlb5SpvlvAbv88AFvrsSKHCan2ac

