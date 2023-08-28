-- Contents of Indicator_data.sql

--Remove previous run data from Indicator_Data table

DROP TABLE INDICATOR_DATA;

--Insert into the Indicator_Data table

--CREATE TABLE INDICATOR_DATA AS 

CREATE TABLE INDICATOR_DATA AS ( SELECT * FROM (
-- Save query1 as a Common Table Expression (CTE)
with WDI_QRY as (
    select *
    from (
        select
            country_name,
            country_code,
            indicator_name,
--            yr_2012,
--            yr_2013,
--            yr_2014,
--            yr_2015,
--            yr_2016,
            yr_2017,
            yr_2018,
            yr_2019,
            yr_2020,
--            dense_rank() over (partition by Indicator_Code order by yr_2012 desc) as rnk_2012,
--            dense_rank() over (partition by Indicator_Code order by yr_2013 desc) as rnk_2013,
--            dense_rank() over (partition by Indicator_Code order by yr_2014 desc) as rnk_2014,
--            dense_rank() over (partition by Indicator_Code order by yr_2015 desc) as rnk_2015,
--            dense_rank() over (partition by Indicator_Code order by yr_2016 desc) as rnk_2016,
            dense_rank() over (partition by Indicator_Code order by yr_2017 desc) as rnk_2017,
            dense_rank() over (partition by Indicator_Code order by yr_2018 desc) as rnk_2018,
            dense_rank() over (partition by Indicator_Code order by yr_2019 desc) as rnk_2019,
            dense_rank() over (partition by Indicator_Code order by yr_2020 desc) as rnk_2020
        from main_wdi_table
        where Indicator_Code IN (
                'AG.LND.AGRI.K2',
                'ER.FSH.AQUA.MT',
                'SL.AGR.EMPL.ZS',
                'IC.BUS.NREG',
                'SL.EMP.SELF.ZS',
                'IC.REG.DURS'
            ) and COALESCE(yr_2017,yr_2018,yr_2019,yr_2010) is not null)
           -- remove the record if all teh columns involved in calculation are null)
    where
        country_name in (
            'Seychelles', 'Maldives', 'Kenya', 'Sri Lanka', 'India',
            'Singapore', 'Australia', 'Denmark', 'Finland', 'Cote d''Ivoire'
        )
),
-- Save query2 as another CTE
CPI_QRY as (
    select
        country as country_name,
        iso3 as Country_Code,
        'Corruption Perception Index' as Indicator_Name,
--        cpi.cpi_score_2012 as yr_2012,
--        cpi.cpi_score_2013 as yr_2013,
--        cpi.cpi_score_2014 as yr_2014,
--        cpi.cpi_score_2015 as yr_2015,
--        cpi.cpi_score_2016 as yr_2016,
        cpi.cpi_score_2017 as yr_2017,
        cpi.cpi_score_2018 as yr_2018,
        cpi.cpi_score_2019 as yr_2019,
        cpi.cpi_score_2019 as yr_2020,
--        cpi.rank_2012 as rnk_2012,
--        cpi.rank_2013 as rnk_2013,
--        cpi.rank_2014 as rnk_2014,
--        cpi.rank_2015 as rnk_2015,
--        cpi.rank_2016 as rnk_2016,
        cpi.rank_2017 as rnk_2017,
        cpi.rank_2018 as rnk_2018,
        cpi.rank_2019 as rnk_2019,
        cpi.rank_2020 as rnk_2020
    from main_cpi_data cpi
    where country in (
        'Seychelles', 'Maldives', 'Kenya', 'Sri Lanka', 'India',
        'Singapore', 'Australia', 'Denmark', 'Finland', 'Cote d''Ivoire'
    )
)
-- Combine the results of both queries using UNION ALL
select * from WDI_QRY union all select * from CPI_QRY
)
);
COMMIT;
EXIT;