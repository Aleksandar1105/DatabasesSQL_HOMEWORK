USE [master]
GO

DROP DATABASE IF EXISTS [SEDCACADEMYDB]
GO

CREATE DATABASE [SEDCACADEMYDB]
GO

USE [SEDCACADEMYDB]
GO

DROP TABLE IF EXISTS [dbo].[Students]
DROP TABLE IF EXISTS [dbo].[Teachers]
DROP TABLE IF EXISTS [dbo].[Grades]
DROP TABLE IF EXISTS [dbo].[Courses]
DROP TABLE IF EXISTS [dbo].[AchievementTypes]
DROP TABLE IF EXISTS [dbo].[GradeDetails]
GO

CREATE TABLE Students (
Id int IDENTITY (1,1) NOT NULL,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
DateOfBirth date NULL,
EnrolledDate date NOT NULL,
Gender nchar(1) NOT NULL,
NationalIDNumber nvarchar(50) NULL,
StudentCardNumber bigint NOT NULL,
CONSTRAINT [PK_Students] PRIMARY KEY (Id)
)
GO

CREATE TABLE Teachers (
Id int IDENTITY (1,1) NOT NULL,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
DateOfBirth date NULL,
AcademicRank int NULL,
HireDate date NOT NULL,
CONSTRAINT [PK_Teachers] PRIMARY KEY (Id)
)
GO

CREATE TABLE Grades (
Id int IDENTITY (1,1) NOT NULL,
StudentID int NOT NULL,
CourseID int NOT NULL,
TeacherID int NOT NULL,
Grade int NOT NULL,
Comment nvarchar(100) NOT NULL,
CreatedDate date NOT NULL,
CONSTRAINT [PK_Grades] PRIMARY KEY (Id)
)
GO

CREATE TABLE Courses (
Id int IDENTITY (1,1) NOT NULL,
[Name] nvarchar(100) NOT NULL,
Credit nvarchar(50) NOT NULL,
AcademicYear date NOT NULL,
Semester int NULL,
Comment nvarchar(100) NOT NULL,
CreatedDate date NOT NULL,
CONSTRAINT [PK_Courses] PRIMARY KEY (Id)
)
GO

CREATE TABLE AchievementTypes (
Id int IDENTITY (1,1) NOT NULL,
[Name] nvarchar(100) NOT NULL,
[Description] nvarchar(max) NULL,
ParticipationRate int NOT NULL,
CONSTRAINT [PK_AchievementTypes] PRIMARY KEY (Id)
)
GO

CREATE TABLE GradeDetails (
Id int IDENTITY (1,1) NOT NULL,
GradeID int NOT NULL,
AchievementTypeID int NOT NULL,
AchievementPoints int NOT NULL,
AchievementMaxPoints bigint NULL,
AchievementDate date NOT NULL,
CONSTRAINT [PK_GradeDetails] PRIMARY KEY (Id)
)
GO

--INSERT INTO Students (FirstName, LastName, DateOfBirth, EnrolledDate, Gender, NationalIDNumber, StudentCardNumber, City)
--VALUES 
--('Aleksandar', 'Todoroski', '1985-05-11', '2022-10-17', 'M', 12345678944, 25221,'Skopje'),
--('Dragica', 'Todoroska', '1988-01-20', '2022-10-17', 'M', 12151684684, 21566,'Skopje');
--GO

ALTER TABLE Students
ADD City nvarchar(100);
GO

INSERT INTO Students (FirstName, LastName, DateOfBirth, EnrolledDate, Gender, NationalIDNumber, StudentCardNumber, City)
VALUES 
('Aleksandar', 'Todoroski', '1985-05-11', '2022-10-17', 'M', 12345678944, 25221,'Skopje'),
('Dragica', 'Todoroska', '1988-01-20', '2022-10-17', 'F', 12151684684, 21566,'Skopje');
GO

SELECT * FROM Students

UPDATE Students
SET City = 'Struga',
    StudentCardNumber = 12214
WHERE Id = 2;

SELECT * FROM Students