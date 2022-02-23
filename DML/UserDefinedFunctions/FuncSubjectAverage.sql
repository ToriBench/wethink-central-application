USE WeThinkDB
GO

CREATE FUNCTION udfSubjectAverage (
	@SubjectID int
	)
	RETURNS float
	BEGIN
		DECLARE @result float
		SELECT @result = AVG(CAST(Results.Mark AS float)) FROM Results WHERE Results.SubjectID = @SubjectID

		IF @result IS NULL
			SET @result = 0

	RETURN @result
	END
