CREATE FUNCTION subjectAverage (
	@SubjectID int
	)
	RETURNS int
	BEGIN
		DECLARE @result int
		SELECT @result = AVG(Results.Mark) FROM Results WHERE Results.SubjectID = @SubjectID
	RETURN @result
	END
