
-- ..............SQLBOLT website ASSIGNMENTS  all run in www.sqlbolt.com/............

-- .........................Exercise 1 — Tasks ............................
-- Q1.Find the title of each film
SELECT title FROM movies;
-- Q1.Find the director of each film
SELECT director FROM movies; 
-- Q1.Find the title and director of each film
SELECT title, director FROM movies; 
-- Q1.Find the title and year of each film
SELECT title, year FROM movies; 
-- Q1.Find all the information about each film
SELECT * FROM movies; 

-- .........................Exercise 2 — Tasks ............................
-- Q2.Find the movie with a row id of 6
SELECT id, title FROM movies 
WHERE id = 6;
-- Q2.Find the movies released in the years between 2000 and 2010
SELECT title, year FROM movies
WHERE year BETWEEN 2000 AND 2010;
-- Q2.Find the movies not released in the years between 2000 and 2010
SELECT title, year FROM movies
WHERE year < 2000 OR year > 2010;
-- Q2.Find the first 5 Pixar movies and their release year
SELECT title, year FROM movies
WHERE year <= 2003;

-- .........................Exercise 3 — Tasks ............................
-- Q3.Find all the Toy Story movies
SELECT title, director FROM movies 
WHERE title LIKE "Toy Story%";
-- Q3.Find all the movies directed by John Lasseter
SELECT title, director FROM movies 
WHERE director = "John Lasseter";
-- Q3.Find all the movies (and director) not directed by John Lasseter
SELECT title, director FROM movies 
WHERE director != "John Lasseter";
-- Q3.Find all the WALL-* movies
SELECT * FROM movies 
WHERE title LIKE "WALL-_";

-- .........................Exercise 4 — Tasks ............................
-- Q4.List all directors of Pixar movies (alphabetically), without duplicates
SELECT DISTINCT director FROM movies
ORDER BY director ASC;
-- Q4.List the last four Pixar movies released (ordered from most recent to least)
SELECT title, year FROM movies
ORDER BY year DESC
LIMIT 4;
-- Q4.List the first five Pixar movies sorted alphabetically
SELECT title FROM movies
ORDER BY title ASC
LIMIT 5;
-- Q4.List the next five Pixar movies sorted alphabetically
SELECT title FROM movies
ORDER BY title ASC
LIMIT 5 OFFSET 5;

-- .........................Exercise 5 — Tasks ............................
-- Q5.List all the Canadian cities and their populations
SELECT city, latitude FROM north_american_cities
WHERE country = "United States"
ORDER BY latitude DESC;
-- Q5.Order all the cities in the United States by their latitude from north to south
SELECT city, latitude FROM north_american_cities
WHERE country = "United States"
ORDER BY latitude DESC;
-- Q5.List all the cities west of Chicago, ordered from west to east
SELECT city, longitude FROM north_american_cities
WHERE longitude < -87.629798
ORDER BY longitude ASC;
-- Q5.List the two largest cities in Mexico (by population)
SELECT city, population FROM north_american_cities
WHERE country LIKE "Mexico"
ORDER BY population DESC
LIMIT 2;
-- Q5.List the third and fourth largest cities (by population) in the United States and their population
SELECT city, population FROM north_american_cities
WHERE country LIKE "United States"
ORDER BY population DESC
LIMIT 2 OFFSET 2;

-- .........................Exercise 6 — Tasks ............................
-- Q6.Find the domestic and international sales for each movie 
SELECT movies.title, boxoffice.domestic_sales, boxoffice.international_sales FROM boxoffice
join movies on movies.id=boxoffice.movie_id; -- table name 1st. column name 2nd
		-- it does not matter which table1 (movies)& table 2(boxoffice) come 1st and 2nd therefore we can rewite
        
-- Q6.Find the domestic and international sales for each movie
SELECT title, Domestic_sales, International_sales 
FROM movies 
join boxoffice on movies.id=boxoffice.movie_id;

-- Q6.Show the Movies id for each movie that did better internationally rather than domestically (my own)
SELECT movies.title, boxoffice.movie_id as 'movie_id'
FROM movies
join boxoffice on movies.id=boxoffice.movie_id
where boxoffice.Domestic_sales <  boxoffice.International_sales
group by movies.title
order by boxoffice.movie_id asc;

-- Q6.Show the sales numbers for each movie that did better internationally rather than domestically
SELECT movies.title, boxoffice.domestic_sales, boxoffice.international_sales
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id
WHERE boxoffice.domestic_sales < boxoffice.international_sales -- '>' resulted vice versa of Q: Dom better than Int
order by boxoffice.domestic_sales desc;  -- OR-- order by boxoffice.international_sales desc;

-- Q6.List all the movies by their ratings in descending order
select movies.title, boxoffice.rating 
from movies
join boxoffice on movies.id=boxoffice.movie_id
order by boxoffice.rating desc;

-- .........................Exercise 7 — Tasks ............................
-- Q7.Find the list of all buildings that have employees
SELECT DISTINCT building FROM employees;
-- Q7.Find the list of all buildings and their capacity
SELECT * FROM buildings;
-- Q7.List all buildings and the distinct employee roles in each building (including empty buildings) 
SELECT distinct building_name, role FROM buildings 
	left join Employees ON Building_name= Building;

-- .........................Exercise 8 — Tasks ............................
-- Q8.Find the names of the buildings that hold no employees 
SELECT building_name FROM buildings -- building_name in BUILDINGS (1w, 2e) has NO comman values in EMPLOYEES
  LEFT JOIN employees ON building_name = building -- HERE ALL COLUMN NAMES ARE DIFFERENT, WE DONT USE DOT(.) TABLE NAME
WHERE name is NULL;                                   -- WE JUST USE COLUMN NAMES

-- .........................Exercise 9 — Tasks ............................
-- Q9.List all movies and their combined sales in millions of dollars
SELECT title, (domestic_sales + international_sales) / 1000000 -- combined sales in millions of dollars
    FROM movies
    join boxoffice on id=movie_id;
    
-- Q9.List all movies and their ratings in percent 
    SELECT title, rating * 10 AS rating_percent  -- Percentage
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;
  
-- Q9.List all movies and their combined sales in millions of dollars
    SELECT distinct title, year
		FROM movies
		WHERE year % 2 =0; -- For all EVEN numbers, for ODD numbers ' column name % 2 =1'
	
-- .........................Exercise 10 — Tasks ............................    
-- Q10.Find the longest time that an employee has been at the studio 
SELECT max(years_employed) FROM employees; -- remember, if COUNT() then we can use *, any column name

-- Q10.For each role, find the average number of years employed by employees in that role 
select role, avg(years_employed) from employees
group by role; -- remember, if COUNT() then we can use *, any column name or same column name 'role'

-- Q10.Find the total number of employee years worked in each building
select building, sum(years_employed) from employees
group by building;  -- remember, if COUNT() then we can use *, any column name or same column name 'building'    

-- .........................Exercise 11 — Tasks ............................
-- Q11.Find the number of Employees of each role in the studio
SELECT role, count(role) FROM employees
group by role;

-- Q11.Find the total number of years employed by all Engineers
SELECT role, sum(years_employed) FROM employees
where role='Engineer'
group by role;
-- OR
SELECT role, SUM(years_employed)  -- my own
FROM employees
where role = "Engineer";  -- without 'HAVING clause' and 'Group By'

-- OR can be write (sqlbolt website)
SELECT role, SUM(years_employed)
FROM employees
GROUP BY role
HAVING role = "Engineer"; -- without 'WHERE clause'

-- Q11.Find the number of Artists in the studio (without a HAVING clause)
-- change : Find the number of cities in the world.city table (without a HAVING clause)
select * from world.city;
SELECT city, count(city) FROM world.city
where city='asia';  -- '' does not work in SQLbolt

-- -- Q12.Find the total (domestic and international) sales that can be attributed to each director 
--            (**this question cover Aggregate Function: SUM(), JOIN, GROUP BY **) 

SELECT director, sum(Domestic_sales)+sum(International_sales) as 'total domestic and international sales'
FROM movies
join  boxoffice on movies.id= boxoffice.movie_id  -- join with 'IDs' when both Tables are connected now think its One Table
group by director                            -- now, Think how to apply Group BY command because its One Table
order by count(director) desc;          -- where we have 'Director'column and 'domestic and international sales'columns

-- Q12.Find the total domestic and total international sales that can be attributed to each director (my own)
SELECT director, sum(Domestic_sales) as 'total domestic sales', sum(International_sales) as 'total international sales'
FROM movies
join  boxoffice on movies.id= boxoffice.movie_id
group by director
order by count(director) desc;

-- Q12.Find the total domestic and total international sales that can be attributed to director namely 'John Lasseter'
SELECT director, sum(Domestic_sales), sum(International_sales) 
FROM movies
join  boxoffice on movies.id= boxoffice.movie_id
where director='John Lasseter'
group by director
order by count(director) desc;

-- Q12.Find the number of movies each director has directed 
SELECT director, count(director) FROM movies
group by Director
order by count(director) desc;

-- .........................Exercise 13 — Tasks ............................
-- Q13.Add the studio's new production, Toy Story 4 to the list of movies (you can use any director)
INSERT INTO Movies
 VALUES (4, 'Toy Story 4','John Lasseter',1999,93);
 
 -- Q13.Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million 
 -- domestically and 270 million internationally. Add the record to the BoxOffice table.
 insert into BoxOffice
 values(4,8.7, 34000000, 27000000);
 
 -- JUST I USED in Q13 to replace ID
update BoxOffice   -- just REPLACE id from 5 to 4
set Movie_id= 5 
where Movie_id=4;

update BoxOffice   -- Same Result as above, just use another COLUMN 
set Movie_id= 5 
where Rating=8.7;

-- .........................Exercise 14 — Tasks ............................
-- Q14.The director for A Bug's Life is incorrect, it was actually directed by John Lasseter
update movies
 set director='John Lasseter'
 where id=2;
 
 -- Q14.The year that Toy Story 2 was released is incorrect, it was actually released in 1999
 update movies
 set year=1999
 where title='Toy Story 2';
 
 -- Q14.Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" 
 -- and it was directed by Lee Unkrich
 Update Movies
 Set Title='Toy Story 3' , Director='Lee Unkrich'
 Where id=11;
 
 -- .........................Exercise 15 — Tasks ............................
 -- Q15.This database is getting too big, lets remove all movies that were released before 2005.
 Delete FROM movies
 where year<2005;
 
 -- Q15.Andrew Stanton has also left the studio, so please remove all movies directed by him.
 delete FROM movies
 where director='Andrew Stanton';
 
 -- .........................Exercise 16 — Tasks ............................
	create table DB (        -- DataBase
		Name varchar(50),    -- sqlbolt use TEXT
		version INT,         -- sqlbolt use INTEGER
		Download_count INT
		);
 
 -- Adding columns

-- Altering table to add new column(s)
-- ALTER TABLE mytable
-- ADD column DataType Constraint 
-- DEFAULT default_value;

-- Removing columns

-- Altering table to remove column(s)
-- ALTER TABLE mytable
-- DROP column_to_be_deleted;

-- Renaming the table

-- Altering table name
-- ALTER TABLE mytable
-- RENAME TO new_table_name;

-- .........................Exercise 17 — Tasks ............................
-- Q17.Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in.
SELECT * FROM movies;
ALTER TABLE Movies
ADD column Aspect_ratio FLOAT DEFAULT 2.39;

-- Q17.Add another column named Language with a TEXT data type to store the language that the movie was released in. 
-- Ensure that the default for this language is English. 
ALTER TABLE Movies
  ADD column Language TEXT default 'English';

-- .........................Exercise 18 — Tasks ............................  
  -- Q18.  drop the tables
  -- We've sadly reached the end of our lessons, lets clean up by removing the Movies table
  drop table boxoffice;
  -- And drop the BoxOffice table as well
  drop table movies;
  
 
 
 


                            

