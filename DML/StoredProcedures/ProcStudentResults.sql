-- Get a list of results for a given student
USE WeThinkDB
GO

CREATE PROCEDURE uspStudentResults( @StudentID int )
AS
SELECT s.Code, s.Name, r.Mark FROM Results as r
INNER JOIN Subjects as s ON r.SubjectID = s.SubjectID
WHERE r.StudentID = @StudentID
GO