create database car_store;
use car_store;

-- Tao bang customer
CREATE TABLE Customers (
    customerNumber INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    contact_last_name VARCHAR(50) NOT NULL,
    contact_first_name VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    address_line1 VARCHAR(50) NOT NULL,
    address_line2 VARCHAR(50),
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    postalCode VARCHAR(15) NOT NULL,
    country VARCHAR(50) NOT NULL,
    creditLimit FLOAT,
    address VARCHAR(100)
);

-- Tao bang loai san pham
CREATE TABLE ProductsLine (
    product_line VARCHAR(50) PRIMARY KEY NOT NULL,
    text_description TEXT,
    image MEDIUMBLOB
);

-- Tao bang san pham
CREATE TABLE Products (
    product_code VARCHAR(15) PRIMARY KEY NOT NULL,
    product_name VARCHAR(70) NOT NULL,
    product_scale VARCHAR(10) NOT NULL,
    product_vendor VARCHAR(50) NOT NULL,
    product_description TEXT NOT NULL,
    quantity_inStock INT NOT NULL,
    buy_price FLOAT NOT NULL,
    `MSRP` FLOAT NOT NULL
);

-- Tao bang don hang cua khach
CREATE TABLE Orders (
    order_number INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    order_date DATE NOT NULL,
    required_date DATE NOT NULL,
    shipped_date DATE,
    `status` VARCHAR(15) NOT NULL,
    comments TEXT,
    quantity_ordered INT NOT NULL,
    price_each FLOAT NOT NULL
);

-- Tao bang thanh toan
CREATE TABLE Payments (
    check_number VARCHAR(50) PRIMARY KEY NOT NULL,
    payment_date DATE NOT NULL,
    amount FLOAT NOT NULL
);

-- Tao bang nhan vien
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    job_title VARCHAR(50) NOT NULL
);

-- Tao bang nhan vien quan ly
CREATE TABLE Managers (
    manager_id INT PRIMARY KEY AUTO_INCREMENT,
    manager_name VARCHAR(50),
    manager_email NVARCHAR(50),
    position VARCHAR(50)
);

-- Tao bang van phong
CREATE TABLE Offices (
    office_code VARCHAR(10) PRIMARY KEY NOT NULL,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    address_line1 VARCHAR(50) NOT NULL,
    address_line2 VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    postal_code VARCHAR(15) NOT NULL
);

-- Một khách hàng có nhiều hóa đơn, mỗi hóa đơn thuộc về một khách hàng (thể hiện mối quan hệ 1: N)
alter table Orders 
add column customerNumber int,
add constraint customer_number1
foreign key (customerNumber) references Customers(customerNumber);

-- Một khách hàng thực hiện thanh toán nhiều lần, mỗi lần thanh toán ứng với một khách hàng (thể hiện mối quan hệ 1: N)
alter table Payments
add column customerNumber int,
add constraint customer_number2
foreign key (customerNumber) references Customers(customerNumber);

-- Một sản phẩm thuộc nhiều hóa đơn, mỗi hóa đơn chứa nhiều sản phẩm (N:M)
CREATE TABLE OrderDetails (
    order_number INT,
    product_code VARCHAR(15),
    PRIMARY KEY (order_number , product_code),
    FOREIGN KEY (order_number)
        REFERENCES Orders (order_number),
    FOREIGN KEY (product_code)
        REFERENCES Products (product_code)
);

-- Một loại hàng có nhiều sản phẩm, mỗi sản phẩm thuộc một loại hàng (thể hiện mối quan hệ 1 : N)
alter table Products 
add column product_line VARCHAR(50),
add constraint product_line
foreign key (product_line) references ProductsLine(product_line);

-- Một nhân viên chăm sóc nhiều khách hàng, mỗi khách hàng do một nhân viên chăm sóc (thể hiện mối quan hệ 1: N)
alter table Customers
add column salesRepEmployeeNumber INT,
add constraint salesRepEmployeeNumber 
foreign key (salesRepEmployeeNumber) references Employees(employee_id);

-- Một nhân viên quản lý quản lý nhiều nhân viên khác (thể hiện mối quan hệ 1: N)
alter table Employees
add column reportTo INT,
add constraint reportTo 
foreign key (reportTo) references Managers(manager_id);

-- Một văn phòng làm việc có nhiều nhân viên, mỗi nhân viên thuộc một văn phòng làm việc (thể hiện mối quan hệ 1: N)
alter table Employees
add column office_code VARCHAR(10),
add constraint office_code
foreign key (office_code) references Offices(office_code);
