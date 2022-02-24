/*	USER-ROLES TABLE*/
USE WeThinkDB
GO

CREATE PROCEDURE uspUpdateUserRole
@UserRoleID int,
@UserRole varchar(255)

AS
BEGIN

	BEGIN TRANSACTION

	UPDATE [dbo].[UserRoles]
	SET [UserRole] = @UserRole
	WHERE [UserRoleID] = @UserRoleID

	IF @@Error <> 0
	BEGIN
	ROLLBACK TRANSACTION
	RETURN
	END
	COMMIT TRANSACTION
END
GO

/* USERS TABLE*/
CREATE PROCEDURE uspUpdateUser
@UserID int,
@Email varchar(255) = NULL,
@PasswordHash varchar(255) = NULL,
@UserRoleID int = NULL

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Users]
		SET [Email] = isNull(@Email, [Email]),
			[PasswordHash] = isNull(@PasswordHash,[PasswordHash]),
			[UserRoleID] = isNull(@UserRoleID,[UserRoleID])
		WHERE [UserID] = @UserID

		IF @@Error <> 0
		BEGIN
			ROLLBACK TRANSACTION
			RETURN
		END
	COMMIT TRANSACTION
END
GO

/* SUBJECTS TABLE*/
CREATE PROCEDURE uspUpdateSubject
@SubjectID int,
@Code varchar(255) = NULL,
@Name varchar(255) = NULL

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Subjects]
		SET [Code] = isNull(@Code, [Code]),
			[Name] = isNull(@Name, [Name])
		WHERE SubjectID = @SubjectID

		IF @@Error <> 0
		BEGIN
			ROLLBACK TRANSACTION
			RETURN
		END
	COMMIT TRANSACTION
END
GO

/* STUDENTS TABLE*/

CREATE PROCEDURE uspUpdateStudent
@StudentID int,
@FirstName varchar(255) = NULL,
@LastName varchar(255) = NULL,
@AddressID int = NULL

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Students]
		SET 
			[AddressID] = isNull(@AddressID, [AddressID]),
			[FirstName] = isNull(@FirstName, [FirstName]),
			[LastName] = isNull(@LastName, [LastName])
		WHERE [StudentID] = @StudentID
		
		IF @@Error <> 0
		BEGIN
			ROLLBACK TRANSACTION
			RETURN
		END
	COMMIT TRANSACTION
END
GO

/* RESULTS TABLE*/

CREATE PROCEDURE uspUpdateResult
@StudentID int,
@SubjectID int,
@Mark int

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Results]
		SET [Mark] = @Mark
		WHERE [StudentID] = @StudentID AND [SubjectID] = @SubjectID

		IF @@Error <> 0
		BEGIN
			ROLLBACK TRANSACTION
			RETURN
		END
	COMMIT TRANSACTION
END
GO

/* REQUIREMENTS TABLE*/

CREATE PROCEDURE uspUpdateRequirement
@CourseID int,
@SubjectID int,
@MinimumMark int

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Requirements]
		SET [MinimumMark] = @MinimumMark
		WHERE [CourseId] = @CourseID AND [SubjectID] = @SubjectID

		IF @@Error <> 0
		BEGIN
			ROLLBACK TRANSACTION
			RETURN
		END
	COMMIT TRANSACTION
END
GO

/* Courses TABLE */
CREATE PROCEDURE uspUpdateCourse
@CourseId int,
@QualificationId int = NULL,
@FacultyId int = NULL,
@MonthDuration int = NULL,
@Name varchar(255) = NULL,
@Description varchar(255) = NULL,
@ApScore int = NULL

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Courses]
		SET [QualificationID] = isNull(@QualificationId, [QualificationID]),
			[FacultyID] = isNull(@FacultyId, [FacultyID]),
			[MonthDuration] = isNull(@MonthDuration, [MonthDuration]),
			[Name] = isNull(@Name, [Name]),
			[Description] = isNull(@Description,[Description]),
			[ApScore] = isNull(@ApScore, [ApScore])
		WHERE [CourseID] = @CourseID 

		IF @@Error <> 0
			BEGIN
			ROLLBACK TRANSACTION
			RETURN
		END
	COMMIT TRANSACTION
END
GO

/* Qualification TABLE */
CREATE PROCEDURE uspUpdateQualification
@QualificationID int,
@NQFLevel int=NULL,
@Name varchar(255)=NULL 

AS
BEGIN

	BEGIN TRANSACTION

	UPDATE [dbo].[Qualifications]
	SET  [NQFLevel] = isNull(@NQFLevel, [NQFLevel]),
		 [Name] = isNull(@Name, [NQFLevel])
	WHERE [QualificationID] = @QualificationID 

	IF @@Error <> 0
	BEGIN
		ROLLBACK TRANSACTION
		RETURN
	END
	COMMIT TRANSACTION
END
GO

/* INSTITUTIONS TABLE */ 
CREATE PROCEDURE uspUpdateInstitution
@InstitutionID int,
@Name varchar(255)=NULL,
@AddressID int=NULL,
@ApplicationLink varchar(255)=NULL

AS
BEGIN

	BEGIN TRANSACTION
		UPDATE [dbo].[Institutions]
		SET [Name] = isNull(@Name,[Name]),
			[AddressID] = isNull(@AddressID,[AddressID]),
			[ApplicationLink] = isNull(@ApplicationLink, [ApplicationLink])
		WHERE [InstitutionID] = @InstitutionID 

		IF @@Error <> 0
		BEGIN
			ROLLBACK TRANSACTION
			RETURN
		END
	COMMIT TRANSACTION
END
GO

/* FACULITIES TABLE*/
CREATE PROCEDURE uspUpdateFaculty
@FacultyId int,
@InstitutionID int = NULL,
@Name varchar(255) = NULL,
@Description varchar(255) = NULL

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Faculties]
		SET [InstitutionID]= isNull(@InstitutionID,[InstitutionID]),
			[Name] = isNull(@Name,[Name]),
			[Description] = isNull(@Description,[Description])
		WHERE [FacultyID] = @FacultyID 

		IF @@Error <> 0
		BEGIN
			ROLLBACK TRANSACTION
			RETURN
		END
	COMMIT TRANSACTION
END
GO

/* ADDRESSES TABLE*/

CREATE PROCEDURE uspUpdateAddress
@AddressID int,
@StreetAddress varchar(255),
@City varchar(255),
@Province varchar(255),
@PostalCode int,
@Country varchar(255)

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Addresses]
		SET 
			[StreetAddress] = isNull(@StreetAddress,[StreetAddress]),
			[City] = isNull(@City, [City]),
			[Province] = isNull(@Province, [Province]),
			[PostalCode]  = isNull(@PostalCode,[PostalCode]),
			[Country] = isNull(@Country,[Country])
		WHERE [AddressID] =@AddressID 

		IF @@Error <> 0
		BEGIN
			ROLLBACK TRANSACTION
			RETURN
		END
	COMMIT TRANSACTION
END
GO
