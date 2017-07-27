--Create new database called bamazon--
CREATE DATABASE bamazon;
--Tells SQL to use the database bamazon--
USE bamazon;
--Creating a new table called Products and giving it columns for the following--
CREATE TABLE products(
	id INTEGER(11) AUTO_INCREMENT NOT NULL,
	product_name VARCHAR(100),
	department_name VARCHAR(100),
	price INTEGER(11) NOT NULL,
	stock_quantity VARCHAR(100)
);