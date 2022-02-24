-- Get list of requirements for a given qualification
USE WeThinkDB
GO

CREATE PROCEDURE uspCourseRequirements( @CourseID int)
-- Gets the subject requirements of a given course 
AS
	SELECT Sub.[Code], Sub.[Name], Req.[MinimumMark] 
	FROM [dbo].[Requirements] as Req
	INNER JOIN [Subjects] as Sub 
		ON Req.[SubjectID] = Sub.[SubjectID] 
	WHERE Req.[CourseID] = @CourseID
GO