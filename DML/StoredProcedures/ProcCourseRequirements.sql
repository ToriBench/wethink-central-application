-- Get list of requirements for a given qualification
USE WeThinkDB
GO

CREATE PROCEDURE uspCourseRequirements( @CourseID int)
-- Gets the subject requirements of a given course 
AS
	SELECT s.Code, s.Name, r.MinimumMark 
	FROM [dbo].[Requirements] as r 
	INNER JOIN [Subjects] as s ON r.[SubjectID] = s.[SubjectID] 
	WHERE r.[CourseID] = @CourseID
GO