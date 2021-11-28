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



