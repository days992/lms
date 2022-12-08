create schema LMS;

create table user_details(user_id int(15) not null auto_increment , username varchar(40) not null, 
email varchar(40) not null, contact int(10) not null, pwd varchar(20) not null,
address varchar(70) not null, pincode int(6) not null, primary key(user_id));
drop table user_details;

create table req(user_id int auto_increment, pdate date, ddate date,
tWear varchar(70), bWear varchar(70), saree varchar(70),
wcloth varchar(70), other varchar(100), service varchar(10),
primary key(user_id));
drop table req;

create table payment(payment_id int(10) not null,order_id int(10) not null,
amount int not null,mode_of_payment varchar(15), payment_date date not null,
primary key(payment_id));

create table items(item_id int not null, order_id int not null,
 qty int not null, primary key(item_id));

create table item_types(item_id int(10) not null, woolen varchar(30),
topwear varchar(30),bottomwear varchar(30),saree varchar(30),
 other varchar(30), primary key(item_id));

create table orders(user_id int(10) not null, 
order_id int(10) not null, order_date timestamp, total_price int,
pickup_date date not null, drop_date date not null, primary key(order_id));

create table order_items(item_id int unique not null, 
order_id int(10) not null, quantity int);

select*from lms.users;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
flush privileges;

insert into user_details(username,email,contact,pwd,address,pincode) 
values('mysql1','my@sequel.com','987654320','dsvhjvb','india','765022');

select * from user_details;
select * from req;

call lms_db('mysql1','email',6853144,'pwd3545','address',654455);
call lms_order('2022-12-01','2022-12-05', 'shirt','pant','saree',null,null);
select * from req;