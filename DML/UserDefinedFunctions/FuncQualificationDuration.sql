USE WeThinkDB
GO

CREATE FUNCTION udfGetQualificationYears (
	@QualificationID int
)
RETURNS varchar(255)
AS
BEGIN
	DECLARE @duration int,
			@returnString varchar(255)

	SELECT @duration = MonthDuration FROM Qualifications WHERE QualificationID = @QualificationID

	IF (@duration/12 > 0) 
		SET	@returnString = CONCAT(CAST(@duration/12 AS varchar(80)),' years');

	IF(@duration%12>0)
		SET @returnString = CONCAT(@returnString,' and ',CAST(@duration%12 AS varchar(80)), 'months.')

	RETURN @returnString
END