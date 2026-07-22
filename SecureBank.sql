USE SecureBank;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS customer;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);


CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(30),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
);


CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    amount DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
);


INSERT INTO customer
VALUES
(1, 'John', 'Smith', 'john@gmail.com'),
(2, 'Sarah', 'Jones', 'sarah@gmail.com'),
(3, 'Mike', 'Brown', 'mike@gmail.com');


INSERT INTO accounts
VALUES
(101, 1, 'Checking', 1200.00),
(102, 1, 'Savings', 3500.00),
(103, 2, 'Checking', 900.00);


INSERT INTO transactions
VALUES
(1, 101, 200.00, '2026-07-20'),
(2, 101, -50.00, '2026-07-21'),
(3, 102, 500.00, '2026-07-22'),
(4, 103, -100.00, '2026-07-22');


SHOW TABLES;

SELECT * FROM customer;
SELECT * FROM accounts;
SELECT * FROM transactions;


SELECT
    customer.first_name,
    customer.last_name,
    accounts.account_id,
    accounts.account_type,
    accounts.balance
FROM customer
INNER JOIN accounts
ON customer.customer_id = accounts.customer_id;


SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    accounts.account_id
FROM customer
LEFT JOIN accounts
ON customer.customer_id = accounts.customer_id
WHERE accounts.account_id IS NULL;


SELECT
    customer.first_name,
    customer.last_name,
    accounts.account_id,
    accounts.account_type,
    transactions.amount,
    transactions.transaction_date
FROM customer
INNER JOIN accounts
ON customer.customer_id = accounts.customer_id
INNER JOIN transactions
ON accounts.account_id = transactions.account_id;

SELECT
    customer.first_name,
    customer.last_name,
    accounts.account_id,
    accounts.account_type,
    accounts.balance
FROM customer
INNER JOIN accounts
ON customer.customer_id = accounts.customer_id;

SELECT
    customer.first_name,
    customer.last_name,
    accounts.account_id
FROM customer
LEFT JOIN accounts
ON customer.customer_id = accounts.customer_id;
SELECT
    customer.first_name,
    customer.last_name,
    accounts.account_id,
    transactions.amount,
    transactions.transaction_date
FROM customer
INNER JOIN accounts
ON customer.customer_id = accounts.customer_id
INNER JOIN transactions
ON accounts.account_id = transactions.account_id;
SELECT * FROM customer;