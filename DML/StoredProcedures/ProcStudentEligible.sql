USE WeThinkDB
GO

ALTER PROCEDURE [dbo].[uspStudentEligible] (
	@StudentID int,
	@Province int
)
AS
	DECLARE @Command varchar(MAX),
			@WhereClause varchar(MAX)

	SET @Command =
		'SELECT DISTINCT
			Inst.Institution_Name AS Institution,
			Inst.Faculty_Name AS Faculty,
			Inst.Course_Name AS Qualification
		FROM
			vInstitutionsWithCourses AS Inst,
			Requirements,
			vCoursesWithRequirements AS Req,
			vStudentsWithResults AS Res,
			vCoursesWithNoRequirements AS noReq,
			vAddressesWithInstitutions AS adds,
			Addresses,
			Institutions
		WHERE'

	SET @WhereClause = 
			'
				(Res.StudentID = @StudentID 
				AND Inst.CourseID = Req.CourseID
				AND Res.SubjectID = Req.SubjectID
				AND Req.MinimumMark <= Res.Mark)
				OR
				Inst.CourseID = noReq.CourseID
			'

	IF(@Province = 1)
	BEGIN
		SET @WhereClause = @WhereClause + 
				'AND
				(Addresses.AddressID = Institutions.AddressID 
				AND Addresses.Province = adds.Province
				AND adds.StudentID = @StudentID
				(SELECT Addresses.Province FROM Addresses, Students
				WHERE Addresses.AddressID = Students.AddressID AND Students.StudentID = @StudentID)
				)'
	END

	SET @Command = @Command + @WhereClause + 
		'ORDER BY
		"Institution"'

	EXECUTE SP_Executesql @Command;