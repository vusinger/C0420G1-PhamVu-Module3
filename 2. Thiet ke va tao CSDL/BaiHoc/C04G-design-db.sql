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