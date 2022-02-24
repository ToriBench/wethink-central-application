/* USER ROLES TABLE*/
CREATE PROCEDURE AddUserRole
@UserRole varchar(255)

AS
BEGIN
	   INSERT INTO [dbo].[UserRoles]
              (UserRole)
       VALUES
              (@UserRole)
END
GO

/* USERS TABLE*/
CREATE PROCEDURE AddUser
@UserId int,
@Email varchar(255),
@FirstName varchar(255),
@LastName varchar(255),
@PasswordHash varchar(255),
@UserRoleId int

AS
BEGIN
	   INSERT INTO [dbo].[Users]
              (Email, FirstName, LastName, PasswordHash, UserRoleID)
       VALUES
              (@Email, @FirstName, @LastName, @PasswordHash, @UserRoleID)
END
GO

/* STUDENTS TABLE*/
CREATE PROCEDURE AddStudent
@UserID int,
@AddressID int

AS
BEGIN
	   INSERT INTO [dbo].[Students]
              (UserID, AddressID)
       VALUES
              (@UserID, @AddressID)
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
              (StudentID, SubjectID, Mark)
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
              (Code, Name)
       VALUES
              (@Code, @Name)
END
GO

/* INSTITUTION TABLE*/
CREATE PROCEDURE AddInstitution
@Name varchar(255),
@AddressID int,
@ApplicationLink varchar(255)

AS
BEGIN
	   INSERT INTO [dbo].[Institutions]
              (Name, AddressID, ApplicationLink)
       VALUES
              (@Name, @AddressID, @ApplicationLink)
END
GO

/* FACULTIES TABLE*/
CREATE PROCEDURE AddFaculty
@Name varchar(255),
@Description varchar(255)

AS
BEGIN
	   INSERT INTO [dbo].[Faculties]
              (Name, Description)
       VALUES
              (@Name, @Description)
END
GO

/* QUALIFICATIONS TABLE*/
CREATE PROCEDURE AddQualification
@InstitutionID int,
@FacultyID int, 
@MonthDuration int,
@Name varchar(255),
@Description varchar(255),
@APScore int
AS
BEGIN
	   INSERT INTO [dbo].[Qualifications]
              ( InstitutionID, 
				FacultyID,
				MonthDuration, 
				Name, 
				Description, 
				AP_Score )
       VALUES
              ( @InstitutionID, 
				@FacultyID,
				@MonthDuration, 
				@Name, 
				@Description, 
				@APScore )
END
GO

/* REQUIREMENTS TABLE*/
CREATE PROCEDURE AddRequirement
@QualificationID int,
@SubjectID int, 
@MinimumMark int
AS
BEGIN
	   INSERT INTO [dbo].[Requirements]
              ( QualificationID,
				SubjectID,
				MinimumMark
			   )
       VALUES
              ( @QualificationID,
				@SubjectID,
				@MinimumMark
			   )
END
GO

/* ADDRESSES TABLE*/
CREATE PROCEDURE AddAddress
@City varchar(255),
@State varchar(255),
@Zip int,
@Country varchar(255),
@StreetAddress varchar(255)
AS
BEGIN
	   INSERT INTO [dbo].[Addresses]
              ( [City],
				[State],
				[Zip],
				[Country],
				[StreetAddress]
			   )
       VALUES
              ( @City,
				@State,
				@Zip,
				@Country,
				@StreetAddress
			   )
END
GO