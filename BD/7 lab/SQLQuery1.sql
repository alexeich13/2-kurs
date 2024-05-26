use UNIVER;
go 

create view [ПРЕПОДАВАТЕЛЬ]
 as select TEACHER [Код],
 TEACHER_NAME [Имя преподавателя],
 GENDER [Пол],
 PULPIT [Код кафедры]
 from TEACHER

SELECT * FROM [Преподаватель]



