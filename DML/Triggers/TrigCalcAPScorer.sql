CREATE TRIGGER trgCALCAPSCORER
ON Results
AFTER insert, delete, update
AS 
    BEGIN 
           Update [dbo].[Students]
		   SET [ApScore] = dbo.udfCalculateAPScore(StudentID)

		   if @@Error <> 0
           begin
           ROLLBACK TRANSACTION
           return
           end
           COMMIT TRANSACTION
    END 


