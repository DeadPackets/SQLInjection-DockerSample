DROP DATABASE IF EXISTS sqlinj;
CREATE DATABASE sqlinj;
USE sqlinj;

CREATE TABLE users (id INT, name VARCHAR(20), pw VARCHAR(20));
INSERT INTO users (id, name, pw) VALUES (0, 'Admin', 'FLAG:{sql-inj3ct1on-4-lyfe}');
INSERT INTO users (id, name, pw) VALUES (1, 'Simon', 'passw0rd1');
INSERT INTO users (id, name, pw) VALUES (2, 'James', 'passw0rd2');
INSERT INTO users (id, name, pw) VALUES (3, 'Andrew', 'passw0rd3');

CREATE TABLE items (id INT, name VARCHAR(20), price INT, kind VARCHAR(20));
INSERT INTO items (id, name, price, kind) VALUES (1, 'Gundam', 1000, 'toy');
INSERT INTO items (id, name, price, kind) VALUES (2, 'Mickey', 1000, 'toy');
INSERT INTO items (id, name, price, kind) VALUES (3, 'Doraemon', 1000, 'toy');
