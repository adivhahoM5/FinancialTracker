
-- 1. Parent tables first (no FKs)

CREATE TABLE income_type (
    income_type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL
);

CREATE TABLE expense_type (
    expense_type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW()
);

-- 2. ACCOUNT - FK to USER

CREATE TABLE account (
    account_id SERIAL PRIMARY KEY,
    user_id INT,
    bank_name VARCHAR(100),
    account_type VARCHAR(50),
    balance FLOAT DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 3. TRANSACTION - FK to ACCOUNT

CREATE TABLE transaction (
    transaction_id SERIAL PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(50),
    amount FLOAT,
    transaction_date DATE DEFAULT CURRENT_DATE,
    description VARCHAR(255),
    FOREIGN KEY (account_id) REFERENCES account(account_id) ON DELETE CASCADE
);

-- 4. TRANSFER - 2 FKs to ACCOUNT

CREATE TABLE transfer (
    transfer_id SERIAL PRIMARY KEY,
    from_account_id INT,
    to_account_id INT,
    amount FLOAT,
    transfer_date DATE DEFAULT CURRENT_DATE,
    note VARCHAR(255),
    FOREIGN KEY (from_account_id) REFERENCES account(account_id) ON DELETE CASCADE,
    FOREIGN KEY (to_account_id) REFERENCES account(account_id) ON DELETE CASCADE
);

-- 5. INCOME - FKs to TRANSACTION and INCOME_TYPE

CREATE TABLE income (
    income_id SERIAL PRIMARY KEY,
    transaction_id INT,
    income_type_id INT,
    amount FLOAT,
    date_received DATE DEFAULT CURRENT_DATE,
    source_notes VARCHAR(255),
    FOREIGN KEY (transaction_id) REFERENCES transaction(transaction_id) ON DELETE CASCADE,
    FOREIGN KEY (income_type_id) REFERENCES income_type(income_type_id)
);

-- 6. EXPENSE - FKs to TRANSACTION and EXPENSE_TYPE

CREATE TABLE expense (
    expense_id SERIAL PRIMARY KEY,
    transaction_id INT,
    expense_type_id INT,
    amount FLOAT,
    date_incurred DATE DEFAULT CURRENT_DATE,
    notes VARCHAR(255),
    FOREIGN KEY (transaction_id) REFERENCES transaction(transaction_id) ON DELETE CASCADE,
    FOREIGN KEY (expense_type_id) REFERENCES expense_type(expense_type_id)
);
-- TYPES
INSERT INTO income_type (type_name) VALUES 
('Salary'), ('Cheque'), ('Gift'), ('Freelance'), ('Business');

INSERT INTO expense_type (type_name) VALUES 
('School Fees'), ('Entertainment'), ('Housing'), ('Groceries'), ('Transport'), ('Utilities'), ('Healthcare');

-- 4 USERS
INSERT INTO users (name, email, password_hash) VALUES
('Thabo Mokoena', 'thabo@gmail.com', 'hash123'),
('Sarah Nkosi', 'sarah@gmail.com', 'hash123'),
('John Smith', 'john@gmail.com', 'hash123'),
('Lerato Dlamini', 'lerato@gmail.com', 'hash123');

-- ACCOUNTS (each user has 1-2 accounts)
INSERT INTO account (user_id, bank_name, account_type, balance) VALUES
(1, 'Capitec', 'Savings', 15000),
(1, 'FNB', 'Cheque', 5000),
(2, 'ABSA', 'Savings', 22000),
(3, 'Standard Bank', 'Savings', 8000),
(4, 'Nedbank', 'Savings', 30000),
(4, 'Capitec', 'Cheque', 12000);

-- JAN 2026
INSERT INTO transaction (account_id, transaction_type, amount, transaction_date, description) VALUES
(1, 'income', 15000, '2026-01-05', 'Jan Salary'), (1, 'expense', 5000, '2026-01-06', 'Rent'),
(1, 'expense', 1200, '2026-01-10', 'Groceries'), (3, 'income', 20000, '2026-01-05', 'Jan Salary'),
(3, 'expense', 7000, '2026-01-07', 'Rent'), (5, 'income', 30000, '2026-01-05', 'Business income');

INSERT INTO income (transaction_id, income_type_id, amount, date_received) VALUES (1, 1, 15000, '2026-01-05'), (4, 1, 20000, '2026-01-05'), (6, 5, 30000, '2026-01-05');
INSERT INTO expense (transaction_id, expense_type_id, amount, date_incurred) VALUES (2, 3, 5000, '2026-01-06'), (3, 4, 1200, '2026-01-10'), (5, 3, 7000, '2026-01-07');

-- FEB 2026
INSERT INTO transaction (account_id, transaction_type, amount, transaction_date, description) VALUES
(1, 'income', 15000, '2026-02-05', 'Feb Salary'), (1, 'expense', 5000, '2026-02-06', 'Rent'), (1, 'expense', 800, '2026-02-15', 'Movies'),
(3, 'income', 20000, '2026-02-05', 'Feb Salary'), (3, 'expense', 3000, '2026-02-10', 'School Fees'), (5, 'income', 25000, '2026-02-10', 'Freelance');

INSERT INTO income (transaction_id, income_type_id, amount, date_received) VALUES (7, 1, 15000, '2026-02-05'), (10, 1, 20000, '2026-02-05'), (12, 4, 25000, '2026-02-10');
INSERT INTO expense (transaction_id, expense_type_id, amount, date_incurred) VALUES (8, 3, 5000, '2026-02-06'), (9, 2, 800, '2026-02-15'), (11, 1, 3000, '2026-02-10');

-- MAR 2026
INSERT INTO transaction (account_id, transaction_type, amount, transaction_date, description) VALUES
(1, 'income', 15000, '2026-03-05', 'Mar Salary'), (2, 'income', 5000, '2026-03-15', 'Gift from family'), (1, 'expense', 5500, '2026-03-06', 'Rent + Utilities'),
(4, 'income', 8000, '2026-03-01', 'Mar Salary'), (4, 'expense', 2000, '2026-03-05', 'Transport'), (6, 'expense', 10000, '2026-03-20', 'Housing project');

INSERT INTO income (transaction_id, income_type_id, amount, date_received) VALUES (13, 1, 15000, '2026-03-05'), (14, 3, 5000, '2026-03-15'), (16, 1, 8000, '2026-03-01');
INSERT INTO expense (transaction_id, expense_type_id, amount, date_incurred) VALUES (15, 6, 5500, '2026-03-06'), (17, 5, 2000, '2026-03-05'), (18, 3, 10000, '2026-03-20');

-- APR, MAY, JUN 2026
INSERT INTO transaction (account_id, transaction_type, amount, transaction_date, description) VALUES
(1, 'income', 16000, '2026-04-05', 'Apr Salary'), (1, 'expense', 5000, '2026-04-06', 'Rent'), (3, 'income', 20000, '2026-04-05', 'Apr Salary'),
(3, 'expense', 1500, '2026-04-12', 'Groceries'), (5, 'income', 35000, '2026-04-05', 'Business'), (5, 'expense', 8000, '2026-04-10', 'Housing'),
(1, 'income', 16000, '2026-05-05', 'May Salary'), (1, 'expense', 5000, '2026-05-06', 'Rent'), (2, 'expense', 2000, '2026-05-20', 'Entertainment'),
(4, 'income', 8500, '2026-05-01', 'May Salary'), (5, 'income', 30000, '2026-05-05', 'Business'), (6, 'expense', 1200, '2026-05-15', 'Healthcare'),
(1, 'income', 16000, '2026-06-05', 'Jun Salary'), (3, 'income', 22000, '2026-06-05', 'Jun Salary + Bonus'), (3, 'expense', 5000, '2026-06-06', 'Rent'),
(5, 'expense', 4000, '2026-06-10', 'School Fees'), (4, 'expense', 3000, '2026-06-15', 'Utilities');

INSERT INTO income (transaction_id, income_type_id, amount, date_received) VALUES 
(19, 1, 16000, '2026-04-05'), (21, 1, 20000, '2026-04-05'), (23, 5, 35000, '2026-04-05'),
(25, 1, 16000, '2026-05-05'), (28, 1, 8500, '2026-05-01'), (29, 5, 30000, '2026-05-05'),
(31, 1, 16000, '2026-06-05'), (32, 1, 22000, '2026-06-05');

INSERT INTO expense (transaction_id, expense_type_id, amount, date_incurred) VALUES
(20, 3, 5000, '2026-04-06'), (22, 4, 1500, '2026-04-12'), (24, 3, 8000, '2026-04-10'),
(26, 3, 5000, '2026-05-06'), (27, 2, 2000, '2026-05-20'), (30, 7, 1200, '2026-05-15'),
(33, 3, 5000, '2026-06-06'), (34, 1, 4000, '2026-06-10'), (35, 6, 3000, '2026-06-15');

-- ADD SOME TRANSFERS
INSERT INTO transfer (from_account_id, to_account_id, amount, transfer_date, note) VALUES
(1, 2, 2000, '2026-02-20', 'Move to cheque'), (5, 6, 5000, '2026-04-15', 'Savings transfer'), (1, 2, 1500, '2026-05-25', 'Monthly transfer');
SELECT * FROM users;

