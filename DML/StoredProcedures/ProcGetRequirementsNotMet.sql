-- Get Requirements that are not met yet
USE WeThinkDB
GO

IF OBJECT_ID('uspGetRequirementsNotMet', 'P') IS NOT NULL
	DROP PROCEDURE uspGetRequirementsNotMet
GO

CREATE PROCEDURE uspGetRequirementsNotMet(@studentId int, @courseId int)
-- Gets a student's subjects which do not meet the requirements of a particular course
    AS
        SELECT Req.[SubjectID], Req.[Name]
        FROM (
            SELECT Require.[SubjectID], Require.[MinimumMark], Sub.[Name]
            FROM [dbo].[Requirements] as Require
            INNER JOIN [dbo].[Subjects] as Sub
                ON Require.[SubjectID] = Sub.[SubjectID]
            WHERE courseId = @courseId
        ) AS Req
        LEFT JOIN (
            SELECT [SubjectID], [Mark]
            FROM [dbo].[Results]
            WHERE StudentID = @studentId
        ) Res
        ON Res.[SubjectID] = Req.[SubjectID]
        WHERE Res.[Mark] < Req.[MinimumMark] OR Res.[SubjectID] IS NULL
        GROUP BY Req.[SubjectID], Req.[Name]
GO