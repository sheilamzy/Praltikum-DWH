-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2021 at 03:57 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `classicmodels_dwh`
--

-- --------------------------------------------------------

--
-- Table structure for table `dim_customer`
--

CREATE TABLE `dim_customer` (
  `sk` int(11) NOT NULL,
  `customer_number` int(11) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postal_code` varchar(15) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `sales_rep_employee_number` int(11) DEFAULT NULL,
  `sales_rep_employee_name` varchar(50) DEFAULT NULL,
  `credit_limit` double DEFAULT NULL,
  `last_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dim_date`
--

CREATE TABLE `dim_date` (
  `sk` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `quarter` char(2) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `month_name` varchar(50) DEFAULT NULL,
  `day` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dim_employee`
--

CREATE TABLE `dim_employee` (
  `sk` int(11) NOT NULL,
  `employee_number` int(11) DEFAULT NULL,
  `employee_name` varchar(100) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `office_code` varchar(10) DEFAULT NULL,
  `office_address` varchar(100) DEFAULT NULL,
  `office_city` varchar(50) DEFAULT NULL,
  `office_country` varchar(50) DEFAULT NULL,
  `office_postal_code` varchar(15) DEFAULT NULL,
  `office_territory` varchar(10) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dim_product`
--

CREATE TABLE `dim_product` (
  `sk` int(11) NOT NULL,
  `product_code` varchar(15) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_line` varchar(100) DEFAULT NULL,
  `product_vendor` varchar(100) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fact_order`
--

CREATE TABLE `fact_order` (
  `id` varchar(20) NOT NULL,
  `order_line_number` int(11) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  `product_sk` int(11) DEFAULT NULL,
  `quantity_ordered` int(11) DEFAULT NULL,
  `price_each` double DEFAULT NULL,
  `price_total` double DEFAULT NULL,
  `order_date_sk` int(11) DEFAULT NULL,
  `required_date_sk` int(11) DEFAULT NULL,
  `shipped_date_sk` int(11) DEFAULT NULL,
  `employee_sk` int(11) DEFAULT NULL,
  `customer_sk` int(11) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dim_customer`
--
ALTER TABLE `dim_customer`
  ADD PRIMARY KEY (`sk`),
  ADD KEY `customer_number_key` (`customer_number`),
  ADD KEY `sales_rep_employee_name_key` (`sales_rep_employee_name`),
  ADD KEY `city_key` (`city`),
  ADD KEY `country_key` (`country`);

--
-- Indexes for table `dim_date`
--
ALTER TABLE `dim_date`
  ADD PRIMARY KEY (`sk`),
  ADD KEY `year_key` (`year`),
  ADD KEY `quarter_key` (`quarter`),
  ADD KEY `month_key` (`month`),
  ADD KEY `month_name_key` (`month_name`);

--
-- Indexes for table `dim_employee`
--
ALTER TABLE `dim_employee`
  ADD PRIMARY KEY (`sk`),
  ADD KEY `employee_number_key` (`employee_number`),
  ADD KEY `employee_name_key` (`employee_name`),
  ADD KEY `office_city_key` (`office_city`),
  ADD KEY `office_country_key` (`office_country`);

--
-- Indexes for table `dim_product`
--
ALTER TABLE `dim_product`
  ADD PRIMARY KEY (`sk`),
  ADD KEY `product_code_key` (`product_code`),
  ADD KEY `product_name_key` (`product_name`),
  ADD KEY `product_line_key` (`product_line`),
  ADD KEY `product_vendor_key` (`product_vendor`);


--
-- Indexes for table `fact_order`
--
ALTER TABLE `fact_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_number_key` (`order_number`),
  ADD KEY `order_date_sk_key` (`order_date_sk`),
  ADD KEY `required_date_sk_key` (`required_date_sk`),
  ADD KEY `shipped_date_sk_key` (`shipped_date_sk`),
  ADD KEY `employee_sk_key` (`employee_sk`),
  ADD KEY `customer_sk_key` (`customer_sk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dim_customer`
--
ALTER TABLE `dim_customer`
  MODIFY `sk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dim_date`
--
ALTER TABLE `dim_date`
  MODIFY `sk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dim_employee`
--
ALTER TABLE `dim_employee`
  MODIFY `sk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dim_product`
--
ALTER TABLE `dim_product`
  MODIFY `sk` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
