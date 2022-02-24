-- Get a list of results for a given student
USE WeThinkDB
GO

-- Gets a student's results 
CREATE PROCEDURE uspStudentResults( @StudentID int )
AS
	SELECT s.[Code], s.[Name], r.[Mark] FROM [dbo].[Results] as r
	INNER JOIN [dbo].[Subjects] as s ON r.[SubjectID] = s.[SubjectID]
	WHERE r.[StudentID] = @StudentID
GO