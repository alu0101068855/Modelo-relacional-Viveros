--
-- PostgreSQL database dump
--

-- Dumped from database version 10.22 (Ubuntu 10.22-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.22 (Ubuntu 10.22-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: vivero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vivero (
    codv integer NOT NULL,
    nombrev character varying(255) NOT NULL
);


ALTER TABLE public.vivero OWNER TO postgres;

--
-- Name: vivero_codv_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vivero_codv_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vivero_codv_seq OWNER TO postgres;

--
-- Name: vivero_codv_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vivero_codv_seq OWNED BY public.vivero.codv;


--
-- Name: zona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zona (
    codz integer NOT NULL,
    tipoz character varying(255) NOT NULL,
    productividadz integer,
    codv integer NOT NULL
);


ALTER TABLE public.zona OWNER TO postgres;

--
-- Name: zona_codz_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.zona_codz_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zona_codz_seq OWNER TO postgres;

--
-- Name: zona_codz_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zona_codz_seq OWNED BY public.zona.codz;


--
-- Name: vivero codv; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vivero ALTER COLUMN codv SET DEFAULT nextval('public.vivero_codv_seq'::regclass);


--
-- Name: zona codz; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zona ALTER COLUMN codz SET DEFAULT nextval('public.zona_codz_seq'::regclass);


--
-- Data for Name: vivero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vivero (codv, nombrev) FROM stdin;
1	Vivero1
2	ViveroMarcos
3	ViveroHector
4	ViveroRamon
5	ViveroJoseCarlos
\.


--
-- Data for Name: zona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zona (codz, tipoz, productividadz, codv) FROM stdin;
1	Exterior	10	1
2	Interior	5	2
3	Cajas	7	3
4	Almacen	6	4
5	Exterior	9	5
\.


--
-- Name: vivero_codv_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vivero_codv_seq', 5, true);


--
-- Name: zona_codz_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zona_codz_seq', 5, true);


--
-- Name: vivero vivero_nombrev_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vivero
    ADD CONSTRAINT vivero_nombrev_key UNIQUE (nombrev);


--
-- Name: vivero vivero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vivero
    ADD CONSTRAINT vivero_pkey PRIMARY KEY (codv);


--
-- Name: zona zona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zona
    ADD CONSTRAINT zona_pkey PRIMARY KEY (codz);


--
-- Name: zona zona_codv_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zona
    ADD CONSTRAINT zona_codv_fkey FOREIGN KEY (codv) REFERENCES public.vivero(codv);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.22 (Ubuntu 10.22-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.22 (Ubuntu 10.22-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    dnic character varying(9) NOT NULL,
    abonado boolean DEFAULT false NOT NULL,
    bonificacion integer DEFAULT 0,
    CONSTRAINT ck_bonificacion CHECK (
CASE
    WHEN (abonado = false) THEN (bonificacion = 0)
    ELSE NULL::boolean
END)
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    dnie character varying(9) NOT NULL,
    productividade integer NOT NULL,
    seguimiento character varying(255) NOT NULL,
    codz integer NOT NULL
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido (
    cantidad integer NOT NULL,
    fechacompra date DEFAULT CURRENT_DATE NOT NULL,
    codp integer NOT NULL,
    dnie character varying(9) NOT NULL,
    dnic character varying(9) NOT NULL
);


ALTER TABLE public.pedido OWNER TO postgres;

--
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    codp integer NOT NULL,
    disponibilidad integer NOT NULL,
    codz integer NOT NULL
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- Name: producto_codp_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_codp_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_codp_seq OWNER TO postgres;

--
-- Name: producto_codp_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_codp_seq OWNED BY public.producto.codp;


--
-- Name: vivero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vivero (
    codv integer NOT NULL,
    nombrev character varying(255) NOT NULL
);


ALTER TABLE public.vivero OWNER TO postgres;

--
-- Name: vivero_codv_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vivero_codv_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vivero_codv_seq OWNER TO postgres;

--
-- Name: vivero_codv_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vivero_codv_seq OWNED BY public.vivero.codv;


--
-- Name: zona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zona (
    codz integer NOT NULL,
    tipoz character varying(255) NOT NULL,
    productividadz integer,
    codv integer NOT NULL
);


ALTER TABLE public.zona OWNER TO postgres;

--
-- Name: zona_codz_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.zona_codz_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zona_codz_seq OWNER TO postgres;

--
-- Name: zona_codz_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zona_codz_seq OWNED BY public.zona.codz;


--
-- Name: producto codp; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN codp SET DEFAULT nextval('public.producto_codp_seq'::regclass);


--
-- Name: vivero codv; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vivero ALTER COLUMN codv SET DEFAULT nextval('public.vivero_codv_seq'::regclass);


--
-- Name: zona codz; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zona ALTER COLUMN codz SET DEFAULT nextval('public.zona_codz_seq'::regclass);


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (dnic, abonado, bonificacion) FROM stdin;
43835202P	t	20
22222222B	t	25
11111111A	f	0
44444444d	f	0
33333333c	f	0
\.


--
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado (dnie, productividade, seguimiento, codz) FROM stdin;
12345678A	10	Bueno	1
87654321B	5	Excelente	2
43215678C	25	Malo	3
56784321D	15	Normal	4
12341234E	16	Bueno	5
\.


--
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido (cantidad, fechacompra, codp, dnie, dnic) FROM stdin;
1	2022-11-02	1	12345678A	11111111A
2	2022-11-02	2	87654321B	22222222B
3	2022-11-02	3	43215678C	33333333c
4	2022-11-02	4	56784321D	44444444d
5	2022-11-02	5	12341234E	33333333c
\.


--
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (codp, disponibilidad, codz) FROM stdin;
1	10	1
2	9	2
3	8	3
4	5	4
5	6	5
\.


--
-- Data for Name: vivero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vivero (codv, nombrev) FROM stdin;
1	Vivero1
2	ViveroMarcos
3	ViveroHector
4	ViveroRamon
5	ViveroJoseCarlos
\.


--
-- Data for Name: zona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zona (codz, tipoz, productividadz, codv) FROM stdin;
1	Exterior	10	1
2	Interior	5	2
3	Cajas	7	3
4	Almacen	6	4
5	Exterior	9	5
\.


--
-- Name: producto_codp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_codp_seq', 5, true);


--
-- Name: vivero_codv_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vivero_codv_seq', 5, true);


--
-- Name: zona_codz_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zona_codz_seq', 5, true);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (dnic);


--
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (dnie);


--
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (codp, dnie, dnic);


--
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (codp);


--
-- Name: vivero vivero_nombrev_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vivero
    ADD CONSTRAINT vivero_nombrev_key UNIQUE (nombrev);


--
-- Name: vivero vivero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vivero
    ADD CONSTRAINT vivero_pkey PRIMARY KEY (codv);


--
-- Name: zona zona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zona
    ADD CONSTRAINT zona_pkey PRIMARY KEY (codz);


--
-- Name: empleado empleado_codz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_codz_fkey FOREIGN KEY (codz) REFERENCES public.zona(codz);


--
-- Name: pedido pedido_codp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_codp_fkey FOREIGN KEY (codp) REFERENCES public.producto(codp);


--
-- Name: pedido pedido_dnic_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_dnic_fkey FOREIGN KEY (dnic) REFERENCES public.cliente(dnic);


--
-- Name: pedido pedido_dnie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_dnie_fkey FOREIGN KEY (dnie) REFERENCES public.empleado(dnie);


--
-- Name: producto producto_codz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_codz_fkey FOREIGN KEY (codz) REFERENCES public.zona(codz);


--
-- Name: zona zona_codv_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zona
    ADD CONSTRAINT zona_codv_fkey FOREIGN KEY (codv) REFERENCES public.vivero(codv);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.22 (Ubuntu 10.22-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.22 (Ubuntu 10.22-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    dnic character varying(9) NOT NULL,
    abonado boolean DEFAULT false NOT NULL,
    bonificacion integer DEFAULT 0,
    CONSTRAINT ck_bonificacion CHECK (
CASE
    WHEN (abonado = false) THEN (bonificacion = 0)
    ELSE NULL::boolean
END)
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    dnie character varying(9) NOT NULL,
    productividade integer NOT NULL,
    seguimiento character varying(255) NOT NULL,
    codz integer NOT NULL
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido (
    cantidad integer NOT NULL,
    fechacompra date DEFAULT CURRENT_DATE NOT NULL,
    codp integer NOT NULL,
    dnie character varying(9) NOT NULL,
    dnic character varying(9) NOT NULL
);


ALTER TABLE public.pedido OWNER TO postgres;

--
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    codp integer NOT NULL,
    disponibilidad integer NOT NULL,
    codz integer NOT NULL
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- Name: producto_codp_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_codp_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_codp_seq OWNER TO postgres;

--
-- Name: producto_codp_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_codp_seq OWNED BY public.producto.codp;


--
-- Name: vivero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vivero (
    codv integer NOT NULL,
    nombrev character varying(255) NOT NULL
);


ALTER TABLE public.vivero OWNER TO postgres;

--
-- Name: vivero_codv_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vivero_codv_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vivero_codv_seq OWNER TO postgres;

--
-- Name: vivero_codv_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vivero_codv_seq OWNED BY public.vivero.codv;


--
-- Name: zona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zona (
    codz integer NOT NULL,
    tipoz character varying(255) NOT NULL,
    productividadz integer,
    codv integer NOT NULL
);


ALTER TABLE public.zona OWNER TO postgres;

--
-- Name: zona_codz_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.zona_codz_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zona_codz_seq OWNER TO postgres;

--
-- Name: zona_codz_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zona_codz_seq OWNED BY public.zona.codz;


--
-- Name: producto codp; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN codp SET DEFAULT nextval('public.producto_codp_seq'::regclass);


--
-- Name: vivero codv; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vivero ALTER COLUMN codv SET DEFAULT nextval('public.vivero_codv_seq'::regclass);


--
-- Name: zona codz; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zona ALTER COLUMN codz SET DEFAULT nextval('public.zona_codz_seq'::regclass);


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (dnic, abonado, bonificacion) FROM stdin;
43835202P	t	20
22222222B	t	25
11111111A	f	0
44444444d	f	0
33333333c	f	0
\.


--
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado (dnie, productividade, seguimiento, codz) FROM stdin;
12345678A	10	Bueno	1
87654321B	5	Excelente	2
43215678C	25	Malo	3
56784321D	15	Normal	4
12341234E	16	Bueno	5
\.


--
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido (cantidad, fechacompra, codp, dnie, dnic) FROM stdin;
1	2022-11-02	1	12345678A	11111111A
2	2022-11-02	2	87654321B	22222222B
3	2022-11-02	3	43215678C	33333333c
4	2022-11-02	4	56784321D	44444444d
5	2022-11-02	5	12341234E	33333333c
\.


--
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (codp, disponibilidad, codz) FROM stdin;
1	10	1
2	9	2
3	8	3
4	5	4
5	6	5
\.


--
-- Data for Name: vivero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vivero (codv, nombrev) FROM stdin;
1	Vivero1
2	ViveroMarcos
3	ViveroHector
4	ViveroRamon
5	ViveroJoseCarlos
\.


--
-- Data for Name: zona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zona (codz, tipoz, productividadz, codv) FROM stdin;
1	Exterior	10	1
2	Interior	5	2
3	Cajas	7	3
4	Almacen	6	4
5	Exterior	9	5
\.


--
-- Name: producto_codp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_codp_seq', 5, true);


--
-- Name: vivero_codv_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vivero_codv_seq', 5, true);


--
-- Name: zona_codz_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zona_codz_seq', 5, true);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (dnic);


--
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (dnie);


--
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (codp, dnie, dnic);


--
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (codp);


--
-- Name: vivero vivero_nombrev_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vivero
    ADD CONSTRAINT vivero_nombrev_key UNIQUE (nombrev);


--
-- Name: vivero vivero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vivero
    ADD CONSTRAINT vivero_pkey PRIMARY KEY (codv);


--
-- Name: zona zona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zona
    ADD CONSTRAINT zona_pkey PRIMARY KEY (codz);


--
-- Name: empleado empleado_codz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_codz_fkey FOREIGN KEY (codz) REFERENCES public.zona(codz);


--
-- Name: pedido pedido_codp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_codp_fkey FOREIGN KEY (codp) REFERENCES public.producto(codp);


--
-- Name: pedido pedido_dnic_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_dnic_fkey FOREIGN KEY (dnic) REFERENCES public.cliente(dnic);


--
-- Name: pedido pedido_dnie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_dnie_fkey FOREIGN KEY (dnie) REFERENCES public.empleado(dnie);


--
-- Name: producto producto_codz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_codz_fkey FOREIGN KEY (codz) REFERENCES public.zona(codz);


--
-- Name: zona zona_codv_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zona
    ADD CONSTRAINT zona_codv_fkey FOREIGN KEY (codv) REFERENCES public.vivero(codv);


--
-- PostgreSQL database dump complete
--

