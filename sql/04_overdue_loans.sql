USE library_management_db;

SELECT loans.loan_id, members.full_name, loans.loan_date, loans.due_date,
       DATEDIFF(CURDATE(), loans.due_date) AS days_overdue
FROM loans
JOIN members ON loans.member_id = members.member_id
WHERE loans.return_date IS NULL
  AND loans.due_date < CURDATE()
ORDER BY loans.due_date;
