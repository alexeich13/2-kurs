use master;
go
create database DR3_My_Bases on primary
( name = N'DR3_My_Bases', filename = N'C:\BSTU\2 kurs\2 kurs 1 sem\BD\DR3_My_Bases.mdf', 
   size = 10240Kb, maxsize=UNLIMITED, filegrowth=1024Kb),
( name = N'DR3_My_Bases.ndf', filename = N'C:\BSTU\2 kurs\2 kurs 1 sem\BD\DR3_My_Bases.ndf', 
   size = 10240KB, maxsize=1Gb, filegrowth=25%),
  filegroup FG2
( name = N'DR3_My_Bases_fg1_1', filename = N'C:\BSTU\2 kurs\2 kurs 1 sem\BD\DR3_My_Bases_fgq-1.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%),
( name = N'DR3_My_Bases_fg1_2', filename = N'C:\BSTU\2 kurs\2 kurs 1 sem\BD\DR3_My_Bases_fgq-2.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%)
log on
( name = N'DR3_My_Bases.log', filename=N'C:\BSTU\2 kurs\2 kurs 1 sem\BD\DR3_My_Bases.ldf',       
   size=10240Kb,  maxsize=2048Gb, filegrowth=10%)

   