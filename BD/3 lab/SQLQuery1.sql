USE master;
CREATE database DR3_My_Base;

use DR3_My_Base
CREATE table ПОСТАВЩИКИ(
Код nvarchar(20) primary key,
Название nvarchar(20),
Адрес nvarchar(40),
Телефон nvarchar(20)
);

CREATE table СКЛАД(
Артикул nvarchar(20) primary key,
[Название детали] nvarchar(40),
[Количество деталей на складе] int,
Цена real not null,
);

CREATE table ПОСТАВКИ(
[Номер заказа] nvarchar(10) primary key,
[Количество заказанных деталей] int,
[Дата поставки] date,
[Код поставщика] nvarchar(20) foreign key references ПОСТАВЩИКИ([Код]),
Примечание nvarchar(30),
[Артикул товара] nvarchar(20) foreign key references СКЛАД(Артикул),
);

ALTER TABLE Склад ADD Материал nvarchar(20);
ALTER TABLE ПОСТАВКИ ADD [Бесплатная доставка] nchar(3) default 'да' check ([Бесплатная доставка] in ('да','нет'))  
ALTER TABLE СКЛАД DROP column Материал;  

INSERT into ПОСТАВЩИКИ (Код, Название, Адрес, Телефон)
values (11002233,'ArmTec','Brest, Belarus',80295678976), 
(44556677,'CarFood','Barcelona, Spain',44667733989),
(66882233,'PartsForCars','Moscow, Russia',70383356723),
(77992255,'Yokohama','Los Angeles, USA',78635498456),
(99887766,'GoodChoose','Warsaw, Poland',56783298545);
INSERT into СКЛАД([Название детали],[Количество деталей на складе],Цена,Артикул)
values ('GT8',200,5000,45638),
('JS1',250,3000,45786),
('JS2',200,4000,98765),
('PGJ19',500,200,54678),
('Yokohama 16R',300,300,34857),
('Yokohama 20R',400,500,29845);
INSERT into ПОСТАВКИ([Номер заказа],[Количество заказанных деталей],[Дата поставки],[Код поставщика],Примечание,[Артикул товара])
values (1,150,'2022-09-22',11002233,'Фура',98765),
(2,100,'2022-09-28',66882233,'Самолет',45786),
(3,200,'2022-10-25',99887766,'Корабль',54678),
(4,100,'2022-10-05',11002233,'Поезд',45638),
(5,50,'2022-10-10',11002233,'Фура',45638),
(6,200,'2022-10-25',99887766,'Корабль',29845);

SELECT * FROM ПОСТАВКИ;
SELECT [Название детали], Цена FROM СКЛАД;
SELECT count(*) FROM ПОСТАВЩИКИ;
SELECT [Артикул] [Дорогие товары] FROM СКЛАД
WHERE Цена > 1000
SELECT Distinct Top(3) Артикул, Цена FROM СКЛАД Order by Цена Desc;

UPDATE СКЛАД set Цена = Цена + 1 where [Название детали] = 'JS1';
SELECT [Название детали], Цена FROM СКЛАД;

SELECT distinct [Артикул товара], [Дата поставки] from ПОСТАВКИ where [Дата поставки] between '2022-09-01' and '2022-10-30'
SELECT [Название детали] from СКЛАД where [Название детали] like 'J%'
SELECT distinct [Артикул товара] from ПОСТАВКИ where [Дата поставки] in ('2022-10-05','2022-10-10')

select ПОСТАВКИ.[Артикул товара], ПОСТАВЩИКИ.Название [Поставщик]
from ПОСТАВКИ inner join ПОСТАВЩИКИ
on ПОСТАВЩИКИ.Код = ПОСТАВКИ.[Код поставщика]

select ПОСТАВКИ.[Артикул товара], СКЛАД.[Название детали],
case 
when СКЛАД.Цена > 500 then 'Дорогой товар'
end
from ПОСТАВЩИКИ inner join ПОСТАВКИ on ПОСТАВЩИКИ.Код = ПОСТАВКИ.[Код поставщика]
inner join СКЛАД on ПОСТАВКИ.[Артикул товара] = СКЛАД.Артикул
order by case 
when СКЛАД.Артикул = '45638' then 1
end
desc

select [Название детали] from СКЛАД, ПОСТАВКИ
where СКЛАД.Артикул = ПОСТАВКИ.[Артикул товара]
and [Код поставщика] in 
(select Код from ПОСТАВЩИКИ
where Код like '11002233')

select [Название детали] from СКЛАД inner join ПОСТАВКИ
on СКЛАД.Артикул = ПОСТАВКИ.[Артикул товара]
and [Код поставщика] in 
(select Код from ПОСТАВЩИКИ
where Код in ('11002233'))

select [Название детали], Цена
from СКЛАД as a
where Цена = (select top(1) Цена from СКЛАД as b
where b.Цена = a.Цена)

select top 1 
(select avg([Количество заказанных деталей]) from ПОСТАВКИ where ПОСТАВКИ.[Артикул товара] like '98765') [JS2],
(select avg([Количество заказанных деталей]) from ПОСТАВКИ where ПОСТАВКИ.[Артикул товара] like '45638') [GT8]
from ПОСТАВКИ

select [Номер заказа], [Дата поставки], [Количество заказанных деталей] from ПОСТАВКИ as a
where [Количество заказанных деталей] >=any(select [Количество заказанных деталей] from ПОСТАВКИ 
where a.Примечание = 'Фура' )

select min([Количество деталей на складе]) [Минимальное количество],
max([Количество деталей на складе]) [Максимальное количество],
sum([Количество деталей на складе]) [Общее количество],
avg([Количество деталей на складе]) [Среднее количество]
from СКЛАД

select *
from(select case when Цена between 200 and 1000 then '200-1000'
when Цена between 1000 and 4000 then '1000-4000'
else '>4000'
end[Промежутки цен], count(*)[Количество] 
from СКЛАД group by case
when Цена between 200 and 1000 then '200-1000'
when Цена between 1000 and 4000 then '1000-4000'
else '>4000'
end) as T
order by case [Промежутки цен]
when '200-1000' then 3
when '1000-4000' then 2
when '>4000' then 1
else 0
end

select S.[Название детали], P.[Дата поставки],
round(avg(cast([Количество заказанных деталей] as float (4))), 2) as [Среднее количество]
from СКЛАД S inner join [ПОСТАВКИ] P on S.Артикул = P.[Артикул товара]
group by S.[Название детали], P.[Дата поставки]

---------------------------7 laba>

create view [Детали]
as select [Название детали] [Название],
[Количество деталей на складе] [Количество],
Цена [Цена]
from СКЛАД

select * from [Детали]

create view [Количество поставленных деталей]
as select СКЛАД.[Название детали] [Название],
ПОСТАВКИ.[Количество заказанных деталей]
from СКЛАД inner join ПОСТАВКИ on 
СКЛАД.Артикул = ПОСТАВКИ.[Артикул товара]
group by СКЛАД.[Название детали], ПОСТАВКИ.[Количество заказанных деталей]

select * from [Количество поставленных деталей]

---------------------------8 laba>
EXEC SP_HELPINDEX 'ПОСТАВКИ' 

SELECT * FROM ПОСТАВКИ
WHERE  [Номер заказа] = 3

CHECKPOINT;
DBCC DROPCLEANBUFFERS

CREATE INDEX #MY_BASE ON ПОСТАВКИ([Номер заказа]);

SELECT * FROM ПОСТАВКИ
WHERE [Номер заказа] = 3

DROP INDEX #MY_BASE ON ПОСТАВКИ;

SELECT * FROM ПОСТАВЩИКИ
WHERE Код = 11002233 AND Название = 'ArmTec'

CREATE INDEX MY_BANK_2 ON ПОСТАВЩИКИ(Код) INCLUDE(Название)

SELECT * FROM ПОСТАВЩИКИ
WHERE Код = 11002233 AND Название = 'ArmTec'

DROP INDEX MY_BANK_2 ON ПОСТАВЩИКИ;