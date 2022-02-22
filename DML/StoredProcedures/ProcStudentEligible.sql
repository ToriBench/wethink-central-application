USE WeThinkDB
GO

CREATE PROCEDURE uspStudentEligible (
	@StudentID int
)
AS
	SELECT DISTINCT
		Institutions.[Name] AS 'Institution',
		Faculties.[Name] AS 'Faculty',
		Qualifications.[Name] AS 'Qualification'
	FROM
		vInstitutionsWithQualifications,
		Requirements
		INNER JOIN
		Subjects ON Subjects.SubjectID = Requirements.SubjectID,
		vStudentsWithResults
	WHERE
		(Students.ApScore >= Qualifications.AP_Score
		AND
		(Results.StudentID = @StudentID 
		AND Qualifications.QualificationID = Requirements.QualificationID
		AND Results.SubjectID = Requirements.SubjectID
		AND Requirements.MinimumMark <= Results.Mark))
		
		OR
		Qualifications.QualificationID NOT IN
		(SELECT Requirements.QualificationID FROM Requirements)

	ORDER BY
		'Institution'