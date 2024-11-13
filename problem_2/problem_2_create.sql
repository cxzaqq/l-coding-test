CREATE TABLE School (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Parent (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone_num VARCHAR(20) NOT NULL
);

CREATE TABLE Hobby (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hobby VARCHAR(255) NOT NULL
);

CREATE TABLE Subject (
    id INT AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(255) NOT NULL
);

CREATE TABLE Student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone_num VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    birth DATE NOT NULL,
    parent_id INT,
    school_id INT,
    FOREIGN KEY (parent_id) REFERENCES Parent(id),
    FOREIGN KEY (school_id) REFERENCES School(id)
);


CREATE TABLE Teacher (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    school_id INT,
    subject_id INT,
    FOREIGN KEY (school_id) REFERENCES School(id),
    FOREIGN KEY (subject_id) REFERENCES Subject(id)
);

CREATE TABLE Student_Hobby (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    hobby_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (hobby_id) REFERENCES Hobby(id)
);

CREATE TABLE Student_Teacher (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    teacher_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (teacher_id) REFERENCES Teacher(id)
);
