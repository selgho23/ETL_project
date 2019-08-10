--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

-- Started on 2019-08-10 14:00:11 CDT

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

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16927)
-- Name: counties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.counties (
    county_fips_code integer NOT NULL,
    county_name character varying NOT NULL,
    totalpop integer NOT NULL,
    region_code integer NOT NULL
);


ALTER TABLE public.counties OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16951)
-- Name: ethnicity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ethnicity (
    race_eth_code integer NOT NULL,
    race_eth_name character varying NOT NULL
);


ALTER TABLE public.ethnicity OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16943)
-- Name: modes_of_transportation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modes_of_transportation (
    transport_name character varying NOT NULL,
    transport_description character varying NOT NULL,
    num_workers_per_transport integer NOT NULL,
    county_fips_code integer NOT NULL,
    race_eth_code integer NOT NULL
);


ALTER TABLE public.modes_of_transportation OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16935)
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    region_code integer NOT NULL,
    region_name character varying NOT NULL
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16959)
-- Name: traffic_injuries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.traffic_injuries (
    severity character varying NOT NULL,
    injuries integer NOT NULL,
    rate_of_injuries_in_pop integer NOT NULL,
    injury_transport_mode character varying NOT NULL,
    county_fips_code integer NOT NULL,
    race_eth_code integer NOT NULL
);


ALTER TABLE public.traffic_injuries OWNER TO postgres;

--
-- TOC entry 3022 (class 2606 OID 16934)
-- Name: counties pk_counties; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counties
    ADD CONSTRAINT pk_counties PRIMARY KEY (county_fips_code);


--
-- TOC entry 3026 (class 2606 OID 16958)
-- Name: ethnicity pk_ethnicity; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ethnicity
    ADD CONSTRAINT pk_ethnicity PRIMARY KEY (race_eth_code);


--
-- TOC entry 3024 (class 2606 OID 16942)
-- Name: regions pk_regions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT pk_regions PRIMARY KEY (region_code);


--
-- TOC entry 3027 (class 2606 OID 16967)
-- Name: counties fk_counties_region_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counties
    ADD CONSTRAINT fk_counties_region_code FOREIGN KEY (region_code) REFERENCES public.regions(region_code);


--
-- TOC entry 3030 (class 2606 OID 16982)
-- Name: traffic_injuries fk_traffic_injuries_county_fips; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.traffic_injuries
    ADD CONSTRAINT fk_traffic_injuries_county_fips FOREIGN KEY (county_fips_code) REFERENCES public.counties(county_fips_code);


--
-- TOC entry 3031 (class 2606 OID 16987)
-- Name: traffic_injuries fk_traffic_injuries_race_eth_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.traffic_injuries
    ADD CONSTRAINT fk_traffic_injuries_race_eth_code FOREIGN KEY (race_eth_code) REFERENCES public.ethnicity(race_eth_code);


--
-- TOC entry 3028 (class 2606 OID 16972)
-- Name: modes_of_transportation fk_trans_modes_county_fips; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modes_of_transportation
    ADD CONSTRAINT fk_trans_modes_county_fips FOREIGN KEY (county_fips_code) REFERENCES public.counties(county_fips_code);


--
-- TOC entry 3029 (class 2606 OID 16977)
-- Name: modes_of_transportation fk_trans_modes_race_eth_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modes_of_transportation
    ADD CONSTRAINT fk_trans_modes_race_eth_code FOREIGN KEY (race_eth_code) REFERENCES public.ethnicity(race_eth_code);


-- Completed on 2019-08-10 14:00:11 CDT

--
-- PostgreSQL database dump complete
--

