USE [SEDCHome]

--● Declare scalar variable for storing FirstName values
--• Assign value ‘Antonio’ to the FirstName variable
--• Find all Students having FirstName same as the variable
DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Antonio'

SELECT * 
FROM Student
WHERE FirstName = @FirstName
GO

--● Declare table variable that will contain StudentId, StudentName and DateOfBirth
--• Fill the table variable with all Female students
DECLARE @FemaleStudentsNamesIdDateOfBirth TABLE
(StudentId int NOT NULL, StudentName NVARCHAR(100) NOT NULL, DateOfBirth DATE NULL);

INSERT INTO @FemaleStudentsNamesIdDateOfBirth (StudentId, StudentName, DateOfBirth)
SELECT Id, CONCAT(FirstName, ' ', LastName) AS StudentName, DateOfBirth
FROM Student
WHERE Gender = 'F'

SELECT *
FROM @FemaleStudentsNamesIdDateOfBirth
GO

--● Declare temp table that will contain LastName and EnrolledDate columns
--• Fill the temp table with all Male students having First Name starting with ‘A’
--• Retrieve the students from the table which last name is with 7 characters
CREATE TABLE #MaleStudentsStartingWithA
(LastName NVARCHAR(100) NOT NULL, EnrolledDate DATE NOT NULL);

INSERT INTO #MaleStudentsStartingWithA (LastName, EnrolledDate)
SELECT LastName, EnrolledDate
FROM Student
WHERE FirstName LIKE 'A%' AND Gender = 'M'

SELECT *
FROM #MaleStudentsStartingWithA
WHERE LEN(LastName) = 7
GO

--DROP TABLE #MaleStudentsStartingWithA

--● Find all teachers whose FirstName length is less than 5 and
--• the first 3 characters of their FirstName and LastName are the same
SELECT *
FROM Teacher
WHERE LEN(FirstName) < 5 
AND LEFT(FirstName, 3) = LEFT(LastName, 3)
GO