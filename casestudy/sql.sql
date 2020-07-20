#Task 1:
drop database if exists case_study;
create database case_study;
use case_study;

create table positions (
position_id int auto_increment primary key,
position_name enum('L? Tân', 'Ph?c V?', 'Chuyên Viên', 'Giám Sát', 'Qu?n Lý', 'Giám Ð?c')
);
insert into positions values (1, 'L? Tân'), (2, 'Ph?c V?'), (3, 'Chuyên Viên'), (4, 'Giám Sát'), (5, 'Qu?n Lý'), (6, 'Giám Ð?c');
create table eduBackgrounds (
edu_bg_id int auto_increment primary key,
edu_degree enum('Trung C?p', 'Ð?i H?c', 'Cao Ð?ng', 'Sau Ð?i H?c')
);
insert into eduBackgrounds values (1, 'Trung C?p'), (2, 'Cao Ð?ng'), (3, 'Ð?i H?c'), (4, 'Sau Ð?i H?c');
create table divisions (
division_id int auto_increment primary key,
division_name enum('Sale-marketing', 'Hành Chính', 'Ph?c v?', 'Qu?n Lý')
);
insert into divisions values (1, 'Sale-marketing'), (2, 'Hành Chính'), (3, 'Ph?c v?'), (4, 'Qu?n Lý');

create table employees (
employee_id int auto_increment primary key,
employee_name nvarchar(45) not null,
employee_birthday date not null,
employee_idcard nvarchar(45) not null,
employee_salary nvarchar(45) not null,
employee_phone nvarchar(45) not null,
employee_email nvarchar(45),
employee_address nvarchar(45),
position_id int not null,
edu_bg_id int not null,
division_id int not null,
foreign key (position_id) references positions(position_id),
foreign key (edu_bg_id) references eduBackgrounds(edu_bg_id),
foreign key (division_id) references divisions(division_id)
);

insert into employees values (1, 'Margalo', '1982-08-29', '337-201-659', '2500', '8216852520', 'Margalo@yahoo.com', 'Qu?ng Tr?', 5, 1, 2);
insert into employees values (2, 'Wells', '1990-06-07', '776-176-401', '1200', '2163152417', 'Wells@yahoo.com', 'Qu?ng Tr?', 1, 1, 3);
insert into employees values (3, 'Libbie', '1984-09-25', '075-092-098', '1200', '2983300613', 'Libbie@facebook.com', 'Hu?', 5, 3, 4);
insert into employees values (4, 'Merla', '1979-04-26', '267-895-910', '1200', '4680526140', 'Merla@yahoo.com', 'Qu?ng Bình', 3, 3, 4);
insert into employees values (5, 'Everard', '1980-05-30', '509-784-356', '1200', '1049308370', 'Everard@facebook.com', 'Qu?ng Nam', 5, 3, 3);
insert into employees values (6, 'Barbette', '1972-03-10', '785-906-613', '400', '9143938663', 'Barbette@gmail.com', 'Sài Gòn', 5, 3, 4);
insert into employees values (7, 'Tori', '1991-06-09', '578-152-094', '1200', '2682913418', 'Tori@gmail.com', 'Sài Gòn', 2, 1, 2);
insert into employees values (8, 'Angie', '1982-11-10', '309-677-185', '2000', '3574363341', 'Angie@facebook.com', 'Qu?ng Nam', 2, 1, 3);
insert into employees values (9, 'Almire', '1987-01-03', '676-621-239', '400', '9875037494', 'Almire@facebook.com', 'Qu?ng Tr?', 4, 2, 4);
insert into employees values (10, 'Lion', '1984-09-19', '218-461-559', '1200', '2124703839', 'Lion@facebook.com', 'Qu?ng Tr?', 1, 3, 1);
insert into employees values (11, 'Barty', '1986-01-12', '296-385-742', '400', '8944142139', 'Barty@yahoo.com', 'Qu?ng Bình', 3, 2, 3);
insert into employees values (12, 'Lindon', '1975-01-20', '491-953-059', '2500', '2507081348', 'Lindon@yahoo.com', 'Qu?ng Bình', 1, 3, 3);
insert into employees values (13, 'Theresita', '1974-02-28', '462-592-452', '1200', '3498856146', 'Theresita@facebook.com', 'Ðà N?ng', 4, 4, 3);
insert into employees values (14, 'Persis', '1997-03-25', '291-543-720', '1200', '6577700115', 'Persis@yahoo.com', 'Sài Gòn', 5, 3, 4);
insert into employees values (15, 'Zitella', '1972-11-09', '239-064-036', '1200', '6491368164', 'Zitella@facebook.com', 'Ðà N?ng', 3, 3, 3);
insert into employees values (16, 'Hanny', '1983-12-16', '997-896-341', '1200', '5127073194', 'Hanny@yahoo.com', 'Sài Gòn', 1, 1, 4);
insert into employees values (17, 'Libby', '2000-09-21', '451-865-562', '400', '1917111389', 'Libby@yahoo.com', 'Qu?ng Bình', 5, 3, 4);
insert into employees values (18, 'Lezley', '1997-01-07', '187-178-345', '1200', '3447169372', 'Lezley@yahoo.com', 'Hu?', 2, 1, 2);
insert into employees values (19, 'Ase', '1992-05-10', '233-906-204', '400', '2089284381', 'Ase@facebook.com', 'Sài Gòn', 4, 4, 1);
insert into employees values (20, 'Jeffry', '1997-01-29', '492-519-500', '1200', '9529551056', 'Jeffry@yahoo.com', 'Qu?ng Nam', 5, 2, 2);
insert into employees values (21, 'Duy', '1996-04-15', '312-277-832', '5000', '9529551056', 'nguyenduy@yahoo.com', 'Sài Gòn', 6, 4, 4);

create table customerTypes (
customer_type_id int auto_increment primary key,
customer_type_name enum('Diamond', 'Platinium', 'Gold', 'Silver', 'Member')
);

insert into customerTypes values (1, 'Diamond'), (2, 'Platinium'), (3, 'Gold'), (4, 'Silver'), (5, 'Member');

create table customers (
customer_id int auto_increment primary key,
customer_type_id int not null,
foreign key(customer_type_id) references customerTypes(customer_type_id),
customer_name nvarchar(45) not null,
customer_birthday date not null,
customer_idcard nvarchar(45) not null,
customer_phone nvarchar(45) not null,
customer_email nvarchar(45),
customer_address nvarchar(45)
);

insert into customers values (1, 5, 'Ulysses', '1979-09-17', '123-456-987', '5576786287', 'Ulysses@gmail.com.vn', 'Vinh');
insert into customers values (2, 2, 'Lemuel', '1972-01-27', '333-444-333', '8153115769', 'Lemuel@gmail.com.vn', 'Ðà N?ng');
insert into customers values (3, 4, 'Alwyn', '1997-12-10', '888-666-444', '0009725571', 'Alwyn@fb.com.vn', 'Ðà N?ng');
insert into customers values (4, 1, 'Kathrine', '1974-11-18', '123-555-757', '0286460721', 'Kathrine@fb.com.vn', 'Vinh');
insert into customers values (5, 3, 'Hasty', '1996-10-08', '356-756-888', '0121392590', 'Hasty@codegym.com.vn', 'Ðà N?ng');
insert into customers values (6, 2, 'Sigismundo', '1988-02-17', '111-888-123', '2089432337', 'Sigismundo@codegym.com.vn', 'Qu?ng Ngãi');
insert into customers values (7, 1, 'Shannon', '1970-04-30', '222-777-123', '1304598628', 'Shannon@codegym.com.vn', 'Qu?ng Nam');
insert into customers values (8, 5, 'Anica', '1995-01-27', '666-666-123', '8624729054', 'Anica@fb.com.vn', 'Qu?ng Ngãi');
insert into customers values (9, 2, 'Rita', '1994-12-02', '777-555-123', '0035377505', 'Rita@gmail.com.vn', 'Vinh');
insert into customers values (10, 5, 'Florence', '1982-09-26', '888-455-111', '5842276839', 'Florence@gmail.com.vn', 'Vinh');
insert into customers values (11, 1, 'Van', '1992-01-23', '234-111-167', '9272198917', 'Van@fb.com.vn', 'Qu?ng Tr?');
insert into customers values (12, 1, 'Martelle', '1991-01-28', '345-111-767', '0713312304', 'Martelle@codegym.com.vn', 'Qu?ng Ngãi');
insert into customers values (13, 4, 'Laurie', '1971-02-19', '456-222-634', '6495947446', 'Laurie@codegym.com.vn', 'Vinh');
insert into customers values (14, 5, 'Pearla', '1975-03-09', '567-222-452', '1223517090', 'Pearla@codegym.com.vn', 'Qu?ng Tr?');
insert into customers values (15, 3, 'Christy', '1986-03-05', '678-333-521', '9156344226', 'Christy@codegym.com.vn', 'Qu?ng Nam');
insert into customers values (16, 5, 'Sterne', '1980-06-15', '098-456-111', '2923972935', 'Sterne@gmail.com.vn', 'Ðà N?ng');
insert into customers values (17, 1, 'Markos', '2000-08-12', '000-456-657', '8774327558', 'Markos@fb.com.vn', 'Qu?ng Ngãi');
insert into customers values (18, 4, 'Etta', '1992-04-29', '120-362-946', '3594759386', 'Etta@codegym.com.vn', 'Qu?ng Nam');
insert into customers values (19, 4, 'Mag', '1990-01-04', '140-625-783', '7638896098', 'Mag@gmail.com.vn', 'Vinh');
insert into customers values (20, 4, 'Cam', '1971-06-04', '340-652-853', '6978254789', 'Cam@fb.com.vn', 'Qu?ng Ngãi');
insert into customers values (21, 1, 'Queenie', '1970-02-14', '740-345-673', '5825912773', 'Queenie@codegym.com.vn', 'Qu?ng Ngãi');
insert into customers values (22, 5, 'Carena', '1997-08-13', '970-783-682', '2912678636', 'Carena@fb.com.vn', 'Vinh');
insert into customers values (23, 2, 'Betty', '1970-11-24', '988-456-112', '4966468821', 'Betty@gmail.com.vn', 'Ðà N?ng');
insert into customers values (24, 5, 'Karoly', '1974-12-10', '250-222-346', '1066860689', 'Karoly@codegym.com.vn', 'Qu?ng Ngãi');
insert into customers values (25, 5, 'Marsh', '1986-03-02', '290-111-068', '2400293966', 'Marsh@fb.com.vn', 'Hu?');
insert into customers values (26, 5, 'Clarinda', '1974-04-28', '100-095-000', '8076709705', 'Clarinda@gmail.com.vn', 'Qu?ng Nam');
insert into customers values (27, 2, 'Paulie', '1977-09-14', '900-648-008', '9525119915', 'Paulie@fb.com.vn', 'Qu?ng Tr?');
insert into customers values (28, 5, 'Doralia', '1976-04-03', '950-735-088', '9239912774', 'Doralia@fb.com.vn', 'Vinh');
insert into customers values (29, 1, 'Sybil', '1988-10-07', '450-726-976', '8400714804', 'Sybil@gmail.com.vn', 'Qu?ng Ngãi');
insert into customers values (30, 5, 'Raleigh', '1993-03-29', '330-562-456', '1785140910', 'Raleigh@fb.com.vn', 'Hu?');
insert into customers values (31, 1, 'Sybil', '1990-09-17', '423-726-999', '4562794678', 'Sybil1990@gmail.com.vn', 'Qu?ng Ngãi');
insert into customers values (32, 3, 'Raleigh', '1980-07-29', '330-762-006', '0987234516', 'Raleigh1980@fb.com.vn', 'Ðà N?ng');



create table rentTypes (
rent_type_id int auto_increment primary key,
rent_type_name enum('year', 'month', 'day', 'hour'),
rent_type_price int
);
insert into rentTypes values (1, 'year', 399000), (2, 'month', 29000), (3, 'day', 1000), (4, 'hour', 50);

create table serviceTypes (
service_type_id int auto_increment primary key,
service_type_name enum('Villa', 'House', 'Room')
);

insert into serviceTypes values (1, 'Villa'), (2, 'House'), (3, 'Room');

create table services (
service_id int auto_increment primary key,
service_name varchar(45) not null,
service_area int,
check(service_area > 30),
service_floor int,
check(service_floor > 0),
service_max_people int,
check(service_max_people between 1 and 20),
rent_type_id int not null,
service_type_id int not null,
service_price int not null,
service_status enum ('available', 'unavailable') default 'available',
foreign key (rent_type_id) references rentTypes(rent_type_id),
foreign key (service_type_id) references serviceTypes(service_type_id)
);

insert into services values (1, 'Villa01', 72, 2, 14, 1, 1, 399000,'available');
insert into services values (2, 'Villa02', 50, 4, 8, 2, 1, 29000,'available');
insert into services values (3, 'Villa03', 49, 1, 11, 3, 1, 1000,'unavailable');
insert into services values (4, 'Villa04', 51, 2, 8, 4, 1, 150,'unavailable');
insert into services values (5, 'Villa05', 41, 3, 6, 1, 1, 349000,'available');
insert into services values (6, 'Villa06', 80, 2, 9, 2, 1, 21000,'unavailable');
insert into services values (7, 'Villa07', 71, 1, 12, 3, 1, 1100,'available');
insert into services values (8, 'Villa08', 85, 2, 9, 4, 1, 100,'available');
insert into services values (9, 'Villa09', 70, 3, 12, 3, 1, 999,'available');
insert into services values (10, 'Villa10', 87, 2, 9, 4, 1, 150,'available');
insert into services values (11, 'Room11', 81, 4, 9, 1, 3, 299000,'available');
insert into services values (12, 'Room12', 74, 1, 8, 2, 3, 10000,'available');
insert into services values (13, 'Room13', 84, 3, 19, 3, 3, 300,'unavailable');
insert into services values (14, 'Room14', 93, 1, 9, 4, 3, 50,'available');
insert into services values (15, 'Room15', 87, 2, 8, 1, 3, 250000,'available');
insert into services values (16, 'Room16', 89, 3, 5, 2, 3, 12000,'available');
insert into services values (17, 'Room17', 77, 1, 11, 3, 3, 350,'unavailable');
insert into services values (18, 'Room18', 56, 2, 17, 4, 3, 75,'available');
insert into services values (19, 'Room19', 55, 2, 4, 3, 3, 250,'available');
insert into services values (20, 'Room20', 33, 2, 4, 4, 3, 40,'available');
insert into services values (21, 'House01', 81, 3, 4, 1, 2, 349000,'unavailable');
insert into services values (22, 'House02', 57, 4, 13, 2, 2, 19000,'available');
insert into services values (23, 'House03', 58, 4, 16, 3, 2, 600,'unavailable');
insert into services values (24, 'House04', 62, 2, 11, 4, 2, 80,'available');
insert into services values (25, 'House05', 50, 4, 15, 3, 2, 700,'unavailable');
insert into services values (26, 'House06', 60, 2, 10, 4, 2, 100,'available');



create table attachServices (
attach_service_id int auto_increment primary key,
attach_service_name nvarchar(45) not null,
attach_service_price int not null,
attach_service_unit int not null,
attach_service_status nvarchar(45)
);

insert into attachServices values (1, 'No service', 0, 0,'unavailable');
insert into attachServices values (2, 'karaoke01', 100, 0,'available');
insert into attachServices values (3, 'karaoke02', 150, 0,'available');
insert into attachServices values (4, 'karaoke03', 150, 0,'available');
insert into attachServices values (5, 'massage01', 200, 0,'available');
insert into attachServices values (6, 'massage02', 250, 0,'available');
insert into attachServices values (7, 'massage03', 299, 0,'available');
insert into attachServices values (8, 'massage04', 349, 0,'available');
insert into attachServices values (9, 'car01', 50, 0,'available');
insert into attachServices values (10, 'car02', 100, 0,'available');
insert into attachServices values (11, 'car03', 150, 0,'available');
insert into attachServices values (12, 'car04', 200, 0,'available');
insert into attachServices values (13, 'food01', 50, 0,'available');
insert into attachServices values (14, 'food02', 100, 0,'available');
insert into attachServices values (15, 'food03', 150, 0,'available');
insert into attachServices values (16, 'food04', 200, 0,'available');
insert into attachServices values (17, 'drink01', 50, 0,'available');
insert into attachServices values (18, 'drink02', 100, 0,'available');
insert into attachServices values (19, 'drink03', 150, 0,'available');
insert into attachServices values (20, 'drink04', 200, 0,'available');


create table contracts (
contract_id int auto_increment primary key,
contract_start_date datetime not null,
contract_end_date datetime not null,
contract_deposit int not null,
contract_price int not null,
employee_id int not null,
customer_id int not null,
service_id int not null,
foreign key (employee_id) references employees(employee_id) on delete cascade,
foreign key (customer_id) references customers(customer_id) on delete cascade,
foreign key (service_id) references services(service_id)
);
# service_id: hour: 4,8,10,14,18,20,24,26 : 50
#			  day: 3,7,9,13,17,19,23,25 : 1000
#			  month: 2,6,12,16,22 : 29000
#			  year: 1,5,11,15,21 : 399000

#2018


insert into contracts values (1, '2018-02-01', '2018-03-01', 15000, 29000, 1, 1, 2);
insert into contracts values (2, '2018-04-01 08:00:00', '2018-04-01 18:00:00', 200, 1500, 4, 4, 4);
insert into contracts values (3, '2018-06-01', '2018-06-05', 500, 1200, 3, 27, 13);
insert into contracts values (4, '2018-08-01', '2019-08-01', 100000, 349000, 2, 21, 5);
insert into contracts values (5, '2018-09-10', '2018-09-12', 800, 2200, 5, 14, 7);
insert into contracts values (6, '2018-12-01', '2018-12-04', 500, 750, 6, 30, 19);


#2019


insert into contracts values (7, '2019-01-01', '2019-03-01', 10000, 42000, 1, 2, 6);
insert into contracts values (8, '2019-02-01', '2019-03-01', 5000, 29000, 3, 4, 2);
insert into contracts values (9, '2019-03-01', '2019-03-15', 5000, 15000, 6, 29, 3);
insert into contracts values (10, '2019-06-01', '2019-06-07', 2000, 6000, 5, 11, 3);
insert into contracts values (11, '2019-06-10', '2019-06-15', 1000, 3000, 4, 10, 23);


insert into contracts values (12, '2019-08-10', '2019-08-20', 3000, 3500, 9, 5, 17);
insert into contracts values (13, '2019-08-19', '2019-08-23', 250, 1000, 8, 12, 19);


insert into contracts values (14, '2019-10-01', '2019-10-04', 2000, 3000, 7, 25, 3);
insert into contracts values (15, '2019-11-02', '2019-11-05', 1000, 1800, 11, 16, 23);
insert into contracts values (16, '2019-11-22', '2019-11-27', 800, 3500, 10, 31, 25);
insert into contracts values (17, '2019-12-01', '2020-01-01', 5000, 19000, 12, 32, 22);
insert into contracts values (18, '2019-12-10', '2020-12-15', 995, 4995, 14, 5, 9);

#2020

insert into contracts values (19, '2020-01-01', '2021-01-01', 50000, 299000, 1, 20, 11);
insert into contracts values (20, '2020-05-01', '2021-05-01', 100000, 349000, 15, 1, 21);
insert into contracts values (21, '2020-05-01', '2020-07-01', 29000, 58000, 16, 2, 2);
insert into contracts values (22, '2020-06-01', '2020-09-01', 29000, 63000, 21, 4, 6);
insert into contracts values (23, '2020-06-07', '2020-06-15', 3000, 8000, 17, 7, 3);
insert into contracts values (24, '2020-06-09', '2020-06-10', 200, 350, 2, 18, 17);
insert into contracts values (25, '2020-06-10', '2020-06-12', 500, 2200, 3, 15, 7);




create table contractDetails (
contract_detail_id int auto_increment primary key,
contract_id int not null,
attach_service_id int not null,
quantity int not null,
foreign key (contract_id) references contracts(contract_id) on delete cascade,
foreign key (attach_service_id) references attachServices(attach_service_id)
);

insert into contractDetails values (1, 1, 9, 2);
insert into contractDetails values (2, 1, 13, 1);
insert into contractDetails values (3, 1, 17, 1);
insert into contractDetails values (4, 2, 10, 2);
insert into contractDetails values (5, 3, 2, 1);
insert into contractDetails values (6, 3, 5, 1);
insert into contractDetails values (7, 3, 12, 2);
insert into contractDetails values (8, 4, 4, 1);
insert into contractDetails values (9, 4, 8, 2);
insert into contractDetails values (10, 4, 12, 2);
insert into contractDetails values (11, 4, 16, 2);
insert into contractDetails values (12, 4, 20, 2);
insert into contractDetails values (13, 5, 10, 4);
insert into contractDetails values (14, 6, 11, 5);
insert into contractDetails values (15, 7, 10, 2);
insert into contractDetails values (16, 7, 13, 2);
insert into contractDetails values (17, 8, 12, 1);
insert into contractDetails values (18, 8, 16, 1);
insert into contractDetails values (19, 9, 15, 5);
insert into contractDetails values (20, 10, 20, 2);
insert into contractDetails values (21, 11, 4, 1);
insert into contractDetails values (22, 11, 11, 2);
insert into contractDetails values (23, 11, 8, 1);
insert into contractDetails values (24, 12, 4, 1);
insert into contractDetails values (25, 13, 8, 2);
insert into contractDetails values (26, 13, 11, 1);
insert into contractDetails values (27, 14, 16, 1);
insert into contractDetails values (28, 14, 17, 5);
insert into contractDetails values (29, 15, 20, 2);
insert into contractDetails values (30, 16, 4, 1);
insert into contractDetails values (31, 17, 5, 2);
insert into contractDetails values (32, 17, 9, 1);
insert into contractDetails values (33, 17, 14, 2);
insert into contractDetails values (34, 17, 20, 1);
insert into contractDetails values (35, 18, 20, 1);
insert into contractDetails values (36, 19, 5, 2);
insert into contractDetails values (37, 19, 16, 2);
insert into contractDetails values (38, 20, 9, 1);
insert into contractDetails values (39, 21, 16, 2);
insert into contractDetails values (40, 22, 17, 1);
insert into contractDetails values (41, 23, 18, 2);
insert into contractDetails values (42, 24, 6, 1);
insert into contractDetails values (43, 25, 10, 1);


#Task 2:
select * from employees
where SUBSTRING_INDEX( employee_name, " ", -1 )  like 'H%' or employee_name like 'T%' or employee_name like 'K%'
 and length(SUBSTRING_INDEX( employee_name, " ", -1 ))<=15;
 
select * from employees
where employee_name like 'H%' or employee_name like 'T%' or employee_name like 'K%' and length(employee_name)<=15;

#Task 3:
SELECT * FROM customers
where  (year(now())-year(customer_birthday)) between 18 and 50 and customer_address = 'Ðà N?ng' or customer_address ='Qu?ng Tr?';

select * , timestampdiff(year, customer_birthday, curdate()) as Age from customers
having (Age between 18 and 50) and (customer_address in ("Ðà N?ng", "Qu?ng Tr?"));

#Task 4:
select *,count(*) as number_of_reservations
 from customers 
 join customertypes on customertypes.customer_type_id = customers.customer_type_id
 join contracts using (customer_id)
where customers.customer_type_name = 1
group by customer_id
order by number_of_reservations asc;

#Task 5:
select customer_id,customer_name, customertypes.customer_type_name,contracts.contract_id,
services.service_name,contracts.contract_start_date,contracts.contract_end_date,(contract_price+ sum(attach_service_price*quantity)) as price
from customers
  join contracts using (customer_id)
  join customertypes using (customer_type_id)
  join services using (service_id)
  join renttypes using (rent_type_id)
  join contractdetails on contractdetails.contract_id = contracts.contract_id
  join attachservices using (attach_service_id)
group by  contract_id 
union
select customer_id,customer_name, customertypes.customer_type_name,contracts.contract_id,
services.service_name,contracts.contract_start_date,contracts.contract_end_date,(contract_price+sum(attach_service_price*quantity)) as price
from customers
 left join contracts using (customer_id)
 left join customertypes using (customer_type_id)
 left join services using (service_id)
 left join renttypes using (rent_type_id)
 left join contractdetails on contractdetails.contract_id = contracts.contract_id
 left join attachservices using (attach_service_id)
 where  contracts.contract_id  is null
 group by customer_id;
 
 select customers.customer_id, customers.customer_name, customertypes.customer_type_name, temp.*
from customers
left join customertypes using(customer_type_id)
left join (
	select customers.customer_id, contracts.contract_id, contracts.contract_start_date, contracts.contract_end_date,
	sum(contract_price + quantity * attachservices.attach_service_price) as Tong
	from customers
	join contracts using (customer_id)
	join contractdetails using (contract_id)
	join attachservices using (attach_service_id)
	group by contracts.contract_id) as temp
on customers.customer_id = temp.customer_id
order by temp.contract_id;

#Task 6
select services.service_id,services.service_name,services.service_area,servicetypes.service_type_name
from services
left join servicetypes using (service_type_id)
where service_id not in (  select service_id from contracts 

 where contracts.contract_start_date >= '2019-01-01'  );

#Task 7:
select  services.service_id,services.service_name,services.service_area,
services.service_max_people,contracts.contract_price,servicetypes.service_type_name
from services
left join contracts using (service_id)
left join servicetypes using (service_type_id)
left join (
select service_id  from contracts 
where  year(contracts.contract_start_date) ='2019') as temp
using (service_id)
where  year(contracts.contract_start_date) ='2018' and temp.service_id is null;

#Task 8:
select distinct customer_name
from customers;

select customer_name
from customers
group by customer_name;
select customer_name from customers union select customer_name from customers;

#Task 9:
create temporary table table_month(
     month_2019 int 
     check (month_2019 >=1)
     check (month_2019 <=12)
     );
insert into table_month value (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);
select * from table_month;
select  table_month.month_2019, ifnull(tmp.total, 0) 
from table_month
	left join 
    (
		select temp.month, sum(temp.price) as total
		from (
			select month(contracts.contract_start_date) as month ,(contract_price+sum(attach_service_price*quantity)) as price
			from contracts
			left join contractdetails using (contract_id)
			left join attachservices using (attach_service_id)
			where year(contracts.contract_start_date) = 2019 
			group by  contract_id
		) as temp
        group by temp.month
      ) as tmp
      on  table_month.month_2019 = tmp.month
      order by table_month.month_2019 asc;
      
#Task 10:
select contract_id,contract_start_date,contract_end_date,contract_deposit,count(contractdetails.attach_service_id) as attachservice_quantity
from contracts
left join contractdetails using (contract_id)
group by contracts.contract_id;

#Task 11:
select attachservices.*, customers.customer_address,customertypes.customer_type_name
from attachservices
 join contractdetails using (attach_service_id)
 join contracts using (contract_id)
 join customers using (customer_id)
 join customertypes using (customer_type_id) 
where customertypes.customer_type_name = 'Diamond' and customers.customer_address in ( 'vinh','Qu?ng Ngãi') and attach_service_id<>1;

#Task 12:
select contracts.contract_id,employees.employee_name,customers.customer_name,customers.customer_phone,
services.service_name,count(contractdetails.attach_service_id) as attachservice_quantity,contracts.contract_deposit,contract_start_date
from contracts
join employees using (employee_id)
join customers using (customer_id)
join services using (service_id)
join contractdetails using (contract_id)
left join (
select service_id  from contracts 
where month(contracts.contract_start_date ) <= 6 and year(contracts.contract_start_date) ='2019') as temp
using (service_id)
where month(contracts.contract_start_date ) > 9 and year(contracts.contract_start_date) ='2019' and temp.service_id is null
group by contracts.contract_id;

#Task 13
drop view if exists table_view;
create view table_view
as
select attachservices.*, count(contractdetails.attach_service_id) as  attachservice_quantity
from attachservices
 join contractdetails using (attach_service_id)
 join contracts using (contract_id)
 join customers using (customer_id)
 join customertypes using (customer_type_id)
 group by attach_service_id;
select table_view.*
from table_view
where attachservice_quantity = (select max(attachservice_quantity) from table_view);

#Task 14:
select contracts.contract_id,services.service_name,attachservices.attach_service_name,
count(contractdetails.attach_service_id) as attachservice_quantity
from contracts
join customers using (customer_id)
join services using (service_id)
join contractdetails using (contract_id)
join attachservices using (attach_service_id)
group by attach_service_id
having attachservice_quantity=1 and attach_service_id <> 1 ;

#Task 15 :
select employees.employee_id,employees.employee_name,positions.position_name,divisions.division_name,
employees.employee_phone,employees.employee_address
from employees
join positions using (position_id)
join divisions using (division_id)
join contracts using (employee_id)
where year(contracts.contract_start_date) between 2018 and 2019
group by employee_id
having count(*) <= 3 ;

#Task 16:
#set sql_safe_udates =0;
##drop foreign key contract_ibfk_1;
#delete from employees where employee_id not in ( select employee_id
#from contracts
 #where year(contracts.contract_start_date) between 2017 and 2019);
 #alter table contracts
 #add foreign key (employee_id) references employees(employee_id);
 delete from employees where employee_id not in ( select employee_id
from contracts
 where year(contracts.contract_start_date) between 2017 and 2020);
 #Task 17:
 update customers set customers.customer_type_id = 1 where customer_id in (
 select customer_id
 from(
 select customer_id , ( contract_price+ sum(attachservices.attach_service_price*quantity))as total
 from  contractdetails
 join contracts using (contract_id)
 join customers using (customer_id)
 join attachservices using (attach_service_id)
 where year(contracts.contract_start_date) = 2019 and customer_type_id = 2 
 group by customer_id
 having total > 5000 ) as temp
 );
 
 #Task 18:
delete from customers where customer_id   in ( select customer_id
from contracts
 where year(contracts.contract_start_date) < 2016);
 #Task 19:
 update  attachservices set attach_service_price = attach_service_price*10 where attach_service_price in(
 select attach_service_price 
 from(
 select attach_service_price,count(contractdetails.attach_service_id) as attachservice_quantity
from contracts
join customers using (customer_id)
join services using (service_id)
join contractdetails using (contract_id)
join attachservices using (attach_service_id)
where year(contract_start_date)=2019
group by contract_id
having attachservice_quantity>3 )as temp);
 
 #Task 20:
 select (customers.customer_id)as id,(customer_name)as name ,(customer_email) as email ,(customer_phone)as phone,
 (customer_birthday)as birthday ,(customer_address) as address
 from customers 
 union all 
 select employee_id,employee_name,employee_email,employee_phone,employee_birthday,employee_address
 from employees