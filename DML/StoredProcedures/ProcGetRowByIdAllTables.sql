USE WeThinkDB
GO

CREATE PROC GetUserById(@id int)
AS
BEGIN
     Select * from Users where
	 UserID = @id
END
GO

CREATE PROC GetUserRoleById(@id int)
AS
BEGIN
  SELECT * FROM UserRoles 
  WHERE UserRoleID = @id
  END
GO

CREATE PROC GetStudentById(@id int)
AS
BEGIN
  SELECT * FROM Students
  WHERE StudentID = @id
  END
GO

CREATE PROC GetResultsById(@StudentId int, @SubjectId int)
AS
BEGIN 
   SELECT * FROM Results
   WHERE StudentID = @StudentId 
   AND
   SubjectID = @SubjectId
   END
GO

CREATE PROC GetSubjectById(@Id int)
AS
BEGIN
    SELECT * FROM Subjects
	WHERE SubjectID = @Id

	END
GO

CREATE PROC GetAddressById(@Id int)
AS
BEGIN
    SELECT * FROM Addresses
	WHERE AddressID = @Id
	END

GO

CREATE PROC GetInstitutitionById(@Id int)
AS
BEGIN
    SELECT * FROM Institutions
	WHERE InstitutionID = @Id
	END

GO

CREATE PROC GetQualificationById(@Id int)
AS
BEGIN
   SELECT * FROM Qualifications
   WHERE QualificationID = @Id
   END

GO

CREATE PROC GetRequirementById(@QualificationId int, @SubjectId int)
AS
BEGIN 
    SELECT * FROM Requirements
	WHERE QualificationID = @QualificationId
	AND
	SubjectID = @SubjectId
	END

GO