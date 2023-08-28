-- Contents of UNPIVOT_LOAD_FINAL.sql
DROP TABLE FINAL_LOAD;
-- CREATE TABLE TO STORE THIS DATA
CREATE TABLE FINAL_LOAD AS 
SELECT * FROM (
--UNPIVOT DATA SO IT CAN APPEAR FOR EACH YEAR SEPARATELY
with UNPIVOT_DATA as (
select * from (
select * from indicator_data
unpivot(Score for YEAR in (
--YR_2012 as '2012', YR_2013 as '2013', YR_2014 as '2014', YR_2015 as '2015', YR_2016 as '2016', 
YR_2017 as '2017', YR_2018 as '2018', YR_2019 as '2019', YR_2020 as '2020'))
unpivot(Rank for YEAR1 in (
--RNK_2012 as '2012', RNK_2013 as '2013', RNK_2014 as '2014', RNK_2015 as '2015', RNK_2016 as '2016', 
RNK_2017 as '2017', RNK_2018 as '2018', RNK_2019 as '2019', RNK_2020 as '2020'))
)
)
select distinct q1.COUNTRY_NAME, q1.COUNTRY_CODE, q1.INDICATOR_NAME, q1.YEAR, q1.SCORE , q1.RANK from UNPIVOT_DATA q1 inner join UNPIVOT_DATA q2 
on q1.year = q2.year1
and q1.score = q2.score
and q1.rank = q2.rank
and q1.country_code = q2.country_code
and q1.indicator_name = q2.indicator_name
order by q1.country_name
);
COMMIT;
EXIT;