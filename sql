Terminal close -- exit!
TS customers (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  date_of_birth DATE,
  gender CHAR(1),
  age INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  payment_method VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS order_items (
  order_item_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT NOT NULL,
  item_name VARCHAR(100) NOT NULL,
  item_price DECIMAL(10,2) NOT NULL,
  item_quantity INT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

 -- Insert dummy data into customers table
INSERT INTO customers (first_name, last_name, email, phone_number, date_of_birth, gender, age) VALUES
("John", "Doe", "johndoe@gmail.com", "123-456-7890", "1985-03-21", "M", 36),
("Jane", "Doe", "janedoe@gmail.com", "987-654-3210", "1990-08-15", "F", 31),
("Bob", "Smith", "bobsmith@gmail.com", "555-123-4567", "1978-11-02", "M", 43),
("Alice", "Johnson", "alicejohnson@gmail.com", "777-555-1234", "1989-02-14", "F", 32),
("David", "Brown", "davidbrown@gmail.com", "555-888-7777", "1995-07-09", "M", 26);

-- Insert dummy data into orders table
INSERT INTO orders (customer_id, order_date, total_amount, payment_method) 
VALUES 
  (1, "2023-04-12", 23.45, "Credit Card"),
  (1, "2023-05-07", 17.99, "PayPal"),
  (2, "2023-05-06", 42.18, "Debit Card"),
  (2, "2023-05-07", 13.29, "Cash"),
  (3, "2023-05-05", 29.99, "PayPal"),
  (4, "2023-05-04", 21.99, "Credit Card"),
  (4, "2023-05-05", 12.49, "Debit Card"),
  (4, "2023-05-07", 16.75, "Cash"),
  (5, "2023-05-07", 19.99, "PayPal"),
  (2, "2023-05-07", 37.50, "Credit Card"),
  (5, "2023-05-06", 11.99, "Debit Card"),
  (3, "2023-05-07", 10.50, "Cash"),
  (5, "2023-05-05", 8.99, "PayPal"),
  (5, "2023-05-05", 23.99, "Credit Card"),
  (5, "2023-05-04", 14.50, "Debit Card"),
  (1, "2023-05-06", 17.99, "Debit Card");

-- Insert dummy data into order_items table
INSERT INTO order_items (order_id, item_name, item_price, item_quantity) 
VALUES 
  (1, "Chicken Tikka Masala", 10.99, 2),
  (1, "Garlic Naan", 2.99, 1),
  (2, "Cheeseburger", 7.99, 1),
  (2, "Fries", 2.49, 1),
  (3, "Pepperoni Pizza", 12.99, 1),
  (3, "Garlic Knots", 3.99, 1),
  (4, "Fish and Chips", 8.99, 1),
  (4, "Mushy Peas", 1.99, 1),
  (5, "Spaghetti Carbonara", 9.99, 1),
  (6, "Pancakes", 6.99, 1),
  (6, "Bacon", 2.99, 1),
  (6, "Eggs", 1.99, 1),
  (7, "Hot Dog", 4.99, 1),
  (8, "Fried Rice", 7.99, 1),
  (8, "Egg Rolls", 2.99, 2),
  (9, "Cesar Salad", 5.99, 1),
  (9, "Garlic Bread", 2.99, 1),
  (9, "Soft Drink", 1.99, 1),
  (10, "Fish Tacos", 9.99, 2),
  (10, "Spaghetti Carbonara", 12.99, 2),
  (10, "Garlic Bread", 3.99, 1),
  (10, "Tiramisu", 6.99, 1),
  (11, "Cheeseburger", 8.99, 1),
  (11, "Fries", 2.99, 1),
  (11, "Soft Drink", 1.99, 2),
  (12, "Margherita Pizza", 14.99, 1),
  (12, "Caesar Salad", 7.99, 1),
  (12, "Cheesecake", 5.99, 1),
  (13, "Fish and Chips", 10.99, 1),
  (13, "Cole Slaw", 2.99, 1),
  (13, "Beer", 4.99, 2),
  (14, "Chicken Alfredo", 13.99, 1),
  (14, "Breadsticks", 3.99, 1),
  (14, "Chocolate Cake", 5.99, 1),
  (15, "Pho", 9.99, 1),
  (15, "Egg Rolls", 4.99, 2),
  (15, "Thai Tea", 2.99, 2),
  (16, "Meat Lover\'s Pizza", 16.99, 1),
  (16, "Wings", 7.99, 1);
