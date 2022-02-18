CREATE FUNCTION subjectAverage (
	@SubjectID int
	)
	RETURNS float
	BEGIN
		DECLARE @result float
		SELECT @result = AVG(CAST(Results.Mark AS float)) FROM Results WHERE Results.SubjectID = @SubjectID
	RETURN @result
	END
