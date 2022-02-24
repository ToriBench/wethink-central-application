/* USER ROLES TABLE*/
CREATE PROCEDURE AddUserRole
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
CREATE PROCEDURE AddUser
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
CREATE PROCEDURE AddStudent
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
CREATE PROCEDURE AddResult
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
CREATE PROCEDURE AddSubject
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
CREATE PROCEDURE AddInstitution
@Name varchar(255),
@Public bit,
@AddressID int,
@ApplicationLink varchar(255)

AS
BEGIN
	INSERT INTO [dbo].[Institutions]
		([Name], [AddressID], [Public], [ApplicationLink])
	VALUES
		(@Name, @AddressID, @Public, @ApplicationLink)
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
@FullTime bit,
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
		[FullTime],
		[Description], 
		[ApScore] )
	VALUES
		( @FacultyID,
		@MonthDuration, 
		@Name, 
		@FullTime,
		@Description, 
		@APScore )
END
GO

/* QUALIFICATIONS TABLE*/
CREATE PROCEDURE AddQualification
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
CREATE PROCEDURE AddRequirement
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
CREATE PROCEDURE AddAddress
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