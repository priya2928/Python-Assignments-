create database Linkedin ;
use Linkedin ;

create table AI_Tools (
ID int,
Technology varchar(25)
);

insert into AI_Tools (ID, Technology) values
(1, 'DS'),
(1, 'Tablue'),
(1, 'SQL'),
(2, 'R'),
(2, 'PowerBI'),
(1, 'Python');
select * from AI_Tools ;


create table product_info (
product_id int,
product_nmae varchar(30)
);

insert into product_info (product_id, product_nmae) values
(1001, 'Blog'),
(1002, 'Youtube'),
(1003, 'Education');

create table product_info_likes (
user_id int,
product_id int,
liked_date date
);

insert into product_info_likes (user_id, product_id, liked_date) values
(1, 1001, '2023-08-19'),
(2, 1003, '2023-08-13');

## Q. query to return Ids of the product info that have 0 likes.
select p.product_id from product_info as p
left join product_info_likes as pl on (p.product_id = pl.product_id)
where p.product_id not in (select product_id from product_info_likes) group by 1;
