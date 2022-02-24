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