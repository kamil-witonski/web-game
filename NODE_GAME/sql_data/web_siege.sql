-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2019 at 05:19 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

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
  `background` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `maps`
--

INSERT INTO `maps` (`id`, `name`, `tile_map`, `tile_set`, `background`) VALUES
(1, 'level1', '/public/assets/test_map/test_map.json', '/public/assets/test_map/5z1KX.png', '[\"/public/assets/level_1/level1_sky.png\", \"/public/assets/level_1/level1_clouds.png\", \"/public/assets/level_1/level1_backtrees.png\", \"/public/assets/level_1/level1_trees.png\"]\r\n'),
(2, 'level2', '/public/assets/test_map/level2.json', '/public/assets/test_map/5z1KX.png', '[\"/public/assets/level_2/bg.png\", \"/public/assets/level_2/bg_clouds.png\", \"/public/assets/level_2/bg_parallaxFar.png\", \"/public/assets/level_2/bg_parallaxNear.png\"]');

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
(34, 2019, 1, 0, 120, 2);

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
(31, 2019, '{\"M4MTSvYrzBQgxNDjAAAQ\":{\"x\":100,\"y\":90,\"angle\":2.018180121266356,\"type\":1,\"user_id\":\"1\",\"kills\":0,\"deaths\":1,\"health\":100,\"damageDelt\":0,\"dir\":1,\"topOrientY\":-1,\"topOrientX\":1,\"anim\":\"idle\",\"hit_by\":\"Dbq6hxl14MPYyE1qAAAR\"},\"Dbq6hxl14MPYyE1qAAAR\":{\"x\":233.33333333333331,\"y\":233.33333333333334,\"angle\":2.369067477043439,\"type\":1,\"user_id\":\"2\",\"kills\":1,\"deaths\":0,\"health\":100,\"damageDelt\":120,\"dir\":-1,\"topOrientY\":-1,\"topOrientX\":-1,\"anim\":\"fall\"}}');

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
(2, 'darren', '$2a$08$v9ARf6K55q1GGJztJmXkN.mMhRm5xozRuRXf7i2fuUhaT3hwjZ8jC', 0, 0, 0, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
