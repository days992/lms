create schema LMS;

create table user_details(user_id int(15) not null auto_increment , username varchar(40) not null, 
email varchar(40) not null, contact int(10) not null, pwd varchar(20) not null,
address varchar(70) not null, pincode int(6) not null, primary key(user_id));

create table req(user_id int not null, pdate date, ddate date,
tWear varchar(70), bWear varchar(70), saree varchar(70),
wcloth varchar(70), other varchar(100), service varchar(10),
descr varchar(100),primary key(user_id));

select * from user_details;

select * from req;
select last_value(user_id)over()uid from user_details;

call lms_db('mysql1','email',6853144,'pwd3545','address',654455);
call lms_order(1,'2022-12-01','2022-12-05', 'shirt','pant',null,'blanket',null,'wet',null);
