-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2021 at 04:50 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rostech`
--

DELIMITER $$
--
-- Functions
--
DROP FUNCTION IF EXISTS `checkLogin`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `checkLogin` (`var1` VARCHAR(25), `var2` VARCHAR(32)) RETURNS VARCHAR(15) CHARSET latin1 BEGIN
	return (select a.role FROM ilogin a where a.pass like var2 and UPPER(a.nama) like UPPER(var1) and a.status LIKE 'aktif');
END$$

DROP FUNCTION IF EXISTS `inputPembelian`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `inputPembelian` (`in_mid` INT, `in_tid` INT, `in_persatuan` INT, `in_jumlah` INT, `in_total` INT, `in_tanggal` VARCHAR(25), `in_ket` VARCHAR(55)) RETURNS INT(11) BEGIN
declare t int;
declare inS int;

insert into stock(mid, perubahan, total, tanggal, ket)  values(in_mid, in_jumlah, (in_jumlah+(select COALESCE(latestStock(in_mid),0))), now(), in_ket);
insert into harga(mid, tid, tanggal, persatuan, jumlah, total, ket) values(in_mid, in_tid, in_tanggal, in_persatuan, in_jumlah, in_total, in_ket);

return 1;

END$$

DROP FUNCTION IF EXISTS `latestStock`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `latestStock` (`in_mid` INT) RETURNS INT(11) BEGIN

return (select s.total as i from stock s where s.mid = in_mid order by s.tanggal desc limit 1);

END$$

DELIMITER ;

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
(58, 114, 17, '2021-07-04T02:22:00.000Z', 5000, 20, 100000, 'test'),
(59, 87, 13, '2021-07-13T01:49:00.000Z', 185000, 6, 1110000, ''),
(60, 175, 25, '2021-07-13T01:52:00.000Z', 97500, 1, 97500, ''),
(61, 123, 14, '2021-07-14T04:20:00.000Z', 930000, 8, 7440000, ''),
(62, 142, 20, '2021-07-15T02:04:00.000Z', 104000, 7, 728000, ''),
(63, 179, 20, '2021-07-13T02:07:00.000Z', 29800, 10, 298000, ''),
(64, 180, 20, '2021-06-30T02:08:00.000Z', 38300, 20, 766000, ''),
(65, 181, 20, '2021-06-30T02:11:00.000Z', 9500, 10, 95000, ''),
(66, 182, 17, '2021-07-15T02:14:00.000Z', 5000, 20, 100000, ''),
(67, 183, 17, '2021-07-15T02:16:00.000Z', 34000, 25, 850000, ''),
(68, 77, 22, '2021-06-05T02:18:00.000Z', 14500, 10, 145000, ''),
(69, 123, 14, '2021-06-17T02:33:00.000Z', 870000, 12, 10440000, ''),
(70, 184, 13, '2021-06-29T02:36:00.000Z', 22500, 20, 450000, ''),
(71, 29, 13, '2021-06-29T02:39:00.000Z', 558000, 5, 2790000, ''),
(72, 185, 13, '2021-06-29T02:42:00.000Z', 40000, 30, 1200000, ''),
(73, 31, 15, '2021-07-14T02:45:00.000Z', 225000, 5, 1125000, ''),
(74, 186, 15, '2021-07-14T02:46:00.000Z', 235000, 5, 1175000, ''),
(75, 28, 15, '2021-07-14T02:46:00.000Z', 180000, 5, 900000, '');

-- --------------------------------------------------------

--
-- Table structure for table `iip`
--

DROP TABLE IF EXISTS `iip`;
CREATE TABLE `iip` (
  `id` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL,
  `tanggal` datetime NOT NULL,
  `token` varchar(126) NOT NULL,
  `tanggal_out` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `iip`
--

INSERT INTO `iip` (`id`, `ip`, `status`, `tanggal`, `token`, `tanggal_out`) VALUES
(196, '114.125.41.109', 'aktif', '2021-07-16 09:15:47', '9954913b4d21014da9e772dcee1adf80', NULL),
(197, '114.125.40.68', 'aktif', '2021-07-16 09:18:30', 'e4f7ff154998ce5812518bddc1bfa2d4', NULL),
(198, '114.125.56.41', 'aktif', '2021-07-16 09:25:11', '6cb631827d3351756e57f81a44551acc', NULL),
(199, '114.125.40.134', 'aktif', '2021-07-16 09:25:30', 'e1c5c27490e13baabec453656ee527a8', NULL),
(200, '114.125.57.40', 'aktif', '2021-07-16 09:30:32', 'd03a7170daa70a351dd2e10453313f16', NULL),
(201, '114.125.57.108', 'nonaktif', '2021-07-16 09:33:13', 'e2a81e9cefed899cb8c45141263bb1ec', '2021-07-16 09:45:54'),
(202, '114.125.57.108', 'aktif', '2021-07-16 09:45:58', '5787ae8ff2a1ae678120ff1d14ab1e61', NULL);

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
  `status` varchar(15) NOT NULL,
  `role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ilogin`
--

INSERT INTO `ilogin` (`id`, `nama`, `pass`, `tanggal`, `status`, `role`) VALUES
(2, 'itest', 'fec2b8ace11d2e8115a9cb8ed56f6ec8', '2021-06-19', 'aktif', 'admin');

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
(22, 'Kawat Las', 'RB 28 2.8', '', '2021-06-29 13:52:42', 0, 0, ''),
(23, 'Kawat Las', 'RB 28 3.2', '', '2021-06-29 13:52:53', 0, 0, ''),
(24, 'Ring', '', '', '2021-06-29 13:53:00', 0, 0, ''),
(25, 'Busing', '', '', '2021-06-29 13:53:04', 0, 0, ''),
(26, 'Mur', '', '', '2021-06-29 13:53:09', 0, 0, ''),
(27, 'Siku 40 +- 13 Kg [Kuning]', '', '', '2021-06-29 13:53:41', 0, 0, ''),
(28, 'AS', 'Stainless', 'dia 4\" X 5 cm', '2021-06-29 13:54:11', 0, 0, ''),
(29, 'AS', 'Stainless', 'dia 3 1/2\" X 18,5 cm', '2021-06-29 13:54:40', 0, 0, ''),
(30, 'AS', 'Stainless', 'dia 2\" X 29 cm', '2021-06-29 13:54:53', 0, 0, ''),
(31, 'AS', 'Stainless', 'dia 1 3/4\" X 37,5 cm', '2021-07-16 09:45:08', 0, 0, ''),
(32, 'Pipa Boring', '', '140/100 X 3,5 cm', '2021-06-29 13:55:25', 0, 0, ''),
(33, 'Roda Hitam 67 rem + mati', '', '', '2021-06-29 13:55:48', 0, 0, ''),
(34, 'Nako', 'SS', '10X10X285MM', '2021-06-29 13:56:20', 0, 0, ''),
(35, 'Bnp', '', '10 X 40', '2021-06-29 13:56:41', 0, 0, ''),
(36, 'Plat', 'SS', '8 mm X 4\' X 8\'', '2021-06-29 13:57:02', 0, 0, ''),
(37, 'Tapak Press', '', '', '2021-06-29 13:57:16', 0, 0, ''),
(38, 'Plat', '201 2B (DOP)', '4 X 8 X 6 mm', '2021-06-29 13:57:51', 0, 0, ''),
(39, 'Plat', 'HL 201', '4 X 8 X 1,5 mm', '2021-06-29 13:58:23', 0, 0, ''),
(40, 'A-43 Mitsuboshi', '', '', '2021-06-29 13:59:27', 0, 0, ''),
(41, 'A-49 Mitsuboshi', '', '', '2021-06-29 13:59:31', 0, 0, ''),
(42, 'UCF204 ASB', '', '', '2021-06-29 13:59:38', 0, 0, ''),
(43, 'Bolt', 'Stainless Steel', 'm6 X 10', '2021-06-29 14:00:07', 0, 0, ''),
(44, 'Bolt', 'Stud', 'm8 X 15', '2021-06-29 14:00:21', 0, 0, ''),
(45, 'Bolt', 'Stud', 'M8 X 10', '2021-06-29 14:00:47', 0, 0, ''),
(46, 'Bolt', 'Stainless Steel', 'm8 X 20', '2021-06-29 14:01:06', 0, 0, ''),
(47, 'Bolt', 'Stainless Steel', 'm8 X 25', '2021-06-29 14:01:19', 0, 0, ''),
(48, 'Ultra thin', '', '', '2021-06-29 14:01:34', 0, 0, ''),
(49, 'TC 35 45 7 tto', '', '', '2021-06-29 14:01:41', 0, 0, ''),
(50, 'TC 31 45 7 tto', '', '', '2021-06-29 14:01:46', 0, 0, ''),
(51, 'TC 48 85 10 tto', '', '', '2021-06-29 14:01:53', 0, 0, ''),
(52, '30208 Asb', '', '', '2021-06-29 14:01:57', 0, 0, ''),
(53, 'Besi', 'AS 1045', 'dia 50mm X  2,5 cm', '2021-06-29 14:02:26', 0, 0, ''),
(54, 'Besi', 'Hexagon', 'dia 50 mm X 2,5 cm', '2021-06-29 14:02:38', 0, 0, ''),
(55, 'AS', 'Stainless', 'dia 1 1/2\" X 2 cm', '2021-06-29 14:02:56', 0, 0, ''),
(56, 'AS', 'Stainless', 'dia 2\" X 1,5 cm', '2021-06-29 14:03:17', 0, 0, ''),
(57, 'AS', 'Stainless', 'dia 2 1/2\" X 15 cm', '2021-06-29 14:04:32', 0, 0, ''),
(58, 'AS', 'Stainless', 'dia 1 1/4\" X 31 cm', '2021-06-29 14:04:51', 0, 0, ''),
(59, 'AS', 'Stainless', 'dia 1 1/4\" X 23 cm', '2021-06-29 14:05:02', 0, 0, ''),
(60, 'Carbon Brush [Bull] (Auto)', '', '', '2021-06-29 14:05:10', 0, 0, ''),
(61, 'AS', 'SS', '3\" X 4CM', '2021-06-29 14:05:21', 0, 0, ''),
(62, 'Belting A-43', '', '', '2021-06-29 14:05:26', 0, 0, ''),
(63, 'Roda', '', '', '2021-06-29 14:05:29', 0, 0, ''),
(64, 'Mur 3/8', '', '', '2021-06-29 14:05:49', 0, 0, ''),
(65, 'Roda Gepeng 5\" Rem', '', '', '2021-06-29 14:05:57', 0, 0, ''),
(66, 'Roda Gepeng 6\" Rem', '', '', '2021-06-29 14:06:01', 0, 0, ''),
(67, 'Pipa', 'SS 304 Sch 40', 'dia 4\" X 1m (welded)', '2021-06-29 14:06:18', 0, 0, ''),
(68, 'Ban Karet Drum Sander', '', '', '2021-06-29 14:06:25', 0, 0, ''),
(69, 'Kunci Ring Pas GK auto', '', '', '2021-06-29 14:06:29', 0, 0, ''),
(70, 'Kunci T Rush Auto', '', '', '2021-06-29 14:06:34', 0, 0, ''),
(71, 'Pipa Boring', '', '140/100 X 2,5cm', '2021-06-29 14:07:11', 0, 0, ''),
(72, 'Pipa Boring', '', '114/75 X 13cm', '2021-06-29 14:07:19', 0, 0, ''),
(73, 'Besi Hexagonal', '', '50MM X 3CM', '2021-06-29 14:07:30', 0, 0, ''),
(74, 'Plat', 'HL 201', '4X8X1 mm', '2021-06-29 14:08:02', 0, 0, ''),
(75, 'Pulley A2X3\"', '', '', '2021-06-29 14:08:07', 0, 0, ''),
(76, 'Kain Polis HL', '', '', '2021-06-29 14:08:23', 0, 0, ''),
(77, 'Thinner ND Super', '', '', '2021-06-29 14:08:27', 0, 0, ''),
(78, 'Baut', '', '', '2021-06-29 14:08:54', 0, 0, ''),
(79, 'Busing Kecil', '', '', '2021-06-29 14:08:58', 0, 0, ''),
(80, 'Sepatu Cheetah 711 / 8', '', '', '2021-06-29 14:09:02', 0, 0, ''),
(81, 'Spray Gun Meiji f75 A 3790-075', '', '', '2021-06-29 14:09:41', 0, 0, ''),
(82, 'Pahat Bubut 5/16X16', '', '', '2021-06-29 14:09:46', 0, 0, ''),
(83, 'Jarum Argon 1.6mm WELDCRAFT', '', '', '2021-06-29 14:09:50', 0, 0, ''),
(84, '48 80 11', '', '', '2021-06-29 14:10:03', 0, 0, ''),
(85, '30 48 8', '', '', '2021-07-06 14:01:38', 0, 0, ''),
(86, '48 85 10', '', '', '2021-06-29 14:10:11', 0, 0, ''),
(87, 'AS', 'SS', '10mm X 6m', '2021-06-29 14:10:31', 0, 0, ''),
(88, 'UCF 206', '', '', '2021-06-29 14:10:35', 0, 0, ''),
(89, '488010', '', '', '2021-06-29 14:10:39', 0, 0, ''),
(90, '30208', '', '', '2021-06-29 14:10:42', 0, 0, ''),
(91, 'Honda 6X  200T Tanpa Test', '', '', '2021-06-29 14:10:48', 0, 0, ''),
(92, 'TC-30-50-11 NOK', '', '', '2021-06-29 14:10:52', 0, 0, ''),
(93, 'Roda Karet H 6\" Massaki', '', '', '2021-06-29 14:10:57', 0, 0, ''),
(94, 'Roda Karet M 6\" Massaki', '', '', '2021-06-29 14:11:04', 0, 0, ''),
(95, 'Tool', '', '', '2021-06-29 14:11:09', 0, 0, ''),
(96, 'Tool Bag', '', '', '2021-06-29 14:11:12', 0, 0, ''),
(97, 'B/N', '', '8X25', '2021-06-29 14:11:51', 0, 0, ''),
(98, 'B/N', 'S/S', '6X10', '2021-06-29 14:12:03', 0, 0, ''),
(99, 'Ultra Flak', '', '', '2021-06-29 14:12:27', 0, 0, ''),
(100, 'Batu Grinda 100X2X16 WA 60 ULTRA FLEX', '', '', '2021-06-29 14:12:33', 0, 0, ''),
(101, 'Batu Gerinda Potong 4X1', '', '', '2021-06-29 14:12:36', 0, 0, ''),
(102, 'Reparasi motor 3 HP gulung spull', '', '', '2021-06-29 14:12:41', 0, 0, ''),
(103, 'Elbow 3\"', '', '', '2021-06-29 14:12:46', 0, 0, ''),
(104, 'Tee 3\"', '', '', '2021-06-29 14:12:51', 0, 0, ''),
(105, 'Semen 3 Roda', '', '', '2021-06-29 14:12:55', 0, 0, ''),
(106, 'Electrode P80 Plasma Cutting', '', '', '2021-06-29 14:12:59', 0, 0, ''),
(107, 'Thinner', '', '', '2021-06-29 14:13:04', 0, 0, ''),
(108, 'Cat Penta Blue Oreo', '', '', '2021-06-29 14:13:08', 0, 0, ''),
(109, 'Plat HL 1.2mm', '', '', '2021-06-29 14:13:47', 0, 0, ''),
(110, 'Nako', 'SS', '10X10X330MM', '2021-06-29 14:14:12', 0, 0, ''),
(111, 'Spanduk Uk 1.30 X 0.80 M2', '', '', '2021-06-29 14:14:22', 0, 0, ''),
(112, 'M. Gerinda Ultra Touch', '', '', '2021-06-29 14:14:27', 0, 0, ''),
(113, 'Bros Mangkok Benz', '', '', '2021-06-29 14:14:30', 0, 0, ''),
(114, 'Flop Disc #80', '', '', '2021-06-29 14:14:34', 0, 0, ''),
(115, 'M. Widia #12', '', '', '2021-06-29 14:14:38', 0, 0, ''),
(116, 'Bolt', 'Stud', 'M6 X 10', '2021-06-29 14:15:26', 0, 0, ''),
(117, 'B/N S/S M10X20', '', '', '2021-06-29 14:15:45', 0, 0, ''),
(118, 'B/N S/S M10X25', '', '', '2021-06-29 14:15:48', 0, 0, ''),
(119, 'B/N S/S M10X40', '', '', '2021-06-29 14:15:52', 0, 0, ''),
(120, 'Arc-rite', '', '', '2021-06-29 14:15:55', 0, 0, ''),
(121, 'Siku 50 +- 15 Kg [Kuning]', '', '', '2021-06-29 14:15:59', 0, 0, ''),
(122, 'Siku 30 +- 7.5 Kg [Kuning]', '', '', '2021-06-29 14:16:02', 0, 0, ''),
(123, 'Plat', 'HL 201', '4X8X1.2 mm', '2021-06-29 14:16:47', 0, 0, ''),
(124, 'Electromotor 3 HP', '', '', '2021-06-29 14:16:51', 0, 0, ''),
(125, 'AS 2 1/2\" X 3CM', '', '', '2021-06-29 14:17:32', 0, 0, ''),
(126, 'AS', 'Stainless', 'Dia 1 3/4\" X 16,5CM', '2021-06-29 14:17:52', 0, 0, ''),
(127, 'Pully A 11X7\" Polos A11X7', '', '', '2021-06-29 14:18:16', 0, 0, ''),
(128, 'AS', 'Stainless', 'Dia 2\" X 29CM', '2021-06-29 14:19:03', 0, 0, ''),
(129, 'Kawat Las RB 26 2,6', '', '', '2021-06-29 14:19:16', 0, 0, ''),
(130, 'FIX MMA/ARC 160-200A FIX-201', '', '', '2021-06-29 14:19:20', 0, 0, ''),
(131, 'Mosfat 1650E 1199-90142', '', '', '2021-06-29 14:19:24', 0, 0, ''),
(132, 'Tapak Press Besar', '', '', '2021-06-29 14:19:40', 0, 0, ''),
(133, 'Tapak Press Kecil', '', '', '2021-06-29 14:19:44', 0, 0, ''),
(134, 'Bor Impact Makita + MT HP1630', '', '', '2021-06-29 14:19:47', 0, 0, ''),
(135, 'TC 32 48 7 KMD', '', '', '2021-06-29 14:20:58', 0, 0, ''),
(136, 'TC 38 48 6 CHO', '', '', '2021-06-29 14:21:01', 0, 0, ''),
(137, 'HTC 32 48 7 NOK', '', '', '2021-06-29 14:21:04', 0, 0, ''),
(138, 'TC 48 80 10 TTO', '', '', '2021-06-29 14:21:18', 0, 0, ''),
(139, 'TC 30 45 10 Cho', '', '', '2021-06-29 14:21:27', 0, 0, ''),
(140, 'NOK TC-48-62-9', '', '', '2021-06-29 14:21:44', 0, 0, ''),
(141, 'Pully A 1 X 3\" Polos', '', '', '2021-06-29 14:21:54', 0, 0, ''),
(142, 'Pully A 1 X 6\" Polos', '', '', '2021-06-29 14:21:58', 0, 0, ''),
(143, 'MITSUBOSHI A-49 (Belting)', '', '', '2021-06-29 14:22:53', 0, 0, ''),
(144, 'BANDO A-77', '', '', '2021-06-29 14:22:58', 0, 0, ''),
(145, 'NOK TC-30-46-6', '', '', '2021-06-29 14:23:09', 0, 0, ''),
(146, 'Honda 6X  200T Tanpa Test', '', '', '2021-06-29 14:23:13', 0, 0, ''),
(147, 'Pipa Boring 127/65 X 13CM', '', '', '2021-06-29 14:24:11', 0, 0, ''),
(148, 'Pipa Boring 194/108 X 2,5CM', '', '', '2021-06-29 14:24:14', 0, 0, ''),
(149, 'Pipa Boring 194/108 X 3,5CM', '', '', '2021-06-29 14:24:17', 0, 0, ''),
(150, 'Pipa Boring 102/40 X 9CM', '', '', '2021-06-29 14:24:20', 0, 0, ''),
(151, 'Pipa Boring 114/75 X 2CM', '', '', '2021-06-29 14:24:23', 0, 0, ''),
(152, 'Pipa Boring 114/75 X 2,5CM', '', '', '2021-06-29 14:24:26', 0, 0, ''),
(153, 'Stainless Dia 1 3/4\" X2MM', '', '', '2021-06-29 14:25:04', 0, 0, ''),
(154, 'Stainless Dia 2\" X18CM', '', '', '2021-06-29 14:25:15', 0, 0, ''),
(155, 'Kain Majun', '', '', '2021-06-29 14:25:27', 0, 0, ''),
(156, 'R Plat M10', '', '', '2021-06-29 14:25:31', 0, 0, ''),
(157, 'B/N Putih M10 x40', '', '', '2021-06-29 14:25:34', 0, 0, ''),
(158, 'Ultra Flex', '', '', '2021-06-29 14:26:00', 0, 0, ''),
(159, 'Baut S/S M6 X10', '', '', '2021-06-29 14:26:43', 0, 0, ''),
(160, 'Kunci T Tara 17MM', '', '', '2021-06-29 14:26:47', 0, 0, ''),
(161, 'Kawat Las S/S 1,6M', '', '', '2021-06-29 14:26:50', 0, 0, ''),
(162, 'Stainless 1\" X 265MM', '', '', '2021-06-29 14:28:17', 0, 0, ''),
(163, 'Stainless 1\" X 195MM', '', '', '2021-06-29 14:28:20', 0, 0, ''),
(164, 'Sainless 2\" X 130MM', '', '', '2021-06-29 14:28:37', 0, 0, ''),
(165, 'Stainless 2 1/2\" X 20MM', '', '', '2021-06-29 14:28:56', 0, 0, ''),
(166, 'Kuningan Dia 1 3/4\" X 50MM', '', '', '2021-06-29 14:29:16', 0, 0, ''),
(167, 'Besi AS 1045/5T-60 Dia 50MM x 25MM', '', '', '2021-06-29 14:29:26', 0, 0, ''),
(168, 'Teflon Dia 100MM @ 2.5CM', '', '', '2021-06-29 14:29:34', 0, 0, ''),
(169, 'Roda Karet H Rem 6\" Massaki', '', '', '2021-06-29 14:30:24', 0, 0, ''),
(170, 'PLAT RING 25MM - 170/110MM', '', '', '2021-06-29 14:30:30', 0, 0, ''),
(171, 'ULTRA THIN CUT', '', '', '2021-06-29 14:30:44', 0, 0, ''),
(175, 'Mata Bor 11 Nachi', '', '', '2021-07-14 08:51:39', 0, 0, 'Mata Bor 11 Nachi'),
(177, 'test', '', '', '2021-07-14 13:42:01', 0, 0, ''),
(178, 'Pully A 11X8\" Polos', '', '', '2021-07-16 09:04:03', 0, 0, ''),
(179, 'Carbon Brush Asli', '', '', '2021-07-16 09:07:17', 0, 0, ''),
(180, 'Carbon Brush Asli (MT90)', '', '', '2021-07-16 09:08:15', 0, 0, ''),
(181, 'Carbon Brush [Bull]', '', '', '2021-07-16 09:10:54', 0, 0, ''),
(182, 'Flap Disc #100', '', '', '2021-07-16 09:13:57', 0, 0, ''),
(183, 'Ultra Thin Cut 14\"', '', '', '2021-07-16 09:16:05', 0, 0, ''),
(184, 'Hexagonal 2\" X 25mm', '', '', '2021-07-16 09:36:33', 0, 0, ''),
(185, 'Pully A2 X 3\" (as 20mm)', '', '', '2021-07-16 09:41:47', 0, 0, ''),
(186, 'AS Stainless dia 2\" X 30 cm', '', '', '2021-07-16 09:46:07', 0, 0, '');

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
  `ket` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `mid`, `perubahan`, `total`, `tanggal`, `ket`) VALUES
(67, 114, 20, 20, '2021-07-07 09:22:24', 'test'),
(68, 87, 6, 6, '2021-07-14 08:49:28', ''),
(69, 175, 1, 1, '2021-07-14 08:52:12', ''),
(70, 123, 8, 8, '2021-07-15 11:20:30', ''),
(71, 142, 7, 7, '2021-07-16 09:04:41', ''),
(72, 179, 10, 10, '2021-07-16 09:07:40', ''),
(73, 180, 20, 20, '2021-07-16 09:08:41', ''),
(74, 181, 10, 10, '2021-07-16 09:11:23', ''),
(75, 182, 20, 20, '2021-07-16 09:14:21', ''),
(76, 183, 25, 25, '2021-07-16 09:16:27', ''),
(77, 77, 10, 10, '2021-07-16 09:18:25', ''),
(78, 123, 12, 20, '2021-07-16 09:33:06', ''),
(79, 184, 20, 20, '2021-07-16 09:36:55', ''),
(80, 29, 5, 5, '2021-07-16 09:39:09', ''),
(81, 185, 30, 30, '2021-07-16 09:42:08', ''),
(82, 31, 5, 5, '2021-07-16 09:45:38', ''),
(83, 186, 5, 5, '2021-07-16 09:46:37', ''),
(84, 28, 5, 5, '2021-07-16 09:47:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

DROP TABLE IF EXISTS `toko`;
CREATE TABLE `toko` (
  `id` int(15) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `contact` varchar(55) NOT NULL,
  `telpon` varchar(55) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `ket` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`id`, `nama`, `contact`, `telpon`, `alamat`, `tanggal`, `ket`) VALUES
(13, 'UD - 555', 'Koko Martin', '81277755737', 'Jl Riau Ujung Toko Depan RPT', '2021-06-29 15:06:30', ''),
(14, 'METRO STEEL', 'Yola', '08227622788 / 081268490062', 'Air Hitam Pekanbaru', '2021-07-07 11:50:31', ''),
(15, 'KARYA RIAU / KARYA EDY', 'Koko Edy Siswanto', '085272608922', 'Jl Riau Ujung Sebelah Kiri', '2021-06-29 15:07:59', ''),
(16, 'Sama Jaya', 'Mba Ika', '081310189149', 'Lindeteves Trade Centre GF-2 Blok B 15 No 1 & 9 Hayam Wuruk Jakarta', '2021-06-29 15:08:42', ''),
(17, 'ANEKA SUMBER BAUT', 'Koko Acai', '08127642569 / 082384628204', 'Jl Harapan Raya No 242', '2021-07-07 11:50:19', ''),
(18, 'Sinar Bintang', '', '085355532800', 'Jl Harapan Raya No 301 D', '2021-06-29 15:09:12', ''),
(19, 'CENTRAL BEARING', 'Nafri', '085363599917', 'Jl Riau Simpang Jl Teratai', '2021-06-29 15:09:28', ''),
(20, 'YANMAR SETIA BUDI', 'Koko Sunardi', '08127554283', 'Jl Riau Ujung', '2021-06-29 15:09:42', ''),
(21, 'RIAU MANDIRI', '', '085363599917', 'Jl Teratai Pekanbaru', '2021-06-29 15:10:33', ''),
(22, 'Rumbai Steel', '', '', '', '2021-06-29 15:10:49', ''),
(23, 'CHROME', '', '', '', '2021-06-29 15:11:00', ''),
(24, 'RPT', '', '', '', '2021-06-29 15:11:23', ''),
(25, 'KARYA MANGGALA SEJAHTERA', '', '', '', '2021-06-29 15:11:29', ''),
(26, 'IP', '', '', '', '2021-06-29 15:11:44', ''),
(27, 'Pancuran Karya', '', '', '', '2021-06-29 15:11:47', ''),
(28, 'RUMBAI SARANA', '', '', '', '2021-06-29 15:11:56', ''),
(29, 'Tokopedia', '', '', '', '2021-06-29 15:11:59', ''),
(30, 'Warna Jaya', '', '', '', '2021-06-29 15:12:02', ''),
(31, 'HARAPAN KARYA', '', '', '', '2021-06-29 15:12:11', ''),
(32, 'KGS Digital Printing', '', '', '', '2021-06-29 15:12:15', ''),
(33, 'YSA Weldindo Teknik', '', '', '', '2021-06-29 15:12:23', ''),
(34, 'DISPERINDAG PEKANBARU UPT LOGAM', '', '', '', '2021-06-29 15:12:40', ''),
(35, 'MTR / METROPOLITAN', '', '', '', '2021-07-07 09:30:20', ''),
(36, 'KARYA ABADI', '', '', '', '2021-06-29 15:13:06', ''),
(37, 'HORAS /DPN IBIS', '', '', '', '2021-06-29 15:13:22', ''),
(40, 'test', '', '', '', '2021-07-14 14:12:15', '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `iip`
--
ALTER TABLE `iip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `ilogin`
--
ALTER TABLE `ilogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `mid` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
