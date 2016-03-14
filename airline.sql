-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2015 at 12:36 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `airline`
--

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE IF NOT EXISTS `airport` (
  `Code` char(3) NOT NULL,
  `City` varchar(36) NOT NULL,
  `State` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`Code`, `City`, `State`) VALUES
('DFW', 'Dallas', 'TX'),
('INT', 'Houston', 'TX'),
('JFK', 'New York', 'NY'),
('LAX', 'Los Angeles', 'CA'),
('LGA', 'New York', 'NY'),
('LOG', 'Boston', 'MA'),
('MDW', 'Chicago', 'IL'),
('ORD', 'Chicago', 'IL');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE IF NOT EXISTS `flight` (
  `FLNO` int(4) NOT NULL,
  `Meal` varchar(36) NOT NULL,
  `Smoking` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`FLNO`, `Meal`, `Smoking`) VALUES
(1000, 'Bistro', 1),
(1010, 'Meal', 0),
(1020, 'Meal', 1),
(1030, 'Snack', 0),
(1040, 'Meal', 0);

-- --------------------------------------------------------

--
-- Table structure for table `flightinstance`
--

CREATE TABLE IF NOT EXISTS `flightinstance` (
  `FLNO` int(4) NOT NULL,
  `FDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flightinstance`
--

INSERT INTO `flightinstance` (`FLNO`, `FDate`) VALUES
(1000, '2002-10-05'),
(1000, '2002-10-06'),
(1000, '2002-10-07'),
(1010, '2002-10-05'),
(1010, '2002-10-06'),
(1020, '2002-10-05'),
(1030, '2002-10-05'),
(1040, '2002-10-07');

-- --------------------------------------------------------

--
-- Table structure for table `flightleg`
--

CREATE TABLE IF NOT EXISTS `flightleg` (
  `FLNO` int(4) NOT NULL,
  `Seq` int(1) NOT NULL,
  `FromA` char(3) NOT NULL,
  `ToA` char(3) NOT NULL,
  `DeptTime` datetime NOT NULL,
  `ArrTime` datetime NOT NULL,
  `Plane` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flightleg`
--

INSERT INTO `flightleg` (`FLNO`, `Seq`, `FromA`, `ToA`, `DeptTime`, `ArrTime`, `Plane`) VALUES
(1000, 1, 'DFW', 'LOG', '2001-01-01 10:20:00', '2001-01-01 13:40:00', 7),
(1010, 1, 'LAX', 'ORD', '2001-01-01 13:10:00', '2001-01-01 16:20:00', 3),
(1010, 2, 'ORD', 'JFK', '2001-01-01 17:10:00', '2001-01-01 20:20:00', 3),
(1020, 1, 'LOG', 'JFK', '2001-01-01 05:40:00', '2001-01-01 06:20:00', 9),
(1020, 2, 'JFK', 'DFW', '2001-01-01 07:20:00', '2001-01-01 10:20:00', 9),
(1020, 3, 'DFW', 'INT', '2001-01-01 11:10:00', '2001-01-01 11:40:00', 7),
(1020, 4, 'INT', 'LAX', '2001-01-01 12:20:00', '2001-01-01 15:10:00', 7),
(1030, 1, 'LAX', 'INT', '2001-01-01 11:20:00', '2001-01-01 16:10:00', 6),
(1030, 2, 'INT', 'DFW', '2001-01-01 17:20:00', '2001-01-01 18:00:00', 6),
(1040, 1, 'LAX', 'LGA', '2002-01-01 15:30:00', '2001-01-01 21:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `flightleginstance`
--

CREATE TABLE IF NOT EXISTS `flightleginstance` (
  `Seq` int(1) NOT NULL,
  `FLNO` int(4) NOT NULL,
  `FDate` date NOT NULL,
  `ActDept` datetime NOT NULL,
  `ActArr` datetime NOT NULL,
  `Pilot` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flightleginstance`
--

INSERT INTO `flightleginstance` (`Seq`, `FLNO`, `FDate`, `ActDept`, `ActArr`, `Pilot`) VALUES
(1, 1000, '2002-10-05', '2002-01-01 10:10:00', '2002-01-01 13:10:00', 3),
(1, 1000, '2002-10-06', '2002-01-01 10:30:00', '2002-01-01 14:20:00', 8),
(1, 1010, '2002-10-05', '2002-01-01 13:20:00', '2002-01-01 17:10:00', 1),
(1, 1010, '2002-10-06', '2002-01-01 13:10:00', '2002-01-01 16:10:00', 3),
(1, 1020, '2002-10-05', '2002-01-01 05:40:00', '2002-01-01 06:30:00', 5),
(1, 1030, '2002-10-05', '2002-01-01 11:20:00', '2002-01-01 16:10:00', 8),
(2, 1010, '2002-10-05', '2002-01-01 18:00:00', '2002-01-01 21:00:00', 1),
(2, 1010, '2002-10-06', '2002-01-01 17:00:00', '2002-01-01 20:30:00', 6),
(2, 1020, '2002-10-05', '2002-01-01 07:30:00', '2002-01-01 10:40:00', 5),
(2, 1030, '2002-10-05', '2002-01-01 17:20:00', '2002-01-01 18:40:00', 8),
(3, 1020, '2002-10-05', '2002-01-01 11:30:00', '2002-01-01 12:20:00', 5),
(4, 1020, '2002-10-05', '2002-01-01 13:00:00', '2002-01-01 16:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE IF NOT EXISTS `passenger` (
  `ID` int(2) NOT NULL,
  `Name` varchar(36) NOT NULL,
  `Phone` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`ID`, `Name`, `Phone`) VALUES
(1, 'Jones', '(972)999-1111'),
(2, 'James', '(214)111-9999'),
(3, 'Henry', '(214)222-1111'),
(4, 'Luis', '(972)111-3333'),
(5, 'Howard', '(972)333-1111'),
(6, 'Frank', '(214)111-5555'),
(7, 'Frankel', '(972)111-2222'),
(8, 'Bushnell', '(214)111-4444'),
(9, 'Camden', '(214)222-5555'),
(10, 'Max', '(972)444-1111'),
(11, 'Flores', '(214)333-6666'),
(12, 'Clinton', '(214)222-5555');

-- --------------------------------------------------------

--
-- Table structure for table `pilot`
--

CREATE TABLE IF NOT EXISTS `pilot` (
  `ID` int(2) NOT NULL,
  `Name` varchar(36) NOT NULL,
  `DateHired` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pilot`
--

INSERT INTO `pilot` (`ID`, `Name`, `DateHired`) VALUES
(1, 'Jones', '1990-10-05'),
(2, 'Adams', '1990-01-06'),
(3, 'Walker', '1991-02-07'),
(4, 'Flores', '1992-01-04'),
(5, 'Thompson', '1992-10-04'),
(6, 'Dean', '1993-02-09'),
(7, 'Carter', '1994-01-08'),
(8, 'Mango', '1995-02-05');

-- --------------------------------------------------------

--
-- Table structure for table `plane`
--

CREATE TABLE IF NOT EXISTS `plane` (
  `ID` int(2) NOT NULL,
  `Maker` varchar(36) NOT NULL,
  `Model` varchar(36) NOT NULL,
  `LastMaint` date NOT NULL,
  `LastMaintA` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plane`
--

INSERT INTO `plane` (`ID`, `Maker`, `Model`, `LastMaint`, `LastMaintA`) VALUES
(1, 'MD', 'MD11', '2002-09-03', 'DFW'),
(2, 'MD', 'MD11', '2002-09-04', 'MDW'),
(3, 'MD', 'SUPER80', '2002-09-01', 'LAX'),
(4, 'MD', 'SUPER80', '2002-09-03', 'ORD'),
(5, 'MD', 'SUPER80', '2002-09-06', 'LGA'),
(6, 'BOEING', '727', '2002-09-01', 'DFW'),
(7, 'BOEING', '757', '2002-10-02', 'LAX'),
(8, 'AIRBUS', 'A300', '2002-09-01', 'INT'),
(9, 'AIRBUS', 'A320', '2002-09-04', 'LOG');

-- --------------------------------------------------------

--
-- Table structure for table `planeseats`
--

CREATE TABLE IF NOT EXISTS `planeseats` (
  `Maker` varchar(36) NOT NULL,
  `Model` varchar(36) NOT NULL,
  `SeatType` char(1) NOT NULL,
  `NoOfSeats` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `planeseats`
--

INSERT INTO `planeseats` (`Maker`, `Model`, `SeatType`, `NoOfSeats`) VALUES
('AIRBUS', 'A300', 'E', 160),
('AIRBUS', 'A300', 'F', 20),
('AIRBUS', 'A320', 'E', 200),
('AIRBUS', 'A320', 'F', 30),
('BOEING', '727', 'E', 110),
('BOEING', '727', 'F', 10),
('BOEING', '757', 'E', 160),
('BOEING', '757', 'F', 20),
('MD', 'MD11', 'E', 150),
('MD', 'MD11', 'F', 20),
('MD', 'SUPER80', 'E', 90),
('MD', 'SUPER80', 'F', 10);

-- --------------------------------------------------------

--
-- Table structure for table `planetype`
--

CREATE TABLE IF NOT EXISTS `planetype` (
  `Maker` varchar(36) NOT NULL,
  `Model` varchar(36) NOT NULL,
  `FlyingSpeed` int(4) NOT NULL,
  `GroundSpeed` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `planetype`
--

INSERT INTO `planetype` (`Maker`, `Model`, `FlyingSpeed`, `GroundSpeed`) VALUES
('AIRBUS', 'A300', 620, 150),
('AIRBUS', 'A320', 700, 180),
('BOEING', '727', 510, 160),
('BOEING', '757', 650, 160),
('MD', 'MD11', 600, 180),
('MD', 'SUPER80', 500, 170);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `PassID` int(2) NOT NULL,
  `FLNO` int(4) NOT NULL,
  `FDate` date NOT NULL,
  `FromA` char(3) NOT NULL,
  `ToA` char(3) NOT NULL,
  `SeatClass` char(1) NOT NULL,
  `DateBooked` date NOT NULL,
  `DateCancelled` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`, `DateCancelled`) VALUES
(1, 1000, '2002-10-05', 'DFW', 'LOG', 'E', '2002-09-05', '0000-00-00'),
(1, 1020, '2002-10-05', 'LOG', 'JFK', 'E', '2002-09-14', '0000-00-00'),
(1, 1010, '2002-10-06', 'ORD', 'JFK', 'E', '2002-09-15', '0000-00-00'),
(1, 1040, '2002-10-07', 'LAX', 'LGA', 'E', '2002-10-01', '0000-00-00'),
(2, 1020, '2002-10-05', 'LOG', 'INT', 'E', '2002-09-04', '0000-00-00'),
(3, 1020, '2002-10-05', 'JFK', 'LAX', 'E', '2002-09-19', '0000-00-00'),
(3, 1010, '2002-10-06', 'LAX', 'JFK', 'E', '2002-09-14', '0000-00-00'),
(4, 1020, '2002-10-05', 'LOG', 'LAX', 'E', '2002-09-10', '0000-00-00'),
(5, 1020, '2002-10-05', 'LOG', 'DFW', 'F', '2002-09-29', '0000-00-00'),
(6, 1010, '2002-10-05', 'LAX', 'JFK', 'E', '2002-09-19', '0000-00-00'),
(7, 1010, '2002-10-05', 'LAX', 'ORD', 'E', '2002-09-27', '0000-00-00'),
(8, 1030, '2002-10-05', 'LAX', 'DFW', 'F', '2002-10-05', '0000-00-00'),
(9, 1010, '2002-10-06', 'LAX', 'JFK', 'E', '2002-09-09', '0000-00-00'),
(10, 1010, '2002-10-06', 'ORD', 'JFK', 'E', '2002-09-07', '2002-09-19'),
(11, 1000, '2002-10-06', 'DFW', 'LOG', 'E', '2002-09-09', '0000-00-00'),
(12, 1000, '2002-10-06', 'DFW', 'LOG', 'E', '2002-09-19', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
 ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
 ADD PRIMARY KEY (`FLNO`);

--
-- Indexes for table `flightinstance`
--
ALTER TABLE `flightinstance`
 ADD PRIMARY KEY (`FLNO`,`FDate`);

--
-- Indexes for table `flightleg`
--
ALTER TABLE `flightleg`
 ADD PRIMARY KEY (`FLNO`,`Seq`), ADD KEY `fk_flightleg_plane1_idx` (`Plane`), ADD KEY `fk_flightleg_airport1_idx` (`FromA`), ADD KEY `fk_flightleg_airport2_idx` (`ToA`);

--
-- Indexes for table `flightleginstance`
--
ALTER TABLE `flightleginstance`
 ADD PRIMARY KEY (`Seq`,`FLNO`,`FDate`), ADD KEY `fk_flightleginstance_flightinstance1_idx` (`FLNO`,`FDate`), ADD KEY `fk_flightleginstance_flightleg1_idx` (`FLNO`,`Seq`), ADD KEY `fk_flightleginstance_pilot1_idx` (`Pilot`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pilot`
--
ALTER TABLE `pilot`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `plane`
--
ALTER TABLE `plane`
 ADD PRIMARY KEY (`ID`), ADD KEY `fk_plane_airport1_idx` (`LastMaintA`), ADD KEY `fk_plane_planetype1_idx` (`Maker`,`Model`);

--
-- Indexes for table `planeseats`
--
ALTER TABLE `planeseats`
 ADD PRIMARY KEY (`Maker`,`Model`,`SeatType`);

--
-- Indexes for table `planetype`
--
ALTER TABLE `planetype`
 ADD PRIMARY KEY (`Maker`,`Model`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
 ADD PRIMARY KEY (`PassID`,`FDate`,`FLNO`), ADD KEY `fk_reservation_flightinstance1_idx` (`FLNO`,`FDate`), ADD KEY `fk_reservation_airport1_idx` (`FromA`), ADD KEY `fk_reservation_airport2_idx` (`ToA`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flightinstance`
--
ALTER TABLE `flightinstance`
ADD CONSTRAINT `fk_flightinstance_flight1` FOREIGN KEY (`FLNO`) REFERENCES `flight` (`FLNO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `flightleg`
--
ALTER TABLE `flightleg`
ADD CONSTRAINT `fk_flightleg_airport1` FOREIGN KEY (`FromA`) REFERENCES `airport` (`Code`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `fk_flightleg_airport2` FOREIGN KEY (`ToA`) REFERENCES `airport` (`Code`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `fk_flightleg_flight1` FOREIGN KEY (`FLNO`) REFERENCES `flight` (`FLNO`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `fk_flightleg_plane1` FOREIGN KEY (`Plane`) REFERENCES `plane` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `flightleginstance`
--
ALTER TABLE `flightleginstance`
ADD CONSTRAINT `fk_flightleginstance_flightinstance1` FOREIGN KEY (`FLNO`, `FDate`) REFERENCES `flightinstance` (`FLNO`, `FDate`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `fk_flightleginstance_flightleg1` FOREIGN KEY (`FLNO`, `Seq`) REFERENCES `flightleg` (`FLNO`, `Seq`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `fk_flightleginstance_pilot1` FOREIGN KEY (`Pilot`) REFERENCES `pilot` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `plane`
--
ALTER TABLE `plane`
ADD CONSTRAINT `fk_plane_airport1` FOREIGN KEY (`LastMaintA`) REFERENCES `airport` (`Code`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `fk_plane_planetype1` FOREIGN KEY (`Maker`, `Model`) REFERENCES `planetype` (`Maker`, `Model`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `planeseats`
--
ALTER TABLE `planeseats`
ADD CONSTRAINT `fk_planeseats_planetype1` FOREIGN KEY (`Maker`, `Model`) REFERENCES `planetype` (`Maker`, `Model`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
ADD CONSTRAINT `fk_reservation_airport1` FOREIGN KEY (`FromA`) REFERENCES `airport` (`Code`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `fk_reservation_airport2` FOREIGN KEY (`ToA`) REFERENCES `airport` (`Code`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `fk_reservation_flightinstance1` FOREIGN KEY (`FLNO`, `FDate`) REFERENCES `flightinstance` (`FLNO`, `FDate`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `fk_reservation_passenger1` FOREIGN KEY (`PassID`) REFERENCES `passenger` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
