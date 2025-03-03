USE university;
INSERT INTO Students(StudentID, FirstName, LastName, DOB, Email, DepartmentID) VALUES
(301, 'DAVID', 'Brown', '1999-04-05', 'david.brown@university.com', 1),
(302, 'Emily', 'White', '2000-08-12', 'emily.white@university.com', 2),
(303, 'Frank', 'Wilson','1998-11-23', 'frank.wilson@university.com', 3);

select *from Students;

USE university;

INSERT INTO Departments(DepartmentID, DepartmentName, Location) VALUES
(1, 'Computer Sciene', 'Building A'),
(2, 'CMathematics', 'Building B'),
(3, 'Physics', 'Building C');

select *from Departments;

USE university;
INSERT INTO Courses(CourseID, CourseName, DepartmentID, Credits) VALUES
(101, 'Introduction to Programming', 1, 3),
(102, 'Algebra', 2, 4),
(103, 'Quantum Mechanics', 3, 4);

select *from Courses;

USE university;
INSERT INTO Professors(ProfessorID, FirstName, LastName, Email, DepartmentID) VALUES
(201, 'Alice', 'Johnson', 'alice.johnson@university.com', 1),
(202, 'Bob', 'Smith', 'bob.smithn@university.com', 2),
(203, 'Carol', 'Taylor', 'carol.taylor@university.com', 3);

select *from Professors;

/* 11/02/25 */

SELECT FirstName, LastName, Email FROM Students WHERE DepartmentID = 1 ;  /* two ways*/

SELECT *FROM Students WHERE DepartmentID = 1;


USE university;
UPDATE Students 
SET Email = 'new.email@david.com' WHERE StudentID = 301;

SELECT *FROM Students;

USE university;
update Students
SET  FirstName = 'William' WHERE LastName = 'Brown';
SELECT *FROM Students;

UPDATE Departments
Set DepartmentName = 'Maths' WHERE DepartmentName = 'CMathematics';
Select *from Departments;


DELETE from Departments WHERE DepartmentName = 'Physics';
Select *from Departments;

/* 17/02/25*/

SELECT *FROM Courses
WHERE Credits>3 AND CourseName='Algebra';


SELECT *FROM Departments
WHERE Location = 'Building A' or Location ='Building C';

UPDATE Departments
SET Location='Building D'
WHERE NOT Location ='Building A';
SELECT *FROM Departments;

SELECT FirstName, LastName
FROM Professors
WHERE DepartmentID IN (SELECT DepartmentID
                        FROM Departments
                        WHERE DepartmentID
                        =2);
                        
SELECT DepartmentName
FROM Departments
WHERE DepartmentID IN (SELECT DepartmentID
                        FROM Students
                        WHERE DepartmentID
                        =1);




