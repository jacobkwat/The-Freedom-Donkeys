-- get total population counts
-- tfd stands for the group name: The Freedom Donkeys
-- cp3 stands for checkpoint 3
DROP VIEW IF EXISTS tfd_cp3_officer_disciplined_allegation;
CREATE VIEW tfd_cp3_officer_disciplined_allegation AS
SELECT
       A.crid,
       A.incident_date,
       EXTRACT(YEAR FROM A.incident_date) incident_year,
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
       ODA.incident_date,
       ODA.incident_year,
       ODA.officer_id,
       ODA.disciplined,
       DOF.gender,
       DOF.race,
       DOF.rank,
       DOF.first_name,
       DOF.last_name,
       DOF.allegation_count,
       DOF.discipline_count,
       DOF.honorable_mention_count,
       CONCAT(
           DOF.first_name, ' ', DOF.last_name, ', ',
           DOF.gender, ', ', DOF.race, ', ', DOF.rank,
           ', AC:', DOF.allegation_count,
           ', DC:', DOF.discipline_count,
           ', HMC:', DOF.honorable_mention_count
           ) AS full_details_officer
FROM
       tfd_cp3_officer_disciplined_allegation ODA
INNER JOIN data_officer DOF on ODA.officer_id = DOF.id;

-- testing
SELECT * FROM tfd_cp3_officer_details_disciplined_allegation LIMIT 20;

DROP VIEW IF EXISTS tfd_cp3_total_officers_disciplined_per_complaint;
CREATE VIEW tfd_cp3_total_officers_disciplined_per_complaint AS
SELECT
      crid,
      COUNT(*) num_of_officers_disciplined_per_complaint
FROM tfd_cp3_officer_disciplined_allegation
GROUP BY crid
ORDER BY num_of_officers_disciplined_per_complaint DESC;

-- testing
SELECT * FROM tfd_cp3_total_officers_disciplined_per_complaint LIMIT 10;

DROP VIEW IF EXISTS tfd_cp3_officer_disciplined_final_details;
CREATE VIEW tfd_cp3_officer_disciplined_final_details AS
SELECT
      ODDA.crid,
      ODDA.incident_date,
      ODDA.incident_year,
      ODDA.officer_id,
      ODDA.disciplined,
      ODDA.gender,
      ODDA.race,
      ODDA.rank,
      ODDA.first_name,
      ODDA.last_name,
      ODDA.allegation_count,
      ODDA.discipline_count,
      ODDA.honorable_mention_count,
      ODDA.full_details_officer,
      ODPC.num_of_officers_disciplined_per_complaint
FROM tfd_cp3_officer_details_disciplined_allegation ODDA
INNER JOIN tfd_cp3_total_officers_disciplined_per_complaint ODPC on ODDA.crid = ODPC.crid;

-- testing
SELECT * FROM tfd_cp3_officer_disciplined_final_details LIMIT 10;

-- for this question, we are primarily interested in the scenario where multiple officers have been disciplined together in a complaint
SELECT * FROM tfd_cp3_officer_disciplined_final_details
WHERE num_of_officers_disciplined_per_complaint > 1
ORDER BY crid;
