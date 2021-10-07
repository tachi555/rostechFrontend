CREATE DATABASE `rostech` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

CREATE TABLE `harga` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(15) NOT NULL,
  `tid` int(15) NOT NULL,
  `tanggal` date NOT NULL,
  `persatuan` int(15) NOT NULL,
  `jumlah` int(15) NOT NULL,
  `total` int(15) NOT NULL,
  `ket` varchar(255) NOT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `iip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL,
  `tanggal` date NOT NULL,
  `token` varchar(126) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `ilogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) NOT NULL,
  `pass` varchar(25) NOT NULL,
  `tanggal` date NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `material` (
  `mid` int(15) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `ukuran` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(7) NOT NULL,
  `total` int(7) NOT NULL,
  `ket` varchar(255) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `toko` (
  `tid` int(15) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `contact` varchar(35) NOT NULL,
  `telpon` varchar(15) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


