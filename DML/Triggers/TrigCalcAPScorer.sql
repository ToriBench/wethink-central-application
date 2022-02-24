CREATE TRIGGER trgCALCAPSCORER
ON Results
AFTER insert, delete, update
AS 
    BEGIN 
           Update [dbo].[Students]
		   SET [ApScore] = dbo.udfCalculateAPScore(StudentID)
		   print('trgCalcApSc triggered successfully')
		   if @@Error <> 0
           begin
		   print('Failed to trigger Calculate Ap scorer')
           ROLLBACK TRANSACTION
           return
           end
           COMMIT TRANSACTION
    END


