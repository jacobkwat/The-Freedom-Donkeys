SELECT count(*), DAC.allegation_name
FROM data_allegationcategory DAC
JOIN data_officerallegation D on DAC.id = D.allegation_category_id
WHERE D.disciplined = TRUE
GROUP BY DAC.allegation_name;