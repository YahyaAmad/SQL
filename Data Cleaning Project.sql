-- -----------------------Data Cleaning Portfolio Project Queries.sql---------------------------

SELECT * FROM vaccination.nashville200
order by UniqueID;

-- Q1. Standardize Date Format 
-- Method 1 : replace date or values in column without removing the column
SELECT saledate, convert(SaleDate,date) from vaccination.nashville200;
update vaccination.nashville200         -- replace the values in the column
set SaleDate=convert(SaleDate,date);     

-- OR
-- Method 2: add a new column and enter new values
alter table vaccination.nashville200
add saledatenew date;                      -- add column
update  vaccination.nashville200   
set saledatenew=convert("SaleDate",date);  -- insert values inside and drop old column

-- method 1&2 sometime does not Execute because ...see Error

-- Delete Column, remove all above activity
alter table vaccination.nashville200    -- Delete Column
drop column PropertySplitAddress;
-- OR                         -- IF SOMETIME BIG WORK then just use 'Rollback' or Drop can be Work
rollback;

-- practice
SELECT * FROM vaccination.nashville200
ORDER BY PARCELID;
-- select a Table with two colums
SELECT A.parcelID, A.PropertyAddress,isnull(A.PropertyAddress)
from vaccination.nashville200 A;
-- select a Table with two colums
SELECT b.parcelID, b.PropertyAddress,isnull(b.PropertyAddress)
from vaccination.nashville200 b;

SELECT * FROM vaccination.nashville200;
-- Two tables created from one table, combine them with conditions <>, =, =, we can select any COLUMN from Table after WHERE
SELECT A.parcelID , A.PropertyAddress, b.parcelID, b.PropertyAddress  -- even its NOT after SELECT ... UniqueID
from vaccination.nashville200 A, vaccination.nashville200 b          -- which we see its different 
where A.UniqueID <> b.UniqueID and A.PropertyAddress=b.PropertyAddress  and A.parcelID = b.parcelID
order by b.parcelID; -- <> is 'Not Equal To', means WHEN UniqueIDs are NOT same i.e. 'A.UniqueID <> b.UniqueID'
					  -- but 'parcelID' and 'PropertyAddress' are same
                      
SELECT *   -- show all colums
from vaccination.nashville200 A, vaccination.nashville200 b
where A.UniqueID <> b.UniqueID and A.PropertyAddress=b.PropertyAddress  and A.parcelID = b.parcelID
order by b.parcelID;

SELECT *   -- show all colums
from vaccination.nashville200 A, vaccination.nashville200 b
where A.parcelID <> b.parcelID and A.PropertyAddress=b.PropertyAddress  
order by b.parcelID;

SELECT count(A.parcelID) , count(A.PropertyAddress), count(b.parcelID), count(b.PropertyAddress)
from vaccination.nashville200 A, vaccination.nashville200 b
where A.UniqueID <> b.UniqueID and A.PropertyAddress=b.PropertyAddress  and A.parcelID = b.parcelID
order by b.parcelID; -- 18
SELECT count(A.parcelID) , count(A.PropertyAddress), count(b.parcelID), count(b.PropertyAddress)
from vaccination.nashville200 A, vaccination.nashville200 b
where A.UniqueID <> b.UniqueID and A.PropertyAddress=b.PropertyAddress  -- if remove condition 
order by b.parcelID; -- 20

-- rough work
INSERT INTO vaccination.nashville200 (UniqueID,ParcelID,PropertyAddress)
VALUES (664,'012 03 0 018.00', null);
-- DELETE FROM vaccination.nashville200 WHERE LandUse is NULL; 
SELECT * FROM vaccination.nashville200
order by UniqueID;

-- Q2. Populate Property Address data
SELECT PropertyAddress 
from vaccination.nashville200
where PropertyAddress is Null;

SELECT *
from vaccination.nashville200
where PropertyAddress is Null;

SELECT *
from vaccination.nashville200
-- where PropertyAddress is Null
order by ParcelID;

select a.ParcelID, b.ParcelID, a.PropertyAddress, b.PropertyAddress, a.UniqueID , b.UniqueID, 
isnull(a.PropertyAddress,b.PropertyAddress)             -- self join syntex is different in SQL and mySQL
from vaccination.nashville200 a, vaccination.nashville200 b
where a.UniqueID <> b.UniqueID  and a.ParcelID = b.ParcelID and b.PropertyAddress is null;

Update vaccination.nashville200 a, vaccination.nashville200 b  -- self join syntex is different in SQL and mySQL
SET PropertyAddress = isnull(a.PropertyAddress)
where a.UniqueID <> b.UniqueID  and a.ParcelID = b.ParcelID and b.PropertyAddress is null;

SELECT *
from vaccination.nashville200
-- where PropertyAddress is Null
order by ParcelID;
-- ....................

-- Q.3 Breaking out Address into Individual Columns (Address, City, State)

select substring('PropertyAddress', 2, 6);

SELECT SUBSTRING_INDEX("Proper,ty,Add,ress", ",", 1);
SELECT SUBSTRING_INDEX("Proper,ty,Add,ress", ",", 2);

 SELECT SUBSTRING_INDEX("Proper,ty,Address",',', 1);  -- everything before , start from left
 SELECT SUBSTRING_INDEX("Proper,ty,Address",',', -1); -- everything after , start from right

SELECT SUBSTRING(SUBSTRING_INDEX("Proper,ty,Address",',', -1), 1,7); 
-- use UPDATE and ALTER to change in table

select substring(SUBSTRING_INDEX("Proper,ty,Add,ress", ",", 2),2, 5);
-- minus(-) can be used 'SUBSTRING_INDEX' but NOT with SUBSTRING
 
-- select substring(SUBSTRING_INDEX("Proper,ty,Add,ress", ",", 2), 1, LENGTH("PropertyAddress")); -- LENGTH(" ")
-- this one is from vedio

-- Q.4 PARSENAME(REPLACE.....this syntex are in SQL not in mySQL so here solve same as above

-- Q.5 -- Change Y and N to Yes and No in "Sold as Vacant" field
-- Replace null, 'Y' and 'N' with NULL, 'YES' and 'NO' respectivly 

SELECT SoldAsVacant, count(SoldAsVacant) FROM vaccination.nashville200 
group by SoldAsVacant;	-- this tells what we have in the table

-- Q.6 This condition, replace null, 'Y' and 'N' with NULL, 'YES' and 'NO' respectivly                
SELECT SoldAsVacant,
CASE
    WHEN SoldAsVacant='N' THEN 'NO'
    WHEN SoldAsVacant='Y' THEN 'YES'
    WHEN SoldAsVacant is NULL THEN 'NULL'
    ELSE SoldAsVacant
END as aa
FROM vaccination.nashville200
group by SoldAsVacant -- remove this condition give full column, use UPDATE to replace in table
order by SoldAsVacant;

-- Q.7 Remove Duplicates
  
select distinct * from  vaccination.nashville200;   -- remove COUNT() and use CREATE

select count(*) from  vaccination.nashville200;
select count(distinct uniqueID) from  vaccination.nashville200; -- remove COUNT() and use CREATE

-- create table vaccination.nashville200
	-- select distinct * from  vaccination.nashville200;

-- Q.8 Delete Unused Columns

Select *
From vaccination.nashville200;

ALTER TABLE vaccination.nashville200
DROP COLUMN OwnerAddress;
ALTER TABLE vaccination.nashville200
DROP COLUMN TaxDistrict;
ALTER TABLE vaccination.nashville200
DROP COLUMN PropertyAddress;
ALTER TABLE vaccination.nashville200
DROP COLUMN SaleDate;