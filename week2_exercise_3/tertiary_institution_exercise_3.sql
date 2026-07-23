USE tertiary;

DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
	student_id INT PRIMARY KEY,
	name VARCHAR(100),
	major VARCHAR(100),
	year_of_study INT
);

INSERT INTO Students (student_id, name, major, year_of_study) VALUES
(1, 'Alice Johnson', 'Computer Science', 2),
(2, 'Bob Smith', 'Mechanical Engineering', 3),
(3, 'Charlie Brown', 'Business Administration', 1);

CREATE TABLE Courses (
	course_id INT PRIMARY KEY,
	course_name VARCHAR(100),
	department VARCHAR(100),
	credits INT
);

INSERT INTO Courses (course_id, course_name, department, credits) VALUES
(101, 'Introduction to Programming', 'Computer Science', 3),
(102, 'Thermodynamics', 'Mechanical Engineering', 4),
(103, 'Marketing 101', 'Business Administration', 3);

CREATE TABLE Enrollments (
	enrollment_id INT PRIMARY KEY,
	student_id INT,
	course_id INT,
	enrollment_date DATE,
	FOREIGN KEY (student_id) REFERENCES Students(student_id),
	FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 101, '2023-09-01'),
(2, 2, 102, '2023-09-01'),
(3, 3, 103, '2023-09-01'),
(4, 1, 103, '2023-09-02');

SELECT 
    Students.name AS student_name,
    Courses.course_name,
    Enrollments.enrollment_date
FROM Students
INNER JOIN Enrollments
ON Students.student_id = Enrollments.student_id
LEFT JOIN Courses
ON Enrollments.course_id = Courses.course_id
ORDER BY Enrollments.enrollment_date DESC;
