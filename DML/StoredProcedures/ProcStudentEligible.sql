USE WeThinkDB
GO
CREATE OR ALTER PROCEDURE [dbo].[uspStudentEligible] (
	@StudentID int
)
AS
	SELECT DISTINCT
		vInstitutionsWithCourses.Institution_Name AS 'Institution',
		vInstitutionsWithCourses.Faculty_Name AS 'Faculty',
		vInstitutionsWithCourses.Course_Name AS 'Course'
	FROM
	vInstitutionsWithCourses,
	Requirements
	INNER JOIN
	Subjects ON Subjects.SubjectID= Requirements.SubjectID,
	Students
	INNER JOIN 
	Results ON Students.StudentID = Results.StudentID

	WHERE
	Students.ApScore>= vInstitutionsWithCourses.ApScore
	AND
	(Results.StudentID= @StudentID
	AND vInstitutionsWithCourses.CourseID= Requirements.CourseID
	AND Results.SubjectID= Requirements.SubjectID
	AND Requirements.MinimumMark<= Results.Mark)
	OR vInstitutionsWithCourses.CourseID NOT IN 
	(SELECT Requirements.CourseID FROM Requirements)
		
	ORDER BY
		'Institution'