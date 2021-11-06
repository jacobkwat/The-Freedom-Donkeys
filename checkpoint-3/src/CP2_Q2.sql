-- get total population counts
-- tfd stands for the group name: The Freedom Donkeys
-- cp3 stands for checkpoint 3
DROP VIEW IF EXISTS tfd_cp3_officer_disciplined_allegation;
CREATE VIEW tfd_cp3_officer_disciplined_allegation AS
SELECT
       A.crid,
       OA.officer_id,
       OA.disciplined

FROM
       data_allegation A
INNER JOIN data_officerallegation OA on A.crid = OA.allegation_id
WHERE OA.disciplined = TRUE;

DROP VIEW IF EXISTS tfd_cp3_officer_details_disciplined_allegation;
CREATE VIEW tfd_cp3_officer_details_disciplined_allegation AS
SELECT
       ODA.crid,
       ODA.officer_id,
       ODA.disciplined,
       DOF.gender,
       DOF.race,
       DOF.rank,
       DOF.first_name,
       DOF.last_name,
       DOF.allegation_count,
       DOF.discipline_count

FROM
       tfd_cp3_officer_disciplined_allegation ODA
INNER JOIN data_officer DOF on ODA.officer_id = DOF.id;

SELECT * FROM tfd_cp3_officer_details_disciplined_allegation LIMIT 20;

SELECT
       A.crid,
       COUNT(*) num_of_officers_disciplined

FROM
       data_allegation A
INNER JOIN data_officerallegation OA on A.crid = OA.allegation_id
WHERE OA.disciplined = TRUE
GROUP BY A.crid
ORDER BY num_of_officers_disciplined DESC;

