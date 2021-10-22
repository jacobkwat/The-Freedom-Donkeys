-- gives total counts of reprimands for each allegation

-- SELECT count(*), DAC.allegation_name
-- FROM data_allegationcategory DAC
--          JOIN data_officerallegation D on DAC.id = D.allegation_category_id
-- WHERE D.disciplined = TRUE
-- GROUP BY DAC.allegation_name;

-- Used for checkpoint 2 - question 1 (gives counts for civilian and officer reports separately)

SELECT civilian_count, officer_count, civ_table.allegation_name
FROM (
      (SELECT count(*) civilian_count, table1.category allegation_name
       FROM (
             (
                 data_allegationcategory DAC
                     JOIN data_officerallegation D
                     on DAC.id = D.allegation_category_id
                 ) table1
                JOIN data_allegation DA
                     on table1.allegation_id = DA.crid)
       WHERE table1.disciplined = TRUE
         AND DA.is_officer_complaint = FALSE
       GROUP BY table1.category) civ_table
         JOIN (SELECT count(*) officer_count, table1.category allegation_name
               FROM (
                     (
                         data_allegationcategory DAC
                             JOIN data_officerallegation D
                             on DAC.id = D.allegation_category_id
                         ) table1
                        JOIN data_allegation DA
                             on table1.allegation_id = DA.crid)
               WHERE table1.disciplined = TRUE
                 AND DA.is_officer_complaint = TRUE
               GROUP BY table1.category) off_table
              ON civ_table.allegation_name = off_table.allegation_name)
GROUP BY civ_table.allegation_name, officer_count, civilian_count
ORDER BY allegation_name ASC;
