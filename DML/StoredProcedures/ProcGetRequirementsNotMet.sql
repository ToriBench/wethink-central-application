-- Get Requirements that are not met yet
USE WeThinkDB
GO

IF OBJECT_ID('uspGetRequirementsNotMet', 'P') IS NOT NULL
	DROP PROCEDURE uspGetRequirementsNotMet
GO

CREATE PROCEDURE uspGetRequirementsNotMet(@studentId int, @courseId int)
    AS
        SELECT Req.SubjectID
        FROM (
            SELECT SubjectID, MinimumMark
            FROM Requirements
            WHERE courseId = @courseId
        ) AS Req
        LEFT JOIN (
            SELECT SubjectID, Mark
            FROM Results
            WHERE StudentID = @studentId
        ) Res
        ON Res.SubjectID = Req.SubjectID
        WHERE Res.Mark < Req.MinimumMark OR Res.SubjectID IS NULL
        GROUP BY Req.SubjectID
GO