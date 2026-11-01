CREATE DATABASE college_placement;
USE college_placement;

-- student table
CREATE TABLE student(
student_id INT PRIMARY KEY,
student_name VARCHAR(50),
email VARCHAR(50) UNIQUE,
phone VARCHAR(15),
department VARCHAR(30),
cgpa DECIMAL(3,2),
gradution_year INT
);

-- data insert
INSERT INTO student(student_id,student_name,email,phone,department,cgpa,gradution_year)
VALUES
(1, 'Aditi Sharma', 'aditi@gmail.com', '8976345290','it',8.50,2027 ),
(2, 'Abhinav Gupta', 'abhinav@gmail.com', '6745378934','cse',7.50,2027 ),
(3, 'Rohan Sharma', 'rohan@gmail.com', '6545783990','EE',8.80,2027 ),
(4, 'Priya Sharma', 'priya@gmail.com', '8976564570','cse',8.00,2027 ),
(5, 'Rahul Jain', 'rahul@gmail.com', '6785679988','it',7.80,2027 ),
(6, 'Nidhi Sharma', 'nidhi@gmail.com', '8076445790','cse',8.56,2027 ),
(7, 'Sakshi Gupta', 'sakshi@gmail.com', '90076375890','it',7.55,2027 ),
(8, 'Honey Gupta', 'honey@gmail.com', '6745349860','cse',9.50,2027 ),
(9, 'Parul Sharma', 'parul@gmail.com', '8978907867','it',8.50,2027 ),
(10, 'Ishika Sharma', 'ishika@gmail.com', '9078564590','it',7.50,2027 );



-- COMPANY TABLE
CREATE TABLE company(
company_id  INT PRIMARY KEY,
company_name varchar(100) NOT NULL,
industry VARCHAR(50),
location VARCHAR(50)
);

-- INSERT DATA-- 
INSERT INTO company( company_id,company_name,industry,location)
VALUES
(101,'TCS','IT Servies','Pune'),
(102,'Infosys','IT Servies','Bangalore'),
(103,'Accenture','IT Servies','Gurgaon'),
(104,'Deloite','IT Servies','Hyderabad'),
(105,'Wipro','IT Servies','Hyderabad');


-- job TABLE
CREATE TABLE job(
job_id Int PRIMARY KEY,
company_id  INT,
job_role varchar(100),
package_lpa DECIMAL(5,2),
minimum_cgpa DECIMAL(3,2),

FOREIGN KEY (company_id) 
REFERENCES
company(company_id) 
);

-- INSERT DATA-- 
INSERT INTO job( job_id,company_id,job_role,package_lpa,minimum_cgpa)
VALUES
(201,101,'Software Developer',6.00,7.00),
(202,102,'System Engineer',5.50,8.00),
(203,103,'Analyst',9.00,8.00),
(204,104,'Business Technology',8.00,7.00),
(205,105,'Project Engineer',7.50,8.00),
(206,101,'Data Analyst',9.00,8.00),
(207,103,'Software Engineer',9.00,9.00);


-- TABLE APPLICATION

CREATE TABLE application(
application_id INT PRIMARY KEY,
student_id INT,
job_id INT,
application_date DATE, status VARCHAR(20),

FOREIGN KEY(student_id)
REFERENCES
student(student_id),
Foreign key(job_id)
REFERENCES
job(job_id)
);

-- INSERT DATA
INSERT INTO application( application_id, student_id,job_id,application_date, status)
VALUES
(1, 1, 201, '2026-08-01', 'Selected'),
(2, 2, 201, '2026-08-01', 'Shortlisted'),
(3, 3, 202, '2026-08-03', 'Selected'),
(4, 4, 203, '2026-08-05', 'Selected'),
(5, 5, 202, '2026-08-03', 'Rejected'),
(6, 6, 205, '2026-08-07', 'Shortlisted'),
(7, 7, 204, '2026-08-08', 'Selected'),
(8, 8, 206, '2026-08-10', 'Selected'),
(9, 9, 202, '2026-08-03', 'Rejected'),
(10, 10, 205, '2026-08-07', 'Shortlisted'),
(11, 2, 202, '2026-08-12', 'Selected'),
(12, 3, 203, '2026-08-15', 'Rejected'),
(13, 4, 204, '2026-08-08', 'Selected'),
(14, 8, 207, '2026-08-16', 'Selected'),
(15, 1, 206, '2026-08-10', 'Selected');

-- TABLE SELECTION

CREATE TABLE selection(
selection_id INT PRIMARY KEY,
student_id INT,
job_id INT,
selection_date DATE,
offered_package DECIMAL(5,2)
);

-- INSERT DATA
INSERT INTO selection
(selection_id, student_id, job_id, selection_date, offered_package)
VALUES
(1, 1, 201, '2026-08-20', 6.00),
(2, 3, 202, '2026-08-21', 5.50),
(3, 4, 203, '2026-08-22', 7.00),
(4, 7, 204, '2026-08-23', 8.00),
(5, 8, 206, '2026-08-24', 7.50),
(6, 2, 202, '2026-08-25', 5.50),
(7, 4, 204, '2026-08-23', 8.00),
(8, 8, 207, '2026-08-26', 8.50),
(9, 1, 206, '2026-08-24', 7.50);

/*BASIC QUERY*/

SELECT * FROM student;
SELECT * FROM company;
SELECT * FROM job;
SELECT * FROM application;
SELECT * FROM selection;

/* ====
WHERE CLAUSE means apply a condition ==*/

-- student having cgpa greater than or equal to 8

SELECT student_name, department,cgpa FROM student
WHERE cgpa >= 8.00;

-- cse student

SELECT * FROM student
WHERE department='cse';

-- student gradute in 2027

SELECT student_name, gradution_year FROM
student
WHERE gradution_year=2027;

/* =========
ORDER BY   means check the order is decending or ascending order======*/

-- HIGHEST CGPA FIRST
 SELECT student_name, cgpa FROM student
 ORDER BY cgpa DESC;
 
 -- LOWEST CGPA FIRST
 SELECT student_name, cgpa FROM student
 ORDER BY cgpa ASC;
 
 /**========= DISTINCT means show different========
 **/
 
--  SHOW DIFFERENT DEPARTMENT

SELECT DISTINCT department
FROM student;
 
 /*===========
	AGGREGATE FUNCTIONS means perform calculation on set of values
    they have 5 functions
    ==============*/
    
-- 1.total number of student (count)
SELECT COUNT(*)
AS total_students
FROM student;

-- 2.MAX CGPA
SELECT MAX(cgpa)
AS highest_cgpa
FROM student;

-- 3.MIN CGPA
SELECT MIN(cgpa)
AS lowest_cgpa
FROM student;

-- 4.SUM CGPA
SELECT SUM(cgpa)
AS sum_cgpa
FROM student;

-- 5.AVG CGPA

SELECT ROUND(AVG(cgpa), 2) AS average_cgpa
FROM student;

/*==================
 GROUP BY================*/
 
 -- NUMBER OF STUDENT IN EACH DEPARTMENT
 
  SELECT department,
  COUNT(*) AS total_students
  FROM student
  GROUP BY department;
  
 --  AVERAGE CGPA BY DEPARTMENT
  SELECT department,
  ROUND(AVG(cgpa),2) AS average_cgpa
  FROM student
  GROUP BY department;
  
  /*==========
   Having =============*/
   
  --  department having more than 2 student
  
  SELECT department,
  COUNT(*) AS total_students
  FROM student
  GROUP BY department
  HAVING COUNT(*)>2;
  
  /*==================
    INNER JOINS================*/

/* Show jobs with company names */

SELECT
		j.job_id,
        c.company_name,
        j.job_role,
        j.package_lpa
	FROM job j 
    INNER JOIN company c
		ON j.company_id = c.company_id;
        

/* =========================================================
   MULTIPLE JOIN
   ========================================================= */

/* Show student, company, role and application status */

SELECT 
s.student_name,
c.company_name,
j.job_role,
a.status
FROM application a
INNER JOIN student s
	ON a.student_id = s.student_id
JOIN job j
	ON a.job_id = j.job_id
JOIN company c
	ON j.company_id = c.company_id;
    
/* =========================================================
   SELECTED STUDENTS WITH COMPANY
   ========================================================= */
   
   SELECT 
   s.student_name,
   s.department,
   c.company_name,
   j.job_role,
   se.offered_package
   FROM selection se
   INNER JOIN student s
	ON se.student_id = s.student_id
   JOIN job j 
     ON se.job_id = j.job_id
    JOIN company c
	 ON j.company_id = c.company_id;
    
/* =========================================================
   HIGHEST PACKAGE
   ========================================================= */
   
   SELECT
      MAX(offered_package)
     AS highest_package
   FROM selection;
   
   /* =========================================================
   AVERAGE PACKAGE
   ========================================================= */
   
   SELECT ROUND(AVG(offered_package),2)
    AS avg_package 
    FROM selection;
/* =========================================================
LOWEST PACKAGE
   ========================================================= */

SELECT
    MIN(offered_package) AS lowest_package
FROM selection;


/* =========================================================
COMPANY-WISE APPLICATIONS totalnumber of application in each company
   ========================================================= */

SELECT 
	c.company_name,
    COUNT(a.application_id) AS total_applications
    FROM application a
    JOIN job j 
		ON a.job_id = j.job_id
	JOIN company c
		ON j.company_id = c.company_id
	GROUP BY c.company_name;

/*========================
	Company-wise Selections  total number of Selected student in each company= =============*/
    
    SELECT
		c.company_name,
        COUNT( se.selection_id) AS selected_students
        FROM selection se
	JOIN job j
		ON se.job_id = j.job_id
	JOIN company c
		ON j.company_id = c.company_id
	GROUP BY c.company_name;
    
  --   Department-wise Placement how many student placed in each department
  
	SELECT 
		s.department,
        COUNT( DISTINCT s.student_id) AS placed_students
	FROM student s
    JOIN selection se
		ON se.student_id  = s.student_id
	GROUP BY s.department;
  
  /*==========================
   Students Selected With Package >= 7 LPA==========*/
   
   SELECT
   s.student_name,
   c.company_name,
   se.offered_package
   FROM selection se
   JOIN student s
	  ON se.student_id = s.student_id
   JOIN job j
      ON se.job_id = j.job_id
    JOIN company c
		ON j.company_id = c.company_id
	WHERE se.offered_package>=7.00;
    
/*=====================
		Students Who Applied But Were Rejected=============*/
        
	SELECT
    s.student_name,
    c.company_name,
    j.job_role,
    a.status
    FROM application a
    JOIN student s
		ON a.student_id = s.student_id
	JOIN job j
		 ON a.job_id = j.job_id
    JOIN company c
		ON 	j.company_id = c.company_id
	WHERE a.status  = 'Rejected';
    
    /*=============================
      Students Who Are Shortlisted=================*/
    
    SELECT
    s.student_name,
    c.company_name,
    j.job_role,
    a.status
    FROM application a
    JOIN student s
		ON a.student_id = s.student_id
	JOIN job j
		 ON a.job_id = j.job_id
    JOIN company c
		ON 	j.company_id = c.company_id
	WHERE a.status = 'shortlisted';
	
    /*============
       Eligible Students for Each Job*/
       
       SELECT 
		s.student_name,
        s.cgpa,
        c.company_name,
        j.job_role,
        j.minimum_cgpa
        FROM student s
        CROSS join job j
        JOIN company c
			ON j.company_id = c.company_id
		WHERE s.cgpa>= j.minimum_cgpa;
        
	/*=========================
            Subquery — Average CGPA se zyada*/
            
	SELECT 
    student_name,
    cgpa
    FROM student
    WHERE cgpa > (
			SELECT AVG(cgpa) AS avg_students
             FROM student);

/*========================
       Student With Highest CGPA*/
         SELECT 
    student_name,
    cgpa
    FROM student
    WHERE cgpa = (
			SELECT MAX(cgpa) AS highest_cgpa
            FROM student);
            
	/*====================================
               Student With Highest Package*/
	SELECT 
      s.student_name,
      c.company_name,
      se.offered_package
	FROM selection se
    JOIN student s
		ON se.student_id = s.student_id
	 JOIN job j
		ON se.job_id = j.job_id
	JOIN company c
		ON j.company_id = c.company_id
	WHERE se.offered_package = (
           SELECT MAX(offered_package)
            FROM selection
            
		);

/*===========================
         Company Offering Highest Package*/
         
	
    
   SELECT
    c.company_name,
    j.job_role,
    j.package_lpa
FROM job j
JOIN company c
    ON j.company_id = c.company_id
WHERE j.package_lpa = (
    SELECT MAX(package_lpa)
    FROM job
);

/* =========================================================
   VIEW - PLACEMENT REPORT
   ========================================================= */
      
CREATE VIEW placement_report AS
SELECT
    s.student_id,
    s.student_name,
    s.department,
    c.company_name,
    j.job_role,
    se.offered_package,
    se.selection_date
FROM selection se
JOIN student s
    ON se.student_id = s.student_id
JOIN job j
    ON se.job_id = j.job_id
JOIN company c
    ON j.company_id = c.company_id;
    
   SELECT * FROM placement_report;
   
   /*=======================
		Placement Report Sorted by Package*/
	SELECT * FROM 
      placement_report
      ORDER BY offered_package DESC;
 

/*========================
        Total Placed Students*/
        
	SELECT
    COUNT(DISTINCT student_id) AS total_placed_students
FROM selection;
/*========================
        Unplaced Students*/
        
	SELECT 
       s.student_id,
    s.student_name,
    s.department,
    s.cgpa
FROM student s
LEFT JOIN selection se
    ON s.student_id = se.student_id
WHERE se.student_id IS NULL;


/*======================
    Final Placement Summary*/
    
    SELECT 
    COUNT(DISTINCT s.student_id) AS total_students,
    COUNT(DISTINCT se.student_id) AS placed_students,
    ROUND(
		COUNT(DISTINCT se.student_id) * 100.0
        / COUNT(DISTINCT s.student_id),
        2
    ) AS placement_percentage
FROM student s
LEFT JOIN selection se
	ON s.student_id = se.student_id;

















