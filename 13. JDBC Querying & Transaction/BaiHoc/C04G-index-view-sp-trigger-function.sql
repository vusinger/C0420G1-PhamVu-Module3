explain select *
from student
where id = 4;

create index idx_name
on student(name);

explain select *
from student
where name = 'Chuong';

create view student_view
as
select id, name
from student;

select *
from student_view;

insert into student_view
values (99, 'Dang');

insert into temp
values (99, 'Dang');

update temp
set id = 3;

create index idx_temp
on temp(id);

create view student_class_view
as
select student.id, student.name 'student name', class.name 'class name'
from student join class on student.class_id = class.id;

select *
from student_class_view;

delimiter //
create procedure find_by_name (v_name varchar(50))
begin
	select id, `name`, date_of_birth
    from student
    where `name` like concat('%', v_name, '%');
end; //
delimiter ;

call find_by_name('t');

delimiter //
create procedure count_student (
	in v_name varchar(50),
    out result int)
begin
	set result = (
		select count(*)
		from student
		where name like concat('%', v_name, '%')
        );
end; //
delimiter ;

drop procedure count_student;

call count_student ('o', @abc);
select @abc;

delimiter //
create procedure count_student_inout (
	inout result varchar(50))
begin
	set result = (
		select count(*)
		from student
		where name like concat('%', result, '%')
	);
end; //
delimiter ;

drop procedure count_student_inout;

set @abc = 'o';
call count_student_inout (@abc);
select @abc;

-- trigger
delimiter //
create trigger save_account_james
after insert
-- before insert, after update, before, update, after delete, before delete
on student for each row
begin
	insert into account_james
    values (concat(lcase(new.name), '.codegym'), '12345678');
end; //
delimiter ;

insert into student (id, name, date_of_birth)
values (99, 'Khanh', '2020-07-17');

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
