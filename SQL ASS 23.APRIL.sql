use ineuron ;
select * from city_table ;

## Q.1 Query all columns for all American cities in the CITY table with populatins larger than 100000 .
# the countrycode for american is USA .
# Ans :
select * from city_table where countrycode = 'USA' and population > 100000 ;

## Q.2 Query the name field for all American cities in the city table with populations larger than 120000 
# The countrycode for America is USA.
# Ans :
select Name from city_table where countrycode = 'USA' and population > 120000 ;

## Q.3 Query all columns(attributes) for every row in the city table.
select * from city_table ;

## Q.4 Query all columns for a city in city with the ID 1661.
select * from city_table where Id = '1661' ;

## Q.5 Query all attributes of every japanese city in the city table. the countrycode for japan is JPN
select * from city_table where countrycode = 'JPN' ;

## Q.6 Query the names of all the japanese cities in the city table. The countrycode for japan is JPN 
select name from city_table where countrycode = 'JPN' ; 

select * from stationdata ;
## Q.7 Query a list of city and state from the station table
select  city, state from stationdata ;

## Q.8 Query a list of city name station for cities that have an even ID number. Print the results 
# in any order, but exclude duplicates from the answer. 
select  distinct(city) from stationdata 
where mod(Id, 2) = 0
 order by city asc ;

## Q9. Find the difference between the total number of CITY entries in the table and the number of
# distinct CITY entries in the table.
select count(city) -count(distinct(city)) from stationdata ;

## Q10. Query the two cities in STATION with the shortest and longest CITY names, as well as their
# respective lengths (i.e.: number of characters in the name). If there is more than one smallest or
# largest city, choose the one that comes first when ordered alphabetically.
select city , length(city)  from stationdata order by 2 desc , city asc limit 1 ;
select city , length(city) from stationdata order by 2 asc , city desc limit 1 ;


##Q11. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result
# cannot contain duplicates.
select distinct(city) from stationdata where city like 'a%' or city like 'e%'  or city like 'i%' or city like 'o%'
 or city like 'u%' ;

select * from stationdata ;

## Q12. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot
# contain duplicates.
select distinct(city) from stationdata where city like '%a' or city like '%e'  or city like '%i' or city like '%o'
 or city like '%u' ;

## Q13. Query the list of CITY names from STATION that do not start with vowels. Your result cannot
# contain duplicates.
select distinct(city) from stationdata where upper(substr(city, 1, 1)) not in ('A' , 'E' , 'I' , 'O' ,'U')
and lower(substr(city, 1, 1)) not in ('a' , 'e' , 'i' , 'o' ,'u') ;

## Q14. Query the list of CITY names from STATION that do not end with vowels. Your result cannot
# contain duplicates.
select distinct(city) from stationdata where upper(substr(city, length(city), 1)) not in ('A' , 'E' , 'I' , 'O' ,'U')
and lower(substr(city, length(city) , 1)) not in ('a' , 'e' , 'i' , 'o' ,'u') ;

## Q15. Query the list of CITY names from STATION that either do not start with vowels or do not end
# with vowels. Your result cannot contain duplicates.
select distinct(city) from stationdata where lower(substr(city, 1, 1)) not in ('a' , 'e' , 'i' , 'o' ,'u') 
 or lower(substr(city, length(city) , 1)) not in ('a' , 'e' , 'i' , 'o' ,'u') ;

## Q16. Query the list of CITY names from STATION that do not start with vowels and do not end with
# vowels. Your result cannot contain duplicates.
select distinct(city) from stationdata where lower(substr(city, 1, 1)) not in ('a' , 'e' , 'i' , 'o' ,'u') 
 and lower(substr(city, length(city) , 1)) not in ('a' , 'e' , 'i' , 'o' ,'u') ;


## Q.17 Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is,
# between 2019-01-01 and 2019-03-31 inclusive.
# Return the result table in any order
create table product (
product_id int ,
product_name varchar(30),
unit_price int,
primary key (product_id)
);

create table sales (
seller_id int,
product_id int,
buyer_id int,
sale_date date,
quantity int,
price int );

insert into product(product_id, product_name, unit_price) values
(1, 'S8', 1000),
(2, 'G4', 800),
(3, 'iPhone', 1400);

insert into sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values
(1, 1, 1, '2019-01-21', 2, 2000),
(1, 2, 2, '2019-02-17', 1, 800),
(2, 2, 3, '2019-06-02' , 1, 800),
(3, 3, 4, '2019-05-13', 2, 2800);

select product_id, product_name from product
where product_id  not in (select product_id from sales where sale_date not between '2019-01-01' and '2019-03-31' );

## Q.18 Write an SQL query to find all the authors that viewed at least one of their own articles.
# Return the result table sorted by id in ascending order.
create table views (
article_id int,
author_id int,
viewer_id int,
view_date date );

insert into views(article_id, author_id, viewer_id, view_date) values
(1, 3, 5, '2019-08-01'),
(1, 3, 6, '2019-08-02'),
(2, 7, 7, '2019-08-01'),
(2, 7, 6, '2019-08-02'),
(4, 7, 1, '2019-07-22'),
(3, 4, 4, '2019-07-21'),
(3, 4, 4, '2019-07-21');
select * from views ;

select author_id 
from views where author_id = viewer_id ;

## Q.19 Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal
# places
create table Delivery (
delivery_id int,
customer_id int,
order_date date,
customer_pref_delivery_date date ,
primary key (delivery_id)
);

insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values
(1, 1, '2019-08-01', '2019-08-02'),
(2, 5, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-11'),
(4, 3, '2019-08-24', '2019-08-26'),
(5, 4, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13');
select * from Delivery ;


select round(100*d2.immediate_orders/count(d1.delivery_id),2) as immediate_percentage from Delivery as d1 ,
(select count(order_date) as immediate_orders from Delivery
where (order_date = customer_pref_delivery_date)) as d2 ;


## Q.20 Write an SQL query to find the ctr of each Ad. Round ctr to two decimal points.
# Return the result table ordered by ctr in descending order and by ad_id in ascending order in case of a
# tie.
create table Ads (
ad_id int,
user_id int,
action enum ('clicked', 'viewed', 'Ignored'),
primary key (ad_id, user_id)
);

insert into Ads(ad_id, user_id, action) values
(1, 1, 'Clicked'),
(2, 2 ,'Clicked'),
(3, 3, 'Viewed'),
(5, 5, 'Ignored'),
(1, 7, 'Ignored'),
(2, 7, 'Viewed'),
(3, 5, 'Clicked'),
(1, 4, 'Viewed'),
(2, 11, 'Viewed'),
(1, 2, 'Clicked');
select * from Ads ;

select ad_id, round(avg(case when action = 'clicked' then 1 else 0 end)* 100, 2) ctr from ads
group by ad_id order by ad_id , ctr desc ;

## Q.21 Write an SQL query to find the team size of each of the employees.
# Return result table in any order
create table employee(
employee_id int,
team_id int,
primary key (employee_id)
);

insert into employee(employee_id, team_id) values
(1, 8),
(2, 8),
(3, 8),
(4, 7),
(5, 9),
(6, 9) ;
select * from employee ;

select e1.employee_id , count(e2.employee_id) as team_size from employee e1
inner join employee e2 on (e1.team_id = e2.team_id)
 group by e1.employee_id , e2.team_id;

## Q.22 Write an SQL query to find the type of weather in each country for November 2019.
# The type of weather is:
# ● Cold if the average weather_state is less than or equal 15,
# ● Hot if the average weather_state is greater than or equal to 25, and
# ● Warm otherwise.
#Return result table in any order

create table countries (
country_id int,
country_name varchar(25),
primary key(country_id)
);

insert into countries(country_id, country_name) values
(2, 'USA'),
(3, 'Australia'),
(7, 'Peru'),
(5, 'china'),
(8, 'Morocco'),
(9, 'Spain');
select * from countries ;

create table Weather(
country_id int,
weather_state int,
day date,
primary key (country_id, day)
 );

insert into Weather (country_id, weather_state, day) values
(2, 15, '2019-11-01'),
(2, 12, '2019-10-28'),
(2, 12, '2019-10-27'),
(3, -2, '2019-11-10'),
(3, 0 ,'2019-11-11'),
(3, 3, '2019-11-12'),
(5, 16, '2019-11-07'),
(5, 18, '2019-11-09'),
(5, 21, '2019-11-23'),
(7, 25, '2019-11-28'),
(7, 22, '2019-12-01'),
(7 ,20, '2019-12-02'),
(8, 25, '2019-11-05'),
(8 ,27, '2019-11-15'),
(8, 31, '2019-11-25'),
(9, 7, '2019-10-23'),
(9, 3, '2019-12-23');
select * from Weather ;

select  c.country_name, w.country_id,
       case 
       when weather_state <= 15 then 'Cold'
       when weather_state >= 25 then 'Hot'
       else 'warm'
       end as weather_type
       from weather as w 
inner join countries as c on (c.country_id = w.country_id)
where left(w.day, 7) = '2019-11'
group by country_name ;

## Q.23 Write an SQL query to find the average selling price for each product. average_price should be
# rounded to 2 decimal places.
# Return the result table in any order.
create table prices (
product_id int,
start_date date,
end_date date,
price int,
primary key (product_id, start_date, end_date)
);

insert into prices(product_id, start_date, end_date, price) values
(1, '2019-02-17', '2019-02-28',  5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);

create table Unitsolds (
product_id int,
purchase_date date, 
units int
);

insert into Unitsolds(product_id, purchase_date, units) values 
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);
select * from Unitsolds ;

select product_id,round(sum(a)/sum(units),2) as average_price from
    (select 
        p.product_id as product_id,
        price,units,
        price*units as a
    from Prices p 
    left join UnitSolds u
    on p.product_id=u.product_id and (purchase_date<=end_date and purchase_date>=start_date))t
    group by product_id;

## Q.24 Write an SQL query to report the first login date for each player.
# Return the result table in any order.
create table Activity(
player_id int,
device_id int,
event_date date,
games_played int,
primary key (player_id, event_date)
);

insert into Activity(player_id, device_id, event_date, games_played) values 
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);
select * from activity ;

select player_id, min(event_date) as first_login
from Activity 
group by player_id ;

## Q.25 Write an SQL query to report the device that is first logged in for each player.
# Return the result table in any order.
SELECT
    player_id,
    device_id FROM Activity
WHERE (player_id, event_date) IN (SELECT player_id, MIN(event_date) FROM Activity GROUP BY player_id );
                                   
## Q.26 Write an SQL query to get the names of products that have at least 100 units ordered in February 2020
# and their amount.
# Return result table in any order 
create table products(
product_id int,
product_name varchar(30),
product_category varchar(30),
primary key(product_id)
);

insert into products(product_id, product_name, product_category) values
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt'); 

create table orders(
product_id int,
order_date date,
unit int
);

insert into orders (product_id, order_date, unit) values
(1, '2020-02-05', 60),
(1, '2020-02-10', 70),
(2, '2020-01-18', 30),
(2, '2020-02-11', 80),
(3, '2020-02-17', 2),
(3, '2020-02-24', 3),
(4, '2020-03-01', 20),
(4, '2020-03-04', 30),
(4, '2020-03-04', 60),
(5, '2020-02-25', 50),
(5, '2020-02-27', 50),
(5, '2020-03-01', 50);
select * from orders ;

select p.product_name, sum(unit) as unit
from Products as p
left join Orders O
on p.product_id = O.product_id
where O.order_date between '2020-02-01' and '2020-02-29' 
group by p.product_id
having sum(unit) >= 100 ;

 


## Q.27 Write an SQL query to find the users who have valid emails.
# A valid e-mail has a prefix name and a domain where:
# ● The prefix name is a string that may contain letters (upper or lower case), digits, underscore
# '_', period '.', and/or dash '-'. The prefix name must start with a letter.
# ● The domain is '@leetcode.com'.
# Return the result table in any order.
create table users (
user_id int,
name varchar(25),
mail varchar(25),
primary key (user_id)
);

insert into users(user_id,name, mail) values
(1, 'Winston', 'winston@leetcode.com'),
(2, 'Jonathan', 'jonathanisgreat'),
(3, 'Annabelle', 'bella-@leetcode.com'),
(4, 'Sally', 'sally.come@leetcode.com'),
(5, 'Marwan', 'quarz#2020@leetcode.com'),
(6 ,'David' ,'david69@gmail.com'),
(7, 'Shapiro', '.shapo@leetcode.com');

SELECT *
FROM Users
WHERE REGEXP_LIKE(mail, '^[a-zA-Z][a-zA-Z0-9\_\.\-]*@leetcode.com');

## Q.28 Write an SQL query to report the customer_id and customer_name of customers who have spent at
# least $100 in each month of June and July 2020.
# Return the result table in any order
create table customers(
customer_id int,
name varchar(40),
country varchar(40),
primary key(customer_id)
);

insert into customers (customer_id, name, country) values
(1, 'Winston', 'USA'),
(2, 'Jonathan', 'Peru'),
(3, 'Moustafa', 'Egypt');

create table product1(
product_id int,
description varchar(30),
price int,
primary key (product_id)
);

insert into product1 (product_id, description, price) values
(10, 'LC Phone', 300),
(20, 'LC T-Shirt', 10),
(30, 'LC Book', 45),
(40, 'LC Keychain', 2);

create table orders1 (
order_id int,
customer_id int,
product_id int,
order_date date,
quantity int,
primary key (order_id));

insert into orders1(order_id, customer_id, product_id, order_date, quantity) values
(1, 1, 10, '2020-06-10', 1),
(2, 1, 20, '2020-07-01', 1),
(3, 1, 30, '2020-07-08', 2),
(4, 2, 10, '2020-06-15', 2),
(5, 2, 40, '2020-07-01', 10),
(6, 3, 20, '2020-06-24', 2),
(7, 3, 30, '2020-06-25', 2),
(9, 3, 30 ,'2020-05-08', 3);

select o.customer_id, c.name
from Customers c, Product1 p, Orders1 o
where c.customer_id = o.customer_id and p.product_id = o.product_id
group by o.customer_id
having 
(
    sum(case when o.order_date like '2020-06%' then o.quantity*p.price else 0 end) >= 100
    and
    sum(case when o.order_date like '2020-07%' then o.quantity*p.price else 0 end) >= 100
);

## Q.29 

create table TVprogram (
program_date date,
program_time int,
content_id int,
channel varchar(35),
primary key (program_date, content_id)
);

insert into TVprogram (program_date, program_time, content_id, channel) values 
('2020-06-10', 08:00, 1, 'LC-Channel'),
('2020-05-11', 12:00, 2, 'LC-Channel'),
('2020-05-12', 12:00, 3, 'LC-Channel'),
('2020-05-13' , 14:00, 4, 'Disney Ch'),
('2020-06-18', 14:00, 4, 'Disney Ch'),
('2020-07-15', 16:00, 5, 'Disney Ch');

create table content(
content_id int,
title varchar(30),
Kids_content enum('Y', 'N') ,
content_type varchar(30),
primary key (content_id)
);

insert into content (content_id, title, kids_content, content_type) values
(1, 'Leetcode Movie', 'N', 'Movies'),
(2, 'Alg. for Kids', 'Y', 'Series'),
(3, 'Database Sols', 'N', 'Series'),
(4, 'Aladdin', 'Y', 'Movies'),
(5, 'Cinderella', 'Y' ,'Movies');

select distinct title
from Content 
join TVProgram using(content_id)
where kids_content = 'Y' 
	and content_type = 'Movies' 
	and (month(program_date), year(program_date)) = (6, 2020) ;


## Q.30 Write an SQL query to find the npv of each query of the Queries table.
# Return the result table in any order.
create table NPV(
id int,
year int,
npv int,
primary key (id, year)
);

create table queries(
id int,
year int,
primary key (id, year)
);

insert into NPV(id, year, npv) values 
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);

insert into Queries(id, year) values
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

select q.id, q.year, ifnull(n.npv,0) as npv
from queries as q
left join npv as n
on (q.id, q.year) = (n.id, n.year) ;


## Q.31 Write an SQL query to find the npv of each query of the Queries table.
# Return the result table in any order
select q.id, q.year, ifnull(n.npv,0) as npv
from queries as q
left join npv as n
on (q.id, q.year) = (n.id, n.year) ;

## Q.32 Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just
# show null.
# Return the result table in any order.
create table employees (
id int,
name varchar(20),
primary key (id)
);

create table employeeUNI(
id int,
unique_id int,
primary key (id, unique_id)
);

insert into employees (id, name) values
(1, 'Alice'),
(7, 'Bob'),
(11, 'Meir'),
(90, 'Winston'),
(3, 'Jonathan');

insert into employeeUNI (id, unique_id) values
(3, 1),
(11, 2),
(90, 3);

select unique_id, name
from Employees
left join EmployeeUNI
on if (Employees.id = EmployeeUNI.id, Employees.id, null) ;

## Q.33 Write an SQL query to report the distance travelled by each user.
# Return the result table ordered by travelled_distance in descending order, if two or more users
# travelled the same distance, order them by their name in ascending order.

create table Users1( 
id int,
name varchar(30),
primary key (id)
);


create table Rides (
id int,
user_id int,
distance int,
primary key (id)
);

insert into users1 (id, name) values
(1, 'Alice'),
(2, 'Bob'),
(3, 'Alex'),
(4, 'Donald'),
(7, 'Lee'),
(13, 'Jonathan'),
(19, 'Elvis');

insert into Rides (id, user_id, distance) values
(1, 1, 120),
(2, 2, 317),
(3, 3, 222),
(4, 7, 100),
(5, 13, 312),
(6, 19, 50),
(7, 7, 120),
(8, 19, 400),
(9, 7, 230);

SELECT
    u.name,
    IFNULL(SUM(distance),0) as travelled_distance
FROM Users1 as u LEFT JOIN Rides as r
ON r.user_id = u.id
GROUP BY 1
ORDER BY 2 DESC, 1 ASC;


## Q.34 Write an SQL query to get the names of products that have at least 100 units ordered in February 2020
# and their amount.
# Return result table in any order.

select p.product_name, sum(unit) as unit
from Products as p
left join Orders O
on p.product_id = O.product_id
where O.order_date between '2020-02-01' and '2020-02-29' 
group by p.product_id
having sum(unit) >= 100 ;

## Q. 35 Write an SQL query to:
# ● Find the name of the user who has rated the greatest number of movies. In case of a tie,
# return the lexicographically smaller user name.
# ● Find the movie name with the highest average rating in February 2020. In case of a tie, return
# the lexicographically smaller movie name.

create table movies(
movie_id int,
title varchar(30),
primary key (movie_id)
);

create table Users2(
user_id int,
name varchar(30),
primary key (user_id)
);

create table  MovieRating(
movie_id int,
user_id int,
rating int,
created_at date,
primary key(movie_id, user_id) 
);

insert into movies (movie_id, title) values
(1, 'Avengers'),
(2, 'Frozen 2'),
(3, 'Joker');

insert into Users2(user_id, name) values 
(1, 'Daniel'),
(2, 'Monica'),
(3, 'Maria'),
(4, 'James');

insert into MovieRating(movie_id ,user_id, rating ,created_at) values
(1, 1, 3, '2020-01-12'),
(1, 2, 4, '2020-02-11'),
(1, 3, 2, '2020-02-12'),
(1, 4, 1, '2020-01-01'),
(2, 1, 5, '2020-02-17'),
(2, 2, 2, '2020-02-01'),
(2, 3, 2, '2020-03-01'),
(3, 1, 3, '2020-02-22'),
(3, 2, 4, '2020-02-25');


(select name results
from Users2
left join MovieRating
using (user_id)
group by user_id
order by count(rating) desc, name
limit 1)

union

(select title
from Movies
left join MovieRating
using(movie_id)
where left(created_at,7) = '2020-02'
group by movie_id
order by avg(rating) desc, title
limit 1) ;

## Q.36 Write an SQL query to report the distance travelled by each user.
# Return the result table ordered by travelled_distance in descending order, if two or more users
# travelled the same distance, order them by their name in ascending order.

create table Users1( 
id int,
name varchar(30),
primary key (id)
);


create table Rides (
id int,
user_id int,
distance int,
primary key (id)
);

insert into users1 (id, name) values
(1, 'Alice'),
(2, 'Bob'),
(3, 'Alex'),
(4, 'Donald'),
(7, 'Lee'),
(13, 'Jonathan'),
(19, 'Elvis');

insert into Rides (id, user_id, distance) values
(1, 1, 120),
(2, 2, 317),
(3, 3, 222),
(4, 7, 100),
(5, 13, 312),
(6, 19, 50),
(7, 7, 120),
(8, 19, 400),
(9, 7, 230);

SELECT
    u.name,
    IFNULL(SUM(distance),0) as travelled_distance
FROM Users1 as u LEFT JOIN Rides as r
ON r.user_id = u.id
GROUP BY 1
ORDER BY 2 DESC, 1 ASC;

## Q.37 Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just
# show null
create table employees (
id int,
name varchar(20),
primary key (id)
);

create table employeeUNI(
id int,
unique_id int,
primary key (id, unique_id)
);

insert into employees (id, name) values
(1, 'Alice'),
(7, 'Bob'),
(11, 'Meir'),
(90, 'Winston'),
(3, 'Jonathan');

insert into employeeUNI (id, unique_id) values
(3, 1),
(11, 2),
(90, 3);

select unique_id, name
from Employees
left join EmployeeUNI
on if (Employees.id = EmployeeUNI.id, Employees.id, null) ;
