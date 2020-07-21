/* 
---------------------------------Yeu Cau 1------------------------------------------
Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thõa
mãn các yêu cầu bên dưới.
*/

--  Create Database
Drop database if exists FuramaResort;
Create database if not exists FuramaResort;
use FuramaResort;

/* 
---------------------------------Tao Table------------------------------------------
*/

CREATE TABLE NhanVien (
    IdNhanVien INT,
    HoTen VARCHAR(50),
    NgaySinh DATE,
    SoCMND VARCHAR(50),
    Luong VARCHAR(50),
    SDT VARCHAR(50),
    Email VARCHAR(50),
    DiaChi VARCHAR(50),
    PRIMARY KEY (IdNhanVien)
);
CREATE TABLE ViTri (
    IdViTri INT,
    TenViTri VARCHAR(50),
    PRIMARY KEY (IdViTri)
);
CREATE TABLE TrinhDo (
    IdTrinhDo INT,
    TrinhDo VARCHAR(50),
    PRIMARY KEY (IdTrinhDo)
);
CREATE TABLE BoPhan (
    IdBoPhan INT,
    TenBoPhan VARCHAR(50),
    PRIMARY KEY (IdBoPhan)
);

CREATE TABLE HopDong (
    IdHopDong INT,
    NgayLamHopDong DATE,
    NgayKetThuc DATE,
    ThoiGianThue INT,
    TienDatCoc INT,
    TongTien INT,
    PRIMARY KEY (IdHopDong)
);

CREATE TABLE HopDongChiTiet (
    IdHopDongChiTiet INT,
    SoLuong INT,
    PRIMARY KEY (IdHopDongChiTiet)
);

CREATE TABLE DichVuDiKem (
    IdDichVuDiKem INT,
    TenDichVuDiKem VARCHAR(50),
    Gia INT,
    TrangThaiKhaDung VARCHAR(50),
    PRIMARY KEY (IdDichVuDiKem)
);

CREATE TABLE KhachHang (
    IdKhachHang INT,
    HoTen VARCHAR(50),
    NgaySinh DATE,
    SoCMND VARCHAR(50),
    SDT VARCHAR(50),
    Email VARCHAR(50),
    DiaChi VARCHAR(50),
    PRIMARY KEY (IdKhachHang)
);

CREATE TABLE LoaiKhach (
    IdLoaiKhach INT,
    TenLoaiKhach VARCHAR(50),
    PRIMARY KEY (IdLoaiKhach)
);

CREATE TABLE DichVu (
    IdDichVu INT,
    TenDichVu VARCHAR(50),
    DienTich INT,
    SoTang INT,
    SoNguoiToiDa INT,
    ChiPhiThue INT,
    TrangThai VARCHAR(50),
    PRIMARY KEY (IdDichVu),
    CHECK (songuoitoida <= 20)
);

CREATE TABLE KieuThue (
    IdKieuThue INT,
    TenKieuThue VARCHAR(50),
    TangGia INT,
    PRIMARY KEY (IdKieuThue)
);

CREATE TABLE LoaiDichVu (
    IdLoaiDichVu INT,
    TenLoaiDichVu VARCHAR(50),
    PRIMARY KEY (IdLoaiDichVu)
);

/* 
-------------------------------Constraint Nhan Vien--------------------------------------------
*/

-- Nhan Vien - Vi Tri 1-n
alter table NhanVien
add column IdViTri int,
add constraint IdViTri
foreign key (IdViTri) references ViTri(IdViTri);

-- Nhan Vien - Trinh Do 1-n
alter table NhanVien
add column IdTrinhDo int,
add constraint IdTrinhDo
foreign key (IdTrinhDo) references TrinhDo(IdTrinhDo);

-- Nhan Vien - Bo Phan 1-n
alter table NhanVien
add column IdBoPhan int,
add constraint IdBoPhan
foreign key (IdBoPhan) references BoPhan(IdBoPhan);

-- Nhan Vien - Hop Dong 1-n
alter table HopDong
add column IdNhanVien int,
add constraint IdNhanVien
foreign key (IdNhanVien) references NhanVien(IdNhanVien);

/* 
--------------------------------Constraint Hop Dong-------------------------------------------
*/

-- HopDongChiTiet - Hop Dong 1-n
alter table HopDongChiTiet
add column IdHopDong INT,
add constraint IdHopDong
foreign key (IdHopDong) references HopDong(IdHopDong);

-- HopDongChiTiet - DichVuDiKem 1-n
alter table HopDongChiTiet
add column IdDichVuDiKem INT,
add constraint IdDichVuDiKem
foreign key (IdDichVuDiKem) references DichVuDiKem(IdDichVuDiKem);

-- HopDong - KhachHang 1-n
alter table HopDong
add column IdKhachHang int,
add constraint IdKhachHang
foreign key (IdKhachHang) references KhachHang(IdKhachHang);

-- HopDong - DichVu 1-n
alter table HopDong
add column IdDichVu int,
add constraint IdDichVu
foreign key (IdDichVu) references DichVu(IdDichVu);


/* 
--------------------------------Constraint Dich Vu-------------------------------------------
*/

-- Kieu Thue - DichVu 1-n
alter table DichVu
add column IdKieuThue int,
add constraint IdKieuThue
foreign key (IdKieuThue) references KieuThue(IdKieuThue);

-- Loai Dich Vu - DichVu 1-n
alter table DichVu
add column IdLoaiDichVu int,
add constraint IdLoaiDichVu
foreign key (IdLoaiDichVu) references LoaiDichVu(IdLoaiDichVu);

/* 
--------------------------------Constraint Khach Hang-------------------------------------------
*/

-- Khach Hang - Loai Khach 1-n
alter table KhachHang
add column IdLoaiKhach int,
add constraint IdLoaiKhach
foreign key (IdLoaiKhach) references LoaiKhach(IdLoaiKhach);



/* 
--------------------------------Them DaTa-------------------------------------------
*/

-- Thêm data Trinh Do
insert into TrinhDo(IdTrinhDo,TrinhDo)
values (1,'Trung cấp'),
(2,'Cao đẳng'),
(3,'Đại học'),
(4,'Sau Đại Học');

-- Thêm data Vi Tri
insert into ViTri(IdViTri,TenViTri)
values (1,'Lễ Tân'),
(2,'Phục Vụ'),
(3,'Chuyên Viên'),
(4,'Giám Sát'),
(5,'Quản Lý'),
(6,'Giám Đốc');

-- Thêm data BoPhan
insert into BoPhan(IdBoPhan,TenBoPhan)
values (1,'Sale – Marketing'),
(2,'Hành Chính'),
(3,'Phục vụ'),
(4,'Quản lý');

-- Thêm data NhanVien
insert into NhanVien(IdNhanVien,IdTrinhDo,IdViTri,IdBoPhan,HoTen,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
values (1,'1','1','1','Nguyễn Thúy Ngân','2000-06-11','201549456','250USD','0905343939','NTNgan@gmail.com','515 Nguyen Cong Tru'),
(2,'2','2','2','Nguyễn Thúy Hằng','1999-07-11','201549457','250USD','0905853439','NTHang@gmail.com','212 Nguyen Luong bang'),
(3,'3','3','3','Nguyễn Thị Kiều','1997-08-18','201549756','300USD','0905834939','NTKieu@gmail.com','214 Ha Huy Tap'),
(4,'4','4','4','Nguyễn Minh Hải','1990-06-19','201549456','300USD','0905856939','NMHai@gmail.com','213 Ton Duc Thang'),
(5,'1','5','4','Nguyễn Minh Trí','1993-06-25','201543456','1000USD','0902553939','NminhTri@gmail.com','3215 Le Duan'),
(6,'2','6','4','Nguyễn Vũ Khang','1980-02-19','201549456','2000USD','0905783939','Nduogn@gmail.com','2115 Nguyen Minh Triet'),
(7,'4','1','2','Nguyễn Văn Lập','1970-07-21','201659456','250USD','0905896939','NvanLap@gmail.com','2135 Ho Tung Mau'),
(8,'4','2','2','Trịnh Thu Ngân','1990-08-25','201578456','750USD','0905353939','Nthungan@gmail.com','2135 Yết Kiêu'),
(9,'3','3','2','Trương Văn Được','1999-08-25','201589456','150USD','0905763939','Nvanduoc@gmail.com','225 Trương Quốc Toản'),
(10,'3','4','1','Mã Văn Tài','1995-06-13','201547656','350USD','0905853879','Nvantai@gmail.com','21 Lê Hồng Phong'),
(11,'2','1','1','Nguyễn Thị LiNa','1993-06-30','201534456','450USD','0905453939','NThilina@gmail.com','15 Phạm Ngũ Lão'),
(12,'2','1','1','Hồ Thị Cẩm Đào','1993-06-30','201534456','450USD','0905453939','Hothicd@gmail.com','80 Chu Văn Nguyên'),
(13,'2','1','1','Hoàng Mai Nhi','1993-06-30','201534456','450USD','0905453939','Hmainhi@gmail.com','60 Bàu Cát')
;

-- Thêm data LoaiKhach
insert into LoaiKhach(IdLoaiKhach,TenLoaiKhach)
values (1,'Diamond'),
(2,'Platinium'),
(3,'Gold'),
(4,'Silver'),
(5,'Member');

-- Thêm data KhachHang
insert into KhachHang(IdKhachHang,IdLoaiKhach,HoTen,NgaySinh,SoCMND,SDT,Email,DiaChi)
values (1,'1','Trịnh Thị Thúy Ngân','2000-06-11','201549456','0905343939','NTNgan@gmail.com','Đà Nẵng'),
(2,'1','Nguyễn Thúy Hằng','1999-07-11','201549457','0905853439','NTHang@gmail.com','Quảng Bình'),
(3,'3','Nguyễn Thị Kiều','1997-08-18','201549756','0905834939','NTKieu@gmail.com','Đà Nẵng'),
(4,'5','Nguyễn Minh Hải','1990-06-19','201549456','0905856939','NMHai@gmail.com','Đà Nẵng'),
(5,'1','Nguyễn Minh Trí','1993-06-25','201543456','0902553939','NminhTri@gmail.com','Hà Nội'),
(6,'2','Nguyễn Vũ Khang','1980-02-19','201549456','0905783939','Nduogn@gmail.com','Hải Phòng'),
(7,'5','Nguyễn Văn Lập','1930-07-21','201659456','0905896939','NvanLap@gmail.com','Quãng Ngãi'),
(8,'1','Trịnh Thu Ngân','1990-08-25','201578456','0905353939','Nthungan@gmail.com','Vinh'),
(9,'1','Trương Văn Được','1935-08-25','201589456','0905763939','Nvanduoc@gmail.com','Quảng Trị'),
(10,'3','Mã Văn Tài','1995-06-13','201547656','0905853879','Nvantai@gmail.com','Cần Thơ'),
(11,'1','Nguyễn Thị LiNa','1993-06-30','201534456','0905453939','NThilina@gmail.com','Nghệ An'),
(12,'1','Nguyễn Thị LiNa','1994-06-30','201534456','0905453939','NThilina@gmail.com','Nghệ An'),
(13,'1','Nguyễn Thị Thảo','1994-06-30','201534456','0905453939','NThilina@gmail.com','Nghệ An'),
(14,'1','Nguyễn Thị Cam','1994-06-30','201534456','0905453939','NThilina@gmail.com','Vinh'),
(15,'1','Nguyễn Thị Hương','1994-06-30','201534456','0905453939','NThilina@gmail.com','Quãng Ngãi'),
(16,'1','Nguyễn Thị Hồng','1994-06-30','201534456','0905453939','NThilina@gmail.com','Vinh')
;

-- Thêm data loaidichvu
insert into loaidichvu(IdLoaiDichVu,TenLoaiDichVu)
values(1,'Villa'),
(2,'House'),
(3,'Room');

-- Thêm data kieuthue
insert into kieuthue(IdKieuThue,TenKieuThue,TangGia)
values(1,'VIP','10'),
(2,'Bussiness','5'),
(3,'Normal','0');

-- Thêm data dichvu
insert into dichvu(iddichvu,tendichvu,dientich,sotang,songuoitoida,ChiPhiThue,TrangThai,IdKieuThue,IdLoaiDichVu)
values (1,'HoaMinh','150','4','15','500','ChuaCoNguoiThue',3,1),
(2,'LienChieu','180','4','20','300','ChuaCoNguoiThue',3,2),
(3,'HoaKhanh','200','4','15','200','ChuaCoNguoiThue',1,1),
(4,'HoaBac','180','4','20','800','ChuaCoNguoiThue',3,1),
(5,'SonTra','110','4','15','300','ChuaCoNguoiThue',3,2),
(6,'NguHanhSon','100','4','5','200','ChuaCoNguoiThue',1,3),
(7,'HoangVanThai','100','4','5','300','ChuaCoNguoiThue',3,3),
(8,'DongNghe','180','4','15','900','CoNguoiThue',3,1),
(9,'ThuanPhuoc','300','4','15','700','ChuaCoNguoiThue',3,1),
(10,'HoaBac','150','4','20','500','ChuaCoNguoiThue',2,2),
(11,'BacMyAn','110','4','5','350','ChuaCoNguoiThue',2,3),
(12,'CamLe','150','4','15','450','ChuaCoNguoiThue',3,2)
;


-- Thêm data dichvudikem
insert into dichvudikem(IdDichVuDiKem,TenDichVuDiKem,Gia,TrangThaiKhaDung)
values(1,'Massage','100','CoTheSuDung'),
(2,'Karaoke','50','CoTheSuDung'),
(3,'ThucAn','50','CoTheSuDung'),
(4,'NuocUong','20','CoTheSuDung'),
(5,'ThueXe','30','CoTheSuDung');

-- trigger tinh tong tien
delimiter //
create trigger TongTien
before insert
on hopdong for each row
begin
set new.tongtien = new.thoigianthue*(select chiphithue from dichvu where dichvu.IdDichVu = new.IdDichVu)+
new.thoigianthue*(select chiphithue from dichvu where dichvu.IdDichVu = new.IdDichVu)*
(select tanggia from kieuthue where IdKieuThue = 
(select IdKieuThue from dichvu where IdDichVu = (select IdDichVu from dichvu where IdDichVu = new.IdDichVu))
)/100 
;
end; //
delimiter ;


-- trigger TrangThaiThue
delimiter //
create trigger TrangThaiThue
after insert
on hopdong for each row
begin
update dichvu
set trangthai = 'CoNguoiThue'
where dichvu.iddichvu = new.iddichvu;
end; //
delimiter ;



-- Thêm data hopdong
insert into hopdong(IdHopDong,NgayLamHopDong,NgayKetThuc,ThoiGianThue,TienDatCoc,IdNhanVien,IdKhachHang,IdDichVu)
values (1,'2019-10-19','2020-08-19','15','200',1,2,10),
(2,'2018-08-20','2019-04-25','10','200',10,8,3),
(3,'2017-01-20','2018-09-25','20','200',11,7,6),
(4,'2020-08-20','2020-09-25','30','200',12,8,7),
(5,'2018-08-20','2018-09-25','8','200',1,5,5),
(6,'2020-08-20','2020-09-25','19','200',11,2,8),
(7,'2019-12-20','2020-09-25','27','200',11,7,4),
(8,'2019-08-20','2019-09-25','27','200',12,7,3),
(9,'2018-08-20','2019-09-25','27','200',12,7,8),
(10,'2019-02-20','2019-09-25','27','200',12,15,4),
(11,'2019-03-20','2019-09-25','27','200',13,7,9),
(12,'2019-02-20','2019-09-25','27','200',13,16,9),
(13,'2019-03-20','2019-09-25','27','200',13,7,9),
(14,'2019-05-20','2019-09-25','27','200',13,15,9)
;

-- trigger tinh tong tien
delimiter //
create trigger TongTienUpdate
after insert
on hopdongchitiet for each row
begin
update hopdong
set tongtien = tongtien+
new.soluong*(select gia from dichvudikem where IdDichVuDiKem = new.IdDichVuDiKem)
where new.idhopdong = idhopdong;

end; //
delimiter ;

-- Thêm data hopdongchitiet
insert into hopdongchitiet(IdHopDongChiTiet,SoLuong,IdHopDong,IdDichVuDiKem)
values(1,2,1,2),
(2,3,2,5),
(3,1,3,2),
(4,2,4,4),
(5,3,10,3),
(6,2,6,2),
(7,1,12,1),
(8,2,14,5);

/* 
--------------------------------Yêu Cầu 2-------------------------------------------
Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
một trong các ký tự “H”,“T” hoặc “K” và có tối đa 15 ký tự.

*/

SELECT 
    *
FROM
    NhanVien
WHERE
    HoTen REGEXP BINARY '^[HTK].{0,14}$';
    
-- ----- Cach 1--------
SELECT 
    *
FROM
    nhanvien
WHERE
    RIGHT(hoten,
        POSITION(' ' IN REVERSE(hoten)) - 1) REGEXP BINARY '^[HTK].{0,14}$';

-- -----Cach 2 -----          
SELECT 
    *
FROM
    nhanvien
WHERE
    SUBSTRING_INDEX(hoten, ' ', - 1) REGEXP BINARY '^[HTK].{0,14}$';

/* 
--------------------------------Yêu Cầu 3-------------------------------------------
Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và
có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
*/

SELECT 
    *
FROM
    KhachHang
WHERE
    (DiaChi = 'Đà Nẵng'
        OR DiaChi = 'Quảng Trị')
        AND (2020 - YEAR(NgaySinh) >= 18
        AND 2020 - YEAR(NgaySinh) <= 50);

SELECT 
    *
FROM
    KhachHang
WHERE
    DiaChi IN ('Đà Nẵng' , 'Quảng Trị')
        AND (TIMESTAMPDIFF(YEAR,
        NgaySinh,
        CURRENT_DATE()) >= 18)
        AND (TIMESTAMPDIFF(YEAR,
        NgaySinh,
        CURRENT_DATE()) <= 50);

SELECT 
    idkhachHang,
    hoten,
    TIMESTAMPDIFF(YEAR,
        NgaySinh,
        CURRENT_DATE()) 'tuoi'
FROM
    KhachHang;

/* 
--------------------------------Yêu Cầu 4-------------------------------------------
Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu
lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của
khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là
“Diamond”.
*/

SELECT 
    hd.IdKhachHang 'ID Khach Hang',
    hoten 'Ho Ten',
    COUNT(hd.idkhachhang) 'So Lan Dat Phong'
FROM
    hopdong hd
        JOIN
    khachhang kh ON hd.idkhachhang = kh.idkhachhang
WHERE
    IdLoaiKhach = (SELECT 
            IdLoaiKhach
        FROM
            loaikhach
        WHERE
            tenloaikhach = 'Diamond')
GROUP BY hd.IdKhachHang
ORDER BY COUNT(hd.idkhachhang);


/* 
--------------------------------Yêu Cầu 5-------------------------------------------
Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong,
TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien (Với
TongTien được tính theo công thức như sau: ChiPhiThue +
SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả
các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng
đặt phòng cũng phải hiển thị ra).

*/
SELECT 
    hd.idkhachhang,
    hoten,
    tenloaikhach,
    idhopdong,
    tendichvu,
    NgayLamHopDong,
    NgayKetThuc,
    tongtien
FROM
    ((khachhang kh
    JOIN loaikhach lk ON kh.IdLoaiKhach = lk.IdLoaiKhach)
    JOIN hopdong hd ON hd.IdKhachHang = kh.IdKhachHang)
        JOIN
    dichvu dv ON dv.IdDichVu = hd.IdDichVu
GROUP BY hoten;


/* 
--------------------------------Yêu Cầu 6-------------------------------------------
Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue,
TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng
thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

*/
SELECT 
    dv.iddichvu,
    tendichvu,
    dientich,
    chiphithue,
    tenloaidichvu,
    ngaylamhopdong
FROM
    (dichvu dv
    LEFT JOIN hopdong hd1 ON hd1.iddichvu = dv.iddichvu)
        JOIN
    loaidichvu ldv ON dv.idloaidichvu = ldv.idloaidichvu
WHERE
    (DATEDIFF(hd1.ngaylamhopdong, '2019-01-01') < 0)
        AND (hd1.iddichvu NOT IN (SELECT 
            hd2.iddichvu
        FROM
            hopdong hd2
        WHERE
            (hd2.iddichvu = hd1.iddichvu)
                AND (hd1.idhopdong < hd2.idhopdong)
                AND (DATEDIFF(ngaylamhopdong, '2019-01-01') > 0)
                AND (DATEDIFF(ngaylamhopdong, '2019-03-31') < 0)));

/* 
--------------------------------Yêu Cầu 7-------------------------------------------
Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa,
ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã từng được
Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách
hàng đặt phòng trong năm 2019.

*/
SELECT 
    dv.IDDichVu,
    TenDichVu,
    DienTich,
    SoNguoiToiDa,
    ChiPhiThue,
    TenLoaiDichVu,
    hd1.ngaylamhopdong
FROM
    (dichvu dv
    JOIN hopdong hd1 ON dv.iddichvu = hd1.iddichvu)
        JOIN
    loaidichvu ldv ON ldv.idloaidichvu = dv.idloaidichvu
WHERE
    DATEDIFF(hd1.ngaylamhopdong, '2018-01-01') >= 0
        AND DATEDIFF(hd1.ngaylamhopdong, '2019-01-01') < 0
        AND hd1.iddichvu NOT IN (SELECT 
            iddichvu
        FROM
            hopdong hd2
        WHERE
            (hd1.iddichvu = hd2.iddichvu)
                AND (hd1.idhopdong <> hd2.idhopdong)
                AND (DATEDIFF(hd2.ngaylamhopdong, '2019-01-01') >= 0)
                AND (DATEDIFF(hd2.ngaylamhopdong, '2020-01-01') < 0));

/* 
--------------------------------Yêu Cầu 8-------------------------------------------
Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu
HoTenKhachHang không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên

*/


SELECT DISTINCT
    hoten
FROM
    khachhang;

-- Cach 2
SELECT 
    hoten
FROM
    khachhang
GROUP BY hoten;

-- Cach 3
UPDATE khachhang kh1
        JOIN
    khachhang kh2 ON (kh1.idkhachhang < kh2.idkhachhang)
        AND (kh1.hoten = kh2.hoten) 
SET 
    kh1.hoten = CONCAT(kh1.hoten, '@');
SELECT 
    hoten
FROM
    khachhang
WHERE
    POSITION('@' IN hoten) = 0;
UPDATE khachhang kh1 
SET 
    kh1.hoten = REPLACE(kh1.hoten, '@', '');
    
-- Cach 4
SELECT 
    hoten
FROM
    khachhang kh1
WHERE
    hoten NOT IN (SELECT 
            hoten
        FROM
            khachhang kh2
        WHERE
            (kh1.hoten = kh2.hoten)
                AND (kh1.idkhachhang < kh2.idkhachhang));

/* 
--------------------------------Yêu Cầu 9-------------------------------------------
Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi
tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt
phòng.
*/

SELECT 
    ngaylamhopdong, COUNT(IdKhachHang) 'soluongkhach'
FROM
    hopdong
WHERE
    YEAR(ngaylamhopdong) = '2019'
GROUP BY MONTH(ngaylamhopdong)
ORDER BY MONTH(ngaylamhopdong);

/* 
--------------------------------Yêu Cầu 10-------------------------------------------
Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu
Dịch vụ đi kèm. Kết quả hiển thị bao gồm IDHopDong,
NgayLamHopDong, NgayKetthuc, TienDatCoc,
SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).
*/

SELECT 
    hd.idhopdong,
    hd.ngaylamhopdong,
    hd.ngayketthuc,
    hd.tiendatcoc,
    SUM(soluong) 'SoLuongDichVuDiKem'
FROM
    hopdong hd
        LEFT JOIN
    hopdongchitiet hdct ON hdct.idhopdong = hd.idhopdong
GROUP BY idhopdong;


/* 
--------------------------------Yêu Cầu 11-------------------------------------------
Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách
hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh”
hoặc “Quảng Ngãi”.
*/

SELECT 
    hdct.iddichvudikem,
    tendichvudikem,
    kh.idkhachhang,
    kh.hoten,
    lk.tenloaikhach,
    kh.diachi
FROM
    (((hopdongchitiet hdct
    JOIN hopdong hd ON hd.idhopdong = hdct.idhopdong)
    JOIN khachhang kh ON kh.idkhachhang = hd.idkhachhang)
    JOIN loaikhach lk ON lk.idloaikhach = kh.idloaikhach)
        JOIN
    dichvudikem dvdk ON hdct.iddichvudikem = dvdk.iddichvudikem
WHERE
    (lk.tenloaikhach = 'Diamond')
        AND (kh.diachi = 'Vinh'
        OR kh.diachi = 'Quảng Ngãi');


/* 
--------------------------------Yêu Cầu 12-------------------------------------------
Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang,
SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (được
tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ
đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa
từng được khách hàng đặt vào 6 tháng đầu năm 2019.
*/

SELECT 
    hd.idhopdong,
    nv.hoten 'tennhanvien',
    kh.hoten 'tenkhachhang',
    kh.sdt 'sdt khachhang',
    dv.tendichvu 'ten dichvu',
    hd.ngaylamhopdong 'ngaylamhopdong',
    COUNT(hdct.soluong) 'soluong',
    hd.tiendatcoc
FROM
    (((hopdong hd
    LEFT JOIN nhanvien nv ON hd.idnhanvien = nv.idnhanvien)
    LEFT JOIN khachhang kh ON hd.idkhachhang = kh.idkhachhang)
    LEFT JOIN dichvu dv ON hd.iddichvu = dv.iddichvu)
        LEFT JOIN
    hopdongchitiet hdct ON hdct.idhopdong = hd.idhopdong
WHERE
    (DATEDIFF(hd.ngaylamhopdong, '2019-10-01') >= 0)
        AND (DATEDIFF(hd.ngaylamhopdong, '2019-12-31') < 0)
        AND (hd.iddichvu NOT IN (SELECT 
            hd2.iddichvu
        FROM
            hopdong hd2
        WHERE
            ((hd.iddichvu = hd2.iddichvu)
                AND (hd.idhopdong <> hd2.idhopdong))
                AND (DATEDIFF(hd2.ngaylamhopdong, '2019-01-01') >= 0
                AND DATEDIFF(hd2.ngaylamhopdong, '2019-06-30') < 0)))
GROUP BY hdct.idhopdong;

SELECT 
    dv.iddichvu, tendichvu, hd.ngaylamhopdong
FROM
    dichvu dv
        JOIN
    hopdong hd ON dv.iddichvu = hd.iddichvu
WHERE
    (DATEDIFF(hd.ngaylamhopdong, '2019-10-01') >= 0)
        AND (DATEDIFF(hd.ngaylamhopdong, '2019-12-31') < 0);

/* 
--------------------------------Yêu Cầu 13-------------------------------------------
Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các
Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử
dụng nhiều như nhau).
*/
SELECT 
    IdDichVuDiKem, COUNT(IdDichVuDiKem) 'so luong su dung'
FROM
    hopdongchitiet
GROUP BY IdDichVuDiKem
HAVING COUNT(IdDichVuDiKem) = (SELECT 
        MAX(count)
    FROM
        (SELECT 
            IdDichVuDiKem, COUNT(IdDichVuDiKem) AS count
        FROM
            hopdongchitiet hdct
        GROUP BY IdDichVuDiKem) AS max);
        


/* 
--------------------------------Yêu Cầu 14-------------------------------------------
Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một
lần duy nhất. Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu,
TenDichVuDiKem, SoLanSuDung.
*/

SELECT 
    hd.IdHopDong,
    ldv.tenloaidichvu,
    dvdk.tendichvudikem,
    COUNT(hdct.IdDichVuDiKem) 'solansudung'
FROM
    hopdongchitiet hdct
        JOIN
    hopdong hd ON hd.idhopdong = hdct.idhopdong
        JOIN
    dichvudikem dvdk ON dvdk.IdDichVuDiKem = hdct.IdDichVuDiKem
        JOIN
    dichvu dv ON dv.IdDichVu = hd.IdDichVu
        JOIN
    loaidichvu ldv ON dv.IdLoaiDichVu = ldv.IdLoaiDichVu
GROUP BY hdct.IdDichVuDiKem
HAVING COUNT(hdct.IdDichVuDiKem) = 1;

/* 
--------------------------------Yêu Cầu 15-------------------------------------------
Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen,
TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3
hợp đồng từ năm 2018 đến 2019.
*/

create view hopdong_2018_2019 as
select * from hopdong
where year(ngaylamhopdong) in ('2018','2019');


select nv.idnhanvien,nv.hoten,td.trinhdo,bp.tenbophan,nv.sdt,nv.diachi,count(*) 'so lan lap hop dong 2018-2019'
from nhanvien nv join hopdong_2018_2019 hdv on nv.IdNhanVien = hdv.IdNhanVien
join trinhdo td on td.IdTrinhDo = nv.IdTrinhDo
join bophan bp on bp.IdBoPhan = nv.IdBoPhan
group by IdNhanVien
having count(*) <=3;

/* 
--------------------------------Yêu Cầu 16-------------------------------------------
Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017
đến năm 2019.
*/

create view hopdong_2017_2019 as
select * from hopdong
where year(ngaylamhopdong) in ('2017','2018','2019');

select * from hopdong_2017_2019;

delete from nhanvien
where IdNhanVien not in (select IdNhanVien from hopdong_2017_2019);














