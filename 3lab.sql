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


select snum, sname, comm * 100 '%' from sal;


--
-- Task 1
--
select 'Продавец', sname, 'имеет номер', snum from sal; 
select sname 'Продавец', snum 'имеет номер' from sal; 

select amt, odate, cnum from ord order by cnum desc;


--
-- Task 2
--
select amt, odate, cnum from ord order by cnum desc, 1 desc;

select cname, sname, sal.city from sal, cust where sal.city = cust.city;


--
-- Task 3
--
select cname, sname, sal.city from sal, cust where sal.city = cust.city and sal.city != 'London';

select first.cname, second.cname, first.rating from cust first, cust second where first.rating = second.rating order by rating asc;


--
-- Task 4
--
select first.cname, second.cname, first.rating from cust first, cust second where first.rating = second.rating and first.cname < second.cname order by rating asc;

select b.cnum, b.cname FROM sal a, cust b where a.snum = 1004 and b.city = a.city;


--
-- Task 5
--
select b.cnum, b.cname FROM sal a, cust b where a.sname = 'Serres' and b.city = a.city;

select sname, sal.snum, a.cname, b.cname from cust a, cust b, sal where a.snum = b.snum and sal.snum = a.snum;
select sname, sal.snum, a.cname, b.cname from cust a, cust b, sal where a.snum = b.snum and sal.snum = a.snum and a.cname < b.cname;

select * from ord where snum = 1004;
select * from ord where snum = (select snum from sal where sname = 'Motica');


--
-- Task 6
--
select * from ord where cnum = (select cnum from cust where cname = 'Grass');

select * from ord where snum in (select snum from sal where city = 'London');


--
-- Task 7
--
select * from ord where cnum in (select cnum from cust where cname = 'Grass');

select rating, COUNT(cnum) from cust group by rating having rating > (select avg(rating) from cust);


--
-- Task 8
--
select rating, count(cnum) from cust where city = 'San Jose' group by rating having rating > (select avg(rating) from cust);


-- Бригада 8  
-- 1. Напишите запрос, который вывел бы для каждого заказа его номер, стоимость заказа в евро (1$=0.85 евро), имя покупателя и его рейтинг. Данные вывести для покупателей, размещенных не в Лондоне и не в Риме. После стоимости заказа вставьте поясняющую фразу – “евро”.
-- 2. Выведите стоимости заказов, выполненных не 4 и не 6 Октября, в убывающем порядке, а также имена продавцов и покупателей каждого заказа.
-- 3. Напишите запрос, который вывел бы имена   покупателей в алфавитном порядке, размещенных не в Лондоне и не в Барселоне, и суммарные значения сделанных ими заказов.
-- 4. Выведите номера заказов, их стоимость и имена   продавцов и покупателей, причем продавцы и покупатели должны размещаться в городах, чьи названия начинаются с букв из диапазона от L до R.
-- 5. Запросите все пары покупателей, обслуживаемые одним и тем же продавцом. Исключите комбинации покупателей с самими собой, а также дубликаты строк, выводящие пары в обратном порядке.
-- 6. С помощью подзапроса выведите имена всех покупателей, чьи продавцы имеют комиссионные меньше .13.
-- 7. Запросите общие суммы заказов для каждого продавца, у которого эта общая сумма больше, чем максимальный заказ в таблице.

-- 1
select ord.onum, ord.amt * 0.85 'euro', cust.cname, cust.rating from ord, cust where ord.cnum = cust.cnum and cust.city not in ('London', 'Rome');
-- 2
select ord.amt, sal.sname, cust.cname from ord, sal, cust where ord.odate not in ('2021-10-04', '2021-10-06') and ord.snum = sal.snum and ord.cnum = cust.cnum order by ord.amt desc;
-- 3
select cust.cname, cust.city, sum(ord.amt) from cust, ord where cust.cnum = ord.cnum and cust.city not in ('London', 'Barcelona') group by cust.cname, cust.city order by cust.cname;
-- 4
select ord.onum, ord.amt, sal.sname, cust.cname, sal.city from ord, sal, cust where ord.cnum = cust.cnum and ord.snum = sal.snum and cust.city = sal.city and cust.city between 'L%' and 'S%';
-- 5
select cust1.cname, cust2.cname from cust cust1, cust cust2 where cust1.snum = cust2.snum and cust1.cname < cust2.cname;
-- 6
select cust.cname from cust where cust.snum in (select sal.snum from sal where sal.comm < 13);
-- 7
select sal.snum, sal.sname, sum(ord.amt) from ord, sal where ord.snum = sal.snum group by sal.snum, sal.sname having sum(ord.amt) > (select max(ord.amt) from ord);














