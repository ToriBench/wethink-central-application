USE WeThinkDB
GO

CREATE PROC uspGetUserById(@id int)
AS
BEGIN
     Select * from Users where
	 UserID = @id
END
GO

CREATE PROC uspGetUserRoleById(@id int)
AS
BEGIN
  SELECT * FROM UserRoles 
  WHERE UserRoleID = @id
  END
GO

CREATE PROC uspGetStudentById(@id int)
AS
BEGIN
  SELECT * FROM Students
  WHERE StudentID = @id
  END
GO

CREATE PROC uspGetResultsById(@StudentId int, @SubjectId int)
AS
BEGIN 
   SELECT * FROM Results
   WHERE StudentID = @StudentId 
   AND
   SubjectID = @SubjectId
   END
GO

CREATE PROC uspGetSubjectById(@Id int)
AS
BEGIN
    SELECT * FROM Subjects
	WHERE SubjectID = @Id

	END
GO

CREATE PROC uspGetAddressById(@Id int)
AS
BEGIN
    SELECT * FROM Addresses
	WHERE AddressID = @Id
	END

GO

CREATE PROC uspGetInstitutitionById(@Id int)
AS
BEGIN
    SELECT * FROM Institutions
	WHERE InstitutionID = @Id
	END

GO

CREATE PROC uspGetQualificationById(@Id int)
AS
BEGIN
   SELECT * FROM Qualifications
   WHERE QualificationID = @Id
   END

GO

CREATE PROC uspGetRequirementById(@QualificationId int, @SubjectId int)
AS
BEGIN 
    SELECT * FROM Requirements
	WHERE QualificationID = @QualificationId
	AND
	SubjectID = @SubjectId
	END

GO
CREATE PROC uspGetCourseById(@ID int)
AS 
BEGIN
    SELECT * FROM [dbo].[Courses]
	WHERE CourseID = @ID
	END

GO