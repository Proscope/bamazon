CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products(
	id INTEGER(11) AUTO_INCREMENT NOT NULL,
	product_name VARCHAR(100),
	department_name VARCHAR(100),
	price INTEGER(11) NOT NULL,
	stock_quantity VARCHAR(100)
);