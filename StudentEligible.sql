CREATE FUNCTION StudentEligible (
	@StudentID int
)
RETURNS TABLE
AS
RETURN
	SELECT
		Institutions.[Name] AS 'Institution',
		Faculties.[Name] AS 'Faculty',
		Qualifications.[Name] AS 'Qualification'
	FROM
		Institutions,
		Qualifications,
		Faculties,
		Students,
		Requirements,
		Results,
		Subjects
	WHERE
		(Qualifications.QualificationID = Requirements.QualificationID
		AND Requirements.SubjectID = Subjects.SubjectID AND Requirements.MinimumMark <= Results.Mark
		AND Results.SubjectID = Subjects.SubjectID
		AND Results.StudentID = @StudentID)
		AND Faculties.FacultyID = Qualifications.FacultyID