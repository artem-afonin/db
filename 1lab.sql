--
-- Task 1
--
create database mysql_database;
use mysql_database;


--
-- Create tables
--   
create table sal(
	snum int(4) not null,
	sname varchar(10) not null,
	city varchar(10) not null,
	comm double(7, 2) not null,
	primary key (snum)
);

create table cust(
	cnum int(4) not null,
    cname varchar(10) not null,
    city varchar(10) not null,
    rating int(6) not null,
    snum int(5),
    primary key (cnum)
);

create table ord(
	onum int(4) not null,
    amt double(7, 2) not null,
    odate date not null,
    cnum int(4),
    snum int(4),
    primary key (onum)
);


--
-- Insert data
--
insert into sal values(1001, 'Peel', 'London', 0.12);
insert into sal values(1002, 'Serres', 'San Jose', 0.13); 
insert into sal values(1004, 'Motica', 'London', 0.11);
insert into sal values(1007, 'Rifkin', 'Barcelona', 0.15);
insert into sal values(1003, 'Axelrod', 'New York', 0.10);

insert into cust values(2001, 'Hoffman', 'London', 100, 1001); 
insert into cust values(2002, 'Giovanni', 'Rome', 200, 1003); 
insert into cust values(2003, 'Liu', 'San Jose', 200, 1002); 
insert into cust values(2004, 'Grass', 'Berlin', 300, 1002); 
insert into cust values(2006, 'Clemens', 'London', 100, 1001); 
insert into cust values(2008, 'Cisneros', 'San Jose', 300, 1007); 
insert into cust values(2007, 'Pereira', 'Rome', 100, 1004); 

insert into ord values(3001, 18.69, '2021-10-03', 2008, 1007);
insert into ord values(3003, 767.19,  '2021-10-03', 2001, 1001);
insert into ord values(3002, 1900.10, '2021-10-03', 2007, 1004);
insert into ord values(3005, 5160.45, '2021-10-03', 2003, 1002);
insert into ord values(3006, 1098.16, '2021-10-03', 2008, 1007);
insert into ord values(3009, 1713.23, '2021-10-04', 2002, 1003);
insert into ord values(3007, 75.75,   '2021-10-04', 2004, 1002);
insert into ord values(3008, 4723.00, '2021-10-05', 2006, 1001);
insert into ord values(3010, 1309.95, '2021-10-06', 2004, 1002);
insert into ord values(3011, 9891.88, '2021-10-06', 2006, 1001);


-- 
-- validate inserted data
-- 
select * from sal;
select * from cust;
select * from ord;


--
-- Task 2
--
select city from sal;
select distinct city from sal;

select * from cust where city = 'San Jose';

desc ord;


--
-- Task 3
--   
select * from cust where rating != 200;

select * from cust where city = 'San Jose' and rating > 200;


--
-- Task 4
--
select * from cust where not city = 'San Jose' or rating > 200;

select * from cust where not (city = 'San Jose' or rating > 200);

select * from sal where city in ('Barcelona', 'London');


--
-- Task 5
--
select * from sal where comm between 0.10 and 0.12;


--
-- Task 6
--
select * from sal where comm between 0.12 and 0.10;


--
-- Final task
--
-- Бригада 8
-- 1. Напишите запрос, который выводит все строки из таблицы Продавцов, для которых комиссионные строго больше 0.11.
-- 2. Напишите запрос, который выводит суммы заказов, номера продавцов и покупателей для всех строк из таблицы Заказов.
-- 3. Напишите запрос, который выводит оценку (rating), сопровождаемую именем каждого покупателя в городе Рим.
-- 4. Напишите запрос, который выводит значения дат заказов из таблицы Заказов без каких бы то ни было повторений.
-- 5. Напишите запрос, который может выдать вам поля sname и city для всех продавцов не из Барселоны с комиссионными строго больше 0.12.
-- 6. Напишите запрос к таблице Покупателей, чей вывод может включить всех покупателей с оценкой строго больше 100, если они не находятся в Риме.
-- 7. Запросите двумя способами все заказы на 4 и 6 Октября 1990 г.

-- 1
select * from sal where comm > 0.11;

-- 2
select amt, snum, cnum from ord;

-- 3
select rating, cname from cust where city = 'Rome';

-- 4
select distinct odate from ord;

-- 5
select sname, city from sal where city != 'Barcelona' and comm > 0.12;

-- 6
select cname from cust where rating > 100 and city != 'Rome';

-- 7
select * from ord where odate in('2021-10-04', '2021-10-06');
select * from ord where odate = '2021-10-04' or odate = '2021-10-06';
