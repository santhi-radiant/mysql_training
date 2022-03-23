
/*

CREATE DATABASE demo;
USE demo;

CREATE TABLE students(
    student_id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(60),
    stu_fname VARCHAR(60),
    stu_lname VARCHAR(60),
    login_count INT,
    course_count INT,
    signup_month INT,
    PRIMARY KEY (student_id)
);

INSERT INTO students(
    email, 
    stu_fname, 
    stu_lname, 
    login_count, 
    course_count,
    signup_month
    )
VALUES
('yogeshk@gmail.com', 'Yogesh', 'kumar', 23, 5, 7),
('anshus@yahoo.com', 'Anshu', 'Sharma', 8, 2, 3),
('suryare@gmail.com', 'Surya', 'Reddy', 28, 5, 8),
('ravis@gmail.com', 'Ravi', 'Sharma', 15, 7, 4);

*/

/*
--select concat(stu_fname,stu_lname) as fullname from students;
--select REPLACE(stu_fname,'a','@') as fun from students;

--select SUBSTRING(email,1,7)from students;

*/