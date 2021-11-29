DROP VIEW IF EXISTS tfd_cp5_complaint_description_details;
CREATE TEMP VIEW tfd_cp5_complaint_description_details AS
SELECT
       ATF.id,
       ATF.title,
       ATF.text_content,
       ATF.allegation_id,
       ATN.attachment_id,
       ATN.text_content AS complaint_narrative
FROM
       data_attachmentfile ATF
INNER JOIN data_attachmentnarrative ATN on ATF.id = ATN.attachment_id;

SELECT COUNT(*) FROM tfd_cp5_complaint_description_details;

DROP VIEW IF EXISTS tfd_cp5_allegation_and_category_details;
CREATE TEMP VIEW tfd_cp5_allegation_and_category_details AS
SELECT
       DA.crid,
       DA.incident_date,
       EXTRACT(YEAR FROM DA.incident_date) incident_year,
       DA.is_officer_complaint,
       DA.most_common_category_id,
       DA.cr_text,
       DAC.category,
       DAC.allegation_name
FROM
       data_allegation DA
INNER JOIN data_allegationcategory DAC on DA.most_common_category_id = DAC.id;

SELECT COUNT(*) FROM tfd_cp5_allegation_and_category_details;

DROP VIEW IF EXISTS tfd_cp5_allegation_complaint_description_details;
CREATE TEMP VIEW tfd_cp5_allegation_complaint_description_details AS
SELECT
       ACD.crid,
       ACD.incident_year,
       ACD.is_officer_complaint,
       ACD.cr_text,
       ACD.category,
       ACD.allegation_name,
       CDD.text_content,
       CDD.complaint_narrative
FROM
       tfd_cp5_allegation_and_category_details ACD
INNER JOIN tfd_cp5_complaint_description_details CDD on ACD.crid = CDD.allegation_id;

SELECT COUNT(*) FROM tfd_cp5_allegation_complaint_description_details;

DROP VIEW IF EXISTS tfd_cp5_officer_allegation_details;
CREATE TEMP VIEW tfd_cp5_officer_allegation_details AS
SELECT
       ACDD.crid,
       ACDD.incident_year,
       ACDD.is_officer_complaint,
       ACDD.cr_text,
       ACDD.category,
       ACDD.allegation_name,
       ACDD.text_content,
       ACDD.complaint_narrative,
       OA.officer_id,
       OA.disciplined

FROM
       tfd_cp5_allegation_complaint_description_details ACDD
INNER JOIN data_officerallegation OA on ACDD.crid = OA.allegation_id;

DROP VIEW IF EXISTS tfd_cp5_officer_allegation_description_complete_details;
CREATE TEMP VIEW tfd_cp5_officer_allegation_description_complete_details AS
SELECT
       OAD.crid,
       OAD.incident_year,
       OAD.is_officer_complaint,
       OAD.cr_text,
       OAD.category,
       OAD.allegation_name,
       OAD.text_content,
       OAD.complaint_narrative,
       OAD.officer_id,
       OAD.disciplined,
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
       tfd_cp5_officer_allegation_details OAD
INNER JOIN data_officer DOF on OAD.officer_id = DOF.id;

-- extract csv after executing the below lines:
SELECT * FROM tfd_cp5_officer_allegation_description_complete_details;
SELECT COUNT(*) FROM tfd_cp5_officer_allegation_description_complete_details WHERE disciplined=TRUE;


