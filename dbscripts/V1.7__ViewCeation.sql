-- Set the database and schema context
create or replace view  SCHEMACHANGE_DEMO.PUBLIC.analytics as 
SELECT  
        GENDER,
        COUNT(CASE WHEN BIRTH_YEAR>=1940 AND BIRTH_YEAR<1959 THEN 1 END) AS boomer,
        COUNT(CASE WHEN BIRTH_YEAR>=1960 AND BIRTH_YEAR<1979 THEN 1 END) AS genx,
        COUNT(CASE WHEN BIRTH_YEAR>=1980 AND BIRTH_YEAR<1994 THEN 1 END) AS geny,
        COUNT(CASE WHEN BIRTH_YEAR>=1995 AND BIRTH_YEAR<2012 THEN 1 END) AS genz
    FROM 
       SCHEMACHANGE_DEMO.PUBLIC.TRIPS
    GROUP BY 
        GENDER
    HAVING 
        GENDER IS NOT NULL AND GENDER != 0--2013 AND year != 2018
    ORDER BY
        GENDER ASC
