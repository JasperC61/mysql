

create table product(
	id int primary key  auto_increment,
    name varchar(255) not null
    );
CREATE TABLE variant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    size VARCHAR(2) NOT NULL,
    price INT NOT NULL DEFAULT 30
); 
    insert into variant(product_id,size,price) values(1,'中杯',40);
    insert into variant(product_id,size,price) values(1,'大杯',50);  
    insert into variant(product_id,size,price) values(2,'中杯',50);  
	insert into variant(product_id,size,price) values(2,'大杯',60);  
	insert into variant(product_id,size,price) values(3,'中杯',45);  
	insert into variant(product_id,size,price) values(3,'大杯',55); 
    
	insert into product(name) values('美式');
	insert into product(name) values('拿鐵');
	insert into product(name) values('奶茶');
    insert into product(name) values('青茶');
    insert into product (name) values('綠茶');
 
 
select avg(price) from variant;
select max(price) from variant;
select std(price) from variant;
select std(price), max(price),std(price) from variant;

select * from product;
select * from variant;

select avg(price) from variant group by product_id;
select product_id,avg(price) from variant group by product_id;

select size,avg(price) from variant group by size;


select product.name, avg(variant.price) 
from variant inner join product on variant.product_id=product.id 
group by product_id;
