-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2024 at 04:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_master`
--

CREATE TABLE `admin_master` (
  `AdminId` int(11) NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_master`
--

INSERT INTO `admin_master` (`AdminId`, `UserName`, `Password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `category_master`
--

CREATE TABLE `category_master` (
  `CategoryId` int(11) NOT NULL,
  `CategoryName` varchar(20) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category_master`
--

INSERT INTO `category_master` (`CategoryId`, `CategoryName`, `Description`, `Image`) VALUES
(20, 'MAN GLASSES', 'ALL NEW GLASSES', 'Screenshot 2024-01-31 211017.png'),
(21, 'WOMAN GLASSES', 'ALL NEW GLASSES', 'Screenshot 2024-01-31 211111.png'),
(22, 'SUNGLASSES', 'NEW LOOKING SUNGLASSES', 'Screenshot 2024-01-31 211225.png');

-- --------------------------------------------------------

--
-- Table structure for table `customer_registration`
--

CREATE TABLE `customer_registration` (
  `CustomerId` int(11) NOT NULL,
  `CustomerName` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Mobile` bigint(10) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `BirthDate` date NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer_registration`
--

INSERT INTO `customer_registration` (`CustomerId`, `CustomerName`, `Address`, `City`, `Email`, `Mobile`, `Gender`, `BirthDate`, `UserName`, `Password`) VALUES
(6, 'nirav', 'magodi', 'GANDHINAGAR', 'nirav@gmail.com', 8544598751, 'Male', '2024-01-09', 'nirav', 'nirav');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_master`
--

CREATE TABLE `feedback_master` (
  `FeedbackId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `Feedback` varchar(200) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_master`
--

CREATE TABLE `item_master` (
  `ItemId` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `ItemName` varchar(20) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Size` varchar(10) NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Price` float NOT NULL,
  `Discount` float NOT NULL,
  `Total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `item_master`
--

INSERT INTO `item_master` (`ItemId`, `CategoryId`, `ItemName`, `Description`, `Size`, `Image`, `Price`, `Discount`, `Total`) VALUES
(19, 22, 'SunGlass', 'Black SunGlass', 'Free', 'Screenshot 2024-01-31 211821.png', 2999, 1000, 1999),
(20, 21, 'Woman Glass', 'New Look', 'Free', 'Screenshot 2024-01-31 211909.png', 2499, 1000, 1499),
(21, 20, 'Man Glass', 'New Black Glass', 'Free', 'Screenshot 2024-01-31 212104.png', 1999, 500, 1499);

-- --------------------------------------------------------

--
-- Table structure for table `offer_master`
--

CREATE TABLE `offer_master` (
  `OfferId` int(11) NOT NULL,
  `Offer` varchar(50) NOT NULL,
  `Detail` varchar(200) NOT NULL,
  `Valid` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `offer_master`
--

INSERT INTO `offer_master` (`OfferId`, `Offer`, `Detail`, `Valid`) VALUES
(2, 'Buy 2 Get 1 Free', 'On a Purchase of 2 Branded Glasses Get 1 SunGlass Free ', '2020-10-07');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `CartId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `ItemName` varchar(20) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` float NOT NULL,
  `Total` float NOT NULL,
  `OrderDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart_final`
--

CREATE TABLE `shopping_cart_final` (
  `CartId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `ItemName` varchar(20) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` float NOT NULL,
  `Total` float NOT NULL,
  `OrderDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `shopping_cart_final`
--

INSERT INTO `shopping_cart_final` (`CartId`, `CustomerId`, `ItemName`, `Quantity`, `Price`, `Total`, `OrderDate`) VALUES
(19, 6, 'SunGlass', 1, 1999, 1999, '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_master`
--
ALTER TABLE `admin_master`
  ADD PRIMARY KEY (`AdminId`);

--
-- Indexes for table `category_master`
--
ALTER TABLE `category_master`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexes for table `customer_registration`
--
ALTER TABLE `customer_registration`
  ADD PRIMARY KEY (`CustomerId`);

--
-- Indexes for table `feedback_master`
--
ALTER TABLE `feedback_master`
  ADD PRIMARY KEY (`FeedbackId`);

--
-- Indexes for table `item_master`
--
ALTER TABLE `item_master`
  ADD PRIMARY KEY (`ItemId`);

--
-- Indexes for table `offer_master`
--
ALTER TABLE `offer_master`
  ADD PRIMARY KEY (`OfferId`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`CartId`);

--
-- Indexes for table `shopping_cart_final`
--
ALTER TABLE `shopping_cart_final`
  ADD PRIMARY KEY (`CartId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_master`
--
ALTER TABLE `admin_master`
  MODIFY `AdminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category_master`
--
ALTER TABLE `category_master`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `customer_registration`
--
ALTER TABLE `customer_registration`
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `feedback_master`
--
ALTER TABLE `feedback_master`
  MODIFY `FeedbackId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item_master`
--
ALTER TABLE `item_master`
  MODIFY `ItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `offer_master`
--
ALTER TABLE `offer_master`
  MODIFY `OfferId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `CartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `shopping_cart_final`
--
ALTER TABLE `shopping_cart_final`
  MODIFY `CartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
