-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jul 2020 pada 06.46
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pemin_alat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `kelas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `password`, `kelas`) VALUES
(1, 'aisyah', 'aisyah', '3E - JTD'),
(2, 'hamzah', 'hamzah', '3E - JTD'),
(3, 'nella', 'nella', '3E - JTD'),
(8, 'coba', 'coba', '3E - JTD'),
(9, 'halo', 'halo', '3D - TT');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jenis_brg` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stok_brg` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_brg`, `nama_brg`, `jenis_brg`, `stok_brg`, `foto`) VALUES
(1, 'Oscilloscope', 'elektronik', '5', 'osiloskop.jpg'),
(2, 'Power Supply', 'elektronik', '4', 'psu.jpg'),
(3, 'Multimeter Analog', 'elektronik', '10', 'multimeteranalog.jpg'),
(4, 'Multimeter Digital', 'elektronik', '10', 'multimeterdigital.jpg'),
(5, 'Kabel Banana to Banana', 'kabel', '10', 'bananatobanana.jpeg'),
(6, 'Kabel BNC to Banana', 'kabel', '10', 'bnctobanana.jpg'),
(7, 'Kabel BNC to BNC', 'kabel', '10', 'bnctobnc.jpg'),
(8, 'Kabel Power', 'kabel', '10', 'kabelpower.jpg'),
(9, 'LCD Proyektor', 'elektronik', '5', 'lcd.jpg'),
(10, 'Probe Oscilloscope', 'kabel', '5', 'probeosiloskop.jpg'),
(11, 'Protoboard', 'peralatan', '10', 'protoboard.jpg'),
(12, 'Generator Fungsi', 'elektronik', '5', 'generatorfungsi.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(10) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `tgl_pinjam` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_brg`, `id_anggota`, `tgl_pinjam`, `status`) VALUES
(4, 1, 1, '01-July-2020', 0),
(5, 1, 1, '04-July-2020', 0),
(6, 2, 1, '2020-07-04', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengembalian`
--

INSERT INTO `pengembalian` (`id`, `id_brg`, `id_anggota`, `id_peminjaman`, `tgl_kembali`) VALUES
(3, 2, 1, 6, '2020-07-04');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_brg` (`id_brg`,`id_anggota`),
  ADD KEY `id_peminjam` (`id_anggota`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_brg_2` (`id_brg`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_brg` (`id_brg`,`id_anggota`),
  ADD KEY `id_peminjaman` (`id_peminjaman`),
  ADD KEY `id_peminjam` (`id_anggota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
