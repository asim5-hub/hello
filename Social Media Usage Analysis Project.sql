CREATE DATABASE PROJECT;

use PROJECT;

select * from `social media`;

-- total time spent and productivity loss by gender
select Gender,sum(`Total Time Spent`) as total_time_spent,sum(ProductivityLoss) as productivity_loss
from `social media`
group by Gender;

-- which age spent more time on social media?
select Age,sum(`Total Time Spent`) as total_time  from `social media`
group by age
order by  sum(`Total Time Spent`) desc;

-- on which video category people spent more time
select `Video Category`,sum(`Total Time Spent`) as total_time_spent
from `social media`
group by `Video Category`;

-- which Profession spent more time on social media and their productivity loss
select Profession,sum(`Total Time Spent`) as total_time_spent,sum(ProductivityLoss) as productivity_loss
from `social media`
group by Profession
order by  sum(`Total Time Spent`) desc;

-- which area Rular/Urban spent more time on social media and their productivity loss
select Demographics,sum(`Total Time Spent`) as total_time_spent,sum(ProductivityLoss) as productivity_loss
from `social media`
group by Demographics
order by  sum(`Total Time Spent`) desc;

-- which country spent more time on social media
select Location,sum(`Total Time Spent`) as total_time_spent,sum(ProductivityLoss) as productivity_loss
from `social media`
group by Location
 order by  sum(`Total Time Spent`) desc;
 

-- according to age which age spent most time on which video category
WITH RankedData AS (
    SELECT 
        Age, 
        `Video Category`, 
        SUM(`Total Time Spent`) AS TotalTimeSpent,
        ROW_NUMBER() OVER (PARTITION BY Age ORDER BY SUM(`Total Time Spent`) DESC) AS rank1
    FROM `social media`
    GROUP BY Age, `Video Category`
)
SELECT Age, `Video Category`, TotalTimeSpent
FROM RankedData
WHERE rank1 = 1
ORDER BY TotalTimeSpent desc;

-- which age uses which platform
select Age,platform,sum(`Total Time Spent`)  from `social media`
group by age,platform
order by  sum(`Total Time Spent`) desc;

-- according to age which age spent most time on which platform
WITH RankedData AS (
    SELECT 
        Age, 
        `Platform`, 
        SUM(`Total Time Spent`) AS TotalTimeSpent,
        ROW_NUMBER() OVER (PARTITION BY Age ORDER BY SUM(`Total Time Spent`) DESC) AS rank1
    FROM `social media`
    GROUP BY Age, `Platform`
)
SELECT Age, `Platform`, TotalTimeSpent
FROM RankedData
WHERE rank1 = 1
ORDER BY TotalTimeSpent desc;


-- which age uses which platform
select Age,platform,sum(`Total Time Spent`)  from `social media`
group by age,platform
order by  sum(`Total Time Spent`) desc;

-- which age spent time on social media for which reason?
select Age,`Watch Reason` from `social media`
group by age,`Watch Reason`
order by sum(`Watch Reason`) desc;


-- platform by gender and age
select platform,gender,sum(`Total Time Spent`) as total_time from `social media`
group by platform,gender
order by sum(`Total Time Spent`) desc;

-- total time spent by debt or non debt person?
select Debt,sum(`Total Time Spent`) as total_time from `social media`
group by Debt;

--  watch reason of people who spent more time on social media
select `Watch Reason`,sum(`Total Time Spent`) as Total_time from `social media`
group by `Watch Reason`
order by `Watch Reason` desc, sum(`Total Time Spent`) desc;

-- watch reason by gender and age
select Gender,age,`Watch Reason`,sum(`Total Time Spent`) from `social media`
group by gender,age,`Watch Reason`
order by sum(`Total Time Spent`) desc;

-- addiction level by age and gender
select Gender,sum(`Addiction Level`) 
from `social media`
group by Gender; 

-- total time spent and productivity loss by gender
select Gender,sum(`Total Time Spent`) as total_time_spent,sum(ProductivityLoss) as productivity_loss
from `social media`
group by Gender;


-- which profession uses which video category?
select Profession,`Video Category`,sum(`Total Time Spent`) as Total_time from `social media`
group by Profession,`Video Category`
order by profession,Total_time desc;

-- frequency and total time spent by profession ?
select profession, frequency,sum(`Total Time Spent`) as Total_time from `social media`
group by  profession, frequency
order by profession,Total_time desc;

-- productivity loss by gender, age and profession?
select Profession,Gender,Age,sum(ProductivityLoss) 
over(partition by Profession,Gender) 
from `social media` ;

-- total time spent by wifi and mobile
select	ConnectionType,sum(`Total Time Spent`) from  `social media`
group by ConnectionType;

-- Total time spent by Opertaing system
select	OS,sum(`Total Time Spent`) from  `social media`
group by OS;

-- Total time spent by Device Type
select	DeviceType,sum(`Total Time Spent`) from  `social media`
group by DeviceType;


-- update location name to capital letter
update  `social media` 
set Location = upper(Location);

-- where clause:-The WHERE clause is used to filter records.It is used to extract only those records that fulfill a specified condition.
update `social media`
set Location = lower(location) 
where Location = "BarZIL";

-- where clause:-The WHERE clause is used to filter records.It is used to extract only those records that fulfill a specified condition.
-- INNER JOIN:- The INNER JOIN keyword selects records that have matching values in both tables
-- LEFT JOIN :-The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2)
-- RIGHT JOIN :-The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records from the left table (table1)
-- CROSS JOIN :-The CROSS JOIN keyword returns all records from both tables (table1 and table2).
