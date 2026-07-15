USE tertiary_institution;

DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Enrollments;


CREATE TABLE Students (
    student_id INT,
    name VARCHAR(100),
    major VARCHAR(300),
    year_of_study YEAR
);

INSERT INTO Students (student_id, name, major, year_of_study)
VALUES
(001, 'John Doe', 'Biology', 2026),
(002, 'Jane Doe', 'Fine Arts', 2026),
(003, 'Mary Jane', 'Geology', 2026);

SELECT * FROM Students;


CREATE TABLE Courses (
    course_id VARCHAR(15),
    course_name VARCHAR(300),
    department VARCHAR(300),
    credits INT
);

INSERT INTO Courses (course_id, course_name, department, credits)
VALUES
('CELBIO101', 'Cell Biology', 'Department of Biological Sciences', 18),
('ARTFDN101', 'Fine Art Foundation', 'Department of Fine Arts', 72),
('EARTHMT101', 'Earth Materials', 'Faculty of Science', 24); 

SELECT * FROM Courses;


CREATE TABLE Enrollments (
    enrollment_id VARCHAR(15),
    student_id INT,
    course_id VARCHAR(15),
    enrollment_date DATE
);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
('TIS100001', 001, 'CELBIO101', '2025-09-05'),
('TIS100002', 002, 'ARTFDN101', '2025-08-27'),
('TIS100003', 003, 'EARTHMT101', '2022-02-14');

SELECT * FROM Enrollments;