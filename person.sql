-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2022 at 05:46 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `person`
--

-- --------------------------------------------------------

--
-- Table structure for table `dep`
--

CREATE TABLE `dep` (
  `id_dep` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_dep` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dep`
--

INSERT INTO `dep` (`id_dep`, `name_dep`) VALUES
('01', 'ช่างยนต์'),
('02', 'ช่างกลโรงงาน'),
('08', 'คอมพิวเตอร์ธุรกิจ'),
('09', 'เทคโนโลยีสารสนเทศ');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `p_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รหัสนักศึกษา',
  `pre` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'เบอร์โทร',
  `fname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ชื่อ',
  `lname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'นามสกุล',
  `age` int(11) NOT NULL COMMENT 'อายุ',
  `id_dep` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `pre`, `fname`, `lname`, `age`, `id_dep`) VALUES
('011', 'นาย', 'ศุภกร', 'ละงู', 21, '09'),
('5555', 'นาย', 'sdfdsf', 'dsfdsf', 20, '02'),
('64309010001', 'นาย', 'จิรภัทร', 'เธียรธัญญกิจ', 21, '09'),
('64309010004', 'นาย', 'พชรพล', 'ปฏิมิล', 19, '02'),
('64309010005', 'นาย', 'ศุภณัฐ', 'อินทรทัต', 20, '01'),
('64309010006', 'นาย', 'อานนท์', 'บุญเต็ม', 19, '08'),
('64309010010', 'นางสาว', 'อัฐภิญญา', 'เรืองฤทธิ์', 20, '09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dep`
--
ALTER TABLE `dep`
  ADD PRIMARY KEY (`id_dep`),
  ADD KEY `id_dep` (`id_dep`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_dep` (`id_dep`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`id_dep`) REFERENCES `dep` (`id_dep`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
