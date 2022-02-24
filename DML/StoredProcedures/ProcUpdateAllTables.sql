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
@Email varchar(255),
@FirstName varchar(255),
@LastName varchar(255),
@PasswordHash varchar(255),
@UserRoleID int

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Users]
		SET [Email] = @Email,
			[PasswordHash] = @PasswordHash,
			[UserRoleID] = @UserRoleID
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
@Code varchar(255),
@Name varchar(255)

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Subjects]
		SET [Code] = @Code,
			[Name] = @Name
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
@UserID int,
@AddressID int

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Students]
		SET [UserID] = @UserID,
			[AddressID] = @AddressID
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
@QualificationId int,
@FacultyId int,
@MonthDuration int,
@Name varchar(255),
@Descr varchar(255),
@APS int

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Courses]
		SET [QualificationID] = @QualificationId,
			[FacultyID] = @FacultyId,
			[MonthDuration] = @MonthDuration,
			[Name] = @Name,
			[Description] = @Descr,
			[APScore] = @APS
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
@NQFLevel int,
@Name varchar(255)

AS
BEGIN

	BEGIN TRANSACTION

	UPDATE [dbo].[Qualifications]
	SET  [NQFLevel] = @NQFLevel,
		 [Name] = @Name
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
@Name varchar(255),
@AddressID int,
@ApplicationLink varchar(255)

AS
BEGIN

	BEGIN TRANSACTION
		UPDATE [dbo].[Institutions]
		SET [Name] = @Name,
			[AddressID] = @AddressID,
			[ApplicationLink] = @ApplicationLink
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
<<<<<<< HEAD
@FacultyID int,
=======
@FacultyId int,
@InstitutionID int,
>>>>>>> main
@Name varchar(255),
@Description varchar(255)

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Faculties]
		SET [InstitutionID]= @InstitutionID,
			[Name] = @Name,
			[Description] = @Description
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
			[StreetAddress] = @StreetAddress,
			[City] = @City,
			[Province] = @Province,
			[PostalCode]  = @PostalCode,
			[Country] = @Country
		WHERE [AddressID] = @AddressID 

		IF @@Error <> 0
		BEGIN
			ROLLBACK TRANSACTION
			RETURN
		END
	COMMIT TRANSACTION
END
GO
