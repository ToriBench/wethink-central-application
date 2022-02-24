-- Get a list of results for a given student
USE WeThinkDB
GO

-- Gets a student's results 
CREATE PROCEDURE uspStudentResults( @StudentID int )
AS
	SELECT Sub.[Code], Sub.[Name], Res.[Mark] FROM [dbo].[Results] as Res
	INNER JOIN [dbo].[Subjects] as Sub 
		ON Res.[SubjectID] = Sub.[SubjectID]
	WHERE Res.[StudentID] = @StudentID
GO