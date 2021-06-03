--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)

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
-- Name: dispatcher; Type: TABLE; Schema: public; Owner: sasan.sp92
--

CREATE TABLE public.dispatcher (
    dispatcher_id integer NOT NULL,
    dispatcher_name integer NOT NULL,
    dispatcher_phone character(1) NOT NULL
);


ALTER TABLE public.dispatcher OWNER TO "sasan.sp92";

--
-- Name: dispatcher_dispatcher_id_seq; Type: SEQUENCE; Schema: public; Owner: sasan.sp92
--

CREATE SEQUENCE public.dispatcher_dispatcher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dispatcher_dispatcher_id_seq OWNER TO "sasan.sp92";

--
-- Name: dispatcher_dispatcher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sasan.sp92
--

ALTER SEQUENCE public.dispatcher_dispatcher_id_seq OWNED BY public.dispatcher.dispatcher_id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: sasan.sp92
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    employee_first_name character(1) NOT NULL,
    employee_last_name character(1) NOT NULL,
    employee_phone character(1) NOT NULL,
    employee_email character(1),
    employee_address character(1) NOT NULL,
    employee_quantification character(1) NOT NULL,
    employee_work_period character(1) NOT NULL,
    job_fk integer NOT NULL
);


ALTER TABLE public.employee OWNER TO "sasan.sp92";

--
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: sasan.sp92
--

CREATE SEQUENCE public.employee_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_employee_id_seq OWNER TO "sasan.sp92";

--
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sasan.sp92
--

ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.employee.employee_id;


--
-- Name: job; Type: TABLE; Schema: public; Owner: sasan.sp92
--

CREATE TABLE public.job (
    job_id integer NOT NULL,
    job_name character(1) NOT NULL,
    job_description character(1) NOT NULL
);


ALTER TABLE public.job OWNER TO "sasan.sp92";

--
-- Name: job_job_id_seq; Type: SEQUENCE; Schema: public; Owner: sasan.sp92
--

CREATE SEQUENCE public.job_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_job_id_seq OWNER TO "sasan.sp92";

--
-- Name: job_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sasan.sp92
--

ALTER SEQUENCE public.job_job_id_seq OWNED BY public.job.job_id;


--
-- Name: patient; Type: TABLE; Schema: public; Owner: sasan.sp92
--

CREATE TABLE public.patient (
    patient_id integer NOT NULL,
    first_name character(1) NOT NULL,
    last_name character(1) NOT NULL,
    national_code character(1) NOT NULL,
    birth_day date NOT NULL,
    phone character(1) NOT NULL,
    email character(1),
    password character(1),
    dispatcher_fk integer NOT NULL
);


ALTER TABLE public.patient OWNER TO "sasan.sp92";

--
-- Name: patient_patient_id_seq; Type: SEQUENCE; Schema: public; Owner: sasan.sp92
--

CREATE SEQUENCE public.patient_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_patient_id_seq OWNER TO "sasan.sp92";

--
-- Name: patient_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sasan.sp92
--

ALTER SEQUENCE public.patient_patient_id_seq OWNED BY public.patient.patient_id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: sasan.sp92
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    patient_fk integer NOT NULL,
    test_fk integer NOT NULL,
    payment_amount integer NOT NULL,
    payment_date date NOT NULL
);


ALTER TABLE public.payment OWNER TO "sasan.sp92";

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: sasan.sp92
--

CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_payment_id_seq OWNER TO "sasan.sp92";

--
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sasan.sp92
--

ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;


--
-- Name: result; Type: TABLE; Schema: public; Owner: sasan.sp92
--

CREATE TABLE public.result (
    result_id integer NOT NULL,
    patient_fk integer NOT NULL,
    sample_fk integer NOT NULL,
    employee_fk integer NOT NULL,
    test_fk integer NOT NULL,
    result_value character(1) NOT NULL
);


ALTER TABLE public.result OWNER TO "sasan.sp92";

--
-- Name: result_result_id_seq; Type: SEQUENCE; Schema: public; Owner: sasan.sp92
--

CREATE SEQUENCE public.result_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.result_result_id_seq OWNER TO "sasan.sp92";

--
-- Name: result_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sasan.sp92
--

ALTER SEQUENCE public.result_result_id_seq OWNED BY public.result.result_id;


--
-- Name: sample; Type: TABLE; Schema: public; Owner: sasan.sp92
--

CREATE TABLE public.sample (
    sample_id integer NOT NULL,
    patient_fk integer NOT NULL,
    sample_type_fk integer NOT NULL
);


ALTER TABLE public.sample OWNER TO "sasan.sp92";

--
-- Name: sample_sample_id_seq; Type: SEQUENCE; Schema: public; Owner: sasan.sp92
--

CREATE SEQUENCE public.sample_sample_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sample_sample_id_seq OWNER TO "sasan.sp92";

--
-- Name: sample_sample_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sasan.sp92
--

ALTER SEQUENCE public.sample_sample_id_seq OWNED BY public.sample.sample_id;


--
-- Name: sample_type; Type: TABLE; Schema: public; Owner: sasan.sp92
--

CREATE TABLE public.sample_type (
    sample_type_id integer NOT NULL,
    type_name character(1) NOT NULL
);


ALTER TABLE public.sample_type OWNER TO "sasan.sp92";

--
-- Name: sample_type_sample_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sasan.sp92
--

CREATE SEQUENCE public.sample_type_sample_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sample_type_sample_type_id_seq OWNER TO "sasan.sp92";

--
-- Name: sample_type_sample_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sasan.sp92
--

ALTER SEQUENCE public.sample_type_sample_type_id_seq OWNED BY public.sample_type.sample_type_id;


--
-- Name: test; Type: TABLE; Schema: public; Owner: sasan.sp92
--

CREATE TABLE public.test (
    test_id integer NOT NULL,
    test_name character(1) NOT NULL,
    test_from_date date NOT NULL,
    test_to_date date NOT NULL,
    test_price integer NOT NULL,
    reference_value character(1) NOT NULL
);


ALTER TABLE public.test OWNER TO "sasan.sp92";

--
-- Name: test_test_id_seq; Type: SEQUENCE; Schema: public; Owner: sasan.sp92
--

CREATE SEQUENCE public.test_test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_test_id_seq OWNER TO "sasan.sp92";

--
-- Name: test_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sasan.sp92
--

ALTER SEQUENCE public.test_test_id_seq OWNED BY public.test.test_id;


--
-- Name: dispatcher dispatcher_id; Type: DEFAULT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.dispatcher ALTER COLUMN dispatcher_id SET DEFAULT nextval('public.dispatcher_dispatcher_id_seq'::regclass);


--
-- Name: employee employee_id; Type: DEFAULT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.employee ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);


--
-- Name: job job_id; Type: DEFAULT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.job ALTER COLUMN job_id SET DEFAULT nextval('public.job_job_id_seq'::regclass);


--
-- Name: patient patient_id; Type: DEFAULT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.patient ALTER COLUMN patient_id SET DEFAULT nextval('public.patient_patient_id_seq'::regclass);


--
-- Name: payment payment_id; Type: DEFAULT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);


--
-- Name: result result_id; Type: DEFAULT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.result ALTER COLUMN result_id SET DEFAULT nextval('public.result_result_id_seq'::regclass);


--
-- Name: sample sample_id; Type: DEFAULT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.sample ALTER COLUMN sample_id SET DEFAULT nextval('public.sample_sample_id_seq'::regclass);


--
-- Name: sample_type sample_type_id; Type: DEFAULT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.sample_type ALTER COLUMN sample_type_id SET DEFAULT nextval('public.sample_type_sample_type_id_seq'::regclass);


--
-- Name: test test_id; Type: DEFAULT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.test ALTER COLUMN test_id SET DEFAULT nextval('public.test_test_id_seq'::regclass);


--
-- Data for Name: dispatcher; Type: TABLE DATA; Schema: public; Owner: sasan.sp92
--

COPY public.dispatcher (dispatcher_id, dispatcher_name, dispatcher_phone) FROM stdin;
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: sasan.sp92
--

COPY public.employee (employee_id, employee_first_name, employee_last_name, employee_phone, employee_email, employee_address, employee_quantification, employee_work_period, job_fk) FROM stdin;
\.


--
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: sasan.sp92
--

COPY public.job (job_id, job_name, job_description) FROM stdin;
\.


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: sasan.sp92
--

COPY public.patient (patient_id, first_name, last_name, national_code, birth_day, phone, email, password, dispatcher_fk) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: sasan.sp92
--

COPY public.payment (payment_id, patient_fk, test_fk, payment_amount, payment_date) FROM stdin;
\.


--
-- Data for Name: result; Type: TABLE DATA; Schema: public; Owner: sasan.sp92
--

COPY public.result (result_id, patient_fk, sample_fk, employee_fk, test_fk, result_value) FROM stdin;
\.


--
-- Data for Name: sample; Type: TABLE DATA; Schema: public; Owner: sasan.sp92
--

COPY public.sample (sample_id, patient_fk, sample_type_fk) FROM stdin;
\.


--
-- Data for Name: sample_type; Type: TABLE DATA; Schema: public; Owner: sasan.sp92
--

COPY public.sample_type (sample_type_id, type_name) FROM stdin;
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: sasan.sp92
--

COPY public.test (test_id, test_name, test_from_date, test_to_date, test_price, reference_value) FROM stdin;
\.


--
-- Name: dispatcher_dispatcher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sasan.sp92
--

SELECT pg_catalog.setval('public.dispatcher_dispatcher_id_seq', 1, false);


--
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sasan.sp92
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 1, false);


--
-- Name: job_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sasan.sp92
--

SELECT pg_catalog.setval('public.job_job_id_seq', 1, false);


--
-- Name: patient_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sasan.sp92
--

SELECT pg_catalog.setval('public.patient_patient_id_seq', 1, false);


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sasan.sp92
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);


--
-- Name: result_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sasan.sp92
--

SELECT pg_catalog.setval('public.result_result_id_seq', 1, false);


--
-- Name: sample_sample_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sasan.sp92
--

SELECT pg_catalog.setval('public.sample_sample_id_seq', 1, false);


--
-- Name: sample_type_sample_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sasan.sp92
--

SELECT pg_catalog.setval('public.sample_type_sample_type_id_seq', 1, false);


--
-- Name: test_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sasan.sp92
--

SELECT pg_catalog.setval('public.test_test_id_seq', 1, false);


--
-- Name: dispatcher dispatcher_pk; Type: CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.dispatcher
    ADD CONSTRAINT dispatcher_pk PRIMARY KEY (dispatcher_id);


--
-- Name: employee employee_pk; Type: CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pk PRIMARY KEY (employee_id);


--
-- Name: job job_pk; Type: CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_pk PRIMARY KEY (job_id);


--
-- Name: patient patient_pk; Type: CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pk PRIMARY KEY (patient_id);


--
-- Name: payment payment_pk; Type: CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pk PRIMARY KEY (payment_id);


--
-- Name: result result_pk; Type: CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_pk PRIMARY KEY (result_id);


--
-- Name: sample sample_pk; Type: CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.sample
    ADD CONSTRAINT sample_pk PRIMARY KEY (sample_id);


--
-- Name: sample_type sample_type_pk; Type: CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.sample_type
    ADD CONSTRAINT sample_type_pk PRIMARY KEY (sample_type_id);


--
-- Name: test test_pk; Type: CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pk PRIMARY KEY (test_id);


--
-- Name: dispatcher_dispatcher_id_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX dispatcher_dispatcher_id_uindex ON public.dispatcher USING btree (dispatcher_id);


--
-- Name: dispatcher_dispatcher_name_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX dispatcher_dispatcher_name_uindex ON public.dispatcher USING btree (dispatcher_name);


--
-- Name: dispatcher_dispatcher_phone_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX dispatcher_dispatcher_phone_uindex ON public.dispatcher USING btree (dispatcher_phone);


--
-- Name: employee_employee_email_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX employee_employee_email_uindex ON public.employee USING btree (employee_email);


--
-- Name: employee_employee_id_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX employee_employee_id_uindex ON public.employee USING btree (employee_id);


--
-- Name: employee_employee_phone_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX employee_employee_phone_uindex ON public.employee USING btree (employee_phone);


--
-- Name: job_job_description_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX job_job_description_uindex ON public.job USING btree (job_description);


--
-- Name: job_job_id_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX job_job_id_uindex ON public.job USING btree (job_id);


--
-- Name: job_job_name_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX job_job_name_uindex ON public.job USING btree (job_name);


--
-- Name: patient_national_code_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX patient_national_code_uindex ON public.patient USING btree (national_code);


--
-- Name: result_employee_fk_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX result_employee_fk_uindex ON public.result USING btree (employee_fk);


--
-- Name: result_patient_fk_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX result_patient_fk_uindex ON public.result USING btree (patient_fk);


--
-- Name: result_result_id_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX result_result_id_uindex ON public.result USING btree (result_id);


--
-- Name: result_sample_fk_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX result_sample_fk_uindex ON public.result USING btree (sample_fk);


--
-- Name: result_test_fk_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX result_test_fk_uindex ON public.result USING btree (test_fk);


--
-- Name: sample_sample_id_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX sample_sample_id_uindex ON public.sample USING btree (sample_id);


--
-- Name: sample_type_sample_type_id_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX sample_type_sample_type_id_uindex ON public.sample_type USING btree (sample_type_id);


--
-- Name: test_test_id_uindex; Type: INDEX; Schema: public; Owner: sasan.sp92
--

CREATE UNIQUE INDEX test_test_id_uindex ON public.test USING btree (test_id);


--
-- Name: employee employee_job_job_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_job_job_id_fk FOREIGN KEY (job_fk) REFERENCES public.job(job_id);


--
-- Name: patient patient_dispatcher_dispatcher_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_dispatcher_dispatcher_id_fk FOREIGN KEY (dispatcher_fk) REFERENCES public.dispatcher(dispatcher_id);


--
-- Name: payment payment_patient_patient_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_patient_patient_id_fk FOREIGN KEY (patient_fk) REFERENCES public.patient(patient_id);


--
-- Name: payment payment_test_test_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_test_test_id_fk FOREIGN KEY (test_fk) REFERENCES public.test(test_id);


--
-- Name: result result_employee_employee_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_employee_employee_id_fk FOREIGN KEY (employee_fk) REFERENCES public.employee(employee_id);


--
-- Name: result result_patient_patient_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_patient_patient_id_fk FOREIGN KEY (patient_fk) REFERENCES public.patient(patient_id);


--
-- Name: result result_sample_sample_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_sample_sample_id_fk FOREIGN KEY (sample_fk) REFERENCES public.sample(sample_id);


--
-- Name: result result_test_test_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_test_test_id_fk FOREIGN KEY (test_fk) REFERENCES public.test(test_id);


--
-- Name: sample sample_sample_type_sample_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: sasan.sp92
--

ALTER TABLE ONLY public.sample
    ADD CONSTRAINT sample_sample_type_sample_type_id_fk FOREIGN KEY (sample_type_fk) REFERENCES public.sample_type(sample_type_id);


--
-- PostgreSQL database dump complete
--

