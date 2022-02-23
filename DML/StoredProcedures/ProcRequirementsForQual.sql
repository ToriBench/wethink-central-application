-- Get list of requirements for a given qualification
USE WeThinkDB
GO

CREATE PROCEDURE uspQualificationRequirements( @CourseID int)
AS
SELECT s.Code, s.Name, r.MinimumMark 
FROM Requirements as r 
INNER JOIN Subjects as s ON r.SubjectID = s.SubjectID 
WHERE r.CourseID = @CourseID
GO