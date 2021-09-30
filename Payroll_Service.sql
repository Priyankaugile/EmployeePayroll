******************************************************************
           ****Welcome to Employee Payroll Service****

-----------------------------------------------------------------------
#uc1-
-----------------------------------------------------------------------

mysql> create database payroll_service;
Query OK, 1 row affected (0.15 sec)


mysql> show databases;
+--------------------------+
| Database                 |
+--------------------------+
| addressbook              |
| addressbookservice       |
| employee_payroll_service |
| information_schema       |
| mysql                    |
| payroll_service          |
| performance_schema       |
| sys                      |
+--------------------------+
8 rows in set (0.28 sec)
mysql> use payroll_service;
Database changed

-----------------------------------------------------------------------
#uc2-
-----------------------------------------------------------------------

mysql> create table employee_payroll(
    -> EmpId int unsigned not null auto_increment,
    -> EmpName varchar(200) not null,
    -> Salary double not null,
    -> EmpStart Date not null,
    -> Primary key (EmpId)
    -> );
Query OK, 0 rows affected (1.49 sec)

mysql> desc employee_payroll;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| EmpId    | int unsigned | NO   | PRI | NULL    | auto_increment |
| EmpName  | varchar(200) | NO   |     | NULL    |                |
| Salary   | double       | NO   |     | NULL    |                |
| EmpStart | date         | NO   |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
4 rows in set (0.10 sec)

-----------------------------------------------------------------------
#uc3-
-----------------------------------------------------------------------

mysql> insert into employee_payroll (EmpName,Salary,EmpStart) values("piyu",1000000.0,'1995-06-26');
Query OK, 1 row affected (0.12 sec)

mysql> insert into employee_payroll (EmpName,Salary,EmpStart) values("piyu",1000000.0,'1994-12-13');
Query OK, 1 row affected (0.11 sec)

mysql> insert into employee_payroll (EmpName,Salary,EmpStart) values("piyu",1000000.0,'1993-11-11');
Query OK, 1 row affected (0.18 sec)

mysql> insert into employee_payroll (EmpName,Salary,EmpStart) values("piyu",1000000.0,'1993-11-11');
Query OK, 1 row affected (0.13 sec)

mysql> insert into employee_payroll (EmpName,Salary,EmpStart) values("mahi",1000000.0,'1994-12-13');
Query OK, 1 row affected (0.08 sec)

mysql> insert into employee_payroll (EmpName,Salary,EmpStart) values("rohi",1000000.0,'1995-06-26');
Query OK, 1 row affected (0.10 sec)

mysql> insert into employee_payroll (EmpName,Salary,EmpStart) values("shital",1000000.0,'1990-04-10');
Query OK, 1 row affected (0.14 sec)

mysql> insert into employee_payroll (EmpName,Salary,EmpStart) values("tejal",3000000.0,'1990-02-5');
Query OK, 1 row affected (0.13 sec)

mysql> insert into employee_payroll (EmpName,Salary,EmpStart) values("mohini",5400000.0,'1978-02-1');
Query OK, 1 row affected (0.16 sec)


-----------------------------------------------------------------------
#uc-4
-----------------------------------------------------------------------

mysql> select * from employee_payroll;
+-------+---------+---------+------------+
| EmpId | EmpName | Salary  | EmpStart   |
+-------+---------+---------+------------+
|     1 | piyu    | 1000000 | 1995-06-26 |
|     2 | piyu    | 1000000 | 1994-12-13 |
|     3 | piyu    | 1000000 | 1993-11-11 |
|     4 | piyu    | 1000000 | 1993-11-11 |
|     5 | mahi    | 1000000 | 1994-12-13 |
|     6 | rohi    | 1000000 | 1995-06-26 |
|     7 | shital  | 1000000 | 1990-04-10 |
|     8 | tejal   | 3000000 | 1990-02-05 |
|     9 | mohini  | 5400000 | 1978-02-01 |
+-------+---------+---------+------------+
9 rows in set (0.00 sec)

-----------------------------------------------------------------------
#uc5-
-----------------------------------------------------------------------

mysql> select salary from employee_payroll where EmpName = 'tejal';
+---------+
| salary  |
+---------+
| 3000000 |
+---------+
1 row in set (0.00 sec)

mysql> select salary from employee_payroll where EmpStart between cast('1992-01-20' as date) and date (now());
+---------+
| salary  |
+---------+
| 1000000 |
| 1000000 |
| 1000000 |
| 1000000 |
| 1000000 |
| 1000000 |
+---------+
6 rows in set (0.09 sec)

-----------------------------------------------------------------------
#uc6-
-----------------------------------------------------------------------

mysql> alter table employee_payroll add gender char(1) after EmpName;
Query OK, 0 rows affected (2.92 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update employee_payroll set gender = 'F' where EmpName = 'mohini' or EmpName = 'mahi';
Query OK, 2 rows affected (0.15 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+--------+---------+------------+
| EmpId | EmpName | gender | Salary  | EmpStart   |
+-------+---------+--------+---------+------------+
|     1 | piyu    | NULL   | 1000000 | 1995-06-26 |
|     2 | piyu    | NULL   | 1000000 | 1994-12-13 |
|     3 | piyu    | NULL   | 1000000 | 1993-11-11 |
|     4 | piyu    | NULL   | 1000000 | 1993-11-11 |
|     5 | mahi    | F      | 1000000 | 1994-12-13 |
|     6 | rohi    | NULL   | 1000000 | 1995-06-26 |
|     7 | shital  | NULL   | 1000000 | 1990-04-10 |
|     8 | tejal   | NULL   | 3000000 | 1990-02-05 |
|     9 | mohini  | F      | 5400000 | 1978-02-01 |
+-------+---------+--------+---------+------------+

-----------------------------------------------------------------------
#uc7-
-----------------------------------------------------------------------

mysql> select gender,Sum(salary) from employee_payroll group by gender;
+--------+-------------+
| gender | Sum(salary) |
+--------+-------------+
| NULL   |     9000000 |
| F      |     6400000 |
+--------+-------------+
2 rows in set (0.10 sec)

mysql> select gender, avg(salary) from employee_payroll group by gender;
+--------+--------------------+
| gender | avg(salary)        |
+--------+--------------------+
| NULL   | 1285714.2857142857 |
| F      |            3200000 |
+--------+--------------------+
2 rows in set (0.00 sec)

mysql> select gender, min(salary) from employee_payroll group by gender;
+--------+-------------+
| gender | min(salary) |
+--------+-------------+
| NULL   |     1000000 |
| F      |     1000000 |
+--------+-------------+
2 rows in set (0.06 sec)

mysql> select gender,max(salary) from employee_payroll group by gender;
+--------+-------------+
| gender | max(salary) |
+--------+-------------+
| NULL   |     3000000 |
| F      |     5400000 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> select gender,count(salary) from employee_payroll group by gender;
+--------+---------------+
| gender | count(salary) |
+--------+---------------+
| NULL   |             7 |
| F      |             2 |
+--------+---------------+
2 rows in set (0.00 sec)

-----------------------------------------------------------------------
#uc8-
-----------------------------------------------------------------------

mysql> alter table employee_payroll add PhoneNumber varchar(150) after EmpName;
Query OK, 0 rows affected (1.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add Address varchar(150) after PhoneNumber;
Query OK, 0 rows affected (2.29 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add Department varchar(150) not null after Address;
Query OK, 0 rows affected (1.28 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> ALTER TABLE employee_payroll CHANGE COLUMN Address Address  VARCHAR(250) DEFAULT 'DEFAULT';
Query OK, 0 rows affected (0.42 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe employee_payroll;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| EmpId       | int unsigned | NO   | PRI | NULL    | auto_increment |
| EmpName     | varchar(200) | NO   |     | NULL    |                |
| PhoneNumber | varchar(150) | YES  |     | NULL    |                |
| Address     | varchar(250) | YES  |     | DEFAULT |                |
| Department  | varchar(150) | NO   |     | NULL    |                |
| gender      | char(1)      | YES  |     | NULL    |                |
| Salary      | double       | NO   |     | NULL    |                |
| EmpStart    | date         | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
8 rows in set (0.07 sec)


-----------------------------------------------------------------------
#uc9-
-----------------------------------------------------------------------

mysql> alter table employee_payroll rename column salary to basicpay;
Query OK, 0 rows affected (0.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll
    -> ADD Deductions Double NOT NULL AFTER BasicPay,
    -> ADD TaxablePay Double NOT NULL AFTER Deductions,
    -> ADD IncomeTax Double NOT NULL AFTER TaxablePay,
    -> ADD NetPay Double NOT NULL AFTER IncomeTax;
Query OK, 0 rows affected (1.34 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee_payroll;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| EmpId       | int unsigned | NO   | PRI | NULL    | auto_increment |
| EmpName     | varchar(200) | NO   |     | NULL    |                |
| PhoneNumber | varchar(150) | YES  |     | NULL    |                |
| Address     | varchar(250) | YES  |     | DEFAULT |                |
| Department  | varchar(150) | NO   |     | NULL    |                |
| gender      | char(1)      | YES  |     | NULL    |                |
| basicpay    | double       | NO   |     | NULL    |                |
| Deductions  | double       | NO   |     | NULL    |                |
| TaxablePay  | double       | NO   |     | NULL    |                |
| IncomeTax   | double       | NO   |     | NULL    |                |
| NetPay      | double       | NO   |     | NULL    |                |
| EmpStart    | date         | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
12 rows in set (0.07 sec)

-----------------------------------------------------------------------
#uc10-
-----------------------------------------------------------------------

mysql> INSERT INTO employee_payroll(EmpName, Department, gender, BasicPay, Deductions, TaxablePay, IncomeTax, NetPay, EmpStart) VALUES
    -> ('purva','Marketing','F',390000.0,80000.0,3000.0,1800.0,305200.0,'2018-01-03'),
    ->  ('amit','Sales','M',490000.0,80000.0,3000.0,1800.0,405200.0,'2019-04-04');
Query OK, 2 rows affected (0.08 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+-------------+---------+------------+--------+----------+------------+------------+-----------+--------+------------+
| EmpId | EmpName | PhoneNumber | Address | Department | gender | basicpay | Deductions | TaxablePay | IncomeTax | NetPay | EmpStart   |
+-------+---------+-------------+---------+------------+--------+----------+------------+------------+-----------+--------+------------+
|     1 | piyu    | NULL        | NULL    |            | NULL   |  1000000 |          0 |          0 |         0 |      0 | 1995-06-26 |
|     2 | piyu    | NULL        | NULL    |            | NULL   |  1000000 |          0 |          0 |         0 |      0 | 1994-12-13 |
|     3 | piyu    | NULL        | NULL    |            | NULL   |  1000000 |          0 |          0 |         0 |      0 | 1993-11-11 |
|     4 | piyu    | NULL        | NULL    |            | NULL   |  1000000 |          0 |          0 |         0 |      0 | 1993-11-11 |
|     5 | mahi    | NULL        | NULL    |            | F      |  1000000 |          0 |          0 |         0 |      0 | 1994-12-13 |
|     6 | rohi    | NULL        | NULL    |            | NULL   |  1000000 |          0 |          0 |         0 |      0 | 1995-06-26 |
|     7 | shital  | NULL        | NULL    |            | NULL   |  1000000 |          0 |          0 |         0 |      0 | 1990-04-10 |
|     8 | tejal   | NULL        | NULL    |            | NULL   |  3000000 |          0 |          0 |         0 |      0 | 1990-02-05 |
|     9 | mohini  | NULL        | NULL    |            | F      |  5400000 |          0 |          0 |         0 |      0 | 1978-02-01 |
|    10 | purva   | NULL        | DEFAULT | Marketing  | F      |   390000 |      80000 |       3000 |      1800 | 305200 | 2018-01-03 |
|    11 | amit    | NULL        | DEFAULT | Sales      | M      |   490000 |      80000 |       3000 |      1800 | 405200 | 2019-04-04 |
+-------+---------+-------------+---------+------------+--------+----------+------------+------------+-----------+--------+------------+
11 rows in set (0.00 sec)

-----------------------------------------------------------------------
#uc11-
-----------------------------------------------------------------------

mysql> create table company(
    -> CompanyId      INT PRIMARY KEY,
    -> CompanyName      VARCHAR(250) NOT NULL
    -> );
Query OK, 0 rows affected (1.11 sec)

mysql> create table employee(
    -> Id INT unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> CompanyId INT REFERENCES company(CompanyId),
    -> Name           VARCHAR(200) NOT NULL,
    -> PhoneNumber VARCHAR(20) NOT NULL,
    -> Address VARCHAR(50) NOT NULL DEFAULT 'DEFAULT',
    -> Gender CHAR(1) NOT NULL
    -> );
Query OK, 0 rows affected (0.44 sec)

mysql> CREATE TABLE payroll(
    -> Id INT REFERENCES employee(Id),
    -> BasicPay DOUBLE NOT NULL,
    -> Deductions DOUBLE NOT NULL,
    -> TaxablePay DOUBLE NOT NULL,
    ->  IncomeTax DOUBLE NOT NULL,
    -> Net_pay DOUBLE NOT NULL
    -> );
Query OK, 0 rows affected (0.41 sec)

mysql> CREATE TABLE department(
    -> DeptId INT PRIMARY KEY,
    -> DeptName VARCHAR(50) NOT NULL
    -> );
Query OK, 0 rows affected (0.82 sec)

mysql> CREATE TABLE employee_Department(
    -> EmpId   INT REFERENCES employee(Id),
    -> DeptId  INT REFERENCES department(DeptId)
    -> );
Query OK, 0 rows affected (0.87 sec)

mysql> show tables;
+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| company                   |
| department                |
| employee                  |
| employee_department       |
| employee_payroll          |
| payroll                   |
+---------------------------+
6 rows in set (0.23 sec)

-----------------------------------------------------------------------
#uc12-
-----------------------------------------------------------------------

mysql> INSERT INTO company VALUES
    -> (1,"INFOSYS"),
    -> (2,"WIPRO");
Query OK, 1 row affected (0.12 sec)

mysql> SELECT * from company;
+-----------+-------------+
| CompanyId | CompanyName |
+-----------+-------------+
|         1 | INFOSYS     |
|         2 | WIPRO       |
+-----------+-------------+
2 rows in set (0.02 sec)

mysql> INSERT INTO employee(CompanyId, EmpName, PhoneNumber, Address, Gender) VALUES
    -> (1, 'rahul', '9876543210', 'abc', 'M' ),
    -> (1, 'Terisa', '8665443211', 'bca', 'F' ),
    -> (1, 'shivani', '9976543212', 'cab', 'F'),
    -> (2, 'shiva', '9876543210', 'def', 'M' ),
    -> (2, 'abhilash', '8665443211', 'ghi', 'M' ),
    -> (2, 'vaishnavi', '9976543212', 'mnl', 'F')
    -> ;
Query OK, 3 rows affected (0.14 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+----+-----------+-----------+-------------+---------+--------+
| Id | CompanyId | EmpName   | PhoneNumber | Address | Gender |
+----+-----------+-----------+-------------+---------+--------+
|  1 |         1 | shital    | 9876543210  | abc     | M      |
|  2 |         1 | piyu      | 8665443211  | bca     | F      |
|  3 |         1 | amit      | 9976543212  | cab     | F      |
|  4 |         2 | amit      | 9876543210  | def     | M      |
|  5 |         2 | tejal     | 8665443211  | ghi     | M      |
|  6 |         2 | purva     | 9976543212  | mnl     | F      |
+----+-----------+-----------+-------------+---------+--------+
6 rows in set (0.01 sec)

mysql> INSERT INTO department VALUES
    -> (1,'Sales'),
    -> (2,'Marketing'),
    -> (3,'HR');
Query OK, 3 rows affected (0.19 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from department;
+--------+-----------+
| DeptId | DeptName  |
+--------+-----------+
|      1 | Sales     |
|      2 | Marketing |
|      3 | HR        |
+--------+-----------+
3 rows in set (0.00 sec)

mysql> INSERT INTO payroll VALUES
    -> (1,6000,400,3500,700,8000),
    -> (2,9000,100,2400,400,2500),
    -> (3,7000,600,5500,900,3000),
    -> (4,12000,1400,3500,600,6000),
    -> (5,19000,1100,2400,200,3000),
    -> (6,17000,1600,5500,400,2500);
Query OK, 3 rows affected (0.24 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from payroll;
+------+----------+------------+------------+-----------+---------+
| Id   | BasicPay | Deductions | TaxablePay | IncomeTax | Net_pay |
+------+----------+------------+------------+-----------+---------+
|    1 |     6000 |        400 |       3500 |       700 |    8000 |
|    2 |     9000 |        100 |       2400 |       400 |    2500 |
|    3 |     7000 |        600 |       5500 |       900 |    3000 |
|    4 |    12000 |       1400 |       3500 |       600 |    6000 |
|    5 |    19000 |       1100 |       2400 |       200 |    3000 |
|    6 |    17000 |       1600 |       5500 |       400 |    2500 |
+------+----------+------------+------------+-----------+---------+
6 rows in set (0.08 sec)

mysql> INSERT INTO employee_department VALUES
    -> (1,1),
    -> (2,2),
    -> (3,3),
    -> (4,1),
    -> (5,2),
    -> (6,3);
Query OK, 3 rows affected (0.28 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from employee_department;
+-------+--------+
| EmpId | DeptId |
+-------+--------+
|     1 |      1 |
|     2 |      2 |
|     3 |      3 |
|     4 |      1 |
|     5 |      2 |
|     6 |      3 |
+-------+--------+
6 rows in set (0.00 sec)