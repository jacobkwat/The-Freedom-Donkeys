SELECT num_civilian_complaints - num_officer_complaints, mtable1.my_year, mtable1.my_category, mtable2.my_category
FROM (SELECT count(*) num_civilian_complaints, d.category my_category, EXTRACT(YEAR FROM DA.incident_date) my_year
        FROM data_allegation DA JOIN data_allegationcategory d on DA.most_common_category_id = d.id
        WHERE DA.is_officer_complaint = FALSE
        GROUP BY d.category, EXTRACT(YEAR FROM DA.incident_date)) mtable1
JOIN
    (SELECT count(*) num_officer_complaints, d.category my_category, EXTRACT(YEAR FROM DA.incident_date) my_year
        FROM data_allegation DA JOIN data_allegationcategory d on DA.most_common_category_id = d.id
        WHERE DA.is_officer_complaint = TRUE
        GROUP BY d.category, EXTRACT(YEAR FROM DA.incident_date)) mtable2
ON mtable1.my_year = mtable2.my_year and mtable1.my_category = mtable2.my_category
ORDER BY my_year ASC;

-- SELECT count(*) num_civilian_complaints, d.category my_category, EXTRACT(YEAR FROM DA.incident_date) my_year
--         FROM data_allegation DA JOIN data_allegationcategory d on DA.most_common_category_id = d.id
--         WHERE DA.is_officer_complaint = FALSE
--         GROUP BY d.category, EXTRACT(YEAR FROM DA.incident_date);
--
-- SELECT count(*) num_officer_complaints, d.category my_category, EXTRACT(YEAR FROM DA.incident_date) my_year
--         FROM data_allegation DA JOIN data_allegationcategory d on DA.most_common_category_id = d.id
--         WHERE DA.is_officer_complaint = TRUE
--         GROUP BY d.category, EXTRACT(YEAR FROM DA.incident_date);
