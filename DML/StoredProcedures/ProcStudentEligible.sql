USE WeThinkDB
GO

CREATE PROCEDURE [dbo].[uspStudentEligible] (
	@StudentID int NOT NULL,
	@City int NULL
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
		vStudentsWithResults,
		Addresses
	WHERE

		(Students.ApScore >= Courses.ApScore
		AND
		((Results.StudentID = @StudentID 
		AND Courses.CourseID = Requirements.CourseID
		AND Results.SubjectID = Requirements.SubjectID
		AND Requirements.MinimumMark <= Results.Mark)

		OR
		Courses.CourseID NOT IN
		(SELECT Requirements.CourseID FROM Requirements)))

		AND
		(CASE @City
			WHEN 1 THEN
				Addresses.AddressID = Institutions.InstitutionID 
				AND LOWER(Addresses.City) = LOWER(Students.City) 
				AND Students.StudentID = @StudentID
		)
		
	ORDER BY
		'Institution'