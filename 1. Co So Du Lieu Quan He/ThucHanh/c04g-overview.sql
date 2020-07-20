create database codegym_management;

use codegym_management;

create table student (
	id int,
    name varchar(50),
    date_of_birth date
);

alter table student
modify id int primary key auto_increment;

insert into student (name, date_of_birth)
values
('Tien', '2000-07-13'),
('Toan', '2001-07-13');

select name
from student;

update student
set name = 'Thanh Tien'
where id = 1;

delete from student
where id = 1;

delete from student;

truncate table student;

drop table student;

drop database codegym_management;

