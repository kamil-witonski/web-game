-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2019 at 04:27 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_siege`
--

-- --------------------------------------------------------

--
-- Table structure for table `guns`
--

CREATE TABLE `guns` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sprite` varchar(100) NOT NULL,
  `fire_rate` int(11) NOT NULL,
  `reload_time` int(11) NOT NULL,
  `bullet_velocity` int(11) NOT NULL,
  `bullet_damage` int(11) NOT NULL,
  `mag_size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guns`
--

INSERT INTO `guns` (`id`, `name`, `sprite`, `fire_rate`, `reload_time`, `bullet_velocity`, `bullet_damage`, `mag_size`) VALUES
(1, 'pistol', '', 300, 2000, 20, 25, 7),
(2, 'UZI', '', 150, 2500, 40, 30, 15),
(3, 'AK47', '', 200, 2500, 45, 33, 30);

-- --------------------------------------------------------

--
-- Table structure for table `maps`
--

CREATE TABLE `maps` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `tile_map` varchar(300) NOT NULL,
  `tile_set` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `maps`
--

INSERT INTO `maps` (`id`, `name`, `tile_map`, `tile_set`) VALUES
(1, 'level1', '/public/assets/test_map/test_map.json', '\"/public/assets/test_map/5z1KX.png\"'),
(2, 'level2', '/public/assets/test_map/level2.json', '\"/public/assets/test_map/5z1KX.png\"');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guns`
--
ALTER TABLE `guns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guns`
--
ALTER TABLE `guns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
