USE university_db;

CREATE TABLE `lecturers` (
	lecturer_id INT NOT NULL,
    name VARCHAR(45) NOT NULL,
    department VARCHAR(200) NOT NULL,
    email VARCHAR(45) NOT NULL,
    PRIMARY KEY (lecturer_id)
);

INSERT INTO `lecturers` (`lecturer_id`, `name`, `department`, `email`) VALUES ('1', 'Dr. Alice Smith', 'Mathematics', 'alice.smith@university.com');
INSERT INTO `lecturers` (`lecturer_id`, `name`, `department`, `email`) VALUES ('2', 'Prof. Bob Johnson', 'Physics', 'bob.johnson@university.com');
INSERT INTO `lecturers` (`lecturer_id`, `name`, `department`, `email`) VALUES ('3', 'Dr. Charlie Brown', 'Computer Science', 'charlie.brown@university.com');

ALTER TABLE `lecturers` 
ADD COLUMN `office_location` VARCHAR(50) NOT NULL AFTER `email`;

UPDATE `lecturers` SET `office_location` = 'Room 101' WHERE (`lecturer_id` = '1');
UPDATE `lecturers` SET `office_location` = 'Room 202' WHERE (`lecturer_id` = '2');
UPDATE `lecturers` SET `office_location` = 'Room 303' WHERE (`lecturer_id` = '3');

ALTER TABLE `lecturers` 
CHANGE COLUMN `department` `department` VARCHAR(200) NOT NULL DEFAULT 'General' ;

INSERT INTO `lecturers` (`lecturer_id`, `name`, `email`, `office_location`) 
VALUES ('4', 'Dr. Emily Green', 'emily.green@university.com', 'Room 404');

INSERT INTO `lecturers` (`lecturer_id`, `name`, `email`, `office_location`) 
VALUES ('5', 'Dr. Patrick Star', 'patrick.star@engineering.com', 'Room 505');

UPDATE `lecturers` SET `name` = 'Prof. Patrick Star' WHERE (`lecturer_id` = '5');

UPDATE lecturers
SET department = 'Engineering'
WHERE email LIKE '%@engineering.com';

UPDATE lecturers
SET department = 'Science'
WHERE name LIKE 'Dr.%';

DELETE FROM `lecturers` WHERE (`lecturer_id` = '2');

ALTER TABLE `lecturers` 
ADD COLUMN `phone_number` VARCHAR(15) NOT NULL AFTER `office_location`;

UPDATE `lecturers` SET `phone_number` = '987-654-3210' WHERE (`lecturer_id` = '3');
UPDATE `lecturers` SET `phone_number` = '123-456-7890' WHERE (`lecturer_id` = '1');

SELECT * FROM lecturers;



