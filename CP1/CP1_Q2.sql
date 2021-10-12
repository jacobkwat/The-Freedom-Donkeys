--this gives us the number of disciplines per category for a given year
SELECT count(*) * 100.0/1166, mytable2.allegation_name
    FROM ((data_officerallegation DOA
    JOIN data_allegation DA on DOA.allegation_id = DA.crid) mytable
    JOIN data_allegationcategory DAC on mytable.allegation_category_id = DAC.id) mytable2
    WHERE mytable2.disciplined = TRUE and EXTRACT(YEAR FROM mytable2.incident_date) = 2000
GROUP BY mytable2.allegation_name;

--this gives us the counts of disciplines on officers per year
-- SELECT count(*), EXTRACT(YEAR FROM mytable2.incident_date) the_year
-- FROM ((data_officerallegation DOA
-- JOIN data_allegation DA on DOA.allegation_id = DA.crid) mytable
-- JOIN data_allegationcategory DAC on mytable.allegation_category_id = DAC.id) mytable2
-- WHERE mytable2.disciplined = TRUE
-- GROUP BY EXTRACT(YEAR FROM mytable2.incident_date)
-- ORDER BY the_year ASC;