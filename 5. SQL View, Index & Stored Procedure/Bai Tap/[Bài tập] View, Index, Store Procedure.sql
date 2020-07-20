DROP DATABASE IF EXISTS demo;
create database if not exists demo;

use demo;

CREATE TABLE Products (
    Id INT,
    productCode VARCHAR(50),
    productName VARCHAR(50),
    productPrice VARCHAR(50),
    productAmount INT,
    productDescription VARCHAR(50),
    productStatus VARCHAR(50),
    PRIMARY KEY (Id)
);
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index product_code
on Products(productCode);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create unique index compositeIndexProductPrice
on Products(productCode,productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain
select * from
Products;

-- So sánh câu truy vấn trước và sau khi tạo index

insert into Products(Id,productCode,productName,productPrice,productAmount,productDescription,productStatus)
values (1,'SP01','XaPhong','15USD','10','TrungQuoc','Available'),
(2,'SP02','BotGiat','25USD','10','TrungQuoc','Available'),
(3,'SP03','BanChai','10USD','10','TrungQuoc','Available'),
(4,'SP04','Giay','7USD','10','TrungQuoc','Available'),
(5,'SP05','DaoCaorau','8USD','10','TrungQuoc','Available'),
(6,'SP06','But','6USD','10','TrungQuoc','Available'),
(7,'SP07','Keo','3USD','10','TrungQuoc','Available');

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW Products_view AS
    SELECT 
        productCode, productName, productPrice, productStatus
    FROM
        Products;

-- Tiến hành sửa đổi view
UPDATE Products_view 
SET 
    productName = 'GiayDep'
WHERE
    productCode = 'SP04';

-- Tiến hành xoá view
Drop view Products_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure allProduct ()
begin
select productName
from Products;
end; //
delimiter ;
call allProduct();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure addProduct (id int,productCode varchar(50),productName varchar(50),productPrice varchar(50),productAmount int,productDescription varchar(50),productStatus varchar(50))
begin
insert into Products(Id,productCode,productName,productPrice,productAmount,productDescription,productStatus)
value(Id,productCode,productName,productPrice,productAmount,productDescription,productStatus);
end; //
delimiter ;

call addProduct('9','SP09','Keo','3USD','10','TrungQuoc','Available');

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
CREATE PROCEDURE update_all(product_id INT, product_code VARCHAR(50), product_name VARCHAR(50),
				product_price INT, product_amount INT, product_description VARCHAR(50),
				product_status VARCHAR(50) )
	BEGIN 
    UPDATE demo.products
    SET 
    productCode = product_code,
    productName = product_name,
    productPrice = product_price,
    productAmount = product_amount,
    productDescription = product_description,
    productStatus = product_status
    WHERE id = product_id;
    END; //
delimiter ;

call addProduct('9','SP09','Keo','3USD','10','TrungQuoc','Available');

-- Tạo store procedure xoá sản phẩm theo id

delimiter //
CREATE PROCEDURE deleteall(xoa_id INT)
BEGIN
	DELETE FROM products
    WHERE id = xoa_id;
END; //
delimiter ;

CALL deleteall(4);