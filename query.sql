-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2020 at 09:02 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas_kapita`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `Id` varchar(50) NOT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL,
  `Harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`Id`, `Nama`, `Stok`, `Harga`) VALUES
('K01', 'Keripik_Maicih', 2, 20000),
('K02', 'Keripik_Karuhun', 7, 15000),
('S01', 'Sus_Kering_Coklat', 11, 60000),
('S02', 'Sus_Kering_Strawberry', 11, 60000),
('S03', 'Sus_Kering_Nanas', 3, 60000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `Id` int(11) NOT NULL,
  `jml_barang` int(30) NOT NULL,
  `Id_Transaksi` int(11) NOT NULL,
  `id_barang` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`Id`, `jml_barang`, `Id_Transaksi`, `id_barang`) VALUES
(1, 5, 515, 'K01'),
(2, 1, 520, 'K01'),
(3, 1, 520, 'S01'),
(4, 2, 525, 'S03'),
(5, 3, 605, 'S02'),
(6, 1, 617, 'S01');

--
-- Triggers `detail_transaksi`
--
DELIMITER $$
CREATE TRIGGER `penjualan` AFTER INSERT ON `detail_transaksi` FOR EACH ROW BEGIN
UPDATE barang SET stok=stok-new.jml_barang
WHERE Id=new.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `tgl_transaksi`) VALUES
(515, '2020-05-15'),
(520, '2020-05-20'),
(525, '2020-05-25'),
(605, '2020-06-05'),
(617, '2020-06-17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
