create database quanlybanhang;
use quanlybanhang;

create table NhaCungCap(
MaNCC nvarchar(5) primary key auto_increment,
TenNCC nvarchar(50) not null,
DiaChi nvarchar(50) not null,
DienThoai nvarchar(15) not null,
Email nvarchar(30) not null,
Website nvarchar(30) not null
);
create table NhanVien(
MaNV nvarchar(4) not null primary key auto_increment,
HoTen nvarchar(30) not null,
GioiTinh bit not null,
DiaChi nvarchar(50) not null,
NgaySinh datetime,
DienThoai nvarchar(15),
Email text,
NoiSinh nvarchar(20),
NgayVaoLam datetime,
MaNQL nvarchar(4));

create table PhieuNhap(
SoPN nvarchar(5) primary key auto_increment not null,
MaNV nvarchar(4) not null,
MaNCC nvarchar(5) not null,
NgayNhap datetime not null default now,
GhiChu text,
foreign key (MaNV) references NhanVien(MaNV),
foreign key(MaNCC) references NhaCungCap(MaNCC)
);

create table LoaiSP(
MaloaiSP nvarchar(4) primary key auto_increment not null,
TenloaiSP nvarchar(30) not null,
GhiChu nvarchar(100)
);

create table SanPham(
MaSP nvarchar(4) not null primary key auto_increment,
MaloaiSP nvarchar(4) not null,
TenSP nvarchar(50) not null,
Donvitinh varchar(20) not null,
GhiChu text
);

 create table CTPhieuNhap(
MaSP int,
SoPN int,
Soluong int check (Soluong>0),
GiaNhap int not null check (GiaNhap>=0),
foreign key (MaSP) references SanPham(MaSP),
foreign key (SoPN) references PhieuNhap(SoPN)
);

create table KhachHang(
MaKH nvarchar(4) primary key not null auto_increment,
TenKH nvarchar(30) not null,
DiaChi nvarchar(50),
SoDT nvarchar(15) unique,
NgaySinh datetime
);
create table PhieuXuat(
SoPX int primary key auto_increment,
MaNV int,
MaKH int,
NgayBan datetime not null,
GhiChu text,
foreign key (MaNV) references NhanVien(MaNV),
foreign key(MaKH) references KhachHang(MaKH)
);

create table CTPhieuXuat(
MaSP int,
SoPX int,
Soluong int check (Soluong>0),
GiaBan int not null check (GiaBan>=0),
foreign key (MaSP) references SanPham(MaSP),
foreign key (SoPX) references PhieuXuat(SoPX)
);


