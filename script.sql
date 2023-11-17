-- Creación de base de datos
DROP DATABASE IF EXISTS onlinestore;

CREATE DATABASE IF NOT EXISTS onlinestore CHARACTER SET utf8mb4;
USE onlinestore;

-- Creación de tablas
CREATE TABLE Product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(255),
    instock_quantity INT,
    price DECIMAL(8, 2)
);

CREATE TABLE Customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    password VARCHAR(255),
    email VARCHAR(255) UNIQUE
);

-- Alternativa de modelo: que la clave primaria sea {product_id, customer_id, fecha_hora}
CREATE TABLE ProductOrder (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    product_quantity INT,
    FOREIGN KEY (product_id) REFERENCES Product(id),
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

-- Insert base
INSERT INTO Product VALUES (1, "Apple MacBook Pro", "15 inch, i7, 16GB RAM", 5, 667.00);
INSERT INTO Product VALUES (2, "Apple MacBook Pro II", "15 inch, i7, 32GB RAM", 5, 867.00);
INSERT INTO Product VALUES (3, "Apple MacBook Pro III", "15 inch, i7, 32GB RAM", 5, 867.00);
INSERT INTO Customer VALUES (1, "Norbey", "2w33he94yg4mx88j9j2hy4uhd32w", "norbey@gmail.com");
INSERT INTO Customer VALUES (2, "Danilo", "2w55he94yg4mx88j9j2hy4uhd23p", "danilo@gmail.com");
INSERT INTO Customer VALUES (3, "Franco", "2w44he94yg4mx88j9j2hy4uhd53s", "franco@gmail.com");
INSERT INTO ProductOrder VALUES (1, 1, 1, 1);
INSERT INTO ProductOrder VALUES (2, 2, 1, 1);
INSERT INTO ProductOrder VALUES (3, 3, 2, 1);
INSERT INTO ProductOrder VALUES (4, 3, 3, 2);