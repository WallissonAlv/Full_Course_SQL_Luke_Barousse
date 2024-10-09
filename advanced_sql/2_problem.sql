SELECT
    job_title_short,
    job_location AS location,
    salary_year_avg AS salary
FROM
    job_postings_fact
WHERE
    (job_title LIKE '%Data%' OR job_title LIKE '%Business%') AND
    job_title LIKE '%Analyst%' AND
    job_title NOT LIKE '%Senior%'