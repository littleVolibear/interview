/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.0.22-community-nt 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `course` (
	`cid` varchar (30),
	`cname` varchar (300),
	`tid` varchar (120)
); 

create table `sc` (
	`sid` int (11),
	`cid` varchar (300),
	`score` varchar (120)
);
create table `student` (
	`sid` int (10),
	`sname` varchar (300),
	`sage` varchar (120),
	`ssex` varchar (120)
);

create table `teacher` (
	`tid` int (11),
	`tname` varchar (300)
);

insert into `course` (`cid`, `cname`, `tid`) values('001','PHP','1');
insert into `course` (`cid`, `cname`, `tid`) values('002','c#','1');
insert into `course` (`cid`, `cname`, `tid`) values('003','C++','2');
insert into `course` (`cid`, `cname`, `tid`) values('004','JAVA','3');
insert into `course` (`cid`, `cname`, `tid`) values('005','Python','4');
insert into `course` (`cid`, `cname`, `tid`) values('006','R','5');
insert into `course` (`cid`, `cname`, `tid`) values('007','HTML','6');

 
insert into `sc` (`sid`, `cid`, `score`) values('1001','001','89');
insert into `sc` (`sid`, `cid`, `score`) values('1002','001','80');
insert into `sc` (`sid`, `cid`, `score`) values('1003','001','30');
insert into `sc` (`sid`, `cid`, `score`) values('1004','001','78');
insert into `sc` (`sid`, `cid`, `score`) values('1005','001','68');
insert into `sc` (`sid`, `cid`, `score`) values('1006','001','93');
insert into `sc` (`sid`, `cid`, `score`) values('1007','001','62');
insert into `sc` (`sid`, `cid`, `score`) values('1001','002','67');
insert into `sc` (`sid`, `cid`, `score`) values('1002','002','86');
insert into `sc` (`sid`, `cid`, `score`) values('1003','002','67');
insert into `sc` (`sid`, `cid`, `score`) values('1004','002','77');
insert into `sc` (`sid`, `cid`, `score`) values('1005','002','66');
insert into `sc` (`sid`, `cid`, `score`) values('1006','002','84');
insert into `sc` (`sid`, `cid`, `score`) values('1007','002','72');
insert into `sc` (`sid`, `cid`, `score`) values('1001','003','82');
insert into `sc` (`sid`, `cid`, `score`) values('1002','003','85');
insert into `sc` (`sid`, `cid`, `score`) values('1003','003','32');
insert into `sc` (`sid`, `cid`, `score`) values('1004','003','73');
insert into `sc` (`sid`, `cid`, `score`) values('1005','003','64');
insert into `sc` (`sid`, `cid`, `score`) values('1006','003','87');
insert into `sc` (`sid`, `cid`, `score`) values('1007','003','77');
insert into `sc` (`sid`, `cid`, `score`) values('1008','003','94');
insert into `sc` (`sid`, `cid`, `score`) values('1001','004','39');
insert into `sc` (`sid`, `cid`, `score`) values('1002','004','80');
insert into `sc` (`sid`, `cid`, `score`) values('1003','004','80');
insert into `sc` (`sid`, `cid`, `score`) values('1004','004','88');
insert into `sc` (`sid`, `cid`, `score`) values('1005','004','68');
insert into `sc` (`sid`, `cid`, `score`) values('1006','004','59');
insert into `sc` (`sid`, `cid`, `score`) values('1007','004','42');
insert into `sc` (`sid`, `cid`, `score`) values('1008','004','64');
insert into `sc` (`sid`, `cid`, `score`) values('1001','005','89');
insert into `sc` (`sid`, `cid`, `score`) values('1002','005','70');
insert into `sc` (`sid`, `cid`, `score`) values('1003','005','60');
insert into `sc` (`sid`, `cid`, `score`) values('1004','005','58');
insert into `sc` (`sid`, `cid`, `score`) values('1005','005','38');
insert into `sc` (`sid`, `cid`, `score`) values('1006','005','89');
insert into `sc` (`sid`, `cid`, `score`) values('1007','005','72');
insert into `sc` (`sid`, `cid`, `score`) values('1008','005','64');
insert into `sc` (`sid`, `cid`, `score`) values('1001','006','49');
insert into `sc` (`sid`, `cid`, `score`) values('1002','006','90');
insert into `sc` (`sid`, `cid`, `score`) values('1003','006','70');
insert into `sc` (`sid`, `cid`, `score`) values('1004','006','48');
insert into `sc` (`sid`, `cid`, `score`) values('1005','006','98');
insert into `sc` (`sid`, `cid`, `score`) values('1006','006','59');
insert into `sc` (`sid`, `cid`, `score`) values('1007','006','72');
insert into `sc` (`sid`, `cid`, `score`) values('1008','006','74');
insert into `sc` (`sid`, `cid`, `score`) values('1001','007','49');
insert into `sc` (`sid`, `cid`, `score`) values('1002','007','50');
insert into `sc` (`sid`, `cid`, `score`) values('1003','007','70');
insert into `sc` (`sid`, `cid`, `score`) values('1004','007','88');
insert into `sc` (`sid`, `cid`, `score`) values('1005','007','78');
insert into `sc` (`sid`, `cid`, `score`) values('1006','007','99');
insert into `sc` (`sid`, `cid`, `score`) values('1007','007','82');

insert into `student` (`sid`, `sname`, `sage`, `ssex`) values('1001','张三','10','男');
insert into `student` (`sid`, `sname`, `sage`, `ssex`) values('1002','李四','11','女');
insert into `student` (`sid`, `sname`, `sage`, `ssex`) values('1003','王五','12','男');
insert into `student` (`sid`, `sname`, `sage`, `ssex`) values('1004','马六','19','女');
insert into `student` (`sid`, `sname`, `sage`, `ssex`) values('1005','孙七','22','女');
insert into `student` (`sid`, `sname`, `sage`, `ssex`) values('1006','钱八','18','男');
insert into `student` (`sid`, `sname`, `sage`, `ssex`) values('1007','赵九','11','女');
insert into `student` (`sid`, `sname`, `sage`, `ssex`) values('1008','周公','19','男');


insert into `teacher` (`tid`, `tname`) values('1','叶平');
insert into `teacher` (`tid`, `tname`) values('2','李浩然');
insert into `teacher` (`tid`, `tname`) values('3','胡平原');
insert into `teacher` (`tid`, `tname`) values('4','朱清时');
insert into `teacher` (`tid`, `tname`) values('5','赛先生');
insert into `teacher` (`tid`, `tname`) values('6','宋三东');