-- SELECT count(*) num_civilian_complaints, beat_id
-- FROM data_allegation DA JOIN data_area d on DA.beat_id = d.id
-- WHERE DA.is_officer_complaint = FALSE
-- GROUP BY beat_id
-- ORDER BY num_civilian_complaints DESC;

SELECT count(*) num_officer_complaints, beat_id
FROM data_allegation DA JOIN data_area d on DA.beat_id = d.id
WHERE DA.is_officer_complaint = TRUE
GROUP BY beat_id
ORDER BY num_officer_complaints DESC;