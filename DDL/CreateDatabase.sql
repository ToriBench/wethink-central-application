USE [master]
GO
/****** Object:  Database [WeThinkDB]    Script Date: 2022/02/14 13:07:52 ******/
CREATE DATABASE [WeThinkDB]
GO
USE WeThinkDB
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[StreetAddress] [varchar](255) NULL,
	[City] [varchar](255) NOT NULL,
	[Province] [varchar](255) NOT NULL,
	[PostalCode] [int] NOT NULL,
	[Country] [varchar](255) NOT NULL,
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
	[Email] [varchar](255) NOT NULL,
	[PasswordHash] [varchar](255) NOT NULL,
	[UserRoleID] [int] NOT NULL,
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
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[UserID] [int] NOT NULL,
	[AddressID] [int] NULL,
	[ApScore] [int] NULL,
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
	[Name] [varchar](255) NOT NULL,
	[AddressID] int NULL,
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
	[InstitutionID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](255) NULL,
	CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED (
		FacultyID ASC
	),
	CONSTRAINT [FK_FacultiesInstitution]
		FOREIGN KEY (InstitutionID) REFERENCES Institutions(InstitutionID) ON DELETE CASCADE,
	UNIQUE (
		[InstitutionID],[Name]
	)
)
GO
--------------------------------------------------------------------

CREATE TABLE [dbo].[Qualifications](
	[QualificationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[NQFLevel] [int] NULL,
CONSTRAINT [PK_Qualifications] PRIMARY KEY CLUSTERED (
	QualificationID ASC
),
CONSTRAINT [CK_NQFLevel] CHECK ([NQFLevel] >= 5 AND [NQFLevel] <= 10)
)
GO
--------------------------------------------------------------------
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[QualificationID] [int] NOT NULL,
	[FacultyID] [int] NOT NULL,
	[MonthDuration] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](255) NULL,
	[ApScore] [int] NOT NULL DEFAULT 0,
CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED (
	CourseID ASC
),
CONSTRAINT [FK_CoursesQualification]
	FOREIGN KEY ([QualificationID]) REFERENCES [Qualifications](QualificationID) ON DELETE CASCADE,
CONSTRAINT [FK_CoursesFaculty]
	FOREIGN KEY ([FacultyID]) REFERENCES [Faculties](FacultyID) ON DELETE CASCADE,
)
GO
--------------------------------------------------------------------

CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED (
	SubjectID ASC
),
UNIQUE (
	[Code],[Name]
))
GO

--------------------------------------------------------------------
CREATE TABLE [dbo].[Requirements](
	[CourseID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[MinimumMark] [int] NOT NULL,
CONSTRAINT PK_Requirements PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC,
	[SubjectID] ASC
),
CONSTRAINT [FK_RequirementsSubject]
	FOREIGN KEY ([SubjectID]) REFERENCES [Subjects](SubjectID) ON DELETE CASCADE,
CONSTRAINT [FK_RequirementsCourses]
	FOREIGN KEY ([CourseID]) REFERENCES [Courses](CourseID) ON DELETE CASCADE,
UNIQUE (
	[CourseID],[SubjectID]
)
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

CREATE TABLE [dbo].[StudentSavedCourses](
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
CONSTRAINT PK_StudentQualifications PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[CourseID] ASC
),
CONSTRAINT [FK_StudentCoursesStudent]
	FOREIGN KEY ([StudentID]) REFERENCES [Students](StudentID) ON DELETE CASCADE,
CONSTRAINT [FK_StudentCoursesQualification]
	FOREIGN KEY ([CourseID]) REFERENCES [Courses](CourseID) ON DELETE CASCADE
)
GO

----------------------------------------------------------------------
