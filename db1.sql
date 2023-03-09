create table dept(
	id int primary key auto_increment,
    name varchar(20)
    );
    
insert into dept(name) values ('開發部'),('市場部'),('財務部');
SELECT * FROM db1.dept;
create table emp(
	id int primary key auto_increment,
    name varchar(20),
    gender char(1),
    salary double,
    join_date date ,
    dept_id int,
    foreign key (dept_id) references dept(id)
    );
    
insert into emp(name,gender,salary,join_date,dept_id) values('陳美美','F',35000,'2013-02-15',1),
 ('李小鳳','F',55000,'2016-02-9',2),
 ('李正男','M',55000,'2012-06-22',3),
 ('林吉兒','F',65000,'2010-08-09',2),
 ('成大中','F',45000,'2009-01-15',1);
 
 SELECT * FROM db1.emp;
 
  SELECT * FROM emp,dept;
  -- 笛卡爾積消除無用數據
  
  /*
  多表查詢分類
  1 inner join
	a.隱式內連接  where 
    b.顯示內連接
  2 outer join
  3.子查詢
  */
  -- 隱式內連接  where 
  select * from emp,dept where emp.dept_id =dept.id;
  
  select emp.name,emp.gender,dept.name from emp,dept where emp.dept_id =dept.id; 
  
  select 
	e.name,
    e.gender,
    d.name
  from 
	emp e,
    dept d
  where 
     e.dept_id=d.id;
-- inner join
select * from emp inner join dept on emp.dept_id=dept.id;


#子查詢 單行單列,多行單列,多行多列
-- 查詢工資最高是多少
select max(salary) from emp;
-- 查員工資訊,條件薪水=65000 單行單列
select * from emp where emp.salary=65000;
-- 用一條語法完成上面2個動作 多行單列
select * from emp where emp.salary=(select max(salary) from emp) ;

-- 查員工資訊,條件員工是財務部或市場部
select * from emp where dept_id=3 or  dept_id=2;
select * from emp where dept_id in(3,2);

select * from emp where emp.join_date > '2012-11-11';  -- 設為一張虛擬表
-- 查員工資訊,條件員工是2010-11-11入職該群員工部門及資料(多行多列)
-- 子查詢
select * from dept d,(select * from emp where emp.join_date > '2012-11-11') e
where d.id=e.dept_id;

-- 普通內連接
select * from emp e,dept d where e.dept_id=d.id and e.join_date>'2012-11-11';
