--DEFINE SCHEMA

DEFINE SCHEMA_NAME = &1

CREATE TABLE "SCHEMA_NAME"."MAIN_CPI_DATA" 
(
"COUNTRY" VARCHAR2(128 BYTE),
"ISO3" VARCHAR2(26 BYTE),
"REGION" VARCHAR2(26 BYTE),
"CPI_SCORE_2020" NUMBER(38,0),
"RANK_2020" NUMBER(38,0),
"SOURCES_2020" NUMBER(38,0),
"STD_ERR_2020" NUMBER(38,2),
"CPI_SCORE_2019" NUMBER(38,0),
"RANK_2019" NUMBER(38,0),
"SOURCES_2019" NUMBER(38,0),
"STD_ERR_2019" NUMBER(38,2),
"CPI_SCORE_2018" NUMBER(38,0),
"RANK_2018" NUMBER(38,0),
"SOURCES_2018" NUMBER(38,0),
"STD_ERR_2018" NUMBER(38,2),
"CPI_SCORE_2017" NUMBER(38,0),
"RANK_2017" NUMBER(38,0),
"SOURCES_2017" NUMBER(38,0),
"STD_ERR_2017" NUMBER(38,2),
"CPI_SCORE_2016" NUMBER(38,0),
"SOURCES_2016" NUMBER(38,0),
"STD_ERR_2016" NUMBER(38,2),
"CPI_SCORE_2015" NUMBER(38,0),
"SOURCES_2015" NUMBER(38,0),
"STD_ERR_2015" NUMBER(38,2),
"CPI_SCORE_2014" NUMBER(38,0),
"SOURCES_2014" NUMBER(38,0),
"STD_ERR_2014" NUMBER(38,2),
"CPI_SCORE_2013" NUMBER(38,0),
"SOURCES_2013" NUMBER(38,0),
"STD_ERR_2013" NUMBER(38,1),
"CPI_SCORE_2012" NUMBER(38,0),
"SOURCES_2012" NUMBER(38,0),
"STD_ERR_2012" NUMBER(38,1)
)


-- ALTER TABLE "&SCHEMA_NAME"."MAIN_CPI_DATA"  ADD CONSTRAINT PK_Primary PRIMARY KEY (ISO3);