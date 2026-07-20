USE tertiary;

DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;


-- Create Tables and Insert Data

-- Students 
CREATE TABLE Students (
	student_id INT Primary KEY,
    name VARCHAR(100) NOT NULL,
    major VARCHAR(300) NOT NULL,
    year_of_study INT NOT NULL
); 

INSERT INTO Students (student_id, name, major, year_of_study)
VALUES
(001, 'John Doe', 'Biology', 1),
(002, 'Jane Doe', 'Fine Arts', 2),
(003, 'Mary Jane', 'Geology', 3),
(004, 'Kim Possible', 'Finance', 4);


-- Courses 
CREATE TABLE Courses (
    course_id VARCHAR(15) PRIMARY KEY,
    course_name VARCHAR(300) NOT NULL,
    department VARCHAR(300) NOT NULL,
    credits INT NOT NULL
);

INSERT INTO Courses (course_id, course_name, department, credits)
VALUES
('ARTFDN101', 'Fine Art Foundation', 'Department of Fine Arts', 72),
('CELBIO101', 'Cell Biology', 'Department of Biological Sciences', 18),
('EARTHMT101', 'Earth Materials', 'Faculty of Science', 24),
('MACHLEARN101', 'Introduction to Machine Learning', 'Department of Engineering and Computer Science', 46);


-- Enrollments
 CREATE TABLE Enrollments (
    enrollment_id VARCHAR(15) PRIMARY KEY,
    student_id INT,
    course_id VARCHAR(15),
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
('TIS100001', 001, 'CELBIO101', '2025-09-05'),
('TIS100002', 002, 'ARTFDN101', '2025-08-27'),
('TIS100003', 003, 'EARTHMT101', '2022-02-14');


-- Inner Join

-- Join Students and Enrollments to get list of students with their enrolled courses
SELECT
	Students.student_id,
    Students.name,
    Courses.course_name,
    Enrollments.enrollment_date
FROM Students
INNER JOIN Enrollments
ON Students.student_id = Enrollments.student_id
INNER JOIN Courses
ON Enrollments.course_id = Courses.course_id;


-- Left Join

-- Find all students and their courses, even if not enrolled for any courses
SELECT
	Students.student_id,
    Students.name,
    Courses.course_name,
    Enrollments.enrollment_date
FROM Students
LEFT JOIN Enrollments
ON Students.student_id = Enrollments.student_id
LEFT JOIN Courses
ON Enrollments.course_id = Courses.course_id;


-- Right Join

--  
SELECT
	Courses.course_id,
    Courses.course_name,
    Students.name,
    Enrollments.enrollment_date
FROM Enrollments
RIGHT JOIN Courses
ON Enrollments.course_id = Courses.course_id
LEFT JOIN Students
ON Enrollments.student_id = Students.student_id;


SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;