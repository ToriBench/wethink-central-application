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
@UserId int
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
@RequirementID int
AS
BEGIN
	   DELETE FROM [dbo].[Requirements]
	   WHERE RequirementID=@RequirementID
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
CREATE PROCEDURE uspDeleteStudentQualification
@StudentID int,
@QualificationID int
AS
BEGIN
	DELETE FROM [dbo].[StudentQualifications]
	WHERE [StudentID] = @StudentID 
	AND [QualificationID] = @QualificationID
END
GO