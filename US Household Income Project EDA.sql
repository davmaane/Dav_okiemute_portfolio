# US Household 	Income Project

# Exploratory Data Analysis

SELECT * 
FROM us_household_income_project.ushouseholdincome;

SELECT * 
FROM us_household_income_project.ushouseholdincome_statistics;

# identifying the Largest states by Land

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income_project.ushouseholdincome
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

# identifying the Largest states by Water

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income_project.ushouseholdincome
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10;

# Tying both Tables together

SELECT * 
FROM us_household_income_project.ushouseholdincome hi
INNER JOIN us_household_income_project.ushouseholdincome_statistics hs
	ON hi.id = hs.id
WHERE Mean <> 0
;

# identifying the Top States with the average Lowest Income 

SELECT hi.State_Name, round(AVG(Mean),1), round(AVG(Median),1)
FROM us_household_income_project.ushouseholdincome hi
INNER JOIN us_household_income_project.ushouseholdincome_statistics hs
	ON hi.id = hs.id
WHERE Mean <> 0
GROUP BY hi.State_Name
ORDER BY  2
LIMIT 5;

# identifying the Top States with the average Highest Income 

SELECT hi.State_Name, round(AVG(Mean),1), round(AVG(Median),1)
FROM us_household_income_project.ushouseholdincome hi
INNER JOIN us_household_income_project.ushouseholdincome_statistics hs
	ON hi.id = hs.id
WHERE Mean <> 0
GROUP BY hi.State_Name
ORDER BY  2 DESC
LIMIT 10;

# identifying average Highest Income by Type

SELECT Type, COUNT(Type), round(AVG(Mean),1), round(AVG(Median),1)
FROM us_household_income_project.ushouseholdincome hi
INNER JOIN us_household_income_project.ushouseholdincome_statistics hs
	ON hi.id = hs.id
WHERE Mean <> 0
GROUP BY Type
HAVING COUNT(Type) > 100
ORDER BY  3 DESC
LIMIT 20
;

# identifying the Highest average household income cities

SELECT hi.State_Name, City, round(avg(mean),1)
FROM us_household_income_project.ushouseholdincome hi
INNER JOIN us_household_income_project.ushouseholdincome_statistics hs
	ON hi.id = hs.id
GROUP BY hi.State_Name, City
ORDER BY 3 DESC;


















