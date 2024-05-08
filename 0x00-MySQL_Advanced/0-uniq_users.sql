-- SQL script to create a table named 'users' if it doesn't already exist.
-- This table stores user information including their unique email addresses.

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255)
);
