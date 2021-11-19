
SELECT officer_id as id
FROM data_allegation
JOIN data_officerallegation d on data_allegation.crid = d.allegation_id
WHERE is_officer_complaint = false and disciplined = true;


select distinct DA1.officer_id AS src, DA2.officer_id AS dst, DA1.allegation_id AS relationship
FROM data_officerallegation DA1
JOIN data_officerallegation DA2 on DA1.allegation_id = DA2.allegation_id
JOIN data_allegation DA0 on DA1.allegation_id = DA0.crid
WHERE DA1.officer_id <> DA2.officer_id and DA0.is_officer_complaint = false and DA1.disciplined = true and DA2.disciplined = true
ORDER BY DA1.allegation_id ASC;


select distinct DA1.officer_id AS src, DA2.officer_id AS dst, DA1.allegation_id AS relationship
FROM data_officerallegation DA1
JOIN data_officerallegation DA2 on DA1.allegation_id = DA2.allegation_id
JOIN data_allegation DA0 on DA1.allegation_id = DA0.crid
WHERE DA1.officer_id <> DA2.officer_id and DA0.is_officer_complaint = true and DA1.disciplined = true and DA2.disciplined = true
ORDER BY DA1.allegation_id ASC;
