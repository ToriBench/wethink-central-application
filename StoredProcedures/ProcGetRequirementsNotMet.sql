-- Get Requirements that are not met yet
USE WeThinkDB
GO

IF OBJECT_ID('ProcGetRequirementsNotMet', 'P') IS NOT NULL
	DROP PROCEDURE ProcGetRequirementsNotMet
GO

CREATE PROCEDURE ProcGetRequirementsNotMet(@studentId int, @qualificationId int)
    AS
        SELECT Req.SubjectID
        FROM (
            SELECT SubjectID, MinimumMark
            FROM Requirements
            WHERE QualificationID = @qualificationId
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