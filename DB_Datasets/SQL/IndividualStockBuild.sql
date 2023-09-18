
drop table if exists amzn;
drop table if exists btc;
drop table if exists goog;
drop table if exists ibm;
drop table if exists meta;
drop table if exists pg;
drop table if exists rtx;
drop table if exists tsla;

CREATE TABLE amzn (
     Date DATE NOT NULL,
    Open DECIMAL(15,6) NOT NULL,
    High DECIMAL(15,6) NOT NULL,
    Low DECIMAL(15,6) NOT NULL,
    Close DECIMAL(15,6) NOT NULL,
    AdjClose DECIMAL(15,6) NOT NULL,
    Volume BIGINT NOT NULL,
    PRIMARY KEY (Date)
);

CREATE TABLE btc (
    Date DATE NOT NULL,
    Open DECIMAL(15,6) NOT NULL,
    High DECIMAL(15,6) NOT NULL,
    Low DECIMAL(15,6) NOT NULL,
    Close DECIMAL(15,6) NOT NULL,
    AdjClose DECIMAL(15,6) NOT NULL,
    Volume BIGINT NOT NULL,
    PRIMARY KEY (Date)
);

CREATE TABLE goog (
   Date DATE NOT NULL,
    Open DECIMAL(15,6) NOT NULL,
    High DECIMAL(15,6) NOT NULL,
    Low DECIMAL(15,6) NOT NULL,
    Close DECIMAL(15,6) NOT NULL,
    AdjClose DECIMAL(15,6) NOT NULL,
    Volume BIGINT NOT NULL,
    PRIMARY KEY (Date)
);

CREATE TABLE ibm (
     Date DATE NOT NULL,
    Open DECIMAL(15,6) NOT NULL,
    High DECIMAL(15,6) NOT NULL,
    Low DECIMAL(15,6) NOT NULL,
    Close DECIMAL(15,6) NOT NULL,
    AdjClose DECIMAL(15,6) NOT NULL,
    Volume BIGINT NOT NULL,
    PRIMARY KEY (Date)
);

CREATE TABLE meta (
     Date DATE NOT NULL,
    Open DECIMAL(15,6) NOT NULL,
    High DECIMAL(15,6) NOT NULL,
    Low DECIMAL(15,6) NOT NULL,
    Close DECIMAL(15,6) NOT NULL,
    AdjClose DECIMAL(15,6) NOT NULL,
    Volume BIGINT NOT NULL,
    PRIMARY KEY (Date)
);

CREATE TABLE pg (
       Date DATE NOT NULL,
    Open DECIMAL(15,6) NOT NULL,
    High DECIMAL(15,6) NOT NULL,
    Low DECIMAL(15,6) NOT NULL,
    Close DECIMAL(15,6) NOT NULL,
    AdjClose DECIMAL(15,6) NOT NULL,
    Volume BIGINT NOT NULL,
    PRIMARY KEY (Date)
);

CREATE TABLE rtx (
       Date DATE NOT NULL,
    Open DECIMAL(15,6) NOT NULL,
    High DECIMAL(15,6) NOT NULL,
    Low DECIMAL(15,6) NOT NULL,
    Close DECIMAL(15,6) NOT NULL,
    AdjClose DECIMAL(15,6) NOT NULL,
    Volume BIGINT NOT NULL,
    PRIMARY KEY (Date)
);

CREATE TABLE tsla (
      Date DATE NOT NULL,
    Open DECIMAL(15,6) NOT NULL,
    High DECIMAL(15,6) NOT NULL,
    Low DECIMAL(15,6) NOT NULL,
    Close DECIMAL(15,6) NOT NULL,
    AdjClose DECIMAL(15,6) NOT NULL,
    Volume BIGINT NOT NULL,
    PRIMARY KEY (Date)
);

/******************* Load Data **********************/
LOAD DATA INFILE "db_final_project\\Individual Company Stock Data\\AMZN.csv"  
INTO TABLE amzn
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "db_final_project\\Individual Company Stock Data\\BTC-USD.csv" 
INTO TABLE btc
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "db_final_project\\Individual Company Stock Data\\GOOG.csv"  
INTO TABLE goog
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "db_final_project\\Individual Company Stock Data\\IBM.csv"
INTO TABLE ibm
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "db_final_project\\Individual Company Stock Data\\META.csv"  
INTO TABLE meta
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "db_final_project\\Individual Company Stock Data\\PG.csv"
INTO TABLE pg 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "db_final_project\\Individual Company Stock Data\\RTX.csv"
INTO TABLE rtx
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "db_final_project\\Individual Company Stock Data\\TSLA.csv"
INTO TABLE tsla
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;