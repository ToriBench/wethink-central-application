-- Get Requirements that are not met yet
USE WeThinkDB
GO

IF OBJECT_ID('uspGetRequirementsNotMet', 'P') IS NOT NULL
	DROP PROCEDURE uspGetRequirementsNotMet
GO

CREATE PROCEDURE uspGetRequirementsNotMet(@studentId int, @courseId int)
-- Gets a student's subjects which do not meet the requirements of a particular course
    AS
        SELECT Req.SubjectID
        FROM (
            SELECT [SubjectID], [MinimumMark]
            FROM [dbo].[Requirements]
            WHERE [CourseID] = @courseID
        ) AS Req
        LEFT JOIN (
            SELECT [SubjectID], [Mark]
            FROM [dbo].[Results]
            WHERE StudentID = @studentId
        ) Res
        ON Res.[SubjectID] = Req.[SubjectID]
        WHERE Res.[Mark] < Req.[MinimumMark] OR Res.[SubjectID] IS NULL
        GROUP BY Req.[SubjectID]
GO