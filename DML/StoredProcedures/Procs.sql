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

ALTER PROCEDURE [dbo].[uspStudentEligible] (
	@StudentID int
)
AS
	SELECT DISTINCT
		Inst.Institution_Name AS 'Institution',
		Inst.Faculty_Name AS 'Faculty',
		Inst.Course_Name AS 'Course'
	FROM
		vInstitutionsWithCourses AS Inst,
		vStudentsWithResults AS Res,
		vCoursesWithRequirements AS Req,
		vCoursesWithNoRequirements AS noReq
	WHERE
		((Res.StudentID = @StudentID 
		AND Inst.CourseID = Req.CourseID
		AND Res.SubjectID = Req.SubjectID
		AND Req.MinimumMark <= Res.Mark))

		OR
    
		(Inst.CourseID = noReq.CourseID)
		
	ORDER BY
		'Institution'
GO

-- Gets a student's results 
CREATE PROCEDURE uspStudentResults( @StudentID int )
AS
	SELECT Sub.[Code], Sub.[Name], Res.[Mark] FROM [dbo].[Results] as Res
	INNER JOIN [dbo].[Subjects] as Sub 
		ON Res.[SubjectID] = Sub.[SubjectID]
	WHERE Res.[StudentID] = @StudentID
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
<<<<<<< HEAD
@CourseID int,
@QualificationID int,
@InstitutionID int,
@FacultyID int,
=======
@CourseId int,
@QualificationId int,
@FacultyId int,
>>>>>>> main
@MonthDuration int,
@Name varchar(255),
@Descr varchar(255),
@APS int

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Courses]
<<<<<<< HEAD
		SET [QualificationID] = @QualificationID,
			[InstitutionID] = @InstitutionID,
			[FacultyID] = @FacultyID,
=======
		SET [QualificationID] = @QualificationId,
			[FacultyID] = @FacultyId,
>>>>>>> main
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
@Descr varchar(255)

AS
BEGIN

	BEGIN TRANSACTION

		UPDATE [dbo].[Faculties]
		SET [InstitutionID]= @InstitutionID,
			[Name] = @Name,
			[Description] = @Descr
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
-- User Login: Gets User Details if Email and Password are matched
USE WeThinkDB
GO

IF OBJECT_ID('[dbo].[uspUserLogin]') IS NOT NULL
	DROP PROCEDURE [dbo].[uspUserLogin]
GO

CREATE PROCEDURE uspUserLogin(@Email varchar(255), @Password varchar(255))
	AS
		SELECT [UserID] AS 'User ID',
			   [UserRoleID] AS 'Role ID'
		FROM [dbo].[Users]
		WHERE [Email] = @Email AND [PasswordHash] = @Password
GO