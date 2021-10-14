SELECT count(*) num_civilian_complaints, beat_id
FROM data_allegation DA JOIN data_area d on DA.beat_id = d.id
WHERE DA.is_officer_complaint = FALSE
GROUP BY beat_id;

-- SELECT count(*) num_civilian_complaints, beat_id
-- FROM data_allegation DA JOIN data_area d on DA.beat_id = d.id
-- WHERE DA.is_officer_complaint = TRUE
-- GROUP BY beat_id;