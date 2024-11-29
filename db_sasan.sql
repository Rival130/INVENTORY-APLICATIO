-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Mar 2024 pada 01.27
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sasan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `sasan`
--

CREATE TABLE `sasan` (
  `id_sasan` varchar(10) NOT NULL,
  `naran_sasan` varchar(50) NOT NULL,
  `folin` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `total_folin` int(11) NOT NULL,
  `naran_supplier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sasan`
--

INSERT INTO `sasan` (`id_sasan`, `naran_sasan`, `folin`, `stok`, `total_folin`, `naran_supplier`) VALUES
('S-1', 'A', 1, -1, 2, 'A'),
('S-4', 'LEMON', 1, 20, 25, 'LDA LEMON');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sasan_sai`
--

CREATE TABLE `sasan_sai` (
  `id_ss` varchar(10) NOT NULL,
  `id_sasan` varchar(10) NOT NULL,
  `data_sai` varchar(100) NOT NULL,
  `kuantidade_sasan` int(11) NOT NULL,
  `naran_kliente` varchar(110) NOT NULL,
  `enderesu_kliente` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sasan_sai`
--

INSERT INTO `sasan_sai` (`id_ss`, `id_sasan`, `data_sai`, `kuantidade_sasan`, `naran_kliente`, `enderesu_kliente`) VALUES
('SS-1', 'S-2', 'Wed Dec 20 14:25:45 TLT 2023', 2, 'noel', 'fomento'),
('SS-2', 'S-1', 'Thu Dec 28 10:17:12 TLT 2023', 1, 'a', 'a'),
('ss-3', 'S-1', 'Fri Dec 29 10:18:11 TLT 2023', 2, 'S', 'S'),
('SS-Y', 'S-2', 'Thu Dec 28 10:36:48 TLT 2023', 10, 'AS', 'SS');

--
-- Trigger `sasan_sai`
--
DELIMITER $$
CREATE TRIGGER `faanstok` AFTER INSERT ON `sasan_sai` FOR EACH ROW BEGIN
	UPDATE sasan SET stok = stok - NEW.kuantidade_sasan WHERE id_sasan = NEW.id_sasan;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sasan_tama`
--

CREATE TABLE `sasan_tama` (
  `id_st` varchar(10) NOT NULL,
  `id_sasan` varchar(10) NOT NULL,
  `data_tama` varchar(100) NOT NULL,
  `kuantidade_sasan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sasan_tama`
--

INSERT INTO `sasan_tama` (`id_st`, `id_sasan`, `data_tama`, `kuantidade_sasan`) VALUES
('SS-1', 'S-4', 'Thu Dec 28 08:45:57 TLT 2023', 5);

--
-- Trigger `sasan_tama`
--
DELIMITER $$
CREATE TRIGGER `AumentaStok` AFTER INSERT ON `sasan_tama` FOR EACH ROW BEGIN
	UPDATE sasan SET stok = stok + NEW.kuantidade_sasan 	WHERE id_sasan = NEW.id_sasan;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` varchar(255) NOT NULL,
  `naran_user` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `naran_user`, `username`, `password`, `level`) VALUES
('1', 'Rivaldo Assis', 'rivaldo', 'rivaldo', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `sasan`
--
ALTER TABLE `sasan`
  ADD PRIMARY KEY (`id_sasan`);

--
-- Indeks untuk tabel `sasan_sai`
--
ALTER TABLE `sasan_sai`
  ADD PRIMARY KEY (`id_ss`);

--
-- Indeks untuk tabel `sasan_tama`
--
ALTER TABLE `sasan_tama`
  ADD PRIMARY KEY (`id_st`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
