--SQL

--Write an SQL Script to Seed Sample Data (attached below) and answer the below queries:
--Employees list.xlsx

--a) Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000
--b) Write an SQL query to fetch the no. of workers for each department in the descending order.
--c) Write an SQL query to fetch intersecting records of two tables.
--d) Write an SQL query to determine the 5th highest salary without using TOP or limit method.


-- fetch some values
SELECT first_name, last_name FROM worker WHERE salary BETWEEN 50000 AND 100000;

SELECT COUNT (last_name) FROM worker GROUP BY department DESC;

SELECT first_name, last_name FROM worker INTERSECT SELECT worker_title FROM title;

SELECT MAX(salary) AS HighestSalary FROM worker;




-- create tables
CREATE TABLE worker (
  worker_id INTEGER PRIMARY KEY,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  salary INTEGER NOT NULL,
  joining_date TIMESTAMP NOT NULL,
  department VARCHAR(5) NOT NULL
);

CREATE TABLE bonus (
    worker_ref_id INTEGER,
    bonus_date TIMESTAMP NOT NULL,
    bonus_amount INTEGER NOT NULL,
    CONSTRAINT fk_worker
        FOREIGN KEY(worker_ref_id)
            REFERENCES worker(id)
);

CREATE TABLE title (
    worker_ref_id INTEGER,
    worker_title VARCHAR(40),
    affected_from TIMESTAMP,
    CONSTRAINT fk_worker
        FOREIGN KEY(worker_ref_id)
            REFERENCES worker(id)
);

-- insert values
INSERT INTO worker VALUES (1, 'Rick', 'Smith', '100000', '2021-02-20', 'HR');
INSERT INTO worker VALUES (2, 'Sam', 'Williams', '80000', '2021-06-11', 'Admin');
INSERT INTO worker VALUES (3, 'John', 'Brown', '300000', '2021-02-20', 'HR');
INSERT INTO worker VALUES (4, 'Amy', 'Jones', '500000', '2021-02-20', 'Admin');
INSERT INTO worker VALUES (5, 'Sean', 'Garcia', '500000', '2021-06-11', 'Admin');
INSERT INTO worker VALUES (6, 'Ryan', 'Miller', '200000', '2021-06-11', 'Account');
INSERT INTO worker VALUES (7, 'Patty', 'Davis', '75000', '2021-01-20', 'Account');
INSERT INTO worker VALUES (8, 'Monica', 'Rodriguez', '90000', '2021-04-11', 'Admin');

INSERT INTO title VALUES (1, 'Manager', '2021-02-20 00:00:00');
INSERT INTO title VALUES (2, 'Executive', '2021-06-11 00:00:00');
INSERT INTO title VALUES (8, 'Executive', '2021-06-11 00:00:00');
INSERT INTO title VALUES (5, 'Manager', '2021-06-11 00:00:00');
INSERT INTO title VALUES (4, 'Asst. Manager', '2021-06-11 00:00:00');
INSERT INTO title VALUES (7, 'Executive', '2021-06-11 00:00:00');
INSERT INTO title VALUES (6, 'Lead', '2021-06-11 00:00:00');
INSERT INTO title VALUES (3, 'Lead', '2021-06-11 00:00:00');

-- fetch values
SELECT first_name || ' '|| last_name FROM worker WHERE salary BETWEEN 50000 AND 100000;

SELECT COUNT(worker_id) FROM worker GROUP BY department ORDER BY worker_id DESC;

SELECT first_name || ' '|| last_name || ' - '|| worker_title FROM worker a LEFT JOIN title b on a.worker_id = b.worker_ref_id;

SELECT salary FROM worker w1 WHERE 
     (5 - 1) = (SELECT COUNT(DISTINCT(salary)) 
                FROM worker w2 
                WHERE w2.salary > w1.salary );


