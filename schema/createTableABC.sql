##前置条件:已创建好一个数据库
CREATE TABLE `a` (
  `aID` int(1) NOT NULL AUTO_INCREMENT,
  `aNum` char(20) DEFAULT NULL,
  PRIMARY KEY (`aID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


CREATE TABLE `b` (
  `bID` int(1) NOT NULL AUTO_INCREMENT,
  `bName` char(20) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


CREATE TABLE `c` (
  `cID` int(1) NOT NULL ,
  `cAddress` char(20) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

##后验证条件:无