--Inserting the data into my LibraryDB;

--insert into author table
Insert Into Authors(AuthorID,Name) Values
(1,'Chetan Bhagat'),
(2, 'J.K. Rowling'),
(3, 'George Orwell');

-- Insert into Publisher Table
INSERT INTO Publisher (PublisherID, Name, YearOfPublication) VALUES
(10, 'Transworld Publishers', 1996),
(11, 'Dutton Books', NULL),
(12, 'HarperCollins', 1997);

--insert into Books Table
INSERT INTO Books (ISBN, Title, Category, Edition, Price, AuthorID, PublisherID) VALUES
('9780552161237', 'Inferno', 'Thriller', NULL, 499.50, 1, 10),
('9780747532743', 'Harry Potter and the Philosopher''s Stone', 'Fantasy', '1st', 499.50, 2, 11),
('9780525478812', 'Looking for Alaska', 'Young Adult', '1st', 399.00, 3, 12);

-- Inserting into Readers Table
INSERT INTO Readers (UserID, FirstName, LastName, Email, PhoneNo) VALUES
(1001, 'Alice', 'Smith', 'alice@example.com', '1234567890'),
(1002, 'Bob', 'Johnson', 'bob@example.com', '9876543210'),
(1003, 'Charlie', 'Brown', NULL, NULL); -- Missing contact info

-- Inserting into Staff Table 
INSERT INTO Staff (StaffID, Name, Role) VALUES
(201, 'Mr. Das', 'Librarian'),
(202, 'Ms. Roy', 'Assistant'),
(203, 'Mr. Khan', 'Accountant'),
(204, 'Mrs. Mehta', 'Cleaner')
on conflict (StaffID) Do nothing;

-- Inserting into Loan Table
INSERT INTO Loan (LoanID, UserID, ISBN, ReserveDate, ReturnDate, DueDate) VALUES
(301, 1001, '9780552161237', '2025-08-01', NULL, '2025-08-15'),
(302, 1002, '9780747532743', '2025-08-03', '2025-08-10', '2025-08-17'),
(303, 1003, '9780525478812', '2025-08-04', NULL, '2025-08-18');

-- Inserting into Login Table
INSERT INTO Login (LoginID, UserID, Password) VALUES
(401, 1001, 'hashed_password1'),
(402, 1002, 'hashed_password2');

-- Inserting into Reports Table
INSERT INTO Reports (ReportID, BookNo, RegNo, IssueReturn, StaffID) VALUES
(501, '9780552161237', 1001, 'Issued', 201),
(502, '9780747532743', 1002, 'Returned', 202),
(503, '9780525478812', 1003, 'Issued', 203),
(504, '9780552161237', 1002, 'Returned', 204),
(505, '9780747532743', 1001, 'Reissued', 201)
on conflict (ReportID) Do nothing;


SELECT * FROM Authors;
SELECT * FROM Publisher;
SELECT * FROM Books;
SELECT * FROM Readers;
SELECT * FROM Staff;
SELECT * FROM Loan;
SELECT * FROM Login;
SELECT * FROM Reports;

--updates commands
update Readers
set phoneno = '9000011122'
where userid = 1003;

update Login
set password = 'Alice*#@21'
where loginid = 402

update Publisher
set yearofpublication = 2000
where publisherid = 11

--delete commands
delete from reports
where reportid = 503;

delete from staff
where staffid = 203;
