Create table Student(StudentID int PRIMARY KEY, Name varchar(30), Age int);

Insert into Student values(1,'Ayisha', 19);
Insert into Student values(2,'Dharshini', 20);
Insert into Student values(3,'Divii', 21);
Insert into Student values(1,'Ezhil', 18);

Create table Courses (CourseID int PRIMARY KEY, CourseName varchar(20));

Insert into Courses values (101, 'Database Management');
Insert into Courses values (102, 'Ethical Hacker');
Insert into Courses values (103, 'Data Science');

Create table Enrollments (StudentID int REFERENCES Student(StudentID), CourseID int REFERENCES Courses(CourseID));

Insert into Enrollments values(1,101);
Insert into Enrollments values(2,103);
Insert into Enrollments values(3,102);
Insert into Enrollments values(4,101);

SELECT * FROM Student;

SELECT Name, Age FROM Student WHERE Age > 20;

SELECT Name FROM Student WHERE StudentID IN (SELECT StudentID FROM Enrollments WHERE CourseID = (SELECT CourseID FROM Courses WHERE CourseName = 'Database Management'));

SELECT CourseID, CourseName FROM Courses WHERE CourseID IN ( SELECT CourseID FROM Enrollments GROUP BY CourseID HAVING COUNT(*) > 1 );

SELECT AVG(Age) AS AverageAge FROM Student;

SELECT Name, Age FROM Student WHERE Age > (SELECT AVG(Age) FROM Student);