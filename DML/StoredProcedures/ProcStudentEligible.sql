USE WeThinkDB
GO

CREATE PROCEDURE [dbo].[uspStudentEligible] (
	@StudentID int,
	@Province int
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
		[dbo].[Subjects] ON Subjects.SubjectID = Requirements.SubjectID,
		vStudentsWithResults,
		[dbo].[Addresses]
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
		(@Province = 1
		AND
		Addresses.AddressID = Institutions.AddressID 
		AND Addresses.Province = 
		(SELECT Addresses.Province FROM [dbo].[Addresses], [dbo].[Students]
		WHERE Addresses.AddressID = Students.AddressID AND Students.StudentID = @StudentID)
		)
		
	ORDER BY
		'Institution'