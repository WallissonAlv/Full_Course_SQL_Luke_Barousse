WITH job_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE   
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    job_paying_jobs.*,
    skills
FROM
    job_paying_jobs
INNER JOIN skills_job_dim ON job_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*  PORTUGUES (PT-BR)
    SQL: Presente em quase todas as vagas, indicando que é uma habilidade fundamental para analistas de dados.
    Python: Com uma forte presença, especialmente em funções mais altas, como "Principal Data Analyst" e "Associate Director".
    R: Também uma habilidade popular, especialmente para análises estatísticas e modelagem de dados.
    Ferramentas de Visualização: Tableau aparece repetidamente, sugerindo que a capacidade de apresentar dados visualmente é altamente valorizada.
    Excel: Embora um pouco menos comum em posições mais altas, ainda é uma habilidade essencial, especialmente em níveis iniciais.

    ENGLISH (EN)
    SQL: Present in almost all job postings, indicating that it is a fundamental skill for data analysts.
    Python: Has a strong presence, especially in higher-level positions like "Principal Data Analyst" and "Associate Director."
    R: Also a popular skill, particularly for statistical analysis and data modeling.
    Visualization Tools: Tableau appears repeatedly, suggesting that the ability to present data visually is highly valued.
    Excel: Although somewhat less common in higher positions, it is still an essential skill, especially at entry-level roles.
*/