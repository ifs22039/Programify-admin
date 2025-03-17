-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 17, 2025 at 08:43 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `progamify`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_super` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `is_super`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super@gmail.com', '$2y$10$9bVQg9stwVXv8MB8YjFeKu9U2KpQujiMpJmDfavCHuMa47nFDvASm', 1, NULL, NULL, '2025-03-13 02:40:55', '2025-03-13 02:40:55'),
(2, 'Emely Angelica Lestari', 'emeadmin@gmail.com', '$2y$10$Mxae2P2Akzt2PHmfuNfIxOzs87cXvlmrLqj99eP3LFwCbypLYXq52', 0, NULL, NULL, '2025-03-13 02:42:12', '2025-03-13 02:42:12'),
(3, 'Boy Martahan Sitorus', 'boyadmin@gmail.com', '$2y$10$qAhXbwFx2TJiJjIv0KmFxe5/Gfkw5wDuJ4DgkMAdEv6MsoSNACI2a', 0, NULL, NULL, '2025-03-13 02:42:49', '2025-03-13 02:42:49'),
(4, 'Enrico Hezkiel Sirait', 'enricoadmin@gmail.com', '$2y$10$TjI8JvxHdqoFp0KpqHs/j.nNRxttBz0VmteO52jCw5ADZCIzasX8q', 0, NULL, NULL, '2025-03-13 02:43:25', '2025-03-13 02:43:25');

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `id` bigint UNSIGNED NOT NULL,
  `lesson_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discussions`
--

INSERT INTO `discussions` (`id`, `lesson_id`, `user_id`, `title`, `content`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 'Intro', 'Apa yang dimaksud dengan syntax?', NULL, '2025-03-14 08:24:41', '2025-03-14 08:24:41'),
(2, 1, 5, 'Intro', 'Apa yang dimaksud dengan byte?', NULL, '2025-03-14 08:25:05', '2025-03-14 08:25:05'),
(3, 1, 5, 'Intro', 'Apa yang dimaksud dengan byte?', NULL, '2025-03-17 02:50:28', '2025-03-17 02:50:28'),
(4, 1, 5, 'Intro', 'Apa yang dimaksud dengan test?', NULL, '2025-03-17 02:50:34', '2025-03-17 02:50:34');

-- --------------------------------------------------------

--
-- Table structure for table `disc_replies`
--

CREATE TABLE `disc_replies` (
  `id` bigint UNSIGNED NOT NULL,
  `discussion_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic_id` bigint UNSIGNED NOT NULL,
  `lesson_id` bigint UNSIGNED NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `updated_by` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `title`, `topic_id`, `lesson_id`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Exercise I', 1, 2, 1, 1, NULL, '2025-03-13 03:46:35', '2025-03-13 03:46:35'),
(2, 'Exercise 2', 1, 3, 1, 1, NULL, '2025-03-13 03:52:27', '2025-03-13 03:52:27'),
(3, 'Exercise 3', 1, 4, 1, 1, NULL, '2025-03-13 03:55:26', '2025-03-13 03:55:26'),
(4, 'Exercise 4', 1, 5, 1, 1, NULL, '2025-03-13 04:02:12', '2025-03-13 04:02:12'),
(5, 'Exercise 5', 1, 6, 1, 1, NULL, '2025-03-13 04:05:47', '2025-03-13 04:05:47'),
(6, 'Final Exercise', 1, 7, 1, 1, NULL, '2025-03-13 04:13:17', '2025-03-13 04:13:17'),
(7, 'Exercise 1', 2, 8, 1, 1, NULL, '2025-03-13 08:22:52', '2025-03-13 08:22:52'),
(8, 'Exercise 2', 2, 9, 1, 1, NULL, '2025-03-13 08:25:19', '2025-03-13 08:31:16'),
(9, 'Exercise 3', 2, 10, 1, 1, NULL, '2025-03-13 08:28:24', '2025-03-13 08:31:35'),
(10, 'Exercise 4', 2, 11, 1, 1, NULL, '2025-03-13 08:32:08', '2025-03-13 08:32:08'),
(11, 'Exercise 5', 2, 12, 1, 1, NULL, '2025-03-13 08:33:32', '2025-03-13 08:33:32'),
(12, 'Final Exercise', 2, 12, 1, 1, NULL, '2025-03-13 08:39:07', '2025-03-13 08:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `ex_answers`
--

CREATE TABLE `ex_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  `ex_question_id` bigint UNSIGNED NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `updated_by` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ex_answers`
--

INSERT INTO `ex_answers` (`id`, `content`, `is_correct`, `ex_question_id`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '<p>&nbsp;Program terdiri dari objek yang berinteraksi satu sama lain</p>', 0, 1, 1, 1, NULL, '2025-03-13 03:47:42', '2025-03-13 03:47:42'),
(2, '<p>Program berjalan berdasarkan instruksi langkah demi langkah</p>', 1, 1, 1, 1, NULL, '2025-03-13 03:47:42', '2025-03-13 03:47:42'),
(3, '<p>Program menggunakan fungsi rekursif sebagai elemen utama</p>', 0, 1, 1, 1, NULL, '2025-03-13 03:47:42', '2025-03-13 03:47:42'),
(4, '<p>Program dikendalikan oleh aturan logika tanpa instruksi berurutan</p>', 0, 1, 1, 1, NULL, '2025-03-13 03:47:42', '2025-03-13 03:47:42'),
(9, 'false', 1, 3, 1, 1, NULL, '2025-03-13 03:53:00', '2025-03-13 03:53:00'),
(10, 'Haskell', 1, 4, 1, 1, NULL, '2025-03-13 03:53:49', '2025-03-13 03:53:49'),
(11, '<p>Prolog</p>', 1, 5, 1, 1, NULL, '2025-03-13 04:00:17', '2025-03-13 04:00:17'),
(12, '<p>SQL</p>', 1, 5, 1, 1, NULL, '2025-03-13 04:00:17', '2025-03-13 04:00:17'),
(13, '<p>C</p>', 0, 5, 1, 1, NULL, '2025-03-13 04:00:17', '2025-03-13 04:00:17'),
(14, '<p>JavaScript</p>', 0, 5, 1, 1, NULL, '2025-03-13 04:00:17', '2025-03-13 04:00:17'),
(15, '<p>Menyusun kode berdasarkan fungsi matematika<br><br></p>', 0, 6, 1, 1, NULL, '2025-03-13 04:03:11', '2025-03-13 04:03:11'),
(16, '<p>Menggunakan objek yang memiliki atribut dan metode</p>', 1, 6, 1, 1, NULL, '2025-03-13 04:03:11', '2025-03-13 04:03:11'),
(17, '<p>Menjalankan instruksi secara berurutan seperti resep masakan</p>', 0, 6, 1, 1, NULL, '2025-03-13 04:03:11', '2025-03-13 04:03:11'),
(18, '<p>Memanipulasi data secara langsung tanpa memperhatikan strukturnya</p>', 0, 6, 1, 1, NULL, '2025-03-13 04:03:11', '2025-03-13 04:03:11'),
(19, 'true', 1, 7, 1, 1, NULL, '2025-03-13 04:03:50', '2025-03-13 04:03:50'),
(20, '<p>&nbsp;Menjalankan tugas secara berurutan satu per satu</p>', 0, 8, 1, 1, NULL, '2025-03-13 04:07:17', '2025-03-13 04:07:17'),
(21, '<p>Menjalankan banyak tugas secara bersamaan</p>', 1, 8, 1, 1, NULL, '2025-03-13 04:07:17', '2025-03-13 04:07:17'),
(22, '<p>Menggunakan fungsi tanpa mengubah data secara langsung</p>', 0, 8, 1, 1, NULL, '2025-03-13 04:07:17', '2025-03-13 04:07:17'),
(23, '<p>Menjalankan kode berdasarkan aturan logika</p>', 0, 8, 1, 1, NULL, '2025-03-13 04:07:17', '2025-03-13 04:07:17'),
(24, '<p>Sistem operasi</p>', 1, 9, 1, 1, NULL, '2025-03-13 04:09:23', '2025-03-13 04:09:23'),
(25, '<p>Server web</p>', 1, 9, 1, 1, NULL, '2025-03-13 04:09:23', '2025-03-13 04:09:23'),
(26, '<p>Pengolahan database sederhana</p>', 0, 9, 1, 1, NULL, '2025-03-13 04:09:23', '2025-03-13 04:09:23'),
(27, '<p>Game multiplayer</p>', 0, 9, 1, 1, NULL, '2025-03-13 04:09:23', '2025-03-13 04:09:23'),
(28, 'false', 1, 10, 1, 1, NULL, '2025-03-13 04:11:20', '2025-03-13 04:11:20'),
(29, '<p>Prosedural</p>', 0, 11, 1, 1, NULL, '2025-03-13 04:14:44', '2025-03-13 04:14:44'),
(30, '<p>Fungsional</p>', 1, 11, 1, 1, NULL, '2025-03-13 04:14:44', '2025-03-13 04:14:44'),
(31, '<p>Berorientasi Objek</p>', 0, 11, 1, 1, NULL, '2025-03-13 04:14:44', '2025-03-13 04:14:44'),
(32, '<p>Deklaratif</p>', 0, 11, 1, 1, NULL, '2025-03-13 04:14:44', '2025-03-13 04:14:44'),
(33, 'Prolog', 1, 12, 1, 1, NULL, '2025-03-13 04:33:45', '2025-03-13 04:33:45'),
(34, 'true', 1, 13, 1, 1, NULL, '2025-03-13 04:34:24', '2025-03-13 04:34:24'),
(35, '<p>Java</p>', 1, 14, 1, 1, NULL, '2025-03-13 04:54:51', '2025-03-13 04:54:51'),
(36, '<p>Python</p>', 1, 14, 1, 1, NULL, '2025-03-13 04:54:51', '2025-03-13 04:54:51'),
(37, '<p>Fortran</p>', 0, 14, 1, 1, NULL, '2025-03-13 04:54:51', '2025-03-13 04:54:51'),
(38, '<p>C++</p>', 1, 14, 1, 1, NULL, '2025-03-13 04:54:51', '2025-03-13 04:54:51'),
(39, '<p>Prosedural</p>', 0, 15, 1, 1, NULL, '2025-03-13 06:31:01', '2025-03-13 06:31:01'),
(40, '<p>Fungsional</p>', 0, 15, 1, 1, NULL, '2025-03-13 06:31:01', '2025-03-13 06:31:01'),
(41, '<p>Deklaratif</p>', 1, 15, 1, 1, NULL, '2025-03-13 06:31:01', '2025-03-13 06:31:01'),
(42, '<p>Konkruen</p>', 0, 15, 1, 1, NULL, '2025-03-13 06:31:01', '2025-03-13 06:31:01'),
(43, '<p>Paradigma <strong>konkuren</strong> memungkinkan eksekusi banyak tugas secara bersamaan, meningkatkan efisiensi dan kecepatan sistem. Dalam server web dan game multiplayer, banyak permintaan harus diproses serentak agar pengguna tidak mengalami keterlambatan.</p>', 0, 16, 1, 1, NULL, '2025-03-13 06:31:59', '2025-03-13 06:31:59'),
(44, '<p>Paradigma pemrograman prosedural adalah metode penulisan kode yang berfokus pada instruksi langkah demi langkah secara berurutan untuk menyelesaikan suatu masalah.</p>', 0, 17, 1, 1, NULL, '2025-03-13 06:32:38', '2025-03-13 06:32:38'),
(45, 'false', 1, 18, 1, 1, NULL, '2025-03-13 06:33:59', '2025-03-13 06:33:59'),
(46, '<p>Kode lebih bersih dan mudah dipahami</p>', 1, 19, 1, 1, NULL, '2025-03-13 06:35:58', '2025-03-13 06:35:58'),
(47, '<p>Minim bug karena tidak mengubah data langsung</p>', 1, 19, 1, 1, NULL, '2025-03-13 06:35:58', '2025-03-13 06:35:58'),
(48, '<p>Lebih efisien daripada prosedural dalam semua kasus</p>', 0, 19, 1, 1, NULL, '2025-03-13 06:35:58', '2025-03-13 06:35:58'),
(49, '<p>Dapat digunakan kembali tanpa efek samping</p>', 0, 19, 1, 1, NULL, '2025-03-13 06:35:58', '2025-03-13 06:35:58'),
(50, 'Prolog', 1, 20, 1, 1, NULL, '2025-03-13 06:38:31', '2025-03-13 06:38:31'),
(51, '<p>Python</p>', 0, 2, 1, 1, NULL, '2025-03-13 06:39:10', '2025-03-13 06:39:10'),
(52, '<p>C</p>', 1, 2, 1, 1, NULL, '2025-03-13 06:39:10', '2025-03-13 06:39:10'),
(53, '<p>Pascal</p>', 1, 2, 1, 1, NULL, '2025-03-13 06:39:10', '2025-03-13 06:39:10'),
(54, '<p>Java</p>', 0, 2, 1, 1, NULL, '2025-03-13 06:39:10', '2025-03-13 06:39:10'),
(55, 'false', 1, 21, 1, 1, NULL, '2025-03-13 08:23:26', '2025-03-13 08:23:26'),
(56, '<p>Paradigma imperatif lebih berfokus pada \"apa yang harus dilakukan\" dibandingkan \"bagaimana cara melakukannya\".</p>', 0, 22, 1, 1, NULL, '2025-03-13 08:24:42', '2025-03-13 08:24:42'),
(57, '<p>&nbsp;Paradigma fungsional menggunakan variabel yang dapat diubah secara bebas untuk menyimpan nilai sementara.</p>', 0, 22, 1, 1, NULL, '2025-03-13 08:24:42', '2025-03-13 08:24:42'),
(58, '<p>Paradigma imperatif menggunakan pendekatan berbasis ekspresi tanpa efek samping.</p>', 0, 22, 1, 1, NULL, '2025-03-13 08:24:42', '2025-03-13 08:24:42'),
(59, '<p>Paradigma fungsional lebih mengandalkan ekspresi dan rekursi dibandingkan perintah langkah demi langkah.</p>', 1, 22, 1, 1, NULL, '2025-03-13 08:24:42', '2025-03-13 08:24:42'),
(60, 'Rekursi', 1, 23, 1, 1, NULL, '2025-03-13 08:26:08', '2025-03-13 08:26:08'),
(61, '<p>Judul Fungsi</p>', 0, 24, 1, 1, NULL, '2025-03-13 08:27:26', '2025-03-13 08:27:26'),
(62, '<p>Definisi &amp; Spesifikasi</p>', 1, 24, 1, 1, NULL, '2025-03-13 08:27:26', '2025-03-13 08:27:26'),
(63, '<p>Realisasi</p>', 0, 24, 1, 1, NULL, '2025-03-13 08:27:26', '2025-03-13 08:27:26'),
(64, '<p>Aplikasi</p>', 0, 24, 1, 1, NULL, '2025-03-13 08:27:26', '2025-03-13 08:27:26'),
(65, '<p>Ekspresi Fungsional Dasar</p>', 1, 25, 1, 1, NULL, '2025-03-13 08:30:06', '2025-03-13 08:30:06'),
(66, '<p>&nbsp;Ekspresi Kondisional</p>', 1, 25, 1, 1, NULL, '2025-03-13 08:30:06', '2025-03-13 08:30:06'),
(67, '<p>Ekspresi Rekursif</p>', 1, 25, 1, 1, NULL, '2025-03-13 08:30:06', '2025-03-13 08:30:06'),
(68, '<p>Ekspresi Perulangan (Loop)</p>', 0, 25, 1, 1, NULL, '2025-03-13 08:30:06', '2025-03-13 08:30:06'),
(69, 'false', 1, 26, 1, 1, NULL, '2025-03-13 08:32:54', '2025-03-13 08:32:54'),
(70, 'true', 1, 27, 1, 1, NULL, '2025-03-13 08:34:12', '2025-03-13 08:34:12'),
(71, 'false', 1, 28, 1, 1, NULL, '2025-03-13 08:40:41', '2025-03-13 08:40:41'),
(72, '<p>Menggunakan variabel mutable secara luas</p>', 0, 29, 1, 1, NULL, '2025-03-13 08:41:43', '2025-03-13 08:41:43'),
(73, '<p>Memodifikasi state global secara langsung</p>', 0, 29, 1, 1, NULL, '2025-03-13 08:41:43', '2025-03-13 08:41:43'),
(74, '<p>Berbasis ekspresi dan tidak memiliki efek samping</p>', 1, 29, 1, 1, NULL, '2025-03-13 08:41:43', '2025-03-13 08:41:43'),
(75, '<p>Menggunakan perintah langkah demi langkah</p>', 0, 29, 1, 1, NULL, '2025-03-13 08:41:43', '2025-03-13 08:41:43'),
(76, 'Rekursi', 1, 30, 1, 1, NULL, '2025-03-13 08:42:40', '2025-03-13 08:42:40'),
(77, '<p>Ekspresi Fungsional Dasar</p>', 1, 31, 1, 1, NULL, '2025-03-13 08:44:13', '2025-03-13 08:44:13'),
(78, '<p>Ekspresi Kondisional</p>', 1, 31, 1, 1, NULL, '2025-03-13 08:44:13', '2025-03-13 08:44:13'),
(79, '<p>Ekspresi Rekursif</p>', 1, 31, 1, 1, NULL, '2025-03-13 08:44:13', '2025-03-13 08:44:13'),
(80, '<p>Ekspresi Perulangan (Loop)</p>', 0, 31, 1, 1, NULL, '2025-03-13 08:44:13', '2025-03-13 08:44:13'),
(81, '<p>Paradigma imperatif berfokus pada langkah-langkah eksekusi dengan mengubah state program menggunakan perulangan dan variabel yang dapat diubah. Sementara itu, paradigma fungsional menggunakan fungsi murni yang tidak mengubah state global dan mengandalkan ekspresi serta rekursi untuk pemrosesan data.</p>', 0, 32, 1, 1, NULL, '2025-03-13 08:44:52', '2025-03-13 08:44:52'),
(82, 'false', 1, 33, 1, 1, NULL, '2025-03-13 08:45:22', '2025-03-13 08:45:22'),
(83, '<p>Judul Fungsi</p>', 0, 34, 1, 1, NULL, '2025-03-13 08:46:31', '2025-03-13 08:46:31'),
(84, '<p>Definisi &amp; Spesifikasi</p>', 1, 34, 1, 1, NULL, '2025-03-13 08:46:31', '2025-03-13 08:46:31'),
(85, '<p>Realisasi</p>', 0, 34, 1, 1, NULL, '2025-03-13 08:46:31', '2025-03-13 08:46:31'),
(86, '<p>Aplikasi</p>', 0, 34, 1, 1, NULL, '2025-03-13 08:46:31', '2025-03-13 08:46:31'),
(87, 'Pure Function', 1, 35, 1, 1, NULL, '2025-03-13 08:47:15', '2025-03-13 08:47:15'),
(88, '<p>Penggunaan fungsi murni</p>', 1, 36, 1, 1, NULL, '2025-03-13 08:48:34', '2025-03-13 08:48:34'),
(89, '<p>Hindari penggunaan variabel mutable</p>', 1, 36, 1, 1, NULL, '2025-03-13 08:48:34', '2025-03-13 08:48:34'),
(90, '<p>Rekursi untuk menggantikan loop</p>', 1, 36, 1, 1, NULL, '2025-03-13 08:48:34', '2025-03-13 08:48:34'),
(91, '<p>Menggunakan statement goto untuk alur program</p>', 0, 36, 1, 1, NULL, '2025-03-13 08:48:34', '2025-03-13 08:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `ex_questions`
--

CREATE TABLE `ex_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exercise_id` bigint UNSIGNED NOT NULL,
  `point` int NOT NULL,
  `exp` int NOT NULL,
  `feedback` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` bigint UNSIGNED NOT NULL,
  `updated_by` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ex_questions`
--

INSERT INTO `ex_questions` (`id`, `content`, `type`, `exercise_id`, `point`, `exp`, `feedback`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '<p>Apa yang menjadi konsep utama dalam paradigma pemrograman prosedural?</p>', 'multiple_choice', 1, 10, 10, '<p>Paradigma pemrograman prosedural berfokus pada eksekusi perintah secara berurutan, seperti mengikuti resep masakan. Setiap langkah dilakukan dalam urutan tertentu hingga program selesai.</p>', 1, 1, NULL, '2025-03-13 03:47:42', '2025-03-13 03:47:42'),
(2, '<p>Berikut adalah bahasa pemrograman yang menggunakan paradigma prosedural:</p>', 'multiple_answer', 1, 20, 10, '<p>Bahasa seperti C dan Pascal menerapkan paradigma prosedural karena instruksinya dieksekusi secara berurutan. Sementara itu, Java lebih dikenal sebagai bahasa berorientasi objek, dan Python mendukung banyak paradigma, termasuk prosedural, tetapi lebih sering digunakan dalam paradigma lainnya.</p>', 1, 1, NULL, '2025-03-13 03:50:26', '2025-03-13 06:39:10'),
(3, '<p>Paradigma fungsional lebih efisien dibandingkan paradigma prosedural karena menggunakan lebih sedikit pemrosesan tambahan.</p>', 'true_false', 2, 5, 10, '<p>Paradigma fungsional sering kali membutuhkan lebih banyak pemrosesan tambahan, karena tidak mengubah data langsung dan sering menggunakan rekursi, yang bisa memperlambat eksekusi dibandingkan dengan pendekatan prosedural yang lebih dekat dengan cara kerja mesin.</p>', 1, 1, NULL, '2025-03-13 03:53:00', '2025-03-13 03:53:00'),
(4, '<p>Salah satu bahasa pemrograman yang menggunakan paradigma fungsional adalah?</p>', 'short_answer', 2, 10, 10, '<p>Haskell adalah salah satu bahasa pemrograman yang sepenuhnya berbasis paradigma fungsional, di mana setiap operasi dilakukan melalui fungsi matematika tanpa mengubah data secara langsung.</p>', 1, 1, NULL, '2025-03-13 03:53:49', '2025-03-13 03:53:49'),
(5, '<p>Bahasa pemrograman berikut menerapkan paradigma deklaratif:</p>', 'multiple_answer', 3, 20, 10, '<p>Prolog digunakan dalam pemrograman berbasis logika, sementara SQL adalah bahasa deklaratif yang digunakan untuk mengelola database. C dan JavaScript lebih sering digunakan dalam paradigma prosedural dan berorientasi objek.</p>', 1, 1, NULL, '2025-03-13 04:00:17', '2025-03-13 04:00:17'),
(6, '<p>Apa konsep utama dari paradigma pemrograman berorientasi objek (OOP)?</p>', 'multiple_choice', 4, 10, 10, '<p>Paradigma OOP mengorganisir kode ke dalam objek yang memiliki atribut (data) dan metode (fungsi yang dapat dijalankan oleh objek). Hal ini membuat kode lebih terstruktur dan modular.</p>', 1, 1, NULL, '2025-03-13 04:03:11', '2025-03-13 04:03:11'),
(7, '<p>Paradigma berorientasi objek lebih cocok untuk proyek besar seperti aplikasi web dan game dibandingkan paradigma prosedural.</p>', 'true_false', 4, 5, 10, '<p>OOP sangat cocok untuk proyek besar karena mendukung konsep modularitas, enkapsulasi, dan pewarisan, yang memudahkan pengelolaan dan pemeliharaan kode dalam skala besar seperti aplikasi web dan game.</p>', 1, 1, NULL, '2025-03-13 04:03:50', '2025-03-13 04:03:50'),
(8, '<p>Apa konsep utama dari paradigma pemrograman konkuren?</p>', 'multiple_choice', 5, 10, 10, '<p>Paradigma pemrograman konkuren memungkinkan eksekusi beberapa tugas dalam waktu yang bersamaan. Ini sering digunakan dalam sistem operasi, server web, dan aplikasi yang menangani banyak permintaan secara simultan.</p>', 1, 1, NULL, '2025-03-13 04:07:17', '2025-03-13 04:07:17'),
(9, '<p>Paradigma pemrograman konkuren biasanya digunakan dalam:</p>', 'multiple_answer', 5, 20, 10, '<p>Paradigma konkuren digunakan dalam sistem operasi untuk menjalankan banyak proses secara bersamaan, server web untuk menangani banyak permintaan pengguna, dan game multiplayer untuk menjalankan aksi dari banyak pemain secara real-time. Pengolahan database sederhana tidak memerlukan paradigma konkuren karena sering berjalan secara sekuensial.</p>', 1, 1, NULL, '2025-03-13 04:09:23', '2025-03-13 04:09:23'),
(10, '<p>Paradigma pemrograman konkuren lebih mudah diimplementasikan dibanding paradigma prosedural.</p>', 'true_false', 5, 5, 10, '<p>Paradigma konkuren lebih sulit diimplementasikan dibandingkan paradigma prosedural karena melibatkan komunikasi antar proses dan perlu menangani masalah seperti deadlock, race condition, dan sinkronisasi data.</p>', 1, 1, NULL, '2025-03-13 04:11:20', '2025-03-13 04:11:20'),
(11, '<p>Paradigma pemrograman manakah yang paling sesuai dengan konsep \"menyusun fungsi-fungsi kecil yang dapat digunakan kembali tanpa memodifikasi data langsung\"?</p>', 'multiple_choice', 6, 10, 10, '<p>Paradigma <strong>fungsional</strong> berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.</p>', 1, 1, NULL, '2025-03-13 04:14:44', '2025-03-13 04:14:44'),
(12, '<p>Sebutkan satu bahasa pemrograman yang mendukung paradigma deklaratif!</p>', 'short_answer', 6, 15, 10, '<p>Prolog adalah contoh bahasa pemrograman <strong>deklaratif</strong>, di mana programmer hanya menyatakan \"apa\" yang diinginkan tanpa harus mendefinisikan \"bagaimana\" cara mencapainya.</p>', 1, 1, NULL, '2025-03-13 04:33:45', '2025-03-13 04:33:45'),
(13, '<p>SQL adalah contoh bahasa pemrograman yang menggunakan paradigma deklaratif.</p>', 'true_false', 6, 10, 10, '<p>SQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.</p>', 1, 1, NULL, '2025-03-13 04:34:24', '2025-03-13 04:34:24'),
(14, '<p>Manakah bahasa pemrograman berikut yang mendukung paradigma berorientasi objek? <strong>(Pilih lebih dari satu)</strong></p>', 'multiple_answer', 6, 20, 10, '<ul><li><strong>Java, Python, dan C++</strong> adalah bahasa yang mendukung paradigma <strong>berorientasi objek (OOP)</strong>.</li><li><strong>Fortran</strong> lebih dikenal sebagai bahasa dengan paradigma <strong>prosedural</strong>.</li></ul><p><br></p>', 1, 1, NULL, '2025-03-13 04:54:51', '2025-03-13 04:54:51'),
(15, '<p>Paradigma pemrograman yang cocok untuk pengolahan data besar dan berbasis AI adalah...</p>', 'multiple_choice', 6, 10, 10, '<p>Paradigma <strong>deklaratif</strong> seperti Prolog sering digunakan dalam <strong>AI dan database</strong>, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.</p>', 1, 1, NULL, '2025-03-13 06:31:01', '2025-03-13 06:31:01'),
(16, '<p>Mengapa paradigma konkuren penting dalam pengembangan sistem modern seperti server web dan game multiplayer?</p>', 'essay', 6, 30, 10, '<p>Paradigma <strong>konkuren</strong> memungkinkan eksekusi banyak tugas secara bersamaan, meningkatkan efisiensi dan kecepatan sistem. Dalam server web dan game multiplayer, banyak permintaan harus diproses serentak agar pengguna tidak mengalami keterlambatan.</p>', 1, 1, NULL, '2025-03-13 06:31:59', '2025-03-13 06:31:59'),
(17, '<p>Apa yang dimaksud dengan paradigma pemrograman prosedural?</p>', 'essay', 6, 20, 10, '<p>Paradigma pemrograman prosedural adalah metode penulisan kode yang berfokus pada instruksi langkah demi langkah secara berurutan untuk menyelesaikan suatu masalah.</p>', 1, 1, NULL, '2025-03-13 06:32:38', '2025-03-13 06:32:38'),
(18, '<p>Bahasa pemrograman Pascal hanya mendukung paradigma berorientasi objek.</p>', 'true_false', 6, 5, 10, '<p>Pascal awalnya merupakan bahasa <strong>prosedural</strong>, tetapi versi yang lebih baru (seperti Object Pascal) juga mendukung paradigma <strong>berorientasi objek</strong>.</p>', 1, 1, NULL, '2025-03-13 06:33:59', '2025-03-13 06:33:59'),
(19, '<p>Mana saja kelebihan paradigma fungsional dalam pemrograman? <strong>(Pilih lebih dari satu)</strong></p>', 'multiple_answer', 6, 20, 10, '<p>Paradigma <strong>fungsional</strong> membuat kode lebih bersih dan bebas dari efek samping yang tidak terduga. Namun, tidak selalu lebih efisien dibanding paradigma lain, tergantung pada kasus penggunaannya.</p>', 1, 1, NULL, '2025-03-13 06:35:58', '2025-03-13 06:35:58'),
(20, '<p>Salah satu bahasa pemrograman yang menerapkan paradigma deklaratif adalah?</p>', 'short_answer', 3, 15, 10, '<p>Prolog adalah bahasa pemrograman berbasis logika yang memungkinkan programmer mendeklarasikan aturan dan fakta, lalu sistem akan menyimpulkan hasilnya berdasarkan logika yang diberikan.</p>', 1, 1, NULL, '2025-03-13 06:38:31', '2025-03-13 06:38:31'),
(21, '<p>Dalam paradigma fungsional, sebuah fungsi bisa mengubah variabel global jika diperlukan.</p>', 'true_false', 7, 5, 10, '<p>Paradigma fungsional menekankan <strong>fungsi murni (pure functions)</strong>, yang berarti setiap fungsi hanya bergantung pada input yang diberikan dan tidak boleh mengubah variabel global atau memiliki efek samping. Hal ini membuat kode lebih mudah dipahami dan diuji.</p>', 1, 1, NULL, '2025-03-13 08:23:25', '2025-03-13 08:23:25'),
(22, '<p>Manakah dari pernyataan berikut yang benar mengenai perbedaan antara pemrograman imperatif dan fungsional?</p>', 'multiple_choice', 7, 10, 10, '<ul><li><strong>A Salah</strong> → Justru paradigma fungsional yang lebih berfokus pada \"apa yang ingin dilakukan\", sedangkan imperatif lebih menekankan \"bagaimana cara melakukannya\".</li><li><strong>B Salah</strong> → Paradigma fungsional tidak menggunakan variabel yang dapat diubah (mutable variables), karena tidak ada efek samping.</li><li><strong>C Salah</strong> → Paradigma imperatif menggunakan perintah langkah demi langkah, bukan berbasis ekspresi.</li><li><strong>D Benar</strong> → Pemrograman fungsional mengutamakan ekspresi dan rekursi, bukan perubahan state seperti dalam pemrograman imperatif.</li></ul><p><br></p>', 1, 1, NULL, '2025-03-13 08:24:42', '2025-03-13 08:24:42'),
(23, '<p>Apa yang digunakan dalam notasi fungsional untuk menggantikan loop dalam pemrograman imperatif?</p>', 'short_answer', 8, 15, 10, '<p>Dalam <strong>pemrograman imperatif</strong>, kita sering menggunakan <strong>loop</strong> seperti for atau while untuk mengulang suatu proses. Namun, dalam <strong>notasi fungsional</strong>, kita tidak menggunakan loop melainkan <strong>rekursi</strong>.</p>', 1, 1, NULL, '2025-03-13 08:26:08', '2025-03-13 08:26:08'),
(24, '<p>Dalam struktur dasar program fungsional, bagian yang menjelaskan domain, range, dan deskripsi fungsi disebut?</p>', 'multiple_choice', 8, 10, 10, '<ul><li><strong>A (Judul Fungsi)</strong> → Berisi nama dan parameter fungsi.</li><li><strong>B (Definisi &amp; Spesifikasi)</strong> → Menjelaskan domain, range, dan deskripsi fungsi.</li><li><strong>C (Realisasi)</strong> → Berisi implementasi atau cara kerja fungsi.</li></ul><p><strong>D (Aplikasi)</strong> → Menunjukkan penggunaan fungsi dalam ekspresi nyata.</p><p><br></p>', 1, 1, NULL, '2025-03-13 08:27:26', '2025-03-13 08:27:26'),
(25, '<p>Pilih semua jenis ekspresi dalam notasi fungsional:</p>', 'multiple_answer', 9, 20, 10, '<p>✅ <strong>A, B, C benar</strong> → Digunakan dalam pemrograman fungsional.<br> ❌ <strong>D salah</strong> → Loop tidak ada dalam notasi fungsional, digantikan dengan rekursi.</p>', 1, 1, NULL, '2025-03-13 08:30:06', '2025-03-13 08:30:06'),
(26, '<p>Pendekatan top-down dalam pemrograman fungsional berarti menyelesaikan detail kecil terlebih dahulu sebelum membangun fungsi utama.</p>', 'true_false', 10, 5, 10, '<p>Pendekatan <strong>top-down</strong> berarti <strong>memecah masalah besar</strong> menjadi fungsi-fungsi kecil, <strong>bukan sebaliknya</strong>. Jadi, kita mulai dari konsep umum, lalu merinci ke fungsi yang lebih spesifik. Oleh karena itu, <strong>jawaban yang benar adalah False</strong>.</p>', 1, 1, NULL, '2025-03-13 08:32:54', '2025-03-13 08:32:54'),
(27, '<p>Haskell dan LISP adalah contoh bahasa pemrograman yang mendukung paradigma fungsional.</p>', 'true_false', 11, 5, 10, '<p><strong>Haskell</strong> adalah bahasa pemrograman fungsional murni, sedangkan <strong>LISP</strong> mendukung pemrograman fungsional meskipun tidak sepenuhnya fungsional. Jadi jawabannya <strong>True</strong>.</p>', 1, 1, NULL, '2025-03-13 08:34:12', '2025-03-13 08:34:12'),
(28, '<p>Dalam paradigma fungsional, sebuah fungsi bisa mengubah variabel global jika diperlukan.</p>', 'true_false', 12, 5, 10, '<p>Paradigma fungsional menekankan fungsi murni (pure functions), yang tidak boleh mengubah variabel global atau memiliki efek samping.</p>', 1, 1, NULL, '2025-03-13 08:40:41', '2025-03-13 08:40:41'),
(29, '<p>Manakah yang merupakan ciri utama dari paradigma fungsional?</p>', 'multiple_choice', 12, 10, 10, '<p>Paradigma fungsional berfokus pada ekspresi, tidak mengubah state, dan menghindari efek samping.</p>', 1, 1, NULL, '2025-03-13 08:41:43', '2025-03-13 08:41:43'),
(30, '<p>Dalam notasi fungsional, apa yang digunakan untuk menggantikan loop dalam pemrograman imperatif?</p>', 'short_answer', 12, 15, 10, '<p>Rekursi digunakan untuk menggantikan perulangan seperti for atau while dalam paradigma imperatif.</p>', 1, 1, NULL, '2025-03-13 08:42:40', '2025-03-13 08:42:40'),
(31, '<p>Pilih semua jenis ekspresi yang termasuk dalam notasi fungsional.</p>', 'multiple_answer', 12, 20, 10, '<p>Notasi fungsional tidak memiliki perulangan eksplisit seperti dalam paradigma imperatif. Sebagai gantinya, rekursi digunakan.</p>', 1, 1, NULL, '2025-03-13 08:44:13', '2025-03-13 08:44:13'),
(32, '<p>Jelaskan perbedaan utama antara paradigma pemrograman imperatif dan fungsional.</p>', 'essay', 12, 15, 10, '<p>Paradigma imperatif berfokus pada langkah-langkah eksekusi dengan mengubah state program menggunakan perulangan dan variabel yang dapat diubah. Sementara itu, paradigma fungsional menggunakan fungsi murni yang tidak mengubah state global dan mengandalkan ekspresi serta rekursi untuk pemrosesan data.</p>', 1, 1, NULL, '2025-03-13 08:44:52', '2025-03-13 08:44:52'),
(33, '<p>Pendekatan top-down dalam pemrograman fungsional berarti menyelesaikan detail kecil terlebih dahulu sebelum membangun fungsi utama.</p>', 'true_false', 12, 5, 10, '<p>Pendekatan top-down berarti memecah masalah besar menjadi fungsi-fungsi kecil, bukan sebaliknya.</p>', 1, 1, NULL, '2025-03-13 08:45:22', '2025-03-13 08:45:22'),
(34, '<p>Dalam struktur dasar program fungsional, bagian yang menjelaskan domain, range, dan deskripsi fungsi disebut?</p>', 'multiple_choice', 12, 10, 10, '<p>Bagian Definisi &amp; Spesifikasi menjelaskan domain, range, dan deskripsi fungsi dalam pemrograman fungsional.</p>', 1, 1, NULL, '2025-03-13 08:46:31', '2025-03-13 08:46:31'),
(35, '<p>Apa istilah yang digunakan untuk fungsi yang selalu memberikan output yang sama untuk input yang sama tanpa efek samping?</p>', 'short_answer', 12, 15, 10, '<p>Pure Function atau fungsi murni adalah fungsi yang tidak memiliki efek samping dan hanya bergantung pada inputnya.</p>', 1, 1, NULL, '2025-03-13 08:47:15', '2025-03-13 08:47:15'),
(36, '<p>Dalam paradigma fungsional, teknik mana yang digunakan untuk menghindari efek samping?</p>', 'multiple_answer', 12, 20, 10, '<p>Paradigma fungsional menghindari efek samping dengan menggunakan fungsi murni, tidak mengubah state global, dan menggantikan perulangan dengan rekursi.</p>', 1, 1, NULL, '2025-03-13 08:48:34', '2025-03-13 08:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `topic_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exp` int NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `updated_by` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `topic_id`, `name`, `content`, `exp`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Introduction', '<h2><strong>Paradigma Pemrograman: Cara Kita Berpikir dalam Koding</strong></h2><p>Bayangkan kamu adalah seorang arsitek yang ingin membangun rumah. Ada banyak cara untuk mendesain rumah tersebut, dan setiap pendekatan punya kelebihan serta kelemahannya. Begitu juga dengan pemrograman! Kita perlu memilih cara atau \"paradigma\" yang paling cocok untuk menyelesaikan masalah tertentu.</p><p>Paradigma pemrograman adalah pendekatan atau sudut pandang dalam menulis kode untuk memecahkan masalah. Setiap paradigma memiliki aturan dan cara berpikir yang berbeda. Beberapa paradigma utama dalam pemrograman akan diulas pada lesson berikutnya!!</p><p><br></p>', 10, 1, 1, NULL, '2025-03-13 03:36:45', '2025-03-13 03:36:45'),
(2, 1, 'Paradigma Prosedural (Imperatif)', '<h2><strong>Paradigma Prosedural (Imperatif) ?️</strong></h2><h3><strong>Konsep:</strong></h3><p>Berfokus pada instruksi langkah demi langkah secara sekuensial (berurutan), seperti resep masakan.Konsep ini seperti mesin Von Neumann, algoritma + struktur data = program (tidak manusiawi).<figure data-trix-attachment=\"{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:351,&quot;url&quot;:&quot;https://lh7-rt.googleusercontent.com/docsz/AD_4nXc4TLHwM1rfxCSFOIWD1nUYW7LQxdbHKlUFsXY9IW-V2KXUELVG3TMmFZog5QoBktKVLLJAIYKjkMNS1fXwd-hJrEcyJzt5O9sbUxYBeNMnsD4cVfjAbu57g7z7OF-oaS12pMkY?key=YvWjYMQ3ZLm0Iy71ffXTRf8t&quot;,&quot;width&quot;:531}\" data-trix-content-type=\"image\" class=\"attachment attachment--preview\"><img src=\"https://lh7-rt.googleusercontent.com/docsz/AD_4nXc4TLHwM1rfxCSFOIWD1nUYW7LQxdbHKlUFsXY9IW-V2KXUELVG3TMmFZog5QoBktKVLLJAIYKjkMNS1fXwd-hJrEcyJzt5O9sbUxYBeNMnsD4cVfjAbu57g7z7OF-oaS12pMkY?key=YvWjYMQ3ZLm0Iy71ffXTRf8t\" width=\"531\" height=\"351\"><figcaption class=\"attachment__caption\"></figcaption></figure><strong>Contoh Dunia Nyata:</strong></p><p>Bayangkan kamu memberi tahu teman cara membuat kopi:<br>1️⃣ Rebus air<br>2️⃣ Masukkan kopi ke cangkir<br>3️⃣ Tuangkan air panas<br>4️⃣ Aduk rata</p><p>Komputer akan menjalankan instruksi secara berurutan seperti ini. Bahasa pemrograman yang menggunakan paradigma ini antara lain: <strong>Pascal, C, Fortran, Algol, Basic, Cobol, Ada</strong>.</p><h3><strong>Kelebihan:</strong></h3><p>✅ Efisien karena dekat dengan cara kerja mesin komputer<br>✅ Cocok untuk tugas-tugas sederhana dan pengolahan data</p><h3><strong>Kekurangan:</strong></h3><p>❌ Sulit dipahami untuk program besar<br>❌ Kurang fleksibel untuk perubahan</p>', 10, 1, 1, NULL, '2025-03-13 03:38:14', '2025-03-13 03:38:14'),
(3, 1, 'Paradigma Fungsional', '<h2><strong>Paradigma Fungsional ?</strong></h2><h3><strong>Konsep:</strong>&nbsp;</h3><p>Berdasarkan fungsi matematika, tanpa mengubah data atau memperhatikan bagaimana memori bekerja.</p><h3><strong>Contoh Dunia Nyata:</strong></h3><p>Bayangkan kamu sedang memesan makanan online. Kamu hanya memasukkan pesanan, dan sistem akan mengolahnya tanpa kamu perlu tahu bagaimana makanan disiapkan di dapur.</p><p>Dalam pemrograman, ini seperti menyusun fungsi-fungsi kecil yang dapat digunakan kembali tanpa memodifikasi data langsung. Contoh bahasa yang menggunakan paradigma ini: <strong>Haskell, Lisp, Scala, APL.</strong></p><h3><strong>Kelebihan:</strong></h3><p>✅ Kode lebih bersih dan mudah dipahami<br>✅ Minim bug karena tidak mengubah data secara langsung</p><h3><strong>Kekurangan:</strong></h3><p>❌ Kurang efisien karena butuh banyak pemrosesan tambahan<br>❌ Tidak semua masalah cocok diselesaikan dengan pendekatan ini</p><p><br></p>', 10, 1, 1, NULL, '2025-03-13 03:51:57', '2025-03-13 03:51:57'),
(4, 1, 'Paradigma Deklaratif/Logika', '<h2><strong>Paradigma Deklaratif / Logika ?</strong></h2><h3><strong>Konsep:</strong>&nbsp;</h3><p>Kamu cukup menyatakan <strong>\"Apa yang diinginkan\"</strong>, bukan <strong>\"Bagaimana melakukannya\"</strong>.</p><h3><strong>Contoh Dunia Nyata:</strong></h3><p>Misalnya, kamu bertanya kepada asisten AI seperti Google Assistant, \"Restoran terdekat yang buka sekarang?\"<br>Kamu tidak perlu mencari sendiri—AI akan mencocokkan pertanyaanmu dengan data yang tersedia dan memberikan jawaban.</p><p>Bahasa pemrograman yang menerapkan paradigma ini termasuk <strong>Prolog dan SQL</strong>.</p><h3><strong>Kelebihan:</strong></h3><p>✅ Sangat bagus untuk sistem berbasis kecerdasan buatan dan database<br>✅ Kode lebih ringkas dan mudah dibaca</p><h3><strong>Kekurangan:</strong></h3><p>❌ Tidak fleksibel untuk semua jenis aplikasi<br>❌ Eksekusi bisa lebih lambat</p>', 10, 1, 1, NULL, '2025-03-13 03:54:55', '2025-03-13 03:54:55'),
(5, 1, 'Paradigma Berorientasi Objek (OOP)', '<h2><strong>Paradigma Berorientasi Objek (OOP) ?</strong></h2><h3><strong>Konsep:</strong>&nbsp;</h3><p>Mengorganisir kode ke dalam objek yang memiliki <strong>atribut (data)</strong> dan <strong>perilaku (fungsi/metode)</strong>.</p><h3><strong>Contoh Dunia Nyata:</strong></h3><p>Bayangkan kamu sedang mengembangkan game RPG:<br>? Ada karakter (objek) bernama <strong>Warrior</strong> dengan atribut <strong>\"health\" dan \"damage\"</strong>.<br>⚔️ Warrior bisa <strong>menyerang, bertahan, atau menggunakan skill</strong>.</p><p>Bahasa yang menggunakan paradigma ini: <strong>Java, Python, C++, smalltalk, eifel.</strong></p><h3><strong>Kelebihan:</strong></h3><p>✅ Kode lebih terstruktur dan mudah dikelola<br>✅ Cocok untuk proyek besar seperti aplikasi web dan game</p><h3><strong>Kekurangan:</strong></h3><p>❌ Bisa lebih kompleks dibanding paradigma lain<br>❌ Kadang performanya lebih lambat</p>', 10, 1, 1, NULL, '2025-03-13 04:01:33', '2025-03-13 04:01:33'),
(6, 1, ' Paradigma Konkuren', '<h2><strong>Paradigma Konkuren ⚡</strong></h2><h3><strong>Konsep:</strong>&nbsp;</h3><p>Program dapat menjalankan banyak tugas secara bersamaan.</p><h3><strong>Contoh Dunia Nyata:</strong></h3><p>Bayangkan kamu di restoran cepat saji. Seorang kasir melayani pelanggan, sementara koki memasak, dan pelayan mengantar makanan <strong>secara bersamaan</strong>!</p><p>Contoh penggunaan: <strong>Pemrograman untuk server web, sistem operasi, atau game multiplayer</strong>.</p><h3><strong>Kelebihan:</strong></h3><p>✅ Dapat meningkatkan kecepatan eksekusi program<br>✅ Cocok untuk sistem yang menangani banyak permintaan sekaligus</p><h3><strong>Kekurangan:</strong></h3><p>❌ Lebih sulit diimplementasikan karena perlu menangani komunikasi antar proses</p>', 10, 1, 1, NULL, '2025-03-13 04:05:24', '2025-03-13 04:05:24'),
(7, 1, 'Bahasa Pemrograman', '<h2>Bahasa Pemrograman</h2><p>Bahasa pemrograman terdiri dari berbagai tingkat, mulai dari:</p><ul><li><strong>Bahasa tingkat rendah</strong> (bahasa mesin dalam biner)</li><li><strong>Bahasa assembler</strong> (menggunakan kode mnemonik)</li><li><strong>Bahasa tingkat tinggi</strong></li><li><strong>Bahasa generasi keempat (4GL)</strong></li></ul><p>Sejak tahun 1960-an, bahasa pemrograman berkembang sangat pesat dan sering dianalogikan seperti <strong>Menara Babel</strong>, di mana banyak bahasa membuat komunikasi menjadi sulit. Setiap paradigma memiliki bahasa pemrogramannya sendiri untuk mempermudah implementasi solusi. Berikut beberapa contohnya:</p><ol><li><strong>Prosedural</strong> → Algol, Pascal, Fortran, Basic, Cobol, C, Ada</li><li><strong>Fungsional</strong> → LOGO, APL, LISP</li><li><strong>Deklaratif</strong> → Prolog</li><li><strong>Object-Oriented Murni</strong> → Smalltalk, Eiffel, Java</li></ol><p>Saat ini, beberapa bahasa seperti <strong>Turbo Pascal 5.5 dan C++</strong> telah dilengkapi dengan fitur <strong>Object-Oriented Programming (OOP)</strong> agar lebih fleksibel dalam pemrograman.</p><p><br></p><h3><strong>Belajar Memprogram vs. Belajar Bahasa Pemrograman</strong></h3><p>?️ <strong>Belajar memprogram</strong> bukan sekadar belajar bahasa pemrograman, tetapi juga mencakup strategi pemecahan masalah, metodologi, dan sistematika. Ini melibatkan <strong>analisis, sintesis, dan pemahaman masalah</strong> untuk menemukan solusi terbaik.</p><p>⌨️ <strong>Belajar bahasa pemrograman</strong>, di sisi lain, berfokus pada aturan sintaksis, penggunaan instruksi, dan cara mengoperasikan kompiler atau interpreter. Ini lebih bersifat keterampilan teknis dibandingkan analisis.</p><p>? <strong>Kesimpulan:</strong></p><ul><li><strong>Belajar pemrograman</strong> = Menjadi perancang (designer) program</li><li><strong>Belajar bahasa pemrograman</strong> = Menjadi coder (juru kode)</li></ul>', 10, 1, 1, NULL, '2025-03-13 04:12:36', '2025-03-13 04:12:36'),
(8, 2, 'Introduction', '<h2>&nbsp;Pendahuluan ke Notasi Fungsional&nbsp;</h2><h3><strong>? Tujuan:</strong></h3><p>Memahami konsep dasar notasi fungsional dan bagaimana perbedaannya dengan paradigma pemrograman lainnya.</p><h3><strong>1. Apa Itu Notasi Fungsional?</strong></h3><p>Notasi fungsional adalah cara menuliskan program dengan pendekatan berbasis fungsi, yang berasal dari konsep <strong>matematika</strong>. Dalam paradigma ini, program dibuat dengan cara mendefinisikan <strong>fungsi-fungsi murni</strong> yang menghasilkan output berdasarkan input, tanpa mengubah <strong>state global</strong>.</p><p>? <strong>Analoginya seperti vending machine</strong>:</p><ul><li>Ketika kita memasukkan <strong>uang (input)</strong>, vending machine akan langsung memberikan <strong>minuman (output)</strong> tanpa mengubah sistem internalnya.</li></ul><p>? <strong>Ciri utama Notasi Fungsional:</strong></p><ul><li><strong>Deklaratif</strong>: Fokus pada \"apa yang ingin dilakukan\" bukan \"bagaimana caranya\".</li><li><strong>Tidak Ada Efek Samping</strong>: Tidak ada perubahan variabel global.</li><li><strong>Pemetaan dari Input ke Output</strong>: Setiap fungsi hanya bergantung pada inputnya.</li></ul><h3>&nbsp;2. Perbandingan dengan Pemrograman Imperatif&nbsp;</h3><p><strong>Paradigma Interaktif</strong>&nbsp;</p><ul><li>Karakteristik: langkah demi langkah, mengubah state.&nbsp;</li><li>Contoh: menggunakan loop, variabel berubah.</li></ul><p><strong>Paradigma Fungsional</strong></p><ul><li>Karakteristik:&nbsp; berbasis ekspresi, tanpa efek samping&nbsp;</li><li>Contoh:&nbsp; Menggunakan rekursi dan fungsi murni&nbsp;</li></ul><p>? <strong>Contoh dalam kehidupan nyata</strong>:</p><ul><li><strong>Imperatif</strong>: Memasak dengan resep yang mengubah bahan satu per satu.</li><li><strong>Fungsional</strong>: Menggunakan blender—masukkan bahan, tekan tombol, hasil langsung jadi!</li></ul><h3>&nbsp;3. Contoh Program dalam Notasi Fungsional vs Imperatif&nbsp;</h3><p><strong>Imperatif (Pascal)</strong></p><p><em>PROGRAM Tambah;<br>VAR<br>&nbsp; &nbsp;a, b, hasil: integer;<br>BEGIN<br>&nbsp; &nbsp;a := 5;<br>&nbsp; &nbsp;b := 3;<br>&nbsp; &nbsp;hasil := a + b;<br>&nbsp; &nbsp;WriteLn(hasil);<br>END.</em></p><p><strong>Fungsional (Haskell)</strong></p><p><em>tambah :: Int -&gt; Int -&gt; Int<br>tambah a b = a + b<br><br>main = print (tambah 5 3)</em></p><p><br>? <strong>Penjelasan:</strong></p><ul><li>Dalam <strong>imperatif</strong>, kita harus <strong>mendeklarasikan variabel</strong>, melakukan operasi, dan <strong>mengubah state variabel</strong>.</li><li>Dalam <strong>fungsional</strong>, kita cukup membuat fungsi tambah yang langsung memberikan hasil!</li></ul>', 10, 1, 1, NULL, '2025-03-13 07:09:20', '2025-03-13 07:09:20'),
(9, 2, 'Struktur Dasar Program', '<h2>&nbsp;Struktur Dasar Program dalam Notasi Fungsional&nbsp;</h2><h3><strong>? Tujuan:</strong></h3><p>Memahami bagaimana struktur dasar dari program dalam notasi fungsional.</p><h3>? <strong>Struktur Program dalam Notasi Fungsional</strong></h3><ol><li><strong>Judul Fungsi</strong>: Nama dan parameter.</li><li><strong>Definisi &amp; Spesifikasi</strong>: Domain, range, dan deskripsi fungsi.</li><li><strong>Realisasi (Implementasi)</strong>: Cara fungsi bekerja.</li><li><strong>Aplikasi (Penggunaan)</strong>: Menggunakan fungsi dalam ekspresi nyata.</li></ol><p>? <strong>Contoh Program Notasi Fungsional</strong></p><p><em>-- Judul Fungsi<br>pangkat3 :: Int -&gt; Int<br><br>-- Definisi &amp; Spesifikasi<br>-- Menghitung nilai pangkat tiga dari sebuah angka<br><br>-- Realisasi<br>pangkat3 x = x * x * x<br><br>-- Aplikasi<br>main = print (pangkat3 3) -- Output: 27</em><br><br></p>', 10, 1, 1, NULL, '2025-03-13 07:14:06', '2025-03-13 07:14:06'),
(10, 2, 'Jenis Ekspresi dalam Notasi Fungsional', '<h2>&nbsp;Jenis Ekspresi dalam Notasi Fungsional&nbsp;</h2><h3><strong>? Tujuan:</strong></h3><p>Memahami berbagai jenis ekspresi dalam notasi fungsional.</p><h3>? <strong>Jenis Ekspresi dalam Notasi Fungsional</strong></h3><ul><li><strong>Ekspresi Fungsional Dasar: </strong>Ekspresi langsung tanpa kondisi.&nbsp;</li></ul><p>Contoh:</p><p><em>kaliDua x = x * 2<br>main = print (kaliDua 5) -- Output: 10</em></p><ul><li>Ekspresi Kondisional:&nbsp; Menggunakan if-then-else.&nbsp;</li></ul><p>Contoh:</p><p><em>absValue x = if x &lt; 0 then -x else x<br>main = print (absValue (-5)) -- Output: 5</em></p><ul><li>Ekspresi Rekursif:&nbsp; Fungsi yang memanggil dirinya sendiri.&nbsp;</li></ul><p>Contoh:</p><p><em>faktorial 0 = 1<br>faktorial n = n * faktorial (n-1)<br>main = print (faktorial 5) -- Output: 120</em><br><br></p><p><br></p>', 10, 1, 1, NULL, '2025-03-13 07:22:30', '2025-03-13 07:22:30'),
(11, 2, 'Konsep Analisis Top-Down dalam Pemrograman Fungsional', '<h2>Konsep Analisis Top-Down dalam Pemrograman Fungsional&nbsp;</h2><h3><strong>? Tujuan:</strong></h3><p>Memahami pendekatan <strong>top-down</strong> dalam pemrograman fungsional.</p><h3>? <strong>Konsep Analisis Top-Down</strong></h3><ul><li>Memecah masalah besar menjadi fungsi-fungsi kecil.</li><li>Setiap fungsi hanya fokus pada satu tugas.</li></ul><p><strong>? Contoh (Menghitung luas total beberapa persegi panjang)</strong></p><p><em>luasPersegiPanjang p l = p * l<br>totalLuas p1 l1 p2 l2 = luasPersegiPanjang p1 l1 + luasPersegiPanjang p2 l2<br>main = print (totalLuas 4 5 3 2) -- Output: 26</em><br><br></p>', 10, 1, 1, NULL, '2025-03-13 07:25:00', '2025-03-13 07:25:00'),
(12, 2, 'Implementasi Notasi Fungsional dalam Bahasa Pemrograman', '<h2>Implementasi Notasi Fungsional dalam Bahasa Pemrograman&nbsp;</h2><h3><strong>? Tujuan:</strong></h3><p>Mengimplementasikan konsep notasi fungsional dalam bahasa pemrograman nyata.</p><h3>&nbsp;? <strong>Contoh di Haskell:</strong></h3><p>pangkat3 :: Integer -&gt; Integer<br>pangkat3 x = x * x * x</p><h3>&nbsp;? <strong>Contoh di LISP:</strong></h3><p>(defun pangkat3 (x) (* x x x))<br><br></p>', 10, 1, 1, NULL, '2025-03-13 07:29:31', '2025-03-13 07:29:31');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint UNSIGNED NOT NULL,
  `level` int NOT NULL,
  `exp_needed` int NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `updated_by` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `level`, `exp_needed`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 1, 1, NULL, '2025-03-13 02:40:56', '2025-03-13 02:40:56'),
(2, 2, 200, 1, 1, NULL, '2025-03-13 02:40:56', '2025-03-13 02:40:56'),
(3, 3, 400, 1, 1, NULL, '2025-03-13 02:40:56', '2025-03-13 02:40:56'),
(4, 4, 600, 1, 1, NULL, '2025-03-13 02:40:56', '2025-03-13 02:40:56'),
(5, 5, 800, 1, 1, NULL, '2025-03-13 02:40:56', '2025-03-13 02:40:56'),
(6, 6, 1000, 1, 1, NULL, '2025-03-13 02:40:56', '2025-03-13 02:40:56'),
(7, 7, 1200, 1, 1, NULL, '2025-03-13 02:40:56', '2025-03-13 02:40:56'),
(8, 8, 1400, 1, 1, NULL, '2025-03-13 02:40:56', '2025-03-13 02:40:56'),
(9, 9, 1600, 1, 1, NULL, '2025-03-13 02:40:56', '2025-03-13 02:40:56'),
(10, 10, 1800, 1, 1, NULL, '2025-03-13 02:40:56', '2025-03-13 02:40:56');

-- --------------------------------------------------------

--
-- Table structure for table `markets`
--

CREATE TABLE `markets` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('Avatar','Gift') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `updated_by` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2025_01_10_000000_create_admins_table', 1),
(5, '2025_01_10_000001_create_levels_table', 1),
(6, '2025_01_10_000002_create_users_table', 1),
(7, '2025_01_10_000003_create_topics_table', 1),
(8, '2025_01_10_000005_create_lessons_table', 1),
(9, '2025_01_10_042235_create_exercises_table', 1),
(10, '2025_01_10_042306_create_ex_questions_table', 1),
(11, '2025_01_10_042315_create_ex_answers_table', 1),
(12, '2025_02_07_012456_create_quests_table', 1),
(13, '2025_02_07_021643_create_quest_answers_table', 1),
(14, '2025_02_07_024058_create_markets_table', 1),
(16, '2025_02_13_013642_create_take_lessons_table', 1),
(17, '2025_02_11_030226_create_take_exercises_table', 2),
(18, '2025_03_13_203046_create_discussions_table', 3),
(19, '2025_03_13_204541_create_disc_replies_table', 3),
(20, '2025_03_14_145059_create_take_quests_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quests`
--

CREATE TABLE `quests` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` int NOT NULL,
  `exp` int NOT NULL,
  `difficulty` enum('Easy','Medium','Hard') COLLATE utf8mb4_unicode_ci NOT NULL,
  `feedback` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` bigint UNSIGNED NOT NULL,
  `updated_by` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quests`
--

INSERT INTO `quests` (`id`, `title`, `content`, `type`, `point`, `exp`, `difficulty`, `feedback`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Quest 1', '<p>Paradigma pemrograman manakah yang paling sesuai dengan konsep \"menyusun fungsi-fungsi kecil yang dapat digunakan kembali tanpa memodifikasi data langsung\"?</p>', 'multiple_choice', 10, 10, 'Easy', '<p>Paradigma <strong>fungsional</strong> berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma <strong>fungsional</strong> berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.</p>', 1, 1, NULL, '2025-03-11 19:07:40', '2025-03-11 19:07:40'),
(2, 'Quest 2', '<p>SQL adalah contoh bahasa pemrograman yang menggunakan paradigma deklaratif.</p>', 'true_false', 5, 10, 'Easy', '<p>SQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.</p>', 1, 1, NULL, '2025-03-11 19:08:36', '2025-03-11 19:08:36'),
(4, 'Quest 4', '<p>Paradigma pemrograman yang cocok untuk pengolahan data besar dan berbasis AI adalah...</p>', 'multiple_choice', 10, 10, 'Easy', '<p>Paradigma <strong>deklaratif</strong> seperti Prolog sering digunakan dalam <strong>AI dan database</strong>, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.</p>', 1, 1, NULL, '2025-03-11 19:12:32', '2025-03-11 19:12:32'),
(5, 'Quest 5', '<p>_____ merupakan salah satu bahasa pemrograman yang mendukung paradigma deklaratif.<em><br><br>Jawab pada kolom yang tersedia tanpa ada spasi tambahan, contoh: Prosedural</em></p>', 'short_answer', 20, 20, 'Medium', '<p>Prolog adalah contoh bahasa pemrograman <strong>deklaratif</strong>, di mana programmer hanya menyatakan \"apa\" yang diinginkan tanpa harus mendefinisikan \"bagaimana\" cara mencapainya.</p>', 1, 1, NULL, '2025-03-11 19:13:37', '2025-03-11 19:13:37'),
(6, 'Quest 6', '<p>Jelaskan perbedaan utama antara paradigma pemrograman prosedural dan berorientasi objek!</p><p><br></p>', 'essay', 50, 20, 'Hard', '<ul><li><strong>Paradigma prosedural</strong> berfokus pada instruksi yang dieksekusi secara berurutan, seperti langkah-langkah dalam resep masakan. Kode tersusun dalam bentuk fungsi yang dipanggil sesuai kebutuhan.</li><li><strong>Paradigma berorientasi objek</strong> mengorganisir kode ke dalam objek yang memiliki atribut (data) dan perilaku (metode). Ini memungkinkan kode lebih modular dan mudah dikelola.</li></ul><p><br></p>', 1, 1, NULL, '2025-03-11 19:14:44', '2025-03-11 19:14:44'),
(7, 'Quest 3', '<p>Bahasa pemrograman prosedural yang populer dan sering digunakan adalah?</p>', 'short_answer', 10, 10, 'Easy', '<p>Bahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.</p>', 1, 1, NULL, '2025-03-13 18:24:59', '2025-03-13 18:24:59');

-- --------------------------------------------------------

--
-- Table structure for table `quest_answers`
--

CREATE TABLE `quest_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  `quest_id` bigint UNSIGNED NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `updated_by` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quest_answers`
--

INSERT INTO `quest_answers` (`id`, `content`, `is_correct`, `quest_id`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '<p>Fungsional</p>', 1, 1, 1, 1, NULL, '2025-03-11 19:07:40', '2025-03-11 19:07:40'),
(2, '<p>Prosedural</p>', 0, 1, 1, 1, NULL, '2025-03-11 19:07:40', '2025-03-11 19:07:40'),
(3, '<p>Berorientasi Objek</p>', 0, 1, 1, 1, NULL, '2025-03-11 19:07:40', '2025-03-11 19:07:40'),
(4, '<p>Deklaratif</p>', 0, 1, 1, 1, NULL, '2025-03-11 19:07:41', '2025-03-11 19:07:41'),
(5, 'true', 1, 2, 1, 1, NULL, '2025-03-11 19:08:36', '2025-03-11 19:08:36'),
(10, '<p>Prosedural</p>', 0, 4, 1, 1, NULL, '2025-03-11 19:12:32', '2025-03-11 19:12:32'),
(11, '<p>Fungsional</p>', 0, 4, 1, 1, NULL, '2025-03-11 19:12:32', '2025-03-11 19:12:32'),
(12, '<p>Deklaratif</p>', 0, 4, 1, 1, NULL, '2025-03-11 19:12:32', '2025-03-11 19:12:32'),
(13, '<p>Konkuren</p>', 0, 4, 1, 1, NULL, '2025-03-11 19:12:32', '2025-03-11 19:12:32'),
(14, 'Prolog', 1, 5, 1, 1, NULL, '2025-03-11 19:13:37', '2025-03-11 19:13:37'),
(15, '<ul><li><strong>Paradigma prosedural</strong> berfokus pada instruksi yang dieksekusi secara berurutan, seperti langkah-langkah dalam resep masakan. Kode tersusun dalam bentuk fungsi yang dipanggil sesuai kebutuhan.</li><li><strong>Paradigma berorientasi objek</strong> mengorganisir kode ke dalam objek yang memiliki atribut (data) dan perilaku (metode). Ini memungkinkan kode lebih modular dan mudah dikelola.</li></ul><p><br></p>', 0, 6, 1, 1, NULL, '2025-03-11 19:14:44', '2025-03-11 19:14:44'),
(16, 'C', 1, 7, 1, 1, NULL, '2025-03-13 18:24:59', '2025-03-13 18:24:59');

-- --------------------------------------------------------

--
-- Table structure for table `take_exercises`
--

CREATE TABLE `take_exercises` (
  `id` bigint UNSIGNED NOT NULL,
  `exercise_id` bigint UNSIGNED NOT NULL,
  `topic_id` bigint UNSIGNED NOT NULL,
  `lesson_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `answers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `total_correct` int NOT NULL,
  `total_question` int NOT NULL,
  `score` double(8,2) NOT NULL,
  `reward_exp` int NOT NULL,
  `reward_point` int NOT NULL,
  `total_exp` int NOT NULL,
  `total_point` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

--
-- Dumping data for table `take_exercises`
--

INSERT INTO `take_exercises` (`id`, `exercise_id`, `topic_id`, `lesson_id`, `user_id`, `answers`, `total_correct`, `total_question`, `score`, `reward_exp`, `reward_point`, `total_exp`, `total_point`, `deleted_at`, `created_at`, `updated_at`) VALUES
(30, 2, 1, 3, 5, '{\"0\":{\"correct_answer\":\"false\",\"correct_answer_index\":1,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma fungsional sering kali membutuhkan lebih banyak pemrosesan tambahan, karena tidak mengubah data langsung dan sering menggunakan rekursi, yang bisa memperlambat eksekusi dibandingkan dengan pendekatan prosedural yang lebih dekat dengan cara kerja mesin.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":3,\"type\":\"true_false\",\"user_answer\":\"True\",\"user_answer_index\":0},\"1\":{\"correct_answer_index\":\"Haskell\",\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eHaskell adalah salah satu bahasa pemrograman yang sepenuhnya berbasis paradigma fungsional, di mana setiap operasi dilakukan melalui fungsi matematika tanpa mengubah data secara langsung.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":4,\"type\":\"short_answer\",\"user_answer_index\":\"Haskell\"}}', 1, 2, 0.50, 20, 15, 10, 10, NULL, '2025-03-14 06:29:54', '2025-03-14 06:29:54'),
(31, 1, 1, 2, 5, '{\"0\":{\"correct_answer_id\":2,\"correct_answer_index\":1,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma pemrograman prosedural berfokus pada eksekusi perintah secara berurutan, seperti mengikuti resep masakan. Setiap langkah dilakukan dalam urutan tertentu hingga program selesai.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":1,\"type\":\"multiple_choice\",\"user_answer_id\":2,\"user_answer_index\":1},\"1\":{\"correct_answer_id\":[52,53],\"correct_answer_index\":[1,2],\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eBahasa seperti C dan Pascal menerapkan paradigma prosedural karena instruksinya dieksekusi secara berurutan. Sementara itu, Java lebih dikenal sebagai bahasa berorientasi objek, dan Python mendukung banyak paradigma, termasuk prosedural, tetapi lebih sering digunakan dalam paradigma lainnya.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":2,\"type\":\"multiple_answer\",\"user_answer_id\":[51,52],\"user_answer_index\":[0,1],\"user_correct_answer_id\":[52]}}', 1, 2, 0.50, 20, 30, 10, 10, NULL, '2025-03-14 07:00:40', '2025-03-14 07:00:40'),
(32, 3, 1, 4, 5, '{\"0\":{\"correct_answer_id\":[11,12],\"correct_answer_index\":[0,1],\"exp_gained\":5,\"feedback\":\"\\u003cp\\u003eProlog digunakan dalam pemrograman berbasis logika, sementara SQL adalah bahasa deklaratif yang digunakan untuk mengelola database. C dan JavaScript lebih sering digunakan dalam paradigma prosedural dan berorientasi objek.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":5,\"type\":\"multiple_answer\",\"user_answer_id\":[11,12,13],\"user_answer_index\":[0,1,2],\"user_correct_answer_id\":[11,12]},\"1\":{\"correct_answer_index\":\"Prolog\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eProlog adalah bahasa pemrograman berbasis logika yang memungkinkan programmer mendeklarasikan aturan dan fakta, lalu sistem akan menyimpulkan hasilnya berdasarkan logika yang diberikan.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":20,\"type\":\"short_answer\",\"user_answer_index\":\"Haskell\"}}', 1, 2, 0.50, 20, 35, 5, 10, NULL, '2025-03-14 07:13:55', '2025-03-14 07:13:55'),
(33, 4, 1, 5, 5, '{\"0\":{\"correct_answer_id\":16,\"correct_answer_index\":1,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma OOP mengorganisir kode ke dalam objek yang memiliki atribut (data) dan metode (fungsi yang dapat dijalankan oleh objek). Hal ini membuat kode lebih terstruktur dan modular.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":6,\"type\":\"multiple_choice\",\"user_answer_id\":16,\"user_answer_index\":1},\"1\":{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eOOP sangat cocok untuk proyek besar karena mendukung konsep modularitas, enkapsulasi, dan pewarisan, yang memudahkan pengelolaan dan pemeliharaan kode dalam skala besar seperti aplikasi web dan game.\\u003c/p\\u003e\",\"point_gained\":5,\"question_id\":7,\"type\":\"true_false\",\"user_answer\":\"True\",\"user_answer_index\":0}}', 2, 2, 1.00, 20, 15, 20, 15, NULL, '2025-03-14 07:33:53', '2025-03-14 07:33:53'),
(34, 5, 1, 6, 5, '{\"0\":{\"correct_answer_id\":21,\"correct_answer_index\":1,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma pemrograman konkuren memungkinkan eksekusi beberapa tugas dalam waktu yang bersamaan. Ini sering digunakan dalam sistem operasi, server web, dan aplikasi yang menangani banyak permintaan secara simultan.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":8,\"type\":\"multiple_choice\",\"user_answer_id\":21,\"user_answer_index\":1},\"1\":{\"correct_answer_id\":[24,25],\"correct_answer_index\":[0,1],\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma konkuren digunakan dalam sistem operasi untuk menjalankan banyak proses secara bersamaan, server web untuk menangani banyak permintaan pengguna, dan game multiplayer untuk menjalankan aksi dari banyak pemain secara real-time. Pengolahan database sederhana tidak memerlukan paradigma konkuren karena sering berjalan secara sekuensial.\\u003c/p\\u003e\",\"point_gained\":20,\"question_id\":9,\"type\":\"multiple_answer\",\"user_answer_id\":[24,25],\"user_answer_index\":[0,1],\"user_correct_answer_id\":[24,25]},\"2\":{\"correct_answer\":\"false\",\"correct_answer_index\":1,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma konkuren lebih sulit diimplementasikan dibandingkan paradigma prosedural karena melibatkan komunikasi antar proses dan perlu menangani masalah seperti deadlock, race condition, dan sinkronisasi data.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":10,\"type\":\"true_false\",\"user_answer\":\"True\",\"user_answer_index\":0}}', 2, 3, 0.67, 30, 35, 20, 30, NULL, '2025-03-14 07:35:02', '2025-03-14 07:35:02'),
(35, 6, 1, 7, 5, '{\"0\":{\"correct_answer_id\":30,\"correct_answer_index\":1,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":11,\"type\":\"multiple_choice\",\"user_answer_id\":30,\"user_answer_index\":1},\"1\":{\"correct_answer_index\":\"Prolog\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eProlog adalah contoh bahasa pemrograman \\u003cstrong\\u003edeklaratif\\u003c/strong\\u003e, di mana programmer hanya menyatakan \\\"apa\\\" yang diinginkan tanpa harus mendefinisikan \\\"bagaimana\\\" cara mencapainya.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":12,\"type\":\"short_answer\",\"user_answer_index\":\"C\"},\"2\":{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":13,\"type\":\"true_false\",\"user_answer\":\"True\",\"user_answer_index\":0},\"3\":{\"correct_answer_id\":[35,36,38],\"correct_answer_index\":[0,1,3],\"exp_gained\":6,\"feedback\":\"\\u003cul\\u003e\\u003cli\\u003e\\u003cstrong\\u003eJava, Python, dan C++\\u003c/strong\\u003e adalah bahasa yang mendukung paradigma \\u003cstrong\\u003eberorientasi objek (OOP)\\u003c/strong\\u003e.\\u003c/li\\u003e\\u003cli\\u003e\\u003cstrong\\u003eFortran\\u003c/strong\\u003e lebih dikenal sebagai bahasa dengan paradigma \\u003cstrong\\u003eprosedural\\u003c/strong\\u003e.\\u003c/li\\u003e\\u003c/ul\\u003e\\u003cp\\u003e\\u003cbr\\u003e\\u003c/p\\u003e\",\"point_gained\":12,\"question_id\":14,\"type\":\"multiple_answer\",\"user_answer_id\":[35,36],\"user_answer_index\":[0,1],\"user_correct_answer_id\":[35,36]},\"4\":{\"correct_answer_id\":41,\"correct_answer_index\":2,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003edeklaratif\\u003c/strong\\u003e seperti Prolog sering digunakan dalam \\u003cstrong\\u003eAI dan database\\u003c/strong\\u003e, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":15,\"type\":\"multiple_choice\",\"user_answer_id\":40,\"user_answer_index\":1},\"5\":{\"correct_answer_index\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003ekonkuren\\u003c/strong\\u003e memungkinkan eksekusi banyak tugas secara bersamaan, meningkatkan efisiensi dan kecepatan sistem. Dalam server web dan game multiplayer, banyak permintaan harus diproses serentak agar pengguna tidak mengalami keterlambatan.\\u003c/p\\u003e\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003ekonkuren\\u003c/strong\\u003e memungkinkan eksekusi banyak tugas secara bersamaan, meningkatkan efisiensi dan kecepatan sistem. Dalam server web dan game multiplayer, banyak permintaan harus diproses serentak agar pengguna tidak mengalami keterlambatan.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":16,\"type\":\"essay\",\"user_answer_index\":\"Testing Jawaban Essay\"},\"6\":{\"correct_answer_index\":\"\\u003cp\\u003eParadigma pemrograman prosedural adalah metode penulisan kode yang berfokus pada instruksi langkah demi langkah secara berurutan untuk menyelesaikan suatu masalah.\\u003c/p\\u003e\",\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma pemrograman prosedural adalah metode penulisan kode yang berfokus pada instruksi langkah demi langkah secara berurutan untuk menyelesaikan suatu masalah.\\u003c/p\\u003e\",\"point_gained\":20,\"question_id\":17,\"type\":\"essay\",\"user_answer_index\":\"Prosedural adalah sebuah paradigma pemrograman dimana program akan di jalan satu per satu per baris\"},\"7\":{\"correct_answer\":\"false\",\"correct_answer_index\":1,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003ePascal awalnya merupakan bahasa \\u003cstrong\\u003eprosedural\\u003c/strong\\u003e, tetapi versi yang lebih baru (seperti Object Pascal) juga mendukung paradigma \\u003cstrong\\u003eberorientasi objek\\u003c/strong\\u003e.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":18,\"type\":\"true_false\",\"user_answer\":\"True\",\"user_answer_index\":0},\"8\":{\"correct_answer_id\":[46,47],\"correct_answer_index\":[0,1],\"exp_gained\":5,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e membuat kode lebih bersih dan bebas dari efek samping yang tidak terduga. Namun, tidak selalu lebih efisien dibanding paradigma lain, tergantung pada kasus penggunaannya.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":19,\"type\":\"multiple_answer\",\"user_answer_id\":[46,47,48],\"user_answer_index\":[0,1,2],\"user_correct_answer_id\":[46,47]}}', 5, 9, 0.56, 90, 140, 41, 62, NULL, '2025-03-14 07:36:07', '2025-03-14 07:36:07'),
(36, 7, 2, 8, 5, '{\"0\":{\"correct_answer\":\"false\",\"correct_answer_index\":1,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma fungsional menekankan \\u003cstrong\\u003efungsi murni (pure functions)\\u003c/strong\\u003e, yang berarti setiap fungsi hanya bergantung pada input yang diberikan dan tidak boleh mengubah variabel global atau memiliki efek samping. Hal ini membuat kode lebih mudah dipahami dan diuji.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":21,\"type\":\"true_false\",\"user_answer\":\"True\",\"user_answer_index\":0},\"1\":{\"correct_answer_id\":59,\"correct_answer_index\":3,\"exp_gained\":0,\"feedback\":\"\\u003cul\\u003e\\u003cli\\u003e\\u003cstrong\\u003eA Salah\\u003c/strong\\u003e → Justru paradigma fungsional yang lebih berfokus pada \\\"apa yang ingin dilakukan\\\", sedangkan imperatif lebih menekankan \\\"bagaimana cara melakukannya\\\".\\u003c/li\\u003e\\u003cli\\u003e\\u003cstrong\\u003eB Salah\\u003c/strong\\u003e → Paradigma fungsional tidak menggunakan variabel yang dapat diubah (mutable variables), karena tidak ada efek samping.\\u003c/li\\u003e\\u003cli\\u003e\\u003cstrong\\u003eC Salah\\u003c/strong\\u003e → Paradigma imperatif menggunakan perintah langkah demi langkah, bukan berbasis ekspresi.\\u003c/li\\u003e\\u003cli\\u003e\\u003cstrong\\u003eD Benar\\u003c/strong\\u003e → Pemrograman fungsional mengutamakan ekspresi dan rekursi, bukan perubahan state seperti dalam pemrograman imperatif.\\u003c/li\\u003e\\u003c/ul\\u003e\\u003cp\\u003e\\u003cbr\\u003e\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":22,\"type\":\"multiple_choice\",\"user_answer_id\":57,\"user_answer_index\":1}}', 0, 2, 0.00, 20, 15, 0, 0, NULL, '2025-03-14 10:08:04', '2025-03-14 10:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `take_lessons`
--

CREATE TABLE `take_lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `lesson_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `topic_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `take_lessons`
--

INSERT INTO `take_lessons` (`id`, `lesson_id`, `user_id`, `topic_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(21, 1, 5, 1, NULL, '2025-03-14 06:06:24', '2025-03-14 06:06:24'),
(22, 2, 5, 1, NULL, '2025-03-14 06:06:28', '2025-03-14 06:06:28'),
(23, 3, 5, 1, NULL, '2025-03-14 06:29:39', '2025-03-14 06:29:39'),
(24, 4, 5, 1, NULL, '2025-03-14 07:13:44', '2025-03-14 07:13:44'),
(25, 5, 5, 1, NULL, '2025-03-14 07:18:37', '2025-03-14 07:18:37'),
(26, 6, 5, 1, NULL, '2025-03-14 07:34:55', '2025-03-14 07:34:55'),
(27, 7, 5, 1, NULL, '2025-03-14 07:35:12', '2025-03-14 07:35:12'),
(28, 8, 5, 2, NULL, '2025-03-14 07:58:23', '2025-03-14 07:58:23');

-- --------------------------------------------------------

--
-- Table structure for table `take_quests`
--

CREATE TABLE `take_quests` (
  `id` bigint UNSIGNED NOT NULL,
  `quest_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `score` double NOT NULL,
  `reward_exp` int NOT NULL,
  `reward_point` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `take_quests`
--

INSERT INTO `take_quests` (`id`, `quest_id`, `user_id`, `answer`, `is_correct`, `score`, `reward_exp`, `reward_point`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 7, 5, '{\"correct_answer\":\"C\",\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":7,\"user_answer\":\"C\",\"user_answer_index\":0}', 1, 100, 10, 10, NULL, '2025-03-14 08:02:24', '2025-03-14 08:02:24'),
(2, 7, 5, '{\"correct_answer\":\"C\",\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":7,\"user_answer\":\"C\",\"user_answer_index\":0}', 1, 100, 10, 10, NULL, '2025-03-14 10:15:27', '2025-03-14 10:15:27');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `updated_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Paradigma Pemrograman', 1, 1, '2025-03-13 03:35:24', '2025-03-13 03:35:24', NULL),
(2, 'Notasi Fungsional', 1, 1, '2025-03-13 06:57:27', '2025-03-13 06:57:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `angkatan` int NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT '2025-03-13 02:27:04',
  `total_point` int NOT NULL DEFAULT '0',
  `total_exp` int NOT NULL DEFAULT '0',
  `level_id` bigint UNSIGNED NOT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `nim`, `angkatan`, `email_verified_at`, `password`, `last_login`, `total_point`, `total_exp`, `level_id`, `created_by`, `updated_by`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Emely Angelica Lestari', 'emelyangelicalestari@gmail.com', '11S21052', 2021, NULL, '$2y$10$6zOM4MMIU1lX2Mo2R5YtTe56d9bQla.LOCPd9SLelU3JdO3Z5NUQ6', '2025-03-13 02:27:04', 0, 0, 1, 1, 1, NULL, NULL, '2025-03-13 02:44:00', '2025-03-13 08:55:15'),
(2, 'Enrico Hezkiel Sirait', 'enricohs30@gmail.com', '11S21034', 2021, NULL, '$2y$10$NRPP1Jut9tWAvo6B9S4ZfuvXfLPer/YJ1jNm4/aI6YelxD.6LkR6m', '2025-03-13 02:27:04', 0, 0, 1, 1, 1, NULL, NULL, '2025-03-13 02:48:17', '2025-03-13 02:48:17'),
(3, 'Boy Martahan Sitorus', 'sitorusboy0123@gmail.com', '11S21025', 2021, NULL, '$2y$10$6PmFkRfCO4HZh3.IopGSuuzU4m.yySUYeBbD9H/X5j7skK8tCGlya', '2025-03-13 02:27:04', 0, 0, 1, 1, 1, NULL, NULL, '2025-03-13 02:51:40', '2025-03-13 02:51:40'),
(4, 'David Vincent Gurning', 'ifs21001@students.del.ac.id', '11S21001', 2021, NULL, '$2y$10$YRtJCHmByWoeHxQdTm4be.5vX.vYlaBbd18SDl/4Om2ZwT2HSPpkK', '2025-03-13 02:27:04', 0, 0, 1, 1, 1, NULL, NULL, '2025-03-13 02:53:51', '2025-03-13 02:53:51'),
(5, 'Boy Sitorus', 'boyy@gmail.com', '11S21025', 2021, NULL, '$2y$10$bseEJmuJurSy1qcDLpgh1ugJpoMo6adYWJxGuyZQ2chvwnjOVWw0G', '2025-03-13 02:27:04', 451, 661, 4, 1, 1, NULL, NULL, '2025-03-13 10:17:02', '2025-03-14 10:15:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussions_lesson_id_foreign` (`lesson_id`),
  ADD KEY `discussions_user_id_foreign` (`user_id`);

--
-- Indexes for table `disc_replies`
--
ALTER TABLE `disc_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disc_replies_discussion_id_foreign` (`discussion_id`),
  ADD KEY `disc_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exercises_topic_id_foreign` (`topic_id`),
  ADD KEY `exercises_lesson_id_foreign` (`lesson_id`),
  ADD KEY `exercises_created_by_foreign` (`created_by`),
  ADD KEY `exercises_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `ex_answers`
--
ALTER TABLE `ex_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ex_answers_ex_question_id_foreign` (`ex_question_id`),
  ADD KEY `ex_answers_created_by_foreign` (`created_by`),
  ADD KEY `ex_answers_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `ex_questions`
--
ALTER TABLE `ex_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ex_questions_exercise_id_foreign` (`exercise_id`),
  ADD KEY `ex_questions_created_by_foreign` (`created_by`),
  ADD KEY `ex_questions_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_topic_id_foreign` (`topic_id`),
  ADD KEY `lessons_created_by_foreign` (`created_by`),
  ADD KEY `lessons_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `levels_level_unique` (`level`),
  ADD KEY `levels_created_by_foreign` (`created_by`),
  ADD KEY `levels_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `markets`
--
ALTER TABLE `markets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `markets_created_by_foreign` (`created_by`),
  ADD KEY `markets_updated_by_foreign` (`updated_by`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `quests`
--
ALTER TABLE `quests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quests_created_by_foreign` (`created_by`),
  ADD KEY `quests_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `quest_answers`
--
ALTER TABLE `quest_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quest_answers_quest_id_foreign` (`quest_id`),
  ADD KEY `quest_answers_created_by_foreign` (`created_by`),
  ADD KEY `quest_answers_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `take_exercises`
--
ALTER TABLE `take_exercises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `take_exercises_exercise_id_foreign` (`exercise_id`),
  ADD KEY `take_exercises_topic_id_foreign` (`topic_id`),
  ADD KEY `take_exercises_lesson_id_foreign` (`lesson_id`),
  ADD KEY `take_exercises_user_id_foreign` (`user_id`);

--
-- Indexes for table `take_lessons`
--
ALTER TABLE `take_lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `take_quests`
--
ALTER TABLE `take_quests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `take_quests_quest_id_foreign` (`quest_id`),
  ADD KEY `take_quests_user_id_foreign` (`user_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topics_created_by_foreign` (`created_by`),
  ADD KEY `topics_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_created_by_foreign` (`created_by`),
  ADD KEY `users_updated_by_foreign` (`updated_by`),
  ADD KEY `users_level_id_foreign` (`level_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `disc_replies`
--
ALTER TABLE `disc_replies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ex_answers`
--
ALTER TABLE `ex_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `ex_questions`
--
ALTER TABLE `ex_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `markets`
--
ALTER TABLE `markets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quests`
--
ALTER TABLE `quests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `quest_answers`
--
ALTER TABLE `quest_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `take_exercises`
--
ALTER TABLE `take_exercises`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `take_lessons`
--
ALTER TABLE `take_lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `take_quests`
--
ALTER TABLE `take_quests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `discussions_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disc_replies`
--
ALTER TABLE `disc_replies`
  ADD CONSTRAINT `disc_replies_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disc_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exercises`
--
ALTER TABLE `exercises`
  ADD CONSTRAINT `exercises_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exercises_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exercises_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exercises_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ex_answers`
--
ALTER TABLE `ex_answers`
  ADD CONSTRAINT `ex_answers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ex_answers_ex_question_id_foreign` FOREIGN KEY (`ex_question_id`) REFERENCES `ex_questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ex_answers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ex_questions`
--
ALTER TABLE `ex_questions`
  ADD CONSTRAINT `ex_questions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ex_questions_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ex_questions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lessons_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lessons_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `levels`
--
ALTER TABLE `levels`
  ADD CONSTRAINT `levels_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `levels_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `markets`
--
ALTER TABLE `markets`
  ADD CONSTRAINT `markets_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `markets_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quests`
--
ALTER TABLE `quests`
  ADD CONSTRAINT `quests_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quests_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quest_answers`
--
ALTER TABLE `quest_answers`
  ADD CONSTRAINT `quest_answers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quest_answers_quest_id_foreign` FOREIGN KEY (`quest_id`) REFERENCES `quests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quest_answers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `take_exercises`
--
ALTER TABLE `take_exercises`
  ADD CONSTRAINT `take_exercises_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `take_exercises_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `take_exercises_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `take_exercises_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `take_quests`
--
ALTER TABLE `take_quests`
  ADD CONSTRAINT `take_quests_quest_id_foreign` FOREIGN KEY (`quest_id`) REFERENCES `quests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `take_quests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `topics_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
