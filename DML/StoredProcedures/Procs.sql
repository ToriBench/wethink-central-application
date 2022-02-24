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
@AddressID int = NULL,
@ApScore int = NULL

AS
BEGIN
	INSERT INTO [dbo].[Students]
		([UserID], 
		[FirstName], 
		[LastName])
	VALUES
		(@UserID, @FirstName, @LastName)
	IF NOT @AddressID IS NULL
		INSERT INTO [dbo].[Students]
		([AddressID])
		VALUES 
		(@AddressID)
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
CREATE PROCEDURE uspAddFaculty
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
CREATE PROCEDURE uspAddCourse
@QualificationID int, 
@FacultyID int,
@MonthDuration int,
@Name varchar(255),
@Description varchar(255),
@ApScore int
AS
BEGIN
	INSERT INTO [dbo].[Courses]
		(
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

CREATE PROCEDURE uspCourseRequirements( @CourseID int)
-- Gets the subject requirements of a given course 
AS
BEGIN TRY
	IF ((SELECT COUNT(*) FROM Courses WHERE CourseID = @CourseID) = 0)
			RAISERROR('Invalid Course ID.', 11, 1)

	SELECT Sub.[Code], Sub.[Name], Req.[MinimumMark] 
	FROM [dbo].[Requirements] as Req
	INNER JOIN [Subjects] as Sub 
		ON Req.[SubjectID] = Sub.[SubjectID] 
	WHERE Req.[CourseID] = @CourseID
END TRY
BEGIN CATCH
  SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;

	DECLARE @ErrorMessage varchar(MAX) = ERROR_MESSAGE(),
    @Severity int = ERROR_SEVERITY(),
    @State smallint = ERROR_STATE()
 
	RAISERROR (@ErrorMessage, @Severity, @State)
END CATCH
GO

USE WeThinkDB
GO
/* USER ROLES TABLE*/
CREATE PROCEDURE uspDeleteUserRole
@UserRoleID int
AS
BEGIN
-- DELETE ALL USERS WITH THIS ROLE
	   DELETE FROM [dbo].[UserRoles]
       WHERE UserRoleID = @UserRoleID
END
GO

/* USERS TABLE*/
CREATE PROCEDURE uspDeleteUser
@UserID int
AS
BEGIN
	   DELETE FROM [dbo].[Users]
       WHERE UserID = @UserID
END
GO

/* STUDENTS TABLE*/
CREATE PROCEDURE uspDeleteStudent
@StudentID int
AS
BEGIN
	   DELETE FROM [dbo].[Students]
	   WHERE StudentID = @StudentID
END
GO

/* RESULTS TABLE*/
CREATE PROCEDURE uspDeleteResult
@StudentID int,
@SubjectID int
AS
BEGIN
	   DELETE FROM [dbo].[Results]
	   WHERE StudentID = @StudentID
	   AND SubjectID = @SubjectID
END
GO

/* SUBJECT TABLE*/
CREATE PROCEDURE uspDeleteSubject
@SubjectID int
AS
BEGIN
	   DELETE FROM [dbo].[Subjects]
	   WHERE SubjectID = @SubjectID
END
GO

/* INSTITUTION TABLE*/
CREATE PROCEDURE uspDeleteInstitution
@InstitutionID int
AS
BEGIN
	   DELETE FROM [dbo].[Institutions]
	   WHERE InstitutionID = @InstitutionID
END
GO

/* FACULTIES TABLE*/
CREATE PROCEDURE uspDeleteFaculty
@FacultyID int
AS
BEGIN
	   DELETE FROM [dbo].[Faculties]
	   WHERE FacultyID=@FacultyID
END
GO

/* QUALIFICATIONS TABLE*/
CREATE PROCEDURE uspDeleteQualification
@QualificationID int
AS
BEGIN
	   DELETE FROM [dbo].[Qualifications]
	   WHERE QualificationID=@QualificationID
END
GO

/* QUALIFICATIONS TABLE*/
CREATE PROCEDURE uspDeleteCourse
@CourseID int
AS
BEGIN
	   DELETE FROM [dbo].[Courses]
	   WHERE CourseID=@CourseID
END
GO

/* REQUIREMENTS TABLE*/
CREATE PROCEDURE uspDeleteRequirement
@SubjectID int,
@CourseID int
AS
BEGIN
	   DELETE FROM [dbo].[Requirements]
	   WHERE 
			[CourseID] = @CourseID
		AND [SubjectID] = @SubjectID
END
GO

/* ADDRESSES TABLE*/
CREATE PROCEDURE uspDeleteAddress
@AddressID int
AS
BEGIN
	   DELETE FROM [dbo].[Addresses]
	   WHERE AddressID=@AddressID
END
GO

/* STUDENTQUALIFICATIONS TABLE*/
CREATE PROCEDURE uspDeleteStudentSavedCourse
@StudentID int,
@CourseID int
AS
BEGIN
	DELETE FROM [dbo].[StudentSavedCourses]
	WHERE [StudentID] = @StudentID 
	AND [CourseID] = @CourseID
END
GO

-- Get Requirements that are not met yet
USE WeThinkDB
GO

IF OBJECT_ID('uspGetRequirementsNotMet', 'P') IS NOT NULL
	DROP PROCEDURE uspGetRequirementsNotMet
GO

CREATE PROCEDURE uspGetRequirementsNotMet(@StudentID int, @CourseID int)
-- Gets a student's subjects which do not meet the requirements of a particular course
    AS
	BEGIN TRY
	IF(@CourseID NOT IN (SELECT CourseID FROM Courses))
			RAISERROR('Invalid Course ID.', 11, 1)
	IF(@StudentID NOT IN (SELECT StudentID FROM Students))
			RAISERROR('Invalid Student ID.', 11, 1)

        SELECT Req.[SubjectID], Req.[Name]
        FROM (
            SELECT Require.[SubjectID], Require.[MinimumMark], Sub.[Name]
            FROM [dbo].[Requirements] as Require
            INNER JOIN [dbo].[Subjects] as Sub
                ON Require.[SubjectID] = Sub.[SubjectID]
            WHERE CourseID = @CourseID
        ) AS Req
        LEFT JOIN (
            SELECT [SubjectID], [Mark]
            FROM [dbo].[Results]
            WHERE StudentID = @StudentID
        ) Res
        ON Res.[SubjectID] = Req.[SubjectID]
        WHERE Res.[Mark] < Req.[MinimumMark] OR Res.[SubjectID] IS NULL
        GROUP BY Req.[SubjectID], Req.[Name]
	END TRY
	BEGIN CATCH
		SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;

		DECLARE @ErrorMessage varchar(MAX) = ERROR_MESSAGE(),
        @Severity int = ERROR_SEVERITY(),
        @State smallint = ERROR_STATE()
 
		RAISERROR (@ErrorMessage, @Severity, @State)
	END CATCH
GO

USE WeThinkDB
GO

CREATE PROC uspGetUserById(@ID int)
AS
BEGIN
     Select * from Users where
	 UserID = @ID
END
GO

CREATE PROC uspGetUserRoleById(@ID int)
AS
BEGIN
  SELECT * FROM UserRoles 
  WHERE UserRoleID = @ID
  END
GO

CREATE PROC uspGetStudentById(@ID int)
AS
BEGIN
  SELECT * FROM Students
  WHERE StudentID = @ID
  END
GO

CREATE PROC uspGetResultsById(@StudentID int, @SubjectID int)
AS
BEGIN 
   SELECT * FROM Results
   WHERE StudentID = @StudentID 
   AND
   SubjectID = @SubjectID
   END
GO

CREATE PROC uspGetSubjectById(@ID int)
AS
BEGIN
    SELECT * FROM Subjects
	WHERE SubjectID = @ID

	END
GO

CREATE PROC uspGetAddressById(@ID int)
AS
BEGIN
    SELECT * FROM Addresses
	WHERE AddressID = @ID
	END

GO

CREATE PROC uspGetInstitutitionById(@ID int)
AS
BEGIN
    SELECT * FROM Institutions
	WHERE InstitutionID = @IIDd
	END

GO

CREATE PROC uspGetQualificationById(@ID int)
AS
BEGIN
   SELECT * FROM Qualifications
   WHERE QualificationID = @ID
   END

GO

CREATE PROC uspGetRequirementById(@QualificationID int, @SubjectID int)
AS
BEGIN 
    SELECT * FROM Requirements
	WHERE QualificationID = @QualificationID
	AND
	SubjectID = @SubjectID
	END

GO
CREATE PROC uspGetCourseById(@ID int)
AS 
BEGIN
    SELECT * FROM [dbo].[Courses]
	WHERE CourseID = @ID
	END

GO

USE WeThinkDB
GO
CREATE OR ALTER PROCEDURE [dbo].[uspStudentEligible] (
	@StudentID int
)
AS
	BEGIN TRY
		IF((SELECT COUNT(*) FROM Students WHERE StudentID = @StudentID) = 0)
			RAISERROR('Invalid Student ID.', 11, 1)
		SELECT DISTINCT
			vInstitutionsWithCourses.Institution_Name AS 'Institution',
			vInstitutionsWithCourses.Faculty_Name AS 'Faculty',
			vInstitutionsWithCourses.Course_Name AS 'Course'
		FROM
		vInstitutionsWithCourses,
		Requirements
		INNER JOIN
		Subjects ON Subjects.SubjectID= Requirements.SubjectID,
		Students
		INNER JOIN 
		Results ON Students.StudentID = Results.StudentID

		WHERE
		Students.ApScore>= vInstitutionsWithCourses.ApScore
		AND
		(Results.StudentID= @StudentID
		AND vInstitutionsWithCourses.CourseID= Requirements.CourseID
		AND Results.SubjectID= Requirements.SubjectID
		AND Requirements.MinimumMark<= Results.Mark)
		OR vInstitutionsWithCourses.CourseID NOT IN 
		(SELECT Requirements.CourseID FROM Requirements)
		
		ORDER BY
			'Institution'
		END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_STATE() AS ErrorState,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage;

		DECLARE @ErrorMessage varchar(MAX) = ERROR_MESSAGE(),
		@Severity int = ERROR_SEVERITY(),
		@State smallint = ERROR_STATE()
 
		RAISERROR (@ErrorMessage, @Severity, @State)
	END CATCH
GO

-- Gets a student's results 
CREATE PROCEDURE uspStudentResults( @StudentID int )
AS
	BEGIN TRY
		IF(@StudentID NOT IN (SELECT StudentID FROM Students))
				RAISERROR('Invalid Student ID.', 11, 1)
		SELECT Sub.[Code], Sub.[Name], Res.[Mark] FROM [dbo].[Results] as Res
		INNER JOIN [dbo].[Subjects] as Sub 
			ON Res.[SubjectID] = Sub.[SubjectID]
		WHERE Res.[StudentID] = @StudentID
	END TRY
	BEGIN CATCH
		SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;

		DECLARE @ErrorMessage varchar(MAX) = ERROR_MESSAGE(),
        @Severity int = ERROR_SEVERITY(),
        @State smallint = ERROR_STATE()
 
		RAISERROR (@ErrorMessage, @Severity, @State)
	END CATCH
GO

USE WeThinkDB
GO

IF OBJECT_ID('uspTopPerformingStudents') IS NOT NULL
	DROP PROCEDURE uspTopPerformingStudents
GO

-- Gets the top n students where n is specified. Gets top 10 by default. 
CREATE PROCEDURE uspTopPerformingStudents (
	@SubjectID int,
	@n int = NULL
)
AS
	BEGIN TRY
		IF(@SubjectID NOT IN (SELECT SubjectID FROM Subjects))
				RAISERROR('Invalid subject id.', 11, 1)
	IF NOT @n IS NULL
		SELECT TOP (@n)
			[Mark] as 'Marks',
			[FirstName] as 'Name',
			[LastName] as 'LastName',
			[dbo].[Students].[UserID] as 'UserID',
			Students.[StudentID] as 'StudentID'
		FROM [dbo].[Results], [dbo].[Students], [dbo].[Users]
		WHERE
			SubjectID = @SubjectID
			AND Results.StudentID = Students.StudentID
			AND Users.UserID = Students.UserID
		ORDER BY Mark DESC;
	ELSE 
		SELECT TOP 10
			[Mark] as 'Marks',
			[FirstName] as 'Name',
			[LastName] as 'LastName',
			[dbo].[Students].[UserID] as 'UserID',
			Students.[StudentID] as 'StudentID'
		FROM [dbo].[Results], [dbo].[Students], [dbo].[Users]
		WHERE
			SubjectID = @SubjectID
			AND Results.StudentID = Students.StudentID
			AND Users.UserID = Students.UserID
		ORDER BY Mark DESC;
RETURN
	END TRY
	BEGIN CATCH
		SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;

		DECLARE @ErrorMessage varchar(MAX) = ERROR_MESSAGE(),
        @Severity int = ERROR_SEVERITY(),
        @State smallint = ERROR_STATE()
 
	RAISERROR (@ErrorMessage, @Severity, @State)
	END CATCH
GO
USE WeThinkDB
GO


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

-- User Login: Gets User Details if Email and Password are matched
IF OBJECT_ID('[dbo].[uspUserLogin]') IS NOT NULL
	DROP PROCEDURE [dbo].[uspUserLogin]
GO

CREATE PROCEDURE uspUserLogin(@Email varchar(255), @Password varchar(255))
	AS
	BEGIN TRY
		IF(@Email NOT IN (SELECT Email FROM Users) OR @Password NOT IN (SELECT PasswordHash FROM Users))
				RAISERROR('Invalid subject id.', 11, 1)

		SELECT [UserID] AS 'User ID',
			   [UserRoleID] AS 'Role ID'
		FROM [dbo].[Users]
		WHERE [Email] = @Email AND [PasswordHash] = @Password
	END TRY
	BEGIN CATCH
		SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;

		DECLARE @ErrorMessage varchar(MAX) = ERROR_MESSAGE(),
        @Severity int = ERROR_SEVERITY(),
        @State smallint = ERROR_STATE()
 
	RAISERROR (@ErrorMessage, @Severity, @State)
	END CATCH
GO