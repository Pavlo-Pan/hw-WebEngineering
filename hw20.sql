USE hr;
SELECT COUNT(*) AS employee_count
FROM employees;

SELECT COUNT(*) AS department_count
FROM departments;

USE world;

SELECT AVG(Population) AS avg_india_city_population
FROM city
WHERE CountryCode = 'IND';

SELECT
  MIN(Population) AS min_india_city_population,
  MAX(Population) AS max_india_city_population
FROM city
WHERE CountryCode = 'IND';

SELECT
  Name AS country_with_max_area,
  SurfaceArea AS max_surface_area
FROM country
WHERE SurfaceArea = (
  SELECT MAX(SurfaceArea)
  FROM country
);

SELECT AVG(LifeExpectancy) AS avg_life_expectancy
FROM country;

SELECT
  Name AS city_name,
  Population AS city_population
FROM city
WHERE Population = (
  SELECT MAX(Population)
  FROM city
);