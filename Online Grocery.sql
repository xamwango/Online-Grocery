CREATE DATABASE Online_Grocery;
USE Online_Grocery;


#creating tables
CREATE TABLE customers (
    customer_Id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address VARCHAR(70),
    Phone_number VARCHAR(30),
    Town VARCHAR(50)
);

CREATE TABLE products (
    product_Id INT PRIMARY KEY,
    product_name VARCHAR(30),
    Quantity_in_stock INT,
    unit_price REAL
);

CREATE TABLE orders (
    order_Id INT PRIMARY KEY,
    customer_Id INT,
    order_date DATE,
    order_status_Id INT,
    shipped_date DATE,
    shipper_Id INT
);

CREATE TABLE ordered_items (
    order_Id INT,
    product_Id INT,
    quantity INT,
    unit_price REAL
);

CREATE TABLE order_status (
    order_status_Id INT PRIMARY KEY,
    status_label VARCHAR(20)
);

CREATE TABLE shippers (
    shipper_Id INT PRIMARY KEY,
    shipper_name VARCHAR(30)
);

CREATE TABLE payments (
    payment_Id INT PRIMARY KEY,
    customer_Id INT,
    order_Id INT,
    Date_paid DATE,
    Amount REAL,
    payment_mode INT
);

CREATE TABLE payment_methods (
    payment_mode INT PRIMARY KEY,
    payment_name VARCHAR(50)
);

#creating relationships
#link orders to customers
ALTER TABLE orders
ADD CONSTRAINT FOREIGN KEY(customer_Id)
REFERENCES customers(customer_Id);
#link orders to orders' status
ALTER TABLE orders
ADD CONSTRAINT FOREIGN KEY(order_status_Id)
REFERENCES order_status(order_status_Id);

#link orders to orders' status
ALTER TABLE orders
ADD CONSTRAINT FOREIGN KEY(shipper_Id)
REFERENCES shippers(shipper_Id);

#link ordered_items to orders
ALTER TABLE ordered_items
ADD CONSTRAINT FOREIGN KEY(order_Id)
REFERENCES orders(order_Id);
#link ordered_items to products
ALTER TABLE ordered_items
ADD CONSTRAINT FOREIGN KEY(product_Id)
REFERENCES products(product_Id);

#link payments to customers
ALTER TABLE payments
ADD CONSTRAINT FOREIGN KEY(customer_Id)
REFERENCES customers(customer_Id);
#link payments to payments methods
ALTER TABLE payments
ADD CONSTRAINT FOREIGN KEY(payment_mode)
REFERENCES payment_methods(payment_mode);
#link payments to orders
ALTER TABLE payments
ADD CONSTRAINT FOREIGN KEY(order_Id)
REFERENCES orders(order_Id);


#insert values 
#customers
INSERT INTO customers
	(customer_Id,
    first_name,
    last_name,
    address,
    Phone_number,
    Town)
VALUES
	(1, 'John', 'Smith', '055-4009', '0312566798', 'Roysambu'),
    (2, 'Paul', 'Mutembei', '056-4055', '0322555791', 'Githurai 44'),
    (3, 'Samuel', 'Ikunu', '066-4010', '0421456128', 'Kiambu'),
	(4, 'Siprosa', 'Achieng', '079-4012', '0335257678', 'Zimmerman'),
    (5, 'Brian', 'Oluoch', '054-4034', '0432167598', 'Pipeline'),
    (6, 'Kelvin', 'Musembi', '043-4033', '0352652198', 'Mlolongo'),
    (7, 'Daniel', 'Kimani', '058-4057', '0432569898', 'Githurai 45'),
    (8, 'Hassan', 'Husein', '060-4063', '0232557758', 'kahawa Wendani'),
    (9, 'Hezekiah', 'Mutwiri', '061-4017', '0332567798', 'Kahawa Sukari'),
    (10, 'Faith', 'Mweni', '069-4013', '0432876598', 'Utawala'),
    (11, 'Lucy', 'Nduta', '078-4011', '0331234798', 'Kasarani'),
    (12, 'Isaiah ', 'Mugambi', '085-4025', '0334561298', 'Parklands');
#products 
INSERT INTO products(product_Id, product_name, Quantity_in_stock, unit_price)
VALUES
	(1, 'Broccoli', '30', 20.00),
    (2, 'Cabage', '60', 25.00),
    (3, 'Lettuce', '20', 30.00),
    (4, 'Spinach', '40', 15.00),
    (5, 'Leek', '15', 25.00),
    (6, 'Cauliflower', '35', 35.00),
    (7, 'Eggplant', '25', 25.00),
    (8, 'Coriander', '30', 5.00),
    (9, 'Zucchini', '20', 20.00),
    (10, 'Ginger', '50', 15.00),
    (11, 'Garlic', '45', 25.00),
    (12, 'Tomatoes', '70', 10.00),
	(13, 'Okra', '25', 30.00),
	(14, 'Celery', '15', 25.00),
    (15, 'Mushroom', '20', 35.00),
    (16, 'Swiss chard', '40', 15.00),
    (17, 'Banana', '45', 10.00),
    (18, 'Mango', '50', 15.00),
    (19, 'Orange', '30', 15.00),
    (20, 'Apple', '30', 20.00),
    (21, 'Pear', '15', 10.00),
    (22, 'Lime', '20', 15.00),
    (23, 'Kiwi', '15', 30.00),
    (24, 'Melon', '20', 40.00),
    (25, 'Pineapple', '25', 30.00),
    (26, 'Papaya', '10', 25.00);
#orders
INSERT INTO orders(order_Id, customer_Id, order_date, order_status_Id, shipped_date, shipper_Id)
VALUES
	(1, 8, '2023-02-27', 3, '2023-02-27',1),
    (2, 9, '2023-02-27', 3, '2023-02-28',4),
    (3, 1, '2023-03-15', 3, '2023-03-17',2),
    (4, 5, '2023-03-22', 3, '2023-03-23',1),
    (5, 3, '2023-03-28', 3, '2023-03-30',5),
    (6, 7, '2023-04-07', 3, '2023-04-08',1),
    (7, 1, '2023-04-17', 3, '2023-04-17',3),
    (8, 8, '2023-04-26', 3, '2023-04-27',5),
    (9, 11, '2023-04-30', 3, '2023-04-30',2),
    (10, 2, '2023-05-05', 3, '2023-05-05',4),
    (11, 4, '2023-05-08', 3, '2023-05-10',1),
    (12, 6, '2023-05-11', 3, '2023-05-11',2),
    (13, 10, '2023-05-20', 3, '2023-05-20',1),
    (14, 12, '2023-05-24', 3, '2023-05-24',4),
    (15, 9, '2023-05-27', 3, '2023-05-28',5),
    (16, 7, '2023-06-02', 3, '2023-06-02',3),
    (17, 3, '2023-06-06', 3, '2023-06-07',2),
    (18, 8, '2023-06-10', 3, '2023-06-11',1),
    (19, 5, '2023-06-15', 3, '2023-06-17',3),
    (20, 2, '2023-06-22', 3, '2023-06-22',4),
    (21, 9, '2023-06-28', 3, '2023-06-30',5),
    (22, 11, '2023-07-10', 3, '2023-07-11',1),
    (23, 8, '2023-07-16', 3, '2023-07-17',3),
    (24, 12, '2023-07-23', 3, '2023-07-23',5),
    (25, 3, '2023-08-01', 3, '2023-08-11',2),
    (26, 4, '2023-08-10', 3, '2023-08-11',4),
    (27, 7, '2023-08-15', 3, '2023-08-16',1),
    (28, 3, '2023-08-25', 3, '2023-08-25',2),
    (29, 5, '2023-08-31', 3, '2023-08-31',1),
    (30, 8, '2023-09-02', 3, '2023-09-03',4),
    (31, 6, '2023-09-06', 3, '2023-09-06',3),
    (32, 1, '2023-09-12', 3, '2023-08-14',2),
    (33, 2, '2023-09-18', 3, '2023-09-19',5),
	(34, 10, '2023-09-18', 3, '2023-09-18',4),
	(35, 8, '2023-09-24', 3, '2023-09-24',1),
	(36, 4, '2023-09-28', 3, '2023-09-28',5),
	(37, 9, '2023-09-28', 3, '2023-09-29',3),
    (38, 12, '2023-09-30', 3, '2023-09-30',4),
    (39, 5, '2023-10-02', 3, '2023-10-02',2),
    (40, 11, '2023-10-04', 3, '2023-10-04',1),
    (41, 5, '2023-10-05', 2, '2023-10-06',3),
    (42, 1, '2023-10-06', 2, '2023-10-06',5),
    (43, 7, '2023-10-07', 1, NULL,4);
    
    
#ordered items
INSERT INTO ordered_items(order_Id, product_Id, quantity, unit_price)
VALUES
	(1, 10, 3, 15.00),
	(2, 9, 2, 20.00),
    (3, 8, 4, 10.00),
    (4, 7, 5, 25.00),
	(5, 6, 2, 35.00),
    (6, 5, 5, 25.00),
    (7, 4, 3, 20.00),
    (8, 3, 2, 30.00),
    (9, 1, 2, 30.00),
    (10, 2, 4, 25.00),
    (11, 12, 10, 10.00),
	(12, 11, 4, 25.00),
    (13, 15, 2, 35.00),
    (14, 13, 5, 25.00),
	(15, 14, 2, 35.00),
    (16, 18, 5, 25.00),
    (17, 16, 3, 20.00),
    (18, 19, 2, 30.00),
    (19, 20, 2, 30.00),
    (20, 17, 4, 25.00),
    (21, 26, 2, 25.00),
	(22, 25, 3, 30.00),
    (23, 24, 1, 50.00),
    (24, 22, 1, 15.00),
	(25, 21, 1, 10.00),
    (26, 23, 2, 30.00),
    (27, 4, 2, 20.00),
    (28, 3, 1, 30.00),
    (29, 1, 2, 30.00),
    (30, 2, 4, 25.00),
    (31, 10, 3, 15.00),
	(32, 9, 2, 20.00),
    (33, 8, 4, 10.00),
    (34, 7, 5, 25.00),
	(35, 6, 2, 35.00),
    (36, 5, 5, 25.00),
    (37, 4, 3, 20.00),
    (38, 3, 2, 30.00),
    (39, 1, 2, 30.00),
    (40, 2, 4, 25.00),
    (41, 2, 4, 25.00),
    (42, 2, 4, 25.00),
    (43, 2, 4, 25.00);
#order status
INSERT INTO order_status(order_status_Id, status_label)
VALUES
	(1, 'processed'),
	(2, 'shipped'),
	(3, 'delivered'),
    (4, 'cancelled');
    

#shippers
INSERT INTO shippers(shipper_Id, shipper_name)
VALUE
	(1, 'Ubber Eats'),
    (2, 'Little Cab'),
	(3, 'Bolt'),
    (4, 'Go Rider'),
    (5, 'Go little');
#payments
INSERT INTO payments(payment_Id, order_Id, customer_Id, Date_paid, Amount, payment_mode)
VALUES
	(1, 1, 8,'2023-02-27', 45.00, 2),
    (2, 2, 9,'2023-02-28', 40.00, 2),
    (3, 3, 1,'2023-03-15', 40.00, 1),
    (4, 4, 5,'2023-03-22', 45.00, 1),
    (5, 5, 3,'2023-03-28', 70.00, 3),
    (6, 6, 7,'2023-04-07', 125.00, 2),
    (7, 7, 1,'2023-04-17', 60.00, 2),
    (8, 8, 8,'2023-04-26', 60.00, 2),
    (9, 9, 11,'2023-04-30', 60.00, 1),
    (10, 10, 2,'2023-05-05', 100.00, 2),
	(11, 11, 4,'2023-05-08', 100.00, 3),
    (12, 12, 6,'2023-05-11', 100.00, 2),
    (13, 13, 10,'2023-05-20', 70.00, 2),
    (14, 14, 12,'2023-05-24', 50.00, 1),
    (15, 15, 9,'2023-05-27', 70.00, 2),
    (16, 16, 7,'2023-06-02', 125.00, 3),
    (17, 17, 3,'2023-06-06', 60.00, 2),
    (18, 18, 8,'2023-06-10', 60.00, 2),
    (19, 19, 5,'2023-06-15', 60.00, 1),
    (20, 20, 2,'2023-06-22', 100.00, 2),
    (21, 21, 9,'2023-06-28', 50.00, 3),
    (22, 22, 11,'2023-07-10', 90.00, 2),
    (23, 23, 8,'2023-07-16', 50.00, 2),
    (24, 24, 12,'2023-07-23', 15.00, 1),
    (25, 25, 3,'2023-08-01', 10.00, 2),
    (26, 26, 4,'2023-08-10', 60.00, 2),
    (27, 27, 7,'2023-08-15', 40.00, 3),
    (28, 28, 3,'2023-08-25', 30.00, 1),
    (29, 29, 5,'2023-08-31', 60.00, 2),
    (30, 30, 8,'2023-09-02', 100.00, 2),
    (31, 31, 6,'2023-09-06', 45.00, 1),
    (32, 32, 1,'2023-09-12', 40.00, 2),
    (33, 33, 2,'2023-09-18', 40.00, 3),
    (34, 34, 10,'2023-09-18', 125.00, 2),
    (35, 35, 8,'2023-09-24', 70.00, 2),
    (36, 36, 4,'2023-09-28', 125.00, 1),
    (37, 37, 9,'2023-09-28', 60.00, 1),
    (38, 38, 12,'2023-09-30', 60.00, 2),
    (39, 39, 5,'2023-10-02', 60.00, 3),
    (40, 40, 11,'2023-10-04', 100.00, 3),
    (41, 41, 5,'2023-10-05', 100.00, 2),
    (42, 42, 1,'2023-10-06', 100.00, 1),
	(43, 43, 7,'2023-10-07', 100.00, 2);
#payment methods
INSERT INTO payment_methods(payment_mode, payment_name)
VALUES
	(1, 'Cash'),
    (2, 'Mpesa'),
    (3, 'Credit Card'),
    (4, 'PayPal');


