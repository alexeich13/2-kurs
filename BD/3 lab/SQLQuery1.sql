USE master;
CREATE database DR3_My_Base;

use DR3_My_Base
CREATE table ����������(
��� nvarchar(20) primary key,
�������� nvarchar(20),
����� nvarchar(40),
������� nvarchar(20)
);

CREATE table �����(
������� nvarchar(20) primary key,
[�������� ������] nvarchar(40),
[���������� ������� �� ������] int,
���� real not null,
);

CREATE table ��������(
[����� ������] nvarchar(10) primary key,
[���������� ���������� �������] int,
[���� ��������] date,
[��� ����������] nvarchar(20) foreign key references ����������([���]),
���������� nvarchar(30),
[������� ������] nvarchar(20) foreign key references �����(�������),
);

ALTER TABLE ����� ADD �������� nvarchar(20);
ALTER TABLE �������� ADD [���������� ��������] nchar(3) default '��' check ([���������� ��������] in ('��','���'))  
ALTER TABLE ����� DROP column ��������;  

INSERT into ���������� (���, ��������, �����, �������)
values (11002233,'ArmTec','Brest, Belarus',80295678976), 
(44556677,'CarFood','Barcelona, Spain',44667733989),
(66882233,'PartsForCars','Moscow, Russia',70383356723),
(77992255,'Yokohama','Los Angeles, USA',78635498456),
(99887766,'GoodChoose','Warsaw, Poland',56783298545);
INSERT into �����([�������� ������],[���������� ������� �� ������],����,�������)
values ('GT8',200,5000,45638),
('JS1',250,3000,45786),
('JS2',200,4000,98765),
('PGJ19',500,200,54678),
('Yokohama 16R',300,300,34857),
('Yokohama 20R',400,500,29845);
INSERT into ��������([����� ������],[���������� ���������� �������],[���� ��������],[��� ����������],����������,[������� ������])
values (1,150,'2022-09-22',11002233,'����',98765),
(2,100,'2022-09-28',66882233,'�������',45786),
(3,200,'2022-10-25',99887766,'�������',54678),
(4,100,'2022-10-05',11002233,'�����',45638),
(5,50,'2022-10-10',11002233,'����',45638),
(6,200,'2022-10-25',99887766,'�������',29845);

SELECT * FROM ��������;
SELECT [�������� ������], ���� FROM �����;
SELECT count(*) FROM ����������;
SELECT [�������] [������� ������] FROM �����
WHERE ���� > 1000
SELECT Distinct Top(3) �������, ���� FROM ����� Order by ���� Desc;

UPDATE ����� set ���� = ���� + 1 where [�������� ������] = 'JS1';
SELECT [�������� ������], ���� FROM �����;

SELECT distinct [������� ������], [���� ��������] from �������� where [���� ��������] between '2022-09-01' and '2022-10-30'
SELECT [�������� ������] from ����� where [�������� ������] like 'J%'
SELECT distinct [������� ������] from �������� where [���� ��������] in ('2022-10-05','2022-10-10')

select ��������.[������� ������], ����������.�������� [���������]
from �������� inner join ����������
on ����������.��� = ��������.[��� ����������]

select ��������.[������� ������], �����.[�������� ������],
case 
when �����.���� > 500 then '������� �����'
end
from ���������� inner join �������� on ����������.��� = ��������.[��� ����������]
inner join ����� on ��������.[������� ������] = �����.�������
order by case 
when �����.������� = '45638' then 1
end
desc

select [�������� ������] from �����, ��������
where �����.������� = ��������.[������� ������]
and [��� ����������] in 
(select ��� from ����������
where ��� like '11002233')

select [�������� ������] from ����� inner join ��������
on �����.������� = ��������.[������� ������]
and [��� ����������] in 
(select ��� from ����������
where ��� in ('11002233'))

select [�������� ������], ����
from ����� as a
where ���� = (select top(1) ���� from ����� as b
where b.���� = a.����)

select top 1 
(select avg([���������� ���������� �������]) from �������� where ��������.[������� ������] like '98765') [JS2],
(select avg([���������� ���������� �������]) from �������� where ��������.[������� ������] like '45638') [GT8]
from ��������

select [����� ������], [���� ��������], [���������� ���������� �������] from �������� as a
where [���������� ���������� �������] >=any(select [���������� ���������� �������] from �������� 
where a.���������� = '����' )

select min([���������� ������� �� ������]) [����������� ����������],
max([���������� ������� �� ������]) [������������ ����������],
sum([���������� ������� �� ������]) [����� ����������],
avg([���������� ������� �� ������]) [������� ����������]
from �����

select *
from(select case when ���� between 200 and 1000 then '200-1000'
when ���� between 1000 and 4000 then '1000-4000'
else '>4000'
end[���������� ���], count(*)[����������] 
from ����� group by case
when ���� between 200 and 1000 then '200-1000'
when ���� between 1000 and 4000 then '1000-4000'
else '>4000'
end) as T
order by case [���������� ���]
when '200-1000' then 3
when '1000-4000' then 2
when '>4000' then 1
else 0
end

select S.[�������� ������], P.[���� ��������],
round(avg(cast([���������� ���������� �������] as float (4))), 2) as [������� ����������]
from ����� S inner join [��������] P on S.������� = P.[������� ������]
group by S.[�������� ������], P.[���� ��������]

---------------------------7 laba>

create view [������]
as select [�������� ������] [��������],
[���������� ������� �� ������] [����������],
���� [����]
from �����

select * from [������]

create view [���������� ������������ �������]
as select �����.[�������� ������] [��������],
��������.[���������� ���������� �������]
from ����� inner join �������� on 
�����.������� = ��������.[������� ������]
group by �����.[�������� ������], ��������.[���������� ���������� �������]

select * from [���������� ������������ �������]

---------------------------8 laba>
EXEC SP_HELPINDEX '��������' 

SELECT * FROM ��������
WHERE  [����� ������] = 3

CHECKPOINT;
DBCC DROPCLEANBUFFERS

CREATE INDEX #MY_BASE ON ��������([����� ������]);

SELECT * FROM ��������
WHERE [����� ������] = 3

DROP INDEX #MY_BASE ON ��������;

SELECT * FROM ����������
WHERE ��� = 11002233 AND �������� = 'ArmTec'

CREATE INDEX MY_BANK_2 ON ����������(���) INCLUDE(��������)

SELECT * FROM ����������
WHERE ��� = 11002233 AND �������� = 'ArmTec'

DROP INDEX MY_BANK_2 ON ����������;