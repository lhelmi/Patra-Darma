-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Agu 2019 pada 06.38
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ja_sadewa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bidangkeahlian`
--

CREATE TABLE `bidangkeahlian` (
  `IdBk` int(11) NOT NULL,
  `NamaBk` varchar(125) NOT NULL,
  `IdPengacara` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `datapenunjang`
--

CREATE TABLE `datapenunjang` (
  `IdDP` int(11) NOT NULL,
  `Penunjang` int(11) NOT NULL,
  `File` varchar(40) NOT NULL,
  `IdMasalah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen`
--

CREATE TABLE `dokumen` (
  `IdDokumen` int(11) NOT NULL,
  `JenisDok` varchar(30) NOT NULL,
  `LamaPengerjaan` varchar(20) NOT NULL,
  `Biaya` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategorimasalah`
--

CREATE TABLE `kategorimasalah` (
  `IdKategori` int(11) NOT NULL,
  `NamaKategori` varchar(30) NOT NULL,
  `JenisPerkara` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategorimasalah`
--

INSERT INTO `kategorimasalah` (`IdKategori`, `NamaKategori`, `JenisPerkara`) VALUES
(1, 'x', 'x');

-- --------------------------------------------------------

--
-- Struktur dari tabel `klien`
--

CREATE TABLE `klien` (
  `IdKlien` int(11) NOT NULL,
  `NamaKlien` varchar(100) NOT NULL,
  `EmailKlien` varchar(100) NOT NULL,
  `JkKlien` enum('L','P') NOT NULL,
  `NoTelpKlien` varchar(20) NOT NULL,
  `AlamatKlien` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `konsultasi`
--

CREATE TABLE `konsultasi` (
  `IdMasalah` int(11) NOT NULL,
  `Keterangan` text NOT NULL,
  `IdKlien` int(11) NOT NULL,
  `IdKategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notif`
--

CREATE TABLE `notif` (
  `IdNotif` int(11) NOT NULL,
  `Deskripsi` text NOT NULL,
  `Waktu` datetime NOT NULL,
  `BacaKlien` enum('0','1') NOT NULL,
  `BacaPengacara` enum('0','1') NOT NULL,
  `IdPengacara` int(11) NOT NULL,
  `IdKlien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengacara`
--

CREATE TABLE `pengacara` (
  `IdPengacara` int(11) NOT NULL,
  `NamaPengacara` varchar(125) NOT NULL,
  `Email` varchar(125) NOT NULL,
  `NoHp` varchar(13) NOT NULL,
  `Jk` enum('L','P') NOT NULL,
  `Foto` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `pendidikan` varchar(255) NOT NULL,
  `pengalaman` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanandokumen`
--

CREATE TABLE `pesanandokumen` (
  `IdPesDok` int(11) NOT NULL,
  `IdDokumen` int(11) NOT NULL,
  `IdKlien` int(11) NOT NULL,
  `Keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bidangkeahlian`
--
ALTER TABLE `bidangkeahlian`
  ADD PRIMARY KEY (`IdBk`);

--
-- Indeks untuk tabel `datapenunjang`
--
ALTER TABLE `datapenunjang`
  ADD PRIMARY KEY (`IdDP`);

--
-- Indeks untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  ADD PRIMARY KEY (`IdDokumen`);

--
-- Indeks untuk tabel `kategorimasalah`
--
ALTER TABLE `kategorimasalah`
  ADD PRIMARY KEY (`IdKategori`);

--
-- Indeks untuk tabel `klien`
--
ALTER TABLE `klien`
  ADD PRIMARY KEY (`IdKlien`);

--
-- Indeks untuk tabel `konsultasi`
--
ALTER TABLE `konsultasi`
  ADD PRIMARY KEY (`IdMasalah`);

--
-- Indeks untuk tabel `notif`
--
ALTER TABLE `notif`
  ADD PRIMARY KEY (`IdNotif`);

--
-- Indeks untuk tabel `pengacara`
--
ALTER TABLE `pengacara`
  ADD PRIMARY KEY (`IdPengacara`);

--
-- Indeks untuk tabel `pesanandokumen`
--
ALTER TABLE `pesanandokumen`
  ADD PRIMARY KEY (`IdPesDok`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bidangkeahlian`
--
ALTER TABLE `bidangkeahlian`
  MODIFY `IdBk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `datapenunjang`
--
ALTER TABLE `datapenunjang`
  MODIFY `IdDP` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  MODIFY `IdDokumen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategorimasalah`
--
ALTER TABLE `kategorimasalah`
  MODIFY `IdKategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `klien`
--
ALTER TABLE `klien`
  MODIFY `IdKlien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `konsultasi`
--
ALTER TABLE `konsultasi`
  MODIFY `IdMasalah` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `notif`
--
ALTER TABLE `notif`
  MODIFY `IdNotif` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengacara`
--
ALTER TABLE `pengacara`
  MODIFY `IdPengacara` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pesanandokumen`
--
ALTER TABLE `pesanandokumen`
  MODIFY `IdPesDok` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
