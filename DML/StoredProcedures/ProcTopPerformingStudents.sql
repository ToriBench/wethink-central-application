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
