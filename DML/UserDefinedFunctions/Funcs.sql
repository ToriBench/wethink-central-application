-- Calculate AP Score for a student input StudentID Return APScore
USE WeThinkDB
GO

IF OBJECT_ID('udfCalculateAPScore') IS NOT NULL
    DROP FUNCTION udfCalculateAPScore
GO

CREATE FUNCTION udfCalculateAPScore(@StudentID int)
    RETURNS int
    AS
    BEGIN
    RETURN(
        SELECT SUM(APScore) AS 'AP Score'
        FROM (
            SELECT
                (CASE
                    WHEN TopMarks.Mark >= 80 THEN 7
                    WHEN TopMarks.Mark >= 70 AND TopMarks.Mark < 80 THEN 6
                    WHEN TopMarks.Mark >= 60 AND TopMarks.Mark < 70 THEN 5
                    WHEN TopMarks.Mark >= 50 AND TopMarks.Mark < 60 THEN 4
                    WHEN TopMarks.Mark >= 40 AND TopMarks.Mark < 50 THEN 3
                    WHEN TopMarks.Mark >= 30 AND TopMarks.Mark < 40 THEN 2
                    WHEN TopMarks.Mark < 30 THEN 1
                END) AS APScore
            FROM (SELECT TOP 7 Mark 
                    FROM [dbo].[Results]
                    WHERE StudentID = @StudentID
                ) AS TopMarks
        ) AS APScores)
    END
GO

CREATE FUNCTION udfGetCourseYears (
	@CourseID int
)
RETURNS varchar(255)
AS
BEGIN
	DECLARE @duration int,
			@returnString varchar(255)

	SELECT @duration = MonthDuration FROM Courses WHERE CourseID = @CourseID

	IF (@duration/12 > 0) 
		SET	@returnString = CONCAT(CAST(@duration/12 AS varchar(80)),' years');

	IF(@duration%12>0)
		SET @returnString = CONCAT(@returnString,' and ',CAST(@duration%12 AS varchar(80)), 'months.')

	RETURN @returnString
END
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
