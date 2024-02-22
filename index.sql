show tables;

create table product (
id int primary key auto_increment,
name varchar(255) not null);

create table variant(
id int primary key auto_increment,
product_id int,
size varchar(2) not null,
price int not null default 30
);

select * from product;


    insert into product(name) values('美式');
	insert into product(name) values('拿鐵');
	insert into product(name) values('奶茶');
    insert into product(name) values('青茶');
    insert into product (name) values('綠茶');
    
select * from product where  name='青茶';
/*
   顯示搜尋方式
*/
explain select * from product where  name='青茶';
/*
  在product欄為中新增索引
*/
alter table product add index name_index(name);
/*
  刪除索引
*/
alter table product drop index name_index;
/*
 主鍵也是索引
*/
explain select * from product where id=4;

