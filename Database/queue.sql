-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2019 at 02:00 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `queue`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesscontrol`
--

CREATE TABLE `accesscontrol` (
  `AccessControlID` int(11) NOT NULL,
  `LoginID` int(11) NOT NULL,
  `ControllerName` varchar(250) NOT NULL,
  `Create` tinyint(1) NOT NULL,
  `Read` tinyint(1) NOT NULL,
  `Update` tinyint(1) NOT NULL,
  `Delete` tinyint(1) NOT NULL,
  `DateCreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accesscontrol`
--

INSERT INTO `accesscontrol` (`AccessControlID`, `LoginID`, `ControllerName`, `Create`, `Read`, `Update`, `Delete`, `DateCreated`) VALUES
(8, 15, '6', 1, 1, 1, 1, '2019-07-31 20:41:47'),
(12, 16, '2', 1, 1, 1, 1, '2019-07-31 23:41:18'),
(13, 16, '3', 1, 1, 1, 1, '2019-07-31 23:41:26'),
(16, 15, '2', 1, 1, 1, 1, '2019-08-01 00:22:31'),
(17, 15, '3', 1, 1, 1, 1, '2019-08-01 00:25:25'),
(18, 15, '4', 1, 1, 1, 1, '2019-08-01 00:26:04'),
(19, 15, '8', 1, 1, 1, 1, '2019-08-01 23:23:01');

-- --------------------------------------------------------

--
-- Table structure for table `checkuptype`
--

CREATE TABLE `checkuptype` (
  `CheckupTypeID` int(11) NOT NULL,
  `CheckupType` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checkuptype`
--

INSERT INTO `checkuptype` (`CheckupTypeID`, `CheckupType`) VALUES
(1, 'Tuli'),
(2, 'kugit');

-- --------------------------------------------------------

--
-- Table structure for table `clinic`
--

CREATE TABLE `clinic` (
  `ClinicID` int(11) NOT NULL,
  `Clinic` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clinic`
--

INSERT INTO `clinic` (`ClinicID`, `Clinic`) VALUES
(1, 'Animal Bite Treatment Center'),
(2, 'Family Medicine'),
(3, 'Family Planning');

-- --------------------------------------------------------

--
-- Table structure for table `controller`
--

CREATE TABLE `controller` (
  `ControllerID` int(11) NOT NULL,
  `ControllerName` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `controller`
--

INSERT INTO `controller` (`ControllerID`, `ControllerName`) VALUES
(1, 'dashboard'),
(2, 'receptionist'),
(3, 'patient'),
(4, 'employee'),
(5, 'queue'),
(6, 'managesystem'),
(7, 'module'),
(8, 'profile');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(250) NOT NULL,
  `MiddleName` varchar(250) NOT NULL,
  `LastName` varchar(250) NOT NULL,
  `Phone` varchar(250) NOT NULL,
  `Address` varchar(250) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `BirthDate` date NOT NULL,
  `Gender` tinyint(1) NOT NULL,
  `DateCreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmployeeID`, `FirstName`, `MiddleName`, `LastName`, `Phone`, `Address`, `Email`, `BirthDate`, `Gender`, `DateCreated`) VALUES
(21, 'System', '', 'Admin', '09187645037', 'camp 7', 'linoacob@gmail.com', '1995-01-13', 0, '2019-07-31 20:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `LoginID` int(11) NOT NULL,
  `Username` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `DateCreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`LoginID`, `Username`, `Password`, `EmployeeID`, `DateCreated`) VALUES
(15, 'systemadmin', '$2y$10$VtmHJlq28H4VjhYhGGp6K.jDCH46Tnvjx9ZQQPUpRRq6Nmw9xVSCG', 21, '2019-07-31 20:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `PatientID` int(11) NOT NULL,
  `FirstName` varchar(250) NOT NULL,
  `MiddleName` varchar(250) NOT NULL,
  `LastName` varchar(250) NOT NULL,
  `Phone` varchar(250) NOT NULL,
  `Address` varchar(250) NOT NULL,
  `BirthDate` date NOT NULL,
  `Gender` tinyint(1) NOT NULL,
  `DateCreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PatientID`, `FirstName`, `MiddleName`, `LastName`, `Phone`, `Address`, `BirthDate`, `Gender`, `DateCreated`) VALUES
(15, 'FirstName', 'FirstName', 'FirstName', '09187645037', 'FirstName', '2018-08-02', 0, '2019-08-02 01:45:02'),
(16, 'dd', 'd', 'dd', 'dd', 'dd', '2019-08-01', 0, '2019-08-02 02:00:44');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `QueueID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `ClinicID` int(11) NOT NULL,
  `StatusID` int(11) NOT NULL,
  `CheckupTypeID` int(11) NOT NULL,
  `DateCreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`QueueID`, `PatientID`, `EmployeeID`, `ClinicID`, `StatusID`, `CheckupTypeID`, `DateCreated`) VALUES
(8, 14, 21, 1, 2, 1, '2019-08-01 01:04:37'),
(9, 14, 21, 1, 1, 1, '2019-08-01 01:04:40'),
(10, 14, 21, 2, 1, 1, '2019-08-01 01:04:43'),
(11, 14, 21, 3, 1, 1, '2019-08-01 01:04:46'),
(12, 15, 21, 1, 1, 1, '2019-09-11 19:40:22'),
(13, 15, 21, 2, 1, 1, '2019-09-11 19:40:36'),
(14, 15, 21, 3, 1, 1, '2019-09-11 19:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RoleID` int(11) NOT NULL,
  `LoginID` int(11) NOT NULL,
  `RoleTypeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RoleID`, `LoginID`, `RoleTypeID`) VALUES
(15, 15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `roletype`
--

CREATE TABLE `roletype` (
  `RoleTypeID` int(11) NOT NULL,
  `RoleType` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roletype`
--

INSERT INTO `roletype` (`RoleTypeID`, `RoleType`) VALUES
(1, 'Doctor'),
(2, 'Receptionist'),
(3, 'SystemAdmin');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `StatusID` int(11) NOT NULL,
  `Status` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`StatusID`, `Status`) VALUES
(1, 'Pending'),
(2, 'Done');

-- --------------------------------------------------------

--
-- Table structure for table `systemsetting`
--

CREATE TABLE `systemsetting` (
  `SystemSettingID` int(11) NOT NULL,
  `SystemName` varchar(250) NOT NULL,
  `SystemValue` varchar(250) NOT NULL,
  `DateCreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `systemsetting`
--

INSERT INTO `systemsetting` (`SystemSettingID`, `SystemName`, `SystemValue`, `DateCreated`) VALUES
(1, 'SystemName', 'Queue Management System', '2019-07-29 19:04:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesscontrol`
--
ALTER TABLE `accesscontrol`
  ADD PRIMARY KEY (`AccessControlID`);

--
-- Indexes for table `checkuptype`
--
ALTER TABLE `checkuptype`
  ADD PRIMARY KEY (`CheckupTypeID`);

--
-- Indexes for table `clinic`
--
ALTER TABLE `clinic`
  ADD PRIMARY KEY (`ClinicID`);

--
-- Indexes for table `controller`
--
ALTER TABLE `controller`
  ADD PRIMARY KEY (`ControllerID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`LoginID`),
  ADD UNIQUE KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PatientID`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`QueueID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleID`),
  ADD UNIQUE KEY `LoginID` (`LoginID`);

--
-- Indexes for table `roletype`
--
ALTER TABLE `roletype`
  ADD PRIMARY KEY (`RoleTypeID`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`StatusID`);

--
-- Indexes for table `systemsetting`
--
ALTER TABLE `systemsetting`
  ADD PRIMARY KEY (`SystemSettingID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accesscontrol`
--
ALTER TABLE `accesscontrol`
  MODIFY `AccessControlID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `checkuptype`
--
ALTER TABLE `checkuptype`
  MODIFY `CheckupTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clinic`
--
ALTER TABLE `clinic`
  MODIFY `ClinicID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `controller`
--
ALTER TABLE `controller`
  MODIFY `ControllerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `LoginID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `QueueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `roletype`
--
ALTER TABLE `roletype`
  MODIFY `RoleTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `StatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `systemsetting`
--
ALTER TABLE `systemsetting`
  MODIFY `SystemSettingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`LoginID`) REFERENCES `login` (`LoginID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
