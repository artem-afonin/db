--
-- Drop database
--
drop database if exists mysql_database;


--
-- Create database
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
-- Task 1
--
select * from cust where cname like '%s';
select sum(amt) from ord;


--
-- Task 2
--
select max(city) from sal;
select min(city) from sal;

select count(distinct snum) from ord;


--
-- Task 3
--
select count(*) from cust;
select count(snum) from cust;
select count(distinct snum) from cust;
select count(all snum) from cust;

select snum, max(amt) from ord group by snum order by snum;


--
-- Task 4
--
select snum, odate, max(amt) from ord group by snum, odate order by snum;
select snum, max(amt) from ord group by snum having max(amt) > 3000 order by snum;


--
-- Task 5
--
select snum, sum(amt) from ord where amt > 2000 group by snum;
select snum, sum(amt) from ord group by snum having sum(amt) > 2000;


--
-- Бригада 8
-- 1. Напишите запрос, который может вывести всех продавцов, чьи города начинаются с буквы, попадающей в диапазон от B до L.
-- 2. Напишите запрос, который выберет всех продавцов, города которых содержат букву a.
-- 3. Напишите запрос, который сосчитал бы сумму всех заказов на 3 и 5 Октября 2021 г.
-- 4. Напишите запрос, который сосчитал бы число городов, в которых размещаются продавцы.
-- 5. Напишите запрос, который выбрал бы среднюю сумму заказа для каждого продавца с номерами 1001, 1002 и 1003.
-- 6. Напишите запрос, который выбрал бы город в таблице Покупателей, чье название является первым в алфавитном порядке среди городов, содержащих букву о.
-- 7. Напишите запрос, который выбрал бы самый ранний заказ каждого покупателя.
--

-- 1
select sname from sal where city between 'B%' and 'L%';
-- 2
select sname from sal where city like '%a%';
-- 3
select sum(amt) from ord where odate between '2021-10-03' and '2021-10-05';
-- 4
select count(distinct city) from sal;
-- 5
select avg(amt) from ord where snum in (1001, 1002, 1003);
-- 6
select min(city) from cust where city like '%o%';
-- 7
select cnum, min(odate) from ord group by cnum order by cnum;
