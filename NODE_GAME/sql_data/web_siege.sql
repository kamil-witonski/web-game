-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2019 at 04:52 PM
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
(4, 'sniper', '', 1, 4500, 50, 100, 1, 'sniper', '/public/assets/guns/sniper.png', 'two_hand', '{\"x\":\"15\",\"y\": \"-5\"}');

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
(122, 2019, 0, 5, 0, 2),
(123, 2019, 0, 5, 0, 1),
(124, 2019, 5, 0, 625, 2),
(125, 2019, 0, 10, 0, 2),
(126, 2019, 5, 0, 572, 1),
(127, 2019, 0, 5, 0, 2),
(128, 2019, 5, 0, 593, 1),
(129, 2019, 0, 5, 0, 2),
(130, 2019, 5, 0, 596, 1),
(131, 2019, 0, 5, 0, 1),
(132, 2019, 5, 0, 628, 2),
(133, 2019, 0, 5, 0, 2),
(134, 2019, 0, 5, 0, 2),
(135, 2019, 5, 0, 601, 1),
(136, 2019, 0, 5, 0, 2),
(137, 2019, 5, 0, 628, 1),
(138, 2019, 0, 5, 0, 1),
(139, 2019, 5, 0, 583, 2),
(140, 2019, 0, 5, 0, 2),
(141, 2019, 5, 0, 596, 1),
(142, 2019, 0, 5, 0, 2),
(143, 2019, 5, 0, 580, 1),
(144, 2019, 0, 5, 0, 1),
(145, 2019, 5, 0, 580, 2),
(146, 2019, 0, 5, 0, 2),
(147, 2019, 5, 0, 580, 1),
(148, 2019, 0, 5, 0, 2),
(149, 2019, 5, 0, 628, 1),
(150, 2019, 0, 5, 25, 2),
(151, 2019, 5, 0, 660, 1),
(152, 2019, 0, 5, 0, 1),
(153, 2019, 5, 0, 564, 2),
(154, 2019, 0, 5, 0, 1),
(155, 2019, 5, 0, 628, 2),
(156, 2019, 0, 5, 0, 1),
(157, 2019, 5, 0, 550, 2),
(158, 2019, 5, 3, 651, 2),
(159, 2019, 3, 5, 340, 1),
(160, 2019, 1, 5, 100, 2),
(161, 2019, 5, 1, 660, 1),
(162, 2019, 0, 5, 0, 1),
(163, 2019, 5, 0, 570, 2),
(164, 2019, 0, 5, 0, 1),
(165, 2019, 5, 0, 584, 2),
(166, 2019, 3, 5, 396, 1),
(167, 2019, 5, 3, 567, 10),
(168, 2019, 0, 5, 0, 2),
(169, 2019, 5, 0, 575, 1),
(170, 2019, 0, 5, 0, 1),
(171, 2019, 5, 0, 560, 2),
(172, 2019, 0, 5, 0, 1),
(173, 2019, 5, 0, 604, 2),
(174, 2019, 0, 5, 0, 1),
(175, 2019, 5, 0, 563, 2),
(176, 2019, 5, 4, 559, 1),
(177, 2019, 2, 1, 253, 11),
(178, 2019, 2, 5, 200, 1),
(179, 2019, 5, 0, 586, 10),
(180, 2019, 4, 5, 430, 11),
(181, 2019, 0, 1, 0, 1),
(182, 2019, 3, 2, 587, 1),
(183, 2019, 5, 4, 767, 12),
(184, 2019, 0, 1, 0, 1),
(185, 2019, 2, 2, 258, 1),
(186, 2019, 3, 4, 384, 11),
(187, 2019, 5, 3, 567, 12),
(188, 2019, 0, 1, 0, 1),
(189, 2019, 3, 3, 746, 1),
(190, 2019, 5, 4, 473, 11),
(191, 2019, 4, 4, 441, 12),
(192, 2019, 0, 2, 0, 1),
(193, 2019, 4, 3, 537, 1),
(194, 2019, 4, 2, 546, 11),
(195, 2019, 5, 6, 562, 12),
(196, 2019, 0, 1, 0, 1),
(197, 2019, 5, 3, 528, 11),
(198, 2019, 3, 2, 624, 1),
(199, 2019, 2, 4, 274, 12),
(200, 2019, 0, 3, 0, 1),
(201, 2019, 5, 2, 558, 12),
(202, 2019, 2, 3, 290, 11),
(203, 2019, 2, 1, 315, 1),
(204, 2019, 0, 4, 0, 1),
(205, 2019, 4, 1, 521, 11),
(206, 2019, 5, 4, 605, 1),
(207, 2019, 0, 1, 0, 12),
(208, 2019, 0, 4, 0, 1),
(209, 2019, 1, 1, 185, 12),
(210, 2019, 5, 1, 576, 11),
(211, 2019, 5, 2, 414, 1),
(212, 2019, 2, 2, 510, 12),
(213, 2019, 1, 4, 120, 11),
(214, 2019, 2, 1, 432, 1),
(215, 2019, 1, 5, 212, 11),
(216, 2019, 5, 2, 405, 12),
(217, 2019, 5, 2, 537, 1),
(218, 2019, 3, 4, 291, 11),
(219, 2019, 1, 3, 249, 12),
(220, 2019, 2, 5, 259, 11),
(221, 2019, 5, 2, 615, 12),
(222, 2019, 3, 4, 556, 11),
(223, 2019, 5, 5, 688, 12),
(224, 2019, 3, 2, 264, 1),
(225, 2019, 5, 2, 793, 1),
(226, 2019, 2, 4, 192, 11),
(227, 2019, 3, 4, 394, 12),
(228, 2019, 1, 1, 100, 11),
(229, 2019, 0, 4, 0, 1),
(230, 2019, 5, 1, 584, 12),
(231, 2019, 1, 3, 100, 11),
(232, 2019, 5, 4, 616, 12),
(233, 2019, 3, 2, 472, 1),
(234, 2019, 3, 7, 300, 11),
(235, 2019, 5, 5, 500, 12),
(236, 2019, 4, 0, 400, 1),
(237, 2019, 2, 2, 200, 11),
(238, 2019, 5, 3, 639, 12),
(239, 2019, 1, 3, 100, 1),
(240, 2019, 1, 5, 153, 11),
(241, 2019, 5, 1, 536, 1),
(242, 2019, 5, 1, 590, 12),
(243, 2019, 1, 5, 168, 11),
(244, 2019, 5, 1, 654, 11),
(245, 2019, 1, 5, 130, 12);

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
(75, 2019, '{\"6abNIVX3Q6yYojjfAAAC\":{\"x\":233.33333333333326,\"y\":284.3333333333333,\"angle\":-2.33296137663625,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":653,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"1yLKJVZTpVNrPflrAAAD\"},\"1yLKJVZTpVNrPflrAAAD\":{\"x\":100,\"y\":100,\"angle\":-0.0010299739915256344,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"6abNIVX3Q6yYojjfAAAC\"}}'),
(76, 2019, '{\"DTf_auJlZg6Q6IaUAAAI\":{\"x\":300,\"y\":570,\"angle\":-0.28798914016033206,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"eqTc7Fwhax6B8vGjAAAJ\"},\"eqTc7Fwhax6B8vGjAAAJ\":{\"x\":516.6666666666674,\"y\":484.1388888888888,\"angle\":-2.7322784611058784,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":625,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(77, 2019, '{\"eqTc7Fwhax6B8vGjAAAJ\":{\"x\":100,\"y\":154,\"angle\":0.402818546285436,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":10,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"d1ZOjUb0gjvz1DzPAAAS\"},\"d1ZOjUb0gjvz1DzPAAAS\":{\"x\":345.8333333333333,\"y\":366.75,\"angle\":2.545700548823616,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":572,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(78, 2019, '{\"eqTc7Fwhax6B8vGjAAAJ\":{\"x\":100,\"y\":90,\"angle\":0.5209382409267224,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"SJv_gdPKdNJWNF5qAAAU\"},\"SJv_gdPKdNJWNF5qAAAU\":{\"x\":286.5,\"y\":553.3333333333334,\"angle\":2.0625729391461185,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":593,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(79, 2019, '{\"wvME6y0RpKm01vn0AAAA\":{\"x\":300,\"y\":570,\"angle\":-0.18866918555509868,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"WMrxtoBQjOCMxTNnAAAB\"},\"WMrxtoBQjOCMxTNnAAAB\":{\"x\":684.9999999999999,\"y\":634,\"angle\":-2.9886115668615516,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":596,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\"}}'),
(80, 2019, '{\"wUNNYPtHQZaFyZttAAAC\":{\"x\":300,\"y\":570,\"angle\":2.7905254427900954,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"idle\",\"hit_by\":\"bJb3P-0LHAegdg4UAAAD\"},\"bJb3P-0LHAegdg4UAAAD\":{\"x\":332.3333333333336,\"y\":359.3888888888889,\"angle\":1.6873408626838533,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":628,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(81, 2019, '{\"q4AKTatGqWv6ynZuAAAC\":{\"x\":300,\"y\":570,\"angle\":0.04123758239058191,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"A-zTHLK5SYM6U5BTAAAD\"},\"A-zTHLK5SYM6U5BTAAAD\":{\"x\":387.5000000000001,\"y\":533.0555555555557,\"angle\":2.746881163069348,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":532,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(82, 2019, '{\"U-PYNZnPleUVoFkyAAAC\":{\"x\":300,\"y\":570,\"angle\":-0.14709651916447747,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"0jLF2Kr1yom7AEmNAAAD\"},\"0jLF2Kr1yom7AEmNAAAD\":{\"x\":485.0000000000006,\"y\":471.77777777777754,\"angle\":-2.759926361379261,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":601,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(83, 2019, '{\"zwqUi7lMKkPW3LUoAAAC\":{\"x\":100,\"y\":90,\"angle\":0.17705276257419206,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"6hfFbuDtdYW5gnroAAAD\"},\"6hfFbuDtdYW5gnroAAAD\":{\"x\":420.83333333333366,\"y\":145,\"angle\":-2.9832672709369987,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":628,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(84, 2019, '{\"224PVCBOSfgkSzWmAAAC\":{\"x\":100,\"y\":90,\"angle\":2.00780371825321,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"JIwGVVCLUbyHuvktAAAD\"},\"JIwGVVCLUbyHuvktAAAD\":{\"x\":274.9999999999998,\"y\":249.99999999999997,\"angle\":2.4789139930217967,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":583,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"idle\"}}'),
(85, 2019, '{\"tRfSmMKPlR7IkDwiAAAC\":{\"x\":300,\"y\":570,\"angle\":-0.22641736159192433,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"93h89rpDIaFZSjpNAAAD\"},\"93h89rpDIaFZSjpNAAAD\":{\"x\":254.1666666666666,\"y\":462.75,\"angle\":1.2214272470482497,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":596,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(86, 2019, '{\"fC1iZE7fiZm6j6EGAAAC\":{\"x\":100,\"y\":90,\"angle\":0.22305822258948485,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"74qXxIwEBzcI9HjCAAAD\"},\"74qXxIwEBzcI9HjCAAAD\":{\"x\":375.0000000000001,\"y\":147.49999999999977,\"angle\":-3.010401012536486,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":580,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(87, 2019, '{\"IrfoZ6riZoIt-lDXAAAC\":{\"x\":100,\"y\":90,\"angle\":-2.586131966069968,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"idle\",\"hit_by\":\"PAbPnafQKgt1ShmAAAAD\"},\"PAbPnafQKgt1ShmAAAAD\":{\"x\":176.66666666666677,\"y\":198.83333333333331,\"angle\":-2.458860384750218,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":580,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(88, 2019, '{\"_KNpFHWLLmR4m8p-AAAC\":{\"x\":300,\"y\":570,\"angle\":0.035215861073838124,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"kfAih_vTR2nRvfkWAAAD\"},\"kfAih_vTR2nRvfkWAAAD\":{\"x\":220.83333333333334,\"y\":474,\"angle\":0.6131124907235255,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":580,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\"}}'),
(89, 2019, '{\"ebn56B90c4IsYUA0AAAC\":{\"x\":300,\"y\":570,\"angle\":0.19223852985767095,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"WYX5vUntI8B_do5MAAAD\"},\"WYX5vUntI8B_do5MAAAD\":{\"x\":466.6666666666672,\"y\":435.9166666666667,\"angle\":2.4856741841661107,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":628,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(90, 2019, '{\"ebn56B90c4IsYUA0AAAC\":{\"x\":100,\"y\":154,\"angle\":0.012160394837192823,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":25,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"WYX5vUntI8B_do5MAAAD\"},\"WYX5vUntI8B_do5MAAAD\":{\"x\":246.49999999999957,\"y\":269.2500000000001,\"angle\":2.5622908008250884,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":75,\"damageDelt\":660,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"ebn56B90c4IsYUA0AAAC\"}}');
INSERT INTO `matches` (`id`, `date`, `data`) VALUES
(91, 2019, '{\"qP_7q5IjJ__Tu0GLAAAC\":{\"x\":100,\"y\":90,\"angle\":2.0674834802776036,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"96qT0vzOXZQCDSo5AAAD\"},\"96qT0vzOXZQCDSo5AAAD\":{\"x\":462.5000000000005,\"y\":302.50000000000017,\"angle\":-2.7354707084268775,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":564,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(92, 2019, '{\"GhopGqeN_NrPA0wlAAAE\":{\"x\":100,\"y\":154,\"angle\":3.0845118711835284,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"z8wTFoI4kcnkPMUrAAAF\"},\"z8wTFoI4kcnkPMUrAAAF\":{\"x\":257.5,\"y\":401.00000000000006,\"angle\":-2.107125255273024,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":628,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(93, 2019, '{\"GhopGqeN_NrPA0wlAAAE\":{\"x\":300,\"y\":300,\"angle\":2.5832590601177445,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"anim\":\"idle\",\"hit_by\":\"z8wTFoI4kcnkPMUrAAAF\"},\"z8wTFoI4kcnkPMUrAAAF\":{\"x\":62.5,\"y\":310.6666666666664,\"angle\":-0.04852481677970755,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":550,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(94, 2019, '{\"z8wTFoI4kcnkPMUrAAAF\":{\"x\":91.6666666666666,\"y\":415.5833333333333,\"angle\":-0.16289443172408913,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":3,\"health\":100,\"damageDelt\":651,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"in9s6BdN6kfZZM1ZAAAG\"},\"in9s6BdN6kfZZM1ZAAAG\":{\"x\":100,\"y\":100,\"angle\":-3.0461993608766007,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":3,\"deaths\":5,\"health\":100,\"damageDelt\":340,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"z8wTFoI4kcnkPMUrAAAF\"}}'),
(95, 2019, '{\"z8wTFoI4kcnkPMUrAAAF\":{\"x\":300,\"y\":570,\"angle\":-0.5497428745827747,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":1,\"deaths\":5,\"health\":100,\"damageDelt\":100,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"in9s6BdN6kfZZM1ZAAAG\"},\"in9s6BdN6kfZZM1ZAAAG\":{\"x\":654.1666666666669,\"y\":587.9166666666667,\"angle\":-3.093392614254423,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":1,\"health\":100,\"damageDelt\":660,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"z8wTFoI4kcnkPMUrAAAF\"}}'),
(96, 2019, '{\"EMHaYCgSClzxEi1xAAAC\":{\"x\":100,\"y\":90,\"angle\":2.0150137657260823,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"rYestvVsZBI_Tus8AAAD\"},\"rYestvVsZBI_Tus8AAAD\":{\"x\":593.333333333334,\"y\":213.05555555555557,\"angle\":-2.9020634684627966,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":570,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(97, 2019, '{\"W3RwME0Jlt2kI0EGAAAC\":{\"x\":300,\"y\":570,\"angle\":0.23911921864749652,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"Wq1gEhXLUN0YLel7AAAD\"},\"Wq1gEhXLUN0YLel7AAAD\":{\"x\":838.9999999999997,\"y\":680.9166666666666,\"angle\":-2.8440220135908314,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":628,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(98, 2019, '{\"Z6O7u_yZzEMqKYZeAAAC\":{\"x\":300,\"y\":570,\"angle\":0.03307399634594691,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"QVs0TItnn5etHyPHAAAD\"},\"QVs0TItnn5etHyPHAAAD\":{\"x\":318.33333333333314,\"y\":358.3055555555556,\"angle\":1.7872417347973448,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":584,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(99, 2019, '{\"uNhltHlJL7YAxy-mAAAC\":{\"x\":100,\"y\":90,\"angle\":0.39636161489505556,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"HmmQgVUu_sCzCdrgAAAD\"},\"HmmQgVUu_sCzCdrgAAAD\":{\"x\":542.5,\"y\":584.5277777777776,\"angle\":2.387734354293949,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":580,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(100, 2019, '{\"uNhltHlJL7YAxy-mAAAC\":{\"x\":300,\"y\":570,\"angle\":-0.1906348354921782,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"HmmQgVUu_sCzCdrgAAAD\"},\"HmmQgVUu_sCzCdrgAAAD\":{\"x\":410.0000000000002,\"y\":393.1388888888889,\"angle\":2.210314319274847,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":651,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(101, 2019, '{\"7EXn075J_DhfEnKaAAAC\":{\"x\":300,\"y\":570,\"angle\":3.139591989370159,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"idle\",\"hit_by\":\"V9KrWb3D41Yf77hWAAAD\"},\"V9KrWb3D41Yf77hWAAAD\":{\"x\":200,\"y\":474.00000000000006,\"angle\":0.8638980080206047,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":584,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\"}}'),
(102, 2019, '{\"6MYK7r-BTXFuvVgLAAAA\":{\"x\":141.66666666666697,\"y\":474,\"angle\":-0.070282887384866,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":3,\"deaths\":5,\"health\":100,\"damageDelt\":396,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"idle\",\"hit_by\":\"wsuKfIXsL-osjeAlAAAB\"},\"wsuKfIXsL-osjeAlAAAB\":{\"x\":388.6666666666662,\"y\":416.8055555555553,\"angle\":-2.945522481910588,\"type\":1,\"user_id\":\"10\",\"username\":\"Hitlerwasright\",\"kills\":5,\"deaths\":3,\"health\":100,\"damageDelt\":567,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"6MYK7r-BTXFuvVgLAAAA\"}}'),
(103, 2019, '{\"2HboMm6Md2Z_dGvzAAAB\":{\"x\":100,\"y\":90,\"angle\":0.19043441671773975,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"UW62MkgnaV8DGcdqAAAC\"},\"UW62MkgnaV8DGcdqAAAC\":{\"x\":147.50000000000017,\"y\":381.75,\"angle\":1.6937848443208225,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":575,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(104, 2019, '{\"NqJQgNgDNMr9l1_sAAAD\":{\"x\":100,\"y\":154,\"angle\":2.3439693414327762,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"lERwNCrcVTGwE6AEAAAE\"},\"lERwNCrcVTGwE6AEAAAE\":{\"x\":687.4999999999999,\"y\":157.30555555555532,\"angle\":-3.130175834939048,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":560,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\"}}'),
(105, 2019, '{\"fkgmy023UfrKSpLiAAAF\":{\"x\":609.5,\"y\":698,\"angle\":-2.4800768630742085,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"rTZ51gleGUaFt1OWAAAG\"},\"rTZ51gleGUaFt1OWAAAG\":{\"x\":609.5,\"y\":698,\"angle\":0.21377616105932645,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":604,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\"}}'),
(106, 2019, '{\"sBfZkdQozbTpf6dkAAAI\":{\"x\":300,\"y\":378,\"angle\":2.5898505462427175,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":5,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"hAlWymIBM90VciqeAAAJ\"},\"hAlWymIBM90VciqeAAAJ\":{\"x\":679.1666666666666,\"y\":360.2499999999998,\"angle\":2.987736284075648,\"type\":1,\"user_id\":\"2\",\"username\":\"darren\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":563,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(107, 2019, '{\"dtd8d5e1fPurYDMHAAAB\":{\"x\":1218.166666666667,\"y\":698,\"angle\":-0.17875266576531004,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":4,\"health\":100,\"damageDelt\":559,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"6uS2DCLpaqDrQoOOAAAD\"},\"6uS2DCLpaqDrQoOOAAAD\":{\"x\":1676.5000000000086,\"y\":573.5555555555553,\"angle\":-2.976313946955215,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":2,\"deaths\":1,\"health\":100,\"damageDelt\":253,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"dtd8d5e1fPurYDMHAAAB\"}}'),
(108, 2019, '{\"q89sgHdxvCeBjdhrAAAG\":{\"x\":100,\"y\":100,\"angle\":-2.177869297954604,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":2,\"deaths\":5,\"health\":100,\"damageDelt\":200,\"dir\":1,\"anim\":\"idle\",\"hit_by\":\"Ndpp419kWcKztP4zAAAI\"},\"Ndpp419kWcKztP4zAAAI\":{\"x\":333.9999999999995,\"y\":154,\"angle\":2.969324949721278,\"type\":1,\"user_id\":\"10\",\"username\":\"Hitlerwasright\",\"kills\":5,\"deaths\":0,\"health\":100,\"damageDelt\":586,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"idle\"}}'),
(109, 2019, '{\"Vc8s3VVkSoSg0Z4DAAAD\":{\"x\":879.1666666666648,\"y\":698,\"angle\":-3.0992005276297947,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":4,\"deaths\":5,\"health\":100,\"damageDelt\":430,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"V4gaSuaJ-esejb4oAAAG\"},\"m6AcDlmhQXM561cgAAAE\":{\"x\":100,\"y\":100,\"angle\":-0.43308699054142996,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":1,\"health\":7,\"damageDelt\":0,\"dir\":1,\"anim\":\"idle\",\"hit_by\":\"Q7D5kPsCwbX36u0zAAAF\"},\"Q7D5kPsCwbX36u0zAAAF\":{\"x\":146.9999999999995,\"y\":698,\"angle\":0.021549118930566956,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":3,\"deaths\":2,\"health\":4,\"damageDelt\":587,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"run\",\"hit_by\":\"Vc8s3VVkSoSg0Z4DAAAD\"},\"V4gaSuaJ-esejb4oAAAG\":{\"x\":1347.333333333336,\"y\":698,\"angle\":-3.1275622113648036,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":5,\"deaths\":4,\"health\":50,\"damageDelt\":767,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"Q7D5kPsCwbX36u0zAAAF\"}}'),
(110, 2019, '{\"m6AcDlmhQXM561cgAAAE\":{\"x\":100,\"y\":100,\"angle\":-0.43308699054142996,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"anim\":\"idle\",\"hit_by\":\"8nB3kRO57Ygp0-SrAAAI\"},\"HXuSzeEjSvymI3yrAAAH\":{\"x\":439.66666666666634,\"y\":637.1666666666667,\"angle\":0.6891880193988583,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":2,\"deaths\":2,\"health\":100,\"damageDelt\":258,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"c6vT90yPDAhzBL1NAAAJ\"},\"8nB3kRO57Ygp0-SrAAAI\":{\"x\":741.6666666666661,\"y\":159.58333333333331,\"angle\":2.449520630587815,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":3,\"deaths\":4,\"health\":100,\"damageDelt\":384,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"c6vT90yPDAhzBL1NAAAJ\"},\"c6vT90yPDAhzBL1NAAAJ\":{\"x\":467.8333333333332,\"y\":698,\"angle\":-1.7026725713931201,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":5,\"deaths\":3,\"health\":67,\"damageDelt\":567,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"8nB3kRO57Ygp0-SrAAAI\"}}'),
(111, 2019, '{\"m6AcDlmhQXM561cgAAAE\":{\"x\":100,\"y\":100,\"angle\":-0.43308699054142996,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":1,\"health\":9,\"damageDelt\":0,\"dir\":1,\"anim\":\"idle\",\"hit_by\":\"-KmXEJfSd_RBFBJDAAAM\"},\"HzpONq2LVyx9-dscAAAK\":{\"x\":969.6666666666669,\"y\":692.5833333333334,\"angle\":-2.963671785030369,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":5,\"deaths\":4,\"health\":4,\"damageDelt\":473,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"-KmXEJfSd_RBFBJDAAAM\"},\"GjXelud5EJ64dHK3AAAL\":{\"x\":559.5000000000005,\"y\":630.2222222222222,\"angle\":-0.005660670870149293,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":4,\"deaths\":4,\"health\":100,\"damageDelt\":441,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"HzpONq2LVyx9-dscAAAK\"},\"-KmXEJfSd_RBFBJDAAAM\":{\"x\":220.8333333333333,\"y\":90,\"angle\":0.6605799410029513,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":3,\"deaths\":3,\"health\":100,\"damageDelt\":746,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"GjXelud5EJ64dHK3AAAL\"}}'),
(112, 2019, '{\"m6AcDlmhQXM561cgAAAE\":{\"x\":100,\"y\":100,\"angle\":-0.43308699054142996,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":2,\"health\":100,\"damageDelt\":0,\"dir\":1,\"anim\":\"idle\",\"hit_by\":\"8p0JEiBxpxMiaKEtAAAP\"},\"AT9YMDndZFUMm1KBAAAN\":{\"x\":194.99999999999991,\"y\":627.1666666666666,\"angle\":0.2837273999773515,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":4,\"deaths\":3,\"health\":1,\"damageDelt\":537,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"nWffDF-fQitPDIAHAAAO\"},\"nWffDF-fQitPDIAHAAAO\":{\"x\":441.66666666666725,\"y\":368.47222222222223,\"angle\":-0.0940951109899841,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":4,\"deaths\":2,\"health\":100,\"damageDelt\":546,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"AT9YMDndZFUMm1KBAAAN\"},\"8p0JEiBxpxMiaKEtAAAP\":{\"x\":100,\"y\":100,\"angle\":-2.9639555882762014,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":5,\"deaths\":6,\"health\":100,\"damageDelt\":562,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"AT9YMDndZFUMm1KBAAAN\"}}'),
(113, 2019, '{\"m6AcDlmhQXM561cgAAAE\":{\"x\":100,\"y\":100,\"angle\":-0.43308699054142996,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":1,\"health\":17,\"damageDelt\":0,\"dir\":1,\"anim\":\"idle\",\"hit_by\":\"bZMMHjA-dBSg9pslAAAQ\"},\"bZMMHjA-dBSg9pslAAAQ\":{\"x\":366.66666666666674,\"y\":130.5555555555555,\"angle\":1.065157848074284,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":5,\"deaths\":3,\"health\":100,\"damageDelt\":528,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"JptwWnQkV0j_ETCBAAAR\"},\"JptwWnQkV0j_ETCBAAAR\":{\"x\":487.50000000000085,\"y\":399.55555555555554,\"angle\":0.20040027461519375,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":3,\"deaths\":2,\"health\":100,\"damageDelt\":624,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"bZMMHjA-dBSg9pslAAAQ\"},\"GXZxhQg7-yz39lAwAAAS\":{\"x\":1001.8333333333333,\"y\":404.3055555555553,\"angle\":2.8474903500773303,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":2,\"deaths\":4,\"health\":100,\"damageDelt\":274,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"bZMMHjA-dBSg9pslAAAQ\"}}'),
(114, 2019, '{\"m6AcDlmhQXM561cgAAAE\":{\"x\":300,\"y\":300,\"angle\":-0.43308699054142996,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":3,\"health\":1,\"damageDelt\":0,\"dir\":1,\"anim\":\"idle\",\"hit_by\":\"gCpkhegA5CBJKwIXAAAV\"},\"Fxgc894ZWV_ckHhoAAAT\":{\"x\":181.6666666666659,\"y\":585.4999999999998,\"angle\":2.2492020610587518,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":5,\"deaths\":2,\"health\":100,\"damageDelt\":558,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"Wx7q2rPV3rZcCnK7AAAU\"},\"Wx7q2rPV3rZcCnK7AAAU\":{\"x\":808.3333333333321,\"y\":146.02777777777766,\"angle\":2.833433092271118,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":2,\"deaths\":3,\"health\":100,\"damageDelt\":290,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"gCpkhegA5CBJKwIXAAAV\"},\"gCpkhegA5CBJKwIXAAAV\":{\"x\":300,\"y\":300,\"angle\":0.33874924669898565,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":2,\"deaths\":1,\"health\":100,\"damageDelt\":315,\"dir\":-1,\"anim\":\"fall\",\"hit_by\":\"Fxgc894ZWV_ckHhoAAAT\"}}'),
(115, 2019, '{\"m6AcDlmhQXM561cgAAAE\":{\"x\":100,\"y\":100,\"angle\":-0.43308699054142996,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":4,\"health\":100,\"damageDelt\":0,\"dir\":1,\"anim\":\"idle\",\"hit_by\":\"9CUwNvB7N6ijOxCEAAAX\"},\"WK9HrBPdSwpQPrSzAAAW\":{\"x\":667.8333333333328,\"y\":485.4999999999999,\"angle\":-2.6178049298814785,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":4,\"deaths\":1,\"health\":40,\"damageDelt\":521,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"9CUwNvB7N6ijOxCEAAAX\"},\"9CUwNvB7N6ijOxCEAAAX\":{\"x\":470.8333333333339,\"y\":344.1666666666665,\"angle\":-2.5886363532213084,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":4,\"health\":100,\"damageDelt\":605,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"WK9HrBPdSwpQPrSzAAAW\"},\"6gKpT4aDzFMynpEdAAAY\":{\"x\":345.83333333333354,\"y\":379.9999999999998,\"angle\":2.4839608658925605,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":0,\"deaths\":1,\"health\":70,\"damageDelt\":0,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"9CUwNvB7N6ijOxCEAAAX\"}}'),
(116, 2019, '{\"m6AcDlmhQXM561cgAAAE\":{\"x\":100,\"y\":100,\"angle\":-0.43308699054142996,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":4,\"health\":100,\"damageDelt\":0,\"dir\":1,\"anim\":\"idle\",\"hit_by\":\"MM0kDa1zsYs4dNTyAAAZ\"},\"MM0kDa1zsYs4dNTyAAAZ\":{\"x\":576.166666666667,\"y\":377.1944444444448,\"angle\":0.5644059508364168,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":5,\"deaths\":1,\"health\":15,\"damageDelt\":576,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"GwGB0Mow11ObGGrvAAAa\"},\"GwGB0Mow11ObGGrvAAAa\":{\"x\":968.6666666666677,\"y\":177.111111111111,\"angle\":2.9417722598581304,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":1,\"deaths\":1,\"health\":100,\"damageDelt\":185,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"MM0kDa1zsYs4dNTyAAAZ\"}}'),
(117, 2019, '{\"pArEDBZf7RfL93w0AAAb\":{\"x\":129.16666666666669,\"y\":698,\"angle\":0.11870101301971528,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":2,\"health\":1,\"damageDelt\":414,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"run\",\"hit_by\":\"0-f7gRghucRBLgQYAAAc\"},\"0-f7gRghucRBLgQYAAAc\":{\"x\":62.49999999999999,\"y\":90,\"angle\":-0.41741809266593755,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":2,\"deaths\":2,\"health\":100,\"damageDelt\":510,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"run\",\"hit_by\":\"pArEDBZf7RfL93w0AAAb\"},\"96cC06d6DvvbA9VIAAAd\":{\"x\":642.833333333333,\"y\":612.0277777777777,\"angle\":-2.565498209153262,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":1,\"deaths\":4,\"health\":100,\"damageDelt\":120,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"pArEDBZf7RfL93w0AAAb\"}}'),
(118, 2019, '{\"Wtq4eL5FNKij08FiAAAe\":{\"x\":257.5,\"y\":476.0555555555553,\"angle\":3.1359102508352548,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":2,\"deaths\":1,\"health\":100,\"damageDelt\":432,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"gyqvCV_AEIh2HDJ5AAAg\"},\"a7Csq4UYdyyF5VHuAAAf\":{\"x\":79.16666666666703,\"y\":435.1666666666666,\"angle\":-0.9070751289024772,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":1,\"deaths\":5,\"health\":100,\"damageDelt\":212,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"gyqvCV_AEIh2HDJ5AAAg\"},\"gyqvCV_AEIh2HDJ5AAAg\":{\"x\":559.5000000000005,\"y\":476.08333333333337,\"angle\":-3.1345741522499684,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":5,\"deaths\":2,\"health\":1,\"damageDelt\":405,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"a7Csq4UYdyyF5VHuAAAf\"}}'),
(119, 2019, '{\"YDCIXEm9PT5OCp0CAAAh\":{\"x\":344.8333333333336,\"y\":535.8333333333333,\"angle\":0.40080135259153277,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":2,\"health\":67,\"damageDelt\":537,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"0WfAnNHZsVAW9XSpAAAi\"},\"0WfAnNHZsVAW9XSpAAAi\":{\"x\":897.3333333333325,\"y\":698,\"angle\":-2.7945874232132497,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":3,\"deaths\":4,\"health\":100,\"damageDelt\":291,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"YDCIXEm9PT5OCp0CAAAh\"},\"JdR9VS_9izjn4YYXAAAj\":{\"x\":291.6666666666666,\"y\":698,\"angle\":1.6242115343540622,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":1,\"deaths\":3,\"health\":100,\"damageDelt\":249,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"run\",\"hit_by\":\"0WfAnNHZsVAW9XSpAAAi\"}}'),
(120, 2019, '{\"vdIndIVzYDSOPIuCAAAk\":{\"x\":817.8333333333314,\"y\":413.75,\"angle\":-0.5806903940873749,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":2,\"deaths\":5,\"health\":100,\"damageDelt\":259,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"UWGgvzr16N7RFKVdAAAl\"},\"UWGgvzr16N7RFKVdAAAl\":{\"x\":862.5,\"y\":388.1111111111108,\"angle\":-2.4342551695671113,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":5,\"deaths\":2,\"health\":67,\"damageDelt\":615,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"vdIndIVzYDSOPIuCAAAk\"}}'),
(121, 2019, '{\"9OxB1TEBo_6GLYRPAAAm\":{\"x\":401.66666666666686,\"y\":530.3888888888889,\"angle\":-1.7141302633626867,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":3,\"deaths\":4,\"health\":67,\"damageDelt\":556,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"bnoCK_CEp4F5Bol7AAAn\"},\"bnoCK_CEp4F5Bol7AAAn\":{\"x\":295.8333333333331,\"y\":154.44444444444437,\"angle\":0.37630423059920065,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":5,\"deaths\":5,\"health\":67,\"damageDelt\":688,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"9OxB1TEBo_6GLYRPAAAm\"},\"SJ3cnoShpdwoRdZqAAAo\":{\"x\":300,\"y\":300,\"angle\":0.09073180237484496,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":3,\"deaths\":2,\"health\":100,\"damageDelt\":264,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"bnoCK_CEp4F5Bol7AAAn\"}}'),
(122, 2019, '{\"B_L66jvMGwJ7n2XvAAAp\":{\"x\":1448.1666666666533,\"y\":362.4166666666665,\"angle\":2.3863695075630775,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":2,\"health\":34,\"damageDelt\":793,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"Eabb7xXn6SoQAo_5AAAr\"},\"_BxZANaATJvXcYmAAAAq\":{\"x\":1278.5000000000023,\"y\":186,\"angle\":-0.7252411616081359,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":2,\"deaths\":4,\"health\":100,\"damageDelt\":192,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"run\",\"hit_by\":\"B_L66jvMGwJ7n2XvAAAp\"},\"Eabb7xXn6SoQAo_5AAAr\":{\"x\":370.8333333333334,\"y\":154,\"angle\":-3.123700423480899,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":3,\"deaths\":4,\"health\":100,\"damageDelt\":394,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"B_L66jvMGwJ7n2XvAAAp\"}}'),
(123, 2019, '{\"jmaGvKZ2lkA3C-6VAAAs\":{\"x\":370.83333333333354,\"y\":307.6388888888889,\"angle\":-0.20729791845640594,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":1,\"deaths\":1,\"health\":100,\"damageDelt\":100,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"ug6DNl7f8jG-GogZAAAu\"},\"_k9YLIctotGrXuDuAAAt\":{\"x\":420.8333333333339,\"y\":570,\"angle\":0.24414310874785947,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":0,\"deaths\":4,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"ug6DNl7f8jG-GogZAAAu\"},\"ug6DNl7f8jG-GogZAAAu\":{\"x\":974.9999999999975,\"y\":680.0833333333334,\"angle\":-2.997033672880295,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":5,\"deaths\":1,\"health\":100,\"damageDelt\":584,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"jmaGvKZ2lkA3C-6VAAAs\"}}'),
(124, 2019, '{\"UVBpseUeoYxMCVyIAAAv\":{\"x\":653.9999999999953,\"y\":188.4999999999997,\"angle\":-2.566499053051869,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":1,\"deaths\":3,\"health\":70,\"damageDelt\":100,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"l6xWcOaJ5KoGgxC2AAAx\"},\"Ir4RNgt7RCDJyDouAAAw\":{\"x\":333.3333333333335,\"y\":562.1388888888888,\"angle\":0.2532926644074822,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":5,\"deaths\":4,\"health\":10,\"damageDelt\":616,\"dir\":1,\"topOrientY\":1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"l6xWcOaJ5KoGgxC2AAAx\"},\"l6xWcOaJ5KoGgxC2AAAx\":{\"x\":100,\"y\":100,\"angle\":-2.866528799429237,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":3,\"deaths\":2,\"health\":100,\"damageDelt\":472,\"hit_by\":\"Ir4RNgt7RCDJyDouAAAw\",\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\"}}'),
(125, 2019, '{\"AtQBMXTGBfV5JYh7AAAy\":{\"x\":409.4999999999996,\"y\":507.9999999999998,\"angle\":-2.305446799683666,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":3,\"deaths\":7,\"health\":100,\"damageDelt\":300,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"T3G1pwMToKZXFS0RAAAz\"},\"T3G1pwMToKZXFS0RAAAz\":{\"x\":341.66666666666686,\"y\":570,\"angle\":0.3434149484773634,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":5,\"deaths\":5,\"health\":100,\"damageDelt\":500,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"run\",\"hit_by\":\"AtQBMXTGBfV5JYh7AAAy\"},\"n3uXcihw-miR5BekAAA0\":{\"x\":793.166666666667,\"y\":666.6111111111111,\"angle\":2.6534814635384434,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":4,\"deaths\":0,\"health\":100,\"damageDelt\":400,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\"}}'),
(126, 2019, '{\"rjbXtaCj4pqvQNu1AAA1\":{\"x\":204.16666666666666,\"y\":154,\"angle\":2.8832393350369028,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":2,\"deaths\":2,\"health\":67,\"damageDelt\":200,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"AtriYRCdC9tUbmoNAAA2\"},\"AtriYRCdC9tUbmoNAAA2\":{\"x\":62.49999999999999,\"y\":506,\"angle\":1.4243759988682234,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":5,\"deaths\":3,\"health\":100,\"damageDelt\":639,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"idle\",\"hit_by\":\"aD5aZNqx2J25e4t_AAA3\"},\"aD5aZNqx2J25e4t_AAA3\":{\"x\":300,\"y\":300,\"angle\":-0.28599316788163714,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":1,\"deaths\":3,\"health\":100,\"damageDelt\":100,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"idle\",\"hit_by\":\"AtriYRCdC9tUbmoNAAA2\"}}'),
(127, 2019, '{\"nbp2FKw96aaN_HQDAAA4\":{\"x\":772.3333333333336,\"y\":692.5833333333334,\"angle\":-2.3521270578187217,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":1,\"deaths\":5,\"health\":100,\"damageDelt\":153,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"xDIgZA4TU0e5mW97AAA5\"},\"xDIgZA4TU0e5mW97AAA5\":{\"x\":447.0000000000009,\"y\":422.36111111111103,\"angle\":-0.5710269942137889,\"type\":1,\"user_id\":\"1\",\"username\":\"kamil\",\"kills\":5,\"deaths\":1,\"health\":67,\"damageDelt\":536,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"nbp2FKw96aaN_HQDAAA4\"}}'),
(128, 2019, '{\"41tqDuBH07H1yr-uAAA6\":{\"x\":720.8333333333329,\"y\":167.6388888888889,\"angle\":2.7431479866294017,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":5,\"deaths\":1,\"health\":50,\"damageDelt\":590,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"fall\",\"hit_by\":\"f8oFpwt2CJ8jDryPAAA7\"},\"f8oFpwt2CJ8jDryPAAA7\":{\"x\":345.83333333333354,\"y\":294.0833333333336,\"angle\":0.48015509802124695,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":1,\"deaths\":5,\"health\":100,\"damageDelt\":168,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"fall\",\"hit_by\":\"41tqDuBH07H1yr-uAAA6\"}}'),
(129, 2019, '{\"xT-n3b_WFYjzQzG3AAA8\":{\"x\":300,\"y\":570,\"angle\":-0.2355027663814244,\"type\":1,\"user_id\":\"11\",\"username\":\"Griffiola\",\"kills\":5,\"deaths\":1,\"health\":100,\"damageDelt\":654,\"dir\":-1,\"topOrientY\":1,\"topOrientX\":-1,\"anim\":\"idle\",\"hit_by\":\"RmVUZcCxvy2PIXR2AAA9\"},\"RmVUZcCxvy2PIXR2AAA9\":{\"x\":504.1666666666676,\"y\":570,\"angle\":3.0705544547022385,\"type\":1,\"user_id\":\"12\",\"username\":\"Kamil_should_Pass\",\"kills\":1,\"deaths\":5,\"health\":100,\"damageDelt\":130,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"run\",\"hit_by\":\"xT-n3b_WFYjzQzG3AAA8\"}}');

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
(1, 'kamil', '$2a$08$xeVmTptcHU5CP9rV9GxvDeQ/nqfQnUzdUIKc4Jk/y0znQiVq5qIYS', 38, 6, 0, 0),
(2, 'darren', '$2a$08$v9ARf6K55q1GGJztJmXkN.mMhRm5xozRuRXf7i2fuUhaT3hwjZ8jC', 20, 0, 0, 0),
(3, 'testest111', '$2a$08$8dBnG.ZzJh.CsAh26LW.f.xmM/LC2D6SPRJM0MneJlmES4numQ4PO', 0, 0, 0, 0),
(4, 'user1', '$2a$08$V7cr3C7CMPgkDQdEcXjbCeUa0sTYpfGl/ueE7xHfZtIxoBD/mclXO', 0, 0, 0, 0),
(5, 'dasdasd', '$2a$08$swWShBaDbShczgXTSuJ06ubHTCTD94fLLpJG46v9wnyx6OeXSFEPq', 0, 0, 0, 0),
(6, '1234', '$2a$08$PYZXD2La72BH03oL2ZeDPeqSV/ULhEBqyzURag3oId3xDr9QIvnoW', 0, 0, 0, 0),
(7, '12344', '$2a$08$zF9vldHxcz34i6emJCHxHe4LRKNSW0l898KX5Eb7V0JiAzmg9WDbe', 0, 0, 0, 0),
(8, '123456', '$2a$08$zFkXbKuneihJiQrcMzwaoOco0t4yy7zk5ydbMEnQFYDoJkzu2Xnqu', 0, 0, 0, 0),
(9, 'dudeman', '$2a$08$58Xzx7GX./Izy.sASrp0Du08wOqSTVpT7EturseZ2G8QX.1ut.9Fi', 0, 0, 0, 0),
(10, 'Hitlerwasright', '$2a$08$rH6NC5zczSlUk1JzAXHanurVb/SVzUZ2lhBUDmq3qg3BFh9zW0k2e', 0, 0, 0, 0),
(11, 'Griffiola', '$2a$08$KWTUh7ARZuf2ur02nBBflOV.zum/e8KzpTtkAH5eBFgK5GzeYsO6m', 0, 0, 0, 0),
(12, 'Kamil_should_Pass', '$2a$08$qBCOurSP/8yXbnBq/czzNeCoAM8JGGEn443tkVbg9w2JkfZ6hIwfG', 0, 0, 0, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
