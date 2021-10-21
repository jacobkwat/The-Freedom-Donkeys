-- get total population counts
-- tfd stands for the group name: The Freedom Donkeys
DROP VIEW IF EXISTS tfd_area_population;
CREATE VIEW tfd_area_population AS
SELECT sum(count) total_population, area_id
FROM data_racepopulation
GROUP BY area_id
ORDER BY area_id;

DROP VIEW IF EXISTS tfd_officer_disciplined_allegation_area;
CREATE VIEW tfd_officer_disciplined_allegation_area AS
SELECT
       A.crid,
       A.is_officer_complaint,
       OA.allegation_id,
       OA.officer_id,
       OA.disciplined,
       daa.area_id,
       AR.polygon

FROM
       data_allegation A
INNER JOIN data_officerallegation OA on A.crid = OA.allegation_id
INNER JOIN data_allegation_areas daa on A.crid = daa.allegation_id
INNER JOIN data_area AR on AR.id = daa.area_id
WHERE OA.disciplined = TRUE;

DROP VIEW IF EXISTS tfd_allegation_by_civilian;
CREATE VIEW tfd_allegation_by_civilian AS
SELECT
       odaa.crid,
       odaa.is_officer_complaint,
       odaa.allegation_id,
       odaa.officer_id,
       odaa.disciplined,
       odaa.area_id,
       odaa.polygon,
       ap.total_population
FROM
       tfd_officer_disciplined_allegation_area odaa
INNER JOIN tfd_area_population ap on ap.area_id = odaa.area_id
WHERE odaa.is_officer_complaint = FALSE;

DROP VIEW IF EXISTS tfd_allegation_by_police;
CREATE VIEW tfd_allegation_by_police AS
SELECT
       odaa.crid,
       odaa.is_officer_complaint,
       odaa.allegation_id,
       odaa.officer_id,
       odaa.disciplined,
       odaa.area_id,
       odaa.polygon,
       ap.total_population
FROM
       tfd_officer_disciplined_allegation_area odaa
INNER JOIN tfd_area_population ap on ap.area_id = odaa.area_id
WHERE odaa.is_officer_complaint = TRUE;

DROP VIEW IF EXISTS tfd_disciplined_count_by_area_civilian_allegation;
CREATE VIEW tfd_disciplined_count_by_area_civilian_allegation AS
SELECT COUNT(disciplined) total_disciplined, area_id
FROM tfd_allegation_by_civilian
GROUP BY area_id
ORDER BY area_id;

DROP VIEW IF EXISTS tfd_disciplined_count_by_area_police_allegation;
CREATE VIEW tfd_disciplined_count_by_area_police_allegation AS
SELECT COUNT(disciplined) total_disciplined, area_id
FROM tfd_allegation_by_police
GROUP BY area_id
ORDER BY area_id;

DROP VIEW IF EXISTS tfd_allegation_by_civilian_discipline_count;
CREATE VIEW tfd_allegation_by_civilian_discipline_count AS
SELECT
       DISTINCT abc.area_id,
       abc.polygon,
       abc.total_population,
       ca.total_disciplined,
       (CAST(ca.total_disciplined AS DECIMAL)/abc.total_population)*1000 AS discipline_per_thousand_population
FROM
       tfd_allegation_by_civilian abc
INNER JOIN tfd_disciplined_count_by_area_civilian_allegation ca on ca.area_id = abc.area_id;

DROP VIEW IF EXISTS tfd_allegation_by_police_discipline_count;
CREATE VIEW tfd_allegation_by_police_discipline_count AS
SELECT
       DISTINCT abp.area_id,
       abp.polygon,
       abp.total_population,
       pa.total_disciplined,
       (CAST(pa.total_disciplined AS DECIMAL)/abp.total_population)*1000 AS discipline_per_thousand_population
FROM
       tfd_allegation_by_police abp
INNER JOIN tfd_disciplined_count_by_area_police_allegation pa on pa.area_id = abp.area_id;

