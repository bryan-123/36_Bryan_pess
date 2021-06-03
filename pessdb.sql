-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2021 at 02:12 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pessdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE `dispatch` (
  `incident_id` int(11) NOT NULL,
  `patrolcar_id` varchar(10) NOT NULL,
  `time_dispatched` datetime NOT NULL,
  `time_arrived` datetime NOT NULL,
  `time_completed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dispatch`
--

INSERT INTO `dispatch` (`incident_id`, `patrolcar_id`, `time_dispatched`, `time_arrived`, `time_completed`) VALUES
(9, 'QX1234', '2021-05-31 14:02:21', '0000-00-00 00:00:00', 0),
(12, 'QX4321R', '2021-06-02 11:37:32', '0000-00-00 00:00:00', 0),
(13, 'QX77777G', '2021-06-02 11:41:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `incident_id` int(11) NOT NULL,
  `caller_name` varchar(30) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `incident_type_id` varchar(3) NOT NULL,
  `incident_location` varchar(50) NOT NULL,
  `incident_desc` varchar(100) NOT NULL,
  `incident_status_id` varchar(1) NOT NULL,
  `time_called` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incident_id`, `caller_name`, `phone_number`, `incident_type_id`, `incident_location`, `incident_desc`, `incident_status_id`, `time_called`) VALUES
(9, 'DeezNuts', '12345678', '010', 'Jurong East', 'Here got big fire omg!!!', '2', '0000-00-00 00:00:00'),
(10, '1', '2', '010', '3', 's', '1', '0000-00-00 00:00:00'),
(11, 'sad', '123', '010', '1', '1', '1', '0000-00-00 00:00:00'),
(12, 'Bryan', '029313', '010', 'Jurong East', 'Got Fire!', '2', '0000-00-00 00:00:00'),
(13, 'xd', '12345678', '040', 'Jurong East', 'He hit me, very pain', '2', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `incident_status`
--

CREATE TABLE `incident_status` (
  `incident_satus_id` varchar(1) NOT NULL,
  `incident_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident_status`
--

INSERT INTO `incident_status` (`incident_satus_id`, `incident_status_desc`) VALUES
('1', 'Pending'),
('2', 'Dispatched'),
('3', 'Completed'),
('4', 'Duplicate');

-- --------------------------------------------------------

--
-- Table structure for table `incident_type`
--

CREATE TABLE `incident_type` (
  `incident_type_id` varchar(3) NOT NULL,
  `incident_type_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident_type`
--

INSERT INTO `incident_type` (`incident_type_id`, `incident_type_desc`) VALUES
('010', 'Fire'),
('020', 'Riot'),
('030', 'Burglary'),
('040', 'Domestic Violent'),
('050', 'Fallen Tree'),
('060', 'Traffic Accident'),
('070', 'Loan Sharks'),
('999', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar`
--

CREATE TABLE `patrolcar` (
  `patrolcar_id` varchar(10) NOT NULL,
  `patrolcar_status_id` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patrolcar`
--

INSERT INTO `patrolcar` (`patrolcar_id`, `patrolcar_status_id`) VALUES
('QX1234', '1'),
('QX4321R', '1'),
('QX4444P', '1'),
('QX9999H', '1'),
('QX45545', '3'),
('QX77777G', '3');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar_status`
--

CREATE TABLE `patrolcar_status` (
  `patrolcar_status_id` varchar(1) NOT NULL,
  `patrolcar_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patrolcar_status`
--

INSERT INTO `patrolcar_status` (`patrolcar_status_id`, `patrolcar_status_desc`) VALUES
('1', 'Dispatched'),
('3', 'Free'),
('5', 'NA'),
('4', 'On-site'),
('2', 'Patrol');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`incident_id`,`patrolcar_id`),
  ADD KEY `patrolcar_id` (`patrolcar_id`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`incident_id`),
  ADD KEY `incident_type_id` (`incident_type_id`,`incident_status_id`),
  ADD KEY `incident_status_id` (`incident_status_id`);

--
-- Indexes for table `incident_status`
--
ALTER TABLE `incident_status`
  ADD PRIMARY KEY (`incident_satus_id`);

--
-- Indexes for table `incident_type`
--
ALTER TABLE `incident_type`
  ADD PRIMARY KEY (`incident_type_id`);

--
-- Indexes for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD PRIMARY KEY (`patrolcar_id`),
  ADD KEY `patrolcar_id` (`patrolcar_id`),
  ADD KEY `patrolcar_status_id` (`patrolcar_status_id`);

--
-- Indexes for table `patrolcar_status`
--
ALTER TABLE `patrolcar_status`
  ADD PRIMARY KEY (`patrolcar_status_id`),
  ADD KEY `patrolcar_status_desc` (`patrolcar_status_desc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `incident_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD CONSTRAINT `dispatch_ibfk_1` FOREIGN KEY (`incident_id`) REFERENCES `incident` (`incident_id`),
  ADD CONSTRAINT `dispatch_ibfk_2` FOREIGN KEY (`patrolcar_id`) REFERENCES `patrolcar` (`patrolcar_id`);

--
-- Constraints for table `incident`
--
ALTER TABLE `incident`
  ADD CONSTRAINT `incident_ibfk_1` FOREIGN KEY (`incident_type_id`) REFERENCES `incident_type` (`incident_type_id`),
  ADD CONSTRAINT `incident_ibfk_2` FOREIGN KEY (`incident_status_id`) REFERENCES `incident_status` (`incident_satus_id`);

--
-- Constraints for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD CONSTRAINT `patrolcar_ibfk_1` FOREIGN KEY (`patrolcar_status_id`) REFERENCES `patrolcar_status` (`patrolcar_status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
