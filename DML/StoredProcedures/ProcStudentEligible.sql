USE WeThinkDB
GO

ALTER PROCEDURE [dbo].[uspStudentEligible] (
	@StudentID int
)
AS
	SELECT DISTINCT
		Inst.Institution_Name AS 'Institution',
		Inst.Faculty_Name AS 'Faculty',
		Inst.Course_Name AS 'Course'
	FROM
		vInstitutionsWithCourses AS Inst,
		vStudentsWithResults AS Res,
		vCoursesWithRequirements AS Req,
		vCoursesWithNoRequirements AS noReq
	WHERE
		((Res.StudentID = @StudentID 
		AND Inst.CourseID = Req.CourseID
		AND Res.SubjectID = Req.SubjectID
		AND Req.MinimumMark <= Res.Mark))

		OR
    
		(Inst.CourseID = noReq.CourseID)
		
	ORDER BY
		'Institution'