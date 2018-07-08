create table students (
id int primary key auto_increment,
name varchar(32),
age int ,
sid int ,
birth date ,
status varchar(5)
);
create table school (
id int primary key auto_increment,
name varchar(32),
location varchar(32) 
);
select * from  students;

delete from  students where id=2;


truncate students;

select  * from  school;
select * from students;

	select s.id as sid ,s.name as sname ,s.age as sage ,s.birth as sbirth ,s.status as status ,c.id as did ,c.name as dname, c.location as location  from students s ,school c  where  s.sid=c.id 
