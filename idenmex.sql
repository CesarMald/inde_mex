--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: banners; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE banners (
    id integer NOT NULL,
    title character varying,
    description character varying,
    link_url character varying,
    link_text character varying,
    banner_type character varying DEFAULT 'complete'::character varying,
    hover_title character varying,
    hover_description character varying,
    "position" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE banners OWNER TO "MayraCabrera";

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE banners_id_seq OWNER TO "MayraCabrera";

--
-- Name: banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE banners_id_seq OWNED BY banners.id;


--
-- Name: brand_sliders; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE brand_sliders (
    id integer NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE brand_sliders OWNER TO "MayraCabrera";

--
-- Name: brand_sliders_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE brand_sliders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brand_sliders_id_seq OWNER TO "MayraCabrera";

--
-- Name: brand_sliders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE brand_sliders_id_seq OWNED BY brand_sliders.id;


--
-- Name: brands; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE brands (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE brands OWNER TO "MayraCabrera";

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brands_id_seq OWNER TO "MayraCabrera";

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE brands_id_seq OWNED BY brands.id;


--
-- Name: collections; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE collections (
    id integer NOT NULL,
    name character varying,
    description character varying,
    text_link character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE collections OWNER TO "MayraCabrera";

--
-- Name: collections_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE collections_id_seq OWNER TO "MayraCabrera";

--
-- Name: collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE collections_id_seq OWNED BY collections.id;


--
-- Name: interior_builders; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE interior_builders (
    id integer NOT NULL,
    title character varying,
    description character varying,
    hover_title character varying,
    hover_description character varying,
    url_link character varying,
    "position" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE interior_builders OWNER TO "MayraCabrera";

--
-- Name: interior_builders_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE interior_builders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE interior_builders_id_seq OWNER TO "MayraCabrera";

--
-- Name: interior_builders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE interior_builders_id_seq OWNED BY interior_builders.id;


--
-- Name: line_items; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE line_items (
    id integer NOT NULL,
    product_id integer,
    order_id integer,
    quantity integer,
    total numeric DEFAULT 0.0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE line_items OWNER TO "MayraCabrera";

--
-- Name: line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE line_items_id_seq OWNER TO "MayraCabrera";

--
-- Name: line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE line_items_id_seq OWNED BY line_items.id;


--
-- Name: models; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE models (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    brand_id integer
);


ALTER TABLE models OWNER TO "MayraCabrera";

--
-- Name: models_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE models_id_seq OWNER TO "MayraCabrera";

--
-- Name: models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE models_id_seq OWNED BY models.id;


--
-- Name: newsletters; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE newsletters (
    id integer NOT NULL,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE newsletters OWNER TO "MayraCabrera";

--
-- Name: newsletters_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE newsletters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsletters_id_seq OWNER TO "MayraCabrera";

--
-- Name: newsletters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE newsletters_id_seq OWNED BY newsletters.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE orders (
    id integer NOT NULL,
    total numeric DEFAULT 0.0,
    user_id integer,
    subtotal numeric DEFAULT 0.0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status character varying DEFAULT 'in_progress'::character varying,
    seen boolean DEFAULT false
);


ALTER TABLE orders OWNER TO "MayraCabrera";

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO "MayraCabrera";

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: pictures; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE pictures (
    id integer NOT NULL,
    picturable_id integer,
    picturable_type character varying,
    image character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE pictures OWNER TO "MayraCabrera";

--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pictures_id_seq OWNER TO "MayraCabrera";

--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE pictures_id_seq OWNED BY pictures.id;


--
-- Name: product_connections; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE product_connections (
    product_a_id integer NOT NULL,
    product_b_id integer NOT NULL
);


ALTER TABLE product_connections OWNER TO "MayraCabrera";

--
-- Name: products; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE products (
    id integer NOT NULL,
    model_id integer,
    name character varying,
    code character varying,
    regular_price numeric,
    offer_price numeric,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    collection_id integer,
    on_offer boolean DEFAULT false,
    premium_price numeric
);


ALTER TABLE products OWNER TO "MayraCabrera";

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_id_seq OWNER TO "MayraCabrera";

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "MayraCabrera";

--
-- Name: slider_brand_items; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE slider_brand_items (
    id integer NOT NULL,
    slider_id integer,
    brand_id integer,
    url_link character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE slider_brand_items OWNER TO "MayraCabrera";

--
-- Name: slider_brand_items_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE slider_brand_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE slider_brand_items_id_seq OWNER TO "MayraCabrera";

--
-- Name: slider_brand_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE slider_brand_items_id_seq OWNED BY slider_brand_items.id;


--
-- Name: slider_brands; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE slider_brands (
    id integer NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE slider_brands OWNER TO "MayraCabrera";

--
-- Name: slider_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE slider_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE slider_brands_id_seq OWNER TO "MayraCabrera";

--
-- Name: slider_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE slider_brands_id_seq OWNED BY slider_brands.id;


--
-- Name: sliders; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE sliders (
    id integer NOT NULL,
    title character varying,
    url_link character varying,
    description character varying,
    link_text character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE sliders OWNER TO "MayraCabrera";

--
-- Name: sliders_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE sliders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sliders_id_seq OWNER TO "MayraCabrera";

--
-- Name: sliders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE sliders_id_seq OWNED BY sliders.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: MayraCabrera
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    role character varying DEFAULT 'regular'::character varying,
    phone_number character varying,
    address character varying,
    cell_phone character varying,
    company character varying,
    hear_about_us character varying,
    subscribed_to_newsletter boolean DEFAULT false,
    status character varying DEFAULT 'inactive'::character varying
);


ALTER TABLE users OWNER TO "MayraCabrera";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: MayraCabrera
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "MayraCabrera";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MayraCabrera
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY banners ALTER COLUMN id SET DEFAULT nextval('banners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY brand_sliders ALTER COLUMN id SET DEFAULT nextval('brand_sliders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY brands ALTER COLUMN id SET DEFAULT nextval('brands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY collections ALTER COLUMN id SET DEFAULT nextval('collections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY interior_builders ALTER COLUMN id SET DEFAULT nextval('interior_builders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY line_items ALTER COLUMN id SET DEFAULT nextval('line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY models ALTER COLUMN id SET DEFAULT nextval('models_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY newsletters ALTER COLUMN id SET DEFAULT nextval('newsletters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY pictures ALTER COLUMN id SET DEFAULT nextval('pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY slider_brand_items ALTER COLUMN id SET DEFAULT nextval('slider_brand_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY slider_brands ALTER COLUMN id SET DEFAULT nextval('slider_brands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY sliders ALTER COLUMN id SET DEFAULT nextval('sliders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY banners (id, title, description, link_url, link_text, banner_type, hover_title, hover_description, "position", created_at, updated_at) FROM stdin;
2	Cargador para iphone 5 y modelos posteriores	Disponible en varios colores, busca el que mas vaya con tu estilo #idenmexMyStyle	google.com	Book a tour	complete	lorem ipsum atom	generando reacciones, compartiendo tu estilo	second	2016-04-23 23:29:54.290558	2016-04-23 23:29:54.290558
4	Cartera para iphone6/iphone 6s	Disponible también para otros modelos haz click y busca el tuyo	google.com		half	loremp ipsum atom	generando reacciones, compartiendo tu estilo	fourth	2016-04-23 23:29:54.295033	2016-04-23 23:29:54.295033
3	¿quieres vender nuestros productoss	Inscríbete con nosotros y empieza ahora mismo tu propio negocio, es fácil y rápido, solo haz click	google.com		half	Lorem Ipsum Atom	generando reacciones, compartiendo tu estilo	third	2016-04-23 23:29:54.292672	2016-04-24 00:24:35.694057
1	tpu mickey y minnie mouse para iphone 678	Si yo fuera tu igual y se lo compro a mi novia, total dura más que un ramo de flores...#todoPorAmor.	google.com	Just get it	complete	Lorem Ipsum Atom	generando reacciones, compartiendo tu estilo	first	2016-04-23 23:29:54.287888	2016-04-28 02:57:42.758254
\.


--
-- Name: banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('banners_id_seq', 4, true);


--
-- Data for Name: brand_sliders; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY brand_sliders (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: brand_sliders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('brand_sliders_id_seq', 1, false);


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY brands (id, name, created_at, updated_at) FROM stdin;
10	Motorola	2016-04-24 22:02:16.020404	2016-04-24 22:02:16.020404
11	Apple	2016-04-24 22:02:16.05681	2016-04-24 22:02:16.05681
12	LG	2016-04-24 22:02:16.059505	2016-04-24 22:02:16.059505
13	Samsung	2016-04-24 22:02:16.061422	2016-04-24 22:02:16.061422
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('brands_id_seq', 13, true);


--
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY collections (id, name, description, text_link, created_at, updated_at) FROM stdin;
14	cargadores domésticos	\N	#buscandomiestilo	2016-04-24 22:02:16.301932	2016-04-24 22:02:16.301932
15	cargadores para autos	\N	#buscandomiestilo	2016-04-24 22:02:16.304815	2016-04-24 22:02:16.304815
16	protectores de pantalla	\N	#buscandomiestilo	2016-04-24 22:02:16.306731	2016-04-24 22:02:16.306731
17	carcasas	\N	#buscandomiestilo	2016-04-24 22:02:16.308616	2016-04-24 22:02:16.308616
18	fundas de uso rudo	\N	#buscandomiestilo	2016-04-24 22:02:16.310359	2016-04-24 22:02:16.310359
19	fundas gummy tuff	\N	#buscandomiestilo	2016-04-24 22:02:16.312187	2016-04-24 22:02:16.312187
20	cables, datos y audio	\N	#buscandomiestilo	2016-04-24 22:02:16.314425	2016-04-24 22:02:16.314425
21	funda cartera	\N	#buscandomiestilo	2016-04-24 22:02:16.316608	2016-04-24 22:02:16.316608
\.


--
-- Name: collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('collections_id_seq', 21, true);


--
-- Data for Name: interior_builders; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY interior_builders (id, title, description, hover_title, hover_description, url_link, "position", created_at, updated_at) FROM stdin;
1	¿Quieres vender nuestros productos?	Inscríbete con nosotros y empieza ahora mismo tu propio negocio, es fácil y rápido, solo haz clic.	lorem ipsum atom	generando reacciones, compartiendo tu estilo	google.com	first	2016-05-08 02:07:05.369224	2016-05-08 02:07:05.369224
2	Cartera para Iphone 6 / Iphone 6s	Disponible tambien para otros modelos, haz clic y busca el tuyo.	lorem ipsum atom	generando reacciones, compartiendo tu estilo	google.com	second	2016-05-08 02:07:11.965898	2016-05-08 02:07:11.965898
\.


--
-- Name: interior_builders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('interior_builders_id_seq', 2, true);


--
-- Data for Name: line_items; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY line_items (id, product_id, order_id, quantity, total, created_at, updated_at) FROM stdin;
1	5	1	3	150.0	2016-05-07 19:55:42.289755	2016-05-07 19:55:42.289755
4	4	2	11	550.0	2016-05-07 20:20:11.058967	2016-05-07 20:57:04.014653
5	5	3	5	250.0	2016-05-07 20:59:42.644849	2016-05-07 21:20:52.31869
6	5	4	13	650.0	2016-05-07 21:34:53.457757	2016-05-07 21:47:21.038146
7	2	4	3	480.0	2016-05-07 21:47:36.178497	2016-05-07 21:47:36.178497
8	5	5	10	500.0	2016-05-07 22:51:21.850368	2016-05-07 22:51:21.850368
9	4	5	10	500.0	2016-05-07 22:51:30.201754	2016-05-07 22:51:30.201754
10	5	7	11	550.0	2016-05-07 23:16:03.144268	2016-05-07 23:16:03.144268
11	2	7	10	1600.0	2016-05-07 23:16:08.536348	2016-05-07 23:16:08.536348
12	5	8	11	550.0	2016-05-07 23:17:00.828191	2016-05-07 23:17:00.828191
13	4	9	11	550.0	2016-05-07 23:19:04.685599	2016-05-07 23:19:04.685599
14	1	10	10	500.0	2016-05-07 23:22:07.30951	2016-05-07 23:22:07.30951
15	4	11	10	500.0	2016-05-07 23:45:20.251737	2016-05-07 23:45:20.251737
16	3	11	4	602.4	2016-05-07 23:45:29.460919	2016-05-07 23:45:29.460919
\.


--
-- Name: line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('line_items_id_seq', 16, true);


--
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY models (id, name, created_at, updated_at, brand_id) FROM stdin;
22	Iphone 6	2016-04-24 22:02:16.203128	2016-04-24 22:02:16.203128	11
23	S6 EDGE	2016-04-24 22:02:16.224829	2016-04-24 22:02:16.224829	11
24	iphone 4 / 4s	2016-04-24 22:02:16.229757	2016-04-24 22:02:16.229757	11
25	iphone 5 / 5s	2016-04-24 22:02:16.235602	2016-04-24 22:02:16.235602	11
26	iphone 5c	2016-04-24 22:02:16.239411	2016-04-24 22:02:16.239411	11
27	g3	2016-04-24 22:02:16.243087	2016-04-24 22:02:16.243087	12
28	g3 stylus	2016-04-24 22:02:16.246964	2016-04-24 22:02:16.246964	12
29	g4 stylus	2016-04-24 22:02:16.250243	2016-04-24 22:02:16.250243	12
30	magna	2016-04-24 22:02:16.254202	2016-04-24 22:02:16.254202	12
31	moto g	2016-04-24 22:02:16.257949	2016-04-24 22:02:16.257949	10
32	moto g2	2016-04-24 22:02:16.261148	2016-04-24 22:02:16.261148	10
33	moto g3	2016-04-24 22:02:16.264258	2016-04-24 22:02:16.264258	10
34	moto x force	2016-04-24 22:02:16.267524	2016-04-24 22:02:16.267524	10
35	moto x play	2016-04-24 22:02:16.272452	2016-04-24 22:02:16.272452	10
36	galaxy s4	2016-04-24 22:02:16.276563	2016-04-24 22:02:16.276563	13
37	galaxy s5	2016-04-24 22:02:16.279956	2016-04-24 22:02:16.279956	13
38	galaxy s6	2016-04-24 22:02:16.283723	2016-04-24 22:02:16.283723	13
39	galaxy s6 edge	2016-04-24 22:02:16.287947	2016-04-24 22:02:16.287947	13
40	s6 edge plus	2016-04-24 22:02:16.291791	2016-04-24 22:02:16.291791	13
\.


--
-- Name: models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('models_id_seq', 40, true);


--
-- Data for Name: newsletters; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY newsletters (id, email, created_at, updated_at) FROM stdin;
1	mayra@email.com	2016-05-08 03:48:24.700022	2016-05-08 03:48:24.700022
\.


--
-- Name: newsletters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('newsletters_id_seq', 1, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY orders (id, total, user_id, subtotal, created_at, updated_at, status, seen) FROM stdin;
6	0.0	3	0.0	2016-05-07 22:51:38.051734	2016-05-07 22:51:38.051734	in_progress	f
12	0.0	3	0.0	2016-05-07 23:45:37.914245	2016-05-07 23:45:37.914245	in_progress	f
13	0.0	2	0.0	2016-05-08 01:13:53.397455	2016-05-08 01:13:53.397455	in_progress	f
5	1160.0	3	1000.0	2016-05-07 22:32:20.68508	2016-05-08 00:33:47.339554	completed	f
7	2494.0	3	2150.0	2016-05-07 23:15:55.020659	2016-05-08 00:33:47.345758	completed	f
8	638.0	3	550.0	2016-05-07 23:16:14.92355	2016-05-08 00:33:47.34977	completed	f
14	0.0	2	0.0	2016-05-08 01:13:54.320705	2016-05-08 01:13:54.320705	in_progress	f
10	580.0	3	500.0	2016-05-07 23:21:52.205247	2016-05-08 00:33:47.360728	completed	f
11	1278.784	3	1102.4	2016-05-07 23:22:15.91002	2016-05-08 00:33:47.364679	completed	f
9	638.0	3	550.0	2016-05-07 23:17:07.463606	2016-05-08 00:38:16.78271	completed	t
4	1310.8	3	1130.0	2016-05-07 21:34:42.018237	2016-05-08 00:48:33.569712	completed	t
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('orders_id_seq', 14, true);


--
-- Data for Name: pictures; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY pictures (id, picturable_id, picturable_type, image, created_at, updated_at) FROM stdin;
30	16	SliderBrandItem	Screen_Shot_2016-04-19_at_12.25.30_PM.png	2016-04-23 22:45:37.185796	2016-04-23 22:45:37.185796
37	4	Product	GOTSCREEN.jpg	2016-04-24 01:23:35.29755	2016-04-24 01:23:35.29755
39	52	Slider	01-collection-rudo.jpg	2016-04-27 03:00:53.083869	2016-04-27 03:00:53.083869
40	53	Slider	01-slider01.jpg	2016-04-27 03:04:41.02429	2016-04-27 03:04:41.02429
41	54	Slider	01-slider01.jpg	2016-04-27 03:04:49.273121	2016-04-27 03:04:49.273121
42	55	Slider	01-slider01.jpg	2016-04-27 03:04:56.152057	2016-04-27 03:04:56.152057
43	1	SliderBrandItem	icon-apple.png	2016-04-27 03:33:03.124634	2016-04-27 03:33:03.124634
44	2	SliderBrandItem	icon-lg.png	2016-04-27 03:33:03.133782	2016-04-27 03:33:03.133782
45	3	SliderBrandItem	icon-samsung.png	2016-04-27 03:34:13.789836	2016-04-27 03:34:13.789836
46	4	SliderBrandItem	icon-motorola.png	2016-04-27 03:34:13.7937	2016-04-27 03:34:13.7937
47	5	SliderBrandItem	icon-samsung.png	2016-04-27 03:49:33.006112	2016-04-27 03:49:33.006112
32	1	Banner	01-banner01.jpg	2016-04-24 00:19:39.083574	2016-04-28 02:57:42.761552
48	2	Banner	01-banner02.jpg	2016-04-28 02:57:57.223072	2016-04-28 02:57:57.223072
49	3	Banner	01-banner04.jpg	2016-04-28 02:58:07.072438	2016-04-28 02:58:07.072438
50	4	Banner	01-banner05.jpg	2016-04-28 02:58:16.20643	2016-04-28 02:58:16.20643
51	1	Product	DockerRegionoletra.png	2016-05-02 23:38:15.36083	2016-05-02 23:38:15.36083
52	1	Product	GOTSCREEN.jpg	2016-05-02 23:38:20.024162	2016-05-02 23:38:20.024162
38	51	Slider	01-slider01.jpg	2016-04-27 02:59:21.697565	2016-05-06 00:26:43.301332
53	2	User	profile_small.jpg	2016-05-07 18:05:57.402369	2016-05-07 18:05:57.402369
54	1	InteriorBuilder	01-banner04.jpg	2016-05-08 02:09:15.759185	2016-05-08 02:09:15.759185
55	2	InteriorBuilder	01-banner05.jpg	2016-05-08 02:09:26.148205	2016-05-08 02:09:26.148205
\.


--
-- Name: pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('pictures_id_seq', 55, true);


--
-- Data for Name: product_connections; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY product_connections (product_a_id, product_b_id) FROM stdin;
2	1
3	1
1	2
4	3
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY products (id, model_id, name, code, regular_price, offer_price, description, created_at, updated_at, collection_id, on_offer, premium_price) FROM stdin;
5	22	Productirijillo	X1235TRQWE	100.0	50.0	holi	2016-04-24 19:42:31.308624	2016-04-28 02:53:51.293727	1	f	30.0
2	22	Productirijillo 2 buscame	123CDEOPUR	200.0	160.0	adsfasdfadsf	2016-04-03 23:00:56.991836	2016-05-03 03:40:55.009041	20	f	50.0
3	22	otro productirijillo	XXXXX	300.0	150.6	holi	2016-04-10 19:46:54.420485	2016-05-03 03:41:25.092418	20	f	30.0
4	22	Productirijillo	adsfadsfasdfadsf	100.0	50.0		2016-04-24 01:23:13.662762	2016-05-07 18:33:01.096543	20	t	30.0
1	22	Un productirijillo asdfasdf	123123123123	100.0	50.0	holiadsfasdfasdfasdf	2016-03-27 20:16:07.442532	2016-05-08 01:07:41.430301	20	t	30.0
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('products_id_seq', 5, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY schema_migrations (version) FROM stdin;
20160321002023
20160321002033
20160321002048
20160321002213
20160322000251
20160327200318
20160403175548
20160403212918
20160404000743
20160404002119
20160410183119
20160410184757
20160411004343
20160414024545
20160420033713
20160420034803
20160420034107
20160423230108
20160424193435
20160507162139
20160321002122
20160321002104
20160507183943
20160508002134
20160508010932
20160508015149
20160508033815
\.


--
-- Data for Name: slider_brand_items; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY slider_brand_items (id, slider_id, brand_id, url_link, created_at, updated_at) FROM stdin;
1	9	11	google.com	2016-04-23 23:29:54.275989	2016-04-27 03:33:03.121785
2	9	12	google.com	2016-04-27 03:33:03.130102	2016-04-27 03:33:03.130102
3	9	13	google.com	2016-04-27 03:34:13.78847	2016-04-27 03:34:13.78847
4	9	10	google.com	2016-04-27 03:34:13.792285	2016-04-27 03:34:13.792285
5	9	11	google.com	2016-04-27 03:49:33.003259	2016-04-27 03:49:33.003259
\.


--
-- Name: slider_brand_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('slider_brand_items_id_seq', 5, true);


--
-- Data for Name: slider_brands; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY slider_brands (id, name, description, created_at, updated_at) FROM stdin;
9	#MYBRAND	Escoge tu marca de tu equipo, elige tu modelo y empieza a comprar.	2016-04-23 23:29:54.229545	2016-04-23 23:29:54.229545
\.


--
-- Name: slider_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('slider_brands_id_seq', 9, true);


--
-- Data for Name: sliders; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY sliders (id, title, url_link, description, link_text, created_at, updated_at) FROM stdin;
52	Foundry brings your content to life in stunning clarity	google.com	Build beautiful, contemporary sites in just moments	Start Exploring	2016-04-23 23:29:54.170434	2016-04-27 03:00:53.06097
51	Sleek, Intuitive & Performant, It's your design toolkit.	google.com	Build beautiful, contemporary sites in just moments with Foundry and Variant Page Build	Start exploring	2016-04-23 23:29:54.164818	2016-04-23 23:29:54.164818
53	Sleek, Intuitive & Performant, It's your design toolkit.	google.com	Build beautiful, contemporary sites in just moments with Foundry and Variant Page Build	Start exploring	2016-04-23 23:29:54.17499	2016-04-23 23:29:54.17499
54	Sleek, Intuitive & Performant, It's your design toolkit.	google.com	Build beautiful, contemporary sites in just moments with Foundry and Variant Page Build	Start exploring	2016-04-23 23:29:54.177669	2016-04-23 23:29:54.177669
55	Sleek, Intuitive & Performant, It's your design toolkit.	google.com	Build beautiful, contemporary sites in just moments with Foundry and Variant Page Build	Start exploring	2016-04-23 23:29:54.179918	2016-04-23 23:29:54.179918
\.


--
-- Name: sliders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('sliders_id_seq', 55, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: MayraCabrera
--

COPY users (id, first_name, last_name, email, created_at, updated_at, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, role, phone_number, address, cell_phone, company, hear_about_us, subscribed_to_newsletter, status) FROM stdin;
9	Nayelli	Martinez	nayelli@antidoto.mx	2016-05-07 17:18:00.576311	2016-05-07 18:13:19.91162	$2a$10$WGjEyd12scFDZ1tgJ0l.aup17/WerDlaJqqFMPipNyrxZ5YY7OpQy	\N	\N	\N	1	2016-05-07 18:12:58.445266	2016-05-07 18:12:58.445266	::1	::1	regular					facebook	f	inactive
3	Carlos	Escalera	ca.escalera@gmail.com	2016-04-03 23:20:20.670303	2016-05-07 23:56:51.558109	$2a$10$yEipbYB8AKa6cRM/8KzIzeUYjH85J10wgjxpHR52MmhV943RVNs8i	\N	\N	\N	23	2016-05-07 23:21:52.082412	2016-05-07 23:15:54.953617	::1	::1	regular	\N	\N	\N	\N	\N	f	active
2	Mayraa	Cabrera	mcabrera1087@gmail.com	2016-04-03 18:05:14.971915	2016-05-07 23:58:28.288789	$2a$10$avhAzd4sb3trD5KY4DfTsul6cPUjDzhNyXL/flEpK8gdpvuQxoIE.	\N	\N	\N	36	2016-05-07 23:58:28.282113	2016-05-07 18:32:43.848518	::1	::1	admin	\N	Avenida siempre viva	\N	icalia	facebook	t	active
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MayraCabrera
--

SELECT pg_catalog.setval('users_id_seq', 9, true);


--
-- Name: banners_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: brand_sliders_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY brand_sliders
    ADD CONSTRAINT brand_sliders_pkey PRIMARY KEY (id);


--
-- Name: brands_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: collections_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (id);


--
-- Name: interior_builders_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY interior_builders
    ADD CONSTRAINT interior_builders_pkey PRIMARY KEY (id);


--
-- Name: line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT line_items_pkey PRIMARY KEY (id);


--
-- Name: models_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- Name: newsletters_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY newsletters
    ADD CONSTRAINT newsletters_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: slider_brand_items_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY slider_brand_items
    ADD CONSTRAINT slider_brand_items_pkey PRIMARY KEY (id);


--
-- Name: slider_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY slider_brands
    ADD CONSTRAINT slider_brands_pkey PRIMARY KEY (id);


--
-- Name: sliders_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY sliders
    ADD CONSTRAINT sliders_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: MayraCabrera
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: MayraCabrera
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: MayraCabrera
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: MayraCabrera
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: MayraCabrera
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "MayraCabrera";
GRANT ALL ON SCHEMA public TO "MayraCabrera";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

