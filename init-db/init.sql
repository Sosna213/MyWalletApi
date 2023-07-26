-- create the databases
CREATE DATABASE my_wallet_db TABLESPACE = pg_default;

-- connect to the database
\c my_wallet_db;

-- create the tables
CREATE TABLE IF NOT EXISTS financial_transactions
(
    id         serial       NOT NULL,
    name       VARCHAR(255),
    category   VARCHAR(255) NOT NULL,
    amount     integer      NOT NULL,
    currency   VARCHAR(255) NOT NULL,
    user_id    integer      NOT NULL,
    date       DATE         NOT NULL,
    account_id integer      NOT NULL,
    CONSTRAINT financial_transactions_pk PRIMARY KEY (id)
    );



CREATE TABLE IF NOT EXISTS users
(
    id   serial       NOT NULL,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (id)
    );



CREATE TABLE IF NOT EXISTS accounts
(
    id       serial       NOT NULL,
    user_id  integer      NOT NULL,
    name     VARCHAR(255) NOT NULL,
    balance  integer      NOT NULL,
    currency VARCHAR(255) NOT NULL,
    CONSTRAINT account_pk PRIMARY KEY (id)
    );


ALTER TABLE financial_transactions
    ADD CONSTRAINT financial_transactions_fk0 FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE financial_transactions
    ADD CONSTRAINT financial_transactions_fk1 FOREIGN KEY (account_id) REFERENCES accounts (id);


ALTER TABLE accounts
    ADD CONSTRAINT account_fk0 FOREIGN KEY (user_id) REFERENCES users (id);