-- Creating an empty result table
DROP TABLE IF EXISTS mkcs.result_table;
CREATE TABLE mkcs.result_table (
   customer_id SMALLINT PRIMARY KEY,
   TopCategory VARCHAR(25),
   TC_mnos INT,
   TC_avgd INT,
   TC_p FLOAT,
   T1 VARCHAR(255),
   T2 VARCHAR(255),
   T3 VARCHAR(255),
   SecondCategory VARCHAR(25),
   SC_mnos INT,
   SC_pvh FLOAT,
   S1 VARCHAR(255),
   S2 VARCHAR(255),
   S3 VARCHAR(255),
   TopActorID SMALLINT,
   TopActorFN VARCHAR(45),
   TopActorLN VARCHAR(45),
   TA_nmos INT,
   A1 VARCHAR(255),
   A2 VARCHAR(255),
   A3 VARCHAR(255)
);

SELECT * FROM mkcs.result_table;