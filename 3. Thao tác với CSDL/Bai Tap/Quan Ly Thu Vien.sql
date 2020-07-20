create database library;
use library;

-- student_number: mã sinh viên, kiểu chuỗi nhiều nhất 15 ký tự, đây là thuộc tính đơn tức là nó chỉ có 1 giá trị cho mỗi bản ghi, 
-- và cũng là thuộc tính để phân biệt giữa các sinh viên khác nhau.
-- student_name: tên sinh viên, kiểu chuỗi nhiều nhất 50 ký tự, thuộc tính đơn.
-- address: địa chỉ, kiểu chuỗi nhiều nhất 500 ký tự, thuộc tính phức hợp vì mang nhiều thông tin khác như thành phố, quốc gia …
-- email: địa chỉ email, kiêu chuỗi nhiều nhất 50 ký tự, thuộc tính đơn.
-- image: ảnh, kiểu ảnh, thuộc tính đơn

CREATE TABLE student (
    student_number VARCHAR(15),
    student_name VARCHAR(50),
    birthday DATE,
    address VARCHAR(500),
    email VARCHAR(50),
    image BLOB,
    PRIMARY KEY (student_number)
);

CREATE TABLE book (
    book_id INT,
    title VARCHAR(50),
    author VARCHAR(50),
    publisher VARCHAR(50),
    publisher_date DATE,
    edition INT,
    price INT,
    image BLOB,
    PRIMARY KEY (book_id)
);

CREATE TABLE category (
    category_id INT,
    category_name VARCHAR(100),
    category_code VARCHAR(10),
    PRIMARY KEY (category_id)
);
-- Sinh viên để thực hiện mượn sách trong thư viện thì phải có thẻ thư viện,
--  thẻ này được cung cấp sẵn khi sinh viên nhập học. 
--  Thông tin về thẻ gồm mã thẻ, tên sinh viên, ngày sinh, 
--  địa chỉ, email, số điện thoại, ảnh. 
--  Để thực hiện việc mượn sách sinh viên có thể tra cứu trước thông tin về sách cần mượn.
--  Sinh viên đến thư viện chọn sách cần mượn. 
--  Thủ thư khi tiếp nhận sách mượn của sinh viên sẽ kiểm tra các thông tin liên 
--  quan đến sinh viên như xem sinh viên còn nợ sách không. 
--  Nếu thông tin đầy đủ và không còn nợ sách thì sinh viên đó được mượn sách 
--  theo giới hạn ngày quy định. Khi sinh viên trả sách, thủ thư kiểm tra xem ngày 
--  trả có bị quá hạn không, nếu quá thì phạt, còn lại ghi nhận trạng thái trả sách của sinh viên.
CREATE TABLE library_card (
    card_id INT,
    borrows_quantity INT,
    borrow_date TIMESTAMP,
    borrow_status VARCHAR(50),
    PRIMARY KEY (card_id)
);


-- Với kiểu kết hợp  (1 : N)

-- Với kiểu kết hợp này, chuyển khóa chuyển khóa chính của bên liên kết 1 sang làm khóa ngoại của bên liên kết nhiều.

-- Ví dụ: Category – Book  (1 : N)

-- Với kiểu kết hợp này, chuyển khóa chuyển khóa chính của bên liên kết 1 sang làm khóa ngoại của bên liên kết nhiều. Tức là bảng Book sẽ có thêm trường cate_number trường này sẽ là trường khóa ngoại để liên kết giữa 2 bảng Category và Book.

-- Với kiểu kết hợp (N : M)

-- Đối với quan hệ giữa N : M, tạo thêm một quan hệ mới. Quan hệ này sẽ chứa khóa chính của 2 quan hệ đã có, đó cũng chính là khóa ngoại để liên kết giữa quan hệ mới sinh ra và 2 quan hệ đã có, và có thể có thêm thuộc tính mới được thêm vào quan hệ mới sinh ra này. 

-- Với kiểu kết hợp (1 : 1)

-- Với kiểu kết hợp này, chuyển khóa chuyển khóa chính của bên liên kết 1 sang làm khóa ngoại của bên còn lại.

-- Category – Book  (1 : N)
alter table book
add column category_id int,
add constraint category_id
foreign key (category_id) references category(category_id);

-- Với kiểu kết hợp (N : M)
CREATE TABLE book_detail (
    student_number VARCHAR(15),
    book_id INT,
    PRIMARY KEY (student_number , book_id),
    FOREIGN KEY (student_number)
        REFERENCES student (student_number),
    FOREIGN KEY (book_id)
        REFERENCES book (book_id)
);

-- Library_card – student  (1 : 1)
alter table library_card
add column student_number VARCHAR(15),
add constraint student_number 
foreign key (student_number) references student(student_number);


