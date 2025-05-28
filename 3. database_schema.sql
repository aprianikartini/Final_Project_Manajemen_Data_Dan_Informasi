-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2025 at 05:49 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_indomaret`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail_transaksi` varchar(64) NOT NULL,
  `jmlh_produk` int(64) NOT NULL,
  `jmlh_harga` int(64) NOT NULL,
  `id_transaksi` varchar(64) NOT NULL,
  `id_produk` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail_transaksi`, `jmlh_produk`, `jmlh_harga`, `id_transaksi`, `id_produk`) VALUES
('DT001', 1, 45000, 'BM2L', 'T10112'),
('DT002', 1, 3800, 'MN114', 'T10112'),
('DT003', 2, 42000, 'BM52', 'T10112'),
('DT004', 2, 10200, 'BM5G', 'T20112'),
('DT005', 3, 25800, 'K85N', 'T20112'),
('DT006', 2, 52000, 'MK01', 'T30112'),
('DT007', 3, 15000, 'MK05', 'T10212'),
('DT008', 1, 9500, 'MN112', 'T10212'),
('DT009', 2, 30000, 'MN113', 'T10212'),
('DT010', 3, 93000, 'CL100ACW', 'T10312'),
('DT011', 4, 52000, 'MK02', 'T10312'),
('DT012', 2, 38000, 'K12IT', 'T10412'),
('DT013', 1, 8800, 'KOS002', 'T20412'),
('DT014', 2, 62000, 'CL100ACW', 'T20412'),
('DT015', 2, 7200, 'MN111', 'T30412'),
('DT016', 2, 14800, 'MN115', 'T30412'),
('DT017', 3, 15300, 'BM5G', 'T40412'),
('DT018', 1, 15000, 'MN113', 'T40412'),
('DT019', 1, 14900, 'K30M', 'T10512'),
('DT020', 3, 78000, 'MK01', 'T10512');

--
-- Triggers `detail_transaksi`
--
DELIMITER $$
CREATE TRIGGER `triggertotal` AFTER INSERT ON `detail_transaksi` FOR EACH ROW BEGIN
UPDATE transaksi SET transaksi.total_harga = NEW.jmlh_harga + transaksi.total_harga
WHERE NEW.id_transaksi = transaksi.id_transaksi;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `triggertotalhapus` AFTER DELETE ON `detail_transaksi` FOR EACH ROW BEGIN
UPDATE transaksi SET transaksi.total_harga = transaksi.total_harga - OLD.jmlh_harga
WHERE OLD.id_transaksi = transaksi.id_transaksi;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `triggertotalupdate` AFTER UPDATE ON `detail_transaksi` FOR EACH ROW BEGIN
UPDATE transaksi SET transaksi.total_harga = NEW.jmlh_harga + (transaksi.total_harga - OLD.jmlh_harga)
WHERE NEW.id_transaksi = transaksi.id_transaksi;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` varchar(64) NOT NULL,
  `nama_karyawan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`) VALUES
('K001', 'Nandini'),
('K002', 'Surya'),
('K003', 'Putri'),
('K004', 'Regina'),
('K005', 'Gibran');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_produk`
--

CREATE TABLE `kategori_produk` (
  `id_kategori_produk` varchar(64) NOT NULL,
  `nama_kategori_produk` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_produk`
--

INSERT INTO `kategori_produk` (`id_kategori_produk`, `nama_kategori_produk`) VALUES
('P1', 'Makanan'),
('P2', 'Minuman'),
('P3', 'Kosmetik'),
('P4', 'Bahan Dapur'),
('P5', 'Kebersihan'),
('P6', 'Kesehatan');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` varchar(64) NOT NULL,
  `nama_produk` varchar(64) NOT NULL,
  `harga_satuan` int(64) NOT NULL,
  `stok_produk` int(64) NOT NULL,
  `id_kategori_produk` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_satuan`, `stok_produk`, `id_kategori_produk`) VALUES
('BM23KS', 'Royco Kaldu Sapi 230g', 14, 11500, 'P4'),
('BM2L', 'Filma Minyak Goreng 2L', 72, 45000, 'P4'),
('BM52', 'Bango Kecap Manis 520ml', 22, 21000, 'P4'),
('BM5G', 'Indomaret Garam 500g', 9, 5100, 'P4'),
('CL100ACW', 'Acnes Creamy Wash 100g', 27, 31000, 'P5'),
('CL450L', 'Lifebuoy Sabun Mandi 450ml', 24, 32500, 'P5'),
('CL51', 'Sunliqht 510ml', 11, 9500, 'P5'),
('CL55', 'Rinso Cair 565ml', 21, 15000, 'P5'),
('K00N', 'Hansaplast', 20, 6200, 'P6'),
('K12IT', 'Imboost Tablet', 10, 19000, 'P6'),
('K30M', 'Cap Lang Minyak Kayu Putih30ml', 7, 14900, 'P6'),
('K85N', 'Nuvo Handsanitizer 85ml', 36, 8600, 'P6'),
('KOS001', 'Maybelline Mascara Hypercurl', 6, 83700, 'P3'),
('KOS002', 'Viva Milk Cleanser Bengkoang 100ml', 17, 8800, 'P3'),
('MK01', 'Silverqueen Chunky Bar 95g', 50, 26000, 'P1'),
('MK02', 'Chitato', 77, 13000, 'P1'),
('MK03', 'Oreo', 88, 8000, 'P1'),
('MK04', 'Biskuat', 54, 6000, 'P1'),
('MK05', 'Sari Roti', 15, 5000, 'P1'),
('MN111', 'Aqua 600ml', 144, 3600, 'P2'),
('MN112', 'Yakult', 120, 9500, 'P2'),
('MN113', 'Coca-Cola 1.5L', 25, 15000, 'P2'),
('MN114', 'Teh Pucuk 320ml', 32, 3800, 'P2'),
('MN115', 'You C 1000', 27, 7400, 'P2');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(64) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `total_harga` int(64) NOT NULL,
  `id_karyawan` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tgl_transaksi`, `total_harga`, `id_karyawan`) VALUES
('T10112', '2022-01-12', 90800, 'K003'),
('T10212', '2022-02-12', 54500, 'K001'),
('T10312', '2022-03-12', 145000, 'K004'),
('T10412', '2022-04-12', 38000, 'K001'),
('T10512', '2022-05-12', 92900, 'K003'),
('T20112', '2022-01-12', 36000, 'K005'),
('T20412', '2022-04-12', 70800, 'K002'),
('T30112', '2022-01-12', 52000, 'K005'),
('T30412', '2022-04-12', 22000, 'K002'),
('T40412', '2022-04-12', 30300, 'K001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail_transaksi`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `kategori_produk`
--
ALTER TABLE `kategori_produk`
  ADD PRIMARY KEY (`id_kategori_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori_produk` (`id_kategori_produk`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_karyawan` (`id_karyawan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
