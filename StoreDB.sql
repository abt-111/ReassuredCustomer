-- Création de la base de données
CREATE DATABASE StoreDB;
GO

USE StoreDB;
GO

-- Création des tables

CREATE TABLE Category (
    id INT PRIMARY KEY IDENTITY(1, 1),
    name VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Product (
    id INT PRIMARY KEY IDENTITY(1, 1),
    name VARCHAR(50) NOT NULL,
    price DECIMAL(18, 2) NOT NULL,
    category_id INT NOT NULL,
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES Category(id)
);
GO

CREATE TABLE Purchase (
    id INT PRIMARY KEY IDENTITY(1, 1),
    date DATETIME NOT NULL,
    product_id INT NOT NULL,
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES Product(id)
);
GO

-- Insertion des données dans la table Category
INSERT INTO Category(name) VALUES ('Épicerie salé');
INSERT INTO Category(name) VALUES ('Fruits et légumes');
INSERT INTO Category(name) VALUES ('Viandes et poisson');
GO

-- Insertion des données dans la table Product
INSERT INTO Product(name, price, category_id) VALUES ('Sardines', 1.38, 1);
INSERT INTO Product(name, price, category_id) VALUES ('Pâtes', 0.94, 1);
INSERT INTO Product(name, price, category_id) VALUES ('Riz', 1.54, 1);
INSERT INTO Product(name, price, category_id) VALUES ('Huile', 4.31, 1);
INSERT INTO Product(name, price, category_id) VALUES ('Bananes', 3.00, 2);
INSERT INTO Product(name, price, category_id) VALUES ('Carottes', 2.49, 2);
INSERT INTO Product(name, price, category_id) VALUES ('Pommes', 2.69, 2);
INSERT INTO Product(name, price, category_id) VALUES ('Poisson', 15.08, 3);
INSERT INTO Product(name, price, category_id) VALUES ('Poulet', 12.70, 3);
GO

-- Insertion des données dans la table Purchase
INSERT INTO Purchase (date, product_id) VALUES ('2019-01-15', 1);
INSERT INTO Purchase (date, product_id) VALUES ('2019-02-20', 2);
INSERT INTO Purchase (date, product_id) VALUES ('2019-03-05', 3);
INSERT INTO Purchase (date, product_id) VALUES ('2019-04-10', 4);
INSERT INTO Purchase (date, product_id) VALUES ('2019-05-15', 5);
INSERT INTO Purchase (date, product_id) VALUES ('2019-06-20', 6);
INSERT INTO Purchase (date, product_id) VALUES ('2019-07-25', 7);
INSERT INTO Purchase (date, product_id) VALUES ('2019-08-30', 8);
INSERT INTO Purchase (date, product_id) VALUES ('2019-09-15', 9);
INSERT INTO Purchase (date, product_id) VALUES ('2019-10-20', 1);
INSERT INTO Purchase (date, product_id) VALUES ('2019-11-25', 2);
INSERT INTO Purchase (date, product_id) VALUES ('2019-12-30', 3);
INSERT INTO Purchase (date, product_id) VALUES ('2020-01-15', 4);
INSERT INTO Purchase (date, product_id) VALUES ('2020-02-20', 5);
INSERT INTO Purchase (date, product_id) VALUES ('2020-03-25', 6);
INSERT INTO Purchase (date, product_id) VALUES ('2020-04-30', 7);
INSERT INTO Purchase (date, product_id) VALUES ('2020-05-15', 8);
INSERT INTO Purchase (date, product_id) VALUES ('2020-06-20', 9);
GO

-- Requête pour compter le nombre d'achats par catégorie et le prix total
SELECT COUNT(pu.id) AS purchase_number_per_category, SUM(pr.price) AS total_price
FROM Purchase AS pu
JOIN Product AS pr ON pu.product_id = pr.id
JOIN Category AS c ON pr.category_id = c.id
GROUP BY c.id;
GO

-- Requête pour compter le nombre d'achats entre 2019 et 2020
SELECT COUNT(p.id) AS purchase_number_between_2019_and_2020
FROM Purchase AS p
WHERE date BETWEEN '2019-01-01' AND '2021-01-01';
GO
