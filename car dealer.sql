-- -------------------------------My SQL Project : Car Dealer------------------------------
-- Read Cars data
SELECT * FROM `car dealer`.`car dekho`;

-- total Cars: to get a count of total records
select count(*) from  `car dealer`.`car dekho`;

-- the manager asked the employee how many cars will be available in 2023?
select count(name) from `car dealer`.`car dekho`
where year=2023;

-- or 
select year, count(year) from `car dealer`.`car dekho`
group by year
having year=2023;

-- the manager asked the employee how many cars is available in 2020, 2021, 2022
select year, count(*) from `car dealer`.`car dekho`   -- here we can use * or any column
group by year
having year=2020 or year=2021 or year=2022;

-- clint asked me to print the total of all cars by year.I don't see all the details.
select count(*), year, fuel from `car dealer`.`car dekho`
where year=2020 and fuel='Diesel';

-- clint asked to car dealer agent how many diesel cars will be in 2020.
select year, count(year) from `car dealer`.`car dekho`
group by year
order by year desc;

-- -----------------------  ------------------------------

SELECT * FROM `car dealer`.`car dekho`;

-- clint requested a car dealer agent how many petrol cars will there be in 2020.
select count(*) from `car dealer`.`car dekho`
where year= 2020 and fuel='Petrol'; -- 51

-- the manager told the employee to give a print all fuel cars (cng, PETROL, diesel) come by all year.
select year, count(year) from `car dealer`.`car dekho`
where fuel='petrol'
group by year;

-- the manager told the employee to give a print all fuel cars (cng, petrol, DIESEL) come by all year.
select year, count(year) from `car dealer`.`car dekho`
where fuel='diesel'
group by year;

-- the manager told the employee to give a print all fuel cars (CNG, petrol, diesel) come by all year.
select year, count(year) from `car dealer`.`car dekho`
where fuel='cng'
group by year;

-- manager said there were more than 100 cars in a given year, which year had more than 100 cars
select year, count(year) from `car dealer`.`car dekho`
group by year
having count(year)>100;

-- manager said there were more than 100 cars in a given year, which year had less than 50 cars
select year, count(year) from `car dealer`.`car dekho`
group by year
having count(year)<50;

-- all cars by name count details between 2015 a
-- the manager said to the employee all cars count details with names between 2015 and 2023 we need complete list
select name, count(name) from `car dealer`.`car dekho`
where year between 2015 and 2023
group by name;

-- the manager said to the employee all cars count details between 2015 and 2023 we need complete list
select count(*) from `car dealer`.`car dekho`
where year between 2015 and 2023;

-- the manager said to the employee all cars details between 2015 and 2023 we need complete list
select * from `car dealer`.`car dekho`
where year between 2015 and 2023;

-- END--
