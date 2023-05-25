USE [SEDCHome]

--● Calculate the count of all grades per Teacher in the system
SELECT t.FirstName, t.LastName, COUNT(g.Grade) AS TotalGrades
FROM Teacher AS t
INNER JOIN Grade AS g ON g.TeacherID = t.Id
GROUP BY t.FirstName, t.LastName
ORDER BY TotalGrades DESC
GO

--● Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT t.FirstName, t.LastName, COUNT(g.Grade) AS TotalGrades
FROM Teacher AS t
INNER JOIN Grade AS g ON g.TeacherID = t.Id
WHERE g.StudentID < 100
GROUP BY t.FirstName, t.LastName
ORDER BY TotalGrades DESC
GO

--● Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT s.FirstName, s.LastName, MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGrade
FROM Student AS s
INNER JOIN Grade AS g ON g.StudentID = s.Id
GROUP BY s.FirstName, s.LastName
ORDER BY MaxGrade DESC
GO

--● Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.FirstName, t.LastName, COUNT(g.Grade) AS TotalGrades
FROM Teacher AS t
INNER JOIN Grade AS g ON g.TeacherID = t.Id
GROUP BY t.FirstName, t.LastName
HAVING COUNT(g.Grade) > 200
ORDER BY TotalGrades DESC
GO

--● Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
SELECT s.FirstName, s.LastName, COUNT(g.Grade) AS GradeCount, MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGrade
FROM Student AS s
INNER JOIN Grade AS g ON g.StudentID = s.Id
GROUP BY s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
ORDER BY GradeCount DESC
GO

--● List Student First Name and Last Name next to the other details from previous query
SELECT s.FirstName, s.LastName, COUNT(g.Grade) AS GradeCount, MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGrade
FROM Student AS s
INNER JOIN Grade AS g ON g.StudentID = s.Id
GROUP BY s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
ORDER BY s.FirstName, s.LastName
GO

--● Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vv_StudentGrades
AS
SELECT s.Id, COUNT(g.Grade) AS GradeCount
FROM Student AS s
INNER JOIN Grade AS g ON g.StudentID = s.Id
GROUP BY s.Id
GO

SELECT * FROM vv_StudentGrades
ORDER BY GradeCount
GO

--● Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vv_StudentGrades
AS
SELECT s.FirstName, s.LastName, COUNT(g.Grade) AS GradeCount
FROM Student AS s
INNER JOIN Grade AS g ON g.StudentID = s.Id
GROUP BY s.FirstName, s.LastName
GO

SELECT * FROM vv_StudentGrades
ORDER BY GradeCount
GO

--● List all rows from view ordered by biggest Grade Count
SELECT * FROM vv_StudentGrades
ORDER BY GradeCount DESC
GO