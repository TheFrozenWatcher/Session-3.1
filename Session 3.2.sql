create database if not exists QuanLyBanHang;
use QuanLyBanHang;
create table if not exists Customer(
cId int primary key auto_increment,
cName varchar(100) not null,
cAge int not null
);

create table if not exists Orders(
oId int primary key auto_increment,
cId int,
foreign key (cId) references Customer(cId),
oDate datetime default now(),
oTotalPrice double not null
);

create table if not exists Product(
pId int primary key auto_increment,
pName varchar(100) not null,
pPrice double not null
);

create table OrderDetail(
oId int,
pId int,
foreign key (oId) references Orders(oId),
foreign key (pId) references Product(pId),
odQTy int not null
);