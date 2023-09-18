
drop table if exists IndustryEmpDataUS;
drop table if exists IndustryEmpDataChina;
drop table if exists IndustryEmpDataEurope;
drop table if exists IndustryEmpDataIndia;

drop table if exists  AnnualInvestmentReturns;
drop table if exists  valHundo;
drop table if exists  AnnualRealReturns;
drop table if exists  AnnualRiskPremium;

drop table if exists US_Tax;
drop table if exists India_Tax;
drop table if exists Europe_Tax;
drop table if exists China_Tax;


/*********************** Employee Statistics By Industry and Country***********************************/
CREATE TABLE IndustryEmpDataUS (
    IndustryName VARCHAR(255) NOT NULL,
    NumberOfFirms INT NOT NULL,
    NumberOfEmployees INT NOT NULL,
    MarketCapitalization varchar(15) NOT NULL,
    Revenues varchar(15) NOT NULL,
    MktCapPerEmployee varchar(15) NOT NULL,
    RevenuesPerEmployee varchar(15) NOT NULL,
    StockBasedCompensation varchar(15) NOT NULL,
    StockBasedCompensationAsPercentageOfRevenue varchar(15) NOT NULL,
    PRIMARY KEY (IndustryName)
);

CREATE TABLE IndustryEmpDataChina (
    IndustryName VARCHAR(255) NOT NULL,
    NumberOfFirms INT NOT NULL,
    NumberOfEmployees INT NOT NULL,
    MarketCapitalization varchar(15) NOT NULL,
    Revenues varchar(15) NOT NULL,
    MktCapPerEmployee varchar(15) NOT NULL,
    RevenuesPerEmployee varchar(15) NOT NULL,
    StockBasedCompensation varchar(15) NOT NULL,
    StockBasedCompensationAsPercentageOfRevenue varchar(15) NOT NULL,
    PRIMARY KEY (IndustryName)
);

CREATE TABLE IndustryEmpDataEurope (
    IndustryName VARCHAR(255) NOT NULL,
    NumberOfFirms INT NOT NULL,
    NumberOfEmployees INT NOT NULL,
    MarketCapitalization varchar(15) NOT NULL,
    Revenues varchar(15) NOT NULL,
    MktCapPerEmployee varchar(15) NOT NULL,
    RevenuesPerEmployee varchar(15) NOT NULL,
    StockBasedCompensation varchar(15) NOT NULL,
    StockBasedCompensationAsPercentageOfRevenue varchar(15) NOT NULL,
    PRIMARY KEY (IndustryName)
);

CREATE TABLE IndustryEmpDataIndia (
    IndustryName VARCHAR(255) NOT NULL,
    NumberOfFirms INT NOT NULL,
    NumberOfEmployees INT NOT NULL,
    MarketCapitalization varchar(15) NOT NULL,
    Revenues varchar(15) NOT NULL,
    MktCapPerEmployee varchar(15) NOT NULL,
    RevenuesPerEmployee varchar(15) NOT NULL,
    StockBasedCompensation varchar(15) NOT NULL,
    StockBasedCompensationAsPercentageOfRevenue varchar(15) NOT NULL,
    PRIMARY KEY (IndustryName)
);



/*********************** Historical returns by sector *********************************** */

CREATE TABLE  AnnualInvestmentReturns (
    Year INT NOT NULL primary key,
    SP500 varchar(30) NOT NULL,
    ThreeMonthTBill varchar(30) NOT NULL,
    USTBond varchar(30) NOT NULL,
    BaaCorporateBond varchar(30) NOT NULL,
    RealEstate varchar(30) NOT NULL,
    Gold varchar(30) NOT NULL
    );

-- This table is the value of 100$ invested in 1928 til the year selected  
CREATE TABLE  valHundo (
    Year INT NOT NULL primary key,
    SP500 varchar(50) NOT NULL,
    ThreeMonthTBill varchar(50) NOT NULL,
    USTBond varchar(50) NOT NULL,
    BaaCorporateBond varchar(50) NOT NULL,
    RealEstate varchar(50) NOT NULL,
    Gold varchar(50) NOT NULL
    );
    
    CREATE TABLE  AnnualRiskPremium (
    Year INT NOT NULL primary key,
    inflationRate varchar(10) NOT NULL,
    SP500 varchar(50) NOT NULL,
    ThreeMonthTBill varchar(50) NOT NULL,
    USTBond varchar(50) NOT NULL,
    BaaCorporateBond varchar(50) NOT NULL,
    RealEstate varchar(50) NOT NULL,
    Gold varchar(50) NOT NULL
    );

 CREATE TABLE  AnnualRealReturns (
    Year INT NOT NULL primary key,
    inflationRate varchar(10) NOT NULL,
    SP500 varchar(10) NOT NULL,
    ThreeMonthTBill varchar(10) NOT NULL,
    USTBond varchar(10) NOT NULL,
    BaaCorporateBond varchar(10) NOT NULL,
    RealEstate varchar(10) NOT NULL,
    Gold varchar(10) NOT NULL
    );
    
    /*********************** Tax Rates ************************************************* */

CREATE TABLE US_Tax (
  industry_name VARCHAR(255) NOT NULL,
  number_of_firms INT NOT NULL,
  total_taxable_income varchar(30) NOT NULL,
  total_taxes_paid_accrual varchar(30) NOT NULL,
  total_cash_taxes_paid varchar(30) NOT NULL,
  cash_taxes_accrual_ratio varchar(30) NOT NULL,
  EFF_TAX_RATE_all_companies varchar(10) NOT NULL,
  EFF_TAX_RATE_forProfit_companies varchar(10) NOT NULL,
  EFF_TAX_RATE_aggregate varchar(10) NOT NULL,
  CASH_TAX_RATE_forProfit_companies varchar(10) NOT NULL,
  CASH_TAX_RATE_aggregate varchar(10) NOT NULL,
  PRIMARY KEY (industry_name)
);

CREATE TABLE Europe_Tax (
  industry_name VARCHAR(255) NOT NULL,
  number_of_firms INT NOT NULL,
  total_taxable_income varchar(30) NOT NULL,
  total_taxes_paid_accrual varchar(30) NOT NULL,
  total_cash_taxes_paid varchar(30) NOT NULL,
  cash_taxes_accrual_ratio varchar(30) NOT NULL,
  EFF_TAX_RATE_all_companies varchar(10) NOT NULL,
  EFF_TAX_RATE_forProfit_companies varchar(10) NOT NULL,
  EFF_TAX_RATE_aggregate varchar(10) NOT NULL,
  CASH_TAX_RATE_forProfit_companies varchar(10) NOT NULL,
  CASH_TAX_RATE_aggregate varchar(10) NOT NULL,
  PRIMARY KEY (industry_name)
);

CREATE TABLE China_Tax (
  industry_name VARCHAR(255) NOT NULL,
  number_of_firms INT NOT NULL,
  total_taxable_income varchar(30) NOT NULL,
  total_taxes_paid_accrual varchar(30) NOT NULL,
  total_cash_taxes_paid varchar(30) NOT NULL,
  cash_taxes_accrual_ratio varchar(30) NOT NULL,
  EFF_TAX_RATE_all_companies varchar(10) NOT NULL,
  EFF_TAX_RATE_forProfit_companies varchar(10) NOT NULL,
  EFF_TAX_RATE_aggregate varchar(10) NOT NULL,
  CASH_TAX_RATE_forProfit_companies varchar(10) NOT NULL,
  CASH_TAX_RATE_aggregate varchar(10) NOT NULL,
  PRIMARY KEY (industry_name)
);

CREATE TABLE India_Tax (
  industry_name VARCHAR(255) NOT NULL,
  number_of_firms INT NOT NULL,
  total_taxable_income varchar(30) NOT NULL,
  total_taxes_paid_accrual varchar(30) NOT NULL,
  total_cash_taxes_paid varchar(30) NOT NULL,
  cash_taxes_accrual_ratio varchar(30) NOT NULL,
  EFF_TAX_RATE_all_companies varchar(10) NOT NULL,
  EFF_TAX_RATE_forProfit_companies varchar(10) NOT NULL,
  EFF_TAX_RATE_aggregate varchar(10) NOT NULL,
  CASH_TAX_RATE_forProfit_companies varchar(10) NOT NULL,
  CASH_TAX_RATE_aggregate varchar(10) NOT NULL,
  PRIMARY KEY (industry_name)
);




/******************* Load Data ****************************************/
LOAD DATA INFILE "db_final_project\\Business Section\\Employee Stats\\Employee.csv"  
INTO TABLE IndustryEmpDataUS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 9 ROWS;

LOAD DATA INFILE "db_final_project\\Business Section\\Employee Stats\\EmployeeChina.csv"  
INTO TABLE IndustryEmpDataChina
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 9 ROWS;

LOAD DATA INFILE "db_final_project\\Business Section\\Employee Stats\\EmployeeEurope.csv"  
INTO TABLE IndustryEmpDataEurope
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 9 ROWS;

LOAD DATA INFILE "db_final_project\\Business Section\\Employee Stats\\EmployeeIndia.csv"  
INTO TABLE IndustryEmpDataIndia
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 9 ROWS;

LOAD DATA INFILE "db_final_project\\Business Section\\Historical Returns\\hist1.csv"  
INTO TABLE AnnualInvestmentReturns
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 18 ROWS;

LOAD DATA INFILE "db_final_project\\Business Section\\Historical Returns\\fa1.csv"  
INTO TABLE valHundo
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 3 ROWS;

LOAD DATA INFILE "db_final_project\\Business Section\\Historical Returns\\h3.csv"  
INTO TABLE AnnualRealReturns
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 3 ROWS;

LOAD DATA INFILE "db_final_project\\Business Section\\Historical Returns\\fa2.csv"  
INTO TABLE AnnualRiskPremium
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 3 ROWS;

LOAD DATA INFILE "db_final_project\\Business Section\\Tax Rates\\taxrate.csv"  
INTO TABLE US_Tax
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 9 ROWS;

LOAD DATA INFILE "db_final_project\\Business Section\\Tax Rates\\taxrateEurope.csv"  
INTO TABLE Europe_Tax
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 9 ROWS;

LOAD DATA INFILE "db_final_project\\Business Section\\Tax Rates\\taxrateIndia.csv"  
INTO TABLE India_Tax
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 9 ROWS;

LOAD DATA INFILE "db_final_project\\Business Section\\Tax Rates\\taxrateChina.csv"  
INTO TABLE China_Tax
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 9 ROWS;

 
 
