select s.name, c.name, t.name
from student s
	inner join class c on s.class_id = c.id
    inner join type_of_class t on c.type_of_class_id = t.id;
    
select s.name, c.name, t.name
from student s
	left join class c on s.class_id = c.id
    left join type_of_class t on c.type_of_class_id = t.id;

select *
from student
full join class;

select *
from student
where id <> 2;

select *
from student
where id in (3, 4);

select *
from student
having id = 3 or id = 4;

select c.name, count(s.class_id) 'number_of_student'
from class c 
	left join student s on c.id = s.class_id
group by c.id
having count(s.class_id) = 0;

select ucase(name)
from student;

select *
from student
order by date_of_birth desc;