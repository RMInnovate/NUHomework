-- Drop tables
DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;

-- Create a table of card holders
CREATE TABLE card_holder (
    card_holder_id INT PRIMARY KEY,
    card_holder_name VARCHAR NOT NULL
);

-- Create a table of credit cards
CREATE TABLE credit_card (
    credit_card_number VARCHAR(20) PRIMARY KEY,
    card_holder_id INT,
    FOREIGN KEY (card_holder_id) REFERENCES card_holder(card_holder_id)
);

-- Create a table of merchant categories
CREATE TABLE merchant_category (
    merchant_category_id INT PRIMARY KEY,
    merchant_category_name VARCHAR
);

-- Create a table of merchants
CREATE TABLE merchant (
    merchant_id INT PRIMARY KEY,
    merchant_name VARCHAR,
    merchant_category_id INT,
    FOREIGN KEY (merchant_category_id) REFERENCES merchant_category(merchant_category_id)
);

-- Create a table of transactions
CREATE TABLE transaction (
    transaction_id INT PRIMARY KEY,
    transaction_date TIMESTAMP,
    transaction_amount FLOAT,
    credit_card_number VARCHAR(20),
    FOREIGN KEY (credit_card_number) REFERENCES credit_card(credit_card_number),
    merchant_id INT,
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id)
);
