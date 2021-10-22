SELECT count(*), DAC.category
FROM (data_allegationcategory DAC
         JOIN data_officerallegation D on DAC.id = D.allegation_category_id )
        JOIN data_allegation DA on DA.crid = D.allegation_id
WHERE D.disciplined = TRUE and is_officer_complaint = FALSE
GROUP BY DAC.category;

SELECT *
FROM data_allegationcategory DAC
         JOIN data_officerallegation D on DAC.id = D.allegation_category_id
WHERE D.disciplined = TRUE and DAC.allegation_name LIKE 'Excessive Force%'; --like 'Dragged';

SELECT *
FROM data_allegation DA
WHERE DA.crid LIKE '1078329';