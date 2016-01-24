CREATE DATABASE test;
USE test;
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (id INT, name VARCHAR(20));
INSERT INTO employees (id, name) VALUES (1, 'John');
INSERT INTO employees (id, name) VALUES (2, 'Bob');
INSERT INTO employees (id, name) VALUES (3, 'Jane');