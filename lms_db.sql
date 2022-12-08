CREATE DEFINER=`root`@`localhost` PROCEDURE `lms_db`(
in user_id int,
in username varchar(40), 
in email varchar(40), 
in contact int, 
in pwd varchar(20), 
in address varchar(70), 
in pincode int
)
BEGIN
if user_id is null then
insert into user_details(username,email,contact,pwd,address,pincode)
values (username,email,contact,pwd,address,pincode);
select last_insert_id() as user_id;
else 
update user_details
set
username=username,
email=email,
contact=contact,
pwd=pwd,
address=address,
pincode=pincode;
end if;
END