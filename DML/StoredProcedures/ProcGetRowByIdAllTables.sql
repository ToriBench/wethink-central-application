USE WeThinkDB
GO

CREATE PROC uspGetUserById(@id int)
AS
BEGIN
     Select * from  [dbo].[Users] where
	 UserID = @id
END
GO

CREATE PROC uspGetUserRoleById(@id int)
AS
BEGIN
  SELECT * FROM  [dbo].[UserRoles]
  WHERE UserRoleID = @id
  END
GO

CREATE PROC uspGetStudentById(@id int)
AS
BEGIN
  SELECT * FROM  [dbo].[Students]
  WHERE StudentID = @id
  END
GO

CREATE PROC uspGetResultsById(@StudentId int, @SubjectId int)
AS
BEGIN 
   SELECT * FROM  [dbo].[Results]
   WHERE StudentID = @StudentId 
   AND
   SubjectID = @SubjectId
   END
GO

CREATE PROC uspGetSubjectById(@Id int)
AS
BEGIN
    SELECT * FROM  [dbo].[Subjects]
	WHERE SubjectID = @Id

	END
GO

CREATE PROC uspGetAddressById(@Id int)
AS
BEGIN
    SELECT * FROM  [dbo].[Addresses]
	WHERE AddressID = @Id
	END

GO

CREATE PROC uspGetInstitutitionById(@Id int)
AS
BEGIN
    SELECT * FROM  [dbo].[Institutions]
	WHERE InstitutionID = @Id
	END

GO

CREATE PROC uspGetQualificationById(@Id int)
AS
BEGIN
   SELECT * FROM  [dbo].[Qualifications]
   WHERE QualificationID = @Id
   END

GO

CREATE PROC uspGetRequirementById(@QualificationId int, @SubjectId int)
AS
BEGIN 
    SELECT * FROM  [dbo].[Requirements]
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