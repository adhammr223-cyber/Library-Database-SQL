-- System Name: Library Management System
-- Student Name: Adham Muayad Hashem
-- Student ID: 1320231720

USE library_management_db;

--  1. display all records from a table
select * from books;

--  2. search for specific data using where
select title, isbn, publication_year, quantity
from books
where publication_year >= 2018;

--  3. sort data using order by
select full_name, email, registration_date
from members
order by registration_date desc;

--  4. use aggregate function (count)
select count(*) as Total_Books
from books;

--  5. use aggregate function (avg)
select avg(fine_amount) as Average_Fine_Amount
from fines;

--  6. use aggregate function (sum)
select sum(quantity) as Total_Book_Copies
from books;

--  7. use aggregate function (min and max)
select min(publication_year) as Oldest_Book_Year,
       max(publication_year) as Newest_Book_Year
from books;

--  8. group by: count how many books each category has
select c.category_name, count(b.book_id) as Number_of_Books
from categories c
left join books b on b.category_id = c.category_id
group by c.category_id, c.category_name
order by c.category_name;

--  9. having: categories with more than 1 book
select c.category_name, count(b.book_id) as Number_of_Books
from categories c
join books b on b.category_id = c.category_id
group by c.category_id, c.category_name
having count(b.book_id) > 1
order by c.category_name;

--  10. inner join: list books with their authors
select b.title,
       concat(a.first_name, ' ', a.last_name) as Author_Name
from books b
join authors a on a.author_id = b.author_id
order by b.title;

--  11. inner join: list books with their categories
select b.title, c.category_name, b.quantity
from books b
join categories c on c.category_id = b.category_id
order by c.category_name;

--  12. inner join: loan records with member details
select m.full_name, l.loan_date, l.due_date, l.return_date, l.status
from loans l
join members m on m.member_id = l.member_id
order by l.loan_date;

--  13. inner join: show borrowed books in each loan
select m.full_name, b.title, ld.quantity, l.loan_date, l.status
from loan_details ld
join loans l on l.loan_id = ld.loan_id
join members m on m.member_id = l.member_id
join books b on b.book_id = ld.book_id
order by l.loan_date;

--  14. left join: show all members even if they never borrowed a book
select m.full_name, m.email, l.loan_id, l.loan_date
from members m
left join loans l on l.member_id = m.member_id
order by m.full_name;

--  15. left join: show all loans even if they have no fine
select l.loan_id, m.full_name, l.status, f.fine_amount, f.paid_status
from loans l
join members m on m.member_id = l.member_id
left join fines f on f.loan_id = l.loan_id
order by l.loan_id;

--  16. union: combine member names and author names into one list
select full_name as Person_Name
from members
union
select concat(first_name, ' ', last_name) as Person_Name
from authors;

--  17. string function: build a formatted profile string for each member
select concat('MEMBER: ', upper(full_name), ' - EMAIL: ', email) as Member_Profile
from members;

--  18. string function: find books whose title contains a certain keyword
select title, isbn, publication_year
from books
where title like '%Code%';

--  19. books currently still borrowed or overdue
select b.title, m.full_name, l.loan_date, l.due_date, l.status
from loan_details ld
join books b on b.book_id = ld.book_id
join loans l on l.loan_id = ld.loan_id
join members m on m.member_id = l.member_id
where l.return_date is null;

--  20. count how many times each book has been borrowed
select b.title, count(ld.loan_id) as Times_Borrowed
from books b
left join loan_details ld on ld.book_id = b.book_id
group by b.book_id, b.title
order by Times_Borrowed desc;