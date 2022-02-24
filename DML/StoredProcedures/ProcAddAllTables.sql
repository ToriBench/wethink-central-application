/* USER ROLES TABLE*/
CREATE PROCEDURE uspAddUserRole
@UserRole varchar(255)

AS
BEGIN
	INSERT INTO [dbo].[UserRoles]
		([UserRole])
	VALUES
		(@UserRole)
	END
GO

/* USERS TABLE*/
CREATE PROCEDURE uspAddUser
@UserId int,
@Email varchar(255),
@PasswordHash varchar(255),
@UserRoleId int

AS
BEGIN
	INSERT INTO [dbo].[Users]
		([Email], 
		[PasswordHash], 
		[UserRoleID])
	VALUES
		(@Email, @PasswordHash, @UserRoleID)
END
GO

/* STUDENTS TABLE*/
CREATE PROCEDURE uspAddStudent
@UserID int,
@FirstName varchar(255),
@LastName varchar(255),
@AddressID int,
@ApScore int = NULL

AS
BEGIN
	INSERT INTO [dbo].[Students]
		([UserID], 
		[FirstName], 
		[LastName], 
		[AddressID])
	VALUES
		(@UserID, @FirstName, @LastName, @AddressID)
	IF NOT @ApScore IS NULL
		INSERT INTO [dbo].[Students]
		(ApScore)
		VALUES 
		(@ApScore)
END
GO

/* RESULTS TABLE*/
CREATE PROCEDURE uspAddResult
@StudentID int,
@SubjectID int,
@Mark int

AS
BEGIN
	INSERT INTO [dbo].[Results]
		([StudentID], [SubjectID], [Mark])
	VALUES
		(@StudentID, @SubjectID, @Mark)
END
GO

/* SUBJECT TABLE*/
CREATE PROCEDURE uspAddSubject
@Code varchar(255),
@Name varchar(255)

AS
BEGIN
	INSERT INTO [dbo].[Subjects]
		([Code], [Name])
	VALUES
		(@Code, @Name)
END
GO

/* INSTITUTION TABLE*/
CREATE PROCEDURE uspAddInstitution
@Name varchar(255),
@AddressID int,
@ApplicationLink varchar(255)

AS
BEGIN
	INSERT INTO [dbo].[Institutions]
		([Name], [AddressID], [ApplicationLink])
	VALUES
		(@Name, @AddressID, @ApplicationLink)
END
GO

/* FACULTIES TABLE*/
CREATE PROCEDURE AddFaculty
@InstitutionID int, 
@Name varchar(255),
@Description varchar(255)

AS
BEGIN
	INSERT INTO [dbo].[Faculties]
		([InstitutionID], [Name], [Description])
	VALUES
		(@InstitutionID, @Name, @Description)
END
GO

/* COURSES TABLE*/
CREATE PROCEDURE AddCourse
@QualificationID int, 
@FacultyID int,
@MonthDuration int,
@Name varchar(255),
@Description varchar(255),
@ApScore int
AS
BEGIN
	INSERT INTO [dbo].[Courses]
		( [QualificationID],
		[FacultyID],
		[MonthDuration], 
		[Name], 
		[Description], 
		[ApScore] )
	VALUES
		( @FacultyID,
		@MonthDuration, 
		@Name, 
		@Description, 
		@APScore )
END
GO

/* QUALIFICATIONS TABLE*/
CREATE PROCEDURE uspAddQualification
@Name varchar(255),
@NQFLevel int
AS
BEGIN
	INSERT INTO [dbo].[Qualifications]
		([Name], 
		[NQFLevel])
	VALUES
		(@Name,
		@NQFLevel)
END
GO

/* REQUIREMENTS TABLE*/
CREATE PROCEDURE uspAddRequirement
@CourseID int,
@SubjectID int, 
@MinimumMark int
AS
BEGIN
	INSERT INTO [dbo].[Requirements]
		([CourseID],
		[SubjectID],
		[MinimumMark])
	VALUES
		(@CourseID,
		@SubjectID,
		@MinimumMark)
END
GO

/* ADDRESSES TABLE*/
CREATE PROCEDURE uspAddAddress
@City varchar(255),
@Province varchar(255),
@PostalCode int,
@Country varchar(255),
@StreetAddress varchar(255)
AS
BEGIN
	INSERT INTO [dbo].[Addresses]
		([City],
		[Province],
		[PostalCode],
		[Country],
		[StreetAddress])
	VALUES
		(@City,
		@Province,
		@PostalCode,
		@Country,
		@StreetAddress)
END
GO