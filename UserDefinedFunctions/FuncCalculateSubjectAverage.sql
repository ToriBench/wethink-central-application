-- Calculate an average for a Subject
USE WeThinkDB
GO

IF OBJECT_ID('[dbo].[CalculateSubjectAverage]') IS NOT NULL
    DROP FUNCTION [dbo].[CalculateSubjectAverage]
GO

CREATE FUNCTION [dbo].[CalculateSubjectAverage](@subjectId int)
    RETURNS decimal
    AS
    BEGIN
        DECLARE @avg decimal
        SELECT @avg = ROUND(AVG(Mark), 2)
        FROM Results
        WHERE SubjectID = @subjectId;
        RETURN @avg
    END
GO