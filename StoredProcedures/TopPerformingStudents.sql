USE WeThinkDB
GO

IF OBJECT_ID('TopPerformingStudents') IS NOT NULL
	DROP PROCEDURE TopPerformingStudents
GO


CREATE PROCEDURE TopPerformingStudents (
	@SubjectID int
)
AS
	SELECT TOP 10
		Mark as 'Marks',
		[FirstName] as 'Name',
		[LastName] as 'LastName',
		Students.[UserID] as 'UserID',
		Students.[StudentID] as 'StudentID'
	FROM dbo.Results, dbo.Students, dbo.Users
	WHERE
		SubjectID = @SubjectID
		AND Results.StudentID = Students.StudentID
		AND Users.UserID = Students.UserID
	ORDER BY Mark DESC;
RETURN
GO
