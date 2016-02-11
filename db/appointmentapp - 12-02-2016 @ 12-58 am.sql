-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 12, 2016 at 12:55 AM
-- Server version: 10.0.23-MariaDB-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `thunderw_appointment`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE IF NOT EXISTS `appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(5) NOT NULL,
  `sesi_id` int(5) NOT NULL,
  `doc_id` int(5) NOT NULL,
  `location_id` int(5) NOT NULL,
  `appointment_disease` varchar(255) NOT NULL,
  `appointment_status` int(5) NOT NULL COMMENT '0 - in progress, 1 - approved, 2 - rejected',
  PRIMARY KEY (`appointment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `patient_id`, `sesi_id`, `doc_id`, `location_id`, `appointment_disease`, `appointment_status`) VALUES
(45, 20, 70, 18, 9, 'sdfsdfsdf', 0),
(46, 20, 70, 18, 10, 'jjjjjjj', 0);

-- --------------------------------------------------------

--
-- Table structure for table `docs`
--

CREATE TABLE IF NOT EXISTS `docs` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_name` varchar(255) NOT NULL,
  `doc_ic` varchar(50) NOT NULL,
  `doc_gender` varchar(15) NOT NULL,
  `doc_address` text NOT NULL,
  `doc_email` varchar(255) NOT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `docs`
--

INSERT INTO `docs` (`doc_id`, `doc_name`, `doc_ic`, `doc_gender`, `doc_address`, `doc_email`) VALUES
(19, 'Dr Nadzmi', '911130015081', 'Male', 'Kajang Selangor', 'theredbees_360@yahoo.com'),
(18, 'nbn', 'tyrt', 'Male', 'vbnvbn', 'norlihazmey89@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) NOT NULL,
  `location_name` varchar(50) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `doc_id`, `location_name`) VALUES
(10, 18, ' batu pahat'),
(9, 18, ' kulim'),
(8, 17, 'cheras');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE IF NOT EXISTS `patients` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(255) NOT NULL,
  `patient_ic` varchar(50) NOT NULL,
  `patient_gender` varchar(15) NOT NULL,
  `patient_address` text NOT NULL,
  `patient_email` varchar(255) NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `patient_name`, `patient_ic`, `patient_gender`, `patient_address`, `patient_email`) VALUES
(20, 'Nadzmi', '12345', 'Male', 'gong datuk', 'norlihazmey89@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `sesi`
--

CREATE TABLE IF NOT EXISTS `sesi` (
  `sesi_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) NOT NULL,
  `sesi_date` date NOT NULL,
  `sesi_session` varchar(255) NOT NULL,
  `sesi_no_patient` int(11) NOT NULL,
  PRIMARY KEY (`sesi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=75 ;

--
-- Dumping data for table `sesi`
--

INSERT INTO `sesi` (`sesi_id`, `doc_id`, `sesi_date`, `sesi_session`, `sesi_no_patient`) VALUES
(74, 18, '2016-02-24', 'Session 2 - 2:30 pm to 5:30 pm', 54),
(70, 18, '2016-02-10', 'Session 1 - 9:00 am to 1:30 pm', 6);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(1, 'emii'),
(2, 'emaa'),
(3, 'emii'),
(4, 'emaa');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL COMMENT 'doc/patient',
  `user_username` varchar(20) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_category` varchar(50) NOT NULL COMMENT 'admin/doc/patient',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `id`, `user_username`, `user_password`, `user_category`) VALUES
(36, 19, 'nadzmi1991', '12345', 'doctor'),
(30, 18, 'asd', '123', 'doctor'),
(29, 20, 'qwe', '123', 'patient');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
