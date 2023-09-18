/*
Table descriptions:

AHE: Average Hourly Earnings of All Private Employees

INFL: Inflation as measured by the consumer price index reflects the 
annual percentage change in the cost to the average consumer of
 acquiring a basket of goods and services that may be fixed or changed
 at specified intervals, such as yearly. 
 
 GDP: Gross domestic product (GDP), the featured measure of U.S. output, 
 is the market value of the goods and services produced by 
 labor and property located in the United States
 
 EMP: All Employees: Total Nonfarm, commonly known as Total Nonfarm 
 Payroll, is a measure of the number of U.S. workers in the economy 
 that excludes proprietors, private household employees, unpaid 
 volunteers, farm employees, and the unincorporated self-employed. 
 This measure accounts for approximately 80 percent of the workers 
 who contribute to Gross Domestic Product (GDP).
 unit: thousands of people
 
 PCE: an index that measures monthly changes 
 in the price of consumer goods and services as a means of 
 analyzing inflation. Unit: billions of dollars
 
 VIX: measures market expectation of near term volatility conveyed 
 by stock index option prices; units are index
*/

/******************* Build Tables **********************/
drop table if exists ahe;
drop table if exists infl;
drop table if exists gdp;
drop table if exists emp;
drop table if exists pce;
drop table if exists vix;

create table ahe(
	date date primary key,
    rate numeric(10,2)
);

create table infl(
	date date primary key,
    percent numeric(6,2)
);

create table gdp(
	date date primary key,
    amount numeric(10,3)
);

create table emp(
	date date primary key,
    numPpl int
);

create table pce(
	date date primary key,
    idk numeric(6,1)
);

create table vix(
	date date primary key,
    idx varchar(6)
);

/******************* Load Data **********************/
LOAD DATA INFILE "db_final_project\\Economic Indicators\\ahe.csv"  
INTO TABLE ahe 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "db_final_project\\Economic Indicators\\emp.csv" 
INTO TABLE emp 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "db_final_project\\Economic Indicators\\GDP.csv"  
INTO TABLE gdp 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "db_final_project\\Economic Indicators\\infl.csv"
INTO TABLE infl 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "db_final_project\\Economic Indicators\\PCE.csv"  
INTO TABLE pce 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "db_final_project\\Economic Indicators\\VIXCLS.csv"
INTO TABLE vix 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;