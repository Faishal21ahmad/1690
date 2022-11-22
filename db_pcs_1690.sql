-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2022 at 03:42 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pcs_1690`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `nama`) VALUES
(43, 'dondon@amikom.ac.id', '827ccb0eea8a706c4c34a16891f84e7b', 'donni'),
(44, 'dondon@amikom.ac.id', '827ccb0eea8a706c4c34a16891f84e7b', 'donni'),
(45, 'halo@a.com', '827ccb0eea8a706c4c34a16891f84e7b', 'donni'),
(46, 'halo@a.com', '827ccb0eea8a706c4c34a16891f84e7b', 'donni'),
(47, 'dodi@amikom.ac.id', '827ccb0eea8a706c4c34a16891f84e7b', 'Dodi'),
(48, 'dodi@', '827ccb0eea8a706c4c34a16891f84e7b', 'Dodi'),
(49, 'don49@amikom.ac.id', '827ccb0eea8a706c4c34a16891f84e7b', 'Dodi'),
(57, 'xyz5swsw@amikom.ac.id', 'ae8b5aa26a3ae31612eec1d1f6ffbce9', 'sww'),
(59, 'csxyz5@amikom.ac.id', 'e6eeed7f31a3d075dc454d4a6a80b381', 'XYZcs'),
(60, 'csxyz5@amikom.ac.id', 'e6eeed7f31a3d075dc454d4a6a80b381', 'XYZcs');

-- --------------------------------------------------------

--
-- Table structure for table `item_transaksi`
--

CREATE TABLE `item_transaksi` (
  `id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_saat_transaksi` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_transaksi`
--

INSERT INTO `item_transaksi` (`id`, `transaksi_id`, `produk_id`, `qty`, `harga_saat_transaksi`, `sub_total`) VALUES
(16, 10, 12, 2, 10000, 20000),
(17, 10, 13, 7, 60000, 420000),
(18, 10, 14, 2, 2000, 4000),
(35, 26, 25, 6, 60000, 360000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `admin_id`, `nama`, `harga`, `stok`) VALUES
(12, 43, 'Bakso', 10000, 89),
(13, 47, 'Mia Ayam Bakso', 8500, 1),
(14, 43, 'Es Teh', 2000, -6),
(17, 44, 'Ayam Bajak Laut', 10000, 93),
(19, 44, 'Bakso Bajak Laut', 15000, 47),
(22, 60, 'ayam bakar', 10000, 100),
(23, 60, 'ayam panggang', 15000, 100),
(24, 60, 'ayam kuali', 15000, 94),
(25, 60, 'ayam tiren', 15000, 94),
(26, 60, 'bakso bakar asep', 15000, 100);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `admin_id`, `tanggal`, `total`) VALUES
(9, 43, '2021-12-28 07:45:36', 52000),
(10, 43, '2021-12-28 08:17:06', 40000),
(11, 43, '2021-12-28 08:22:22', 54000),
(12, 43, '2022-01-04 01:30:58', 39000),
(13, 43, '2022-01-04 01:33:24', 45000),
(14, 44, '2022-11-19 14:32:45', 200000),
(15, 44, '2022-11-19 14:33:19', 200000),
(16, 44, '2022-11-19 14:35:24', 200000),
(23, 60, '2022-11-20 15:08:28', 500000),
(24, 59, '2022-11-20 15:08:49', 400000),
(25, 57, '2022-11-20 15:09:00', 200000),
(26, 60, '2022-11-21 00:58:14', 200000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_transaksi`
--
ALTER TABLE `item_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_item_transaksi_produk_id` (`produk_id`),
  ADD KEY `fk_transaksi_id` (`transaksi_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_admin_id` (`admin_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_transaksi_admin_id` (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `item_transaksi`
--
ALTER TABLE `item_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_transaksi`
--
ALTER TABLE `item_transaksi`
  ADD CONSTRAINT `fk_item_transaksi_produk_id` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`),
  ADD CONSTRAINT `fk_transaksi_id` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_transaksi_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
