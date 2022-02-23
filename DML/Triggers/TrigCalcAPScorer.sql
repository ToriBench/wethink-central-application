CREATE TRIGGER trgCALCAPSCORER
ON Results
AFTER insert, delete, update
AS 
    BEGIN 
           Update Students
		   SET APScorer = dbo.udfCalculateAPScore(StudentID)

		   if @@Error <> 0
           begin
           ROLLBACK TRANSACTION
           return
           end
           COMMIT TRANSACTION
    END 


