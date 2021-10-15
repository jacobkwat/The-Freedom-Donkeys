--this gives us the percentage of disciplines per category for the year 2000 (hard coded total)
-- SELECT count(*) * 100.0/1166, mytable2.allegation_name
--     FROM ((data_officerallegation DOA
--     JOIN data_allegation DA on DOA.allegation_id = DA.crid) mytable
--     JOIN data_allegationcategory DAC on mytable.allegation_category_id = DAC.id) mytable2
--     WHERE mytable2.disciplined = TRUE and EXTRACT(YEAR FROM mytable2.incident_date) = 2000
-- GROUP BY mytable2.allegation_name;

--this gives us the counts of disciplines on officers per year
-- SELECT count(*), EXTRACT(YEAR FROM mytable2.incident_date) the_year
-- FROM ((data_officerallegation DOA
-- JOIN data_allegation DA on DOA.allegation_id = DA.crid) mytable
-- JOIN data_allegationcategory DAC on mytable.allegation_category_id = DAC.id) mytable2
-- WHERE mytable2.disciplined = TRUE
-- GROUP BY EXTRACT(YEAR FROM mytable2.incident_date)
-- ORDER BY the_year ASC;



--this gives us the difference in percentages between 2010 and 2000 for allegations that occurred in both years
SELECT t2.ten_count - t1.zero_count, t1.zero_name
FROM (
--this gives us the percentage of disciplines per category for the year 2000 (hard coded total)
(SELECT count(*) * 100.0/1166 AS zero_count, mytable2.allegation_name AS zero_name
    FROM ((data_officerallegation DOA
    JOIN data_allegation DA on DOA.allegation_id = DA.crid) mytable
    JOIN data_allegationcategory DAC on mytable.allegation_category_id = DAC.id) mytable2
    WHERE mytable2.disciplined = TRUE and EXTRACT(YEAR FROM mytable2.incident_date) = 2000
GROUP BY mytable2.allegation_name) AS t1
JOIN
--this gives us the percentage of disciplines per category for the year 2010 (hard coded total)
(SELECT count(*) * 100.0/268 AS ten_count, mytable4.allegation_name AS ten_name
    FROM ((data_officerallegation DOA
    JOIN data_allegation DA on DOA.allegation_id = DA.crid) mytable3
    JOIN data_allegationcategory DAC on mytable3.allegation_category_id = DAC.id) mytable4
    WHERE mytable4.disciplined = TRUE and EXTRACT(YEAR FROM mytable4.incident_date) = 2010
GROUP BY mytable4.allegation_name) AS t2
    ON t1.zero_name = t2.ten_name);