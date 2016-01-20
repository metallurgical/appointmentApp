-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2016 at 04:17 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `appointmentapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE IF NOT EXISTS `appointment` (
`appointment_id` int(11) NOT NULL,
  `patient_id` int(5) NOT NULL,
  `sesi_id` int(5) NOT NULL,
  `doc_id` int(5) NOT NULL,
  `appointment_disease` varchar(255) NOT NULL,
  `appointment_status` int(5) NOT NULL COMMENT '0 - in progress, 1 - approved, 2 - rejected'
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `patient_id`, `sesi_id`, `doc_id`, `appointment_disease`, `appointment_status`) VALUES
(18, 4, 48, 3, 'nnnnnnbcvb', 0),
(17, 4, 48, 3, 'bbbbb', 0),
(16, 4, 48, 3, 'jjjjjjjjj', 0);

-- --------------------------------------------------------

--
-- Table structure for table `docs`
--

CREATE TABLE IF NOT EXISTS `docs` (
`doc_id` int(11) NOT NULL,
  `doc_name` varchar(255) NOT NULL,
  `doc_ic` varchar(50) NOT NULL,
  `doc_gender` varchar(15) NOT NULL,
  `doc_address` text NOT NULL,
  `doc_email` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `docs`
--

INSERT INTO `docs` (`doc_id`, `doc_name`, `doc_ic`, `doc_gender`, `doc_address`, `doc_email`) VALUES
(3, 'Dr. norlihazmey', '8924', 'Male', 'gd', 'norlihazmey89@yahoo.com'),
(4, 'Dr. aizuddin', '8987', 'Female', 'dd', 'norlihazmey89@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE IF NOT EXISTS `patients` (
`patient_id` int(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `patient_ic` varchar(50) NOT NULL,
  `patient_gender` varchar(15) NOT NULL,
  `patient_address` text NOT NULL,
  `patient_email` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `patient_name`, `patient_ic`, `patient_gender`, `patient_address`, `patient_email`) VALUES
(4, 'emi', '123', 'Male', 'ssdf', '');

-- --------------------------------------------------------

--
-- Table structure for table `sesi`
--

CREATE TABLE IF NOT EXISTS `sesi` (
`sesi_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `sesi_date` date NOT NULL,
  `sesi_session` varchar(255) NOT NULL,
  `sesi_no_patient` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sesi`
--

INSERT INTO `sesi` (`sesi_id`, `doc_id`, `sesi_date`, `sesi_session`, `sesi_no_patient`) VALUES
(51, 4, '2016-01-02', 'S1 - 9:00 am to 1:30 pm', 2),
(48, 3, '2015-02-08', 'S1 - 9:00 am to 1:30 pm', 14),
(47, 3, '2015-02-09', 'S1 - 9:00 am to 1:30 pm', 10),
(49, 3, '2015-02-09', 'S2 - 2:30 pm to 5:30 pm', 7),
(50, 4, '2016-01-02', 'S2 - 9:00 am to 1:30 pm', 2);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
`id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

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
`user_id` int(11) NOT NULL,
  `id` int(11) NOT NULL COMMENT 'doc/patient',
  `user_username` varchar(20) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_category` varchar(50) NOT NULL COMMENT 'admin/doc/patient'
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `id`, `user_username`, `user_password`, `user_category`) VALUES
(3, 3, 'emi', 'emi123', 'doctor'),
(4, 4, 'judin', 'judin123', 'doctor'),
(5, 4, 'emi', 'emi', 'patient');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
 ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `docs`
--
ALTER TABLE `docs`
 ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
 ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `sesi`
--
ALTER TABLE `sesi`
 ADD PRIMARY KEY (`sesi_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `docs`
--
ALTER TABLE `docs`
MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sesi`
--
ALTER TABLE `sesi`
MODIFY `sesi_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
