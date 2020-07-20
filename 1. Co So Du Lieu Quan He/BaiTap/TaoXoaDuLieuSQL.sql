create database codgym_danang;
create table student(
id int , name varchar(50), date_of_birth date, primary key (id));
use student;
alter table student
modify id int auto_increment;
insert student(name, date_of_birth)
values ('Pham Vu','2000-06-20')
,('huynh van thinh','2000-06-20');
select * from student;
select name from student;
update student
set name = 'Huynh Van Thinh'
where id = 2;
delete from student 
where id = 3;
delete  from student;
truncate student;
drop table student;
drop database codgym_danang;
