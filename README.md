# Data Analyst Job Market Analysis

![Banner](https://user-images.githubusercontent.com/placeholder/banner.png)

*Professional analysis of Data Analyst job postings: skill demand, salary insights, and hiring trends.*

---

## 📊 Project Overview

This project analyzes a comprehensive dataset of job postings focusing on **Data Analyst** roles, using SQL queries to extract critical insights on:

- Most in-demand skills for Data Analysts  
- Top-paying remote/hybrid Data Analyst jobs (location = Anywhere)  
- Job titles and their salary distribution  
- Company hiring patterns and job posting timelines

The goal is to provide data-driven guidance for job seekers, recruiters, and market analysts on key trends in the Data Analyst job market.

---

## 🔍 Data Sources & Tools

- **Data source:** Job postings fact table with dimensional tables for skills, companies, and job attributes  
- **Tech stack:** PostgreSQL / SQL for data extraction and aggregation  
- **Analysis scope:** Roles tagged as 'Data Analyst' and related job titles (including senior and specialized roles)  
- **Data period:** Job postings dated 2023  

---

## 💡 Key Insights

### 1. Top 5 In-Demand Skills for Data Analysts

| Skill    | Demand Count |
|----------|--------------|
| SQL      | 92,628       |
| Excel    | 67,031       |
| Python   | 57,326       |
| Tableau  | 46,554       |
| Power BI | 39,468       |

**Insight:** SQL and Excel remain fundamental, but Python and visualization tools like Tableau and Power BI are highly valued.

<img width="1090" alt="image" src="https://github.com/user-attachments/assets/968ece07-cae9-4428-aec5-f6a2c83a2264" />


---

### 2. Highest Paying Remote/Hybrid Data Analyst Roles (`Location = Anywhere`)

| Job Title                    | Company         | Avg. Salary (USD) | Job Posted Date |
|-----------------------------|-----------------|-------------------|-----------------|
| Data Analyst                | Mantys          | $650,000          | 2023-02-20      |
| Director of Analytics       | Meta            | $336,500          | 2023-08-23      |
| Associate Director- Data Insights | AT&T       | $255,830          | 2023-06-18      |
| Data Analyst, Marketing     | Pinterest       | $232,423          | 2023-12-05      |
| Data Analyst (Hybrid/Remote)| UCLA Healthcare | $217,000          | 2023-01-17      |

**Insight:** Senior-level roles dominate top salaries; specialized marketing and hybrid roles also command high pay.

<img width="1089" alt="image" src="https://github.com/user-attachments/assets/9382e798-cea3-48fb-8426-b147def3f1fd" />


---

### 3. Job Titles & Salary Trends

- Job titles vary widely from entry-level Data Analyst to senior/principal/director positions.  
- Salary ranges reflect seniority and specialization, with some outliers likely due to company-specific compensation.

  <img width="1089" alt="image" src="https://github.com/user-attachments/assets/78782cea-0481-475e-8f78-d2afd9b6249b" />

  ---

### 4. Skills & Job Trends

- High-Paying Niche Skills

Kafka ($129,999), PyTorch ($125,226), Perl ($124,686) are less commonly demanded (20–40 mentions) but offer high salaries.
These are often specialized roles in machine learning, legacy systems, or stream processing.

- Balanced Popular Skills

Airflow (71 jobs, $116,387), Scala (59 jobs, $115,480), Pyspark (49 jobs, $114,058) offer a good balance between demand and pay.
These skills are commonly used in big data pipelines and ETL workflows.

 - Very High Demand, Competitive Salary

Snowflake (241 jobs), Spark (187 jobs), Hadoop (140 jobs) — extremely high demand and strong compensation (~$110K+).
These technologies are core to modern data platforms, making them highly employable.

<img width="1100" alt="image" src="https://github.com/user-attachments/assets/c34687f7-a5cc-4e78-bcbe-6a0f6bf8300a" />

### 5. Skills in High Demand but Below-Average Salary
The following chart and table show skills that are frequently required in Data Analyst roles but have an average salary lower than the overall average ($93,876). This can indicate either:

Commoditized skills (commonly expected, lower pay),
Or baseline tools that are not differentiators in compensation.
Key Observations:

Excel is the most in-demand skill but offers a salary significantly below average.
Tools like Power BI, SAS, and SPSS show high demand but modest compensation.
Visualization and reporting tools dominate this list.

<img width="1023" alt="image" src="https://github.com/user-attachments/assets/d95a3455-dce3-4058-8a57-5cc2100a56c6" />


---

## 🛠️ How to Use This Repo

1. Clone the repo:  
   ```bash
   git clone https://github.com/yourusername/data-analyst-job-market.git
   cd data-analyst-job-market

   
👨‍💻 About Me

I am a Data Science professional passionate about analyzing market trends and providing actionable insights. This project reflects hands-on experience with advanced SQL data analysis and visualization relevant to the job market.

📫 Contact

Feel free to reach out:
Email: tushar.bhatia1998@gmail.com
LinkedIn: https://www.linkedin.com/in/tushar-bhatia-b903a4185/
