create database codegym_management;

use codegym_management;

create table account_james (
	`account` varchar(50),
    `password` varchar(50),
    
    constraint pk_account_james primary key (`account`)
);

create table instructor (
	id int primary key,
    `name` varchar(60),
    date_of_birth date
);

create table type_of_class (
	id int,
    `name` varchar(20),
    primary key (id)
);

create table class (
	id int primary key,
    `name` char(7),
    type_of_class_id int,
    
    foreign key (type_of_class_id) references type_of_class(id)
);

create table student (
	id int primary key,
    `name` varchar(60),
    date_of_birth date,
    `account` varchar(50),
    class_id int,
    
    foreign key (`account`) references account_james (`account`),
    foreign key (class_id) references class (id)
);


create table instructor_teach_class (
	class_id int,
    instructor_id int,
    
    primary key (class_id, instructor_id),
    foreign key (class_id) references class (id),
    foreign key (instructor_id) references instructor (id)
);

insert into type_of_class
values
(1, 'Full time'),
(2, 'Half time');

insert into class
values
(1, 'C0420G1', 1),
(2, 'C0520G1', 1),
(3, 'C0220H1', 2);

insert into account_james
values
('tien.nguyen', '12345678'),
('toan.le', '12345678'),
('chuong.kim', '12345678'),
('long.duong', '12345678');

insert into student
values
(1, 'Tien', '2000-07-14', 'tien.nguyen', 1),
(2, 'Toan', '2002-05-03', 'toan.le', 2),
(3, 'Chuong', '2001-04-03', 'chuong.kim', 2),
(4, 'Long', '2002-01-25', 'long.duong', null);