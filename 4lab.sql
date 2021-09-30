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


-- 1) Вывести сумму всех заказов покупателей из города London
select city, sum(cost)
from orders
         inner join customers on orders.cid = customers.id
where city = 'London';

-- 2) Показать все пары имён продавцов и покупателей, которые совершили сделку 3го октября любого года (исключить повторения)
select customers.name, salesmen.name
from orders
         inner join customers on orders.cid = customers.id
         inner join salesmen on orders.sid = salesmen.id
where odate like '%-10-03';

-- 3) Отобразить имена городов, в которых средняя стоимость заказа покупателя больше, чем в целом по миру.
--    Также отобразить саму среднюю стоимость заказа.
select city, avg(cost)
from orders
         inner join customers on orders.cid = customers.id
group by city
having avg(cost) > (select avg(cost) from orders);

-- 4) Выведите максимальный рейтинг покупателя на каждый день
select odate, max(rating)
from orders
         inner join customers on orders.cid = customers.id
group by odate
order by odate;

-- 5) Выведите среднюю стоимость заказа и название города, в котором совершают покупки покупатели с самым низким средним рейтингом
-- все средние рейтинги городов
select city, avg(rating)
from customers
group by city;

-- минимальный средний рейтинг
select min(avg_rating)
from (
         select avg(rating) as avg_rating
         from customers
         group by city
     ) as city_avg_rating;

-- имена городов с минимальным средним рейтингом
select city
from customers
group by city
having avg(rating) in
       (select min(avg_rating)
        from (
                 select avg(rating) as avg_rating
                 from customers
                 group by city
             ) as city_avg_rating);

-- имя города с минимальным средним рейтингом и средняя стоимость заказа для этого города
select city, avg(cost)
from orders
         inner join customers on orders.cid = customers.id
where city in (select city
               from customers
               group by city
               having avg(rating) =
                      (select min(avg_rating)
                       from (
                                select avg(rating) as avg_rating
                                from customers
                                group by city
                            ) as city_avg_rating))
group by city;

-- 6) Вывести сумму заказов для каждого продавца, у которого сумма больше средней цены заказа покупателей из города San Jose
select salesmen.name, sum(cost)
from orders
         inner join salesmen on orders.sid = salesmen.id
group by salesmen.name
having sum(cost) > (select avg(cost)
                    from orders
                             inner join customers on orders.cid = customers.id
                    where customers.city = 'San Jose'
                    group by customers.city);

-- 7) Имена всех покупателей, которые осуществляли заказы у продавцов из Barcelona
select distinct customers.name
from orders
         inner join customers on orders.cid = customers.id
         inner join salesmen on orders.sid = salesmen.id
where salesmen.city = 'Barcelona';
