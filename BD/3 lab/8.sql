use DR3_My_Bases;
go
   CREATE table NEWDETAILS
(     NEWDETAILS char(20) primary key,              
      NEWDETAILS_TYPE nvarchar(50),
      NEWDETAILS_CAPACITY int default 1 check (NEWDETAILS_CAPACITY between 1 and 300),  
      NEWDETAILS_NAME  varchar(50)                                     
) on FG2;