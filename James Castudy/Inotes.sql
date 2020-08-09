drop database inotes;
create database inotes;
use inotes;
create table note_type
( id int,
name char(100) COLLATE utf8_vietnamese_ci,
description text COLLATE utf8_vietnamese_ci,
PRIMARY KEY (id)
);
create table note
( id int auto_increment ,
  title char(100) COLLATE utf8_vietnamese_ci,
  content text COLLATE utf8_vietnamese_ci,
  type_id int,
  flag boolean,
  PRIMARY KEY (id),
  FOREIGN KEY (type_id) REFERENCES note_type(id)
);

insert into note_type(id,name)
values(1,'C� Nh�n'),(2,'C�ng Ty');

select * from note;
select * from note_type;