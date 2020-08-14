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

CREATE TABLE NhanVien
(
    IdNhanVien INT auto_increment,
    HoTen      VARCHAR(50),
    NgaySinh   DATE,
    SoCMND     VARCHAR(50),
    GioiTinh    VARCHAR(50),
    Luong      VARCHAR(50),
    SDT        VARCHAR(50),
    Email      VARCHAR(50),
    DiaChi     VARCHAR(50),
    flag        boolean,
    PRIMARY KEY (IdNhanVien)
);
CREATE TABLE ViTri
(
    IdViTri  INT auto_increment,
    TenViTri VARCHAR(50),
    PRIMARY KEY (IdViTri)
);
CREATE TABLE TrinhDo
(
    IdTrinhDo INT auto_increment,
    TrinhDo   VARCHAR(50),
    PRIMARY KEY (IdTrinhDo)
);
CREATE TABLE BoPhan
(
    IdBoPhan  INT auto_increment,
    TenBoPhan VARCHAR(50),
    PRIMARY KEY (IdBoPhan)
);

CREATE TABLE HopDong
(
    IdHopDong      INT auto_increment,
    NgayLamHopDong DATE,
    NgayKetThuc    DATE,
    ThoiGianThue   INT,
    TienDatCoc     INT,
    TongTien       INT,
    flag        boolean,
    PRIMARY KEY (IdHopDong)
);

CREATE TABLE HopDongChiTiet
(
    IdHopDongChiTiet INT auto_increment,
    SoLuong          INT,
    PRIMARY KEY (IdHopDongChiTiet)
);

CREATE TABLE DichVuDiKem
(
    IdDichVuDiKem    INT auto_increment,
    TenDichVuDiKem   VARCHAR(50),
    Gia              INT,
    TrangThaiKhaDung VARCHAR(50),
    PRIMARY KEY (IdDichVuDiKem)
);

CREATE TABLE KhachHang
(
    IdKhachHang INT auto_increment,
    HoTen       VARCHAR(50),
    NgaySinh    DATE,
    GioiTinh    VARCHAR(50),
    SoCMND      VARCHAR(50),
    SDT         VARCHAR(50),
    Email       VARCHAR(50),
    DiaChi      VARCHAR(50),
    flag        boolean,
    PRIMARY KEY (IdKhachHang)
);

CREATE TABLE LoaiKhach
(
    IdLoaiKhach  INT auto_increment,
    TenLoaiKhach VARCHAR(50),
    PRIMARY KEY (IdLoaiKhach)
);

CREATE TABLE DichVu
(
    IdDichVu     INT auto_increment,
    TenDichVu    VARCHAR(50),
    DienTich     INT,
    SoTang       INT,
    SoNguoiToiDa INT,
    ChiPhiThue   INT,
    TrangThai    VARCHAR(50),
    flag        boolean,
    PRIMARY KEY (IdDichVu),
    CHECK (songuoitoida <= 20)
);

CREATE TABLE KieuThue
(
    IdKieuThue  INT auto_increment,
    TenKieuThue VARCHAR(50),
    TangGia     INT,
    PRIMARY KEY (IdKieuThue)
);

CREATE TABLE LoaiDichVu
(
    IdLoaiDichVu  INT auto_increment,
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
        foreign key (IdViTri) references ViTri (IdViTri);

-- Nhan Vien - Trinh Do 1-n
alter table NhanVien
    add column IdTrinhDo int,
    add constraint IdTrinhDo
        foreign key (IdTrinhDo) references TrinhDo (IdTrinhDo);

-- Nhan Vien - Bo Phan 1-n
alter table NhanVien
    add column IdBoPhan int,
    add constraint IdBoPhan
        foreign key (IdBoPhan) references BoPhan (IdBoPhan);

-- Nhan Vien - Hop Dong 1-n
alter table HopDong
    add column IdNhanVien int,
    add constraint IdNhanVien
        foreign key (IdNhanVien) references NhanVien (IdNhanVien);

/*
--------------------------------Constraint Hop Dong-------------------------------------------
*/

-- HopDongChiTiet - Hop Dong 1-n
alter table HopDongChiTiet
    add column IdHopDong INT,
    add constraint IdHopDong
        foreign key (IdHopDong) references HopDong (IdHopDong);

-- HopDongChiTiet - DichVuDiKem 1-n
alter table HopDongChiTiet
    add column IdDichVuDiKem INT,
    add constraint IdDichVuDiKem
        foreign key (IdDichVuDiKem) references DichVuDiKem (IdDichVuDiKem);

-- HopDong - KhachHang 1-n
alter table HopDong
    add column IdKhachHang int,
    add constraint IdKhachHang
        foreign key (IdKhachHang) references KhachHang (IdKhachHang);

-- HopDong - DichVu 1-n
alter table HopDong
    add column IdDichVu int,
    add constraint IdDichVu
        foreign key (IdDichVu) references DichVu (IdDichVu);


/*
--------------------------------Constraint Dich Vu-------------------------------------------
*/

-- Kieu Thue - DichVu 1-n
alter table DichVu
    add column IdKieuThue int,
    add constraint IdKieuThue
        foreign key (IdKieuThue) references KieuThue (IdKieuThue);

-- Loai Dich Vu - DichVu 1-n
alter table DichVu
    add column IdLoaiDichVu int,
    add constraint IdLoaiDichVu
        foreign key (IdLoaiDichVu) references LoaiDichVu (IdLoaiDichVu);

/*
--------------------------------Constraint Khach Hang-------------------------------------------
*/

-- Khach Hang - Loai Khach 1-n
alter table KhachHang
    add column IdLoaiKhach int,
    add constraint IdLoaiKhachfk
        foreign key (IdLoaiKhach) references LoaiKhach (IdLoaiKhach);



/*
--------------------------------Them DaTa-------------------------------------------
*/

-- Thêm data Trinh Do
insert into TrinhDo(IdTrinhDo, TrinhDo)
values (1, 'Trung cấp'),
       (2, 'Cao đẳng'),
       (3, 'Đại học'),
       (4, 'Sau Đại Học');

-- Thêm data Vi Tri
insert into ViTri(IdViTri, TenViTri)
values (1, 'Lễ Tân'),
       (2, 'Phục Vụ'),
       (3, 'Chuyên Viên'),
       (4, 'Giám Sát'),
       (5, 'Quản Lý'),
       (6, 'Giám Đốc');

-- Thêm data BoPhan
insert into BoPhan(IdBoPhan, TenBoPhan)
values (1, 'Sale – Marketing'),
       (2, 'Hành Chính'),
       (3, 'Phục vụ'),
       (4, 'Quản lý');

-- Thêm data LoaiKhach
insert into LoaiKhach(TenLoaiKhach)
values ('Diamond'),
       ('Platinium'),
       ('Gold'),
       ('Silver'),
       ('Member');

-- Thêm data loaidichvu
insert into loaidichvu(TenLoaiDichVu)
values ('Villa'),
       ('House'),
       ('Room');

-- Thêm data kieuthue
insert into kieuthue(TenKieuThue, TangGia)
values ('VIP', '10'),
       ('Bussiness', '5'),
       ('Normal', '0');

-- Thêm data dichvudikem
insert into dichvudikem(TenDichVuDiKem, Gia, TrangThaiKhaDung)
values ('Massage', '100', 'CoTheSuDung'),
       ('Karaoke', '50', 'CoTheSuDung'),
       ('ThucAn', '50', 'CoTheSuDung'),
       ('NuocUong', '20', 'CoTheSuDung'),
       ('ThueXe', '30', 'CoTheSuDung');

-- trigger tinh tong tien
delimiter //
create trigger TongTien
    before insert
    on hopdong
    for each row
begin
    set new.tongtien = new.thoigianthue * (select chiphithue from dichvu where dichvu.IdDichVu = new.IdDichVu) +
                       new.thoigianthue * (select chiphithue from dichvu where dichvu.IdDichVu = new.IdDichVu) *
                       (select tanggia
                        from kieuthue
                        where IdKieuThue =
                              (select IdKieuThue
                               from dichvu
                               where IdDichVu = (select IdDichVu from dichvu where IdDichVu = new.IdDichVu))
                       ) / 100;
end;
//
delimiter ;


-- trigger TrangThaiThue
delimiter //
create trigger TrangThaiThue
    after insert
    on hopdong
    for each row
begin
    update dichvu
    set trangthai = 'CoNguoiThue'
    where dichvu.iddichvu = new.iddichvu;
end;
//
delimiter ;

-- Thêm data KhachHang
insert into KhachHang(IdLoaiKhach,HoTen,NgaySinh,GioiTinh,SoCMND,SDT,Email,DiaChi,flag)
values ('1','Trịnh Thị Thúy Ngân','2000-06-11','Nữ','201549456','0905343939','NTNgan@gmail.com','Đà Nẵng',1),
       ('1','Nguyễn Thúy Hằng','1999-07-11','Nữ','201549457','0905853439','NTHang@gmail.com','Quảng Bình',1),
       ('3','Nguyễn Thị Kiều','1997-08-18','Nữ','201549756','0905834939','NTKieu@gmail.com','Đà Nẵng',1),
       ('5','Nguyễn Minh Hải','1990-06-19','Nam','201549456','0905856939','NMHai@gmail.com','Đà Nẵng',1),
       ('1','Nguyễn Minh Trí','1993-06-25','Nam','201543456','0902553939','NminhTri@gmail.com','Hà Nội',1),
       ('2','Nguyễn Vũ Khang','1980-02-19','Nam','201549456','0905783939','Nduogn@gmail.com','Hải Phòng',1),
       ('5','Nguyễn Văn Lập','1930-07-21','Nam','201659456','0905896939','NvanLap@gmail.com','Quãng Ngãi',1),
       ('1','Trịnh Thu Ngân','1990-08-25','Nữ','201578456','0905353939','Nthungan@gmail.com','Vinh',1),
       ('1','Trương Văn Được','1935-08-25','Nam','201589456','0905763939','Nvanduoc@gmail.com','Quảng Trị',1),
       ('3','Mã Văn Tài','1995-06-13','Nam','201547656','0905853879','Nvantai@gmail.com','Cần Thơ',1),
       ('1','Nguyễn Thị LiNa','1993-06-30','Nữ','201534456','0905453939','NThilina@gmail.com','Nghệ An',1),
       ('1','Nguyễn Thị LiNa','1994-06-30','Nữ','201534456','0905453939','NThilina@gmail.com','Nghệ An',1),
       ('1','Nguyễn Thị Thảo','1994-06-30','Nữ','201534456','0905453939','NThilina@gmail.com','Nghệ An',1),
       ('1','Nguyễn Thị Cam','1994-06-30','Nữ','201534456','0905453939','NThilina@gmail.com','Vinh',1),
       ('1','Nguyễn Thị Hương','1994-06-30','Nữ','201534456','0905453939','NThilina@gmail.com','Quãng Ngãi',1),
       ('1','Nguyễn Thị Hồng','1994-06-30','Nữ','201534456','0905453939','NThilina@gmail.com','Vinh',1)
;

-- Thêm data NhanVien
insert into NhanVien(IdTrinhDo,IdViTri,IdBoPhan,HoTen,NgaySinh,SoCMND,Luong,GioiTinh,SDT,Email,DiaChi,flag)
values ('1','1','1','Nguyễn Thúy Ngân','2000-06-11','201549456','250USD','Nữ','0905343939','NTNgan@gmail.com','515 Nguyen Cong Tru',1),
       ('2','2','2','Nguyễn Thúy Hằng','1999-07-11','201549457','250USD','Nữ','0905853439','NTHang@gmail.com','212 Nguyen Luong bang',1),
       ('3','3','3','Nguyễn Thị Kiều','1997-08-18','201549756','300USD','Nữ','0905834939','NTKieu@gmail.com','214 Ha Huy Tap',1),
       ('4','4','4','Nguyễn Minh Hải','1990-06-19','201549456','300USD','Nam','0905856939','NMHai@gmail.com','213 Ton Duc Thang',1),
       ('1','5','4','Nguyễn Minh Trí','1993-06-25','201543456','1000USD','Nam','0902553939','NminhTri@gmail.com','3215 Le Duan',1),
       ('2','6','4','Nguyễn Vũ Khang','1980-02-19','201549456','2000USD','Nam','0905783939','Nduogn@gmail.com','2115 Nguyen Minh Triet',1),
       ('4','1','2','Nguyễn Văn Lập','1970-07-21','201659456','250USD','Nam','0905896939','NvanLap@gmail.com','2135 Ho Tung Mau',1),
       ('4','2','2','Trịnh Thu Ngân','1990-08-25','201578456','750USD','Nữ','0905353939','Nthungan@gmail.com','2135 Yết Kiêu',1),
       ('3','3','2','Trương Văn Được','1999-08-25','201589456','150USD','Nam','0905763939','Nvanduoc@gmail.com','225 Trương Quốc Toản',1),
       ('3','4','1','Mã Văn Tài','1995-06-13','201547656','350USD','Nam','0905853879','Nvantai@gmail.com','21 Lê Hồng Phong',1),
       ('2','1','1','Nguyễn Thị LiNa','1993-06-30','201534456','450USD','Nữ','0905453939','NThilina@gmail.com','15 Phạm Ngũ Lão',1),
       ('2','1','1','Hồ Thị Cẩm Đào','1993-06-30','201534456','450USD','Nữ','0905453939','Hothicd@gmail.com','80 Chu Văn Nguyên',1),
       ('2','1','1','Hoàng Mai Nhi','1993-06-30','201534456','450USD','Nữ','0905453939','Hmainhi@gmail.com','60 Bàu Cát',1)
;

-- Thêm data dichvu
insert into dichvu(tendichvu,dientich,sotang,songuoitoida,ChiPhiThue,TrangThai,IdKieuThue,IdLoaiDichVu,flag)
values ('HoaMinh','150','4','15','500','ChuaCoNguoiThue',3,1,1),
       ('LienChieu','180','4','20','300','ChuaCoNguoiThue',3,2,1),
       ('HoaKhanh','200','4','15','200','ChuaCoNguoiThue',1,1,1),
       ('HoaBac','180','4','20','800','ChuaCoNguoiThue',3,1,1),
       ('SonTra','110','4','15','300','ChuaCoNguoiThue',3,2,1),
       ('NguHanhSon','100','4','5','200','ChuaCoNguoiThue',1,3,1),
       ('HoangVanThai','100','4','5','300','ChuaCoNguoiThue',3,3,1),
       ('DongNghe','180','4','15','900','CoNguoiThue',3,1,1),
       ('ThuanPhuoc','300','4','15','700','ChuaCoNguoiThue',3,1,1),
       ('HoaBac','150','4','20','500','ChuaCoNguoiThue',2,2,1),
       ('BacMyAn','110','4','5','350','ChuaCoNguoiThue',2,3,1),
       ('CamLe','150','4','15','450','ChuaCoNguoiThue',3,2,1)
;

-- Thêm data hopdong
insert into hopdong(NgayLamHopDong,NgayKetThuc,ThoiGianThue,TienDatCoc,IdNhanVien,IdKhachHang,IdDichVu,flag)
values ('2019-10-19','2020-08-19','15','200',1,2,10,1),
       ('2018-08-20','2019-04-25','10','200',10,8,3,1),
       ('2017-01-20','2018-09-25','20','200',11,7,6,1),
       ('2020-08-20','2020-09-25','30','200',12,8,7,1),
       ('2018-08-20','2018-09-25','8','200',1,5,5,1),
       ('2020-08-20','2020-09-25','19','200',11,2,8,1),
       ('2019-12-20','2020-09-25','27','200',11,7,4,1),
       ('2019-08-20','2019-09-25','27','200',12,7,3,1),
       ('2018-08-20','2019-09-25','27','200',12,7,8,1),
       ('2019-02-20','2019-09-25','27','200',12,15,4,1),
       ('2019-03-20','2019-09-25','27','200',13,7,9,1),
       ('2019-02-20','2019-09-25','27','200',13,16,10,1),
       ('2019-03-20','2019-09-25','27','200',13,7,11,1),
       ('2019-05-20','2019-09-25','27','200',13,15,12,1)
;


show tables;
select * from bophan;
select * from dichvu;
select * from dichvudikem;
select * from hopdong;
select * from hopdongchitiet;
select * from khachhang;
select * from kieuthue;
select * from loaidichvu;
select * from nhanvien;
select * from trinhdo;
select * from vitri;