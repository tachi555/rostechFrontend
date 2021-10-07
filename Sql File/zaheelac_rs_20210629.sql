-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 29, 2021 at 11:12 AM
-- Server version: 10.2.38-MariaDB-log-cll-lve
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zaheelac_rs`
--
DROP DATABASE IF EXISTS `zaheelac_rs`;
CREATE DATABASE IF NOT EXISTS `zaheelac_rs` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `zaheelac_rs`;

-- --------------------------------------------------------

--
-- Table structure for table `harga`
--

DROP TABLE IF EXISTS `harga`;
CREATE TABLE `harga` (
  `id` int(11) NOT NULL,
  `mid` int(15) NOT NULL,
  `tid` int(15) NOT NULL,
  `tanggal` varchar(25) NOT NULL,
  `persatuan` int(15) NOT NULL,
  `jumlah` int(15) NOT NULL,
  `total` int(15) NOT NULL,
  `ket` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `harga`
--

INSERT INTO `harga` (`id`, `mid`, `tid`, `tanggal`, `persatuan`, `jumlah`, `total`, `ket`) VALUES
(55, 19, 9, '2021-06-28T06:43:31.698Z', 333, 333, 333, '');

-- --------------------------------------------------------

--
-- Table structure for table `iip`
--

DROP TABLE IF EXISTS `iip`;
CREATE TABLE `iip` (
  `id` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL,
  `tanggal` date NOT NULL,
  `token` varchar(126) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `iip`
--

INSERT INTO `iip` (`id`, `ip`, `status`, `tanggal`, `token`) VALUES
(1, '54.169.128.87', 'nonaktif', '2021-06-01', 'asdf213asfd'),
(2, '54.169.128.87', 'nonaktif', '2021-06-23', 'feaff14231ew'),
(4, '54.169.128.87', 'nonaktif', '2021-06-24', '03a06b1d5e0dad4c30414f43ca535806'),
(5, '54.169.128.87', 'nonaktif', '2021-06-24', 'c3f65729396eef8c8cd4817cfea17922'),
(6, '54.169.128.87', 'nonaktif', '2021-06-24', '2d60c15050e3636a24366545c354b2cc'),
(7, '54.169.128.87', 'nonaktif', '2021-06-24', 'ae23f3d6bc9cce4381f52e5ebb93a79e'),
(8, '54.169.128.87', 'nonaktif', '2021-06-24', 'd1712cc1a21b338fbc393da29d3c0f63'),
(9, '54.169.128.87', 'nonaktif', '2021-06-24', '0a213e8134932768ac9d77133d66b500'),
(10, '54.169.128.87', 'nonaktif', '2021-06-24', '4f26a1b389822cffbae12cff0013214d'),
(11, '54.169.128.87', 'nonaktif', '2021-06-24', 'acff08c963dcd924c4a1788f2ee9b10f'),
(12, '54.169.128.87', 'nonaktif', '2021-06-24', '089e27e399bdcf08802be8774ff2752f'),
(13, '54.169.128.87', 'nonaktif', '2021-06-24', '14d6da170e4fc74622f116abce5212ea'),
(14, '54.169.128.87', 'nonaktif', '2021-06-24', 'e8cdf026cdd30373c45a29d59df96740'),
(15, '54.169.128.87', 'nonaktif', '2021-06-24', 'f3a694bc617124000afb2bd50575b03d'),
(16, '54.169.128.87', 'nonaktif', '2021-06-24', 'f7ed77234e7aa88cfaed29c96ff0b2e5'),
(17, '54.169.128.87', 'nonaktif', '2021-06-24', '526509322742f52d98fddd4653384b16'),
(18, '54.169.128.87', 'nonaktif', '2021-06-24', 'c5ee89814c37ea87fe54876f4613621d'),
(19, '54.169.128.87', 'nonaktif', '2021-06-24', 'd98be13a2709a3e7863c4ee79bc9ca52'),
(20, '54.169.128.87', 'nonaktif', '2021-06-24', '39a4f397c872998b2cc079766e225ba9'),
(21, '54.169.128.87', 'nonaktif', '2021-06-24', '9de0ad7ee6061f1784fa431c66e8ea25'),
(22, '54.169.128.87', 'nonaktif', '2021-06-24', 'f763c21f0c2176bc97b4de632aa3d925'),
(23, '54.169.128.87', 'nonaktif', '2021-06-24', 'c5f781e28893675295f782b3f6b1fbd0'),
(24, '54.169.128.87', 'nonaktif', '2021-06-24', '6b39df5f178e28db7cb397ecb1256d79'),
(25, '54.169.128.87', 'nonaktif', '2021-06-24', 'f26afe7820eb360fb6ee50af4094a530'),
(26, '54.169.128.87', 'nonaktif', '2021-06-24', '806f111618e184cbd2814dc8da0b89b0'),
(27, '54.169.128.87', 'nonaktif', '2021-06-24', 'e794da17340d7b64d4813e48649c8c1b'),
(28, '54.169.128.87', 'nonaktif', '2021-06-24', '1c5d39ffc8334d307f1296d34f3ab82a'),
(29, '54.169.128.87', 'nonaktif', '2021-06-24', '6cd97ddf7e78d1ca9308586a3b58d9c7'),
(30, '54.169.128.87', 'nonaktif', '2021-06-24', 'ab7a6581b76e5bde1bae5c1405c33477'),
(31, '54.169.128.87', 'nonaktif', '2021-06-24', 'ff430f49e0c55b5fc1a6283826202a4f'),
(32, '54.169.128.87', 'nonaktif', '2021-06-24', '8a32a3e9fb63bf5f740e90e272af40fe'),
(33, '54.169.128.87', 'nonaktif', '2021-06-24', '1b55530e0608972762c15cfb97134767'),
(34, '54.169.128.87', 'nonaktif', '2021-06-24', 'd476bcf0b87cadc8ccee04120b792215'),
(35, '54.169.128.87', 'nonaktif', '2021-06-24', '4d4f6a4b381e7d8ddeb3b3a0a99f0749'),
(36, '54.169.128.87', 'nonaktif', '2021-06-24', '3a40b550efe4d291bf1d4012e1650c8f'),
(37, '54.169.128.87', 'nonaktif', '2021-06-24', '3c8f9ab88266c215e87268e71fcb9230'),
(38, '54.169.128.87', 'nonaktif', '2021-06-24', 'e534123c14c3ec0f8926cbfc319b130a'),
(39, '54.169.128.87', 'nonaktif', '2021-06-24', 'dc0c6b4c8a94090c8e3142d7924afb1e'),
(40, '54.169.128.87', 'nonaktif', '2021-06-24', '98cb615d9790f36ce0df7fa58722a09e'),
(41, '54.169.128.87', 'nonaktif', '2021-06-24', 'd8c05d7474d642a4768635af08508b69'),
(42, '54.169.128.87', 'nonaktif', '2021-06-24', '6e522eb96aaea4278ffafcabd891f835'),
(43, '54.169.128.87', 'nonaktif', '2021-06-24', '031e345e45e857c7f189b1aef89ec7e8'),
(44, '54.169.128.87', 'nonaktif', '2021-06-24', 'b8ded6df6783bff4b92a8146015fca6f'),
(45, '54.169.128.87', 'nonaktif', '2021-06-24', '1cc4f312ae05843e3aec029b0090c9e5'),
(46, '54.169.128.87', 'nonaktif', '2021-06-24', '561ce6081c615dc61d0f138f91f3fedc'),
(47, '54.169.128.87', 'nonaktif', '2021-06-24', 'f53fdee6cff60d34a631812cfe09d643'),
(48, '54.169.128.87', 'nonaktif', '2021-06-24', '2abd3b632696cf740c8a10dab57565ba'),
(49, '54.169.128.87', 'nonaktif', '2021-06-24', '13b4da4d8ca98d94c455c45f3460cbf7'),
(50, '54.169.128.87', 'nonaktif', '2021-06-24', '8b7d007faa3c059e20d7441e1b4c3fd3'),
(51, '54.169.128.87', 'nonaktif', '2021-06-25', '4154a57589b3c33e449845532fa95af4'),
(52, '54.169.128.87', 'nonaktif', '2021-06-25', 'c5871f25a1ff187c49b8b5b8bcf553e8'),
(53, '54.169.128.87', 'nonaktif', '2021-06-25', 'e6840cbb6c9e94ad3e8531fb829adb8e'),
(54, '54.169.128.87', 'nonaktif', '2021-06-25', 'f7b620ed71d2cd2455c4d4d728006f76'),
(55, '54.169.128.87', 'nonaktif', '2021-06-25', '7ef0512d57074044a8431ad05a92fb17'),
(56, '54.169.128.87', 'nonaktif', '2021-06-25', '1cfcc4848a6ea11500ce91a8cbd4f536'),
(57, '54.169.128.87', 'nonaktif', '2021-06-25', '9007d52ba210a1b2414053ba2076897e'),
(58, '54.169.128.87', 'nonaktif', '2021-06-25', '16e09e12e6d2f9b876950f893fd8bc37'),
(59, '54.169.128.87', 'nonaktif', '2021-06-25', 'effb9312ad4fa19b90a43b332dbcbee4'),
(60, '54.169.128.87', 'nonaktif', '2021-06-25', '492bf68f6e0510ea27c97c4ab033a8b3'),
(61, '54.169.128.87', 'nonaktif', '2021-06-25', '7c90576dab4b805e795df0d7bb17c46c'),
(62, '54.169.128.87', 'nonaktif', '2021-06-25', '4b9038e0257f599801ae465da9908d2e'),
(63, '54.169.128.87', 'nonaktif', '2021-06-25', '5776a01aad28b27d5436318cd2950bb4'),
(64, '54.169.128.87', 'nonaktif', '2021-06-25', '9ab44214ffcd7d4b5c4bc0d44654935e'),
(65, '54.169.128.87', 'nonaktif', '2021-06-25', '21f80a5a1ad00e1edae2c95363ad5a93'),
(66, '54.169.128.87', 'nonaktif', '2021-06-25', '9fbe7f8ddcd5edbc6222a6ea58e0dc87'),
(67, '54.169.128.87', 'nonaktif', '2021-06-25', '45604ba14aa9eeae3cec053da464b844'),
(68, '54.169.128.87', 'nonaktif', '2021-06-25', '298045705ac59b3e751953e28e8f9a15'),
(69, '54.169.128.87', 'nonaktif', '2021-06-25', '93c6a872c2de1ab673ae906b5bd9f9a6'),
(70, '54.169.128.87', 'nonaktif', '2021-06-25', '39f4a9601a10a60a508ec8b1202ef176'),
(71, '54.169.128.87', 'nonaktif', '2021-06-25', '3bd0c967362da79c091405f806f0ece6'),
(72, '54.169.128.87', 'nonaktif', '2021-06-25', 'fa0fabb7414f50976e68051608ab6fe6'),
(73, '54.169.128.87', 'nonaktif', '2021-06-25', '152dc9ef1b033c55cc9f3118a82bd46e'),
(74, '54.169.128.87', 'nonaktif', '2021-06-25', 'f4595e7e8e6d05c28ee672be0c655722'),
(75, '54.169.128.87', 'nonaktif', '2021-06-25', '1740a708187d2c9c2c95ad7f96b3a82b'),
(76, '54.169.128.87', 'nonaktif', '2021-06-25', 'b8612e49b1d48c1d6cd9bbe10f4b762c'),
(77, '54.169.128.87', 'nonaktif', '2021-06-25', '6cf1c5ef5d1a5ec552555c8d73387c87'),
(78, '54.169.128.87', 'nonaktif', '2021-06-25', '71bc79893c7103372800ca0cc8663ac3'),
(79, '54.169.128.87', 'nonaktif', '2021-06-25', '2bc4c23b9592383c472301ace7fc1088'),
(80, '54.169.128.87', 'nonaktif', '2021-06-26', '9df1915cacdf36556603474925004179'),
(81, '54.169.128.87', 'nonaktif', '2021-06-26', 'e7352f2343824025bd150f571bfc47da'),
(82, '54.169.128.87', 'nonaktif', '2021-06-26', '4193ace597f7abb089007ce504ea948b'),
(83, '54.169.128.87', 'nonaktif', '2021-06-26', 'b9e4ee92b0c0bea7fbb842580850a7f6'),
(84, '54.169.128.87', 'nonaktif', '2021-06-26', 'd5999c00cb2167ad93165859076f04d4'),
(85, '54.169.128.87', 'nonaktif', '2021-06-26', '227dddd12a52ac3512619ac572420b4a'),
(86, '54.169.128.87', 'nonaktif', '2021-06-26', 'b37b0042b58ed637532cf0e2a6f149fd'),
(87, '54.169.128.87', 'nonaktif', '2021-06-26', 'c451d54177e86e0155ca3bcb7c6c0917'),
(88, '54.169.128.87', 'nonaktif', '2021-06-26', '61fab0bb9daba96bb808eb1b4ddc292e'),
(89, '54.169.128.87', 'nonaktif', '2021-06-28', 'afec1d82b66e354907c5d99dd20830b8'),
(90, '54.169.128.87', 'nonaktif', '2021-06-28', '5211beffc399d50f51d175c29de277f3'),
(91, '54.169.128.87', 'nonaktif', '2021-06-28', '5c58d0e18a5d2b8537424396cd69def8'),
(92, '54.169.128.87', 'nonaktif', '2021-06-28', '9e34d4bc32bca6ad9e470b3b4b2070bb'),
(93, '182.1.33.158', 'nonaktif', '2021-06-28', '501e34fc6f5eea7f5587a934ce2367d8'),
(94, '182.1.44.142', 'nonaktif', '2021-06-28', 'bd66b33eaebd7b40b54ba0f4caca1d4f'),
(95, '114.125.63.182', 'nonaktif', '2021-06-28', '0c14ce3b9b80cdfde1746b360bc3b105'),
(96, '182.1.33.158', 'nonaktif', '2021-06-28', 'a73f901084d517cd15ec1c08a39ee89c'),
(97, '114.125.63.182', 'nonaktif', '2021-06-28', 'd511451bf7686a726e7d063598a32e08'),
(98, '182.1.33.158', 'nonaktif', '2021-06-28', '05ca942a99be52d344097a31375204be'),
(99, '182.1.39.198', 'nonaktif', '2021-06-28', '5e91e50c9427d5678a4ed591fadcadcf'),
(100, '114.125.63.182', 'nonaktif', '2021-06-28', 'f4f1c083c3c505258db1497471da283f'),
(101, '182.1.33.158', 'nonaktif', '2021-06-28', 'b3544cf47af8f44c0edd5918d11b2126'),
(102, '114.125.63.182', 'nonaktif', '2021-06-28', '875238f54847ae1ab88fb361f8cdffcb'),
(103, '182.1.33.158', 'nonaktif', '2021-06-28', 'c3c28c1c043fecd0a0d94d73dcf09444'),
(104, '182.1.44.142', 'aktif', '2021-06-28', '1ff3c6c92786e4fdd3c179e8b9cf3819'),
(105, '114.125.63.182', 'nonaktif', '2021-06-28', 'c21feb46fb92526e1fc6b2c76c9fdc68'),
(106, '182.1.39.198', 'aktif', '2021-06-28', 'df5b7ee762523b25890018ceab751226'),
(107, '182.1.33.158', 'nonaktif', '2021-06-28', '2ca95d7d5d67658cbd5373df7f38b16a'),
(108, '114.125.63.182', 'nonaktif', '2021-06-28', '0a6b8dedbe756f7547eefc1ead86e2f8'),
(109, '182.1.33.158', 'nonaktif', '2021-06-28', 'adf9f77fa1eded97f07cf1a3bfe35c8e'),
(110, '114.125.63.182', 'nonaktif', '2021-06-28', '2bed93c69edebd838626f465d5b42155'),
(111, '182.1.33.158', 'aktif', '2021-06-28', 'a2a03a951da1d1628f9356af6ce3d74d'),
(112, '114.125.63.182', 'aktif', '2021-06-28', '9c62328b9734a422032e5e4ba8e724e6'),
(113, '182.1.51.206', 'aktif', '2021-06-28', '6df753ca1622413c31e6ac07f8c9d8dd'),
(114, '182.1.35.78', 'nonaktif', '2021-06-28', 'e808a879a210c12179b0497f37822fbc'),
(115, '182.1.59.222', 'aktif', '2021-06-28', 'a67e9b305ced08f4a5c1f4ffd0182079'),
(116, '114.125.61.50', 'nonaktif', '2021-06-28', 'ed3b0b231768bfcc1d48b80aef98b310'),
(117, '114.125.61.50', 'nonaktif', '2021-06-28', 'fa20f880a063e6c3f4b26105e3bddef3'),
(118, '114.125.61.50', 'nonaktif', '2021-06-28', '07bcfc68baad1e56198d117f7a7930b9'),
(119, '114.125.61.50', 'nonaktif', '2021-06-28', 'bf80f83e8a459f12beea6ab372855c48'),
(120, '114.125.61.50', 'nonaktif', '2021-06-28', '8c646cc16c3e92f536b2b526b6fed294'),
(121, '114.125.61.50', 'nonaktif', '2021-06-28', 'b410bb469679b36edc5440e1644879d3'),
(122, '182.1.61.210', 'nonaktif', '2021-06-28', '299521d9ce3952ae3a7ed977b8108ef0'),
(123, '182.1.38.66', 'nonaktif', '2021-06-28', 'bb53a5551a05845841db082a27d8975c'),
(124, '182.1.38.66', 'aktif', '2021-06-28', '44e6a434847772231ed01e9e4bc72603'),
(125, '182.1.61.210', 'aktif', '2021-06-28', '98f814c6da3df823104fadb15405191b'),
(126, '182.1.35.78', 'nonaktif', '2021-06-28', '3edadc04bc3486a77720b40bfc66a3a9'),
(127, '114.125.61.50', 'nonaktif', '2021-06-28', '8b98d0bb81b390aad09d583095447709'),
(128, '182.1.35.78', 'aktif', '2021-06-28', 'efac2728aa3da63f7d9a55d11e888a8a'),
(129, '114.125.61.50', 'aktif', '2021-06-28', 'ae788804d306716b3940eb8df62549b7'),
(130, '54.169.128.87', 'aktif', '2021-06-29', 'edd88e52ea26221bf9825d271d08e929');

-- --------------------------------------------------------

--
-- Table structure for table `ilogin`
--

DROP TABLE IF EXISTS `ilogin`;
CREATE TABLE `ilogin` (
  `id` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `tanggal` date NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ilogin`
--

INSERT INTO `ilogin` (`id`, `nama`, `pass`, `tanggal`, `status`) VALUES
(2, 'itest', 'fec2b8ace11d2e8115a9cb8ed56f6ec8', '2021-06-19', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `mid` int(15) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `ukuran` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jumlah` int(7) NOT NULL,
  `total` int(7) NOT NULL,
  `ket` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`mid`, `nama`, `type`, `ukuran`, `tanggal`, `jumlah`, `total`, `ket`) VALUES
(1, 'B/N (Bolt/Nut)', 'Stainless Steel', 'M10 X 40', '2021-06-01 00:00:00', 100, 100, ''),
(2, 'B/N (Bolt/Nut)', 'Stainless Steel', 'M10 X 25', '2021-06-01 00:00:00', 100, 100, ''),
(3, 'asdf', 'asdf', 'asdf', '2021-06-23 00:00:00', 11, 11, ''),
(4, 'asdfasdf', 'asdf', 'asdf', '2021-06-02 00:00:00', 2, 2, ''),
(5, 'asdf', 'fsda', 'asdf', '2019-12-29 00:00:00', 4, 0, ''),
(7, 'asdf', 'asdf', 'sadf', '2021-06-24 00:00:00', 0, 0, ''),
(8, 'tt', 'tt', 'tt', '2021-06-24 00:00:00', 0, 0, ''),
(9, 'zz', 'zz', 'zz', '2021-06-24 14:41:00', 0, 0, ''),
(15, 'qqq', 'qqq', 'qqq', '2021-06-26 11:45:47', 0, 0, ''),
(16, 'aaa', 'aaa', 'aaa', '2021-06-26 11:46:05', 0, 0, ''),
(17, 'dw', 'dw', 'dw', '2021-06-26 11:49:22', 0, 0, ''),
(18, 'fewa', 'fawe', 'faew', '2021-06-28 09:33:06', 0, 0, ''),
(19, '213', '2`13123', '21313', '2021-06-28 09:51:57', 0, 0, ''),
(20, '213', '2`13123', '21313', '2021-06-28 09:51:57', 0, 0, ''),
(21, '2131', '3213', '21313', '2021-06-28 09:52:05', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `perubahan` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `ket` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `mid`, `perubahan`, `total`, `tanggal`, `ket`) VALUES
(59, 19, 33, 33, '2021-06-28 13:38:41', '33'),
(60, 19, 11, 11, '2021-06-28 13:39:00', '11'),
(61, 19, 333, 344, '2021-06-28 13:43:47', '');

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

DROP TABLE IF EXISTS `toko`;
CREATE TABLE `toko` (
  `id` int(15) NOT NULL,
  `nama` varchar(55) NOT NULL,
  `contact` varchar(35) NOT NULL,
  `telpon` varchar(15) NOT NULL,
  `alamat` varchar(55) NOT NULL,
  `tanggal` datetime NOT NULL,
  `ket` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`id`, `nama`, `contact`, `telpon`, `alamat`, `tanggal`, `ket`) VALUES
(5, 'test', 'test', 'test', 'test', '2021-06-25 16:14:53', 'test'),
(8, 'asdf', 'asdf', 'asdf', 'asdf', '2021-06-26 11:51:44', 'asdf'),
(9, 'aaa', 'aaa', 'aaa', 'aaa', '2021-06-26 13:31:10', 'aaa'),
(10, 'toko a', 'contact a', 'telpon a', 'alamat a', '2021-06-26 13:46:52', 'ket a'),
(11, 'eaqwrwqeqe', 'eqweqwe', 'qweqwe', 'qweqwe', '2021-06-26 13:51:07', 'eqweqw'),
(12, 'toko b', 'toko b', 'toko b', 'toko b', '2021-06-28 11:02:02', 'toko b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `harga`
--
ALTER TABLE `harga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iip`
--
ALTER TABLE `iip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ilogin`
--
ALTER TABLE `ilogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `harga`
--
ALTER TABLE `harga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `iip`
--
ALTER TABLE `iip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `ilogin`
--
ALTER TABLE `ilogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `mid` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
