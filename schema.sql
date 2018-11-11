DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;
USE bamazon_db;

CREATE TABLE products(
    item_id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    dept_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    product_sales INT DEFAULT 0,
    PRIMARY KEY (item_id)
);

CREATE TABLE departments(
    department_id INT(100) NOT NULL AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    over_head_costs INT NOT NULL,
    total_sales DECIMAL(10,2),
    PRIMARY KEY (department_id)
);

-- Seeds for product table
INSERT INTO products(product_name, dept_name, price, stock_quantity, product_sales)
VALUES
('NIKE-Air', 'Shoes', 99.99, 10, 0),
('Nike Golf-Tee', 'Clothing' , 75.00, 20, 0),
('Nintendo Switch', 'Gaming', 259.99, 5, 0),
('Kuregg', 'Appliances', 69.99, 25, 0),
('Smart-TV', 'Electronics', 499.99, 10, 0),
('Gameboy Color', 'Electronics', 99.99, 35, 0),
('Gaming Desktop', 'Electronics', 1685.99, 5, 0),
('Golf Drivers','Outdoor Sports', 199.99, 20, 0),
('Soft Kleanex', 'Tolietries', 6.99, 400, 12),
('Sling-shot', 'Outdoor Sports', 29.99, 200, 0),
('Dove Shampoo', 'Cosmetics', 5.75, 500),
('Dove Conditioner', 'Cosmetics', 6.25, 627),
('Glad 12 Gal Trash Bags', 'Grocery', 5.99, 300),
('Brawny Paper Towels', 'Grocery', 4.25, 400),
('Granny Smith Apples', 'Produce', 0.35, 800),
('Chiquita Bannana', 'Produce', 0.20, 10000),
('Tropicana Orange Juice', 'Grocery', 4.45, 267),
('Horizon Organic Milk', 'Grocery', 4.50, 200),
('Huggies Diapers', 'Children', 2.75, 476),
('Charmin Toiler Paper', 'Grocery', 12.99, 575),
('Pampers Baby Wipes', 'Children', 1.50, 423),
('Yoga Mat', 'Sports', 12.75, 150),
('5lb Dumb bell', 'Sports', 7.99, 89),
('Tie Dye Shirt', 'Clothing', 5.55, 120),
('Nike Shorts', 'Clothing', 17.88, 250),
('Purina Cat Chow', 'Pet', 7.25, 157),
('Fancy Feast Wet Cat Food', 'Pet', 12.50, 163),
('Ibuprophen', 'Pharmacy', 4.95, 389),
('Band Aid', 'Pharmacy', 3.25, 550),
('Ben & Jerry Ice Cream', 'Grocery', 3.25, 432);