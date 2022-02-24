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