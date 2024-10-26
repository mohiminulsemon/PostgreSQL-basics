CREATE DATABASE university_db;

-- students table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    age INT,
    email VARCHAR(255) UNIQUE NOT NULL,
    frontend_mark INT,
    backend_mark INT,
    status VARCHAR(50)
);

-- courses table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INT
);

-- enrollment table
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students (student_id) ON DELETE CASCADE,
    course_id INT REFERENCES courses (course_id) ON DELETE CASCADE
);

-- Insert the following sample data into the "students" table:
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status) 
VALUES 
('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
('Nabil', 22, 'nabil@example.com', 37, 46, NULL),
('Rafi', 24, 'rafi@example.com', 41, 40, NULL),
('Sophia', 22, 'sophia@example.com', 50, 52, NULL),
('Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);

-- Insert the following sample data into the "courses" table:
INSERT INTO courses (course_name, credits) 
VALUES 
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3);

-- Insert the following sample data into the "enrollment" table:
INSERT INTO enrollment (student_id, course_id) 
VALUES 
(1, 1),
(1, 2),
(2, 1),
(3, 2);


-- Query 1:
-- Insert a new student record
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status) 
VALUES 
('Semon', 26, 'mohiminulsemon@gmail.com', 28, 30, NULL);

-- Query 2:
-- Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
SELECT s.student_name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Next.js';

-- Query 3:
-- Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
UPDATE students
SET status = 'Awarded'
WHERE student_id = (
        SELECT student_id
        FROM students
        ORDER BY (frontend_mark + backend_mark) DESC
        LIMIT 1
    );

-- Query 4:
-- Delete all courses that have no students enrolled.
DELETE FROM courses
WHERE course_id NOT IN (
        SELECT DISTINCT course_id
        FROM enrollment
    );

-- Query 5:
-- Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name
FROM students
ORDER BY student_id
LIMIT 2
OFFSET 2;

-- Query 6:
-- Retrieve the course names and the number of students enrolled in each course
SELECT c.course_name, COUNT(e.student_id) AS students_enrolled
FROM courses c
JOIN enrollment e 
ON c.course_id = e.course_id
GROUP BY c.course_name;

-- Query 7:
-- Calculate and display the average age of all students.
SELECT ROUND(AVG(age), 2) AS average_age FROM students;

-- Query 8:
-- Retrieve the names of students whose email addresses contain 'example.com'.
SELECT student_name FROM students WHERE email LIKE '%example.com%';