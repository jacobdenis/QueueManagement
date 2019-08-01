-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2019 at 07:03 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kservico`
--
CREATE DATABASE IF NOT EXISTS `kservico` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `kservico`;

-- --------------------------------------------------------

--
-- Table structure for table `commentssuggestion`
--

CREATE TABLE `commentssuggestion` (
  `cmmid` bigint(20) NOT NULL,
  `uid` int(20) DEFAULT NULL,
  `comments` longtext,
  `datetimecom` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commentssuggestion`
--

INSERT INTO `commentssuggestion` (`cmmid`, `uid`, `comments`, `datetimecom`) VALUES
(2, 5, '<p>Testing <strong>comment</strong></p>\r\n', '2019-03-08 15:03:05');

-- --------------------------------------------------------

--
-- Table structure for table `customeraccount`
--

CREATE TABLE `customeraccount` (
  `custid` bigint(20) NOT NULL DEFAULT '0',
  `uid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customeraccount`
--

INSERT INTO `customeraccount` (`custid`, `uid`) VALUES
(1, 5),
(12, 7),
(13, 8);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `custid` bigint(20) NOT NULL,
  `accountnumber` varchar(20) DEFAULT NULL,
  `custname` varchar(120) DEFAULT NULL,
  `custaddress` text,
  `custemail` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`custid`, `accountnumber`, `custname`, `custaddress`, `custemail`) VALUES
(1, '2', 'Testing, Test Customer', '#22 Sample St. Purok 10 Baguio City 260\'0', 'test@sample.co\'m'),
(12, '1', 'jelyn A. Mendoza', 'Itogon, Benguet', 'Jelyn@yahoo.com'),
(13, '3', 'Marvin Z. Mapili', 'Quirino Hill, Baguio City', 'marvin@Gmail.com'),
(14, '4', 'Arce Q. Macaiba', 'Pinsao, Baguio', 'arce@gmail.com'),
(15, '5', 'Miriam X. Santiago', 'Gibrartar, Baguio', 'miriam@yahoo.com'),
(16, '6', 'JaneS. Fernandez', 'San Fernando, La Union', 'jane@yahoo.com'),
(17, '7', 'Bianca S. Magno', 'Pusorubio, Pangasinan', 'bianca@yahoo.com'),
(18, '8', 'James D. Bumatay', 'Urdaneta, Pangasinan', 'james@gmail.com'),
(19, '9', 'Angelito G. Tejada', 'Aritao, Nueva Ecija', 'angelito@gmail.com'),
(20, '10', 'Mardave B. Sanchez', 'Bambang, Nueva Vizcaya', 'mardave@yahoo.com'),
(21, '11', 'Hill H. Talawec', 'Tuguegarao, Cagayan', 'hill@gmail.com'),
(22, '12', 'Kristalee M. Agustin', 'Conner, Apayao', 'kristalee@yahoo.com'),
(23, '13', 'Myro L. Gonzales', 'Trancoville, Baguio', 'myro@yahoo.com'),
(24, '14', 'Marilou M. Magsiano', 'Bokawkan, Baguio', 'marilou@gmail.com'),
(25, '15', 'Jay N. Villacer', 'Bakakeng, Baguio', 'jay@yahoo.com'),
(26, '16', 'James K. Mago', 'Luna, Apayao', 'james@yahoo.com'),
(27, '17', 'Mark J. Madiam', 'Kias, Baguio', 'mark@yahoo.com'),
(28, '18', 'messias hortelano', 'pinget baguio city', 'messias@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `downpayments`
--

CREATE TABLE `downpayments` (
  `dpid` int(11) NOT NULL,
  `pricefrom` double(20,2) DEFAULT NULL,
  `priceto` double(20,2) DEFAULT NULL,
  `opts1` int(11) DEFAULT NULL,
  `opts2` int(11) DEFAULT NULL,
  `opts3` int(11) DEFAULT NULL,
  `opts4` int(11) DEFAULT NULL,
  `opts5` int(11) DEFAULT NULL,
  `opts6` int(11) DEFAULT NULL,
  `opts7` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `downpayments`
--

INSERT INTO `downpayments` (`dpid`, `pricefrom`, `priceto`, `opts1`, `opts2`, `opts3`, `opts4`, `opts5`, `opts6`, `opts7`) VALUES
(1, 50000.00, 70000.00, 4500, 6500, 8500, 10000, 15000, 20000, 30000),
(2, 40000.00, 49999.00, 4500, 6500, 8500, 10000, 20000, 30000, 40000),
(3, 70001.00, 75000.00, 5000, 6500, 8500, 10000, 15000, 20000, 30000),
(4, 100000.00, 105000.00, 15000, 20000, 25000, 30000, 35000, 40000, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `payaccounts`
--

CREATE TABLE `payaccounts` (
  `accid` int(11) NOT NULL,
  `emailaddress` varchar(50) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `accounttype` varchar(100) DEFAULT NULL,
  `accountname` varchar(100) DEFAULT NULL,
  `accpass` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payaccounts`
--

INSERT INTO `payaccounts` (`accid`, `emailaddress`, `mobileno`, `accounttype`, `accountname`, `accpass`) VALUES
(1, 'testpaypal@gmail.com', NULL, 'PayPal', 'Testing PayPal Account', 'test'),
(2, 'testpaymaya@gmail.com', '09051234567', 'PayMaya', 'Testing PayMaya Account', '1234'),
(3, NULL, '09051234567', 'Globe GCash', 'Testing Globe GCash Account', '1234'),
(4, 'testcoins@gmail.com', '09051234567', 'Coins.ph', 'Testing Coins.ph Account', 'test'),
(5, 'testdragon@gmail.com', NULL, 'Dragon Pay', 'Testing Dragon Pay Account', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payid` bigint(20) NOT NULL,
  `prid` bigint(20) DEFAULT NULL,
  `datetopay` date DEFAULT NULL,
  `ornum` varchar(20) DEFAULT NULL,
  `amount` double(11,2) DEFAULT NULL,
  `paythru` varchar(100) DEFAULT NULL,
  `accid` int(11) DEFAULT NULL,
  `datepaid` date DEFAULT NULL,
  `unread` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payid`, `prid`, `datetopay`, `ornum`, `amount`, `paythru`, `accid`, `datepaid`, `unread`) VALUES
(9, 16, '2019-06-14', '37556', 3911.11, 'PayPal', 1, '2019-06-14', 1),
(14, 16, '2019-07-12', '47180', 3911.11, 'Cashier', NULL, '2019-06-14', 1),
(16, 16, '2019-08-10', '18956', 3911.11, 'PayPal', 1, '2019-06-15', 1),
(27, 11, '2019-04-22', '78311', 6920.75, 'Cashier', NULL, '2019-06-19', 1),
(28, 11, '2019-05-31', '72905', 6920.75, 'Cashier', NULL, '2019-06-19', 1),
(29, 11, '2019-06-30', '88630', 6920.75, 'Cashier', NULL, '2019-06-19', 1),
(30, 11, '2019-07-25', '16954', 6920.75, 'Cashier', NULL, '2019-06-19', 1),
(32, 18, '2019-07-02', '47441', 8250.00, 'Cashier', NULL, '2019-06-19', 1),
(37, 18, '2019-08-06', '86180', 8250.00, 'Cashier', NULL, '2019-06-19', 1),
(38, 18, '2019-09-07', '33689', 8250.00, 'Cashier', NULL, '2019-06-19', 1),
(40, 19, '2019-02-04', '61531', 4612.50, 'Cashier', NULL, '2019-06-20', 1),
(41, 19, '2019-03-02', '67088', 4612.50, 'Cashier', NULL, '2019-06-20', 1),
(42, 19, '2019-04-08', '28210', 4612.50, 'Cashier', NULL, '2019-06-20', 1),
(43, 19, '2019-05-10', '43810', 4612.50, 'Cashier', NULL, '2019-06-20', 1),
(63, 17, '2019-07-02', '14875', 14150.00, 'Cashier', NULL, '2019-06-25', 1),
(68, 17, '2019-08-10', '86616', 14574.50, 'Cashier', NULL, '2019-06-25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payregistry`
--

CREATE TABLE `payregistry` (
  `prid` bigint(20) NOT NULL,
  `custid` bigint(20) DEFAULT NULL,
  `ornum` varchar(20) DEFAULT NULL,
  `regdate` date DEFAULT NULL,
  `productinfo` tinytext,
  `productprice` double(11,2) DEFAULT NULL,
  `downpayment` double(11,2) DEFAULT NULL,
  `yearstopay` int(2) DEFAULT NULL,
  `totalprice` double(11,2) DEFAULT NULL,
  `monthlypayment` double(11,2) DEFAULT NULL,
  `paid` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payregistry`
--

INSERT INTO `payregistry` (`prid`, `custid`, `ornum`, `regdate`, `productinfo`, `productprice`, `downpayment`, `yearstopay`, `totalprice`, `monthlypayment`, `paid`) VALUES
(17, 12, '64146', '2019-06-01', 'honda xrm', 70000.00, 4500.00, 6, 89400.00, 14150.00, NULL),
(18, 1, '77720', '2019-06-02', 'mio', 75000.00, 5000.00, 12, 104000.00, 8250.00, NULL),
(19, 23, '85345', '2019-01-03', 'kawasaki', 75000.00, 10000.00, 24, 120700.00, 4612.50, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penalties`
--

CREATE TABLE `penalties` (
  `pltyid` int(11) NOT NULL,
  `prid` int(11) DEFAULT NULL,
  `formonthyear` varchar(30) DEFAULT NULL,
  `amount` double(11,2) DEFAULT NULL,
  `lastdatepay` date DEFAULT NULL,
  `currentdatepay` date DEFAULT NULL,
  `daysgap` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penalties`
--

INSERT INTO `penalties` (`pltyid`, `prid`, `formonthyear`, `amount`, `lastdatepay`, `currentdatepay`, `daysgap`) VALUES
(12, 16, '2019-06', 117.33, '2019-05-10', '2019-06-14', 35),
(46, 11, '2019-05', 207.62, '2019-04-22', '2019-05-31', 39),
(53, 18, '2019-08', 247.50, '2019-07-02', '2019-08-06', 35),
(63, 19, '2019-05', 138.38, '2019-04-03', '2019-05-10', 37),
(64, 19, '2019-04', 138.38, '2019-03-03', '2019-04-08', 36),
(82, 17, '2019-10', 424.50, '2019-09-01', '2019-10-10', 39);

-- --------------------------------------------------------

--
-- Table structure for table `replycomments`
--

CREATE TABLE `replycomments` (
  `cmrpid` bigint(20) NOT NULL,
  `cmmid` bigint(20) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `replymsg` longtext,
  `replydt` datetime DEFAULT NULL,
  `unread` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `replycomments`
--

INSERT INTO `replycomments` (`cmrpid`, `cmmid`, `uid`, `replymsg`, `replydt`, `unread`) VALUES
(3, 2, 5, '<p>Testing <strong>reply</strong></p>\r\n\r\n<hr />\r\n<p>aksjdfhjas dkfjhasdjfh jkasdfsdlasd[&#39;;asdlfkasf;kajsdfh kasgryewquih asjfhjkasdhf</p>\r\n', '2019-03-26 15:34:50', 0),
(4, 2, 5, '<p>asdlfkjaoiweur asldkf ;laksdjflkjriojaksdjhfjkahsd;faskjhdewuiaskndf alskdfhkasjdhf ihewuhksadfh ksadhfjkasdf</p>\r\n', '2019-03-27 11:39:40', 0);

-- --------------------------------------------------------

--
-- Table structure for table `useraccounts`
--

CREATE TABLE `useraccounts` (
  `uid` int(3) NOT NULL,
  `username` varchar(60) DEFAULT NULL,
  `userlogin` varchar(30) DEFAULT NULL,
  `userpassword` longtext,
  `usertype` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `useraccounts`
--

INSERT INTO `useraccounts` (`uid`, `username`, `userlogin`, `userpassword`, `usertype`) VALUES
(1, 'Administrator', 'admin', '\"Àá-', 1),
(5, 'Testing', 'test', 'KgYá', 2),
(7, 'jelyn', 'jelyn', '¨y)Â6', 2),
(8, 'Marvin', 'Marvin@yahoo.com', 't¢Y@', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commentssuggestion`
--
ALTER TABLE `commentssuggestion`
  ADD PRIMARY KEY (`cmmid`);

--
-- Indexes for table `customeraccount`
--
ALTER TABLE `customeraccount`
  ADD PRIMARY KEY (`custid`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`custid`);

--
-- Indexes for table `downpayments`
--
ALTER TABLE `downpayments`
  ADD PRIMARY KEY (`dpid`);

--
-- Indexes for table `payaccounts`
--
ALTER TABLE `payaccounts`
  ADD PRIMARY KEY (`accid`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payid`);

--
-- Indexes for table `payregistry`
--
ALTER TABLE `payregistry`
  ADD PRIMARY KEY (`prid`);

--
-- Indexes for table `penalties`
--
ALTER TABLE `penalties`
  ADD PRIMARY KEY (`pltyid`);

--
-- Indexes for table `replycomments`
--
ALTER TABLE `replycomments`
  ADD PRIMARY KEY (`cmrpid`);

--
-- Indexes for table `useraccounts`
--
ALTER TABLE `useraccounts`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commentssuggestion`
--
ALTER TABLE `commentssuggestion`
  MODIFY `cmmid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `custid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `downpayments`
--
ALTER TABLE `downpayments`
  MODIFY `dpid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payaccounts`
--
ALTER TABLE `payaccounts`
  MODIFY `accid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `payregistry`
--
ALTER TABLE `payregistry`
  MODIFY `prid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `penalties`
--
ALTER TABLE `penalties`
  MODIFY `pltyid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `replycomments`
--
ALTER TABLE `replycomments`
  MODIFY `cmrpid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `useraccounts`
--
ALTER TABLE `useraccounts`
  MODIFY `uid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'table', 'teacher_subject', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Dumping data for table `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('root', 'role', 'table', 'queue', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"queue\",\"table\":\"accesscontrol\"},{\"db\":\"queue\",\"table\":\"controller\"},{\"db\":\"queue\",\"table\":\"Controller\"},{\"db\":\"queue\",\"table\":\"status\"},{\"db\":\"queue\",\"table\":\"systemsetting\"},{\"db\":\"queue\",\"table\":\"login\"},{\"db\":\"queue\",\"table\":\"roletype\"},{\"db\":\"queue\",\"table\":\"role\"},{\"db\":\"queue\",\"table\":\"clinic\"},{\"db\":\"queue\",\"table\":\"queue\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('queue', 'employee', 'FirstName'),
('queue', 'login', 'Username');

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('', '2019-07-30 05:31:02', '{\"Console\\/Mode\":\"collapse\"}'),
('root', '2019-08-01 05:03:22', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":325}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `queue`
--
CREATE DATABASE IF NOT EXISTS `queue` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `queue`;

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
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accesscontrol`
--

INSERT INTO `accesscontrol` (`AccessControlID`, `LoginID`, `ControllerName`, `Create`, `Read`, `Update`, `Delete`, `DateCreated`) VALUES
(8, 15, '6', 1, 1, 1, 1, '2019-07-31 20:41:47');

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
(7, 'module');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(250) NOT NULL,
  `MiddleName` varchar(250) NOT NULL,
  `LastName` varchar(250) NOT NULL,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmployeeID`, `FirstName`, `MiddleName`, `LastName`, `DateCreated`) VALUES
(1, 'dane', 'wasak', 'joe', '2019-07-29 19:46:17'),
(19, 'Reception', '', 'Nist', '2019-07-30 23:02:07'),
(20, 'Doctor1', 'Doctor1', 'Doctor', '2019-07-30 23:39:52'),
(21, 'System', '', 'Admin', '2019-07-31 20:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `LoginID` int(11) NOT NULL,
  `Username` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`LoginID`, `Username`, `Password`, `EmployeeID`, `DateCreated`) VALUES
(1, 'admin', '$2y$10$FitN386Xq3XBLii/kC0ELuuuI0S3FYUP/VGZgV/b0TSEnb/8p.wc.', 1, '2019-07-29 19:46:25'),
(13, 'reception', '$2y$10$W9dPGKkv2UcyP2omrYyD2eywc2JHzAFGDk5CmMTr7Gt/AVVMkPMUC', 19, '2019-07-30 23:02:07'),
(14, 'doc', '$2y$10$EVNoWBok8IO3.Q8ffrtGN.CR0p/xEjlCyM3l3dEJpXLqxm52QuT1u', 20, '2019-07-30 23:39:52'),
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
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PatientID`, `FirstName`, `MiddleName`, `LastName`, `DateCreated`) VALUES
(10, 'Jacob', 'Dea', 'Lino', '2019-07-30 22:31:59'),
(11, 'ad', 'ed', 'cd', '2019-07-30 23:47:00'),
(12, 'MAVAREEN', 'ss', 'ss', '2019-07-31 12:50:59'),
(13, 'jeremias', '', 'remirez', '2019-07-31 18:35:24');

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
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`QueueID`, `PatientID`, `EmployeeID`, `ClinicID`, `StatusID`, `CheckupTypeID`, `DateCreated`) VALUES
(1, 10, 1, 1, 1, 1, '2019-07-31 19:42:18'),
(2, 10, 1, 2, 1, 1, '2019-07-31 20:01:53'),
(3, 10, 1, 3, 1, 1, '2019-07-31 20:02:01'),
(4, 10, 1, 3, 1, 1, '2019-07-31 20:02:19'),
(5, 10, 1, 3, 1, 1, '2019-07-31 20:02:22'),
(6, 10, 1, 3, 1, 1, '2019-07-31 20:02:25');

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
(1, 1, 1),
(13, 13, 2),
(14, 14, 1),
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
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
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
  MODIFY `AccessControlID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `ControllerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `LoginID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `QueueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
