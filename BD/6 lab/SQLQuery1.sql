use UNIVER;

select min(AUDITORIUM_CAPACITY) [Наименьший размер аудитории],
max(AUDITORIUM_CAPACITY) [Наибольший размер аудитории],
avg(AUDITORIUM_CAPACITY) [Средний размер аудитории],
sum(AUDITORIUM_CAPACITY) [Суммарная вместимость],
count(AUDITORIUM_TYPE) [Общее количество аудиторий]
from AUDITORIUM

select AUDITORIUM_TYPENAME,
min(AUDITORIUM_CAPACITY) [Наименьший размер аудитории],
max(AUDITORIUM_CAPACITY) [Наибольший размер аудитории],
avg(AUDITORIUM_CAPACITY) [Средний размер аудитории],
sum(AUDITORIUM_CAPACITY) [Суммарная вместимость],
count(AUDITORIUM) [Общее количество аудиторий]
FROM AUDITORIUM_TYPE inner join AUDITORIUM
on AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE
group by AUDITORIUM_TYPENAME

select *
from(select case when NOTE between 7 and 8 then '7-8'
when NOTE between 4 and 6 then '4-6'
else '9'
end [Оценки], count(*)[Количество]
from PROGRESS group by case
when NOTE between 7 and 8 then '7-8'
when NOTE between 4 and 6 then '4-6'
else '9'
end) as T
order by case [Оценки] 
when '4-6' then 3
when '7-8' then 2
when '9' then 1
else 0
end

select a.FACULTY,
g.PROFESSION,
(2014 - g.YEAR_FIRST) [курс],
round(avg(cast(NOTE as float (4))), 2) as [Средняя оценка]
from FACULTY a
join GROUPS G on a.FACULTY = G.FACULTY
join STUDENT S on G.IDGROUP = S.IDGROUP
join PROGRESS p on S.IDSTUDENT = p.IDSTUDENT
group by a.FACULTY, G.PROFESSION, G.YEAR_FIRST
order by [Средняя оценка] desc

select a.FACULTY,
g.PROFESSION,
(2014 - g.YEAR_FIRST) [курс],
round(avg(cast(NOTE as float (4))), 2) as [Средняя оценка]
from FACULTY a
join GROUPS G on a.FACULTY = G.FACULTY
join STUDENT S on G.IDGROUP = S.IDGROUP
join PROGRESS p on S.IDSTUDENT = p.IDSTUDENT and p.SUBJECT in ('СУБД', 'ОАиП')
group by a.FACULTY, G.PROFESSION, G.YEAR_FIRST
order by [Средняя оценка] desc

select PROFESSION, SUBJECT, avg(NOTE) as [Средняя оценка]
from FACULTY join GROUPS G on FACULTY.FACULTY= G.FACULTY and G.FACULTY = 'ИДиП'
join STUDENT S on G.IDGROUP=S.IDGROUP
join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by G.FACULTY, PROFESSION, rollup(SUBJECT)

select PROFESSION, SUBJECT, avg(NOTE) as [Средняя оценка]
from FACULTY join GROUPS G on FACULTY.FACULTY= G.FACULTY and G.FACULTY = 'ИДиП'
join STUDENT S on G.IDGROUP=S.IDGROUP
join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by cube(G.FACULTY, PROFESSION, SUBJECT)

/*7-------------------------------------------------
---------------------------------------------------*/

select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS  full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='ТОВ'
full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION
UNION
select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='ХТиТ'
full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION

select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS  full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='ТОВ'
full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION
UNION ALL
select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='ХТиТ'
full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION

/*8-------------------------------------------------
---------------------------------------------------*/

select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS  full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='ТОВ'
full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION
UNION
select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='ХТиТ'
full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION
INTERSECT
select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS  full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='ТОВ'
full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION
UNION ALL
select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='ХТиТ'
full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION

/*9-------------------------------------------------
---------------------------------------------------*/
select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS  full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='ТОВ'
full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION
UNION
select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='ХТиТ'
full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION
EXCEPT
select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS  full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='ТОВ'
full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION
UNION ALL
select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='ХТиТ'
full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION

select SUBJECT, NOTE,count(NOTE) as [Количество]
from PROGRESS
group by SUBJECT, NOTE
having NOTE in (8, 9)
order by NOTE desc

