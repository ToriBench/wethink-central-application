CREATE PROCEDURE StudentEligible (
	@StudentID int
)
AS
	SELECT DISTINCT
		Institutions.[Name] AS 'Institution',
		Faculties.[Name] AS 'Faculty',
		Qualifications.[Name] AS 'Qualification'
	FROM
		Qualifications
		INNER JOIN Faculties ON Qualifications.FacultyID = Faculties.FacultyID 
		INNER JOIN Institutions ON Institutions.InstitutionID = Qualifications.InstitutionID,
		Requirements
		INNER JOIN
		Subjects ON Subjects.SubjectID = Requirements.SubjectID,
		Students
		INNER JOIN Results ON Results.StudentID = Students.StudentID
	WHERE
		(Results.StudentID = @StudentID 
		AND Qualifications.QualificationID = Requirements.QualificationID
		AND Results.SubjectID = Requirements.SubjectID
		AND Requirements.MinimumMark <= Results.Mark)
		
		OR
		Qualifications.QualificationID NOT IN
		(SELECT Requirements.QualificationID FROM Requirements)

	ORDER BY
		'Institution'

