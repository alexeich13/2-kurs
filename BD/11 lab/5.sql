use UNIVER;
GO
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
SELECT * FROM SUBJECT WHERE SUBJECT = 'สั';
-------------------------- T1 ------------------
-------------------------- T2 -----------------
SELECT * FROM SUBJECT WHERE SUBJECT = 'สั';
COMMIT TRAN;
rollback