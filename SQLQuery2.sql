CREATE TABLE reservation (
  Book_ID INT NOT NULL,
  ST_ID INT NOT NULL,
  Reservation_Date DATE NOT NULL,
  PRIMARY KEY (Book_ID, ST_ID),
  FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
  FOREIGN KEY (ST_ID) REFERENCES Students(ST_ID)
);

CREATE TABLE Borrowing_Students (
  BS_ID INT NOT NULL PRIMARY KEY,
  Member_ID INT NOT NULL,
  Book_ID INT NOT NULL,
  Borrowing_date DATE NOT NULL,
  Due_date DATE NOT NULL,
  Return_date DATE,
  FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
  FOREIGN KEY (Member_ID) REFERENCES Students(ST_ID),
  UNIQUE (Book_ID, Member_ID)
);

CREATE TABLE Categories (
  Categ_ID INT NOT NULL PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Description TEXT NOT NULL,
  Book_ID INT NOT NULL,
  FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);


CREATE TABLE Books (
  Book_ID INT NOT NULL PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Author VARCHAR(255) NOT NULL,
  Publication_Year INT NOT NULL
);


CREATE TABLE Students (
  ST_ID INT  PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Contact_Information VARCHAR(100) NOT NULL,
  Role VARCHAR(50) NOT NULL, -- يمكن أن يكون 'Student' أو 'Teacher' أو 'Visitor'
  Registration_Date DATE NOT NULL,
  Email varchar(100)
);


CREATE TABLE library_staff (
  Staff_ID INT NOT NULL PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Position VARCHAR(100) NOT NULL,
  Contact_Information VARCHAR(100) NOT NULL
);

INSERT INTO Books (Book_ID, Title, Author, Publication_Year) VALUES
(1, 'Introduction to SQL', 'John Doe', 2020),
(2, 'Advanced Database Systems', 'Jane Smith', 2019),
(3, 'Data Science for Beginners', 'Alice Johnson', 2021),
(4, 'Artificial Intelligence Basics', 'Bob Brown', 2018),
(5, 'Machine Learning Essentials', 'Charlie Green', 2022); 

select * from Books

INSERT INTO Students (ST_ID, Name, Contact_Information, Role, Registration_Date,Email) VALUES
(101, 'Hazem Fraihat', 'hazem@example.com', 'Student', '2023-09-10'),
(102, 'Maya Ali', 'maya@example.com', 'Student', '2023-06-15'),
(103, 'Omar Khaled', 'omar@example.com', 'Student', '2022-11-20'),
(104, 'Sara Mahmoud', 'sara@example.com', 'Teacher', '2021-03-05'),
(105, 'Ali Hassan', 'ali@example.com', 'Visitor', '2024-01-01');

select * from Students

INSERT INTO library_staff (Staff_ID, Name, Position, Contact_Information) VALUES
(1, 'Ahmed Salem', 'Librarian', 'ahmed@example.com'),
(2, 'Nour Hani', 'Assistant Librarian', 'nour@example.com'),
(3, 'Mohammed Fadel', 'Library Manager', 'mohammed@example.com');

select * from library_staff

INSERT INTO Categories (Categ_ID, Name, Description, Book_ID) VALUES
(1, 'Databases', 'Books about database management systems', 1),
(2, 'Computer Science', 'General CS books', 2),
(3, 'Artificial Intelligence', 'Books related to AI and ML', 4),
(4, 'Data Science', 'Introductory books on data science', 3),
(5, 'Machine Learning', 'Books covering ML techniques', 5);

select * from Categories

INSERT INTO Borrowing_Students (BS_ID, Member_ID, Book_ID, Borrowing_date, Due_date, Return_date) VALUES
(201, 101, 1, '2024-01-10', '2024-01-20', '2024-01-19'),
(202, 102, 2, '2024-01-05', '2024-01-15', NULL),
(203, 103, 3, '2024-01-12', '2024-01-22', '2024-01-21'),
(204, 104, 4, '2024-01-08', '2024-01-18', NULL),
(205, 105, 5, '2024-01-03', '2024-01-13', '2024-01-12');

select * from Borrowing_Students

INSERT INTO reservation (Book_ID, ST_ID, Reservation_Date) VALUES
(1, 101, '2024-02-01'),
(2, 102, '2024-02-02'),
(3, 103, '2024-02-03'),
(4, 104, '2024-02-04'),
(5, 105, '2024-02-05');

select * from reservation






-- Q1 )

SELECT * FROM Students WHERE Registration_Date = '2023-06-15';


-- Q2 ) 

SELECT * FROM Books WHERE Title = 'Database Fundamentals';

-- Q3 )

ALTER TABLE Students
ADD Email VARCHAR(255);

-- Q4 ) 
INSERT INTO Students (ST_ID,Name, Contact_Information, Role, Registration_Date, Email)  
VALUES (107,'Omar', '9876543210', 'Student', '2024-06-05', 'Omar@gmail.com'); 

-- Q5 ) 

SELECT DISTINCT S.*
FROM Students S
JOIN reservation R ON S.ST_ID = R.ST_ID;

-- Q6 ) 

SELECT DISTINCT(Name)
FROM Students S
JOIN Borrowing_Students BS ON S.ST_ID = BS.Member_ID
JOIN Books B ON BS.Book_ID = B.Book_ID
WHERE B.Title = 'Introduction to SQL';

SELECT * FROM Books
-- Q7 )

SELECT DISTINCT *
FROM Students S
JOIN Borrowing_Students BS ON S.ST_ID = BS.Member_ID
JOIN Books B ON BS.Book_ID = B.Book_ID
WHERE B.Title = 'Data Science for Beginners'
AND BS.Return_date IS NOT NULL;

SELECT * FROM Borrowing_Students

-- Q8 ) 

SELECT S.*
FROM Students S
JOIN Borrowing_Students BS ON S.ST_ID = BS.Member_ID
WHERE BS.Return_date > BS.Due_date;

SELECT * FROM Students

-- Q9)

SELECT B.Book_ID, B.Title, COUNT(BS.Book_ID) AS Borrow_Count
FROM Books B
JOIN Borrowing_Students BS ON B.Book_ID = BS.Book_ID
GROUP BY B.Book_ID, B.Title
HAVING COUNT(BS.Book_ID) > 3;

-- Q10)

SELECT S.*
FROM Students S
JOIN Borrowing_Students BS ON S.ST_ID = BS.Member_ID
WHERE BS.Borrowing_date BETWEEN '2021-03-05' AND '2024-01-10';

-- Q11) 

SELECT COUNT(*) AS Total_Books
FROM Books;









