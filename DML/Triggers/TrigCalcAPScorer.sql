CREATE TRIGGER trgCALCAPSCORER
ON Results
AFTER insert, delete, update
AS 
    BEGIN 
           Update [dbo].[Students]
		   SET [ApScore] = dbo.udfCalculateAPScore(StudentID)
    END 


