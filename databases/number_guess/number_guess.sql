--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    secret_number integer NOT NULL,
    guesses integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: user_games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_games (
    username character varying NOT NULL,
    game_id integer NOT NULL
);


ALTER TABLE public.user_games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (56, 232, 233);
INSERT INTO public.games VALUES (57, 959, 11);
INSERT INTO public.games VALUES (58, 12, 16);
INSERT INTO public.games VALUES (59, 818, 819);
INSERT INTO public.games VALUES (60, 728, 729);
INSERT INTO public.games VALUES (61, 516, 517);
INSERT INTO public.games VALUES (62, 595, 596);
INSERT INTO public.games VALUES (63, 329, 332);
INSERT INTO public.games VALUES (64, 159, 161);
INSERT INTO public.games VALUES (65, 987, 988);
INSERT INTO public.games VALUES (66, 894, 895);
INSERT INTO public.games VALUES (67, 560, 561);
INSERT INTO public.games VALUES (68, 226, 227);
INSERT INTO public.games VALUES (69, 471, 472);
INSERT INTO public.games VALUES (70, 181, 184);
INSERT INTO public.games VALUES (71, 268, 270);
INSERT INTO public.games VALUES (72, 831, 832);
INSERT INTO public.games VALUES (73, 193, 194);
INSERT INTO public.games VALUES (74, 363, 364);
INSERT INTO public.games VALUES (75, 723, 724);
INSERT INTO public.games VALUES (76, 523, 524);
INSERT INTO public.games VALUES (77, 160, 163);
INSERT INTO public.games VALUES (78, 120, 122);
INSERT INTO public.games VALUES (79, 826, 827);
INSERT INTO public.games VALUES (80, 557, 558);
INSERT INTO public.games VALUES (81, 911, 912);
INSERT INTO public.games VALUES (82, 633, 634);
INSERT INTO public.games VALUES (83, 645, 646);
INSERT INTO public.games VALUES (84, 728, 731);
INSERT INTO public.games VALUES (85, 622, 624);
INSERT INTO public.games VALUES (86, 186, 187);


--
-- Data for Name: user_games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_games VALUES ('user_1771477141715', 56);
INSERT INTO public.user_games VALUES ('alex', 57);
INSERT INTO public.user_games VALUES ('alex', 58);
INSERT INTO public.user_games VALUES ('user_1771477424561', 59);
INSERT INTO public.user_games VALUES ('user_1771477424561', 60);
INSERT INTO public.user_games VALUES ('user_1771477424560', 61);
INSERT INTO public.user_games VALUES ('user_1771477424560', 62);
INSERT INTO public.user_games VALUES ('user_1771477424561', 63);
INSERT INTO public.user_games VALUES ('user_1771477424561', 64);
INSERT INTO public.user_games VALUES ('user_1771477424561', 65);
INSERT INTO public.user_games VALUES ('user_1771477600069', 66);
INSERT INTO public.user_games VALUES ('user_1771477600069', 67);
INSERT INTO public.user_games VALUES ('user_1771477600068', 68);
INSERT INTO public.user_games VALUES ('user_1771477600068', 69);
INSERT INTO public.user_games VALUES ('user_1771477600069', 70);
INSERT INTO public.user_games VALUES ('user_1771477600069', 71);
INSERT INTO public.user_games VALUES ('user_1771477600069', 72);
INSERT INTO public.user_games VALUES ('user_1771477627000', 73);
INSERT INTO public.user_games VALUES ('user_1771477627000', 74);
INSERT INTO public.user_games VALUES ('user_1771477626999', 75);
INSERT INTO public.user_games VALUES ('user_1771477626999', 76);
INSERT INTO public.user_games VALUES ('user_1771477627000', 77);
INSERT INTO public.user_games VALUES ('user_1771477627000', 78);
INSERT INTO public.user_games VALUES ('user_1771477627000', 79);
INSERT INTO public.user_games VALUES ('user_1771477663507', 80);
INSERT INTO public.user_games VALUES ('user_1771477663507', 81);
INSERT INTO public.user_games VALUES ('user_1771477663506', 82);
INSERT INTO public.user_games VALUES ('user_1771477663506', 83);
INSERT INTO public.user_games VALUES ('user_1771477663507', 84);
INSERT INTO public.user_games VALUES ('user_1771477663507', 85);
INSERT INTO public.user_games VALUES ('user_1771477663507', 86);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1771477141715');
INSERT INTO public.users VALUES ('alex');
INSERT INTO public.users VALUES ('user_1771477424561');
INSERT INTO public.users VALUES ('user_1771477424560');
INSERT INTO public.users VALUES ('user_1771477600069');
INSERT INTO public.users VALUES ('user_1771477600068');
INSERT INTO public.users VALUES ('user_1771477627000');
INSERT INTO public.users VALUES ('user_1771477626999');
INSERT INTO public.users VALUES ('user_1771477663507');
INSERT INTO public.users VALUES ('user_1771477663506');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 86, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: user_games user_games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_games
    ADD CONSTRAINT user_games_pkey PRIMARY KEY (username, game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: user_games user_games_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_games
    ADD CONSTRAINT user_games_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(game_id);


--
-- Name: user_games user_games_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_games
    ADD CONSTRAINT user_games_username_fkey FOREIGN KEY (username) REFERENCES public.users(username);


--
-- PostgreSQL database dump complete
--

