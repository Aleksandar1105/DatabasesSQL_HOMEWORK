--Find all Students with FirstName = Antonio
SELECT *
FROM Student
WHERE FirstName = 'Antonio'
GO

--Find all Students with DateOfBirth greater than '01.01.1999'
SELECT *
FROM Student
WHERE DateOfBirth > '01.01.1999'
GO

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT *
FROM Student
WHERE LastName LIKE 'J%' AND EnrolledDate > '1998-01-01' AND EnrolledDate < '1998-01-31'
GO

--List all Students ordered by FirstName
SELECT *
FROM Student
ORDER BY FirstName
GO

--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
SELECT LastName FROM Teacher
UNION
SELECT LastName FROM Student
GO

--Create Foreign key constraints from diagram or with script
--Created with diagram !


--List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT c.[Name] AS CourseName, a.[Name] AS AchievementTypeName
FROM Course c
CROSS JOIN AchievementType a
GO

--List all Teachers without exam Grade
SELECT t.*
FROM Teacher AS t
LEFT JOIN Grade AS g ON t.Id = g.TeacherID
WHERE g.TeacherID IS NULL