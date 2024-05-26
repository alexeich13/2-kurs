use UNIVER;
select PULPIT_NAME FROM PULPIT, FACULTY
where PULPIT.FACULTY = FACULTY.FACULTY 
and FACULTY.FACULTY in 
(select PROFESSION.FACULTY from PROFESSION
where PROFESSION_NAME like '%технология%'
or PROFESSION_NAME like '%технологии%')

select PULPIT_NAME FROM PULPIT inner join FACULTY
on PULPIT.FACULTY = FACULTY.FACULTY 
and FACULTY.FACULTY in 
(select PROFESSION.FACULTY from PROFESSION
where PROFESSION_NAME like '%технология%'
or PROFESSION_NAME like '%технологии%')

select distinct PULPIT_NAME from PULPIT
inner join FACULTY 
on PULPIT.FACULTY = FACULTY.FACULTY
inner join PROFESSION 
on   FACULTY.FACULTY  = PROFESSION.FACULTY 
where PROFESSION_NAME LIKE '%технологи%'

select AUDITORIUM_TYPE, AUDITORIUM_CAPACITY from AUDITORIUM as a
where AUDITORIUM_CAPACITY = (select top(1) AUDITORIUM_CAPACITY from AUDITORIUM as b
where  b.AUDITORIUM_TYPE= a.AUDITORIUM_TYPE order by AUDITORIUM_CAPACITY desc 
)

select FACULTY_NAME from FACULTY
where not exists (select * from PULPIT where PULPIT.PULPIT_NAME = FACULTY.FACULTY_NAME)

select top 1
(select avg(NOTE) from PROGRESS where PROGRESS.SUBJECT like 'ОАиП')[ОАиП],
(select avg(NOTE) from PROGRESS where PROGRESS.SUBJECT like 'БД')[БД],
(select avg(NOTE) from PROGRESS where PROGRESS.SUBJECT like 'СУБД')[СУБД]
from PROGRESS

select SUBJECT, IDSTUDENT , NOTE from PROGRESS a
where NOTE >=all (select NOTE from PROGRESS
where SUBJECT = a.SUBJECT )

select SUBJECT, NOTE, IDSTUDENT from PROGRESS
where NOTE >=any (select NOTE from PROGRESS
where IDSTUDENT=1019 and SUBJECT='Кг')

