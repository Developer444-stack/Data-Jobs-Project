SELECT 
	job_title_short AS title,
    job_location AS location, 
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM 
	job_postings_fact
LIMIT 5;


SELECT
    COUNT(job_id) as job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY 
    date_month
ORDER BY
    job_posted_count DESC;

CREATE TABLE january_jobs AS
    SELECT * 
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS
    SELECT * 
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS
    SELECT * 
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT job_posted_date FROM march_jobs;

SELECT 
	job_title_short,
    job_location, 
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact;

SELECT 
	COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;

SELECT * FROM job_postings_fact LIMIT 50;

SELECT 
    salary_year_avg,
    job_title_short,
    CASE
        WHEN salary_year_avg BETWEEN 70000 AND 100000 THEN 'Standard'
        WHEN salary_year_avg > 100000 THEN 'High'
        ELSE 'Low'
    END AS salary_comparison
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC;

-- Subqueries
SELECT 
    company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN ( 
    SELECT
            company_id
    FROM
            job_postings_fact
    WHERE
            job_no_degree_mention = true
    ORDER BY
            company_id
);

-- CTEs

WITH company_job_count AS (
SELECT
    company_id,
    COUNT(*) AS total_jobs
FROM
    job_postings_fact
GROUP BY company_id
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs DESC;



WITH remote_job_skills AS (
SELECT
    skill_id,
    COUNT(*) AS skill_count
FROM
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
WHERE
    job_postings.job_work_from_home = True AND
    job_postings.job_title_short = 'Data Analyst'
GROUP BY
    skill_id
)

SELECT 
    skills.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5;


-- Unions

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
february_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs;


-- Union All

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
february_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs;


-- Practice Probllem
SELECT  
    quater1_job_postings.job_title_short,
    quater1_job_postings.job_location,
    quater1_job_postings.job_via,
    quater1_job_postings.job_posted_date::date

FROM (
    SELECT * FROM january_jobs
    UNION ALL
    SELECT * FROM february_jobs
    UNION ALL
    SELECT * FROM march_jobs
) AS quater1_job_postings
WHERE
    quater1_job_postings.salary_year_avg > 70000 AND
    quater1_job_postings.job_title_short = 'Data Analyst'
ORDER BY
    quater1_job_postings.salary_year_avg DESC;

