USE UNIVER;
GO
CREATE FUNCTION COUNT_STUDENTS(@FACULTY NVARCHAR(20)) RETURNS INT AS
BEGIN
DECLARE @COUNT INT=0;
SET @COUNT=(SELECT COUNT(STUDENT.IDSTUDENT)
FROM FACULTY
INNER JOIN GROUPS ON GROUPS.FACULTY = FACULTY.FACULTY
INNER JOIN STUDENT ON STUDENT.IDGROUP = GROUPS.IDGROUP
WHERE FACULTY.FACULTY = @FACULTY)
RETURN @COUNT;
END;
GO
DECLARE @T_1 INT = DBO.COUNT_STUDENTS('���');
PRINT '���������� ���������= ' +CAST(@T_1 AS NVARCHAR(20)); 
GO
ALTER FUNCTION COUNT_STUDENTS (@FACULTY NVARCHAR(20), @PROF NVARCHAR(20)) RETURNS INT AS
BEGIN
DECLARE @COUNT INT=0;
SET @COUNT=(SELECT COUNT(STUDENT.IDSTUDENT)
FROM FACULTY
INNER JOIN GROUPS ON GROUPS.FACULTY = FACULTY.FACULTY
INNER JOIN STUDENT ON STUDENT.IDGROUP = GROUPS.IDGROUP
WHERE FACULTY.FACULTY = @FACULTY AND GROUPS.PROFESSION = @PROF)
RETURN @COUNT;
END;
GO
DECLARE @T_1 INT = DBO.COUNT_STUDENTS('���', '1-48 01 02');
PRINT '���������� ���������= ' + CONVERT(VARCHAR, @T_1);

------------------------------------------------------2>
GO
CREATE FUNCTION FSUBJECTS (@P NVARCHAR(20)) RETURNS NVARCHAR(300) AS
BEGIN
DECLARE @G VARCHAR(300) = '����������: ', @S VARCHAR(20);
DECLARE SUBJECT_CURSOR CURSOR LOCAL FOR
SELECT SUBJECT.SUBJECT '����������'
FROM SUBJECT
WHERE SUBJECT.PULPIT = @P
OPEN SUBJECT_CURSOR
FETCH NEXT FROM SUBJECT_CURSOR INTO @S
WHILE @@FETCH_STATUS = 0
BEGIN
SET @G=@G+RTRIM(@S)+', ';
FETCH SUBJECT_CURSOR INTO @S
END;
RETURN @G;
END;
GO
PRINT DBO.FSUBJECTS('����');
SELECT PULPIT, DBO.FSUBJECTS(PULPIT) '����������' FROM PULPIT;

------------------------------------------------------3>
GO
CREATE FUNCTION FFACPUL(@F VARCHAR(10), @P VARCHAR(10)) RETURNS TABLE
    AS RETURN
    SELECT FACULTY.FACULTY, PULPIT.PULPIT
    FROM FACULTY LEFT OUTER JOIN PULPIT
    ON FACULTY.FACULTY = PULPIT.FACULTY
WHERE FACULTY.FACULTY=ISNULL(@F, FACULTY.FACULTY) AND PULPIT.PULPIT=ISNULL(@P, PULPIT.PULPIT);
GO


SELECT * FROM DBO.FFACPUL(NULL,NULL);
SELECT * FROM DBO.FFACPUL('���',NULL);
SELECT * FROM DBO.FFACPUL(NULL,'����');
SELECT * FROM DBO.FFACPUL('����','��');

------------------------------------------------------4>
GO
CREATE FUNCTION FCTEACHER(@P NVARCHAR(10)) RETURNS INT AS
    BEGIN
        DECLARE @COUNT INT=(SELECT COUNT(*) FROM TEACHER
        WHERE PULPIT=ISNULL(@P, PULPIT));
        RETURN @COUNT;
    END;
GO
SELECT PULPIT, DBO.FCTEACHER(PULPIT) [���������� ��������������] FROM PULPIT;
SELECT DBO.FCTEACHER(NULL) [����� ��������������];

------------------------------------------------------6>
GO
CREATE FUNCTION COUNT_PULPIT(@FACULTY NVARCHAR(10)) RETURNS INT
AS BEGIN
    DECLARE @RC INT=0;
    SET @RC=(SELECT COUNT(*) FROM PULPIT
        WHERE PULPIT.FACULTY=@FACULTY)
    RETURN @RC;
END;
----DROP FUNCTION COUNT_PULPIT;
GO

CREATE FUNCTION COUNT_GROUPS(@FACULTY NVARCHAR(10)) RETURNS INT
AS BEGIN
    DECLARE @RC INT=0;
    SET @RC=(SELECT COUNT(*) FROM GROUPS
        WHERE GROUPS.FACULTY=@FACULTY)
    RETURN @RC;
END;
--DROP FUNCTION COUNT_GROUPS;
GO

CREATE FUNCTION COUNT_PROFESSION(@FACULTY VARCHAR(20)) RETURNS INT
	AS BEGIN
		DECLARE @RC INT = 0;
		SET @RC = (SELECT COUNT(*) FROM PROFESSION
			WHERE PROFESSION.FACULTY = @FACULTY)
		RETURN @RC;
	END;
--DROP FUNCTION COUNT_PROFESSION;
GO
DROP FUNCTION COUNT_STUDENTS
GO
CREATE FUNCTION COUNT_STUDENTS (@FACULTY VARCHAR(20)) RETURNS INT
AS 
 BEGIN 
 DECLARE @RC INT = 0;
		SET @RC = (SELECT COUNT(*) FROM STUDENT
	     JOIN GROUPS ON GROUPS.IDGROUP = STUDENT.IDGROUP
			WHERE GROUPS.FACULTY = @FACULTY)
		RETURN @RC;
 END
 GO

CREATE FUNCTION FACULTY_REPORT(@C INT) RETURNS @FR TABLE
	([���������] VARCHAR(50),
	[���������� ������] INT,
	[���������� �����] INT,
	[���������� ���������] INT,
	[���������� ��������������] INT)
	AS BEGIN
		DECLARE CC CURSOR LOCAL STATIC FOR
			SELECT FACULTY FROM FACULTY WHERE DBO.COUNT_STUDENTS(FACULTY.FACULTY) > @C;
		DECLARE @F VARCHAR(30);
		OPEN CC;
			FETCH CC INTO @F;
		WHILE @@FETCH_STATUS = 0
			BEGIN
				INSERT @FR VALUES(
				@F,
				DBO.COUNT_PULPIT(@F),
	            DBO.COUNT_GROUPS(@F),
				DBO.COUNT_STUDENTS(@F),
				DBO.COUNT_PROFESSION(@F));
	            FETCH CC INTO @F;
			END;
		CLOSE CC;
		DEALLOCATE CC;
		RETURN;
	END;
GO
SELECT * FROM DBO.FACULTY_REPORT(20);
GO
