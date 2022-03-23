/*   
Module7-file1
*/

create database new_lco;
use new_lco;


create table users(
	id int auto_increment PRIMARY KEY,
	name varchar(30),
	email varchar(60)

);

create table purchases(
	id int auto_increment PRIMARY KEY,
	order_date DATE,
	amount int,
	user_id int,
	FOREIGN KEY(user_id) REFERENCES users(id)

);

desc users;
desc purchases;


insert into users(name,email) values('san','san@gmil.com'),('kalai','kalai@gmail.com'),('malar','malar@gmail.com'),
('hari','hari@gmail.com'),('kevin','kevin@gmail.com');


select * from users;


insert into purchases(order_date,amount,user_id)
values('2019-04-23',199,2),
values('2020-01-22',299,5),
values('2020-05-20',399,3);

select * from purchases;








