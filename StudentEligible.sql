CREATE FUNCTION StudentEligible (
	@StudentID int
)
RETURNS TABLE
AS
RETURN
	SELECT
		Institutions.[Name] AS 'Institution Name',
		Qualifications.[Name] AS 'Qualification Name'
	FROM
		Institutions,
		Qualifications,
		Students,
		Requirements,
		Results,
		Subjects
	WHERE
		Qualifications.QualificationID = Requirements.QualificationID
		AND Requirements.SubjectID = Subjects.SubjectID AND Requirements.MinimumMark <= Results.Mark
		AND Results.SubjectID = Subjects.SubjectID
		AND Results.StudentID = @StudentID