-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2022 at 06:26 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `upload_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `url`, `createdAt`, `updatedAt`) VALUES
(14, 'Teh Kotak', 'bff0d076e9b0e8d7921d00e44ea5db21.jpg', 'http://localhost:5000/image/bff0d076e9b0e8d7921d00e44ea5db21.jpg', '2022-08-08 11:38:50', '2022-08-08 16:24:48'),
(15, 'Antangin', '206c23b0215792eb6b2e4421ab2fcdf6.png', 'http://localhost:5000/image/206c23b0215792eb6b2e4421ab2fcdf6.png', '2022-08-08 11:40:30', '2022-08-08 11:40:30'),
(17, 'TEH BOTOL SOSRO', '3b19fc48e00515971096e11e9581ff79.jpg', 'http://localhost:5000/image/3b19fc48e00515971096e11e9581ff79.jpg', '2022-08-08 16:01:41', '2022-08-08 16:01:41'),
(18, 'Tolak Angin', '0b323dba32511d10a0315f58bfa45ca2.png', 'http://localhost:5000/image/0b323dba32511d10a0315f58bfa45ca2.png', '2022-08-08 16:25:33', '2022-08-08 16:25:33'),
(19, 'Ultra Milk', '3196bbd495125e72be4d0dc9d9ea8140.jpg', 'http://localhost:5000/image/3196bbd495125e72be4d0dc9d9ea8140.jpg', '2022-08-08 16:25:43', '2022-08-08 16:25:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
