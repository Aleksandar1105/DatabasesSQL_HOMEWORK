USE [SEDCHome]
GO

DROP TABLE IF EXISTS [dbo].[Student]
DROP TABLE IF EXISTS [dbo].[Teacher]
DROP TABLE IF EXISTS [dbo].[Grade]
DROP TABLE IF EXISTS [dbo].[Course]
DROP TABLE IF EXISTS [dbo].[AchievementType]
DROP TABLE IF EXISTS [dbo].[GradeDetails]
GO

CREATE TABLE Student (
Id int IDENTITY (1,1) NOT NULL,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
DateOfBirth date NULL,
EnrolledDate date NOT NULL,
Gender nchar(1) NOT NULL,
NationalIDNumber nvarchar(50) NULL,
StudentCardNumber nvarchar(50) NOT NULL,
CONSTRAINT [PK_Student] PRIMARY KEY (Id)
)
GO

CREATE TABLE Teacher (
Id int IDENTITY (1,1) NOT NULL,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
DateOfBirth date NULL,
AcademicRank nvarchar(50) NOT NULL,
HireDate date NOT NULL,
CONSTRAINT [PK_Teacher] PRIMARY KEY (Id)
)
GO

CREATE TABLE Grade (
Id int IDENTITY (1,1) NOT NULL,
StudentID int NOT NULL,
CourseID int NOT NULL,
TeacherID int NULL,
Grade int NULL,
Comment nvarchar(100) NOT NULL,
CreatedDate date NOT NULL,
CONSTRAINT [PK_Grade] PRIMARY KEY (Id)
)
GO

CREATE TABLE Course (
Id int IDENTITY (1,1) NOT NULL,
[Name] nvarchar(100) NOT NULL,
Credit nvarchar(50) NOT NULL,
AcademicYear int NOT NULL,
Semester int NULL,
Comment nvarchar(100) NULL,
CreatedDate int NULL,
CONSTRAINT [PK_Course] PRIMARY KEY (Id)
)
GO

CREATE TABLE AchievementType (
Id int IDENTITY (1,1) NOT NULL,
[Name] nvarchar(100) NOT NULL,
[Description] nvarchar(max) NULL,
ParticipationRate int NOT NULL,
CONSTRAINT [PK_AchievementType] PRIMARY KEY (Id)
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

