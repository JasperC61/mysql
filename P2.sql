/*
顯示資料庫
    */
show databases;

/*
 正在使用中表
*/
use mybd;
/*
  顯示表
*/
show tables;

/*
建立表及其內部屬性及名稱

*/

create table product(
	id int primary key  auto_increment,
    name varchar(255) not null
    );
    
create table variant(
	id int primary key auto_increment,
    product_id int,
    size varchar(2) not null,
    price int not null default 30
    );
    
    
/*
   顯示表內容
*/
    
    select * from product;
    select * from variant;
    
/*
   插入資料

*/
    insert into variant(product_id,size,price) values(1,'中杯',40);
    insert into variant(product_id,size,price) values(1,'大杯',50);  
    insert into variant(product_id,size,price) values(2,'中杯',50);  
	insert into variant(product_id,size,price) values(2,'大杯',60);  
	insert into variant(product_id,size,price) values(3,'中杯',45);  
	insert into variant(product_id,size,price) values(3,'大杯',55);  
    
    insert into variant(product_id,size,price) values(5,'大杯',100);
    
    insert into product(name) values('美式');
	insert into product(name) values('拿鐵');
	insert into product(name) values('奶茶');
    insert into product(name) values('青茶');
    insert into product (id,name) values(3,'奶茶');
  
/*
    內合併
    左合併
    右合併
 
*/
select * from product inner join variant on product.id=variant.product_id;
select * from product left join variant on product.id=variant.product_id;
select * from product right join variant on product.id=variant.product_id;

/*
    顯示欄位的內合併
*/
select product.name,variant.size,variant.price from product 
inner join variant on product.id=variant.product_id;

/*
刪除id是3產品

*/
delete from product where id=3;
delete from variant where product_id=3;


/*
增加外鍵去關聯product跟variant兩張表
*/
alter table variant add foreign key(product_id) references product(id);




