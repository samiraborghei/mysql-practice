CREATE DATABASE school;
USE school;
CREATE TABLE students (
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
age int
);
INSERT INTO students (first_name, last_name, age)
VALUES
('Samira', 'Borghei', 40),
('Jina', 'Sedghi', 12),
('Sam', 'Brown', 19);
SELECT 
    *FROM
    students;
    USE school;
    CREATE DATABASE IF NOT EXISTS school;
    USE school;
    CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT
);

