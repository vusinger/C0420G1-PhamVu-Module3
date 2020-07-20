create database luyentapsql;
use luyentapsql;
CREATE TABLE dkynhaphoc (
    id INT,
    ten VARCHAR(50),
    tuoi INT,
    khoahoc VARCHAR(50),
    price INT
);

insert into dkynhaphoc(id,ten,tuoi,khoahoc,price)
values (1,'Hoang',21,'CNTT',400000),
(2,'Viet',19,'DTVT',320000),
(3,'Thanh',18,'KTDN',400000),
(4,'Nhan',19,'CK',450000),
(5,'Huong',20,'TCNH',500000),
(5,'Huong',20,'TCNH',200000)
;

select * from dkynhaphoc
where ten = 'Huong';

select sum(price) from dkynhaphoc
where ten = 'Huong';

select * from dkynhaphoc
group by ten
having count(ten) >= 1;
