USE WeThinkDB
GO

CREATE PROCEDURE uspStudentEligible (
	@StudentID int
)
AS
	SELECT DISTINCT
		Institutions.[Name] AS 'Institution',
		Faculties.[Name] AS 'Faculty',
		Courses.[Name] AS 'Course'
	FROM
		vInstitutionsWithCourses,
		Requirements
		INNER JOIN
		Subjects ON Subjects.SubjectID = Requirements.SubjectID,
		vStudentsWithResults
	WHERE
		(Students.ApScore >= Courses.AP_Score
		AND
		(Results.StudentID = @StudentID 
		AND Courses.CourseID = Requirements.CourseID
		AND Results.SubjectID = Requirements.SubjectID
		AND Requirements.MinimumMark <= Results.Mark))
		
		OR
		Courses.CourseID NOT IN
		(SELECT Requirements.CourseID FROM Requirements)

	ORDER BY
		'Institution'