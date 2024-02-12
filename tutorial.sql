SELECT * FROM `car dealer`.`movies-db-1`
where industry='bollywood';

SELECT count(*) FROM `car dealer`.`movies-db-1`
where industry='bollywood';

SELECT count(*) FROM `car dealer`.`movies-db-1`
where industry='hollywood';

SELECT * FROM `car dealer`.`movies-db-1`
where industry='hollywood';

select distinct industry from  `car dealer`.`movies-db-1`;

select * from  `car dealer`.`movies-db-1` where title like '%thor%';

select * from  `car dealer`.`movies-db-1` where title like '%america%';

select * from  `car dealer`.`movies-db-1` where imdb_rating>=9;

select * from  `car dealer`.`movies-db-1` where imdb_rating between 6 and 8;

select * from  `car dealer`.`movies-db-1` where release_year=2022 or release_year=2019 or release_year=2018;

select * from  `car dealer`.`movies-db-1` where release_year in (2022,2019,2018);

select * from  `car dealer`.`movies-db-1` where release_year in ('Marvel Studios', 'Zee Studios');

select * from  `car dealer`.`movies-db-1` where imdb_rating is NULL;

select * from  `car dealer`.`movies-db-1` where imdb_rating is NOT NULL;

select * from  `car dealer`.`movies-db-1` where industry='bollywood'
order by imdb_rating desc;

select * from  `car dealer`.`movies-db-1` where industry='bollywood'
order by imdb_rating; -- asending order by default

select * from  `car dealer`.`movies-db-1` where industry='bollywood'
order by imdb_rating asc;

select * from  `car dealer`.`movies-db-1` where industry='bollywood'
order by imdb_rating asc limit 5;

select * from  `car dealer`.`movies-db-1` where industry='bollywood'
order by imdb_rating asc limit 5 offset 4;

select min(imdb_rating) from  `car dealer`.`movies-db-1` where industry='bollywood';
select max(imdb_rating) from  `car dealer`.`movies-db-1` where industry='bollywood';
select avg(imdb_rating) from  `car dealer`.`movies-db-1` where industry='bollywood';

select round(avg(imdb_rating),2) 
from  `car dealer`.`movies-db-1` where industry='bollywood';

select min(imdb_rating),max(imdb_rating),round(avg(imdb_rating),2) 
from  `car dealer`.`movies-db-1` 
where industry='bollywood';

select industry, count(*) from  `car dealer`.`movies-db-1`
group by industry;

select studio, count(*), round(avg(imdb_rating),1)
from `car dealer`.`movies-db-1`
group by studio
order by round(avg(imdb_rating),1);

select studio, count(*), round(avg(imdb_rating),1)
from `car dealer`.`movies-db-1`
where studio!=" "
group by studio
order by round(avg(imdb_rating),1);

select release_year, count(*)
from `car dealer`.`movies-db-1`
-- where mc > 2
group by release_year
order by  count(*) desc;

-- FROM --> WHERE --> GROUP BY --> HAVING --> ORDER BY

SELECT YEAR(CURDATE());
SELECT * FROM `car dealer`.`movies-db-1`;

SELECT MIN(IMDB_RATING), MAX(IMDB_RATING), ROUND(AVG(IMDB_RATING),2) 
FROM `car dealer`.`movies-db-1`
WHERE STUDIO='MARVEL STUDIOS';

SELECT COUNT(*) FROM `car dealer`.`movies-db-1` WHERE INDUSTRY='BOLLYWOOD';

SELECT INDUSTRY, COUNT(*) FROM `car dealer`.`movies-db-1` GROUP BY INDUSTRY;

SELECT studio, COUNT(*) FROM `car dealer`.`movies-db-1` GROUP BY studio
order by COUNT(*) desc;

select studio, count(studio), round(avg(imdb_rating),1) 
from `car dealer`.`movies-db-1` 
where studio!=''
GROUP BY studio
order by round(avg(imdb_rating),1) desc;

select release_year, count(*)
from `car dealer`.`movies-db-1` 
WHERE IMDB_RATING > 6
group by release_year
having count(*) > 2  -- aggregate function use HAVING instead of WHERE
order by count(*) desc;

-- FROM --> WHERE --> GROUP BY --> HAVING --> ORDER BY

select * from `car dealer`.`movies-db-1`;

select movie_id, title, release_year from `car dealer`.`movies-db-1`
where movie_id between 110 and 115;

select movie_id, title, release_year from `car dealer`.`movies-db-1`
where  movie_id >110 and movie_id <115;

select 
	movie_id, title, budget, revenue, currency, unit
from movies
	join financials
on movies.movie_id= financials.movie_id;

select 
	movie_id, title, budget, revenue, currency, unit
from movies
	left join financials
on movies.movie_id= financials.movie_id;

select 
	movie_id, title, budget, revenue, currency, unit
from movies
	right join financials
on movies.movie_id= financials.movie_id;

select 
	movie_id, title, budget, revenue, currency, unit
from movies
	left OUTER join financials
on movies.movie_id= financials.movie_id

UNION

select 
	movie_id, title, budget, revenue, currency, unit
from movies
	right OUTER join financials
on movies.movie_id= financials.movie_id;















