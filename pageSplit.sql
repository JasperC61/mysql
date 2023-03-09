create table stu1(
id int ,
name varchar(20),
age int,
sex varchar(5),
address varchar(100),
math int,
english int
);

insert into  stu1 (id,name,age,sex,address,math,english) values(1,'林小美',18,'女','板橋',88,90),
(2,'張曉明',19,'男','士林',100,90),
(3,'彭小萱',20,'女','土城',100,98),
(4,'周春春',17,'女','北投',70,90),
(5,'黃大中',16,'男','南港',66,77),
(6,'陳小貴',15,'男','萬華',88,100),
(7,'李木子',14,'男','中和',54,90),
(8,'錢密密',17,'女','永和',100,null);

insert into  stu1 (id,name,age,sex,address,math,english) values(9,'陳莉莉',18,'女','士林',88,87);
insert into  stu1 (id,name,age,sex,address,math,english) values(10,'官全',18,'男','士林',99,66);
insert into  stu1 (id,name,age,sex,address,math,english) values(11,'全正中',18,'男','三重',99,66);
insert into  stu1 (id,name,age,sex,address,math,english) values(12,'王中平',18,'男','新莊',99,66);
SELECT * FROM rrr2.stu1;
select name,math,english,english+math from stu1;
-- englis 分數為Null設為0
select name,math,english,ifnull(english,0)+math from stu1;
select name,math,english,ifnull(english,0)+math as totalScore from stu1;
-- 設總分別名as 或空格
select name,math 數學,english 英文,ifnull(english,0)+math as 總分 from stu1;
-- 關閉安全模式
set sql_safe_updates=0;
update stu1 set age=55 where id=1;
-- 關閉唯讀
set global read_only=0;
select * from stu1 where age>20;
select * from stu1 where age=20;
select * from stu1 where age !=20;
select * from stu1 where age <>20;

select * from stu1 where age in(18,20,25);
select * from stu1 where english is null;
select * from stu1 where english is not null;
select * from stu1 where name like '張%';
-- 查詢名字第2個字是小
select * from stu1 where name like '_小%';
-- 查詢名字2個字
select * from stu1 where name like '__';  
-- 查詢名字有陳這個字
select * from stu1 where name like '%陳%';
-- 查詢名字有中這個字
select * from stu1 where name like '%中%';
-- 排序方式 照數學分數 ASC升序 default
select * from stu1 order by math;
-- 先按數學成績排,在按英文成績排(ASC)
select * from stu1 order by math,english;
-- 聚合函數 COUNT MAX,MIN.AVG.SUM,排除null
-- 用名字去計算有多少人 12人,無null
select count(name) from stu1;
-- 用英文去計算有多少人 11人,有null
select count(english) from stu1;
-- 下ifnull判斷人數
select count(ifnull(english,0) )from stu1;
select count(*)from stu1;
select max(math) from stu1;
select min(math) from stu1;
select sum(math)from stu1;
select sum(english)from stu1;
select avg(english) from stu1;
SELECT * FROM rrr2.stu1;
-- 分組查詢 group by
-- 按性別分組,查詢男女生平均分數(數學)
select sex,avg(math) from stu1 group by sex;
-- 按性別分組,查詢男女生平均分數(數學),及人數
select sex,avg(math),count(id) from stu1 group by sex;
-- 按性別分組,查詢男女生平均分數(數學),及人數 要求分數低於70,不參予分組
select sex,avg(math),count(id) from stu1 where math>70 group by sex;
-- 按性別分組,查詢男女生平均分數(數學),及人數 要求分數低於70,不參予分組,分組後人數要大於4
-- where 在分組前進行限定.不滿足條件不參予分組,having在分組後進行限定,不滿足,則不會被查詢出來
-- where 後不可以跟聚合函數,having可以跟聚合函數判斷
select sex,avg(math),count(id) from stu1 where math>70 group by sex having count(id)>4;
-- 每頁顯示3條紀錄  公式 開始索引=(當前頁碼-1) *每頁顯示條數
select * from stu1 limit 0,3;  -- 頁1
select * from stu1 limit 3,3;  -- 頁2
select * from stu1 limit 6,3;  -- 頁3
select * from stu1 limit 9,3;  -- 頁4



