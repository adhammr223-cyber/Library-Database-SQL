-- System Name: Library Management System
-- Student Name: Adham Muayad Hashem
-- Student ID: 1320231720

USE library_management_db;

START TRANSACTION;

INSERT INTO categories (category_name, description) VALUES
('Programming', 'Books about programming languages'),
('Database', 'Books about database systems and SQL'),
('Networking', 'Books about computer networks'),
('Artificial Intelligence', 'Books about AI and machine learning'),
('Cyber Security', 'Books about security and hacking'),
('Mathematics', 'Books about mathematics and statistics'),
('Business', 'Books about business and management'),
('English Language', 'Books for learning English'),
('History', 'Books about history'),
('Science', 'Books about science subjects');


INSERT INTO authors (first_name, last_name, nationality) VALUES
('Robert', 'Martin', 'American'),
('James', 'Gosling', 'Canadian'),
('Abraham', 'Silberschatz', 'American'),
('Andrew', 'Tanenbaum', 'Dutch'),
('Stuart', 'Russell', 'British'),
('Kevin', 'Mitnick', 'American'),
('Thomas', 'Cormen', 'American'),
('Peter', 'Drucker', 'Austrian'),
('Raymond', 'Murphy', 'British'),
('Yuval', 'Harari', 'Israeli');


INSERT INTO members (full_name, email, phone, address, registration_date) VALUES
('Ahmed Ali', 'ahmed.ali@example.com', '0599000001', 'Gaza - Al Remal', '2025-09-01'),
('Sara Hassan', 'sara.hassan@example.com', '0599000002', 'Gaza - Tal Al Hawa', '2025-09-05'),
('Mohammad Salem', 'mohammad.salem@example.com', '0599000003', 'Gaza - Al Nasr', '2025-09-10'),
('Lina Omar', 'lina.omar@example.com', '0599000004', 'Gaza - Al Shujaeya', '2025-09-12'),
('Omar Khaled', 'omar.khaled@example.com', '0599000005', 'Gaza - Beach Camp', '2025-09-15'),
('Mariam Nasser', 'mariam.nasser@example.com', '0599000006', 'Gaza - Al Zaytoun', '2025-09-20'),
('Yousef Mahmoud', 'yousef.mahmoud@example.com', '0599000007', 'Gaza - Jabalia', '2025-09-22'),
('Rana Sami', 'rana.sami@example.com', '0599000008', 'Gaza - Khan Younis', '2025-09-25'),
('Khaled Adel', 'khaled.adel@example.com', '0599000009', 'Gaza - Rafah', '2025-10-01'),
('Hala Ibrahim', 'hala.ibrahim@example.com', '0599000010', 'Gaza - Deir Al Balah', '2025-10-05');


INSERT INTO books (title, isbn, publication_year, quantity, category_id, author_id) VALUES
('Clean Code', '9780132350884', 2008, 8, 1, 1),
('Java Programming Basics', '9781111111111', 2015, 10, 1, 2),
('Database System Concepts', '9780073523323', 2019, 6, 2, 3),
('Computer Networks', '9780132126953', 2011, 7, 3, 4),
('Artificial Intelligence Modern Approach', '9780134610993', 2020, 5, 4, 5),
('The Art of Invisibility', '9780316380508', 2017, 4, 5, 6),
('Introduction to Algorithms', '9780262033848', 2009, 9, 6, 7),
('Management Challenges', '9780887309991', 1999, 3, 7, 8),
('English Grammar in Use', '9781108457651', 2019, 12, 8, 9),
('Sapiens', '9780062316097', 2015, 6, 9, 10);


INSERT INTO loans (member_id, loan_date, due_date, return_date, status) VALUES
(1, '2026-02-01', '2026-02-15', '2026-02-10', 'Returned'),
(2, '2026-02-03', '2026-02-17', '2026-02-25', 'Returned'),
(3, '2026-02-05', '2026-02-19', NULL, 'Borrowed'),
(4, '2026-01-10', '2026-01-24', NULL, 'Overdue'),
(5, '2026-01-12', '2026-01-26', '2026-02-01', 'Returned'),
(1, '2026-03-01', '2026-03-15', NULL, 'Overdue'),
(6, '2026-03-05', '2026-03-19', '2026-03-25', 'Returned'),
(7, '2026-03-07', '2026-03-21', NULL, 'Overdue'),
(8, '2026-04-01', '2026-04-15', '2026-04-20', 'Returned'),
(9, '2026-04-03', '2026-04-17', NULL, 'Overdue'),
(10, '2026-04-10', '2026-04-24', '2026-04-29', 'Returned'),
(2, '2026-05-01', '2026-05-15', NULL, 'Overdue');


INSERT INTO loan_details (loan_id, book_id, quantity) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 5, 1),
(2, 9, 1),
(3, 2, 1),
(4, 4, 1),
(4, 6, 1),
(5, 7, 1),
(6, 3, 1),
(6, 10, 1),
(7, 8, 1),
(8, 10, 1),
(9, 6, 1),
(10, 5, 1),
(11, 9, 1),
(12, 3, 1);


INSERT INTO fines (loan_id, fine_amount, fine_reason, fine_date, paid_status) VALUES
(1, 0.00, 'No fine, returned on time', '2026-02-10', 'Paid'),
(2, 8.00, 'Late return after due date', '2026-02-25', 'Paid'),
(4, 15.00, 'Book not returned on time', '2026-01-30', 'Unpaid'),
(5, 6.00, 'Late return after due date', '2026-02-01', 'Paid'),
(6, 12.00, 'Book still overdue', '2026-03-20', 'Unpaid'),
(7, 6.00, 'Late return after due date', '2026-03-25', 'Paid'),
(8, 10.00, 'Book still overdue', '2026-03-25', 'Unpaid'),
(9, 5.00, 'Late return after due date', '2026-04-20', 'Paid'),
(10, 14.00, 'Book still overdue', '2026-04-22', 'Unpaid'),
(11, 5.00, 'Late return after due date', '2026-04-29', 'Paid');
COMMIT;
