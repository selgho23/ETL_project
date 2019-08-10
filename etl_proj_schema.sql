﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1zhccA
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "counties" (
    "county_fips_code" INT   NOT NULL,
    "county_name" VARCHAR   NOT NULL,
    "totalpop" INT   NOT NULL,
    "region_code" INT   NOT NULL,
    CONSTRAINT "pk_counties" PRIMARY KEY (
        "county_fips_code"
     )
);

CREATE TABLE "regions" (
    "region_code" INT   NOT NULL,
    "region_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_regions" PRIMARY KEY (
        "region_code"
     )
);

CREATE TABLE "modes_of_transportation" (
    "transport_name" VARCHAR   NOT NULL,
    "transport_description" VARCHAR   NOT NULL,
    "num_workers_per_transport" INT   NOT NULL,
    "county_fips_code" INT   NOT NULL,
    "race_eth_code" INT   NOT NULL,
    CONSTRAINT "pk_trans_modes" PRIMARY KEY (
        "trans_mode"
     )
);

CREATE TABLE "ethnicity" (
    "race_eth_code" INT   NOT NULL,
    "race_eth_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_ethnicity" PRIMARY KEY (
        "race_eth_code"
     )
);

CREATE TABLE "traffic_injuries" (
    "severity" VARCHAR   NOT NULL,
    "injuries" INT   NOT NULL,
    "rate_of_injuries_in_pop" INT   NOT NULL,
    "injury_transport_mode" VARCHAR   NOT NULL,
    "county_fips_code" INT   NOT NULL,
    "race_eth_code" INT   NOT NULL,
    CONSTRAINT "pk_traffic_injuries" PRIMARY KEY (
        "injury_transport_mode"
     )
);

ALTER TABLE "counties" ADD CONSTRAINT "fk_counties_region_code" FOREIGN KEY("region_code")
REFERENCES "regions" ("region_code");

ALTER TABLE "trans_modes" ADD CONSTRAINT "fk_trans_modes_county_fips" FOREIGN KEY("county_fips_code")
REFERENCES "counties" ("county_fips_code");

ALTER TABLE "trans_modes" ADD CONSTRAINT "fk_trans_modes_race_eth_code" FOREIGN KEY("race_eth_code")
REFERENCES "ethnicity" ("race_eth_code");

ALTER TABLE "traffic_injuries" ADD CONSTRAINT "fk_traffic_injuries_county_fips" FOREIGN KEY("county_fips_code")
REFERENCES "counties" ("county_fips_code");

ALTER TABLE "traffic_injuries" ADD CONSTRAINT "fk_traffic_injuries_race_eth_code" FOREIGN KEY("race_eth_code")
REFERENCES "ethnicity" ("race_eth_code");
