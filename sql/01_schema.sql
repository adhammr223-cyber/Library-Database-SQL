-- System Name: Library Management System
-- Student Name: Adham Muayad Hashem
-- Student ID: 1320231720

CREATE DATABASE IF NOT EXISTS library_management_db;

USE library_management_db;


CREATE TABLE categories (
    category_id int primary key auto_increment,
    category_name VARCHAR(100) not null,
    description VARCHAR(255)
);


CREATE TABLE authors (
    author_id int primary key auto_increment,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    nationality VARCHAR(50)
);


CREATE TABLE members (
    member_id int primary key auto_increment,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(150),
    registration_date DATE NOT NULL
);


CREATE TABLE books (
    book_id int primary key auto_increment,
    title VARCHAR(150) NOT NULL,
    isbn VARCHAR(30),
    publication_year int,
    quantity int NOT NULL,
    category_id int NOT NULL,
    author_id int NOT NULL,

    CONSTRAINT chk_book_quantity CHECK (quantity >= 0),

    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);


CREATE TABLE loans (
    loan_id int primary key auto_increment,
    member_id int NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    status VARCHAR(20) NOT NULL,

    CONSTRAINT chk_loan_dates CHECK (due_date >= loan_date),
    CONSTRAINT chk_return_date CHECK (return_date IS NULL OR return_date >= loan_date),
    CONSTRAINT chk_loan_status CHECK (status IN ('Borrowed', 'Overdue', 'Returned')),
    CONSTRAINT chk_return_status CHECK (
        (status = 'Returned' AND return_date IS NOT NULL) OR
        (status IN ('Borrowed', 'Overdue') AND return_date IS NULL)
    ),

    FOREIGN KEY (member_id) REFERENCES members(member_id)
);


CREATE TABLE loan_details (
    loan_id int NOT NULL,
    book_id int,
    quantity int NOT NULL,

    PRIMARY KEY (loan_id, book_id),
    CONSTRAINT chk_loan_quantity CHECK (quantity > 0),

    FOREIGN KEY (loan_id) REFERENCES loans(loan_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);


CREATE TABLE fines (
    fine_id int primary key auto_increment,
    loan_id int NOT NULL UNIQUE,
    fine_amount DECIMAL(8,2) NOT NULL,
    fine_reason VARCHAR(150),
    fine_date DATE NOT NULL,
    paid_status VARCHAR(20) NOT NULL,

    CONSTRAINT chk_fine_amount CHECK (fine_amount >= 0),
    CONSTRAINT chk_payment_status CHECK (paid_status IN ('Paid', 'Unpaid')),

    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);