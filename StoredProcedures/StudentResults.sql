-- Get a list of results for a given student

CREATE PROCEDURE StudentResults( @StudentID int )
AS
SELECT s.Code, s.Name, r.Mark FROM Results as r
INNER JOIN Subjects as s ON r.SubjectID = s.SubjectID
WHERE r.StudentID = @StudentID
GO