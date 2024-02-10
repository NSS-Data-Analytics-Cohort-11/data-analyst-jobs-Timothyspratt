-- 1.	How many rows are in the data_analyst_jobs table?

SELECT *
FROM data_analyst_jobs;

-- Answer: 1793 Rows

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- Answer: ExxonMobil

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location='TN' OR
location ='KY';

-- Answer: TN=21, TN OR KY=27

-- 4.	How many postings in Tennessee have a star rating above 4?

SELECT star_rating, location
FROM data_analyst_jobs
WHERE star_rating >4 AND
location='TN';

-- Answer: 3

-- 5.	How many postings in the dataset have a review count between 500 and 1000?

SELECT *
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- Answer: 151

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY state
ORDER BY avg_rating DESC;

-- Answer: Nebraska has the highest rating

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT DISTINCT(title)
FROM data_analyst_jobs;

-- Answer: There are 881 unique titles

-- 8.	How many unique job titles are there for California companies?

SELECT DISTINCT(title)
FROM data_analyst_jobs
WHERE location IN ('CA');

-- Answer: There are 230 unique job titles in CA

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT DISTINCT(company), AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count >5000
AND company IS NOT NULL
GROUP BY company;

-- Answer: There are 40 companies that have more than 5000 review across all locations.

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count >5000
GROUP BY company
ORDER BY AVG(star_rating) DESC;

-- Answer: There are 6 companies with the highest rating of 4.199

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

SELECT DISTINCT(title)
FROM data_analyst_jobs
WHERE title ilike '%Analyst%';

-- Answer: There are 774 job titles that contain 'Analyst'

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT title
FROM data_analyst_jobs
WHERE title NOT ilike '%analyst%'
AND title NOT ilike '%analytics%';

-- Answer:There are 4 different job titles that do not contain analyst or analytics. They have Tableau in common.