SELECT * FROM travel.tab_category;

CREATE TABLE `travel`.`tab_category` (
  `cid` INT NOT NULL AUTO_INCREMENT,
  `cname` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE INDEX `cname_UNIQUE` (`cname` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `travel`.`tab_route` (
  `rid` INT NOT NULL AUTO_INCREMENT,
  `rname` VARCHAR(100) NOT NULL,
  `price` DOUBLE NULL,
  `rdate` DATE NULL,
  `cid` INT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE INDEX `rname_UNIQUE` (`rname` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `travel`.`tab_route` (
  `rid` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `rname` VARCHAR(100) NOT NULL UNIQUE,
  `price` DOUBLE NULL,
  `rdate` DATE NULL,
  `cid` INT NULL,
   foreign key(cid) references tab_category(cid));
   
   create table tab_user(
   uid int primary key auto_increment,
   username varchar(100) unique not null,
   password varchar(30) not null,
   name varchar(100),
   birthday date ,
   sex char(1) default '男',
   telephone varchar(11),
   email varchar(100));
   
   -- 中間表
   create table tab_favorite(
   rid int,
   date datetime,
   uid int,
   -- 創建復合主鍵
   primary key(rid,uid),
   foreign key(rid) references tab_route(rid),
   foreign key(uid) references tab_user(uid));
   
   /*
   數據庫的設計範式正規化
   為了建立冗餘較小、結構合理的數據庫，
   設計數據庫時必須遵循一定的規則。
   在關係型數據庫中這種規則就稱為範式。
   範式是符合某一種設計要求的總結。
   要想設計一個結構合理的關係型數據庫
   目前關係型數據庫一共有6 種範式，
   按照範式級別，從低到高分別是：
   1NF（第一範式）、2NF（第二範式）、
   3NF（第三範式）、BCNF（巴斯- 科德範式）
   、4NF（第四範式）和5NF（第五範式，又叫做完美範式）
    */
    
    -- 數據庫的備份跟還原
   -- mysqldump -uroot -proot travel >c://a.sql;
   -- drop database travel;
   -- source c://a.sql;
   
    

