USE [master]
GO

CREATE DATABASE [WeThinkDB]
GO
USE WeThinkDB
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[StreetAddress] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Zip] [int] NULL,
	[Country] [varchar](255) NULL,
	CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED (
		AddressID ASC
	)
)
GO

--------------------------------------------------------------------
CREATE TABLE [dbo].[UserRoles](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserRole] [varchar](255) NULL,
CONSTRAINT PK_UserRoles PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)
)
GO

--------------------------------------------------------------------

CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](255) NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[PasswordHash] [varchar](255) NULL,
	[UserRoleID] [int] NULL,
CONSTRAINT PK_Users PRIMARY KEY CLUSTERED
(
	[UserID] ASC
),
CONSTRAINT FK_UsersUserRoles
	FOREIGN KEY ([UserRoleID]) REFERENCES [UserRoles](UserRoleID) ON DELETE CASCADE
)
GO
--------------------------------------------------------------------
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[AddressID] [int] NULL,
CONSTRAINT PK_Students PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
),
CONSTRAINT [FK_StudentsUser]
	FOREIGN KEY ([UserID]) REFERENCES [Users](UserID) ON DELETE CASCADE,
CONSTRAINT [FK_StudentsAddress]
	FOREIGN KEY ([AddressID]) REFERENCES [Addresses](AddressID) ON DELETE SET NULL
)
GO

--------------------------------------------------------------------

CREATE TABLE [dbo].[Institutions](
	[InstitutionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
	[AddressID] int NOT NULL,
	[ApplicationLink] [varchar](255) NULL,
	CONSTRAINT [PK_Institutions] PRIMARY KEY CLUSTERED (
		InstitutionID ASC
	),
	CONSTRAINT [FK_InstitutionsAddress]
		FOREIGN KEY (AddressID) REFERENCES Addresses(AddressID) ON DELETE SET NULL
)
GO

--------------------------------------------------------------------

CREATE TABLE [dbo].[Faculties](
	[FacultyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
	CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED (
		FacultyID ASC
	)
)
GO
--------------------------------------------------------------------
CREATE TABLE [dbo].[Qualifications](
	[QualificationID] [int] IDENTITY(1,1) NOT NULL,
	[NQFLevel] [int] NULL,
	[Name] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
CONSTRAINT [PK_Qualifications] PRIMARY KEY CLUSTERED ( 
	QualificationID ASC)
)
GO

--------------------------------------------------------------------

CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[QualificationID] [int] NULL,
	[InstitutionID] [int] NULL,
	[FacultyID] [int] NULL,
	[MonthDuration] [int] NULL,
	[Name] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
	[AP_Score] [int] NULL,
CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED (
	CourseID ASC
),
CONSTRAINT [FK_CoursesFaculty]
	FOREIGN KEY ([FacultyID]) REFERENCES [Faculties](FacultyID) ON DELETE SET NULL,
CONSTRAINT [FK_CoursesQualification]
	FOREIGN KEY ([QualificationID]) REFERENCES [Qualifications](QualificationID) ON DELETE SET NULL,
CONSTRAINT [FK_CoursesInstitution]
	FOREIGN KEY ([InstitutionID]) REFERENCES [Institutions](InstitutionID) ON DELETE CASCADE
)

--------------------------------------------------------------------

CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](255) NULL,
	[Name] [varchar](255) NULL,
CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED (
	SubjectID ASC
))
GO

--------------------------------------------------------------------
CREATE TABLE [dbo].[Requirements](
	[QualificationID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[MinimumMark] [int] NULL,
CONSTRAINT PK_Requirements PRIMARY KEY CLUSTERED 
(
	[QualificationID] ASC,
	[SubjectID] ASC
),
CONSTRAINT [FK_RequirementsSubject]
	FOREIGN KEY ([SubjectID]) REFERENCES [Subjects](SubjectID) ON DELETE CASCADE,
CONSTRAINT [FK_RequirementsQualification]
	FOREIGN KEY ([QualificationID]) REFERENCES [Qualifications](QualificationID) ON DELETE CASCADE
)
GO

--------------------------------------------------------------------

CREATE TABLE [dbo].[Results](
	[StudentID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[Mark] [int] NOT NULL,
CONSTRAINT PK_Results PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[SubjectID] ASC
),
CONSTRAINT [FK_ResultsStudent]
	FOREIGN KEY ([StudentID]) REFERENCES [Students](StudentID) ON DELETE CASCADE,
CONSTRAINT [FK_ResultsSubject]
	FOREIGN KEY ([SubjectID]) REFERENCES [Subjects](SubjectID) ON DELETE CASCADE
)
GO

--------------------------------------------------------------------

CREATE TABLE [dbo].[StudentQualifications](
	[StudentID] [int] NOT NULL,
	[QualificationID] [int] NOT NULL,
CONSTRAINT PK_StudentQualifications PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[QualificationID] ASC
),
CONSTRAINT [FK_StudentQualificationsStudent]
	FOREIGN KEY ([StudentID]) REFERENCES [Students](StudentID) ON DELETE CASCADE,
CONSTRAINT [FK_StudentQualificationsQualification]
	FOREIGN KEY ([QualificationID]) REFERENCES [Qualifications](QualificationID) ON DELETE CASCADE
)
GO

--------------------------------------------------------------------