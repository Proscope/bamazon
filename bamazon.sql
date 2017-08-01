--Create new database called bamazon--
CREATE DATABASE bamazon;
--Tells SQL to use the database bamazon--
USE bamazon;
--Creating a new table called Products and giving it columns for the following--
CREATE TABLE products(
	id INTEGER(11) AUTO_INCREMENT NOT NULL,
	product_name VARCHAR(50) NOT NULL,
	department_name VARCHAR(50) NOT NULL,
	price DECIMAL(8,2) NOT NULL,
	stock_quantity INTEGER(50) NOT NULL,
	PRIMARY KEY(id)
);
--Inserting items into products table--
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Wilson Burn", "Racquets", 179.99, 5);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Wilson Blade", "Racquets", 209.99, 3);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Babolat Pure Strike", "Racquets", 199.99, 7);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Head Prestige", "Racquets", 189.99, 1);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Wilson Xduty", "Balls", 3.99, 2);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Dunlop Champ", "Balls", 3.49, 5);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Head Pro Penn", "Balls", 2.99, 6);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Nike Cage", "Shoes", 129.99, 4);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Adidas Barricade", "Shoes", 149.99, 9);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Asics Speed", "Shoes", 99.99, 1);

CREATE TABLE departments(
	departmentId INTEGER(11) AUTO_INCREMENT NOT NULL,
	department_name VARCHAR(50) NOT NULL,
	overhead_costs DECIMAL(10, 2) NOT NULL,
	total_sales DECIMAL(10, 2) NOT NULL,
	PRIMARY KEY(departmentId)
);
INSERT INTO departments (department_name, overhead_costs, total_sales)
VALUES ("Racquets", 2000.00, 0);

INSERT INTO departments (department_name, overhead_costs, total_sales)
VALUES ("Balls", 500.00, 0);

INSERT INTO departments (department_name, overhead_costs, total_sales)
VALUES ("Shoes", 1500.00, 0);