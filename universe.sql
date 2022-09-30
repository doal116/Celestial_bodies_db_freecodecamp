--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    age_in_millions_of_years integer NOT NULL,
    galaxy_types text,
    distance_from_earth numeric(4,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_body_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_body_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_planet (
    name character varying(20),
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    galaxy_planet_id integer NOT NULL
);


ALTER TABLE public.galaxy_planet OWNER TO freecodecamp;

--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_planet_galaxy_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_planet_galaxy_planet_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_planet_galaxy_planet_id_seq OWNED BY public.galaxy_planet.galaxy_planet_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20),
    has_life boolean,
    planet_id integer NOT NULL,
    distance_from_earth numeric(10,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_columnbody_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_columnbody_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_columnbody_id_seq OWNER TO freecodecamp;

--
-- Name: moon_columnbody_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_columnbody_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    age_in_millions_of_years integer,
    is_spherical boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_body_id_seq OWNER TO freecodecamp;

--
-- Name: planet_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_body_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    description text,
    galaxy_id integer NOT NULL,
    distance_from_earth numeric(4,1)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_body_id_seq'::regclass);


--
-- Name: galaxy_planet galaxy_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet ALTER COLUMN galaxy_planet_id SET DEFAULT nextval('public.galaxy_planet_galaxy_planet_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_columnbody_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_body_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (7, 'Milky way', 13610, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Antennae', 13610, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Black eye', 13280, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 400, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Messier 63', 13280, NULL, NULL);
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 10100, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 13250, NULL, NULL);


--
-- Data for Name: galaxy_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_planet VALUES ('Earth', 7, 1, 1);
INSERT INTO public.galaxy_planet VALUES ('Mercury', 7, 2, 2);
INSERT INTO public.galaxy_planet VALUES ('Mars', 7, 4, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', false, 1, 384400.12);
INSERT INTO public.moon VALUES (2, 'lo', false, 5, 1000.12);
INSERT INTO public.moon VALUES (3, 'Europa', false, 5, 10000.23);
INSERT INTO public.moon VALUES (4, 'Phobos', false, 4, 2000.12);
INSERT INTO public.moon VALUES (5, 'Titan', false, 3, 1000.24);
INSERT INTO public.moon VALUES (6, 'Aegaeon', false, 6, 1000.33);
INSERT INTO public.moon VALUES (7, 'Triton', false, 8, 0.23);
INSERT INTO public.moon VALUES (8, 'Charon', false, 9, 0.23);
INSERT INTO public.moon VALUES (9, 'Oberon', false, 7, 0.23);
INSERT INTO public.moon VALUES (10, 'Ganymede', false, 5, 6283000.00);
INSERT INTO public.moon VALUES (11, 'Callisto', false, 5, 628300.00);
INSERT INTO public.moon VALUES (12, 'Themisto', false, 5, 615880.00);
INSERT INTO public.moon VALUES (13, 'Deimos', false, 4, 77790.00);
INSERT INTO public.moon VALUES (14, 'Miranda', false, 7, 2723.00);
INSERT INTO public.moon VALUES (15, 'Ariel', false, 7, 28031.00);
INSERT INTO public.moon VALUES (16, 'Mimas', false, 6, 1272.00);
INSERT INTO public.moon VALUES (17, 'Enceladus', false, 6, 1272.00);
INSERT INTO public.moon VALUES (18, 'Nereid', false, 8, 43295.00);
INSERT INTO public.moon VALUES (19, 'Halimede', false, 8, 43449.00);
INSERT INTO public.moon VALUES (20, 'Sao', false, 8, 43506.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4543, true, 13);
INSERT INTO public.planet VALUES (2, 'Mercury', 4503, true, 13);
INSERT INTO public.planet VALUES (3, 'Venus', 4503, true, 13);
INSERT INTO public.planet VALUES (4, 'Mars', 4603, true, 13);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4603, true, 13);
INSERT INTO public.planet VALUES (6, 'Saturn', 4503, true, 13);
INSERT INTO public.planet VALUES (7, 'Uranus', 4503, true, 13);
INSERT INTO public.planet VALUES (8, 'Neptune', 4503, true, 13);
INSERT INTO public.planet VALUES (9, 'Pluto', 4600, true, 13);
INSERT INTO public.planet VALUES (10, 'PA-99-N2', 0, true, 1);
INSERT INTO public.planet VALUES (11, 'CoRoT-7b', 1500, true, 15);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 4000, true, 17);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, '7 And', 'Andromedae is a single, yellow-white hued star in the northern constellation of Andromeda.', 1, NULL);
INSERT INTO public.star VALUES (2, '3 And', '3 Andromedae, abbreviated 3 And, is a single star in the northern constellation of Andromeda.', 1, NULL);
INSERT INTO public.star VALUES (3, 'HD 107418', 'HR 4699 is a single star in the southern constellation of Corvus. It is orange in hue and is dimly visible to the naked eye with an apparent visual magnitude of +5.14.', 2, NULL);
INSERT INTO public.star VALUES (4, 'VV Crv', 'VV Corvi is a close spectroscopic binary in teh constellation Corvus. It is also an eclipsing binary, varying from magnitude 5.19 to 5.34 over 3.145 days.', 2, NULL);
INSERT INTO public.star VALUES (5, '11 Com', '11 Comae Berenices is a binary star system in the northern constellation of Coma Berenices, located in the sky, east and slightly north of Denebola in Leo, but not nearly as far east as Virginis in Virgo.', 3, NULL);
INSERT INTO public.star VALUES (6, '36 Com', '36 Comae Berenices is a single star in the northern constellation of Coma Berenices. it is faintly visible to the naked eye with an apparent visual magnitude of 4.76', 3, NULL);
INSERT INTO public.star VALUES (7, '24 CVn', '24 Canum Venaticorum is a single star in the northern constellation of Canes Venatici, located 277 light years away from the sun.', 4, NULL);
INSERT INTO public.star VALUES (8, '20 CVn', '20 CVn Venaticorum is a single varaible star in the northern constellation of Canes Venatici, located 238 light years from the Sun.', 4, NULL);
INSERT INTO public.star VALUES (9, '109 Vir', '109 Virginies is a single, white-hued star in the zodiac constellation of Virgo, loacted some 134.5 light years aways from the sun.', 5, NULL);
INSERT INTO public.star VALUES (10, '110 Vir', '110 Virginis is a star in the zodiac constellation Virgo, loacted 195 light-year away from the sun', 5, NULL);
INSERT INTO public.star VALUES (11, '19 CVn', '19 Canum Venaticorum is a binary star system in the northern constellation of Canes Venatici, located approximately 238 light years form Sun based on its parallax.', 6, NULL);
INSERT INTO public.star VALUES (12, '10 CVn', '10 Canum Venaticorum is the Flamsteed designation for an ordinary star in the northern constellation of Canes Venatici.', 6, NULL);
INSERT INTO public.star VALUES (13, 'Sun', 'The Sun is the star at the center of the solor system', 7, NULL);
INSERT INTO public.star VALUES (14, 'Vega', 'Vega is the brightest star in the northern constellation of Lyra', 7, NULL);
INSERT INTO public.star VALUES (15, 'CoRoT-7', 'CoRoT-7 is a binary star system.  The primary, CoRoT-7A is a G-type main sequence star, slightly smaller, cooler, and younger than the Sun.', 7, 0.0);
INSERT INTO public.star VALUES (17, 'Kepler-22', 'Kepler-22 is a sun-like star in the northern constellaion of Cygnus, the swan, that is orbited by a planet found to be unequivocaaly within the star habitable zone', 7, 0.0);


--
-- Name: galaxy_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_body_id_seq', 7, true);


--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_planet_galaxy_planet_id_seq', 3, true);


--
-- Name: moon_columnbody_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_columnbody_id_seq', 20, true);


--
-- Name: planet_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_body_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 17, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_planet galaxy_planet_galaxy_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_galaxy_planet_id_key UNIQUE (galaxy_planet_id);


--
-- Name: galaxy_planet galaxy_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_pkey PRIMARY KEY (galaxy_planet_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: galaxy_planet galaxy_planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_planet galaxy_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

