use UNIVER;
go 
create procedure PSUBJECT 
as 
begin
declare @k int = (select count(*) from SUBJECT);
select SUBJECT [���], SUBJECT_NAME [����������], PULPIT [�������] from SUBJECT;
return @k;
end

declare @o int = 0;
exec @o = PSUBJECT;
print '��� - �� �������� = ' + cast(@o as varchar(3));

drop procedure PSUBJECT;

-----------------------------------2>
go
alter procedure PSUBJECT @p varchar(20) = null, @c int output
as
begin
declare @k int = (select count(*) from SUBJECT)
select SUBJECT.SUBJECT[���],SUBJECT.SUBJECT_NAME[����������],SUBJECT.PULPIT[�������] FROM SUBJECT
where SUBJECT.PULPIT = @p;
set @c = @@ROWCOUNT;
return @k;
end
declare @n int, @a int = 0;
exec @n = PSUBJECT '����', @a output;
print cast(@n as nvarchar(4))
print cast(@a as nvarchar(4))


-----------------------------------3>
go
alter procedure PSUBJECT @p nvarchar(20)
as 
begin
declare @k int = (select count(*) from SUBJECT)
select SUBJECT.SUBJECT[���],SUBJECT.SUBJECT_NAME[����������],SUBJECT.PULPIT[�������] FROM SUBJECT
where SUBJECT.PULPIT = @p;
end

create table #SUBJECT (
SUBJECT  char(10) primary key, 
SUBJECT_NAME varchar(100) unique,
PULPIT  char(20) )
insert #SUBJECT exec PSUBJECT @p = '����'
select * from #SUBJECT

-----------------------------------4>
go
create procedure PAUDITORIUM_INSERT 
@a char(20), @n varchar(50), @c int = 0, @t char(10)
as declare @l int = 1;
begin try
	insert into AUDITORIUM(AUDITORIUM,AUDITORIUM_TYPE,AUDITORIUM_CAPACITY,AUDITORIUM_NAME)
	values (@a,@n,@c,@t)
	return @l;
end try
begin catch
	print '�����:' + cast(error_number() as varchar(6));
	print '���������: ' + error_message();
	print '�������: ' + cast(error_severity() as varchar(6));
	print '�����: ' + cast(error_state() as varchar(8));
	print '����� ������: ' + cast(error_line() as varchar(8));
	if ERROR_PROCEDURE() is not null
		print '��� ���������: ' + error_procedure();
		return -1;
end catch

declare @out int;
exec @out = PAUDITORIUM_INSERT @a = '315-1',@n =  '��-�', @c =15, @t =  'd';
print '��� ������: ' + cast(@out as varchar(5)) 

-----------------------------------5>
go
create procedure SUBJECT_REPORT @p char(10) 
as 
begin 
try 
declare @sb char(20), @t char(300) = '', @n int = 0;
declare curs cursor for 
select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT = @p;
if not exists(Select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT = @p)
raiserror('������',11,1);
else
open curs
fetch curs into @sb;
while @@FETCH_STATUS = 0
begin
set @t = rtrim(@sb) + ',' + @t;
set @n += 1;
fetch curs into @sb;
end;
print @t;
close curs
return @n;
end try 
begin  catch
print '������ � ����������'
if ERROR_PROCEDURE() is null
print '��� ���������: ' + error_procedure();
return @n;
end catch;

declare @rd int;
exec @rd = SUBJECT_REPORT @p = '���';
print '���-�� ���������: ' + cast(@rd as nvarchar(5))
drop procedure SUBJECT_REPORT

-----------------------------------6>

go
create procedure PAUDITORIUM_INSERTX @tn varchar(50), @a char(20),@c int = 0,  @n varchar(50),@t  char(10)
as
begin 
try
declare @l int = 0
set transaction isolation level SERIALIZABLE;
begin tran 
insert into AUDITORIUM_TYPE(AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME)
values (@t,@tn);
exec @l = PAUDITORIUM_INSERT @a,@n,@c,@t;
commit tran;
return @l;
end try
begin catch
print '�����: ' + cast(error_number() as varchar(6));
print '���������: ' + error_message();
print '�������: ' + cast(error_severity() as varchar(6));
print '�����: ' + cast(error_state() as varchar(8));
print '����� ������: ' + cast(error_line() as varchar(8));
if error_procedure() is not null
print '��� ���������: ' + error_procedure();
if @@TRANCOUNT > 0 rollback tran;
return -1;
end catch;
	
declare @m int;
exec @m = PAUDITORIUM_INSERTX @a = '��', @n = '2',@c = 15, @t = '��-�' ,@tn = '���������';
print '���-�� = ' + cast(@m as varchar(3))

select * from AUDITORIUM_TYPE
