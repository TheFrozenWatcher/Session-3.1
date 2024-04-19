create database student_management;
use student_management;

create table Class(
id int auto_increment primary key,
name varchar(50) not null
);

create table Teacher(
id int auto_increment primary key,
name varchar(50) not null,
age int check (age>0) not null,
country varchar(50) not null
)
