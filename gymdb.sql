/*
SQLyog Ultimate v9.51 
MySQL - 5.5.5-10.1.21-MariaDB : Database - gymdbconnection
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gymdbconnection` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `gymdbconnection`;

/*Table structure for table `client` */

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `NIC` varchar(10) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Contact_Number` text,
  `Address` text,
  `Email` text,
  `Package_Type` varchar(20) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `S_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NIC`),
  KEY `Username_FK` (`Username`),
  KEY `S_ID_FK` (`S_ID`),
  CONSTRAINT `S_ID_FK` FOREIGN KEY (`S_ID`) REFERENCES `schedule` (`S_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Username_FK` FOREIGN KEY (`Username`) REFERENCES `login` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `client` */

insert  into `client`(`NIC`,`First_Name`,`Last_Name`,`Age`,`Height`,`Weight`,`Contact_Number`,`Address`,`Email`,`Package_Type`,`Username`,`S_ID`) values ('62561','dvdf','hghug',52,20,50,'5202','fdfqef	','sdfsf','1 Month',NULL,'0006'),('95851642','sfgsg','fsdfsdf',20,20,20,'52','dfdg	','asffafaf','6 Months',NULL,'0003');

/*Table structure for table `exercise` */

DROP TABLE IF EXISTS `exercise`;

CREATE TABLE `exercise` (
  `E_ID` varchar(20) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `E_name` varchar(50) NOT NULL,
  PRIMARY KEY (`E_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `exercise` */

insert  into `exercise`(`E_ID`,`Type`,`E_name`) values ('E1','Arms','Bench Press'),('E2','Arms','Barbel Curl'),('E3','Chest','Inclined Bench Press'),('E4','Chest','Pushups'),('E5','Legs','Squats'),('E6','Legs','Leg Press');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `Username` varchar(50) NOT NULL,
  `Password` text NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`Username`,`Password`) values ('user1','password1');

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `S_ID` varchar(20) NOT NULL,
  `Workout` varchar(50) NOT NULL,
  PRIMARY KEY (`S_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `schedule` */

insert  into `schedule`(`S_ID`,`Workout`) values ('0001','S1'),('0002','S2'),('0003','S3'),('0006','S6');

/*Table structure for table `schedule_exercise` */

DROP TABLE IF EXISTS `schedule_exercise`;

CREATE TABLE `schedule_exercise` (
  `S_ID` varchar(20) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `No_Of_Sets` int(11) DEFAULT NULL,
  PRIMARY KEY (`S_ID`,`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `schedule_exercise` */

insert  into `schedule_exercise`(`S_ID`,`Type`,`No_Of_Sets`) values ('0001','Bench Press',10),('0001','Leg Press',15),('0001','Pushups',20),('0002','Bench Press',10),('0002','Pushups',10),('0002','Squats',25),('0003','Bench Press',5),('0003','Squats',5),('0006','Bench Press',5),('0006','Leg Press',10);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
