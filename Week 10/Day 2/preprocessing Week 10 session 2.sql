CREATE DATABASE hr_preprocessing_demo;
USE hr_preprocessing_demo;

DROP TABLE IF EXISTS employees_raw;
CREATE TABLE employees_raw (
  emp_id INT PRIMARY KEY AUTO_INCREMENT,
 
  -- Key used in real-world HR systems (may be missing/duplicated in raw imports)
  national_id VARCHAR(20) NULL,
 
  first_name VARCHAR(50) NULL,
  last_name  VARCHAR(50) NULL,
 
  -- Often messy: spaces, missing, invalid format
  email VARCHAR(120) NULL,
 
  -- Often messy: +20..., 02..., spaces, letters
  phone VARCHAR(40) NULL,
 
  -- Inconsistent text: different casing, extra spaces
  department VARCHAR(50) NULL,
  job_title VARCHAR(80) NULL,
 
  -- Dates stored as TEXT from Excel exports (mixed formats)
  hire_date_text VARCHAR(30) NULL,
  hire_date DATE NULL,
 
  -- Salary comes as TEXT with currency, commas, spaces, N/A
  salary_text VARCHAR(30) NULL,
  salary_num DECIMAL(10,2) NULL,
 
  -- Bonus percentage might be invalid/outlier
  bonus_pct_text VARCHAR(10) NULL,
  bonus_pct DECIMAL(5,2) NULL,
 
  -- Gender inconsistent
  gender VARCHAR(20) NULL,
 
  -- Performance score should be 0..100 but we insert outliers
  performance_score INT NULL,
 
  
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
/* =======================================================
 Insert messy, realistic training data (Egyptian names in English)
- This dataset includes ALL common issues:
  * NULLs and empty strings
  * duplicates (same national_id)
  * invalid salary / outliers
  * inconsistent date formats
  * inconsistent department names
  * invalid phone/email formats
  * invalid gender values
  * performance outliers
======================================================= */
INSERT INTO employees_raw

(national_id, first_name, last_name, email, phone, department, job_title, hire_date_text, salary_text, bonus_pct_text, gender, performance_score)

VALUES

('29801011234567','Mohamed','ElSayed','mohamed.elsayed@company.com','+20 10 1234 5678','Sales','Sales Rep','2022-03-15','12000 EGP','10%','M',85),
 
-- Missing email, department has spaces + different casing, date dd/mm/yyyy

('29802021234567','Eman','Hassan',NULL,'010-9876-5432','  sales  ','Sales rep','15/04/2022','11,500 EGP','8%','Female',88),
 
-- Duplicate national_id (same employee imported twice)

('29802021234567','Eman','Hassan','eman.hassan@company.com','01098765432','SALES','Sales Rep','2022/04/15','11500','8','F',88),
 
-- Invalid phone (letters), invalid gender, salary N/A, performance outlier 140

('29803031234567','Ahmed','Magdy','ahmed.magdy@company.com','010ABCD9999','IT','Data Analyst','04-05-2023','N/A','12%','Xx',140),
 
-- Salary outlier very high, hire_date in mm/dd/yyyy

('29804041234567','Nour','Ali','nour.ali@company.com','+20(11)22223333','Finance','Accountant','05/20/2021','999999 EGP','15%','F',92),
 
-- Negative salary (invalid), empty last name, empty hire_date_text

('29805051234567','Youssef','', 'youssef@company.com','012 0000 1111','HR','HR Specialist','', '-5000 EGP','5%','M',70),
 
-- Missing national_id (cannot join reliably), messy email spaces

(NULL,'Mona','Saad','  mona.saad@company.com  ','0020 10 7777 8888','Operations','Coordinator','2021-11-01','9500 EGP','7%','F',78),
 
-- Department typo + salary with commas + bonus with percent sign

('29807071234567','Karim','Fathy','karim.fathy@company.com','010 3333 4444','Operatons','Coordinator','01/12/2021','9,800 EGP','7%','Male',79),
 
-- Job title inconsistent casing + performance negative

('29808081234567','Salma','Adel','salma.adel@company.com','01055556666','Marketing','marketing specialist','2020-06-10','13000 EGP','9%','F',-10),
 
-- Missing first name, invalid email (no @), bonus outlier 200%

('29809091234567',NULL,'Gamal','gamal.company.com','01011112222','IT','Developer','10/08/2022','18000 EGP','200%','M',95),
 
-- Extra spaces everywhere + date with slashes yyyy/mm/dd

('29810101234567','  Hany  ','  Nabil ','hany.nabil@company.com','010 2222 3333',' finance ','Accountant','2021/07/01','14 000 EGP','10%','M',83);
select* from employees_raw;
SELECT
    SUM(national_id IS NULL) AS missing_national_id,
    SUM(first_name IS NULL OR TRIM(first_name)='') AS missing_first_name,
    SUM(last_name IS NULL OR TRIM(last_name)='') AS missing_last_name,
    SUM(email IS NULL OR TRIM(email)='') AS missing_email,
    SUM(hire_date_text IS NULL OR TRIM(hire_date_text)='') AS missing_hire_date_text,
    SUM(salary_text IS NULL OR TRIM(salary_text)='') AS missing_salary_text
    FROM employees_raw;
--------------
SELECT national_id, COUNT(*) AS cnt
FROM employees_raw
WHERE national_id IS NOT NULL
GROUP BY national_id
HAVING COUNT(*) > 1;

SELECT department, COUNT(*) AS cnt
FROM employees_raw
GROUP BY department
ORDER BY cnt DESC;

UPDATE employees_raw
SET
first_name	 = NULLIF(TRIM(first_name), ' '),
last_name	 = NULLIF(TRIM(last_name), ' '),
email		 = NULLIF(TRIM(email), ' '),
phone		 = NULLIF(TRIM(phone), ' '),
department	 = NULLIF(TRIM(department), ' '),
job_title	 = NULLIF(TRIM(job_title), ' '),
hire_date_text = NULLIF(TRIM(hire_date_text), ' '),
salary_text = NULLIF(TRIM(salary_text), ''),
bonus_pct_text = NULLIF(TRIM(bonus_pct_text), ''),
gender = NULLIF(TRIM(gender), '');

SELECT * FROM employees_raw;

-- Standardization توحد القياسات بالبلدي

UPDATE employees_raw
SET department = CASE
    WHEN department IS NULL THEN NULL
    WHEN LOWER(department) IN ('sales',' sales ','sales ') THEN 'SALES'
    WHEN LOWER(department) IN ('it','i.t','information technology') THEN 'IT'
    WHEN LOWER(department) IN ('finance',' finance ') THEN 'FINANCE'
    WHEN LOWER(department) IN ('hr','human resources') THEN 'HR'
    WHEN LOWER(department) IN ('operations','operatons') THEN 'OPERATIONS'
    WHEN LOWER(department) IN ('marketing') THEN 'MARKETING'
    ELSE UPPER(department)
END;

SELECT * From employees_raw ;

set SQL_SAFE_UPDATES = 0;
-- 6.2 Gender standardization to ('M','F',NULL)
UPDATE employees_raw
SET gender = CASE
    WHEN gender IS NULL THEN NULL
    WHEN LOWER(gender) IN ('m','male','man') THEN 'M'
    WHEN LOWER(gender) IN ('f','female','woman') THEN 'F'
    ELSE NULL
END;


/* =======================================================
7) PARSE DATES (hire_date_text -> hire_date)
 - Handle multiple patterns:
 1) YYYY-MM-DD
 2) DD/MM/YYYY
 3) YYYY/MM/DD
 4) MM/DD/YYYY
 5) DD-MM-YYYY
======================================================= */