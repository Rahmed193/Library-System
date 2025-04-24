CREATE DATABASE library_db;

DROP TABLE IF EXISTS branch;
CREATE TABLE branch
(
            branch_id VARCHAR(10) PRIMARY KEY,
            manager_id VARCHAR(10),
            branch_address VARCHAR(30),
            contact_no VARCHAR(15)
);


-- Create table "Employee"
DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
            emp_id VARCHAR(10) PRIMARY KEY,
            emp_name VARCHAR(30),
            position VARCHAR(30),
            salary DECIMAL(10,2),
            branch_id VARCHAR(10),
            FOREIGN KEY (branch_id) REFERENCES  branch(branch_id)
);


-- Create table "Members"
DROP TABLE IF EXISTS members;
CREATE TABLE members
(
            member_id VARCHAR(10) PRIMARY KEY,
            member_name VARCHAR(30),
            member_address VARCHAR(30),
            reg_date DATE
);



-- Create table "Books"
DROP TABLE IF EXISTS books;
CREATE TABLE books
(
            isbn VARCHAR(50) PRIMARY KEY,
            book_title VARCHAR(80),
            category VARCHAR(30),
            rental_price DECIMAL(10,2),
            status VARCHAR(10),
            author VARCHAR(30),
            publisher VARCHAR(30)
);



-- Create table "IssueStatus"
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
(
            issued_id VARCHAR(10) PRIMARY KEY,
            issued_member_id VARCHAR(30),
            issued_book_name VARCHAR(80),
            issued_date DATE,
            issued_book_isbn VARCHAR(50),
            issued_emp_id VARCHAR(10),
            FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
            FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id),
            FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn) 
);



-- Create table "ReturnStatus"
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(
            return_id VARCHAR(10) PRIMARY KEY,
            issued_id VARCHAR(30),
            return_book_name VARCHAR(80),
            return_date DATE,
            return_book_isbn VARCHAR(50),
            FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
);

SELECT * FROM employees; 

INSERT INTO employees (emp_id, emp_name, position, salary, branch_id) 
VALUES
('E101', 'John Doe', 'Clerk', 60000, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000, 'B005');

SELECT * FROM issued_status;


INSERT INTO issued_status (issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102');

SELECT * FROM return_status; 

INSERT INTO return_status (return_id, issued_id, return_book_name, return_date, return_book_isbn) 
VALUES
('RS101', 'IS134', NULL, '2023-06-06', NULL),
('RS102', 'IS133', NULL, '2023-06-07', NULL),
('RS103', 'IS132', NULL, '2023-08-07', NULL),
('RS104', 'IS106', NULL, '2024-05-01', NULL),
('RS105', 'IS107', NULL, '2024-05-03', NULL),
('RS106', 'IS108', NULL, '2024-05-05', NULL),
('RS107', 'IS109', NULL, '2024-05-07', NULL),
('RS108', 'IS110', NULL, '2024-05-09', NULL),
('RS109', 'IS111', NULL, '2024-05-11', NULL),
('RS110', 'IS112', NULL, '2024-05-13', NULL),
('RS111', 'IS113', NULL, '2024-05-15', NULL),
('RS112', 'IS114', NULL, '2024-05-17', NULL),
('RS113', 'IS115', NULL, '2024-05-19', NULL),
('RS114', 'IS116', NULL, '2024-05-21', NULL),
('RS115', 'IS117', NULL, '2024-05-23', NULL),
('RS116', 'IS118', NULL, '2024-05-25', NULL),
('RS117', 'IS119', NULL, '2024-05-27', NULL),
('RS118', 'IS120', NULL, '2024-05-29', NULL);

-- Project Task 

-- Task 1. Create a New Book Record -- "978-1-60129-456-2", 'To Kill a Mockingbird', 'Classic, 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'
SELECT * FROM books; 
INSERT INTO books (isbn, book_title, category, rental_price, status, author, publisher)
VALUES 
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

-- Task 2: Update an Existing Member's Address 
UPDATE members 
SET member_address = '125 Main St'
WHERE member_id = 'C101';

-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table 

SELECT * FROM issued_status
WHERE issued_id = 'IS104';

DELETE FROM issued_status 
WHERE issued_id = 'IS104';

-- Task 4: Retrieve all books issued by a specific employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'
SELECT * 
FROM issued_status 
WHERE issued_emp_id = 'E101';


-- Task 5: List Members who have issued more than one book 
-- Objective: Use GROUP BY to find members who have issued more than one book 
SELECT 
	issued_emp_id, 
	COUNT(*)
FROM issued_status
GROUP BY 1
HAVING COUNT(*) > 1;

-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt
CREATE TABLE book_issued_cnt AS 
	SELECT b.isbn, b.book_title, COUNT(ist.issued_id) AS issue_count
	FROM issued_status AS ist 
	JOIN books AS b 
	ON ist.issued_book_isbn = b.isbn
	GROUP BY b.isbn, b.book_title;

-- Data Analysis & Findings 

-- Task 7: Retrieve all books in a specific category
SELECT * 
FROM books 
WHERE category = 'Classic'; 

-- Task 8: Find Total Rental Income by Category 
SELECT b.category, SUM(b.rental_price), COUNT(*)
FROM issued_status AS ist 
JOIN books AS b 
ON b.isbn = ist.issued_book_isbn 
GROUP BY 1; 

-- Task 9: List Members who registered in the last 180 Days: 
SELECT * FROM members 
WHERE reg_date >= CURRENT_DATE - INTERVAL '180 Days'; 

-- Task 10: List Employees with Their Branch Manager's Name and their Branch details:
SELECT 
	e1.emp_id, 
	e1.emp_name,
	e1.position,
	e1.salary,
	b.*,
	e2.emp_name AS manager
FROM employees As e1
JOIN branch AS b
ON e1.branch_id = b.branch_id 
JOIN
employees AS e2
ON e2.emp_id = b.manager_id;

-- Task 11: Create a Table of Books with Rental Price above a certain threshold
CREATE TABLE expensive_books AS 
SELECT * 
FROM books 
WHERE rental_price > 7.00;

-- Task 12: Retrieve the list of books not yet returned 
SELECT * 
FROM issued_status AS i
LEFT JOIN return_status as r
ON r.issued_id = i.issued_id
WHERE r.return_id IS NULL; 

-- Advanced SQL Operations 

-- Task 13: Identify Members with Overdue Books 
-- Identify members who have overdue books (assume a 30-day return period).
-- Display the member's_id, member's name, book title, issue date, and days overdue
SELECT 
    ist.issued_member_id,
    m.member_name,
    bk.book_title,
    ist.issued_date,
    CURRENT_DATE - ist.issued_date as over_dues_days
FROM issued_status as ist
JOIN 
members as m
    ON m.member_id = ist.issued_member_id
JOIN 
books as bk
ON bk.isbn = ist.issued_book_isbn
LEFT JOIN 
return_status as rs
ON rs.issued_id = ist.issued_id
WHERE 
    rs.return_date IS NULL
    AND
    (CURRENT_DATE - ist.issued_date) > 30
ORDER BY 1;

-- Task 15: Branch Performance Report 
-- Generate a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals 
CREATE TABLE branch_reports
AS
SELECT 
    b.branch_id,
    b.manager_id,
    COUNT(ist.issued_id) as number_book_issued,
    COUNT(rs.return_id) as number_of_book_return,
    SUM(bk.rental_price) as total_revenue
FROM issued_status as ist
JOIN 
employees as e
ON e.emp_id = ist.issued_emp_id
JOIN
branch as b
ON e.branch_id = b.branch_id
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
JOIN 
books as bk
ON ist.issued_book_isbn = bk.isbn
GROUP BY 1, 2;

SELECT * FROM branch_reports;