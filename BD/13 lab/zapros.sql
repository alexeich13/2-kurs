use UNIVER;
go
create procedure PS @p nvarchar(20)
as 
begin
select AUDITORIUM_TYPENAME FROM AUDITORIUM_TYPE as a1 inner join AUDITORIUM as a2 on a1.AUDITORIUM_TYPE = a2.AUDITORIUM_TYPE 
WHERE AUDITORIUM_NAME = @p;
end;
go
declare @p nvarchar(20) = '206-1';
exec PS @p;
drop procedure PS;

go 
create function PC(@p nvarchar(20)) returns nvarchar(20)
as
begin 
declare @n nvarchar(20) = ' ';
set @n = (select AUDITORIUM_TYPENAME FROM AUDITORIUM_TYPE as a1 inner join AUDITORIUM as a2 on a1.AUDITORIUM_TYPE = a2.AUDITORIUM_TYPE 
WHERE AUDITORIUM = @p);
return @n;
end;
go
declare @T_1 nvarchar(20) = dbo.PC('206-1')
print @T_1;
drop function PC;