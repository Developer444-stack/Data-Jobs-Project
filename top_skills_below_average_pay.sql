WITH skills_demand AS (
    SELECT 
        sd.skill_id,  
        sd.skills,
        COUNT(sjd.job_id) AS demand_count
    FROM job_postings_fact jpf
    INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP BY sd.skill_id
), avg_salary AS (
    SELECT 
        sjd.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS average_salary
    FROM job_postings_fact jpf
    INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP BY sjd.skill_id
), overall_avg_salary AS (
    SELECT ROUND(AVG(salary_year_avg), 0) AS overall_avg
    FROM job_postings_fact
    WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
)

SELECT 
    sd.skills,
    sd.demand_count,
    a.average_salary,
    oa.overall_avg
FROM skills_demand sd
JOIN avg_salary a ON sd.skill_id = a.skill_id
CROSS JOIN overall_avg_salary oa
WHERE 
    sd.demand_count > 20
    AND a.average_salary < oa.overall_avg
ORDER BY 
    sd.demand_count DESC;
