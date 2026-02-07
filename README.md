# LibraryAdminManagementSystem
Servlet 


-- Create database and use it
CREATE DATABASE LibrarySystem;
USE LibrarySystem;


CREATE TABLE admin (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50),
  password VARCHAR(100)
);

INSERT INTO admin (username, password)
VALUES ('admin', 'admin123');


CREATE TABLE books (
  bookid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100),
  author VARCHAR(100),
  quantity INT
);


INSERT INTO books (title, author, quantity) VALUES
('Introduction to Java', 'Herbert Schildt', 5),
('Python Crash Course', 'Eric Matthes', 7),
('Clean Code', 'Robert C. Martin', 3),
('Data Structures & Algorithms', 'Narasimha Karumanchi', 4),
('Artificial Intelligence', 'Stuart Russell', 6);

select * from books;


CREATE TABLE student (
  rollno VARCHAR(10) PRIMARY KEY,
  name VARCHAR(50),
  class VARCHAR(10)
);



INSERT INTO student (rollno, name, class) VALUES
('DT.24.1', 'Anita Sharma', 'SYIT'),
('DT.24.2', 'Vikram Singh', 'SYIT'),
('DT.24.3', 'Priya Verma', 'SYIT'),
('DT.24.4', 'Rahul Gupta', 'SYIT'),
('DT.24.5', 'Sneha Jain', 'SYIT'),
('DT.24.6', 'Amit Kumar', 'SYIT');

INSERT INTO student (rollno, name, class) VALUES
('DT.24.99', 'Temporary Student', 'SYIT');


select * from student;



CREATE TABLE issuedbooks (
  issueid INT PRIMARY KEY AUTO_INCREMENT,
  bookid INT,
  rollno VARCHAR(10),
  issuedate DATE,
  returndate DATE,
  status VARCHAR(20),
  FOREIGN KEY (bookid) REFERENCES books(bookid),
  FOREIGN KEY (rollno) REFERENCES student(rollno)
);
