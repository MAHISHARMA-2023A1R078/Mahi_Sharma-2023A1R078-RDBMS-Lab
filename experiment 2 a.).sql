create database university;

USE university;

CREATE TABLE Students
(
StudentID INT,
FirstName VARCHAR(100),
LastName varchar(100),
DOB INT,
Email VARCHAR(100),  
DepartmentID INT
);

ALTER TABLE Students
MODIFY DOB DATE;

ALTER TABLE Students
ADD PRIMARY KEY (StudentID);


USE university;

CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Location VARCHAR(100)
    );
    
    
    USE university;
CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(100),
DepartmentID INT,
Credits INT
);


USE university;
CREATE TABLE Professors (
ProfessorID INT PRIMARY KEY,
FirstName VARCHAR(100),
LastName VARCHAR(100),
Email VARCHAR(100),
DepartmentID INT
);
show databases;