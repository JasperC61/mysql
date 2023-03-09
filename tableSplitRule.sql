create table emp(
  id int primary key auto_increment,
  name varchar(30),
  age int,
  dep_name varchar(30),
  dep_loc varchar(30)
  );
  
  -- 添加數據
  insert into emp (name,age,dep_name,dep_loc) values('陳筱麗',20,'研發部','台北'),
  ('李正',36,'研發部','台北'),('王平林',45,'研發部','台北'),
  ('黃莉莉',20,'業務部','南港'),('陳洁兒',28,'業務部','南港'),
  ('周瑪莉',36,'業務部','南港');
  
  SELECT * FROM rrr2.emp;
  
  -- 數據有多餘數據
  
  -- 表的拆分
  
  -- 解決方法
  
  create table depart(
  id int primary key auto_increment,
  dep_name varchar(20),
  dep_loc varchar(20)
  );
  
  create table employee(
  id int primary key auto_increment,
  name varchar(20),
  age int,
  dep_id int,
  constraint emp_dept_fk foreign key(dep_id ) references depart (id)  -- 添加外鍵
  );
  
  insert into depart (id,dep_name ,dep_loc) value(null,'研發部','台北'),
  (null,'業務部','南港');
  
  select * from  depart;
  SELECT * FROM rrr2.employee;
  insert into employee (name,age,dep_id) values('陳筱麗',20,1),
  ('李正',36,1),('王平林',45,1),
  ('黃莉莉',20,2),('陳洁兒',28,2),
  ('周瑪莉',36,2);
  
  -- 外鍵約束
   alter table rrr2.employee add constraint emp_dept_fk foreign key(dep_id ) references depart (id);
  -- 外鍵刪除
  alter table rrr2.employee drop foreign key emp_dept_fk;
  
update employee set dep_id=null where dep_id=1;
  
update employee set dep_id=5 where dep_id is null; 
-- 添加外鍵,設置級連更新
alter table employee add constraint emp_dept_fk foreign key(dep_id) references depart (id) on update cascade; 
 
 
-- 添加外鍵,設置級連更新,設置級連刪除
alter table employee add constraint emp_dept_fk foreign key(dep_id) references depart (id) on update cascade on delete cascade; 

/* 數據庫的設計
分類
1. 多表之間的關係
	1對1: 如人和身分證
		再任意一方添加唯一外鍵指向另一方的主鍵
    1對多(多對1):如部門跟員工
       在多的一方建立外鍵,指向1的一方主鍵
    多對多:如學生跟課程
		多對多關係中須建立中間表
        中間表至少包含2個字段,這2個字段作為第3張表的外鍵,分別指向2張表的主鍵
2. 數據庫的設計正規化
   

*/