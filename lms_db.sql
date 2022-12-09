CREATE DEFINER=`root`@`localhost` PROCEDURE `lms_db`(
in _user_id int,
in _username varchar(40), 
in _email varchar(40), 
in _contact int, 
in _pwd varchar(20), 
in _address varchar(70), 
in _pincode int
)
BEGIN
if _user_id is null then
insert into user_details(username,email,contact,pwd,address,pincode)
values (_username,_email,_contact,_pwd,_address,_pincode);
select _user_id = last_insert_id();
else 
update user_details
set
username=_username,
email=_email,
contact=_contact,
pwd=_pwd,
address=_address,
pincode=_pincode
where user_id = _user_id;
end if;
select _user_id as 'user_id';
END
