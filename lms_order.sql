CREATE DEFINER=`root`@`localhost` PROCEDURE `lms_order`(
in user_id int,
in pdate date, 
in ddate date, 
in tWear varchar(70),
in bWear varchar(70),
in saree varchar(70), 
in wcloth varchar(70),
in other varchar(70),
in service varchar(10),
in descr varchar(100)
)
BEGIN
insert into req(user_id,pdate,ddate,tWear,bWear,saree,wcloth,other,service,descr)
values(user_id,pdate,ddate,tWear,bWear,saree,wcloth,other,service,descr);
END