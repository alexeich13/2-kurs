DECLARE
@A CHAR = 'À',
@B NVARCHAR(4) = 'ISaT',
@C DATETIME=GETDATE(),
@D TIME,
@E INT,
@F SMALLINT,
@G TINYINT,
@H NUMERIC(12,5);

set @D = GETDATE();

select @E = 2134580797, @F = 34, @G = 8;

PRINT CONVERT(NVARCHAR,@D ) + ' ' + CONVERT(NVARCHAR, @E) + ' '
+ CONVERT(NVARCHAR, @F) + ' '+ CONVERT(NVARCHAR, @G);
SELECT @A Ñèìâîë, @B Ñòðîêà, @C Äàòà;

---------------------2>
declare
@CAPACITY INT = (select sum(AUDITORIUM_CAPACITY)from AUDITORIUM),
@TOTAL INT,
@AVGTOTAL INT,
@TOTALLESS INT,
@PROCENT INT;

if @CAPACITY > 200
begin 
set @TOTAL = (select count(*) from AUDITORIUM);
set @AVGTOTAL = (select avg(AUDITORIUM_CAPACITY)from AUDITORIUM);
set @TOTALLESS = (select count(*) from AUDITORIUM where AUDITORIUM_CAPACITY < @AVGTOTAL);
set @PROCENT = @TOTALLESS * 100 / @TOTAL;
select @CAPACITY [Îáùàÿ âìåñòèìîñòü],
@TOTAL [Êîëè÷åñòâî],
@AVGTOTAL [Ñðåäíÿÿ âìåñòèìîñòü],
@TOTALLESS [Êîë-âî àóäèòîðèé íèæå ñðåäíåãî],
@PROCENT [Ïðîöåíò ìåíüøèõ àóäèòîðèé]
end

else print 'Îáùàÿ âìåñòèìîñòü < 200'

----------------------------------3>
PRINT '×ÈÑËÎ ÎÁÐÀÁÎÒÀÍÍÛÕ ÑÒÐÎÊ: ' + CAST(@@ROWCOUNT AS NVARCHAR);
PRINT 'ÂÅÐÑÈß SQL SERVER: ' + CAST(@@VERSION AS VARCHAR);
PRINT 'ÑÈÑÒÅÌÍÛÉ ÈÄÅÍÒÈÔÈÊÀÒÎÐ ÏÐÎÖÅÑÑÀ: ' + CAST(@@SPID AS NVARCHAR);
PRINT 'ÊÎÄ ÏÎÑËÅÄÍÅÉ ÎØÈÁÊÈ: ' + CAST(@@ERROR AS VARCHAR);
PRINT 'ÈÌß ÑÅÐÂÅÐÀ: ' + CAST(@@SERVERNAME AS VARCHAR);
PRINT 'ÓÐÎÂÅÍÜ ÂËÎÆÅÍÍÎÑÒÈ ÒÐÀÍÇÀÊÖÈÈ: ' + CAST(@@TRANCOUNT AS NVARCHAR);
PRINT 'ÏÐÎÂÅÐÊÀ ÐÅÇÓËÜÒÀÒÀ Ñ×ÈÒÛÂÀÍÈß ÑÒÐÎÊ ÐÅÇÓËÜÒÈÐÓÞÙÅÃÎ ÍÀÁÎÐÀ: ' + CAST(@@FETCH_STATUS AS NVARCHAR);
PRINT 'ÓÐÎÂÅÍÜ ÂËÎÆÅÍÍÎÑÒÈ ÒÅÊÓÙÅÉ ÏÐÎÖÅÄÓÐÛ: ' + CAST(@@NESTLEVEL AS NVARCHAR);

----------------------------------4>
DECLARE 
@Z FLOAT,
@T FLOAT = 13,
@X FLOAT = 9;

IF @T > @X
SET @Z = POWER(SIN(@T), 2);

ELSE IF @T < @X
SET @Z = 4*(@T + @X);

ELSE
SET @Z = 1 - EXP(@X-2);

SELECT @Z;

declare 
@FIRSTNAME nvarchar(15) = 'Àëåêñåé',
@LASTNAME nvarchar(15) = 'Äðîçä',
@FATHERNAME nvarchar(15) = 'Èãîðåâè÷',
@FULLNAME nvarchar (40),
@SMALLNAME nvarchar (10);

set @FULLNAME = @LASTNAME + ' ' + @FIRSTNAME + ' ' + @FATHERNAME

set @FIRSTNAME = substring(@FIRSTNAME, 1,1)+'.';
set @FATHERNAME = substring(@FATHERNAME, 1,1)+'.';
set @SMALLNAME = @LASTNAME + ' ' + @FIRSTNAME + ' ' + @FATHERNAME;

select @FULLNAME [Ïîëíîå èìÿ], @SMALLNAME [Ñîêðàùåííîå èìÿ]

select STUDENT.NAME, STUDENT.BDAY, DATEDIFF(YEAR, STUDENT.BDAY, SYSDATETIME()) AS ÂÎÇÐÀÑÒ
from STUDENT
where MONTH(STUDENT.BDAY) = MONTH(SYSDATETIME()) - 1;

declare @GROUPNUMBER INT = 4;
select STUDENT.NAME, DATENAME(dw, PROGRESS.PDATE) [Äåíü íåäåëè]
from STUDENT 
join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
join  GROUPS on STUDENT.IDGROUP = GROUPS.IDGROUP
where GROUPS.IDGROUP = @GROUPNUMBER and  PROGRESS.SUBJECT = 'ÑÓÁÄ';

----------------------------------5>

declare @MINCAPASITY INT = (select min(AUDITORIUM_CAPACITY) from AUDITORIUM)
if @MINCAPASITY = 30
begin 
print 'Ìèíèìàëüíàÿ âìåñòèìîñòü = 30'
end
else print 'Ìèíèìàëüíàÿ âìåñòèìîñòü > 30'

----------------------------------6>
select (case
when NOTE between 0 and 3 then 'î÷åíü ïëîõî'
when NOTE between 4 and 5 then 'íèæå ñðåäíåãî'
when NOTE between 6 and 7 then 'ñðåäíèé ðåçóëüòàò'
when NOTE between 8 and 10 then 'î÷åíü õîðîøî'
end) Îöåíêè, count(*) [Êîëè÷åñòâî îöåíîê] from PROGRESS
group by (case
when NOTE between 0 and 3 then 'î÷åíü ïëîõî'
when NOTE between 4 and 5 then 'íèæå ñðåäíåãî'
when NOTE between 6 and 7 then 'ñðåäíèé ðåçóëüòàò'
when NOTE between 8 and 10 then 'î÷åíü õîðîøî'
end)

----------------------------------7>
create table #TASK(
	ID INT,
	NAME VARCHAR(20),
	LASTNAME VARCHAR(20)
	)
GO
declare @INDEX INT = 0
while @INDEX < 10
begin
insert #TASK values (@INDEX, 'Èìÿ ' + cast(@INDEX as varchar), 'Ôàìèëèÿ ' + cast(@INDEX as varchar))
set @INDEX += 1
end

select * from #TASK

drop table #TASK;

----------------------------------8>
DECLARE @I INT = 10;
PRINT @I+3;
PRINT POWER(@I,2);
RETURN
PRINT @I+10;

----------------------------------9>
BEGIN TRY
UPDATE PROGRESS SET NOTE = 'Ïðîâåðêà íà îøèáêè' WHERE NOTE = 9
END TRY
BEGIN CATCH
PRINT ERROR_NUMBER() -- êîä ïîñëåäíåé îøèáêè
PRINT ERROR_MESSAGE() -- ñîîáùåíèå îá îøèáêå
PRINT ERROR_LINE() -- êîä ïîñëåäíåé îøèáêè
PRINT ERROR_PROCEDURE() -- èìÿ ïðîöåäóðû èëè NULL
PRINT ERROR_SEVERITY() -- óðîâåíü ñåðüåçíîñòè îøèáêè
PRINT ERROR_STATE() -- ìåòêà îøèáêè
END CATCH

----------------Êàê ðàçäåëèòü ïàêåò ? --------------->