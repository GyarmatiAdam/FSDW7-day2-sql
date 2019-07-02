-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2019 at 12:50 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ID` int(11) NOT NULL,
  `DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CHAPTERS` int(11) DEFAULT NULL,
  `AUTHOR` varchar(155) DEFAULT NULL,
  `TITLE` varchar(155) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ID`, `DATE`, `CUSTOMER_ID`, `DESCRIPTION`, `CHAPTERS`, `AUTHOR`, `TITLE`) VALUES
(1, '2019-07-02 10:16:15', 4, 'This is a description', 20, 'Cool Guy', 'Cool Book'),
(2, '2019-07-02 10:16:15', 3, 'This is a book description', 40, 'Anonymus', 'Anonym book'),
(3, '2019-07-02 10:31:10', 6, 'This is a description', 23, 'Old man', 'Old book'),
(4, '2019-07-02 10:31:10', 1, 'This is a description', 29, 'Young man', 'Young book'),
(5, '2019-07-02 10:31:10', 5, 'This is a description', 49, 'Someone', 'Some book'),
(6, '2019-07-02 10:31:10', 3, 'This is a description', 10, 'Crazy man', 'Crazy book');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `AGE` int(11) NOT NULL,
  `ADDRESS` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `NAME`, `AGE`, `ADDRESS`) VALUES
(1, 'Elon', 45, 'Musk Ave'),
(2, 'Steve', 66, 'Wozniak Street'),
(3, 'Adam', 16, 'Musk Ave'),
(4, 'Thomas', 26, 'Big Street'),
(5, 'Greg', 35, 'Long Ave'),
(6, 'Iby', 28, 'Short Street'),
(7, 'George', 45, 'Quick Ave'),
(8, 'John', 69, 'Deep Street');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `BOOK_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID`, `DATE`, `CUSTOMER_ID`, `BOOK_ID`) VALUES
(1, '2019-07-02 12:37:25', 6, 2),
(2, '2019-07-02 12:37:25', 1, 5),
(3, '2019-07-02 12:37:25', 5, 4),
(4, '2019-07-02 12:37:25', 3, 6),
(5, '2019-07-02 12:37:25', 4, 1),
(6, '2019-07-02 12:37:25', 6, 1),
(7, '2019-07-02 12:37:25', 2, 1),
(8, '2019-07-02 12:37:25', 4, 4),
(9, '2019-07-02 12:37:25', 5, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  ADD KEY `BOOK_ID` (`BOOK_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
