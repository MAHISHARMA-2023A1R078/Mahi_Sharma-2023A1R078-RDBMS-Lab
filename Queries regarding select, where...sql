CREATE DATABASE university2;
USE university2;

-- 1. Departments Table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(100) NOT NULL
);

-- 2. Instructors Table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    DeptID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID) ON DELETE SET NULL
);

-- 3. Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    DeptID INT,
    InstructorID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID) ON DELETE SET NULL,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID) ON DELETE SET NULL
);

-- 4. Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    DOB DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID) ON DELETE SET NULL
);

-- 5. Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollDate DATE DEFAULT (CURRENT_DATE),
    Grade CHAR(2) DEFAULT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);





-- Insert Departments
INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Electrical Engineering'),
(4, 'Civil Engineering'),
(5, 'Biotechnology'),
(6, 'Mathematics'),
(7, 'Physics'),
(8, 'Chemistry'),
(9, 'Business Administration'),
(10, 'Psychology');


-- Insert Instructors
INSERT INTO Instructors (InstructorID, Name, DeptID, Salary) VALUES
(1, 'Dr. Alice Johnson', 1, 85000.0),
(2, 'Dr. Robert Smith', 1, 90000.0),
(3, 'Dr. Emily Davis', 2, 80000.0),
(4, 'Dr. John Miller', 2, 75000.0),
(5, 'Dr. Sophia Wilson', 3, 87000.0),
(6, 'Dr. James Brown', 3, 88000.0),
(7, 'Dr. Olivia Martinez', 4, 78000.0),
(8, 'Dr. Michael Anderson', 4, 77000.0),
(9, 'Dr. William Garcia', 5, 79000.0),
(10, 'Dr. Charlotte Lee', 5, 76000.0),
(11, 'Dr. Daniel Harris', 6, 83000.0),
(12, 'Dr. Grace Clark', 6, 82000.0),
(13, 'Dr. Benjamin Lewis', 7, 81000.0),
(14, 'Dr. Chloe Walker', 7, 80000.0),
(15, 'Dr. Henry Hall', 8, 78000.0),
(16, 'Dr. Amelia Young', 8, 77000.0),
(17, 'Dr. Nathan Scott', 9, 92000.0),
(18, 'Dr. Victoria Adams', 9, 91000.0),
(19, 'Dr. Lucas Baker', 10, 86000.0),
(20, 'Dr. Isabella Perez', 10, 85000.0);


-- Insert Courses
INSERT INTO Courses (CourseID, CourseName, Credits, DeptID, InstructorID) VALUES
(1, 'Data Structures', 4, 1, 1),
(2, 'Thermodynamics', 3, 2, 3),
(3, 'Circuit Analysis', 3, 3, 5),
(4, 'Structural Engineering', 4, 4, 7),
(5, 'Genetic Engineering', 3, 5, 9),
(6, 'Calculus III', 4, 6, 11),
(7, 'Quantum Mechanics', 3, 7, 13),
(8, 'Organic Chemistry', 4, 8, 15),
(9, 'Business Analytics', 3, 9, 17),
(10, 'Cognitive Psychology', 3, 10, 19);


-- Insert Students
INSERT INTO Students (StudentID, Name, DOB, Gender, DeptID) VALUES
(1, 'Liam Johnson', '2002-05-14', 'Other', 7),
(2, 'Olivia Brown', '2000-04-23', 'Other', 3),
(3, 'Noah Williams', '2003-03-24', 'Female', 5),
(4, 'Emma Jones', '2004-06-18', 'Other', 5),
(5, 'Oliver Miller', '2002-12-30', 'Female', 2),
(6, 'Ava Davis', '2005-12-10', 'Male', 4),
(7, 'Elijah Wilson', '2001-03-19', 'Male', 8),
(8, 'Sophia Martinez', '2003-03-02', 'Male', 8),
(9, 'James Anderson', '2002-08-27', 'Other', 6),
(10, 'Isabella Taylor', '2000-06-13', 'Female', 3),
(11, 'Benjamin Thomas', '2000-01-06', 'Male', 3),
(12, 'Mia Hernandez', '2001-12-08', 'Male', 4),
(13, 'Lucas Moore', '2004-07-15', 'Other', 4),
(14, 'Charlotte Martin', '2003-06-19', 'Female', 1),
(15, 'Henry White', '2002-05-26', 'Male', 10),
(16, 'Amelia Lopez', '2002-03-24', 'Female', 10),
(17, 'Alexander Clark', '2003-05-04', 'Female', 6),
(18, 'Harper Lewis', '2004-01-15', 'Male', 1),
(19, 'Michael Walker', '2000-01-03', 'Male', 2),
(20, 'Evelyn Hall', '2002-08-31', 'Female', 6),
(21, 'Daniel Allen', '2003-12-12', 'Male', 6),
(22, 'Abigail Young', '2002-09-21', 'Male', 9),
(23, 'Matthew King', '2005-07-12', 'Male', 8),
(24, 'Ella Wright', '2000-09-01', 'Other', 1),
(25, 'Ethan Scott', '2000-08-28', 'Other', 10),
(26, 'Scarlett Green', '2001-03-09', 'Male', 2),
(27, 'Joseph Adams', '2000-12-01', 'Female', 7),
(28, 'Grace Baker', '2003-04-01', 'Male', 9),
(29, 'Samuel Nelson', '2002-01-05', 'Female', 9),
(30, 'Victoria Carter', '2003-10-16', 'Other', 3),
(31, 'David Mitchell', '2003-05-04', 'Other', 6),
(32, 'Lily Perez', '2004-12-31', 'Male', 9),
(33, 'John Roberts', '2000-06-07', 'Male', 1),
(34, 'Chloe Turner', '2002-12-28', 'Female', 9),
(35, 'Wyatt Phillips', '2001-06-17', 'Female', 8),
(36, 'Nora Campbell', '2001-01-13', 'Male', 7),
(37, 'Jack Parker', '2001-11-04', 'Female', 6),
(38, 'Hannah Evans', '2000-11-17', 'Male', 5),
(39, 'Luke Edwards', '2002-03-06', 'Female', 9),
(40, 'Zoe Collins', '2005-08-22', 'Male', 5),
(41, 'Sebastian Stewart', '2002-11-22', 'Other', 2),
(42, 'Penelope Morris', '2000-12-18', 'Male', 9),
(43, 'Owen Rogers', '2003-05-19', 'Female', 9),
(44, 'Lillian Reed', '2000-11-26', 'Other', 7),
(45, 'Gabriel Cook', '2005-04-02', 'Female', 1),
(46, 'Aurora Morgan', '2002-11-25', 'Other', 5),
(47, 'Julian Bell', '2005-02-15', 'Other', 3),
(48, 'Addison Murphy', '2003-06-27', 'Other', 7),
(49, 'Levi Bailey', '2004-02-13', 'Female', 9),
(50, 'Aria Rivera', '2002-07-23', 'Female', 4);


-- Insert Enrollments
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollDate, Grade) VALUES
(1, 17, 7, '2023-01-07', 'A'),
(2, 6, 7, '2023-03-11', 'A'),
(3, 29, 4, '2023-07-07', 'D'),
(4, 8, 5, '2023-11-18', 'A'),
(5, 2, 5, '2023-05-23', NULL),
(6, 23, 10, '2023-07-04', 'D'),
(7, 6, 3, '2023-05-27', 'A'),
(8, 2, 9, '2023-08-20', 'B'),
(9, 33, 8, '2023-02-02', 'A'),
(10, 28, 1, '2023-01-06', 'F'),
(11, 37, 6, '2023-06-03', 'C'),
(12, 11, 3, '2023-05-14', 'B'),
(13, 3, 3, '2023-03-11', NULL),
(14, 41, 10, '2023-08-20', 'B'),
(15, 23, 9, '2023-07-30', 'C'),
(16, 49, 10, '2023-03-20', 'B'),
(17, 7, 3, '2023-01-09', 'F'),
(18, 10, 8, '2023-09-16', 'C'),
(19, 1, 4, '2023-01-01', 'C'),
(20, 30, 6, '2023-04-04', 'D'),
(21, 32, 5, '2023-02-17', 'D'),
(22, 48, 9, '2023-09-01', 'A'),
(23, 46, 2, '2023-12-23', NULL),
(24, 40, 1, '2023-03-31', NULL),
(25, 39, 1, '2023-02-15', 'A'),
(26, 48, 6, '2023-01-28', 'B'),
(27, 16, 8, '2023-12-28', 'D'),
(28, 16, 7, '2023-08-25', 'B'),
(29, 47, 10, '2023-03-28', 'B'),
(30, 6, 6, '2023-06-14', 'B'),
(31, 37, 4, '2023-12-08', 'A'),
(32, 2, 5, '2023-04-29', 'C'),
(33, 19, 10, '2023-07-19', 'B'),
(34, 21, 8, '2023-06-27', 'D'),
(35, 11, 1, '2023-02-16', 'B'),
(36, 31, 4, '2023-08-15', 'C'),
(37, 47, 7, '2023-07-04', 'B'),
(38, 15, 8, '2023-03-04', 'A'),
(39, 2, 5, '2023-10-24', 'B'),
(40, 24, 7, '2023-08-01', 'D'),
(41, 15, 1, '2023-04-08', 'C'),
(42, 42, 4, '2023-02-27', 'B'),
(43, 49, 6, '2023-01-02', 'A'),
(44, 49, 5, '2023-10-08', 'B'),
(45, 48, 3, '2023-08-13', 'C'),
(46, 46, 9, '2023-05-18', 'C'),
(47, 28, 7, '2023-03-21', 'C'),
(48, 19, 4, '2023-01-03', NULL),
(49, 7, 1, '2023-01-26', 'C'),
(50, 26, 9, '2023-01-16', 'A'),
(51, 17, 8, '2023-09-21', 'F'),
(52, 41, 1, '2023-12-09', 'D'),
(53, 12, 7, '2023-02-28', 'F'),
(54, 26, 10, '2023-04-29', 'D'),
(55, 47, 1, '2023-03-20', 'A'),
(56, 48, 4, '2023-03-10', 'B'),
(57, 25, 7, '2023-10-12', NULL),
(58, 31, 10, '2023-04-17', 'B'),
(59, 16, 9, '2023-01-07', NULL),
(60, 41, 9, '2023-05-09', 'A'),
(61, 31, 4, '2023-04-28', 'B'),
(62, 47, 8, '2023-04-18', 'F'),
(63, 32, 6, '2023-06-26', 'A'),
(64, 33, 3, '2023-10-29', 'F'),
(65, 25, 10, '2023-03-05', 'C'),
(66, 19, 10, '2023-07-26', 'D'),
(67, 17, 7, '2023-08-30', 'F'),
(68, 7, 6, '2023-06-15', 'B'),
(69, 18, 6, '2023-05-26', 'F'),
(70, 17, 7, '2023-03-22', 'A'),
(71, 33, 1, '2023-04-23', 'C'),
(72, 19, 2, '2023-10-28', 'D'),
(73, 39, 5, '2023-03-24', NULL),
(74, 24, 4, '2023-08-07', NULL),
(75, 46, 9, '2023-05-16', NULL),
(76, 45, 6, '2023-12-21', 'B'),
(77, 2, 3, '2023-05-11', 'B'),
(78, 1, 9, '2023-10-02', 'C'),
(79, 2, 1, '2023-08-12', 'F'),
(80, 2, 2, '2023-06-13', 'A'),
(81, 1, 8, '2023-08-28', 'B'),
(82, 2, 8, '2023-01-09', 'F'),
(83, 14, 1, '2023-03-09', 'A'),
(84, 6, 9, '2023-03-24', 'D'),
(85, 46, 8, '2023-07-09', 'D'),
(86, 11, 2, '2023-11-21', 'D'),
(87, 18, 3, '2023-12-05', 'A'),
(88, 24, 9, '2023-01-26', NULL),
(89, 18, 1, '2023-07-15', 'B'),
(90, 24, 1, '2023-03-12', NULL),
(91, 27, 4, '2023-03-26', 'A'),
(92, 42, 3, '2023-02-12', 'B'),
(93, 44, 1, '2023-09-27', 'C'),
(94, 3, 7, '2023-11-03', 'D'),
(95, 18, 3, '2023-11-01', 'F'),
(96, 49, 6, '2023-12-16', 'F'),
(97, 22, 8, '2023-11-21', NULL),
(98, 21, 5, '2023-06-14', NULL),
(99, 16, 10, '2023-09-17', 'A'),
(100, 18, 4, '2023-10-29', 'A');

use university2;
show tables;
select *from Instructors;
select *from departments;
select *from enrollments;

/* projection*/
select name,salary from instructors;
select salary, name from instructors;

/*desc to show datatype*/
desc instructors;

/*column name = expression name   automatically but not in table*/
select name,salary*12 from instructors;
desc instructors;
-- salary*12 i.e exp name automatically becomes the name of the column, so we named it as derived attribute comes from salary
-- i.e. beomes annual salary
select name,salary*12 "derived attribute i.e. from salary- Annual Salary" from instructors;
desc instructors;
 
/*column aliasing = temporary name for a column or a table is known as alias or aliasing */
select name,salary*12 asal from instructors;
desc instructors;

/* if in space (agar space deni h bichmein too) put in doble cotes or single cotes*/
select name,salary*12 "anual salary" from instructors;
desc instructors;

/* change built in coulmn names but table mein no change*/
use university2;
select name "instructor name",salary*12 asal from instructors;
show tables;
desc instructors;


select deptid from instructors; /*ar depoartment mein 2 employess ha*/
desc instructors;

/*hoow to supress duplicacy*/
select distinct deptid, name from instructors;  /* combination unique  2 bar alice nhi chalyega*/ 

select *  /*all cluauses in different line*/
from students 
where deptid=5;

select *  /*all cluauses in different line*/
from students 
where gender="female";
desc students;

select *  /*all cluauses in different line*/
from students 
where deptid<5;

select *  /*all cluauses in different line*/
from students 
where deptid=5 and gender ='female';  /*and to show both and // single , double cotes both are allowed*/

select *  /*all cluauses in different line*/
from students 
where deptid=5 or gender ='female';

select *  /*all cluauses in different line*/
from students 
where not(deptid=5 or gender ='female');


select *from instructors;

select name, salary from instructors
where salary<=80000;    /*pehlle less than chlega phir name salary pr lgega*/

select name,salary from instructors
where not(salary>=80000 and salary<=85000);

select name,salary from instructors
where salary>=80000 and salary<=85000;

/*between keyword*/
select name,salary from instructors
where salary between 80000 and 85000;   /*pehle choti value phir badi leni ha choti between badi*/

select name,salary*12 as asal 
from instructors
where  salary*12<1200000;  /*pehle where chlega too coulmn asal nhi chala ha, order by mein use asal but not in where*/


select *
from instructors 
where deptid=1 or deptid=2 or deptid=3 or deptid=4;  /*range mein 10. bhi ayega 
yha in ayega*/

select *
from instructors 
where deptid  in(1,2,3,4,5) and (salary between 80000 and 85000);

select *
from instructors 
where deptid  not in(1,2,3,4,5) and (salary between 80000 and 85000); /*ye nhi chahiye too*/


select *from students;


select * from students 
where name='oliver Miller';


/*underscore ek char ko hide 
aur  % can hide more than one char  =like keyword*/

select name from students
where name like 'O%'; /*first name O ho jiska*/

select name from students
where name like '%n'; /*last name n ho jiska*/

select name from students
where name like 'o%n';  /*first name is o , bich wla hide and last name n hona chhiye*/

 /*2nd last char =a*too %a phir 1 undersocre _ / */
select name from students
where name like '%a_';

/*3rd last char =a too %a phir 2 undersocre _ _*/
select * from students
where name like '%a__';

/*biichmein underscore ho*/
select name from students
where name like '%_%';   /*here underscore meaning is space kisi name ke mein bichmein space hogi too dikhegi*/

/*but if to see underscore only*/
select * from students
where name like '%\_%';  /*agr _ sign pura dekhna ha too pehle '\' backward slash lagate h*/

select * from students
where name like '%\%%'; /*agr % sign pura dekhna ha too pehle '\' backward slash lagate h */

-- to display name having a in middle:
select name from students
where name like "%\%%";




