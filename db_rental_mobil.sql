-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2018 at 08:50 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_rental_mobil`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE IF NOT EXISTS `tb_admin` (
  `id_admin` varchar(4) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `username`, `password`) VALUES
('', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_login`
--

CREATE TABLE IF NOT EXISTS `tb_login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mobil`
--

CREATE TABLE IF NOT EXISTS `tb_mobil` (
  `id_mobil` varchar(4) NOT NULL,
  `nama_mobil` varchar(10) DEFAULT NULL,
  `merek_mobil` varchar(11) DEFAULT NULL,
  `bm_mobil` varchar(4) DEFAULT NULL,
  `harga_rental` bigint(7) DEFAULT NULL,
  `status` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_mobil`
--

INSERT INTO `tb_mobil` (`id_mobil`, `nama_mobil`, `merek_mobil`, `bm_mobil`, `harga_rental`, `status`) VALUES
('A001', 'New Avanza', 'Toyota', '3242', 500000, 'NOTREADY'),
('A002', 'CRV', 'Honda', '2134', 500000, 'NOTREADY'),
('A003', 'Rang Rover', 'Mitshubishi', '4622', 500000, 'NOTREADY'),
('A004', 'Xenia', 'Daihatsu', '3251', 500000, 'NOTREADY'),
('A005', 'SX4', 'SUZUKI', '3324', 500000, 'NOTREADY');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengembalian`
--

CREATE TABLE IF NOT EXISTS `tb_pengembalian` (
  `id_pengembalian` varchar(4) NOT NULL,
  `id_rental` varchar(4) DEFAULT NULL,
  `id_penyewa` varchar(4) DEFAULT NULL,
  `id_mobil` varchar(4) DEFAULT NULL,
  `tgl_rental` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `lama` bigint(3) DEFAULT NULL,
  `total_bayar` bigint(8) DEFAULT NULL,
  `status` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengembalian`
--

INSERT INTO `tb_pengembalian` (`id_pengembalian`, `id_rental`, `id_penyewa`, `id_mobil`, `tgl_rental`, `tgl_kembali`, `lama`, `total_bayar`, `status`) VALUES
('1', '2', 'A005', '2', '2018-02-14', '2018-02-15', 2, 1000000, 'KEMBALI');

-- --------------------------------------------------------

--
-- Table structure for table `tb_penyewa`
--

CREATE TABLE IF NOT EXISTS `tb_penyewa` (
  `id_penyewa` varchar(4) NOT NULL,
  `nama_penyewa` varchar(25) DEFAULT NULL,
  `alamat` varchar(25) DEFAULT NULL,
  `no_hp` varchar(12) DEFAULT NULL,
  `no_ktp` varchar(16) DEFAULT NULL,
  `status` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penyewa`
--

INSERT INTO `tb_penyewa` (`id_penyewa`, `nama_penyewa`, `alamat`, `no_hp`, `no_ktp`, `status`) VALUES
('1', 'Budi', 'Malang', '085xx', '123456', 'NOTREADY'),
('2', 'Aldi', 'malang', '089', '1234', 'NOTREADY');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rental`
--

CREATE TABLE IF NOT EXISTS `tb_rental` (
  `id_rental` varchar(4) NOT NULL,
  `id_penyewa` varchar(4) DEFAULT NULL,
  `id_mobil` varchar(4) DEFAULT NULL,
  `nama_penyewa` varchar(25) DEFAULT NULL,
  `nama_mobil` varchar(10) DEFAULT NULL,
  `harga_rental` bigint(7) DEFAULT NULL,
  `tgl_rental` date DEFAULT NULL,
  `status` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rental`
--

INSERT INTO `tb_rental` (`id_rental`, `id_penyewa`, `id_mobil`, `nama_penyewa`, `nama_mobil`, `harga_rental`, `tgl_rental`, `status`) VALUES
('1', 'A003', '1', 'Budi', 'Rang Rover', 500000, '2018-02-05', 'SELESAI'),
('2', 'A001', '2', 'Aldi', 'New Avanza', 500000, '2018-02-13', 'SEWA'),
('3', 'A004', '1', 'Budi', 'Xenia', 500000, '2018-02-14', 'SEWA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
 ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_login`
--
ALTER TABLE `tb_login`
 ADD PRIMARY KEY (`password`);

--
-- Indexes for table `tb_mobil`
--
ALTER TABLE `tb_mobil`
 ADD PRIMARY KEY (`id_mobil`);

--
-- Indexes for table `tb_pengembalian`
--
ALTER TABLE `tb_pengembalian`
 ADD PRIMARY KEY (`id_pengembalian`);

--
-- Indexes for table `tb_penyewa`
--
ALTER TABLE `tb_penyewa`
 ADD PRIMARY KEY (`id_penyewa`);

--
-- Indexes for table `tb_rental`
--
ALTER TABLE `tb_rental`
 ADD PRIMARY KEY (`id_rental`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
