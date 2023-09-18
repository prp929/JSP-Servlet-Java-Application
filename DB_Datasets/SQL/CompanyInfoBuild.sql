/*
TABLE INFO:


*/

drop table if exists companyInfo;
drop table if exists sectorInfo; 

create table companyInfo(
symbol varchar(5) not null,
name varchar(50),
sector varchar(50),
price decimal(10,2),
price_earnings_ratio decimal,
dividend_yield decimal,
earnings_share decimal,
year_low decimal,
year_high decimal,
market_cap bigint,
ebitda bigint,
price_sales_ratio decimal,
price_book_ratio decimal,
sec_filing_link varchar(255),
primary key(symbol)
);

create table sectorInfo(
symbol varchar(5) not null primary key,
name varchar(50),
sector varchar(50)
);


LOAD DATA INFILE "db_final_project\\Company Information\\cf.csv"  
INTO TABLE companyInfo
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "db_final_project\\Company Information\\sectorInfo.csv"
INTO TABLE sectorInfo
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;