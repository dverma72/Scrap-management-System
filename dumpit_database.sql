-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 26, 2019 at 08:09 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dumpit`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

DROP TABLE IF EXISTS `admin_login`;
CREATE TABLE IF NOT EXISTS `admin_login` (
  `name` varchar(20) NOT NULL,
  `admin_id` varchar(20) NOT NULL,
  `pass` varchar(35) NOT NULL,
  UNIQUE KEY `admin_id` (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`name`, `admin_id`, `pass`) VALUES
('Admin', 'admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `name` varchar(23) NOT NULL,
  `e_mail` varchar(30) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `subject` varchar(30) NOT NULL,
  `message` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`name`, `e_mail`, `address`, `subject`, `message`) VALUES
('deepak', 'abc@gmail.com', 'mankhurd', 'checking', 'done'),
('Deepak verma', 'abc@gmail.com', 'mankhurd', 'checking', 'nljj'),
('Deepak verma', 'abc@gmail.com', 'mankhurd', 'I want to join as a vendor', 'plz give a chance for server you'),
('Deepak', 'sneha9@gmail.com', 'fufhi', 'hihiuhi', 'ukiuiuhi'),
('ghhgh', 'fhggdg@gmail.com', 'sfgfxbgf', 'gbgc', 'gfghg'),
('abcd', 'sneha99999999999999@gmail.com', 'mankhurd', 'scarp', 'which type of did you accept'),
('Ankita', 'arya@gmail.com', 'sgkja', 'just', 'nghnl;nhtlstls');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `vendor_email` varchar(25) NOT NULL,
  `scrap_types` varchar(40) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `user_mail` varchar(35) NOT NULL,
  `city` varchar(20) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`vendor_email`, `scrap_types`, `weight`, `amount`, `user_mail`, `city`, `date`) VALUES
('vendor@gmail.com', 'Aluminium', 10, 200, 'deepakvermar2@gmail.com', 'mansarovar', 'Wed Sep 25 10:54:05 IST 2019'),
('vendor@gmail.com', 'Copper', 21, 2000, 'arya@gmail.com', 'mansarovar', 'Wed Sep 25 10:54:25 IST 2019'),
('vendor@gmail.com', 'Copper', 23, 200, 'arya@gmail.com', 'govandi', 'Wed Sep 25 10:54:45 IST 2019');

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
CREATE TABLE IF NOT EXISTS `rate` (
  `name` varchar(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `image` varchar(150) DEFAULT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rate`
--

INSERT INTO `rate` (`name`, `amount`, `image`) VALUES
('Iron', 13, '.\\images\\rate\\iron.png'),
('Battery', 30, '.\\images\\rate\\battery.png'),
('Aluminium', 80, '.\\images\\rate\\aluminium.png'),
('Brass', 240, '.\\images\\rate\\brass.png'),
('Book', 7, '.\\images\\rate\\books.png'),
('Copper', 250, '.\\images\\rate\\copper.png'),
('E-waste', 5, '.\\images\\rate\\E-waste.png'),
('Fiber', 15, '.\\images\\rate\\fiber.png'),
('Newspaper', 10, '.\\images\\rate\\newspaper.png'),
('Steel', 22, '.\\images\\rate\\steel.png'),
('Mix-waste', 3, '.\\images\\rate\\mix-waste.png'),
('Tin', 8, '.\\images\\rate\\tin.png'),
('cooler', 500, ''),
('aa', 55, ''),
('mo', 55, 'GYM.png'),
('dimond', 555, 'new photo.jpg'),
('xzy', 150, ''),
('mobile', 200, ''),
('aaaaaa', 10, '');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE IF NOT EXISTS `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `mobile` varchar(14) NOT NULL,
  `alternate_moblie` varchar(14) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(15) NOT NULL,
  `scarp_name` varchar(20) DEFAULT NULL,
  `scarp_weight` int(11) DEFAULT NULL,
  `request_date` varchar(50) NOT NULL,
  `pickup_date` varchar(50) NOT NULL,
  `status` varchar(100) DEFAULT 'processing',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `name`, `mobile`, `alternate_moblie`, `email`, `address`, `city`, `scarp_name`, `scarp_weight`, `request_date`, `pickup_date`, `status`) VALUES
(17, 'Deepak Verma', '9967723730', '7797479052', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'mix waste', 100, '', '2019-09-09', 'Accepted by Admin'),
(20, 'Deepak Verma', '9967723730', '7797479052', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'mix waste', 100, '', '2019-09-09', 'Completed on Tue Sep 10 12:19:22 IST 2019 by subhas'),
(21, 'Deepak Verma', '9967723730', '7797479052', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'mix waste', 100, '', '2019-09-09', 'Completed on Tue Sep 10 12:19:26 IST 2019 by subhas'),
(23, 'Deepak Verma', '9967723730', '7797479052', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'mix waste', 100, '', '2019-09-09', 'Completed on Tue Sep 10 12:19:47 IST 2019 by subhas'),
(24, 'Deepak Verma', '9967723730', '7797479052', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'mix waste', 100, '', '2019-09-09', 'Completed on Tue Sep 10 12:20:03 IST 2019 by subhas'),
(26, 'Deepak Verma', '9967723730', '7797479052', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'mix waste', 100, '', '2019-09-09', 'Accepted by Admin'),
(28, 'Deepak Verma', '9967723730', '7797479052', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'mix waste', 100, '', '2019-09-09', 'Accepted by subhas'),
(29, 'Deepak Verma', '9967723730', '7797479052', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'mix waste', 100, '', '2019-09-09', 'Completed on Wed Sep 11 12:01:09 IST 2019 by Admin'),
(30, 'Deepak Verma', '9967723730', '7797479052', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'mix waste', 100, '', '2019-09-09', 'Completed on Thu Sep 12 14:30:51 IST 2019 by subhas'),
(31, 'Deepak Verma', '9967723730', '7797927387', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'gold', 11, '', '2019-09-03', 'Completed on Thu Sep 12 13:29:13 IST 2019 by subhas'),
(32, 'Deepak Verma', '9967723730', '7797927387', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'gold', 11, '', '2019-09-03', 'Completed on Thu Sep 12 14:31:32 IST 2019 by subhas'),
(33, 'Deepak Verma', '9967723730', '7797927387', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'gold', 11, '', '2019-09-03', 'processing'),
(34, 'Deepak Verma', '9967723730', '7797927387', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'gold', 11, '', '2019-09-03', 'Accepted by subhas'),
(35, 'Deepak Verma', '9967723730', '7797927387', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'gold', 11, '', '2019-09-03', 'processing'),
(36, 'Deepak Verma', '9967723730', '7797927387', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'gold', 11, '', '2019-09-03', 'Accepted by subhas'),
(37, 'Deepak Verma', '9967723730', '7797927387', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'gold', 11, '', '2019-09-03', 'processing'),
(38, 'Deepak Verma', '9967723730', '7797927387', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'gold', 11, '', '2019-09-03', 'processing'),
(39, 'Deepak Verma', '9967723730', '7797927387', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'gold', 11, '', '2019-09-03', 'processing'),
(40, 'Deepak Verma', '9967723730', '7797927387', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'gold', 11, '', '2019-09-03', 'processing'),
(41, 'Deepak Verma', '9967723730', '7797927387', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'gold', 11, '', '2019-09-03', 'processing'),
(42, 'Deepak Verma', '9967723730', '124578963', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'vashi', 'abc', 100, '', '2019-09-11', 'processing'),
(43, 'Deepak Verma', '9967723730', '1234569870', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'mankhurd', 'Battery', 12, '', 'Wed Sep 11 07:40:22 IST 2019', 'processing'),
(44, 'Deepak Verma', '9967723730', '100', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'mankhurd', 'Book', 12, 'Wed Sep 11 07:50:02 IST 2019', '2019-09-12', 'Completed on Thu Sep 12 10:20:32 IST 2019 by subhas'),
(45, 'Deepak Verma', '9967723730', '1234569870', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'mankhurd', 'Book', 13, 'Wed Sep 11 09:34:39 IST 2019', '2019-09-17', 'Completed on Wed Sep 11 09:36:02 IST 2019 by subhas'),
(46, 'Deepak Verma', '9967723730', '1234562210', 'deepakvermar2@gmail.com', '30ft Road, New mandala, Indira Nagar', 'bandra', 'Battery', 50, 'Thu Sep 12 11:03:06 IST 2019', '2019-09-14', 'Completed on Thu Sep 12 11:06:35 IST 2019 by subhas'),
(47, 'Arya', '9022456187', '1234569870', 'arya@gmail.com', 'cbd', 'belapur', 'Tin', 50, 'Thu Sep 12 14:26:55 IST 2019', '2019-09-15', 'processing');

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE IF NOT EXISTS `user_detail` (
  `name` char(20) NOT NULL,
  `e_mail` varchar(35) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gender` char(10) NOT NULL,
  `dob` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  UNIQUE KEY `e_mail` (`e_mail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`name`, `e_mail`, `phone`, `address`, `gender`, `dob`, `city`) VALUES
('Arya', 'arya@gmail.com', '9022456187', 'belapur', 'Female', '1999-07-28', 'belapur'),
('manisha', 'manisha@gmail.com', '44534534', 'jbadkjhbh', 'Female', '2019-09-04', 'mansarovar'),
('Rajendra', 'rajender@gmail.com', '9967723225', 'mankhurd', 'Male', '2019-09-24', 'vashi'),
('Deepak Verma', 'deepakvermar2@gmail.com', '9967723730', '30ft Road, New mandala, Indira Nagar', 'Male', '1998-10-19', 'mansarovar');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
CREATE TABLE IF NOT EXISTS `user_login` (
  `user_id` varchar(35) NOT NULL,
  `pass` varchar(35) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`user_id`, `pass`) VALUES
('arya@gmail.com', '61da7338f2ff248935bd1e97c8c445f3'),
('manisha@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
('rajender@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
('deepakvermar2@gmail.com', 'f76103957da00acd40229697e505550b');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_detail`
--

DROP TABLE IF EXISTS `vendor_detail`;
CREATE TABLE IF NOT EXISTS `vendor_detail` (
  `name` char(20) NOT NULL,
  `e_mail` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gender` char(10) NOT NULL,
  `dob` varchar(15) DEFAULT NULL,
  `city` char(15) NOT NULL,
  UNIQUE KEY `e_mail` (`e_mail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_detail`
--

INSERT INTO `vendor_detail` (`name`, `e_mail`, `phone`, `address`, `gender`, `dob`, `city`) VALUES
('subhas', 'vendor@gmail.com', '9967723728', 'mankhurd', 'Male', '2019-11-26', 'mansarovar'),
('Kiran', 'kiran@gmail.com', '1234567890', 'dfashkj', 'Male', '2019-09-19', 'govandi'),
('ashok', 'ashok@gmail.com', '44534534', 'abcd', 'Male', '2019-09-19', 'govandi'),
('sunilaa', 'sunilaa@gmail.com', '51661166', 'cjkdnj', 'Male', '2019-09-12', 'vashi');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_login`
--

DROP TABLE IF EXISTS `vendor_login`;
CREATE TABLE IF NOT EXISTS `vendor_login` (
  `vendor_id` varchar(20) NOT NULL,
  `pass` varchar(35) NOT NULL,
  UNIQUE KEY `vendor_id` (`vendor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_login`
--

INSERT INTO `vendor_login` (`vendor_id`, `pass`) VALUES
('vendor@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
('kiran@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
('ashok@gmail.com', 'a3590023df66ac92ae35e3316026d17d'),
('sunil@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
('sunila@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
('sunilaa@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
