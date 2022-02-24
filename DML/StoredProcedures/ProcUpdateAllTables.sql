/*	USER-ROLES TABLE*/
USE WeThinkDB
GO

CREATE PROCEDURE uspUpdateUserRole
@UserRoleId int,
@UserRole varchar(255)

AS
BEGIN

	BEGIN TRANSACTION

	UPDATE [dbo].[UserRoles]
	SET [UserRole] = @UserRole
	WHERE [UserRoleID] = @UserRoleId

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
@UserId int,
@Email varchar(255),
@FirstName varchar(255),
@LastName varchar(255),
@PasswordHash varchar(255),
@UserRoleId int

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Users]
		SET [Email] = @Email,
			[PasswordHash] = @PasswordHash,
			[UserRoleID] = @UserRoleId
		WHERE [UserID] = @UserId

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
@SubjectId int,
@Code varchar(255),
@Name varchar(255)

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Subjects]
		SET [Code] = @Code,
			[Name] = @Name
		WHERE SubjectID = @SubjectId

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
@StudentId int,
@UserId int,
@AddressId int

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Students]
		SET [UserID] = @UserId,
			[AddressID] = @AddressId
		WHERE [StudentID] = @StudentId

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
@StudentId int,
@SubjectId int,
@Mark int

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Results]
		SET [Mark] = @Mark
		WHERE [StudentID] = @StudentId AND [SubjectID] = @SubjectId

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
@CourseId int,
@SubjectId int,
@MinimumMark int

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Requirements]
		SET [MinimumMark] = @MinimumMark
		WHERE [CourseId] = @CourseId AND [SubjectID] = @SubjectId

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
		WHERE [CourseID] = @CourseId 

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
@QualificationId int,
@NQFLevel int,
@Name varchar(255)

AS
BEGIN

	BEGIN TRANSACTION

	UPDATE [dbo].[Qualifications]
	SET  [NQFLevel] = @NQFLevel,
		 [Name] = @Name
	WHERE [QualificationID] = @QualificationId 

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
@InstitutionId int,
@Name varchar(255),
@AddressId int,
@ApplicationLink varchar(255)

AS
BEGIN

	BEGIN TRANSACTION
		UPDATE [dbo].[Institutions]
		SET [Name] = @Name,
			[AddressID] = @AddressId,
			[ApplicationLink] = @ApplicationLink
		WHERE [InstitutionID] = @InstitutionId 

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
@InstitutionID int,
@Name varchar(255),
@Descr varchar(255)

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Faculties]
		SET [InstitutionID]= @InstitutionID,
			[Name] = @Name,
			[Description] = @Descr
		WHERE [FacultyID] = @FacultyId 

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
@State varchar(255),
@Zip int,
@Country varchar(255)

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Addresses]
		SET 
			[StreetAddress] = @StreetAddress,
			[City] = @City,
			[Province] = @State,
			[PostalCode]  = @Zip,
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
