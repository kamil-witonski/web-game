-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2019 at 11:19 PM
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
  `mag_size` int(11) NOT NULL,
  `audio` varchar(100) DEFAULT NULL,
  `asset_img` varchar(100) DEFAULT NULL,
  `animation` varchar(50) DEFAULT NULL,
  `gun_offset` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guns`
--

INSERT INTO `guns` (`id`, `name`, `sprite`, `fire_rate`, `reload_time`, `bullet_velocity`, `bullet_damage`, `mag_size`, `audio`, `asset_img`, `animation`, `gun_offset`) VALUES
(1, 'pistol', '', 300, 2000, 20, 25, 7, 'pistol', '/public/assets/guns/pistol.png', 'one_hand', '{\"x\": \"20\",\r\n\"y\": \"-12\"}'),
(2, 'UZI', '', 150, 2500, 40, 30, 15, 'uzi', '/public/assets/guns/uzi.png', 'one_hand', '{\"x\":\"20\",\"y\":\"-12\"}'),
(3, 'AK47', '', 200, 2500, 45, 33, 30, 'rifle', '/public/assets/guns/ar.png', 'two_hand', '{\"x\":\"15\",\"y\": \"-5\"}'),
(4, 'sniper', '', 1, 7000, 50, 100, 1, 'sniper', '/public/assets/guns/sniper.png', 'two_hand', '{\"x\":\"15\",\"y\": \"-5\"}');

-- --------------------------------------------------------

--
-- Table structure for table `maps`
--

CREATE TABLE `maps` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `tile_map` varchar(300) NOT NULL,
  `tile_set` text NOT NULL,
  `background` text,
  `spawn_points` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `maps`
--

INSERT INTO `maps` (`id`, `name`, `tile_map`, `tile_set`, `background`, `spawn_points`) VALUES
(1, 'level1', '/public/assets/test_map/test_map.json', '/public/assets/test_map/5z1KX.png', '[\"/public/assets/level_1/level1_sky.png\", \"/public/assets/level_1/level1_clouds.png\", \"/public/assets/level_1/level1_backtrees.png\", \"/public/assets/level_1/level1_trees.png\"]\r\n', '[{ \"x\": \"100\", \"y\": \"100\" }, { \"x\": \"300\", \"y\": \"300\" }]'),
(2, 'level2', '/public/assets/test_map/level2.json', '/public/assets/test_map/5z1KX.png', '[\"/public/assets/level_2/bg.png\", \"/public/assets/level_2/bg_clouds.png\", \"/public/assets/level_2/bg_parallaxFar.png\", \"/public/assets/level_2/bg_parallaxNear.png\"]', '[{ \"x\": \"100\", \"y\": \"100\" }, { \"x\": \"300\", \"y\": \"300\" }]');

-- --------------------------------------------------------

--
-- Table structure for table `matchdata`
--

CREATE TABLE `matchdata` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `kills` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `damage` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matchdata`
--

INSERT INTO `matchdata` (`id`, `date`, `kills`, `deaths`, `damage`, `user_id`) VALUES
(1, 2019, 0, 5, 0, 1),
(2, 2019, 0, 0, 639, 2),
(3, 2019, 0, 10, 175, 1),
(4, 2019, 0, 1, 1293, 2),
(5, 2019, 0, 0, 0, 2),
(6, 2019, 0, 0, 0, 1),
(7, 2019, 0, 5, 0, 1),
(8, 2019, 5, 0, 636, 2),
(9, 2019, 0, 1, 0, 1),
(10, 2019, 1, 0, 120, 2),
(11, 2019, 0, 1, 0, 1),
(12, 2019, 1, 0, 129, 2),
(13, 2019, 0, 1, 0, 1),
(14, 2019, 1, 0, 120, 2),
(15, 2019, 0, 1, 0, 1),
(16, 2019, 1, 0, 120, 2),
(17, 2019, 0, 1, 0, 1),
(18, 2019, 1, 0, 120, 2),
(19, 2019, 0, 1, 0, 1),
(20, 2019, 1, 0, 120, 2),
(21, 2019, 0, 1, 0, 2),
(22, 2019, 1, 0, 120, 1),
(23, 2019, 0, 1, 0, 1),
(24, 2019, 1, 0, 120, 2),
(25, 2019, 0, 1, 0, 2),
(26, 2019, 1, 0, 90, 1),
(27, 2019, 0, 1, 0, 2),
(28, 2019, 1, 0, 90, 1),
(29, 2019, 0, 1, 0, 2),
(30, 2019, 1, 0, 129, 1),
(31, 2019, 1, 0, 120, 2),
(32, 2019, 0, 1, 0, 1),
(33, 2019, 0, 1, 0, 1),
(34, 2019, 1, 0, 120, 2),
(35, 2019, 1, 0, 100, 1),
(36, 2019, 0, 1, 0, 2),
(37, 2019, 0, 1, 0, 2),
(38, 2019, 1, 0, 100, 1),
(39, 2019, 0, 1, 0, 2),
(40, 2019, 1, 0, 100, 1),
(41, 2019, 0, 1, 0, 2),
(42, 2019, 1, 0, 120, 1),
(43, 2019, 0, 1, 0, 1),
(44, 2019, 1, 0, 120, 2),
(45, 2019, 0, 1, 0, 2),
(46, 2019, 1, 0, 75, 1),
(47, 2019, 0, 1, 0, 2),
(48, 2019, 1, 0, 80, 1),
(49, 2019, 0, 1, 0, 2),
(50, 2019, 1, 0, 90, 1),
(51, 2019, 0, 1, 0, 2),
(52, 2019, 1, 0, 100, 1),
(53, 2019, 0, 1, 0, 2),
(54, 2019, 1, 0, 100, 1),
(55, 2019, 0, 1, 0, 2),
(56, 2019, 1, 0, 130, 1),
(57, 2019, 0, 1, 0, 2),
(58, 2019, 1, 0, 100, 1),
(59, 2019, 0, 1, 0, 2),
(60, 2019, 1, 0, 100, 1),
(61, 2019, 0, 1, 0, 2),
(62, 2019, 1, 0, 100, 1),
(63, 2019, 0, 1, 0, 2),
(64, 2019, 1, 0, 100, 1),
(65, 2019, 1, 0, 100, 1),
(66, 2019, 0, 1, 0, 2),
(67, 2019, 0, 1, 0, 1),
(68, 2019, 1, 0, 100, 2),
(69, 2019, 0, 1, 0, 2),
(70, 2019, 1, 0, 100, 1),
(71, 2019, 0, 1, 0, 2),
(72, 2019, 1, 0, 133, 1),
(73, 2019, 1, 0, 100, 2),
(74, 2019, 0, 1, 0, 1),
(75, 2019, 0, 1, 0, 1),
(76, 2019, 1, 0, 190, 2),
(77, 2019, 0, 1, 0, 2),
(78, 2019, 1, 0, 100, 1),
(79, 2019, 0, 1, 0, 2),
(80, 2019, 1, 0, 100, 1),
(81, 2019, 0, 1, 0, 2),
(82, 2019, 1, 0, 100, 1),
(83, 2019, 0, 1, 0, 2),
(84, 2019, 1, 0, 100, 1),
(85, 2019, 0, 1, 0, 1),
(86, 2019, 1, 0, 100, 2),
(87, 2019, 0, 1, 0, 1),
(88, 2019, 1, 0, 100, 2),
(89, 2019, 0, 1, 0, 1),
(90, 2019, 1, 0, 120, 2),
(91, 2019, 0, 5, 0, 2),
(92, 2019, 5, 0, 542, 1),
(93, 2019, 5, 2, 557, 2),
(94, 2019, 1, 5, 100, 1),
(95, 2019, 2, 7, 200, 2),
(96, 2019, 5, 0, 540, 1),
(97, 2019, 0, 5, 0, 2),
(98, 2019, 5, 0, 616, 1),
(99, 2019, 0, 5, 0, 1),
(100, 2019, 5, 0, 651, 2),
(101, 2019, 0, 5, 0, 2),
(102, 2019, 5, 0, 628, 1),
(103, 2019, 0, 5, 0, 2),
(104, 2019, 5, 0, 660, 1),
(105, 2019, 0, 5, 0, 2),
(106, 2019, 5, 0, 596, 1),
(107, 2019, 0, 5, 0, 1),
(108, 2019, 5, 0, 628, 2),
(109, 2019, 5, 0, 582, 1),
(110, 2019, 0, 5, 0, 2),
(111, 2019, 0, 5, 0, 1),
(112, 2019, 5, 0, 628, 2),
(113, 2019, 0, 5, 0, 1),
(114, 2019, 5, 0, 604, 2),
(115, 2019, 0, 5, 0, 1),
(116, 2019, 5, 0, 604, 2),
(117, 2019, 0, 5, 0, 2),
(118, 2019, 5, 0, 580, 1),
(119, 2019, 0, 5, 0, 1),
(120, 2019, 5, 0, 628, 2),
(121, 2019, 5, 0, 653, 1),
(122, 2019, 0, 5, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `date` int(50) NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `date`, `data`) VALUES
(1, 2019, '{\"tUuDmg0-ktG6ZI1tAAAC\":{\"x\":100,\"y\":90,\"angle\":1.8193889336509628,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"3MMPb6jUBI_tHcpVAAAD\"},\"3MMPb6jUBI_tHcpVAAAD\":{\"x\":216.66666666666669,\"y\":90,\"angle\":-3.135395624903257,\"type\":1,\"user_id\":\"2\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":624,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(2, 2019, '{\"tUuDmg0-ktG6ZI1tAAAC\":{\"x\":100,\"y\":90,\"angle\":1.8193889336509628,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"3MMPb6jUBI_tHcpVAAAD\"},\"3MMPb6jUBI_tHcpVAAAD\":{\"x\":216.66666666666669,\"y\":90,\"angle\":-3.135395624903257,\"type\":1,\"user_id\":\"2\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":624,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(3, 2019, '{\"tUuDmg0-ktG6ZI1tAAAC\":{\"x\":100,\"y\":90,\"angle\":1.8193889336509628,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"3MMPb6jUBI_tHcpVAAAD\"},\"3MMPb6jUBI_tHcpVAAAD\":{\"x\":216.66666666666669,\"y\":90,\"angle\":-3.135395624903257,\"type\":1,\"user_id\":\"2\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":624,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(4, 2019, '{\"tUuDmg0-ktG6ZI1tAAAC\":{\"x\":100,\"y\":90,\"angle\":1.8193889336509628,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"3MMPb6jUBI_tHcpVAAAD\"},\"3MMPb6jUBI_tHcpVAAAD\":{\"x\":216.66666666666669,\"y\":90,\"angle\":-3.135395624903257,\"type\":1,\"user_id\":\"2\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":624,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(5, 2019, '{\"tUuDmg0-ktG6ZI1tAAAC\":{\"x\":538.3333333333333,\"y\":681.3333333333334,\"angle\":-0.13054179274124839,\"type\":1,\"user_id\":\"1\",\"kills\":5,\"deaths\":5,\"health\":100,\"damageDelt\":637,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"3MMPb6jUBI_tHcpVAAAD\"},\"m6vtW5-150NyfJlFAAAE\":{\"x\":300,\"y\":300,\"angle\":-0.48018884635304004,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"tUuDmg0-ktG6ZI1tAAAC\"}}'),
(6, 2019, '{\"tUuDmg0-ktG6ZI1tAAAC\":{\"x\":538.3333333333333,\"y\":681.3333333333334,\"angle\":-0.13054179274124839,\"type\":1,\"user_id\":\"1\",\"kills\":5,\"deaths\":5,\"health\":100,\"damageDelt\":637,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"3MMPb6jUBI_tHcpVAAAD\"},\"m6vtW5-150NyfJlFAAAE\":{\"x\":300,\"y\":300,\"angle\":-0.48018884635304004,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"tUuDmg0-ktG6ZI1tAAAC\"}}'),
(7, 2019, '{\"tUuDmg0-ktG6ZI1tAAAC\":{\"x\":538.3333333333333,\"y\":681.3333333333334,\"angle\":-0.13054179274124839,\"type\":1,\"user_id\":\"1\",\"kills\":5,\"deaths\":5,\"health\":100,\"damageDelt\":637,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"3MMPb6jUBI_tHcpVAAAD\"},\"m6vtW5-150NyfJlFAAAE\":{\"x\":300,\"y\":300,\"angle\":-0.48018884635304004,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"tUuDmg0-ktG6ZI1tAAAC\"}}'),
(8, 2019, '{\"tUuDmg0-ktG6ZI1tAAAC\":{\"x\":534.1666666666665,\"y\":686.75,\"angle\":-0.046290551316047125,\"type\":1,\"user_id\":\"1\",\"kills\":5,\"deaths\":5,\"health\":100,\"damageDelt\":637,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"3MMPb6jUBI_tHcpVAAAD\"},\"m6vtW5-150NyfJlFAAAE\":{\"x\":300,\"y\":300,\"angle\":0.1837046699680879,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"tUuDmg0-ktG6ZI1tAAAC\"}}'),
(9, 2019, '{\"tUuDmg0-ktG6ZI1tAAAC\":{\"x\":534.1666666666665,\"y\":686.75,\"angle\":-0.046290551316047125,\"type\":1,\"user_id\":\"1\",\"kills\":5,\"deaths\":5,\"health\":100,\"damageDelt\":637,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"3MMPb6jUBI_tHcpVAAAD\"},\"m6vtW5-150NyfJlFAAAE\":{\"x\":300,\"y\":300,\"angle\":0.1837046699680879,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"tUuDmg0-ktG6ZI1tAAAC\"}}'),
(10, 2019, '{\"gaeCXh8mFOPjKpzIAAAC\":{\"x\":1430.6666666666708,\"y\":698,\"angle\":-3.1152248909484195,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"l0dnQ8koCRQP3PneAAAD\"},\"l0dnQ8koCRQP3PneAAAD\":{\"x\":1088.999999999998,\"y\":698,\"angle\":-0.08409898148951785,\"type\":1,\"user_id\":\"2\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":642,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\"}}'),
(11, 2019, '{\"gaeCXh8mFOPjKpzIAAAC\":{\"x\":1430.6666666666708,\"y\":698,\"angle\":-3.1152248909484195,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"l0dnQ8koCRQP3PneAAAD\"},\"l0dnQ8koCRQP3PneAAAD\":{\"x\":1088.999999999998,\"y\":698,\"angle\":-0.08409898148951785,\"type\":1,\"user_id\":\"2\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":642,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\"}}'),
(12, 2019, '{\"gaeCXh8mFOPjKpzIAAAC\":{\"x\":1430.6666666666708,\"y\":698,\"angle\":-3.1152248909484195,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"l0dnQ8koCRQP3PneAAAD\"},\"l0dnQ8koCRQP3PneAAAD\":{\"x\":1088.999999999998,\"y\":698,\"angle\":-0.08409898148951785,\"type\":1,\"user_id\":\"2\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":642,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\"}}'),
(13, 2019, '{\"gaeCXh8mFOPjKpzIAAAC\":{\"x\":1430.6666666666708,\"y\":698,\"angle\":-3.1152248909484195,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"l0dnQ8koCRQP3PneAAAD\"},\"l0dnQ8koCRQP3PneAAAD\":{\"x\":1088.999999999998,\"y\":698,\"angle\":-0.08409898148951785,\"type\":1,\"user_id\":\"2\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":642,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\"}}'),
(14, 2019, '{\"Zr49oCcTLSonQLnKAAAC\":{\"x\":100,\"y\":90,\"angle\":2.2029238662290496,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"lND_nkcR7jWwaUJyAAAD\"},\"lND_nkcR7jWwaUJyAAAD\":{\"x\":79.16666666666663,\"y\":282.1666666666672,\"angle\":-1.425085959609234,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":0,\"health\":100,\"damageDelt\":636,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(15, 2019, '{\"E0SQLuwCefByPyNRAAAC\":{\"x\":300,\"y\":570,\"angle\":-3.075744663649931,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"d3pq_Lazrs4ooIp0AAAD\"},\"d3pq_Lazrs4ooIp0AAAD\":{\"x\":500.0000000000006,\"y\":570,\"angle\":3.1389240956118605,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":0,\"health\":100,\"damageDelt\":639,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"idle\"}}'),
(16, 2019, '{\"E0SQLuwCefByPyNRAAAC\":{\"x\":100,\"y\":154,\"angle\":3.1260795642531867,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":10,\"health\":100,\"damageDelt\":175,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"d3pq_Lazrs4ooIp0AAAD\"},\"d3pq_Lazrs4ooIp0AAAD\":{\"x\":425.6666666666666,\"y\":275.0833333333334,\"angle\":-2.7760252825912963,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":40,\"damageDelt\":1293,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"E0SQLuwCefByPyNRAAAC\"}}'),
(17, 2019, '{\"pHhqNMrEi9-hDHVwAAAC\":{\"x\":733.3333333333328,\"y\":634,\"angle\":-0.18861530691445905,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":0,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"--gmyL8PpEFk0ub2AAAD\"},\"--gmyL8PpEFk0ub2AAAD\":{\"x\":423.6666666666671,\"y\":506.80555555555577,\"angle\":0.4587698034426058,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":0,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(18, 2019, '{\"DuNeou7bDOfDOUaeAAAC\":{\"x\":300,\"y\":570,\"angle\":-3.00239546407104,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"QxEC9g-_9HY7fEnlAAAD\"},\"QxEC9g-_9HY7fEnlAAAD\":{\"x\":604.1666666666673,\"y\":482.5000000000002,\"angle\":2.874770586247894,\"type\":1,\"user_id\":\"2\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":636,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(19, 2019, '{\"ZWkMpHGWnUfRXRLfAAAC\":{\"x\":100,\"y\":90,\"angle\":2.0801373461776542,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"yu1CYk9poVS_Ghl6AAAD\"},\"yu1CYk9poVS_Ghl6AAAD\":{\"x\":245.8333333333333,\"y\":249.99999999999997,\"angle\":-2.311460730831419,\"type\":1,\"user_id\":\"2\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":120,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(20, 2019, '{\"ZWkMpHGWnUfRXRLfAAAC\":{\"x\":100,\"y\":154,\"angle\":2.2872628600022744,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"yu1CYk9poVS_Ghl6AAAD\"},\"yu1CYk9poVS_Ghl6AAAD\":{\"x\":400.0000000000002,\"y\":154,\"angle\":-3.1039124093293915,\"type\":1,\"user_id\":\"2\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":129,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\"}}'),
(21, 2019, '{\"8Jb_3LxXc3boJkJaAAAE\":{\"x\":299.9999999999998,\"y\":250,\"angle\":-2.7892451209804543,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"WGu_ircP8_PwCtziAAAF\"},\"WGu_ircP8_PwCtziAAAF\":{\"x\":175.0000000000001,\"y\":90,\"angle\":0.922719396365598,\"type\":1,\"user_id\":\"2\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":120,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(22, 2019, '{\"s0yPMOqNQjdD2mHmAAAG\":{\"x\":274.9999999999998,\"y\":154,\"angle\":3.0811578827055146,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"LAcXdhZwfnA3Zi90AAAH\"},\"LAcXdhZwfnA3Zi90AAAH\":{\"x\":62.49999999999999,\"y\":154,\"angle\":-0.03881299844257855,\"type\":1,\"user_id\":\"2\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":120,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"run\"}}'),
(23, 2019, '{\"UxytCUUZ9EmmvdnBAAAI\":{\"x\":266.6666666666665,\"y\":249.99999999999997,\"angle\":2.982642661358649,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"idle\",\"hit_by\":\"XrmvAcmCyC_gC53iAAAJ\"},\"XrmvAcmCyC_gC53iAAAJ\":{\"x\":195.8333333333334,\"y\":90,\"angle\":1.129638749146232,\"type\":1,\"user_id\":\"2\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":120,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(24, 2019, '{\"UxytCUUZ9EmmvdnBAAAI\":{\"x\":100,\"y\":154,\"angle\":2.4291749304354116,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"nOQFIivvTUc3dm5FAAAK\"},\"nOQFIivvTUc3dm5FAAAK\":{\"x\":387.50000000000017,\"y\":154,\"angle\":3.137922605192604,\"type\":1,\"user_id\":\"2\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":120,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\"}}'),
(25, 2019, '{\"0kHJkXHQQM_KfPp7AAAL\":{\"x\":237.49999999999997,\"y\":249.99999999999997,\"angle\":-0.059424722179238006,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"7OmezGivclH5USLgAAAM\"},\"7OmezGivclH5USLgAAAM\":{\"x\":175.0000000000001,\"y\":90,\"angle\":1.235777552263574,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":120,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(26, 2019, '{\"nLFo-sq7z_dNMlniAAAN\":{\"x\":100,\"y\":154,\"angle\":2.002513921585823,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"7LvNqg_umF3JxkQsAAAO\"},\"7LvNqg_umF3JxkQsAAAO\":{\"x\":350,\"y\":154,\"angle\":3.0796251124320304,\"type\":1,\"user_id\":\"2\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":120,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\"}}'),
(27, 2019, '{\"7LvNqg_umF3JxkQsAAAO\":{\"x\":100,\"y\":90,\"angle\":0.8753595850830448,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"yhT66IM6QKF1vMuLAAAP\"},\"yhT66IM6QKF1vMuLAAAP\":{\"x\":266.6666666666665,\"y\":215.41666666666666,\"angle\":-2.473695659946567,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":90,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(28, 2019, '{\"7LvNqg_umF3JxkQsAAAO\":{\"x\":100,\"y\":154,\"angle\":0.7907705393190705,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"M4MTSvYrzBQgxNDjAAAQ\"},\"M4MTSvYrzBQgxNDjAAAQ\":{\"x\":279.1666666666664,\"y\":154,\"angle\":3.1094067058933583,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":90,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"idle\"}}'),
(29, 2019, '{\"7LvNqg_umF3JxkQsAAAO\":{\"x\":100,\"y\":90,\"angle\":0.8753595850830448,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"M4MTSvYrzBQgxNDjAAAQ\"},\"M4MTSvYrzBQgxNDjAAAQ\":{\"x\":345.8333333333333,\"y\":154.58333333333331,\"angle\":-2.8788361272952456,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":129,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(30, 2019, '{\"7LvNqg_umF3JxkQsAAAO\":{\"x\":100,\"y\":154,\"angle\":-0.8123809104068018,\"type\":1,\"user_id\":\"2\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":120,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"M4MTSvYrzBQgxNDjAAAQ\"},\"M4MTSvYrzBQgxNDjAAAQ\":{\"x\":100,\"y\":100,\"angle\":1.8917883478351225,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"7LvNqg_umF3JxkQsAAAO\"}}'),
(31, 2019, '{\"M4MTSvYrzBQgxNDjAAAQ\":{\"x\":100,\"y\":90,\"angle\":2.018180121266356,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"Dbq6hxl14MPYyE1qAAAR\"},\"Dbq6hxl14MPYyE1qAAAR\":{\"x\":233.33333333333331,\"y\":233.33333333333334,\"angle\":2.369067477043439,\"type\":1,\"user_id\":\"2\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":120,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(32, 2019, '{\"l4wAEcU2lpYZ0E_uAAAB\":{\"x\":100,\"y\":90,\"angle\":1.747088156288769,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"YTpv9fLKLig0J38UAAAD\"},\"YTpv9fLKLig0J38UAAAD\":{\"x\":784.8333333333335,\"y\":680.9166666666666,\"angle\":2.428851950574314,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(33, 2019, '{\"l4wAEcU2lpYZ0E_uAAAB\":{\"x\":100,\"y\":154,\"angle\":1.779827374182681,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"YTpv9fLKLig0J38UAAAD\"},\"YTpv9fLKLig0J38UAAAD\":{\"x\":379.1666666666668,\"y\":154,\"angle\":-3.12689128591048,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(34, 2019, '{\"l4wAEcU2lpYZ0E_uAAAB\":{\"x\":100,\"y\":90,\"angle\":1.747088156288769,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"YTpv9fLKLig0J38UAAAD\"},\"YTpv9fLKLig0J38UAAAD\":{\"x\":100,\"y\":90,\"angle\":0.0063090645543613525,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(35, 2019, '{\"ZIeommU7OgZoyLp-AAAE\":{\"x\":100,\"y\":100,\"angle\":-0.18475033229492438,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"b8-3ePQeGilcl871AAAJ\"},\"b8-3ePQeGilcl871AAAJ\":{\"x\":333.33333333333326,\"y\":249.99999999999997,\"angle\":-2.563074353199866,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":120,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(36, 2019, '{\"b8-3ePQeGilcl871AAAJ\":{\"x\":229.16666666666666,\"y\":154,\"angle\":3.0434914721591837,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"Ecbr0gHqqDEYoLQ5AAAK\"},\"Ecbr0gHqqDEYoLQ5AAAK\":{\"x\":491.6666666666673,\"y\":163.16666666666663,\"angle\":-3.0729001283188304,\"type\":1,\"user_id\":\"2\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":120,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(37, 2019, '{\"Ecbr0gHqqDEYoLQ5AAAK\":{\"x\":100,\"y\":90,\"angle\":0.9855287531300413,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"rVWxKevKPtpZcgPdAAAL\"},\"rVWxKevKPtpZcgPdAAAL\":{\"x\":466.6666666666672,\"y\":335.8333333333332,\"angle\":-2.619149110260152,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":75,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(38, 2019, '{\"Ecbr0gHqqDEYoLQ5AAAK\":{\"x\":100,\"y\":154,\"angle\":0.904954951835126,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"O4xoiQ7QbmEdKN07AAAM\"},\"O4xoiQ7QbmEdKN07AAAM\":{\"x\":387.50000000000017,\"y\":154,\"angle\":3.1001625998507016,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":80,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(39, 2019, '{\"Ecbr0gHqqDEYoLQ5AAAK\":{\"x\":100,\"y\":100,\"angle\":0.904954951835126,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"anim\":\"idle\",\"hit_by\":\"SIJXceg1XzW5Bmh0AAAN\"},\"SIJXceg1XzW5Bmh0AAAN\":{\"x\":183.33333333333343,\"y\":90,\"angle\":3.0734578187205575,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":90,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(40, 2019, '{\"Ecbr0gHqqDEYoLQ5AAAK\":{\"x\":100,\"y\":154,\"angle\":0.904954951835126,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"LGyfsk2DiBUGoyswAAAO\"},\"LGyfsk2DiBUGoyswAAAO\":{\"x\":354.1666666666667,\"y\":154,\"angle\":-3.0735792607497423,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(41, 2019, '{\"Ecbr0gHqqDEYoLQ5AAAK\":{\"x\":100,\"y\":90,\"angle\":0.9855287531300413,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"1eJPG7vN54fuoZo4AAAP\"},\"1eJPG7vN54fuoZo4AAAP\":{\"x\":320.8333333333332,\"y\":250,\"angle\":-2.4892013765927206,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(42, 2019, '{\"Ecbr0gHqqDEYoLQ5AAAK\":{\"x\":300,\"y\":300,\"angle\":0.9855287531300413,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"anim\":\"idle\",\"hit_by\":\"OXOsqjTYpBEqxVdKAAAQ\"},\"OXOsqjTYpBEqxVdKAAAQ\":{\"x\":400.0000000000002,\"y\":154,\"angle\":2.132125067739736,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":130,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(43, 2019, '{\"Ecbr0gHqqDEYoLQ5AAAK\":{\"x\":100,\"y\":100,\"angle\":0.9855287531300413,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"anim\":\"idle\",\"hit_by\":\"C322dwB_kZJdfyB_AAAR\"},\"C322dwB_kZJdfyB_AAAR\":{\"x\":279.1666666666664,\"y\":249.99999999999997,\"angle\":-2.354186858222616,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(44, 2019, '{\"Ecbr0gHqqDEYoLQ5AAAK\":{\"x\":100,\"y\":154,\"angle\":0.904954951835126,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"ngO77ZNTGVDDfkTcAAAS\"},\"ngO77ZNTGVDDfkTcAAAS\":{\"x\":324.9999999999999,\"y\":154,\"angle\":-3.124146310110419,\"type\":1,\"user_id\":\"1\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\"}}'),
(45, 2019, '{\"Ecbr0gHqqDEYoLQ5AAAK\":{\"x\":100,\"y\":90,\"angle\":0.9855287531300413,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"i4ofqv2kPZdrSj49AAAT\"},\"i4ofqv2kPZdrSj49AAAT\":{\"x\":274.9999999999998,\"y\":250,\"angle\":-2.3715258069818557,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(46, 2019, '{\"Ecbr0gHqqDEYoLQ5AAAK\":{\"x\":100,\"y\":154,\"angle\":0.904954951835126,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"v3mNSOCVJcsYLGRcAAAU\"},\"v3mNSOCVJcsYLGRcAAAU\":{\"x\":316.6666666666665,\"y\":154,\"angle\":3.1321934525835267,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(47, 2019, '{\"Ecbr0gHqqDEYoLQ5AAAK\":{\"x\":100,\"y\":90,\"angle\":0.9855287531300413,\"type\":1,\"user_id\":\"2\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"ZXjauT95isCv3_teAAAV\"},\"ZXjauT95isCv3_teAAAV\":{\"x\":337.49999999999994,\"y\":250,\"angle\":-2.4783825027900437,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(48, 2019, '{\"ZXjauT95isCv3_teAAAV\":{\"x\":100,\"y\":154,\"angle\":2.6770210744189784,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"6KAXbWMSSz2ur03SAAAW\"},\"6KAXbWMSSz2ur03SAAAW\":{\"x\":62.49999999999999,\"y\":354.5000000000002,\"angle\":1.3484293843436395,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(49, 2019, '{\"6KAXbWMSSz2ur03SAAAW\":{\"x\":100,\"y\":90,\"angle\":1.6503866571300938,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"GUKJFIsjjmm8e0NIAAAX\"},\"GUKJFIsjjmm8e0NIAAAX\":{\"x\":274.9999999999998,\"y\":250,\"angle\":-2.423788709201652,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(50, 2019, '{\"6KAXbWMSSz2ur03SAAAW\":{\"x\":300,\"y\":300,\"angle\":1.6503866571300938,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"anim\":\"idle\",\"hit_by\":\"GUKJFIsjjmm8e0NIAAAX\"},\"GUKJFIsjjmm8e0NIAAAX\":{\"x\":696.9999999999992,\"y\":474,\"angle\":-2.708701485716884,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":133,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(51, 2019, '{\"GUKJFIsjjmm8e0NIAAAX\":{\"x\":100,\"y\":90,\"angle\":2.910606857664027,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"pBIOl5s1UAsOtiGSAAAY\"},\"pBIOl5s1UAsOtiGSAAAY\":{\"x\":291.6666666666664,\"y\":250,\"angle\":-2.425694123448755,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(52, 2019, '{\"GUKJFIsjjmm8e0NIAAAX\":{\"x\":100,\"y\":154,\"angle\":-2.7550456833190533,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"pBIOl5s1UAsOtiGSAAAY\"},\"pBIOl5s1UAsOtiGSAAAY\":{\"x\":62.5,\"y\":484.0555555555556,\"angle\":1.4395991366142709,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":190,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(53, 2019, '{\"pBIOl5s1UAsOtiGSAAAY\":{\"x\":100,\"y\":90,\"angle\":1.0472043515780107,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"c61AF4IRGceTiNQPAAAZ\"},\"c61AF4IRGceTiNQPAAAZ\":{\"x\":308.33333333333314,\"y\":250,\"angle\":-2.4518026712294825,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\"}}'),
(54, 2019, '{\"pBIOl5s1UAsOtiGSAAAY\":{\"x\":100,\"y\":154,\"angle\":0.9691754773365743,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"BGNXu3sY_GDgynDSAAAa\"},\"BGNXu3sY_GDgynDSAAAa\":{\"x\":345.8333333333333,\"y\":154,\"angle\":-3.1308407178200435,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\"}}'),
(55, 2019, '{\"pBIOl5s1UAsOtiGSAAAY\":{\"x\":100,\"y\":90,\"angle\":1.0472043515780107,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"McUpvuauia9onozdAAAb\"},\"McUpvuauia9onozdAAAb\":{\"x\":320.8333333333332,\"y\":131.66666666666663,\"angle\":-2.94576422690297,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(56, 2019, '{\"pBIOl5s1UAsOtiGSAAAY\":{\"x\":100,\"y\":100,\"angle\":1.0472043515780107,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"pnctt1V8gcRicd1xAAAc\"},\"pnctt1V8gcRicd1xAAAc\":{\"x\":500.0000000000007,\"y\":166.63888888888886,\"angle\":-2.9667542058282335,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(57, 2019, '{\"pnctt1V8gcRicd1xAAAc\":{\"x\":241.66666666666663,\"y\":249.99999999999997,\"angle\":-2.5192157681211276,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"fL_o7e3L-6IL4AfzAAAd\"},\"fL_o7e3L-6IL4AfzAAAd\":{\"x\":408.3333333333336,\"y\":233.75,\"angle\":-3.1069771629452396,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(58, 2019, '{\"pnctt1V8gcRicd1xAAAc\":{\"x\":100,\"y\":154,\"angle\":-2.480938153870636,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"fL_o7e3L-6IL4AfzAAAd\"},\"fL_o7e3L-6IL4AfzAAAd\":{\"x\":691.6666666666665,\"y\":156.05555555555532,\"angle\":-3.0811608632014105,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(59, 2019, '{\"pnctt1V8gcRicd1xAAAc\":{\"x\":100,\"y\":90,\"angle\":-3.040910797104907,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"fL_o7e3L-6IL4AfzAAAd\"},\"fL_o7e3L-6IL4AfzAAAd\":{\"x\":545.8333333333345,\"y\":134.58333333333337,\"angle\":-3.0636866052014713,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":120,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(60, 2019, '{\"K3Lpd-l5ctBiH6oRAAAE\":{\"x\":300,\"y\":570,\"angle\":0.059286989838564105,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"Sw6YHExUIetRuyUuAAAF\"},\"Sw6YHExUIetRuyUuAAAF\":{\"x\":629.9999999999992,\"y\":599.6666666666666,\"angle\":-3.110096132012747,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":542,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(61, 2019, '{\"gHSPaaUUdtI4X-fqAAAG\":{\"x\":1300.333333333338,\"y\":698,\"angle\":-0.009947988381473016,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":2,\"health\":100,\"damageDelt\":557,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"gyaMiUesIZIbP3vmAAAH\"},\"gyaMiUesIZIbP3vmAAAH\":{\"x\":100,\"y\":100,\"angle\":-2.9094920890335065,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":1,\"deaths\":5,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"gHSPaaUUdtI4X-fqAAAG\"}}'),
(62, 2019, '{\"RpLZspymBz7XqOuYAAAK\":{\"x\":300,\"y\":570,\"angle\":-0.6900904647264837,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":2,\"deaths\":7,\"health\":100,\"damageDelt\":200,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"idle\",\"hit_by\":\"VQv3jENk5U20X6kEAAAM\"},\"VQv3jENk5U20X6kEAAAM\":{\"x\":734.9999999999994,\"y\":414.02777777777766,\"angle\":2.801703197803231,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":540,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(63, 2019, '{\"RpLZspymBz7XqOuYAAAK\":{\"x\":300,\"y\":378,\"angle\":0.7070344948689182,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"2OKJcLSUlGKKBcNYAAAQ\"},\"2OKJcLSUlGKKBcNYAAAQ\":{\"x\":275.1666666666663,\"y\":665.9166666666666,\"angle\":-1.462855667709071,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":616,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(64, 2019, '{\"cdO9K0q_rOITYWuLAAAA\":{\"x\":300,\"y\":570,\"angle\":-0.2830583587211032,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"F7VTr4E7PSX31bOCAAAB\"},\"F7VTr4E7PSX31bOCAAAB\":{\"x\":547.0000000000016,\"y\":461.2500000000002,\"angle\":-2.7035317621253396,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":651,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(65, 2019, '{\"TnMpL8JtDydWqoo5AAAC\":{\"x\":300,\"y\":570,\"angle\":-0.3194639259118113,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"YCKDTYRu63BiLf_9AAAD\"},\"YCKDTYRu63BiLf_9AAAD\":{\"x\":322.49999999999983,\"y\":363,\"angle\":1.7916197011804258,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":628,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(66, 2019, '{\"TnMpL8JtDydWqoo5AAAC\":{\"x\":100,\"y\":90,\"angle\":0.005789791305982893,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"YCKDTYRu63BiLf_9AAAD\"},\"YCKDTYRu63BiLf_9AAAD\":{\"x\":109.50000000000053,\"y\":423.30555555555554,\"angle\":1.4520798365737884,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":660,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(67, 2019, '{\"fjHqKmabNuuIqmN9AAAB\":{\"x\":609.5,\"y\":698,\"angle\":-0.27314263476041173,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"trEe5d_CciSZNIOnAAAC\"},\"trEe5d_CciSZNIOnAAAC\":{\"x\":450.8333333333326,\"y\":548.0555555555557,\"angle\":0.8244181251016468,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":596,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(68, 2019, '{\"Qo3kZBqhETwP72E4AAAB\":{\"x\":100,\"y\":90,\"angle\":2.131153393274185,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"dVeeqgmc0Kl5wcR-AAAC\"},\"dVeeqgmc0Kl5wcR-AAAC\":{\"x\":62.5,\"y\":336.3333333333333,\"angle\":1.4078872509916707,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":628,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(69, 2019, '{\"iTEE9nVIxE5JJ4u_AAAC\":{\"x\":100,\"y\":249.99999999999997,\"angle\":-0.0289223585087016,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"KCqrtl_AE4IjGOT3AAAD\"},\"KCqrtl_AE4IjGOT3AAAD\":{\"x\":212.50000000000003,\"y\":457.3333333333333,\"angle\":2.0849014806311246,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":582,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(70, 2019, '{\"7GNxA9xZvd3j9liTAAAC\":{\"x\":100,\"y\":90,\"angle\":1.99299468249329,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"uHq-mjf7M9sT6iKdAAAD\"},\"uHq-mjf7M9sT6iKdAAAD\":{\"x\":216.66666666666669,\"y\":250,\"angle\":2.2406269288616336,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":628,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"idle\"}}'),
(71, 2019, '{\"kRP-fNTIpTL0sqOhAAAB\":{\"x\":300,\"y\":570,\"angle\":2.7108570569985178,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"XdRri7oRDlM8FHp4AAAC\"},\"XdRri7oRDlM8FHp4AAAC\":{\"x\":283.33333333333303,\"y\":250,\"angle\":-1.5120602326499064,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":604,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"idle\"}}'),
(72, 2019, '{\"ZuMDrsYc1Y1tEI0OAAAC\":{\"x\":100,\"y\":90,\"angle\":2.0678703251153854,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"XVrNyUPpH_Tlge-XAAAD\"},\"XVrNyUPpH_Tlge-XAAAD\":{\"x\":287.4999999999997,\"y\":151.66666666666666,\"angle\":-2.8189364957417316,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":604,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(73, 2019, '{\"ZwCs30aJDZ6uGqePAAAC\":{\"x\":300,\"y\":570,\"angle\":-0.24043778822647924,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"Zx470K9ndguURWovAAAD\"},\"Zx470K9ndguURWovAAAD\":{\"x\":97.5,\"y\":345.9166666666672,\"angle\":0.7569871548711447,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":580,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(74, 2019, '{\"6abNIVX3Q6yYojjfAAAC\":{\"x\":100,\"y\":90,\"angle\":1.858020871598238,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"1yLKJVZTpVNrPflrAAAD\"},\"1yLKJVZTpVNrPflrAAAD\":{\"x\":304.16666666666646,\"y\":564.3055555555555,\"angle\":2.017478050157038,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":628,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(75, 2019, '{\"6abNIVX3Q6yYojjfAAAC\":{\"x\":233.33333333333326,\"y\":284.3333333333333,\"angle\":-2.33296137663625,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":653,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"1yLKJVZTpVNrPflrAAAD\"},\"1yLKJVZTpVNrPflrAAAD\":{\"x\":100,\"y\":100,\"angle\":-0.0010299739915256344,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"6abNIVX3Q6yYojjfAAAC\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `kills` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `xp` int(11) NOT NULL,
  `damage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `kills`, `deaths`, `xp`, `damage`) VALUES
(1, 'kamil', '$2a$08$xeVmTptcHU5CP9rV9GxvDeQ/nqfQnUzdUIKc4Jk/y0znQiVq5qIYS', 0, 0, 0, 0),
(2, 'darren', '$2a$08$v9ARf6K55q1GGJztJmXkN.mMhRm5xozRuRXf7i2fuUhaT3hwjZ8jC', 0, 0, 0, 0),
(3, 'testest111', '$2a$08$8dBnG.ZzJh.CsAh26LW.f.xmM/LC2D6SPRJM0MneJlmES4numQ4PO', 0, 0, 0, 0),
(4, 'user1', '$2a$08$V7cr3C7CMPgkDQdEcXjbCeUa0sTYpfGl/ueE7xHfZtIxoBD/mclXO', 0, 0, 0, 0);

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
-- Indexes for table `matchdata`
--
ALTER TABLE `matchdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guns`
--
ALTER TABLE `guns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `matchdata`
--
ALTER TABLE `matchdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
