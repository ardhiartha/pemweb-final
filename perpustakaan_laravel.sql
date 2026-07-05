-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2026 at 08:06 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_anggota` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `pekerjaan` varchar(50) DEFAULT NULL,
  `tanggal_daftar` date NOT NULL,
  `status` enum('Aktif','Nonaktif') NOT NULL DEFAULT 'Aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `kode_anggota`, `nama`, `email`, `telepon`, `alamat`, `tanggal_lahir`, `jenis_kelamin`, `pekerjaan`, `tanggal_daftar`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AGT-001', 'Budi Santoso', 'budi.santoso@email.com', '081234567890', 'Jl. Merdeka No. 10, Jakarta Pusat', '1995-05-15', 'Laki-laki', 'Mahasiswa', '2024-01-10', 'Aktif', '2026-05-25 06:59:17', '2026-05-25 06:59:17'),
(2, 'AGT-002', 'Siti Nurhaliza', 'siti.nur@email.com', '081234567891', 'Jl. Sudirman No. 25, Bandung', '1998-08-20', 'Perempuan', 'Pegawai Swasta', '2024-01-15', 'Aktif', '2026-05-25 06:59:17', '2026-05-25 06:59:17'),
(3, 'AGT-003', 'Ahmad Dhani', 'ahmad.dhani@email.com', '081234567892', 'Jl. Gatot Subroto No. 5, Surabaya', '1992-03-10', 'Laki-laki', 'Dosen', '2024-02-01', 'Aktif', '2026-05-25 06:59:17', '2026-05-25 06:59:17'),
(4, 'AGT-004', 'Dewi Lestari', 'dewi.lestari@email.com', '081234567893', 'Jl. Ahmad Yani No. 30, Yogyakarta', '2000-12-05', 'Perempuan', 'Mahasiswa', '2024-02-10', 'Aktif', '2026-05-25 06:59:17', '2026-05-25 06:59:17'),
(5, 'AGT-005', 'Rizky Febian', 'rizky.feb@email.com', '081234567894', 'Jl. Diponegoro No. 15, Semarang', '1997-07-18', 'Laki-laki', 'Wiraswasta', '2023-12-15', 'Nonaktif', '2026-05-25 06:59:17', '2026-05-25 06:59:17'),
(7, 'AGT-2026-006', 'Karunia Raharjo', 'karuniaraharjo06@gmail.com', '081234567890', 'Tegalsari\r\nKandeman', '2006-08-27', 'Laki-laki', 'Mahasiswa', '2026-06-14', 'Aktif', '2026-06-13 23:17:49', '2026-06-13 23:17:49');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_buku` varchar(20) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `kategori` enum('Programming','Database','Web Design','Networking','Data Science') NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `negara_penerbit` varchar(50) DEFAULT NULL,
  `kota_penerbit` varchar(50) DEFAULT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `deskripsi` text DEFAULT NULL,
  `bahasa` varchar(20) NOT NULL DEFAULT 'Indonesia',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `kode_buku`, `judul`, `kategori`, `pengarang`, `penerbit`, `negara_penerbit`, `kota_penerbit`, `tahun_terbit`, `isbn`, `harga`, `stok`, `deskripsi`, `bahasa`, `created_at`, `updated_at`) VALUES
(1, 'BK-001', 'Laravel 12 untuk Pemula', 'Programming', 'John Doe', 'Tech Publisher', NULL, NULL, 2024, '978-602-1234-56-1', '150000.00', 20, 'Buku panduan lengkap Laravel 12 dari dasar hingga mahir', 'Indonesia', '2026-05-25 06:59:17', '2026-06-22 19:10:53'),
(2, 'BK-002', 'MySQL Advanced Techniques', 'Database', 'Jane Smith', 'Data Press', NULL, NULL, 2023, '978-602-1234-56-2', '175000.00', 15, 'Teknik advanced untuk optimasi MySQL database', 'Inggris', '2026-05-25 06:59:17', '2026-06-22 19:19:12'),
(3, 'BK-003', 'Modern Web Design', 'Web Design', 'Ahmad Yani', 'Creative Media', NULL, NULL, 2024, '978-602-1234-56-3', '120000.00', 25, 'Prinsip dan praktik desain web modern', 'Indonesia', '2026-05-25 06:59:17', '2026-05-25 06:59:17'),
(4, 'BK-004', 'Network Security Fundamentals', 'Networking', 'Robert Johnson', 'Security Press', NULL, NULL, 2023, '978-602-1234-56-4', '200000.00', 10, 'Dasar-dasar keamanan jaringan komputer', 'Inggris', '2026-05-25 06:59:17', '2026-06-25 01:02:08'),
(5, 'BK-005', 'Data Science dengan Python', 'Data Science', 'Siti Nurhaliza', 'Analytics Publisher', NULL, NULL, 2024, '978-602-1234-56-5', '180000.00', 18, 'Panduan praktis data science menggunakan Python', 'Indonesia', '2026-05-25 06:59:17', '2026-06-22 19:06:51'),
(6, 'BK-006', 'PHP 8 Programming', 'Programming', 'Budi Raharjo', 'Code House', NULL, NULL, 2023, '978-602-1234-56-6', '130000.00', 0, 'Fitur-fitur terbaru PHP 8', 'Indonesia', '2026-05-25 06:59:17', '2026-05-25 06:59:17'),
(7, 'BK-007', 'PostgreSQL Administration', 'Database', 'David Wilson', 'Database Pro', NULL, NULL, 2024, '978-602-1234-56-7', '195000.00', 12, 'Administrasi dan optimasi PostgreSQL', 'Inggris', '2026-05-25 06:59:17', '2026-06-24 02:18:56'),
(8, 'BK-008', 'React & Next.js Development', 'Programming', 'Sarah Anderson', 'Frontend Press', NULL, NULL, 2024, '978-602-1234-56-8', '165000.00', 22, 'Membangun aplikasi modern dengan React dan Next.js', 'Inggris', '2026-05-25 06:59:17', '2026-05-25 06:59:17'),
(11, 'BK-TEST-001', 'Testing Laravel CRUD', 'Programming', 'John Doe', 'tes', NULL, NULL, 2024, NULL, '1700000.00', 20, NULL, 'Indonesia', '2026-06-07 08:21:08', '2026-06-07 08:30:52');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `warna` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`, `deskripsi`, `icon`, `warna`, `created_at`, `updated_at`) VALUES
(1, 'Programming', 'Buku tentang programming', 'code-slash', 'primary', '2026-05-25 06:59:17', '2026-05-25 06:59:17'),
(2, 'Database', 'Buku tentang database', 'database', 'success', '2026-05-25 06:59:17', '2026-05-25 06:59:17'),
(3, 'Web Design', 'Buku tentang desain web', 'palette', 'info', '2026-05-25 06:59:17', '2026-05-25 06:59:17'),
(4, 'Networking', 'Buku tentang jaringan', 'wifi', 'warning', '2026-05-25 06:59:17', '2026-05-25 06:59:17'),
(5, 'Data Science', 'Buku tentang data science', 'graph-up', 'danger', '2026-05-25 06:59:17', '2026-05-25 06:59:17');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_05_19_020436_create_buku_table', 1),
(5, '2026_05_19_021134_create_anggota_table', 1),
(6, '2026_05_19_024734_add_penerbit_detail_to_buku_table', 1),
(7, '2026_05_23_000000_create_kategori_table', 1),
(8, '2026_06_20_040710_create_transaksis_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('WUDFRzlTiRlHyw8YLjlkPYOKgV3hEs5MXyOw1LD0', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJTbktXRWZEc1hWR2I0QmhLUG00M3pyMzl1Zmh4VjN0aXpRRDdNV1M4IiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwMDBcL3RyYW5zYWtzaSIsInJvdXRlIjoidHJhbnNha3NpLmluZGV4In0sInVybCI6W10sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoyfQ==', 1782374712);

-- --------------------------------------------------------

--
-- Table structure for table `transaksis`
--

CREATE TABLE `transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_transaksi` varchar(20) NOT NULL,
  `anggota_id` bigint(20) UNSIGNED NOT NULL,
  `buku_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `tanggal_dikembalikan` date DEFAULT NULL,
  `status` enum('Dipinjam','Dikembalikan') NOT NULL DEFAULT 'Dipinjam',
  `denda` int(11) NOT NULL DEFAULT 0,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksis`
--

INSERT INTO `transaksis` (`id`, `kode_transaksi`, `anggota_id`, `buku_id`, `tanggal_pinjam`, `tanggal_kembali`, `tanggal_dikembalikan`, `status`, `denda`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'TRX-001', 3, 5, '2026-06-20', '2026-06-27', '2026-06-23', 'Dikembalikan', 0, NULL, '2026-06-19 21:39:38', '2026-06-22 19:06:51'),
(2, 'TRX-002', 7, 1, '2026-06-15', '2026-06-22', '2026-06-23', 'Dikembalikan', 5454, NULL, '2026-06-22 19:09:06', '2026-06-22 19:10:53'),
(3, 'TRX-003', 1, 2, '2026-06-09', '2026-06-16', '2026-06-23', 'Dikembalikan', 35000, NULL, '2026-06-22 19:18:50', '2026-06-22 19:19:12'),
(4, 'TRX-004', 4, 4, '2026-06-01', '2026-06-08', '2026-06-24', 'Dikembalikan', 80000, NULL, '2026-06-22 19:43:25', '2026-06-24 02:10:27'),
(5, 'TRX-005', 2, 7, '2026-06-05', '2026-06-12', '2026-06-24', 'Dikembalikan', 60000, NULL, '2026-06-24 02:18:01', '2026-06-24 02:18:56'),
(6, 'TRX-006', 4, 4, '2026-06-25', '2026-07-02', '2026-06-25', 'Dikembalikan', 0, NULL, '2026-06-25 01:01:02', '2026-06-25 01:02:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Perpustakaan', 'admin@perpustakaan.com', NULL, '$2y$12$7JJVw01EOuMUtlPRtZ6vQODwlT0C8.jc4SwOVUtX1Bm.ApxExhcqe', 'Anp7JfYDATWBX7BX8S7Mw6eaY3fBRg4sNwXHusCPaePkDMFA6rIbyoka6Ozk', '2026-06-17 23:58:47', '2026-06-17 23:58:47'),
(2, 'Arun', 'karuniaraharjo06@gmail.com', NULL, '$2y$12$FYpLqaAfp0A5OqLp0Zy9Bedmaf0bixX3RT47znamXr/.9J4O8Ye0S', 'QwyWoHT9BOHH4BnjoeaB49mqjwWPfgtk4VYULhQ2EFQaBfwSAmbVYhLFUBjs', '2026-06-24 07:11:45', '2026-06-24 07:11:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `anggota_kode_anggota_unique` (`kode_anggota`),
  ADD UNIQUE KEY `anggota_email_unique` (`email`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buku_kode_buku_unique` (`kode_buku`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kategori_nama_kategori_unique` (`nama_kategori`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaksis_kode_transaksi_unique` (`kode_transaksi`),
  ADD KEY `transaksis_anggota_id_foreign` (`anggota_id`),
  ADD KEY `transaksis_buku_id_foreign` (`buku_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD CONSTRAINT `transaksis_anggota_id_foreign` FOREIGN KEY (`anggota_id`) REFERENCES `anggota` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaksis_buku_id_foreign` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
