DROP VIEW IF EXISTS tfd_cp4_officer_disciplined_allegation;
CREATE TEMP VIEW tfd_cp4_officer_disciplined_allegation AS
SELECT
       A.crid,
       A.is_officer_complaint,
       OA.officer_id,
       OA.disciplined

FROM
       data_allegation A
INNER JOIN data_officerallegation OA on A.crid = OA.allegation_id
WHERE OA.disciplined = TRUE;

-- testing the created view
SELECT * FROM tfd_cp4_officer_disciplined_allegation LIMIT 10;

DROP VIEW IF EXISTS tfd_cp4_officer_details_disciplined_allegation;
CREATE TEMP VIEW tfd_cp4_officer_details_disciplined_allegation AS
SELECT
       ODA.officer_id,
       ODA.crid,
       ODA.is_officer_complaint,
       ODA.disciplined,
       DOF.gender,
       DOF.race,
       DOF.rank,
       DOF.current_salary,
       DOF.allegation_count,
       DOF.discipline_count,
       DOF.honorable_mention_count,
       DOF.major_award_count,
       DOF.civilian_compliment_count
FROM
       tfd_cp4_officer_disciplined_allegation ODA
INNER JOIN data_officer DOF on ODA.officer_id = DOF.id;

-- extract csv after executing the below line:
SELECT * FROM tfd_cp4_officer_details_disciplined_allegation WHERE is_officer_complaint = FALSE;

-- extract csv after executing the below line:
SELECT * FROM tfd_cp4_officer_details_disciplined_allegation WHERE is_officer_complaint = TRUE;

--SELECT officer_id as id
--FROM data_allegation
--JOIN data_officerallegation d on data_allegation.crid = d.allegation_id
--WHERE is_officer_complaint = false and disciplined = true;


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
