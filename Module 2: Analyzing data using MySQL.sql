-- Calculate the total number of incidents reported
SELECT COUNT(*) AS total_incidents FROM fatalities_cleaned;

-- Calculate the year-to-year percentage changes in the number of fatalities
SELECT YEAR(incident_date) AS Year, 
       COUNT(*) AS Incidents,
       ROUND((COUNT(*) - LAG(COUNT(*), 1) OVER(ORDER BY YEAR(incident_date))) / LAG(COUNT(*), 1) OVER(ORDER BY YEAR(incident_date)) * 100) AS Yearly_Change_Percentage
FROM fatalities_cleaned
WHERE YEAR(incident_date) <> 2022
GROUP BY Year;

-- Calculate the total number of fatalities that received a citation
SELECT COUNT(*) AS citation_received FROM fatalities_cleaned WHERE citation IS NOT NULL;

-- Calculate day of the week with most fatalities
SELECT day_of_week, 
       COUNT(*) AS fatalities_count, 
       ROUND((COUNT(*) / (SELECT COUNT(*) FROM fatalities_cleaned)) * 100, 2) AS Percentage 
FROM fatalities_cleaned 
GROUP BY day_of_week 
ORDER BY fatalities_count DESC LIMIT 1;

-- Calculate the total number of fatalities during welding
SELECT COUNT(*) AS welding_fatalities FROM fatalities_cleaned WHERE description LIKE '%welding%';

-- Fetch the last 5 fatalities during welding
SELECT * FROM fatalities_cleaned WHERE description LIKE '%welding%' ORDER BY incident_date DESC LIMIT 5;

-- Top 5 states with most fatal incidents
SELECT state, COUNT(*) AS fatal_incidents FROM fatalities_cleaned GROUP BY state ORDER BY fatal_incidents DESC LIMIT 5;

-- Top 5 states with most fatal incidents from stabbings
SELECT state, COUNT(*) AS stabbing_fatalities FROM fatalities_cleaned WHERE description LIKE '%stabbing%' GROUP BY state ORDER BY stabbing_fatalities DESC LIMIT 5;

-- Top 10 states with most fatal incidents from shootings
SELECT state, COUNT(*) AS shooting_fatalities FROM fatalities_cleaned WHERE description LIKE '%shooting%' GROUP BY state ORDER BY shooting_fatalities DESC LIMIT 10;

-- Total number of shooting deaths per year
SELECT YEAR(incident_date) AS Year, COUNT(*) AS shooting_deaths FROM fatalities_cleaned WHERE description LIKE '%shooting%' GROUP BY YEAR(incident_date) ORDER BY shooting_deaths DESC;


--Note: Download the 'fatalities_cleaned.csv' datasets and ensure that the database connection details are updated in the "db.py" file before executing the SQL queries.
