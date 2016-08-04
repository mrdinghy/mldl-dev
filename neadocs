--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: books; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE books (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.books OWNER TO smetzger;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO smetzger;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: chapters; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE chapters (
    id integer NOT NULL,
    name character varying,
    body text,
    ordernum double precision,
    book_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.chapters OWNER TO smetzger;

--
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE chapters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chapters_id_seq OWNER TO smetzger;

--
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE chapters_id_seq OWNED BY chapters.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    commentable_id integer,
    commentable_type character varying,
    title character varying,
    body text,
    subject character varying,
    user_id integer NOT NULL,
    parent_id integer,
    lft integer,
    rgt integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.comments OWNER TO smetzger;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO smetzger;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: imagesets; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE imagesets (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.imagesets OWNER TO smetzger;

--
-- Name: imagesets_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE imagesets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imagesets_id_seq OWNER TO smetzger;

--
-- Name: imagesets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE imagesets_id_seq OWNED BY imagesets.id;


--
-- Name: levels; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE levels (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.levels OWNER TO smetzger;

--
-- Name: levels_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.levels_id_seq OWNER TO smetzger;

--
-- Name: levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE levels_id_seq OWNED BY levels.id;


--
-- Name: post_translations; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE post_translations (
    id integer NOT NULL,
    post_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title character varying,
    description text
);


ALTER TABLE public.post_translations OWNER TO smetzger;

--
-- Name: post_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE post_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_translations_id_seq OWNER TO smetzger;

--
-- Name: post_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE post_translations_id_seq OWNED BY post_translations.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE posts (
    id integer NOT NULL,
    start_date date,
    end_date date,
    post_type integer,
    post_value numeric,
    published_at date,
    is_featured boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.posts OWNER TO smetzger;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO smetzger;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: resource_translations; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE resource_translations (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title character varying,
    body text
);


ALTER TABLE public.resource_translations OWNER TO smetzger;

--
-- Name: resource_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE resource_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_translations_id_seq OWNER TO smetzger;

--
-- Name: resource_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE resource_translations_id_seq OWNED BY resource_translations.id;


--
-- Name: resources; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE resources (
    id integer NOT NULL,
    submitter character varying,
    "position" character varying,
    orgname character varying,
    submitter_email character varying,
    submitter_phone character varying,
    mepi_project character varying,
    mepi_project_number character varying,
    focus_women boolean,
    focus_youth boolean,
    published_at timestamp without time zone,
    nid integer,
    number_pages integer,
    doc_types character varying,
    materialtype_id integer,
    website character varying,
    partner_orgs character varying,
    presenter character varying,
    training_event character varying,
    event_date timestamp without time zone,
    language integer,
    tnid integer,
    organization_id integer,
    pid integer,
    pnid integer,
    tid integer,
    series_id integer,
    project_id integer,
    is_featured boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.resources OWNER TO smetzger;

--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resources_id_seq OWNER TO smetzger;

--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE resources_id_seq OWNED BY resources.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO smetzger;

--
-- Name: searches; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE searches (
    id integer NOT NULL,
    search_term character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    technicalarea_ids character varying,
    targetgroup_ids character varying,
    organization_ids character varying
);


ALTER TABLE public.searches OWNER TO smetzger;

--
-- Name: searches_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.searches_id_seq OWNER TO smetzger;

--
-- Name: searches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE searches_id_seq OWNED BY searches.id;


--
-- Name: sections; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE sections (
    id integer NOT NULL,
    name character varying,
    body text,
    ordernum double precision,
    level_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    imageset integer,
    caption character varying,
    oldorder double precision,
    adminnotes text,
    book integer,
    toc1 integer,
    toc2 integer,
    toc3 integer
);


ALTER TABLE public.sections OWNER TO smetzger;

--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_id_seq OWNER TO smetzger;

--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE sections_id_seq OWNED BY sections.id;


--
-- Name: site_document_translations; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE site_document_translations (
    id integer NOT NULL,
    site_document_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying
);


ALTER TABLE public.site_document_translations OWNER TO smetzger;

--
-- Name: site_document_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE site_document_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_document_translations_id_seq OWNER TO smetzger;

--
-- Name: site_document_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE site_document_translations_id_seq OWNED BY site_document_translations.id;


--
-- Name: site_documents; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE site_documents (
    id integer NOT NULL,
    documentable_type character varying,
    documentable_id integer,
    nid integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    document_file_name character varying,
    document_content_type character varying,
    document_file_size integer,
    document_updated_at timestamp without time zone
);


ALTER TABLE public.site_documents OWNER TO smetzger;

--
-- Name: site_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE site_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_documents_id_seq OWNER TO smetzger;

--
-- Name: site_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE site_documents_id_seq OWNED BY site_documents.id;


--
-- Name: site_images; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE site_images (
    id integer NOT NULL,
    name character varying,
    imageable_type character varying,
    imageable_id integer,
    is_logo boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone
);


ALTER TABLE public.site_images OWNER TO smetzger;

--
-- Name: site_images_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE site_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_images_id_seq OWNER TO smetzger;

--
-- Name: site_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE site_images_id_seq OWNED BY site_images.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    role integer
);


ALTER TABLE public.users OWNER TO smetzger;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: smetzger
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO smetzger;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: smetzger
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY chapters ALTER COLUMN id SET DEFAULT nextval('chapters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY imagesets ALTER COLUMN id SET DEFAULT nextval('imagesets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY levels ALTER COLUMN id SET DEFAULT nextval('levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY post_translations ALTER COLUMN id SET DEFAULT nextval('post_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY resource_translations ALTER COLUMN id SET DEFAULT nextval('resource_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY resources ALTER COLUMN id SET DEFAULT nextval('resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY searches ALTER COLUMN id SET DEFAULT nextval('searches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY sections ALTER COLUMN id SET DEFAULT nextval('sections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY site_document_translations ALTER COLUMN id SET DEFAULT nextval('site_document_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY site_documents ALTER COLUMN id SET DEFAULT nextval('site_documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY site_images ALTER COLUMN id SET DEFAULT nextval('site_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: smetzger
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY books (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('books_id_seq', 1, false);


--
-- Data for Name: chapters; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY chapters (id, name, body, ordernum, book_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: chapters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('chapters_id_seq', 1, false);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY comments (id, commentable_id, commentable_type, title, body, subject, user_id, parent_id, lft, rgt, created_at, updated_at) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Data for Name: imagesets; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY imagesets (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: imagesets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('imagesets_id_seq', 1, false);


--
-- Data for Name: levels; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY levels (id, name, created_at, updated_at) FROM stdin;
1	Chapter	2016-03-17 19:43:47.567458	2016-03-17 19:43:47.567458
2	Section	2016-03-17 19:43:47.57048	2016-03-17 19:43:47.57048
3	Subsection	2016-03-17 19:43:47.573006	2016-03-17 19:43:47.573006
\.


--
-- Name: levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('levels_id_seq', 3, true);


--
-- Data for Name: post_translations; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY post_translations (id, post_id, locale, created_at, updated_at, title, description) FROM stdin;
\.


--
-- Name: post_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('post_translations_id_seq', 1, false);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY posts (id, start_date, end_date, post_type, post_value, published_at, is_featured, created_at, updated_at) FROM stdin;
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('posts_id_seq', 1, false);


--
-- Data for Name: resource_translations; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY resource_translations (id, resource_id, locale, created_at, updated_at, title, body) FROM stdin;
\.


--
-- Name: resource_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('resource_translations_id_seq', 1, false);


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY resources (id, submitter, "position", orgname, submitter_email, submitter_phone, mepi_project, mepi_project_number, focus_women, focus_youth, published_at, nid, number_pages, doc_types, materialtype_id, website, partner_orgs, presenter, training_event, event_date, language, tnid, organization_id, pid, pnid, tid, series_id, project_id, is_featured, created_at, updated_at) FROM stdin;
\.


--
-- Name: resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('resources_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY schema_migrations (version) FROM stdin;
20160317193957
20151028183709
20151028175050
20160317181509
20160317192710
20160116194003
20151029135154
20160317181321
20151028174209
20160116214845
20151028150732
20140224203310
20160317181232
20160214224519
20140224203311
20151028174420
20160317181123
20160317195916
20160317195941
20160317200348
20160318142057
20160318153946
20160319170042
20160404021653
20160404023344
\.


--
-- Data for Name: searches; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY searches (id, search_term, created_at, updated_at, technicalarea_ids, targetgroup_ids, organization_ids) FROM stdin;
\.


--
-- Name: searches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('searches_id_seq', 1, false);


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY sections (id, name, body, ordernum, level_id, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at, imageset, caption, oldorder, adminnotes, book, toc1, toc2, toc3) FROM stdin;
39	Document Management	\N	57	2	2016-03-17 19:43:47.666708	2016-04-04 17:45:50.522677	\N	\N	\N	\N	\N	\N	57	\N	0	\N	\N	\N
1	Title	NEA/AC Database Version 6.0\r\nImplementer’s User Guide\r\n\r\n\r\n\r\n\r\nDRAFT\r\nMarch 2016\r\n 	1	1	2016-03-17 19:43:47.582284	2016-04-04 17:45:50.39735	\N	\N	\N	\N	\N		1	\N	0	\N	\N	\N
30	Printing the Work Plan	<p>The implementer can create a printed copy of the information that has been entered into the Work Plan at any point in the process by using the “Work Plan PDF”. &nbsp;This will generate a PDF version of the selected plan that the implementer can save locally or print.</p>	40	2	2016-03-17 19:43:47.644957	2016-04-04 17:45:50.481925	\N	\N	\N	\N	\N		40		0	\N	\N	\N
32	Public Events	\N	41	2	2016-03-17 19:43:47.652412	2016-04-04 17:45:50.483758	\N	\N	\N	\N	\N	\N	41	\N	0	\N	\N	\N
62	Create QR PDF File	<p>The implementer can generate a PDF version of the current period’s QPR at any time during the QPR updating process by selecting the “Create QR PDF File” on the QR tab. This will generate a display version of the PDF which can then be saved to the implementer’s local computer. &nbsp;It is good practice to save a copy of this PDF just prior to submission for approval. &nbsp;However, this saved QPR is not the same as the official QPR, which is generated automatically by the system once NEA/AC approves the QPR.</p>	50	3	2016-03-17 19:43:47.714613	2016-04-04 17:45:50.508752	\N	\N	\N	\N	\N		50		0	\N	\N	\N
35	Submitting QPRs	\N	51	2	2016-03-17 19:43:47.658968	2016-04-04 17:45:50.511514	\N	\N	\N	\N	\N	\N	51	\N	0	\N	\N	\N
36	Approval/Rejection and Viewing the Quarterly Report after Submission	\N	52	2	2016-03-17 19:43:47.660987	2016-04-04 17:45:50.513467	\N	\N	\N	\N	\N	\N	52	\N	0	\N	\N	\N
10	Quarterly Financial Report (QFR)	\N	53	1	2016-03-17 19:43:47.605694	2016-04-04 17:45:50.51531	\N	\N	\N	\N	\N	\N	53	\N	0	\N	\N	\N
11	Documents	\N	54	1	2016-03-17 19:43:47.60764	2016-04-04 17:45:50.517249	\N	\N	\N	\N	\N	\N	54	\N	0	\N	\N	\N
37	Document Groups	\N	55	2	2016-03-17 19:43:47.662914	2016-04-04 17:45:50.519044	\N	\N	\N	\N	\N	\N	55	\N	0	\N	\N	\N
38	Document Types	\N	56	2	2016-03-17 19:43:47.66486	2016-04-04 17:45:50.520885	\N	\N	\N	\N	\N	\N	56	\N	0	\N	\N	\N
12	Payments	\N	58	1	2016-03-17 19:43:47.609594	2016-04-04 17:45:50.524471	\N	\N	\N	\N	\N	\N	58	\N	0	\N	\N	\N
40	Compliance History	\N	59	2	2016-03-17 19:43:47.668674	2016-04-04 17:45:50.526248	\N	\N	\N	\N	\N	\N	59	\N	0	\N	\N	\N
41	Obligation Balance	\N	60	2	2016-03-17 19:43:47.670608	2016-04-04 17:45:50.528138	\N	\N	\N	\N	\N	\N	60	\N	0	\N	\N	\N
42	Add Payment	\N	61	2	2016-03-17 19:43:47.67554	2016-04-04 17:45:50.530016	\N	\N	\N	\N	\N	\N	61	\N	0	\N	\N	\N
13	Site Visits	\N	62	1	2016-03-17 19:43:47.611534	2016-04-04 17:45:50.531911	\N	\N	\N	\N	\N	\N	62	\N	0	\N	\N	\N
43	Site Visit Documents	\N	63	2	2016-03-17 19:43:47.67762	2016-04-04 17:45:50.533827	\N	\N	\N	\N	\N	\N	63	\N	0	\N	\N	\N
14	Award Closeout	\N	64	1	2016-03-17 19:43:47.613499	2016-04-04 17:45:50.535726	\N	\N	\N	\N	\N	\N	64	\N	0	\N	\N	\N
15	ANNEX - Key Definitions	\N	65	1	2016-03-17 19:43:47.615386	2016-04-04 17:45:50.538036	\N	\N	\N	\N	\N	\N	65	\N	0	\N	\N	\N
28	Printing the RMP	<p>The implementer can create a printed copy of the information that has been entered into the RMP at any point in the process by using the “Results Monitoring Plan PDF”. &nbsp;This will generate a PDF version of the selected plan that the implementer can save locally or print.</p>	36	2	2016-03-17 19:43:47.641071	2016-04-04 17:45:50.472846	\N	\N	\N	\N	\N		36		0	\N	\N	\N
2	Acroymns	\N	2	1	2016-03-17 19:43:47.585091	2016-04-04 17:45:50.400979	\N	\N	\N	\N	\N	\N	2	\N	0	\N	\N	\N
25	Budgets	\N	30	2	2016-03-17 19:43:47.635123	2016-04-04 17:45:50.461783	\N	\N	\N	\N	\N	\N	30	\N	0	\N	\N	\N
51	The Implementer Portal	<p>To assist implementers in compiling, reviewing and reprint on their activities the Implementer Portal was designed to facitlie reporting and to allow implementers to access selected project documentation with NEA. While the portal is built-in to the ACPRS system the Portal interface is designed for Implementer use. &nbsp;Access for implementer users is limted to projects that they are explicitly assigned.</p><p><br></p>	12	3	2016-03-17 19:43:47.693547	2016-04-04 17:45:50.424113	\N	\N	\N	\N	\N		12	\N	0	\N	\N	\N
4	Home Pages	<p>There are two types of “home” pages in the ACPRS database. The first is the general home page that display when a user first logs in. The second is an award home page that gives users access to enter, view, and edit all information pertaining to a single award. There is also a global header, which appears on all pages.</p>	16	1	2016-03-17 19:43:47.590445	2016-04-04 17:45:50.432792	\N	\N	\N	\N	\N		16	\N	0	\N	\N	\N
54	Global Navigation Links	<p>Admin users have three global navigation options: Home, Reports, and Admin. The home screen, shown in Error: Reference source not found, gives users ready-made alerts, quick links to their projects, and several reporting options.</p>	19	3	2016-03-17 19:43:47.699254	2016-04-04 17:45:50.438639	\N	\N	\N	\N	\N		19	\N	0	\N	\N	\N
6	Award History	\N	26	1	2016-03-17 19:43:47.595376	2016-04-04 17:45:50.454095	\N	\N	\N	\N	\N	\N	26	\N	0	\N	\N	\N
27	Key Elements in the Results Monitoring Plan	<p><em><strong>Performance Indicator:</strong></em>Indicators are measures used to gauge progress toward the project’s intended outcomes and objectives. &nbsp;The indicators listed in the RMP template have been copied directly from the SoW and cannot be changed by the implementer without NEA/AC approval.</p><p><strong><em>Definition:&nbsp;</em>&nbsp;</strong>Under “Definition,” describe all the key terms in the indicator, so that the implementer and NEA/AC can understand precisely what will be counted as a success and what will not. &nbsp;If percentages or ratios are to be used, identify precisely the numerator and the denominator to be used in calculating the number. &nbsp;For qualitative indicators, give as complete and precise a definition of the conditions that will represent a “yes” or “no” in a yes/no type of indicator, or be observed and judged to represent achievement or stages of progress toward achievement of the Outcome or Objective in that type of indicator. &nbsp;If using a scorecard, milestone scale, index, or other similar tool, reference the tool you will use. That tool should be discussed and agreed upon with the NEA/AC program officer, and provided as an attachment to the SoW.</p><p><strong><em>Baseline Date and Baseline Value:</em></strong>Under “Baseline Date” and “Baseline Value,” identify the date when actual baseline data were collected, and the value. &nbsp;The baseline is the initial measurement of an indicator at the start of the project. For example, a project that aims to increase the number of local firms exporting to the United States should measure the number of such firms at the beginning of the project, in order to measure progress over the course of the project. For quantitative indicators, the number/percentage/etc. noted under “Unit of Measure” should be stated. &nbsp;The baseline is often zero and, if so, “0” should be entered. &nbsp;For qualitative indicators, the baseline conditions should be described (per the terms provided in the Indicator Definition).</p><p>Ideally, the baseline data can be collected or acquired from a secondary source (such as a ministry) for a period as close to the beginning of the project as possible, in order to get a clear picture of the status of the Outcome or Objective indicator before the project’s interventions. &nbsp;If no pre-project baseline data are available, they should be collected as soon after the start of the project as possible.</p><p><strong><em>Target: &nbsp;</em></strong>Under “Target,” place the expected value you hope to reach, and by when you hope to reach it4. If no target is used, enter “n/a.” &nbsp;The target value may be a final number (e.g., 100 judges trained; a rating of 4.5 on an agreed-upon index; etc.). &nbsp;There may also be intermediate targets (e.g., 30 judges trained after six months; 60 judges trained after one year).</p><p><em><strong>Unit of Measure:</strong></em> Under “Unit of Measure,” identify the unit used (e.g., number of firms, percent, yes/no, dollars, index score, average, etc.). &nbsp;Using number and percent together is recommended where possible. &nbsp;For instance, five local firms exporting to the United States may be very significant if there are only ten local firms, but relatively insignificant if there are 300 local firms. &nbsp;Providing information such as “5 firms/25% of total firms” gives a good picture of program impact, on an absolute and relative level.</p><p><strong><em>Reporting Frequency: &nbsp;</em></strong>Under “Reporting Frequency,” identify how often the data will be reported (e.g., quarterly, yearly, etc.)</p><p><strong><em>Data Source and Collection Method:</em>&nbsp;</strong>Under “Data Source and Collection Method,” identify the source of the data to be collected and used to calculate the value of a quantitative indicator (e.g., Ministry of records; raining registration forms; records completed by project staff; a survey of activists) or to decide whether a qualitative condition has or has not been achieved (e.g., direct observations made by project staff, self-reported conditions by assisted NGOs). &nbsp;Also identify how the data will be collected and analyzed. &nbsp;If using a survey, who will be surveyed? How will the subjects be identified? How will the survey be conducted? &nbsp;If using an index, what indicators are included and how is the index calculated? How will the scores be compiled? &nbsp;Again, if using an index, baseline scorecard, or similar tool, that tool should be referenced here after being discussed and agreed upon with a NEA/AC program officer (and attached to the SoW). &nbsp;This information is critically important for data collectors, because in the event that someone leaves the project, their replacement will be able to read this information and know exactly what to do. &nbsp;It is also important for any new program or grants officers in NEA/AC.</p><p><em><strong>NOTE:</strong>&nbsp;</em>For some indicators, it may not be advisable to have a target; this should be determined in consultation with NEA/AC. &nbsp;</p><p><strong><em>Person/Unit Responsible for Reporting: &nbsp;</em></strong>Under “Person/Unit Responsible for Reporting,” identify who is specifically responsible for data reporting for the Quarterly Report.</p><p><em><strong>Comments/Concerns:&nbsp;</strong>&nbsp;</em>Under “Comments/Concerns,” identify anything worth noting that has not already been discussed elsewhere.</p>	35	2	2016-03-17 19:43:47.639093	2016-04-04 17:45:50.471	acprs_editindicator.jpg	image/jpeg	111046	2016-03-23 03:08:12.109332	2	Input form for custom project-specific indicators	35		0	\N	\N	\N
16	Features	\N	4	2	2016-03-17 19:43:47.61725	2016-04-04 17:45:50.40535	\N	\N	\N	\N	\N	\N	4	\N	0	\N	\N	\N
49	The Statement of Work (SoW)	<p>Project monitoring and evaluation is based on the project Statement of Work (SoW) incorporated into each award. &nbsp;The SoW describes the shared understanding reached between NEA/AC and the implementer regarding the project’s scope, strategy, and planned accomplishments. In essence the SoW bundles up the RMP (including standard and project-specific indicators with performance targets) and the expected Work Plan into a single document. Generally the SoW cannot be changed except through a contractual amendment.</p>	10	3	2016-03-17 19:43:47.689695	2016-04-04 17:45:50.419842	\N	\N	\N	\N	\N		10	\N	0	\N	\N	\N
23	Award Documents	\N	28	2	2016-03-17 19:43:47.630803	2016-04-04 17:45:50.458008	\N	\N	\N	\N	\N	\N	28	\N	0	\N	\N	\N
26	Entering Results Monitoring Plan Information		34	2	2016-03-17 19:43:47.637119	2016-04-04 17:45:50.469232	acprs_fig_rmpobjectives.jpg	image/jpeg	113358	2016-03-23 03:04:31.877786	2	Selection of Standard RMP Indicators	34		0	\N	\N	\N
9	Quarterly Reporting	<p>The quarterly reporting functions of the ACPRS are controlled through the QPR and QFR tabs on the award page shown below in Figure 41. Note that the documents needed for a quarterly report will be submitted through the Documents tab, which is described in the Chapter 5 section, Documents.</p>	42	1	2016-03-17 19:43:47.603473	2016-04-04 17:45:50.485597	\N	\N	\N	\N	\N		42		0	\N	\N	\N
24	CNs	\N	29	2	2016-03-17 19:43:47.633118	2016-04-04 17:45:50.459885	\N	\N	\N	\N	\N	\N	29	\N	0	\N	\N	\N
45	Permissions	<p>User permissions are a key feature of the database, and some screen shots may appear slightly different depending on the reader’s permissions. This document is generally targeted to NAE/AC staff, and information presented is intended to reflect their interests. Some information relevant specifically to implementer is included with the intent that Program Officers and other NEA/AC staff may understand issues that implementers experience.</p><p><br></p>	6	3	2016-03-17 19:43:47.681745	2016-04-04 17:45:50.409682	\N	\N	\N	\N	\N		6		0	\N	\N	\N
46	Awards and Projects	<p>Each activity implemented by NEA through grants is maintained in both an Award record (focused on funding detail) and Project record (focused on implementation and performance). Currently there is a one-to-one relationship between a single Award and a single Project. &nbsp;For the purposes of the ACPRS system these terms are used interchangeably depending on the content of the discussion. &nbsp;</p><p><br></p>	7	3	2016-03-17 19:43:47.683688	2016-04-04 17:45:50.412215	\N	\N	\N	\N	\N		7	\N	0	\N	\N	\N
47	Award Actions and History	<p>A single Project/Award is funded though “award actions”. These include the initial funding action, supplemental funding, no-cost-extensions, and deoblighations are example of actions that effect the funding or period of performance of a Project and are considered contractual actions. The collection of these actions is referred to as the “award history”.</p>	8	3	2016-03-17 19:43:47.685681	2016-04-04 17:45:50.414602	\N	\N	\N	\N	\N		8	\N	0	\N	\N	\N
17	Support	<p>The ACPRS Database Help Desk is available to provide assistance to database users. &nbsp;The help desk can be contacted by email only at helpdesk@mepidatabase.com this information is also available on the log in screen and linked on the bottom of every page.</p><p><strong><em>Note:&nbsp;</em></strong>The “Support” link at the bottomright of all pages in the database opens a new email to the Helpdeskdirectly in your default mail client.</p><p><br></p>	13	2	2016-03-17 19:43:47.61909	2016-04-04 17:45:50.426216	\N	\N	\N	\N	\N		13	\N	0	\N	\N	\N
52	Troubleshooting Authentication	<p>If an implementer needs a new log-on due to staff reassignment or turnover, an email should be sent to the NEA/AC Project Officer providing contact information for the newly designated user and indicating which of the former user accounts should be deleted, and providing the name and email of the new user. &nbsp;The “Submit Request to NEA/AC” command on the implementer main menu can be used for such a request. &nbsp;The Project Officer will certify the request and then forward it to the ACPRS Help Desk, which will issue a new log-on and delete the old one.</p><p>Implementers can change their password at any given time. However, if this change results in authorized users having problems accessing the ACPRS, then they should contact the ACPRS Help Desk, who will reset their password.</p><p><strong>&nbsp;</strong><em><strong>Note:</strong> Implementers may request more than2 authorized users if necessary.</em></p>	15	3	2016-03-17 19:43:47.695481	2016-04-04 17:45:50.430801	acprs_fig_password.jpg	image/jpeg	102352	2016-03-23 02:14:07.112709	2	Reset Password Page	15		0	\N	\N	\N
55	Global Search Bar	<p>The global search bar is contained in the global header and allows database users to query the database for awards using keywords, words from the award title, or award numbers. This feature may be most useful for NEA/AC staff to locate specific awards.</p>	20	3	2016-03-17 19:43:47.70119	2016-04-04 17:45:50.440502	\N	\N	\N	\N	\N		20	\N	0	\N	\N	\N
56	My Projects	<p>Users are only able to access awards to which they have been granted access. Access is activated on a project-by-project basis. If a user from an implementing organization is active on one award, the database does not allow that user to view data on all awards for the organization. There are two ways to access a particular award, by selecting the quick link on the left-hand side of the user’s home page and by using the global search bar at the top of the page. Implementer users will likely find it easier to use the quick link option, since they will not have too many links to search through. NEA/AC staff may find it easier to use the global search function at in the header. This search function is described in the section above, Global Search Bar. The database will only display to database users quick links to those projects associated with the current user session. The links will appear in the left-hand side of the home page once logged in, under the tab My Projects.</p><p>Selecting a project will bring users to the project home page, the details of which comprise most of the remainder of this document, especially , , and . By way of introduction, the header for the award home page includes multiple tabs to facilitate users to enter, review, and edit the award information.</p><p>The My People tab, as shown in Error: Reference source not found, allows users to select and manage users they supervise in the database by drilling down by role. Once a role is selected from the dropdown, a Staff dropdown populates with staff members who have the selected role. Selecting the staff member from the dropdown shows the grants that staff member manages.</p><p>The Recent tab adjoined to My Projects shows recently viewed awards.</p><p><br></p>	22	3	2016-03-17 19:43:47.703062	2016-04-04 17:45:50.444555	\N	\N	\N	\N	\N		22	\N	0	\N	\N	\N
7	Project Planning: Results Monitoring Plan	<p>The two NEA/AC project planning documents are the RMP and the work plan. &nbsp;Each of these documents is based on the project design outlined in the SoW. &nbsp;</p><p>Once an award is made, the NEA/AC Project Officer will enter information from the SoW into the ACPRS to generate the online RMP and work plan templates for the implementer. &nbsp;The information that will be entered includes:</p><ul><li>Goal</li><li>Primary and Secondary Objectives</li><li>Standard Indicators</li><li>Project Specific Objectives</li><li>Project Specific Indicators</li><li>Major Work Plan Activities.</li></ul><p><strong>Note:</strong> The outcomes, objectives and indicators listed in the award SoW may not be changed by the PO or implementer without authorization from the NEA/AC Planning Unit in consultation with the Grants Officer. &nbsp;If a change is approved, the Project Officer will enter it into the system.</p>	31	1	2016-03-17 19:43:47.597846	2016-04-04 17:45:50.463687	acprs_fig_rmp.jpg	image/jpeg	79024	2016-03-23 02:57:26.724833	2	The RMP tab screen, shown here, provides an overview of the RMP Goals, Objectives, and Indicators	31		0	\N	\N	\N
5	Award Home Page	<p>To select an award, simply click the award’s name (this turns red and underlined when the mouse hovers over it), which will open the award home page in the same tab on the browser. The award home page includes a banner with the project information (including a link back to the Implementer Home (Project Selection); a status bar shows the current status of the project lifecycle; and a link to Navigation Bar with the following tabs, as seen below: Award Info, Award History, RMP, Workplan, QPR, QFR, Documents, Payments, and Site Visits. The following sections cover each of these tabs one-by-one, further detailing the available tabs and pages embedded within.</p>	23	1	2016-03-17 19:43:47.592968	2016-04-04 17:45:50.446922	\N	\N	\N	\N	\N		23	\N	0	\N	\N	\N
53	Login Status	<p>At the top right of the screen the user finds three functions related to login status. &nbsp;The first link lists the username being used to view the database. &nbsp;The second function indicated by the &nbsp;icon refreshes the logged in user’s information to reflect any project or role associations that have taken place since they logged in. This is useful when role changes are made for a user, for example, while they are logged in. Furthest to the right is a link that allows users to log out of the database and return to the login screen.</p>	18	3	2016-03-17 19:43:47.697365	2016-04-04 17:45:50.436735	\N	\N	\N	\N	\N		18	\N	0	\N	\N	\N
48	Results Management Plan (RMP)	<p>Each project can be assigned unique objectives and indicators that measure progress toward its objectives and intended outcomes by designated performance indicators set forth in the SoW; the RMP provides the overall plan for peforming the project tasks.</p><ul><li><strong>NEA-Program Goals and Objectives:</strong>The results framework that includes NEA-wide goals, common objectives , and common indicators that link the project to a larger framework.</li><li><strong>NEA-Standard Indicators:</strong> These performance indicators are program wide and are assigned to one or more projects to show how performance is achieved across multiple projects. The RMP provides a precise definition of each indicator and describes how indicator data will be collected, including the data source, who will be responsible for data collection, and the frequency with which it will be collected. &nbsp;The RMP also establishes baseline data values and date of baseline measures.</li><li><strong>Project Specific Objectives and Indicators:</strong> Each project can be assigned unique objectives and indicators to provide finer performance tracking tools. Similar to standard RMP indicators, these indicators identify project-specific data sources, collection methodologies as required.</li><li><strong>Work Plan:</strong>The Work Plan identifies the key activities the project will undertake to reach its objectives and assigns an expected completion date for each activity. The work plan includes the major activities cited in the SoW as well as any additional key activities the implementer believes are necessary to reach each objective.</li></ul>	9	3	2016-03-17 19:43:47.687671	2016-04-04 17:45:50.417121	lock.jpg	image/jpeg	162364	2016-03-17 19:57:56.807278	2	Figure 9.1 Keyhole	9	<p>Admin notes would go here</p>	0	\N	\N	\N
50	The Quarterly Report	<p>To streamline reporting and clarify the desired content of implementer reports, NEA/AC has adopted a standardized Quarterly Report (QR) template. &nbsp;The QR includes four components:</p><ul><li>Overall assessment (implementer self-assessment of progress);</li><li>Results data achieved during that quarter for the indicators in the RMP;</li><li>Work plan progress; and</li><li>Brief narrative sections including an Executive Summary.</li></ul><p>By linking progress reporting directly to the work plan and RMP, and providing a template for reporting, quarterly reporting focuses the attention of both implementers and staff on project results. QRs can be generated online through the Implementer Portal (see below) or offline and delivered to NEA via email attachments.</p><p><br></p>	11	3	2016-03-17 19:43:47.691608	2016-04-04 17:45:50.42202	\N	\N	\N	\N	\N		11	\N	0	\N	\N	\N
64	Project Planning		33	2	2016-03-18 03:24:43.296343	2016-04-04 17:45:50.467457	acprs_fig_projectobjectives.jpg	image/jpeg	44486	2016-03-23 03:02:47.353463	2	Project Specific Planning. Bottom of the RMP tab screen shows custom project objectives and indicators	33		0	\N	\N	\N
44	Roles	<p>All users have specified access to screens, reports, and data entry function based on their association with one or more Roles. &nbsp;Roles are linked to project management personnel (Grants Officers, Project Officers, Grants Management Specialists, etc) and can be linked to NEA generally or to one of the two Regional Offices. &nbsp;</p><p><br></p>	5	3	2016-03-17 19:43:47.679714	2016-04-04 17:45:50.407492	\N	\N	\N	\N	\N		5		0	\N	\N	\N
63	Program Specific Goals	<p>The project’s affiliated Program Group will determine the options for the RMP Goals.</p><p>MEPI , NEA Regional, and Region 3 grants all use the original three Goals.</p><ul><li>Goal IPluralistic societies built where diversity is reflected in social organizations, politics, business, media, and government, and where all citizens have equal standing, protected by guaranteed rights and by independent and effective courts of law.</li><li>Goal II &nbsp; &nbsp;Participatory societies built where citizens have the regular opportunity to play an active role in making decisions that affect their lives and to hold their governments accountable.</li><li>Goal III &nbsp; &nbsp;Prosperous societies built where education, specialized skill training and an environment conducive to business development inspire innovation and create the foundation for long term economic growth and an internationally competitive private sector</li></ul><p>Iraq Assistance Program grants use the following Goals:</p><ul><li>Goal II.A &nbsp; &nbsp;Rule of Law and Human Rights</li><li>Goal II.B &nbsp; &nbsp;Good Governance</li><li>Goal IV.A &nbsp; &nbsp;Macroeconomic Foundation for Growth</li><li>Goal IV.B &nbsp; &nbsp;Trade and Investment</li></ul><p>Region 3 Programs use a single Goal area:</p><ul><li>Goal I &nbsp; &nbsp;Enhanced discussion and defense of internationally recognized democratic principles and legal rights, including those enshrined in the Constitution and international human rights conventions to which the country is a signatory.</li></ul>	32	2	2016-03-18 03:19:35.288966	2016-04-04 17:45:50.465615	\N	\N	\N	\N	\N		32	\N	0	\N	\N	\N
61	List of Appendices	<p>Implementers are encouraged to submit appendices that contribute to NEA/AC’s understanding of their activities and results during the quarter. &nbsp;Examples include:</p><ul><li>Agendas</li><li>Participant lists from any events held during the quarter</li><li>Proceedings from any events held during the quarter</li><li>News articles or other media coverage of project activities</li><li>Products/materials/curriculum developed during the quarter</li></ul><p>Click on the “Choose File” button to attach electronic files containing the specified appendices. &nbsp;Any items which cannot be attached electronically should be mailed to the Grants Office, with a notation on the list of appendices that the item is being sent via mail.</p><p>Please keep the following in mind when naming files:</p><ul><li>Use underscores, not blank spaces, between words. &nbsp;For instance “Good_file_naming.”</li><li>Use English for all file names. &nbsp;Arabic and other character sets will not save correctly.</li><li>Use the correct file type. &nbsp;The system does not accept .ZIP or other archive file types.</li></ul>	49	3	2016-03-17 19:43:47.712632	2016-04-04 17:45:50.50625	\N	\N	\N	\N	\N		49		0	\N	\N	\N
18	Accessing the ACPRS Database	<p>Accessing the Database requires a username and password. To request a username send an email to helpdesk@mepidatabase.com or request one from a database administrator. Once you receive your username and password, you can log in to the database at this URL: https://acprsdatabase.com/view/login/. Passwords can be reset or changed by using links on the login page. Users who forget their password can click the “Forgot your password?” link to reset their password. This function will request the username associated with the account and send an automated email to the address associated with the same account.</p><p>If you incorrectly enter your username or password, the login page will reload and you will be prompted to try again. In order to maintain system security and prevent unauthorized access to data, only authorized users are able to access the ACPRS database. &nbsp;Each implementer should designate at least two authorized representatives who will receive log on IDs and be able to access the online system.1 &nbsp;Implementers will only be able to view data related to their own projects.</p><p>Immediately after award, the implementer will receive an introductory package that includes both this Guide and contact information for the ACPRS Help Desk. Staff at the ACPRS Help Desk can create new accounts with the approval of a State Department representative; however this is more frequently done directly by the Program Officer or other State Department Representative.</p><p>The first time logging in, it is recommended users click on the link titled “Change Your Password” and fill in the requested information on the following page (seen below in Error: Reference source not found).</p>	14	2	2016-03-17 19:43:47.621	2016-04-04 17:45:50.428586	acprs_fig_logon.jpg	image/jpeg	105126	2016-03-23 02:12:29.954119	2	ACPRS Logon Page	14		0	\N	\N	\N
3	Introduction	<p>An integral part of the monitoring and evaluation system is an interactive database that stores information about each project and provides reports to State Department officials and managers about the status of each project. Implementers link into this database via the ACPRS Implementers Portal, an interface that allows implementers to submit their project planning documents and quarterly reports directly online. Implementers can also submit administrative requests directly to the relevant staff member.&nbsp;</p><p>The system allows Project and Grants Officers to review and approve implementer planning documents and quarterly reports online. To facilitate the efficient creation, updating, review and use of project information by staff and senior management, NEA/AC developed the database, an interactive, online management information system. The ACPRS Database is designed specifically for quick and easy access to and management of the full range of information on all past and current projects. It is also designed to assist project implementers to submit key information online (i.e., Work Plans, data for the Results Monitoring Plan, Quarterly Reports, and requests for approval of changes), through an interface known as the Assistance Coordination Planning and Reporting System (ACPRS).&nbsp;</p><p>This ACPRS Implementer User’s Guide presents an explanation of all aspects of the database for grantees and implementers who are reporting progress through the ACPRS Implementer’s Portal, including grantees and State Department staff. This User’s Guide is intended to provide instructions with associated screen shots for implementers in how to use the interactive database (hereafter, “the database”). The following sections provide a general overview of the database including Key Definitions, Features, Support, and how to access the database,.&nbsp;</p><p>Throughout the document, the term “users,” when used without qualification, refers to all database users including implementers, Project and Program Officers, NEA/AC database administrators, and others.</p>	3	1	2016-03-17 19:43:47.587955	2016-04-04 17:45:50.403178	\N	\N	\N	\N	\N		3	\N	0	\N	\N	\N
19	Global Header	<p>There are two types of “home” pages in the ACPRS database. The first is the general home page that display when a user first logs in. The second is an award home page that gives users access to enter, view, and edit all information pertaining to a single award. There is also a global header, which appears on all pages.</p>	17	2	2016-03-17 19:43:47.622987	2016-04-04 17:45:50.434802	acprs_fig_header.jpg	image/jpeg	36255	2016-03-23 02:15:15.97986	2	Global Header (Admin link only for Admin users)	17		0	\N	\N	\N
20	General Home Page	<p>The Home page, seen in Error: Reference source not found, has three sections in addition to the global header: Alerts, Award panel, and Report panel. The Alerts section and Awards panel are intended to help users navigate to specific awards to enter, view, and edit information about the awards. The Alerts section can be hidden, or collapsed by clicking the red “Hide Alerts” button. The number in the parenthesis after the label “Awards Ending in the next 60 Days” indicated the number of awards assigned to the current user that fit the category. To view a list of these awards, click on the link. After selecting one of the links on the Alerts section, the section will expand to show all awards that meet the category. For example, Error: Reference source not found shows all the awards that the current user is responsible for ending in the next 90 days. Selecting one of these links will navigate to the project home page, which is discussed in the next section.</p>	21	2	2016-03-17 19:43:47.62502	2016-04-04 17:45:50.442441	acprs_fig_homepage.jpg	image/jpeg	124897	2016-03-23 02:16:35.626149	2	Home Page has three sections, Alerts, Award Panel, and Reports Panel	21		0	\N	\N	\N
21	Award Info	<p>The Award Info tab, seen in Error: Reference source not found, is the default when navigating to an award. This tab shows basic information about the award including financial information, key staff, and status. If the award is grantee is delinquent in reporting, a warning will show here and on other Award tabs indicating that the grantee should not be paid. Any information on the Award Info tab can be edited using links at the top of each section. These will each navigate the user to a separate page with the fields open for editing. Basic implementer information is available on the right side of the screen; and the implementer profile can be seen by selecting the “Full Implementer Profile” button. The resulting page can be seen in, Error: Reference source not found, the Implementer Profile.</p>	24	2	2016-03-17 19:43:47.626974	2016-04-04 17:45:50.449752	acprs_fig_awardinfo.jpg	image/jpeg	129789	2016-03-23 02:49:57.118972	2	Award Info Tab is the default-selected tab when navigating an Award	24		0	\N	\N	\N
71	Implementer Details	<p>Detailed information related to the Award's implementing Grantee is displayed though the Full Implementer Details button.</p>	25	3	2016-03-23 02:53:03.093949	2016-04-04 17:45:50.452182	acprs_fig_implementer_profile.jpg	image/jpeg	81108	2016-03-23 02:53:03.013672	2	Full Implementer Profile	25		0	\N	\N	\N
22	Award Actions	<p>Award Actions tab allows user to review previous award actions and add new award actions. All actions are categorized by the following: Initial Award, Supplement, No Cost Extension, Amendment, Deobligate Funds.</p><p>Select the button with the award action as the text. In the example, it is Amendment 001. This will navigate the user to a screen showing the details of the award action and give the user the option to edit these details. The Award History Main&gt;Edit Award Action page is shown in the screen shot below in Error: Reference source not found.</p>	27	2	2016-03-17 19:43:47.628878	2016-04-04 17:45:50.456036	acprs_fig_awardhistory.jpg	image/jpeg	111383	2016-03-23 02:54:51.391487	2	Award History Tab	27		0	\N	\N	\N
31	Revision of Work Plan	<p>Development of the work plan should be undertaken with sufficient rigor and consultation with NEA/AC to minimize the need for subsequent change. &nbsp;However, if it becomes apparent after implementation begins that a modification of the work plan is required, such changes are possible with NEA/AC approval.</p><p>&nbsp;There are two mechanisms for requesting NEA/AC approval:</p><p><br></p><p>Approval for changes to the<strong><em>planned completion date of an existing approved activity</em></strong> can be requested as part of the routine submission of the quarterly report. &nbsp;The section of the quarterly report in which implementers report actual completion dates for activities also offers the option of requesting approval for a revised completion date for an approved activity. &nbsp;See p. 24 in the “Submitting Quarterly Report” section for further details. &nbsp;Note that milestone dates for major activities listed in the SoW cannot be modified in this manner.</p><p>Approval for work plan changes that involve <strong><em>adding or deleting an activity</em></strong>, or making <strong><em>any change to one of the major activities listed in the SoW&nbsp;</em></strong> requires a separate formal request to NEA/AC. &nbsp;The “Submit Administrative Request to NEA/AC” command on the implementer main menu should be used to transmit a detailed, well-substantiated request seeking permission for the desired change. &nbsp;If approved, the PO will make the changes in the ACPRS. Approval will trigger an automatic email notification to the implementer’s two authorized users. Will require unlocking the RMP and work plan allowing implementer to made the necessary revisions. Once completed the implementer will need to resubmit the RMP/work plan for approval before proceeding with regular quarterly reporting.<br><br>Each activity entry on the Workplan tab, seen in Figure 35, includes a link to edit the activity. If the workplan needs to be edited, each activity must be edited individually, which can be done by clicking the corresponding link for the changed activity. Once the link is selected, the user will navigate to the Edit Work Plan screen shown in<strong><em>Figure 36.</em></strong></p>	39	2	2016-03-17 19:43:47.649863	2016-04-04 17:45:50.479552	acprs_fig_editworkplan.jpg	image/jpeg	83615	2016-03-23 03:11:19.608171	2	Workplan Update Form (Alerts shown in header)	39		0	\N	\N	\N
34	Entering Quarterly Report Information	<p>Implementers can enter QR information directly into the ACPRS and generate a PDF with the relevant information on it using the system. To access pages where this information is entered, an implementer will select the project and the Quarterly Reporting tab, as shown in Figure 43.</p><p><br></p>	44	2	2016-03-17 19:43:47.656865	2016-04-04 17:45:50.492177	\N	\N	\N	\N	\N		44		0	\N	\N	\N
57	Overall Assessment	<p>Clicking on the “Edit Assessment and Executive Summary” button will lead to the Executive Summary of Activities. In this field implementers should provide a brief executive summary of the project’s progress during the quarter. &nbsp;The narrative should focus on the current period only and not duplicate prior reporting or the content of the approved SoW or work plan. &nbsp;The executive summary should be as succinct as possible while fully covering the main highlights of progress. &nbsp;The summary is widely shared within NEA/AC and may be part of the information available in special reports provided to senior managers within the Bureau and in the State Department.</p><p>In each quarter, implementers are asked to rate their project progress in two areas: &nbsp;1) anticipated results, and 2) work plan implementation. &nbsp;There are three possible ratings: 1) Ahead of schedule, 2) On schedule, and 3) Behind schedule.</p><p>These self-ratings should be supported by, and congruent with, the data presented in the rest of the QR on results indicators, work plan progress, and in the narrative statements.</p><p>To enter the project’s overall assessment, click on the Overall Assessment tab to access that section of the QR. &nbsp;Click on the button next to the rating that best matches the project’s overall assessment of its progress in each of the two areas. &nbsp;Only one rating for each area can be selected. &nbsp;The QR cannot be submitted unless a rating has been selected for each category. &nbsp;<br><br>The Executive Summary of Activities should contain a brief summary of major activities during this period, including any delays or obstacles encountered and plans to address them. &nbsp;This section should also contain a brief summary of program outcomes and objectives, highlighting any that are not on target or exceeding expectations. &nbsp;Once this information is entered, click the “Save Update” button to save your work and return to the Overall Assessment screen.</p>	45	3	2016-03-17 19:43:47.704974	2016-04-04 17:45:50.494138	\N	\N	\N	\N	\N		45		0	\N	\N	\N
59	Results Indicator Data	<p>The third section of the QR template lists the project’s indicators and provides data fields for reporting against them. &nbsp;Baseline data and data reported on previous QPRs are also shown to facilitate comparisons. &nbsp;Each indicator comes with a narrative section which, as with the narrative sections for work plan progress, provides an opportunity for implementers to explain performance that significantly exceeds or fails to meet expectations. &nbsp;Again, NEA/AC encourages implementers to openly report any obstacles they may have encountered, and will not penalize implementers for circumstances beyond their control.</p><p>The Results Indicator Data page will display a link for each standard indicator and each project -specific indicator. &nbsp;It will display the current quarter’s result and any discussion previously entered. &nbsp;If a standard indicator is to be disaggregated the list of required disaggregations will also be displayed.</p><p>The user must click on the link for each indicator to edit the results. &nbsp;Doing so will display the indicator edit page. This page shows the entire record for that indicator and all the values entered in previous quarters. &nbsp;These are ordered by year and quarter and, if applicable, by disaggregation. &nbsp;Only the records for the current active quarter can be edited; previously reported data cannot be changed. &nbsp;(If a change is required to previously reported data, the implementer should contact the Program Officer via separate email).<br><br>The discussion field for each indicator allows entry of up to 4800 characters to facilitate reporting on indicators. &nbsp;This field provides implementers an opportunity to explain any performance data that is not on target, along with their plans to improve performance. &nbsp;Implementers should also discuss any indicators that exceed expectations in this field.<br><br>Based on the data collection frequency listed in the approved RMP, there may be indicators for which data is not collected in every quarter. &nbsp;In quarters when no new data is available to report, the implementer should enter “n/a” to make it clear that the field has not been inadvertently skipped.<br><br>For non-disaggregated indicator data, only one single value and text box will display for entry. The user should enter the result (a value or measurement) for the period and any necessary discussion for the result. &nbsp;Once this is completed, the user can select the “Save Indicator Update” button at the bottom of the display form. &nbsp;The implementer can continue to modify and save data entered for the current quarter until the QPR is officially submitted by clicking the “Submit” button.</p>	47	3	2016-03-17 19:43:47.70879	2016-04-04 17:45:50.50182	\N	\N	\N	\N	\N		47		0	\N	\N	\N
8	Project Planning: Workplan	<p>The purpose of the NEA/AC work plan is to identify, describe, and schedule the specific actions that will lead to accomplishment of the project’s objectives and intended outcome(s). &nbsp;More specifically, the work plan:</p><ul><li>Reflects a shared understanding of project activities and the schedule for these activities;</li><li>&nbsp;Is generated by the implementer based on the objectives, major activities, and milestones listed in the SoW;</li><li>&nbsp;Functions as an overall management tool for the implementer, and as a means for NEA/AC to track progress on project implementation;</li><li>Allows NEA/AC to identify and track public events likely to generate media coverage that the Embassy and NEA/AC should be aware of in advance; and</li><li>Allows NEA/AC to designate certain activities as “critical deadlines” crucial to project success.</li></ul><p><br></p><p>The work plan is organized by objective and should include all key activities required to reach each objective. &nbsp;The level of detail should be adequate to give NEA/AC a picture of the main steps the implementer will undertake to achieve each objective. &nbsp;In some cases, adequate detail may already have been provided in the SoW.</p><p><br></p><p>The completed work plan includes:</p><ul><li>The key activities necessary to achieve each project objective; and</li><li>Planned activity completion dates (milestones).</li></ul><p>The project work plan is to be completed and submitted by the implementer not more than 30 days after email notification from the PO that the SoW information from the award has been entered into the ACPRS. &nbsp;NEA/AC approval of the work plan is required.</p><p><br></p>	37	1	2016-03-17 19:43:47.600652	2016-04-04 17:45:50.474583	\N	\N	\N	\N	\N		37		0	\N	\N	\N
29	Entering Work Plan Information	<p>To complete the work plan, the implementer should click on the “Create/Update Work Plan” command on the ACPRS home page to navigate to the work plan Progress page. &nbsp;The Work plan activities are grouped.</p><p>When editing the work plan during the RMP review phase the user can edit the Activity as well as the Planned Completion Date. &nbsp;The user can also indicate if the work plan activity is a “Public Event,” which will be covered in more detail below.</p><p>To add a new activity to this Objective’s work plan, the user should click on the “Add New Activity for this Objective” link above and to the left of the activity table. Local Grantee users can only update the planned date and the public event checkbox. They cannot change the description of the activity.</p><p>Once the implementer has reviewed the work plan, added the planned completion dates, reviewed the RMP, and added indicator details, they will submit the project to NEA/AC for approval. This is done by clicking on the <strong>“Submit RMP/Work plan to NEA/AC”</strong> button on the Quarterly Reporting tab on the Project page. &nbsp;</p><p>Once this happens, the project’s status will change to: <strong>“RMP and Work plan is under review and not yet approved.”</strong></p><p>During the NEA/AC review process the implementer will not be able to change work plan or RMP information in the system. They can begin adding narrative and/or appendices to their initial Quarterly Report online (but not their work plan or Indicators).</p><p>Upon approval of the RMP and work plan the Implementer user will receive an email notification of the approval. This action officially begins the project’s implementation phase. &nbsp;During this phase, RMP and work plan updates are limited to dates and measurements. &nbsp;The objectives, indicator definitions, and work plan activities will be locked unless NEA/AC “unlocks” these during the implementation phase. If this happens the Implementer may update the full RMP and work plan details and re-submit them for NEA/AC re-approval.</p>	38	2	2016-03-17 19:43:47.643055	2016-04-04 17:45:50.476753	acprs_fig_workplan.jpg	image/jpeg	103044	2016-03-23 03:09:29.874232	2	Workplan tab screen	38		0	\N	\N	\N
33	Quarterly Performance Report (QPR)	<p>The quarterly performance reporting tab allows users to document and organize each quarterly report in the centralized database. Each quarterly reporting period must be added manually to the system using the “Add QR Schedule” button on the top right of the main panel in Figure 41. The dates for each period are listed on the left-hand side of the screen.</p><p>The active period, which is labeled with a bold lack font, is the last period that is under review. Above, the active period is October to December 2015, though the actual submission data for that report was March 7, 2016. The PO rejected the submitted report. This will prevent any future reports from being opened or submitted. A common help desk ticket is resolving this discrepancy when a rejected report is not corrected and approved before the subsequent report is due.</p><p>The implementer will not be able to start work on a quarterly report until all previous reports are completed and marked as approved by both the PO and GO.</p><p>By providing a concise, standardized template for quarterly reports, the ACPRS streamlines the reporting process. &nbsp;Quarterly reports are submitted by implementers and approved according to the following schedule. Clicking on the “Add QR Schedule” button navigates the user to the screen shown in Figure 42. Selecting the “Offline” checkbox means that the QPR will be managed between the implementer and the PO over email. This can be used for sensitive awards that cannot be detailed in the system. Approvals for offline reports are still tracked in the ACPRS.</p><p>The actual quarterly report will be submitted through the Documents tab. The current status of the QR Schedule will appear on the main tab of the Implementer Portal. This displays a record and status for each quarter during the period of performance. Each implementer’s QR template is customized so that the approved indicators and work plan activities are listed in the QR template. &nbsp;Brief descriptions of each section of the quarterly report follow.</p><p>Implementers can begin to enter data into their online QR form as early in the quarter as they wish, and the next quarter’s form becomes accessible as soon as the previous QR is approved. &nbsp;To access the QR submission screen, click “Print QR Template” and the browser will download a QR template with some of the fields filled in for the award. A sample QR template can be seen in Annex I.</p><p>Unless there is an overdue QR from a previous quarter, the active (current) quarter will display a link to edit the current QR and a link to submit the completed QR for the active period. At the beginning of a project, implementers can edit parts of the QR for the initial period prior to RMP and work plan approval. &nbsp;</p><p>The quarterly report has five sections:</p><ol><li>Overall Assessment (implementer self-assessment of progress), including an executive summary</li><li>Workplan Progress</li><li>Results Indicator Data</li><li>Brief Narrative Sections</li><li>Appendices</li></ol><p>The ACPRS automatically customizes each implementer’s QR template so that the approved indicators and work plan activities are listed in the template. &nbsp;Brief descriptions of each section of the quarterly report follow.</p>	43	2	2016-03-17 19:43:47.654778	2016-04-04 17:45:50.487396	\N	\N	\N	\N	\N		43		0	\N	\N	\N
58	Workplan Progress	<p>The second component of the QR lists the project’s approved work plan activities and target dates, and provides data fields for the implementer to enter the dates activities were actually completed. &nbsp;As with the indicator data, space is provided at the bottom of each work plan table so implementers can enter explanation for activities that are ahead of or behind schedule.</p><p>NEA/AC recognizes that the Middle East can sometimes be a volatile region to work in, and that extenuating circumstances (government non-cooperation, security concerns, and so forth) can delay progress on the work plan. &nbsp;Such circumstances are beyond implementer control, and NEA/AC works with implementers experiencing these difficulties rather than penalizes them. &nbsp;Implementers are encouraged to describe any such obstacles to progress in their reporting.</p><p>The work plan progress section also gives implementers the opportunity to request approval to change target dates for those activities not listed in the SoW.</p><p>To enter data on work plan progress, the implementer clicks on the “Workplan Progress” tab on the QR screen. &nbsp;Each activity and associated target date included in the approved work plan will appear, along with any information on actual completion dates already entered as part of previous QRs. &nbsp;The work plan is organized by project objective. To edit the work plan activities for a specific objective, select the “Edit Work Plan” button for that specific project objective. <br><br><em><strong>Note:</strong></em> In order to change approved work plan activities (for example, rewording of the activity description) the implementer must request special authorization using the “Request Revision of Work plan” email in the “Send Request to NEA/AC” tab from the project page. &nbsp;Only changes to target completion dates can be requested via the QR, and only for activities not listed in the SoW.</p><p>There are two sections to the work plan updating form for the objective. The first section is to update activities. &nbsp;For the QPR update users can either provide an actual date for the activity completion or a revised completion date if the activity will not be completed during the period when it was planned. &nbsp;The Program Officer will review these requested dates after QPR submission. <br><br>The project officer reviews the requested date changes as part of the review and approval of the QPR. &nbsp;If the project officer approves the revisions, they will be saved to the ACPRS when the PO approves the QR. &nbsp;The revised dates will appear in future QRs in the quarterly report template so that the implementer can report against them. &nbsp;If the PO has concerns about the requested revised dates, s/he may choose to follow up further with the implementer. &nbsp;If the PO and implementer determine that the date should not be changed after all or a different target date selected, the implementer will need to enter the revised date and re-submit the quarterly report for approval. &nbsp;The user should enter actual completion dates for any activities completed during the quarter.<br><br>The Discussion of Work plan Progress section at the bottom of each objective allows implementers to provide a narrative summary of activities during the reporting period in question. &nbsp;Implementers should include an explanation of any delays or obstacles encountered, and their plans to address them, note any activities that progressed exceptionally well, and explain requests for new completion dates.</p>	46	3	2016-03-17 19:43:47.706885	2016-04-04 17:45:50.499463	\N	\N	\N	\N	\N		46		0	\N	\N	\N
60	Narrative Sections	<p>The fourth component of the QR includes four narrative boxes or input fields, each with a specific topic.</p><p>A detailed description of the information to be submitted in each field is as follows.</p><p><strong><em>Purpose, Activities, and Outcomes of Any Visits:</em> </strong>This field is used to describe the purpose, activities, and outcomes of any visits to the project office or site by implementer home office, US Embassy, NEA/AC Regional Office, or NEA/AC Washington staff. &nbsp;The implementer should describe each visit’s purpose and main activities, and report on any outcomes or follow up actions. &nbsp;If there were no such visits during the quarter, the field should be left blank.</p><p><em><strong>Outreach or Media Contacts during the Period: </strong></em>This field is used to describe any outreach activity or media contacts made during the period. &nbsp;Copies of any press coverage resulting from media contacts can be included as appendices (see below for discussion of appendices). &nbsp;The field should be left blank if no media contacts or outreach occurred during the quarter.&nbsp;</p><p><strong><em>Other Relevant Information:</em> </strong>This field is only used for narrative updates that do not fit in the other sections. &nbsp;It should be left blank if no such information exists.<strong><em></em></strong></p><p><strong><em>Discussion of Projected Activities for Next Quarter</em></strong>: This field of the QR is where implementers summarize the major projected activities for the next quarter as listed in the work plan, including any key details. &nbsp;Any changes to target dates requested in the work plan progress section of the report should also be discussed in this section.Select the corresponding “edit” button to add or update the information in each narrative section.</p>	48	3	2016-03-17 19:43:47.710727	2016-04-04 17:45:50.504116	\N	\N	\N	\N	\N		48		0	\N	\N	\N
\.


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('sections_id_seq', 71, true);


--
-- Data for Name: site_document_translations; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY site_document_translations (id, site_document_id, locale, created_at, updated_at, name) FROM stdin;
\.


--
-- Name: site_document_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('site_document_translations_id_seq', 1, false);


--
-- Data for Name: site_documents; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY site_documents (id, documentable_type, documentable_id, nid, created_at, updated_at, document_file_name, document_content_type, document_file_size, document_updated_at) FROM stdin;
\.


--
-- Name: site_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('site_documents_id_seq', 1, false);


--
-- Data for Name: site_images; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY site_images (id, name, imageable_type, imageable_id, is_logo, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
\.


--
-- Name: site_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('site_images_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: smetzger
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, role) FROM stdin;
2	smetzger@pillarsystems.com	$2a$10$eXu4GG/yE5tAIAa6V/9YJu4u8xYMhRP8AQqCY/Rz1hyt5prnzgaUO	\N	\N	\N	0	\N	\N	\N	\N	2016-03-19 17:10:35.221715	2016-03-19 17:10:35.221715	\N	\N
1	user@example.com	$2a$10$q3OvkYchbHqvMcYVUbCp9ulUMfzYMfDFdhdd7ayDw6UpcoyK8GHXq	\N	\N	\N	3	2016-04-04 02:26:17.737408	2016-03-21 03:11:08.767382	127.0.0.1	127.0.0.1	2016-03-19 17:10:35.163305	2016-04-04 02:26:17.738251	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smetzger
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: imagesets_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY imagesets
    ADD CONSTRAINT imagesets_pkey PRIMARY KEY (id);


--
-- Name: levels_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (id);


--
-- Name: post_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY post_translations
    ADD CONSTRAINT post_translations_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: resource_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY resource_translations
    ADD CONSTRAINT resource_translations_pkey PRIMARY KEY (id);


--
-- Name: resources_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: searches_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY searches
    ADD CONSTRAINT searches_pkey PRIMARY KEY (id);


--
-- Name: sections_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: site_document_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY site_document_translations
    ADD CONSTRAINT site_document_translations_pkey PRIMARY KEY (id);


--
-- Name: site_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY site_documents
    ADD CONSTRAINT site_documents_pkey PRIMARY KEY (id);


--
-- Name: site_images_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY site_images
    ADD CONSTRAINT site_images_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: smetzger; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_comments_on_commentable_id_and_commentable_type; Type: INDEX; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE INDEX index_comments_on_commentable_id_and_commentable_type ON comments USING btree (commentable_id, commentable_type);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_post_translations_on_locale; Type: INDEX; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE INDEX index_post_translations_on_locale ON post_translations USING btree (locale);


--
-- Name: index_post_translations_on_post_id; Type: INDEX; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE INDEX index_post_translations_on_post_id ON post_translations USING btree (post_id);


--
-- Name: index_resource_translations_on_locale; Type: INDEX; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE INDEX index_resource_translations_on_locale ON resource_translations USING btree (locale);


--
-- Name: index_resource_translations_on_resource_id; Type: INDEX; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE INDEX index_resource_translations_on_resource_id ON resource_translations USING btree (resource_id);


--
-- Name: index_site_document_translations_on_locale; Type: INDEX; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE INDEX index_site_document_translations_on_locale ON site_document_translations USING btree (locale);


--
-- Name: index_site_document_translations_on_site_document_id; Type: INDEX; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE INDEX index_site_document_translations_on_site_document_id ON site_document_translations USING btree (site_document_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: smetzger; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

