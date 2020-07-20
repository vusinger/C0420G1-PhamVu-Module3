use luyentapsql;

CREATE TABLE dkynhaphoc (
    id INT,
    ten VARCHAR(50),
    tuoi INT,
    khoahoc VARCHAR(50),
    price INT,
    primary key(id)
);

create table student(
id int,
ten varchar(50),
address varchar(50),
date_of_birth varchar(50),
primary key(id)
);

alter table dkynhaphoc
add column student_id1 int,
add constraint student_id1
foreign key (student_id1) references student(id);

insert into student(id,ten,address,date_of_birth)
values (1,'Pham Vu','439 Nguyen Luong Bang','2000-06-17'),
(2,'Pham Vu','439 Nguyen Luong Bang','2000-06-17'),
(3,'Pham Vu','439 Nguyen Luong Bang','2000-06-17'),
(4,'Pham Vu','439 Nguyen Luong Bang','2000-06-17');


insert into dkynhaphoc(id,ten,tuoi,khoahoc,price,student_id1)
values (1,'Hoang',21,'CNTT',400000,1),
(2,'Viet',19,'DTVT',320000,2),
(3,'Thanh',18,'KTDN',400000,3),
(4,'Nhan',19,'CK',450000,4),
(5,'Huong',20,'TCNH',500000,1),
(6,'Huong',20,'TCNH',200000,1)
;

create view `profile`
as
select dk.id,dk.ten,tuoi,date_of_birth
from dkynhaphoc dk
join student
on dk.student_id1 = student.id;

show create view `profile`;
select * from `profile`;
DROP VIEW ` general_v_movie_rentals `;

delimiter //
create procedure find_by_name (varible varchar(50)) begin
select *
from tableName
where tableName.columnName = varible;
end; //
delimiter ;
call find_by_name('Viet');

delimiter //
create procedure procedureName (
	in varible1 varchar(50),
    out varible2 int)
begin
	set varible2 = (
		select count(*)
		from tableName
		where name like concat('%', v_name, '%')
        );
end; //
delimiter ;

drop procedure procedureName;

call procedureName ('o', @abc);
select @abc;

delimiter //
create function sum2num (num1 int, num2 int)
returns int
deterministic
begin
declare total int;
set total = num1 + num2;
return total;
end; //
delimiter ;
select sum2num(3, 4);
-- transaction
insert into type_of_class (id, name)
values (3, 'Night time');
​
delimiter //
create procedure save_class()
begin
start transaction;

insert into class (id, name, type_of_class_id)
values (4, 'I0720G1', null);

if not exists (select 1 from type_of_class where id = 3)then
rollback;
end if;

end; //
delimiter ;
