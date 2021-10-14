SELECT count(*) num_civilian_complaints, EXTRACT(YEAR FROM DA.incident_date)
FROM data_allegation DA
WHERE DA.is_officer_complaint = FALSE
GROUP BY EXTRACT(YEAR FROM DA.incident_date);

SELECT count(*) num_civilian_complaints, EXTRACT(YEAR FROM DA.incident_date)
FROM data_allegation DA
WHERE DA.is_officer_complaint = TRUE
GROUP BY EXTRACT(YEAR FROM DA.incident_date);