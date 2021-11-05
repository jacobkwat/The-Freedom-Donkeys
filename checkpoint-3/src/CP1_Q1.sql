-- tfd stands for the group name: The Freedom Donkeys
-- cp3 stands for checkpoint 3

-- allegation by civilian section
DROP VIEW IF EXISTS tfd_cp3_allegation_by_civilian_category;
CREATE VIEW tfd_cp3_allegation_by_civilian_category AS
SELECT
       DA.crid,
       EXTRACT(YEAR FROM DA.incident_date) incident_year,
       DA.is_officer_complaint,
       DA.most_common_category_id,
       DAC.category

FROM
       data_allegation DA
INNER JOIN data_allegationcategory DAC on DA.most_common_category_id = DAC.id
WHERE DA.is_officer_complaint = FALSE;

SELECT
       COUNT(*) num_of_civilian_complaints,
       category,
       incident_year
FROM tfd_cp3_allegation_by_civilian_category
GROUP BY category, incident_year
ORDER BY category;

-- allegation by police section
DROP VIEW IF EXISTS tfd_cp3_allegation_by_police_category;
CREATE VIEW tfd_cp3_allegation_by_police_category AS
SELECT
       DA.crid,
       EXTRACT(YEAR FROM DA.incident_date) incident_year,
       DA.is_officer_complaint,
       DA.most_common_category_id,
       DAC.category

FROM
       data_allegation DA
INNER JOIN data_allegationcategory DAC on DA.most_common_category_id = DAC.id
WHERE DA.is_officer_complaint = TRUE;

SELECT
       COUNT(*) num_of_police_complaints,
       category,
       incident_year
FROM tfd_cp3_allegation_by_police_category
GROUP BY category, incident_year
ORDER BY category;