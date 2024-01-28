-- CREATE TABLE Teachers(
-- 	teacher_id SERIAL PRIMARY KEY,
-- 	teacher_name VARCHAR(50) NOT NULL CHECK(teacher_name <> ''),
-- 	teacher_surname VARCHAR(50) NOT NULL CHECK(teacher_surname <> ''),
-- 	salary DECIMAL(10, 2) NOT NULL CHECK(salary > 0)
-- )

-- INSERT INTO Teachers (teacher_name, teacher_surname, salary)
-- VALUES 
--     ('John', 'Doe', 50000.00),
--     ('Jane', 'Smith', 60000.50),
--     ('Bob', 'Johnson', 75000.75);

-- CREATE TABLE Subjects(
-- 	subject_id SERIAL PRIMARY KEY,
-- 	subject_name VARCHAR(100) NOT NULL UNIQUE CHECK(subject_name <> '')
-- )

-- INSERT INTO Subjects (subject_name)
-- VALUES 
--     ('Mathematics'),
--     ('English'),
--     ('Science');

-- CREATE TABLE Faculties(
-- 	faculty_id SERIAL PRIMARY KEY,
-- 	financing DECIMAL(10, 2) NOT NULL DEFAULT 0 CHECK(financing >= 0),
-- 	faculty_name VARCHAR(100) NOT NULL UNIQUE CHECK(faculty_name <> '')
-- )

-- INSERT INTO Faculties (financing, faculty_name)
-- VALUES 
--     (500000.00, 'Engineering'),
--     (300000.50, 'Arts'),
--     (100000.75, 'Science');

-- CREATE TABLE Curators(
-- 	curator_id SERIAL PRIMARY KEY,
-- 	curator_name VARCHAR(50) NOT NULL CHECK(curator_name <> ''),
-- 	curator_surname VARCHAR(50) NOT NULL CHECK(curator_surname <> '')
-- )

-- INSERT INTO Curators (curator_name, curator_surname)
-- VALUES 
--     ('Alice', 'Johnson'),
--     ('Bob', 'Smith'),
--     ('Charlie', 'Doe');

-- CREATE TABLE Departments(
-- 	department_id SERIAL PRIMARY KEY,
-- 	financing DECIMAL(10, 2) NOT NULL DEFAULT 0 CHECK(financing >= 0),
-- 	department_name VARCHAR(100) NOT NULL UNIQUE CHECK(department_name <> ''),
-- 	faculty_id INT,
-- 	FOREIGN KEY (faculty_id) REFERENCES Faculties(faculty_id)
-- )

-- INSERT INTO Departments (financing, department_name, faculty_id)
-- VALUES 
--     (200000.00, 'Computer Science', 1),  
--     (150000.50, 'Fine Arts', 2),
--     (100000.75, 'Physics', 3);

-- CREATE TABLE Groups_(
-- 	group_id SERIAL PRIMARY KEY,
-- 	group_name VARCHAR(10) NOT NULL UNIQUE CHECK(group_name <> ''),
-- 	group_year INT NOT NULL CHECK(group_year >= 1 AND group_year <= 5),
-- 	department_id INT,
-- 	FOREIGN KEY (department_id) REFERENCES Departments(department_id)
-- )

-- INSERT INTO Groups_ (group_name, group_year, department_id)
-- VALUES 
--     ('GroupA', 1, 1),  
--     ('GroupB', 2, 2),  
--     ('GroupC', 3, 3);
	
-- CREATE TABLE Lectures(
-- 	lecture_id SERIAL PRiMARY KEY,
-- 	lecture_name VARCHAR(100) NOT NULL CHECK(lecture_name <> ''),
-- 	subject_id INT,
-- 	teacher_id INT,
-- 	FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id),
-- 	FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
-- )

-- INSERT INTO Lectures (lecture_name, subject_id, teacher_id)
-- VALUES 
--     ('Introduction to Mathematics', 1, 1),  
--     ('Literature Appreciation', 2, 2),      
--     ('Chemistry Fundamentals', 3, 3);

-- CREATE TABLE GroupsCurators(
-- 	groups_curator_id SERIAL PRIMARY KEY,
-- 	curator_id INT,
-- 	group_id INT,
-- 	FOREIGN KEY (curator_id) REFERENCES Curators(curator_id),
-- 	FOREIGN KEY (group_id) REFERENCES Groups_(group_id)
-- )

-- INSERT INTO GroupsCurators (curator_id, group_id)
-- VALUES 
--     (1, 1),  
--     (2, 2),  
--     (3, 3);

-- CREATE TABLE GroupsLectures(
-- 	groups_lecture_id SERIAL PRIMARY KEY,
-- 	group_id INT,
-- 	lecture_id INT,
-- 	FOREIGN KEY (group_id) REFERENCES Groups_(group_id),
-- 	FOREIGN KEY (lecture_id) REFERENCES Lectures(lecture_id)
-- )

-- INSERT INTO GroupsLectures (group_id, lecture_id)
-- VALUES 
--     (1, 1),  
--     (2, 2),  
--     (3, 3);

-- SELECT Teachers.teacher_name || ' ' || Teachers.teacher_surname AS Professors, Groups_.group_name AS "Groups"
-- FROM Teachers
-- JOIN Lectures ON Teachers.teacher_id = Lectures.teacher_id
-- JOIN GroupsLectures ON GroupsLectures.lecture_id = Lectures.lecture_id
-- JOIN Groups_ ON Groups_.group_id = GroupsLectures.group_id

SELECT faculty_name AS "Faculties" FROM Faculties
JOIN Departments ON Faculties.faculty_id = Departments.faculty_id AND Departments.financing >= Faculties.financing