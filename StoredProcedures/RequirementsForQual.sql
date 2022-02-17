-- Get list of requirements for a given qualification

CREATE PROCEDURE QualificationRequirements( @QualificationID int)
AS
SELECT s.Code, s.Name, r.MinimumMark 
FROM Requirements as r 
INNER JOIN Subjects as s ON r.SubjectID = s.SubjectID 
WHERE r.QualificationID = @QualificationID
GO;