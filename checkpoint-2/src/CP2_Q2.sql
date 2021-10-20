-- from CP1 - Question 4
SELECT count(*) num_officer_complaints, beat_id
FROM data_allegation DA JOIN data_area d on DA.beat_id = d.id
WHERE DA.is_officer_complaint = TRUE
GROUP BY beat_id
ORDER BY num_officer_complaints DESC;

-- gives total counts of reprimands for each allegation
SELECT count(*), DAC.allegation_name
FROM data_allegationcategory DAC
         JOIN data_officerallegation D on DAC.id = D.allegation_category_id
WHERE D.disciplined = TRUE
GROUP BY DAC.allegation_name;

-- get total population counts
SELECT sum(count) total, area_id
FROM data_racepopulation
GROUP BY area_id
ORDER BY area_id;