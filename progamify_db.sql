/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.9.4-MariaDB : Database - progamify
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`progamify` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `progamify`;

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_super` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admins` */

insert  into `admins`(`id`,`name`,`email`,`password`,`is_super`,`remember_token`,`deleted_at`,`created_at`,`updated_at`) values 
(1,'Super Admin','super@gmail.com','$2y$10$9bVQg9stwVXv8MB8YjFeKu9U2KpQujiMpJmDfavCHuMa47nFDvASm',1,NULL,NULL,'2025-03-13 09:40:55','2025-03-13 09:40:55'),
(2,'Emely Angelica Lestari','emeadmin@gmail.com','$2y$10$Mxae2P2Akzt2PHmfuNfIxOzs87cXvlmrLqj99eP3LFwCbypLYXq52',0,NULL,NULL,'2025-03-13 09:42:12','2025-03-13 09:42:12'),
(3,'Boy Martahan Sitorus','boyadmin@gmail.com','$2y$10$qAhXbwFx2TJiJjIv0KmFxe5/Gfkw5wDuJ4DgkMAdEv6MsoSNACI2a',0,NULL,NULL,'2025-03-13 09:42:49','2025-03-13 09:42:49'),
(4,'Enrico Hezkiel Sirait','enricoadmin@gmail.com','$2y$10$TjI8JvxHdqoFp0KpqHs/j.nNRxttBz0VmteO52jCw5ADZCIzasX8q',0,NULL,NULL,'2025-03-13 09:43:25','2025-03-13 09:43:25'),
(5,'Bu Ranty','buranty@gmail.com','$2y$10$sTRA4FeS3p4EzvneVya.xOMSbey4.oNB4afuOhQby5JTEnV7tFlve',0,NULL,NULL,'2025-03-16 20:58:04','2025-03-16 20:58:04'),
(12,'Admin testing create','test1@gmail.com','$2y$10$OQga43lxcMf5TCaYiCufw..6iclMJsVXXpp4i1HRmktt.MKIPFzYu',0,NULL,NULL,'2025-03-17 16:07:38','2025-03-17 16:07:38'),
(13,'Admin testing create anothe','testing@gmail.com','$2y$10$vVeMx75CZVZzj0aw2K8GD.iBUWEMCehW7Fg1491xndDtwIexmHTXS',0,NULL,NULL,'2025-03-17 16:16:05','2025-03-17 16:44:43');

/*Table structure for table `ex_answers` */

DROP TABLE IF EXISTS `ex_answers`;

CREATE TABLE `ex_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  `ex_question_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ex_answers_ex_question_id_foreign` (`ex_question_id`),
  KEY `ex_answers_created_by_foreign` (`created_by`),
  KEY `ex_answers_updated_by_foreign` (`updated_by`),
  CONSTRAINT `ex_answers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ex_answers_ex_question_id_foreign` FOREIGN KEY (`ex_question_id`) REFERENCES `ex_questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ex_answers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ex_answers` */

insert  into `ex_answers`(`id`,`content`,`is_correct`,`ex_question_id`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values 
(1,'<p>&nbsp;Program terdiri dari objek yang berinteraksi satu sama lain</p>',0,1,1,1,NULL,'2025-03-13 10:47:42','2025-03-13 10:47:42'),
(2,'<p>Program berjalan berdasarkan instruksi langkah demi langkah</p>',1,1,1,1,NULL,'2025-03-13 10:47:42','2025-03-13 10:47:42'),
(3,'<p>Program menggunakan fungsi rekursif sebagai elemen utama</p>',0,1,1,1,NULL,'2025-03-13 10:47:42','2025-03-13 10:47:42'),
(4,'<p>Program dikendalikan oleh aturan logika tanpa instruksi berurutan</p>',0,1,1,1,NULL,'2025-03-13 10:47:42','2025-03-13 10:47:42'),
(9,'false',1,3,1,1,NULL,'2025-03-13 10:53:00','2025-03-13 10:53:00'),
(10,'Haskell',1,4,1,1,NULL,'2025-03-13 10:53:49','2025-03-13 10:53:49'),
(11,'<p>Prolog</p>',1,5,1,1,NULL,'2025-03-13 11:00:17','2025-03-13 11:00:17'),
(12,'<p>SQL</p>',1,5,1,1,NULL,'2025-03-13 11:00:17','2025-03-13 11:00:17'),
(13,'<p>C</p>',0,5,1,1,NULL,'2025-03-13 11:00:17','2025-03-13 11:00:17'),
(14,'<p>JavaScript</p>',0,5,1,1,NULL,'2025-03-13 11:00:17','2025-03-13 11:00:17'),
(15,'<p>Menyusun kode berdasarkan fungsi matematika<br><br></p>',0,6,1,1,NULL,'2025-03-13 11:03:11','2025-03-13 11:03:11'),
(16,'<p>Menggunakan objek yang memiliki atribut dan metode</p>',1,6,1,1,NULL,'2025-03-13 11:03:11','2025-03-13 11:03:11'),
(17,'<p>Menjalankan instruksi secara berurutan seperti resep masakan</p>',0,6,1,1,NULL,'2025-03-13 11:03:11','2025-03-13 11:03:11'),
(18,'<p>Memanipulasi data secara langsung tanpa memperhatikan strukturnya</p>',0,6,1,1,NULL,'2025-03-13 11:03:11','2025-03-13 11:03:11'),
(19,'true',1,7,1,1,NULL,'2025-03-13 11:03:50','2025-03-13 11:03:50'),
(20,'<p>&nbsp;Menjalankan tugas secara berurutan satu per satu</p>',0,8,1,1,NULL,'2025-03-13 11:07:17','2025-03-13 11:07:17'),
(21,'<p>Menjalankan banyak tugas secara bersamaan</p>',1,8,1,1,NULL,'2025-03-13 11:07:17','2025-03-13 11:07:17'),
(22,'<p>Menggunakan fungsi tanpa mengubah data secara langsung</p>',0,8,1,1,NULL,'2025-03-13 11:07:17','2025-03-13 11:07:17'),
(23,'<p>Menjalankan kode berdasarkan aturan logika</p>',0,8,1,1,NULL,'2025-03-13 11:07:17','2025-03-13 11:07:17'),
(24,'<p>Sistem operasi</p>',1,9,1,1,NULL,'2025-03-13 11:09:23','2025-03-13 11:09:23'),
(25,'<p>Server web</p>',1,9,1,1,NULL,'2025-03-13 11:09:23','2025-03-13 11:09:23'),
(26,'<p>Pengolahan database sederhana</p>',0,9,1,1,NULL,'2025-03-13 11:09:23','2025-03-13 11:09:23'),
(27,'<p>Game multiplayer</p>',0,9,1,1,NULL,'2025-03-13 11:09:23','2025-03-13 11:09:23'),
(28,'false',1,10,1,1,NULL,'2025-03-13 11:11:20','2025-03-13 11:11:20'),
(29,'<p>Prosedural</p>',0,11,1,1,NULL,'2025-03-13 11:14:44','2025-03-13 11:14:44'),
(30,'<p>Fungsional</p>',1,11,1,1,NULL,'2025-03-13 11:14:44','2025-03-13 11:14:44'),
(31,'<p>Berorientasi Objek</p>',0,11,1,1,NULL,'2025-03-13 11:14:44','2025-03-13 11:14:44'),
(32,'<p>Deklaratif</p>',0,11,1,1,NULL,'2025-03-13 11:14:44','2025-03-13 11:14:44'),
(33,'Prolog',1,12,1,1,NULL,'2025-03-13 11:33:45','2025-03-13 11:33:45'),
(34,'true',1,13,1,1,NULL,'2025-03-13 11:34:24','2025-03-13 11:34:24'),
(35,'<p>Java</p>',1,14,1,1,NULL,'2025-03-13 11:54:51','2025-03-13 11:54:51'),
(36,'<p>Python</p>',1,14,1,1,NULL,'2025-03-13 11:54:51','2025-03-13 11:54:51'),
(37,'<p>Fortran</p>',0,14,1,1,NULL,'2025-03-13 11:54:51','2025-03-13 11:54:51'),
(38,'<p>C++</p>',1,14,1,1,NULL,'2025-03-13 11:54:51','2025-03-13 11:54:51'),
(39,'<p>Prosedural</p>',0,15,1,1,NULL,'2025-03-13 13:31:01','2025-03-13 13:31:01'),
(40,'<p>Fungsional</p>',0,15,1,1,NULL,'2025-03-13 13:31:01','2025-03-13 13:31:01'),
(41,'<p>Deklaratif</p>',1,15,1,1,NULL,'2025-03-13 13:31:01','2025-03-13 13:31:01'),
(42,'<p>Konkruen</p>',0,15,1,1,NULL,'2025-03-13 13:31:01','2025-03-13 13:31:01'),
(43,'<p>Paradigma <strong>konkuren</strong> memungkinkan eksekusi banyak tugas secara bersamaan, meningkatkan efisiensi dan kecepatan sistem. Dalam server web dan game multiplayer, banyak permintaan harus diproses serentak agar pengguna tidak mengalami keterlambatan.</p>',0,16,1,1,NULL,'2025-03-13 13:31:59','2025-03-13 13:31:59'),
(44,'<p>Paradigma pemrograman prosedural adalah metode penulisan kode yang berfokus pada instruksi langkah demi langkah secara berurutan untuk menyelesaikan suatu masalah.</p>',0,17,1,1,NULL,'2025-03-13 13:32:38','2025-03-13 13:32:38'),
(45,'false',1,18,1,1,NULL,'2025-03-13 13:33:59','2025-03-13 13:33:59'),
(46,'<p>Kode lebih bersih dan mudah dipahami</p>',1,19,1,1,NULL,'2025-03-13 13:35:58','2025-03-13 13:35:58'),
(47,'<p>Minim bug karena tidak mengubah data langsung</p>',1,19,1,1,NULL,'2025-03-13 13:35:58','2025-03-13 13:35:58'),
(48,'<p>Lebih efisien daripada prosedural dalam semua kasus</p>',0,19,1,1,NULL,'2025-03-13 13:35:58','2025-03-13 13:35:58'),
(49,'<p>Dapat digunakan kembali tanpa efek samping</p>',0,19,1,1,NULL,'2025-03-13 13:35:58','2025-03-13 13:35:58'),
(50,'Prolog',1,20,1,1,NULL,'2025-03-13 13:38:31','2025-03-13 13:38:31'),
(51,'<p>Python</p>',0,2,1,1,NULL,'2025-03-13 13:39:10','2025-03-13 13:39:10'),
(52,'<p>C</p>',1,2,1,1,NULL,'2025-03-13 13:39:10','2025-03-13 13:39:10'),
(53,'<p>Pascal</p>',1,2,1,1,NULL,'2025-03-13 13:39:10','2025-03-13 13:39:10'),
(54,'<p>Java</p>',0,2,1,1,NULL,'2025-03-13 13:39:10','2025-03-13 13:39:10'),
(55,'false',1,21,1,1,NULL,'2025-03-13 15:23:26','2025-03-13 15:23:26'),
(56,'<p>Paradigma imperatif lebih berfokus pada \"apa yang harus dilakukan\" dibandingkan \"bagaimana cara melakukannya\".</p>',0,22,1,1,NULL,'2025-03-13 15:24:42','2025-03-13 15:24:42'),
(57,'<p>&nbsp;Paradigma fungsional menggunakan variabel yang dapat diubah secara bebas untuk menyimpan nilai sementara.</p>',0,22,1,1,NULL,'2025-03-13 15:24:42','2025-03-13 15:24:42'),
(58,'<p>Paradigma imperatif menggunakan pendekatan berbasis ekspresi tanpa efek samping.</p>',0,22,1,1,NULL,'2025-03-13 15:24:42','2025-03-13 15:24:42'),
(59,'<p>Paradigma fungsional lebih mengandalkan ekspresi dan rekursi dibandingkan perintah langkah demi langkah.</p>',1,22,1,1,NULL,'2025-03-13 15:24:42','2025-03-13 15:24:42'),
(60,'Rekursi',1,23,1,1,NULL,'2025-03-13 15:26:08','2025-03-13 15:26:08'),
(61,'<p>Judul Fungsi</p>',0,24,1,1,NULL,'2025-03-13 15:27:26','2025-03-13 15:27:26'),
(62,'<p>Definisi &amp; Spesifikasi</p>',1,24,1,1,NULL,'2025-03-13 15:27:26','2025-03-13 15:27:26'),
(63,'<p>Realisasi</p>',0,24,1,1,NULL,'2025-03-13 15:27:26','2025-03-13 15:27:26'),
(64,'<p>Aplikasi</p>',0,24,1,1,NULL,'2025-03-13 15:27:26','2025-03-13 15:27:26'),
(65,'<p>Ekspresi Fungsional Dasar</p>',1,25,1,1,NULL,'2025-03-13 15:30:06','2025-03-13 15:30:06'),
(66,'<p>&nbsp;Ekspresi Kondisional</p>',1,25,1,1,NULL,'2025-03-13 15:30:06','2025-03-13 15:30:06'),
(67,'<p>Ekspresi Rekursif</p>',1,25,1,1,NULL,'2025-03-13 15:30:06','2025-03-13 15:30:06'),
(68,'<p>Ekspresi Perulangan (Loop)</p>',0,25,1,1,NULL,'2025-03-13 15:30:06','2025-03-13 15:30:06'),
(69,'false',1,26,1,1,NULL,'2025-03-13 15:32:54','2025-03-13 15:32:54'),
(70,'true',1,27,1,1,NULL,'2025-03-13 15:34:12','2025-03-13 15:34:12'),
(71,'false',1,28,1,1,NULL,'2025-03-13 15:40:41','2025-03-13 15:40:41'),
(72,'<p>Menggunakan variabel mutable secara luas</p>',0,29,1,1,NULL,'2025-03-13 15:41:43','2025-03-13 15:41:43'),
(73,'<p>Memodifikasi state global secara langsung</p>',0,29,1,1,NULL,'2025-03-13 15:41:43','2025-03-13 15:41:43'),
(74,'<p>Berbasis ekspresi dan tidak memiliki efek samping</p>',1,29,1,1,NULL,'2025-03-13 15:41:43','2025-03-13 15:41:43'),
(75,'<p>Menggunakan perintah langkah demi langkah</p>',0,29,1,1,NULL,'2025-03-13 15:41:43','2025-03-13 15:41:43'),
(76,'Rekursi',1,30,1,1,NULL,'2025-03-13 15:42:40','2025-03-13 15:42:40'),
(77,'<p>Ekspresi Fungsional Dasar</p>',1,31,1,1,NULL,'2025-03-13 15:44:13','2025-03-13 15:44:13'),
(78,'<p>Ekspresi Kondisional</p>',1,31,1,1,NULL,'2025-03-13 15:44:13','2025-03-13 15:44:13'),
(79,'<p>Ekspresi Rekursif</p>',1,31,1,1,NULL,'2025-03-13 15:44:13','2025-03-13 15:44:13'),
(80,'<p>Ekspresi Perulangan (Loop)</p>',0,31,1,1,NULL,'2025-03-13 15:44:13','2025-03-13 15:44:13'),
(81,'<p>Paradigma imperatif berfokus pada langkah-langkah eksekusi dengan mengubah state program menggunakan perulangan dan variabel yang dapat diubah. Sementara itu, paradigma fungsional menggunakan fungsi murni yang tidak mengubah state global dan mengandalkan ekspresi serta rekursi untuk pemrosesan data.</p>',0,32,1,1,NULL,'2025-03-13 15:44:52','2025-03-13 15:44:52'),
(82,'false',1,33,1,1,NULL,'2025-03-13 15:45:22','2025-03-13 15:45:22'),
(83,'<p>Judul Fungsi</p>',0,34,1,1,NULL,'2025-03-13 15:46:31','2025-03-13 15:46:31'),
(84,'<p>Definisi &amp; Spesifikasi</p>',1,34,1,1,NULL,'2025-03-13 15:46:31','2025-03-13 15:46:31'),
(85,'<p>Realisasi</p>',0,34,1,1,NULL,'2025-03-13 15:46:31','2025-03-13 15:46:31'),
(86,'<p>Aplikasi</p>',0,34,1,1,NULL,'2025-03-13 15:46:31','2025-03-13 15:46:31'),
(87,'Pure Function',1,35,1,1,NULL,'2025-03-13 15:47:15','2025-03-13 15:47:15'),
(88,'<p>Penggunaan fungsi murni</p>',1,36,1,1,NULL,'2025-03-13 15:48:34','2025-03-13 15:48:34'),
(89,'<p>Hindari penggunaan variabel mutable</p>',1,36,1,1,NULL,'2025-03-13 15:48:34','2025-03-13 15:48:34'),
(90,'<p>Rekursi untuk menggantikan loop</p>',1,36,1,1,NULL,'2025-03-13 15:48:34','2025-03-13 15:48:34'),
(91,'<p>Menggunakan statement goto untuk alur program</p>',0,36,1,1,NULL,'2025-03-13 15:48:34','2025-03-13 15:48:34'),
(92,'false',1,37,1,1,NULL,'2025-03-13 17:01:28','2025-03-13 17:01:28'),
(93,'<p><strong>7 &lt; 5</strong></p>',0,38,1,1,NULL,'2025-03-13 17:03:19','2025-03-13 17:03:19'),
(94,'<p><strong>&nbsp;7 = 5</strong></p>',0,38,1,1,NULL,'2025-03-13 17:03:19','2025-03-13 17:03:19'),
(95,'<p><strong>7 &gt; 5</strong></p>',1,38,1,1,NULL,'2025-03-13 17:03:19','2025-03-13 17:03:19'),
(96,'<p>7 ≠ 7</p><p><br></p>',0,38,1,1,NULL,'2025-03-13 17:03:19','2025-03-13 17:03:19'),
(97,'3',1,39,1,1,NULL,'2025-03-13 17:05:46','2025-03-13 17:05:46'),
(98,'<p>10 &gt; 5</p>',1,40,1,1,NULL,'2025-03-13 17:07:47','2025-03-13 17:07:47'),
(99,'<p>3 + 4 = 8</p>',0,40,1,1,NULL,'2025-03-13 17:07:47','2025-03-13 17:07:47'),
(100,'<p>&nbsp;7 ≠ 6</p>',1,40,1,1,NULL,'2025-03-13 17:07:47','2025-03-13 17:07:47'),
(101,'<p>2 * 2 = 4</p>',1,40,1,1,NULL,'2025-03-13 17:07:47','2025-03-13 17:07:47'),
(102,'8',1,41,1,1,NULL,'2025-03-13 17:11:03','2025-03-13 17:11:03'),
(103,'true',1,42,1,1,NULL,'2025-03-13 17:12:00','2025-03-13 17:12:00'),
(104,'<p>5</p>',1,43,1,1,NULL,'2025-03-13 17:26:00','2025-03-13 17:26:00'),
(105,'<p>4</p>',0,43,1,1,NULL,'2025-03-13 17:26:01','2025-03-13 17:26:01'),
(106,'<p>3</p>',0,43,1,1,NULL,'2025-03-13 17:26:01','2025-03-13 17:26:01'),
(107,'<p>7</p>',0,43,1,1,NULL,'2025-03-13 17:26:01','2025-03-13 17:26:01'),
(108,'false',1,44,1,1,NULL,'2025-03-13 17:26:44','2025-03-13 17:26:44'),
(109,'<p>Menghemat memori</p>',0,45,1,1,NULL,'2025-03-13 18:03:01','2025-03-13 18:03:01'),
(110,'<p>Menghindari evaluasi berulang dan meningkatkan keterbacaan</p>',1,45,1,1,NULL,'2025-03-13 18:03:01','2025-03-13 18:03:01'),
(111,'<p>Mengubah hasil perhitungan menjadi lebih akurat</p>',0,45,1,1,NULL,'2025-03-13 18:03:01','2025-03-13 18:03:01'),
(112,'<p>Memungkinkan ekspresi digunakan di luar fungsi</p>',0,45,1,1,NULL,'2025-03-13 18:03:01','2025-03-13 18:03:01'),
(113,'25',1,46,1,1,NULL,'2025-03-13 18:04:44','2025-03-13 18:04:44'),
(114,'false',1,47,1,1,NULL,'2025-03-13 18:05:47','2025-03-13 18:05:47'),
(115,'true',1,48,1,1,NULL,'2025-03-14 03:18:57','2025-03-14 03:18:57'),
(116,'<p>&nbsp;(3 + 4) * 5&nbsp;</p>',0,49,1,1,NULL,'2025-03-14 03:20:43','2025-03-14 03:20:43'),
(117,'<p>&nbsp;(* (+ 3 4) 5)&nbsp;</p>',1,49,1,1,NULL,'2025-03-14 03:20:43','2025-03-14 03:20:43'),
(118,'<p>&nbsp;(3 4 +) 5 *&nbsp;</p>',0,49,1,1,NULL,'2025-03-14 03:20:43','2025-03-14 03:20:43'),
(119,'<p>&nbsp;(3 * 4) + 5&nbsp;</p>',0,49,1,1,NULL,'2025-03-14 03:20:43','2025-03-14 03:20:43'),
(120,'2',1,50,1,1,NULL,'2025-03-14 03:21:24','2025-03-14 03:21:24'),
(121,'<p>&nbsp;4 + 3 = 7&nbsp;</p>',1,51,1,1,NULL,'2025-03-14 03:23:50','2025-03-14 03:23:50'),
(122,'<p>&nbsp;6 &gt; 9&nbsp;</p>',0,51,1,1,NULL,'2025-03-14 03:23:50','2025-03-14 03:23:50'),
(123,'<p>&nbsp;10 mod 2 = 0&nbsp;</p>',1,51,1,1,NULL,'2025-03-14 03:23:50','2025-03-14 03:23:50'),
(124,'<p>&nbsp;(5 &gt; 2) and (7 &gt; 3)&nbsp;</p>',1,51,1,1,NULL,'2025-03-14 03:23:50','2025-03-14 03:23:50'),
(125,'true',1,52,1,1,NULL,'2025-03-14 03:25:25','2025-03-14 03:25:25'),
(126,'25',1,53,1,1,NULL,'2025-03-14 03:29:11','2025-03-14 03:29:11'),
(127,'<p>&nbsp;7 ≠ 7&nbsp;</p>',1,54,1,1,NULL,'2025-03-14 03:30:45','2025-03-14 03:30:45'),
(128,'<p>&nbsp;5 &gt; 2&nbsp;</p>',0,54,1,1,NULL,'2025-03-14 03:30:45','2025-03-14 03:30:45'),
(129,'<p>&nbsp;6 mod 3 = 0&nbsp;</p>',0,54,1,1,NULL,'2025-03-14 03:30:45','2025-03-14 03:30:45'),
(130,'<p>&nbsp;(2 &lt; 4) or (5 &gt; 8)&nbsp;</p>',0,54,1,1,NULL,'2025-03-14 03:30:45','2025-03-14 03:30:45'),
(131,'32+4*',1,55,1,1,NULL,'2025-03-14 03:33:27','2025-03-14 03:33:27'),
(132,'false',1,56,1,1,NULL,'2025-03-14 03:34:19','2025-03-14 03:34:19'),
(133,'<p>&nbsp;FX2(3)&nbsp;</p>',1,57,1,1,NULL,'2025-03-14 03:37:55','2025-03-14 03:37:55'),
(134,'<p>&nbsp;3 + 3 * 2&nbsp;</p>',1,57,1,1,NULL,'2025-03-14 03:37:55','2025-03-14 03:37:55'),
(135,'<p>&nbsp;10 - 1&nbsp;</p>',1,57,1,1,NULL,'2025-03-14 03:37:55','2025-03-14 03:37:55'),
(136,'<p>&nbsp;81 div 9&nbsp;</p>',1,57,1,1,NULL,'2025-03-14 03:37:55','2025-03-14 03:37:55'),
(137,'<p>Ekspresi kondisional selalu memiliki lebih dari satu kondisi.</p>',0,58,1,1,NULL,'2025-03-14 03:47:49','2025-03-14 03:47:49'),
(138,'<p>Analisa kasus dalam ekspresi kondisional harus mencakup semua kemungkinan.</p>',1,58,1,1,NULL,'2025-03-14 03:47:49','2025-03-14 03:47:49'),
(139,'<p>Setiap ekspresi kondisional harus memiliki lebih dari satu ekspresi yang dijalankan.</p>',0,58,1,1,NULL,'2025-03-14 03:47:49','2025-03-14 03:47:49'),
(140,'<p>Ekspresi kondisional hanya dapat digunakan dalam bahasa pemrograman Python.</p>',0,58,1,1,NULL,'2025-03-14 03:47:49','2025-03-14 03:47:49'),
(141,'<p>Memastikan bahwa ada hasil yang dieksekusi jika kondisi utama tidak terpenuhi.</p>',1,59,1,1,NULL,'2025-03-14 04:01:37','2025-03-14 04:01:37'),
(142,'<p>Mempercepat eksekusi program tanpa perlu mengevaluasi kondisi.</p>',0,59,1,1,NULL,'2025-03-14 04:01:37','2025-03-14 04:01:37'),
(143,'<p>Mengizinkan program untuk menjalankan beberapa kondisi sekaligus.</p>',0,59,1,1,NULL,'2025-03-14 04:01:37','2025-03-14 04:01:37'),
(144,'<p>Membuat program lebih sulit dibaca dan dipahami.</p>',0,59,1,1,NULL,'2025-03-14 04:01:37','2025-03-14 04:01:37'),
(145,'<p>True</p>',1,60,1,1,NULL,'2025-03-14 04:09:00','2025-03-14 04:09:00'),
(146,'<p>False</p>',0,60,1,1,NULL,'2025-03-14 04:09:00','2025-03-14 04:09:00'),
(147,'<p>Error</p>',0,60,1,1,NULL,'2025-03-14 04:09:00','2025-03-14 04:09:00'),
(148,'<p>None</p>',0,60,1,1,NULL,'2025-03-14 04:09:00','2025-03-14 04:09:00'),
(149,'false',1,61,1,1,NULL,'2025-03-14 04:21:23','2025-03-14 04:21:23'),
(150,'<p>Mempermudah pemrograman dengan mengelompokkan data yang berkaitan.</p>',1,62,1,1,NULL,'2025-03-14 08:16:15','2025-03-14 08:16:15'),
(151,'<p>Mengurangi jumlah variabel dalam kode.</p>',0,62,1,1,NULL,'2025-03-14 08:16:15','2025-03-14 08:16:15'),
(152,'<p>Menghilangkan kebutuhan untuk menggunakan tipe data dasar.</p>',0,62,1,1,NULL,'2025-03-14 08:16:15','2025-03-14 08:16:15'),
(153,'<p>Menghemat memori lebih baik dibandingkan tipe data dasar.</p>',0,62,1,1,NULL,'2025-03-14 08:16:15','2025-03-14 08:16:15'),
(154,'false',1,63,1,1,NULL,'2025-03-14 08:16:57','2025-03-14 08:16:57'),
(155,'<p>Mengurangi jumlah tipe data dalam program.</p>',0,64,1,1,NULL,'2025-03-14 08:26:59','2025-03-14 08:26:59'),
(156,'<p>Menggabungkan beberapa tipe data menjadi satu struktur.</p>',1,64,1,1,NULL,'2025-03-14 08:26:59','2025-03-14 08:26:59'),
(157,'<p>Menyimpan hanya satu nilai dalam satu waktu.</p>',0,64,1,1,NULL,'2025-03-14 08:26:59','2025-03-14 08:26:59'),
(158,'<p>Menghapus tipe data dasar dalam program.</p>',0,64,1,1,NULL,'2025-03-14 08:26:59','2025-03-14 08:26:59'),
(159,'false',1,65,1,1,NULL,'2025-03-14 08:27:31','2025-03-14 08:27:31'),
(164,'<p>Menggabungkan beberapa tipe data.</p>',0,66,1,1,NULL,'2025-03-14 08:34:51','2025-03-14 08:34:51'),
(165,'<p>Mengambil nilai dari suatu type bentukan.</p>',1,66,1,1,NULL,'2025-03-14 08:34:51','2025-03-14 08:34:51'),
(166,'<p>Membuat instance baru dari suatu type bentukan.</p>',0,66,1,1,NULL,'2025-03-14 08:34:51','2025-03-14 08:34:51'),
(167,'<p>Menyimpan data lebih efisien.</p>',0,66,1,1,NULL,'2025-03-14 08:34:51','2025-03-14 08:34:51'),
(168,'false',1,67,1,1,NULL,'2025-03-14 08:35:57','2025-03-14 08:35:57'),
(169,'false',1,68,1,1,NULL,'2025-03-14 09:57:35','2025-03-14 09:57:35'),
(170,'<p>&nbsp;Ekspresi kondisional selalu memiliki lebih dari satu kondisi.&nbsp;</p>',0,69,1,1,NULL,'2025-03-14 10:27:06','2025-03-14 10:27:06'),
(171,'<p>Evaluasi ekspresi kondisional dilakukan dengan mengevaluasi setiap kondisi hingga menemukan kondisi yang benar.&nbsp;</p>',1,69,1,1,NULL,'2025-03-14 10:27:06','2025-03-14 10:27:06'),
(172,'<p>Operator AND then selalu mengevaluasi semua kondisi, meskipun kondisi pertama sudah salah.&nbsp;</p>',0,69,1,1,NULL,'2025-03-14 10:27:06','2025-03-14 10:27:06'),
(173,'<p>&nbsp;Ekspresi kondisional tidak memerlukan analisa kasus.&nbsp;</p>',0,69,1,1,NULL,'2025-03-14 10:27:06','2025-03-14 10:27:06'),
(174,'true',1,70,1,1,NULL,'2025-03-14 10:28:10','2025-03-14 10:28:10'),
(175,'Short-circuiting',1,71,1,1,NULL,'2025-03-14 10:29:34','2025-03-14 10:29:34'),
(176,'<p><strong>Depend on</strong> adalah cara menulis ekspresi kondisional dalam bentuk yang lebih sederhana, sering digunakan dalam logika formal. Sementara itu, <strong>if-then-else</strong> lebih fleksibel dan umum digunakan dalam berbagai bahasa pemrograman seperti Python, Java, dan C++.&nbsp;</p>',0,72,1,1,NULL,'2025-03-14 10:31:04','2025-03-14 10:31:04'),
(177,'<p>&nbsp;Else memastikan ada hasil default jika tidak ada kondisi yang terpenuhi.&nbsp;</p>',1,73,1,1,NULL,'2025-03-14 10:32:14','2025-03-14 10:32:14'),
(178,'<p>&nbsp;Else mempercepat eksekusi program dengan menghindari evaluasi kondisi.&nbsp;</p>',0,73,1,1,NULL,'2025-03-14 10:32:14','2025-03-14 10:32:14'),
(179,'<p>&nbsp;Else membuat program hanya memiliki satu kondisi yang bisa dieksekusi.&nbsp;</p>',0,73,1,1,NULL,'2025-03-14 10:32:14','2025-03-14 10:32:14'),
(180,'<p>&nbsp;Else hanya dapat digunakan dalam bahasa Python.&nbsp;</p>',0,73,1,1,NULL,'2025-03-14 10:32:14','2025-03-14 10:32:14'),
(181,'<p>if nilai &gt; 75:<br>&nbsp; &nbsp; print(\"Bagus\")<br>else:<br>&nbsp; &nbsp; print(\"Perlu perbaikan\")<br><br></p>',0,74,1,1,NULL,'2025-03-14 10:34:25','2025-03-14 10:34:25'),
(182,'<p>if nilai &lt; 75:<br>&nbsp; &nbsp; print(\"Bagus\")<br>else:<br>&nbsp; &nbsp; print(\"Perlu perbaikan\")<br><br></p>',0,74,1,1,NULL,'2025-03-14 10:34:25','2025-03-14 10:34:25'),
(183,'<p>if nilai = 75:<br>&nbsp; &nbsp; print(\"Bagus\")<br>else:<br>&nbsp; &nbsp; print(\"Perlu perbaikan\")<br><br></p>',0,74,1,1,NULL,'2025-03-14 10:34:25','2025-03-14 10:34:25'),
(184,'<p>if nilai &gt;= 75:<br>&nbsp; &nbsp; print(\"Bagus\")<br>else:<br>&nbsp; &nbsp; print(\"Perlu perbaikan\")<br><br></p>',1,74,1,1,NULL,'2025-03-14 10:34:25','2025-03-14 10:34:25'),
(185,'<p>&nbsp;Ekspresi kondisional digunakan untuk mengambil keputusan dalam program.&nbsp;</p>',1,75,1,1,NULL,'2025-03-14 10:35:39','2025-03-14 10:35:39'),
(186,'<p>&nbsp;Evaluasi kondisi dilakukan secara acak dalam program.&nbsp;</p>',0,75,1,1,NULL,'2025-03-14 10:35:39','2025-03-14 10:35:39'),
(187,'<p>&nbsp;Setiap ekspresi kondisional harus mencakup semua kemungkinan kondisi.&nbsp;</p>',1,75,1,1,NULL,'2025-03-14 10:35:39','2025-03-14 10:35:39'),
(188,'<p>&nbsp;Operator AND then menghentikan evaluasi jika kondisi pertama salah.&nbsp;</p>',1,75,1,1,NULL,'2025-03-14 10:35:39','2025-03-14 10:35:39'),
(189,'false',1,76,1,1,NULL,'2025-03-14 10:37:01','2025-03-14 10:37:01'),
(190,'false',1,77,1,1,NULL,'2025-03-15 09:36:33','2025-03-15 09:36:33'),
(191,'<p>&nbsp;Integer</p>',0,78,1,1,NULL,'2025-03-15 09:37:57','2025-03-15 09:37:57'),
(192,'<p><br>String<br><br></p>',0,78,1,1,NULL,'2025-03-15 09:37:57','2025-03-15 09:37:57'),
(193,'<p>Koordinat (x, y)</p>',1,78,1,1,NULL,'2025-03-15 09:37:57','2025-03-15 09:37:57'),
(194,'<p>&nbsp;Boolean</p>',0,78,1,1,NULL,'2025-03-15 09:37:57','2025-03-15 09:37:57'),
(195,'<p>&nbsp;Mempermudah pemrograman</p>',1,79,1,1,NULL,'2025-03-15 09:39:52','2025-03-15 09:39:52'),
(196,'<p>Mempercepat eksekusi program</p>',0,79,1,1,NULL,'2025-03-15 09:39:52','2025-03-15 09:39:52'),
(197,'<p><br>Mempermudah maintenance</p>',1,79,1,1,NULL,'2025-03-15 09:39:52','2025-03-15 09:39:52'),
(198,'<p>&nbsp;Mengurangi ukuran kode secara drastis&nbsp;</p>',0,79,1,1,NULL,'2025-03-15 09:39:52','2025-03-15 09:39:52'),
(199,'Konstruktor',1,80,1,1,NULL,'2025-03-15 09:41:04','2025-03-15 09:41:04'),
(200,'true',1,81,1,1,NULL,'2025-03-15 09:41:55','2025-03-15 09:41:55'),
(201,'<p>&nbsp;Membuat objek baru</p>',0,82,1,1,NULL,'2025-03-15 09:43:19','2025-03-15 09:43:19'),
(202,'<p>&nbsp;Mengambil nilai dari objek&nbsp;</p>',1,82,1,1,NULL,'2025-03-15 09:43:19','2025-03-15 09:43:19'),
(203,'<p>&nbsp;Menghapus objek&nbsp;</p>',0,82,1,1,NULL,'2025-03-15 09:43:19','2025-03-15 09:43:19'),
(204,'<p>&nbsp;Menyalin objek &nbsp;</p>',0,82,1,1,NULL,'2025-03-15 09:43:19','2025-03-15 09:43:19'),
(205,'<p>Konstruktor digunakan untuk membuat objek baru dari type bentukan, sedangkan selektor digunakan untuk mengambil nilai dari objek yang telah dibuat. Misalnya, dalam tipe koordinat (x, y), konstruktor membuat titik baru, sedangkan selektor mengambil nilai x atau y dari titik tersebut.&nbsp;</p>',0,83,1,1,NULL,'2025-03-15 09:44:15','2025-03-15 09:44:15'),
(206,'Nol',1,84,1,1,NULL,'2025-03-15 09:44:55','2025-03-15 09:44:55'),
(207,'<p>&nbsp;IsOrigin?&nbsp;</p>',1,85,1,1,NULL,'2025-03-15 09:46:16','2025-03-15 09:46:16'),
(208,'<p>&nbsp;Jarak0&nbsp;</p>',1,85,1,1,NULL,'2025-03-15 09:46:16','2025-03-15 09:46:16'),
(209,'<p>&nbsp;Absis&nbsp;</p>',1,85,1,1,NULL,'2025-03-15 09:46:16','2025-03-15 09:46:16'),
(210,'<p>&nbsp;Penyebut&nbsp;</p>',0,85,1,1,NULL,'2025-03-15 09:46:16','2025-03-15 09:46:16'),
(211,'<ol><li>Kuadran ditentukan berdasarkan tanda nilai x dan y dari titik tersebut.</li></ol><p><br></p>',0,86,1,1,NULL,'2025-03-15 09:47:05','2025-03-15 09:47:05'),
(212,'true',1,87,1,1,NULL,'2025-03-15 11:26:49','2025-03-15 11:26:49'),
(213,'<p>Daftar belanjaan di aplikasi supermarket&nbsp;</p>',0,88,1,1,NULL,'2025-03-15 11:28:31','2025-03-15 11:28:31'),
(214,'<p>Riwayat percakapan di aplikasi chat&nbsp;</p>',0,88,1,1,NULL,'2025-03-15 11:28:31','2025-03-15 11:28:31'),
(215,'<p>Tombol power di remote TV&nbsp;</p>',1,88,1,1,NULL,'2025-03-15 11:28:31','2025-03-15 11:28:31'),
(216,'<p>Kumpulan playlist lagu di Spotify&nbsp;</p>',0,88,1,1,NULL,'2025-03-15 11:28:31','2025-03-15 11:28:31'),
(217,'<p>&nbsp;Antrian pembelian tiket bioskop</p>',0,89,1,1,NULL,'2025-03-15 11:32:56','2025-03-15 11:32:56'),
(218,'<p>&nbsp;Proses pencetakan dokumen di printer</p>',0,89,1,1,NULL,'2025-03-15 11:32:56','2025-03-15 11:32:56'),
(219,'<p>Tumpukan piring yang dicuci</p>',1,89,1,1,NULL,'2025-03-15 11:32:56','2025-03-15 11:32:56'),
(220,'<p>Antrean pelanggan di kasir supermarket&nbsp; &nbsp;&nbsp;</p>',0,89,1,1,NULL,'2025-03-15 11:32:56','2025-03-15 11:32:56'),
(221,'false',1,90,1,1,NULL,'2025-03-15 11:33:38','2025-03-15 11:33:38'),
(222,'<p><strong>remove()</strong> digunakan untuk menambah elemen ke dalam list&nbsp;</p>',0,91,1,1,NULL,'2025-03-15 11:36:38','2025-03-15 11:36:38'),
(223,'<p><strong>pop()</strong> menghapus elemen terakhir dalam list&nbsp;</p>',1,91,1,1,NULL,'2025-03-15 11:36:38','2025-03-15 11:36:38'),
(224,'<p><strong>insert() </strong>hanya bisa digunakan pada Queue&nbsp;</p>',0,91,1,1,NULL,'2025-03-15 11:36:38','2025-03-15 11:36:38'),
(225,'<p><strong>append()</strong> hanya bisa digunakan dalam Stack&nbsp;</p>',0,91,1,1,NULL,'2025-03-15 11:36:38','2025-03-15 11:36:38'),
(226,'false',1,92,1,1,NULL,'2025-03-15 11:37:46','2025-03-15 11:37:46'),
(227,'false',1,93,1,1,NULL,'2025-03-15 13:44:41','2025-03-15 13:44:41'),
(232,'<p>Integer</p>',0,94,1,1,NULL,'2025-03-15 13:46:57','2025-03-15 13:46:57'),
(233,'<p>List</p>',1,94,1,1,NULL,'2025-03-15 13:46:57','2025-03-15 13:46:57'),
(234,'<p>Stack</p>',1,94,1,1,NULL,'2025-03-15 13:46:57','2025-03-15 13:46:57'),
(235,'<p>Boolean</p>',0,94,1,1,NULL,'2025-03-15 13:46:57','2025-03-15 13:46:57'),
(236,'<p>&nbsp;Menambahkan elemen&nbsp;</p>',1,95,1,1,NULL,'2025-03-15 13:48:43','2025-03-15 13:48:43'),
(237,'<p>&nbsp;Menghapus elemen&nbsp;</p>',1,95,1,1,NULL,'2025-03-15 13:48:43','2025-03-15 13:48:43'),
(238,'<p>&nbsp;Mengakses elemen berdasarkan indeks&nbsp;</p>',1,95,1,1,NULL,'2025-03-15 13:48:43','2025-03-15 13:48:43'),
(239,'<p>&nbsp;Mengubah tipe data elemen secara otomatis&nbsp;</p>',0,95,1,1,NULL,'2025-03-15 13:48:43','2025-03-15 13:48:43'),
(240,'Stack',1,96,1,1,NULL,'2025-03-15 13:49:46','2025-03-15 13:49:46'),
(241,'false',1,97,1,1,NULL,'2025-03-15 13:50:22','2025-03-15 13:50:22'),
(242,'<p>&nbsp;list_angka.add(10)&nbsp;</p>',0,98,1,1,NULL,'2025-03-15 13:51:33','2025-03-15 13:51:33'),
(243,'<p>&nbsp;list_angka.insert(10)&nbsp;</p>',0,98,1,1,NULL,'2025-03-15 13:51:33','2025-03-15 13:51:33'),
(244,'<p>&nbsp;list_angka.append(10)&nbsp;</p>',1,98,1,1,NULL,'2025-03-15 13:51:33','2025-03-15 13:51:33'),
(245,'<p>&nbsp;list_angka.remove(10)&nbsp;</p>',0,98,1,1,NULL,'2025-03-15 13:51:33','2025-03-15 13:51:33'),
(246,'<p>List adalah koleksi yang berisi elemen berurutan dan bisa diakses berdasarkan indeks. Stack adalah struktur data yang mengikuti prinsip LIFO (Last In, First Out), di mana elemen terakhir yang dimasukkan akan diambil lebih dulu.&nbsp;</p>',0,99,1,1,NULL,'2025-03-15 13:52:22','2025-03-15 13:52:22'),
(247,'Tree',1,100,1,1,NULL,'2025-03-15 13:53:02','2025-03-15 13:53:02'),
(248,'<p>Python</p>',1,101,1,1,NULL,'2025-03-15 13:54:15','2025-03-15 13:54:15'),
(249,'<p>Java</p>',1,101,1,1,NULL,'2025-03-15 13:54:15','2025-03-15 13:54:15'),
(250,'<p>HTML</p>',0,101,1,1,NULL,'2025-03-15 13:54:15','2025-03-15 13:54:15'),
(251,'<p>C++</p>',1,101,1,1,NULL,'2025-03-15 13:54:15','2025-03-15 13:54:15'),
(252,'false',1,102,1,1,NULL,'2025-03-15 14:59:26','2025-03-15 14:59:26'),
(253,'<p>Tabel hanya bisa menyimpan angka.&nbsp;</p>',0,103,1,1,NULL,'2025-03-15 15:00:54','2025-03-15 15:00:54'),
(254,'<p>Setiap elemen tabel memiliki indeks untuk mengaksesnya.&nbsp;</p>',1,103,1,1,NULL,'2025-03-15 15:00:54','2025-03-15 15:00:54'),
(255,'<p>Semua bahasa pemrograman menggunakan tabel dengan indeks mulai dari 1.&nbsp;</p>',0,103,1,1,NULL,'2025-03-15 15:00:54','2025-03-15 15:00:54'),
(256,'<p>Tabel hanya bisa menyimpan string.&nbsp;</p>',0,103,1,1,NULL,'2025-03-15 15:00:54','2025-03-15 15:00:54'),
(257,'T[2]',1,104,1,1,NULL,'2025-03-15 15:01:52','2025-03-15 15:01:52'),
(258,'true',1,105,1,1,NULL,'2025-03-15 15:04:08','2025-03-15 15:04:08'),
(259,'<p>Elemen dalam tabel harus memiliki tipe data yang sama, sedangkan type komposisi bisa berbeda-beda.&nbsp;</p>',0,106,1,1,NULL,'2025-03-15 15:06:01','2025-03-15 15:06:01'),
(260,'<p>Tabel diakses menggunakan indeks, sedangkan type komposisi diakses menggunakan nama atribut.&nbsp;</p>',0,106,1,1,NULL,'2025-03-15 15:06:01','2025-03-15 15:06:01'),
(261,'<p>Type komposisi adalah kumpulan objek, sedangkan tabel hanya satu objek.&nbsp;</p>',0,106,1,1,NULL,'2025-03-15 15:06:01','2025-03-15 15:06:01'),
(262,'<p>Semua pernyataan di atas benar.&nbsp;</p>',1,106,1,1,NULL,'2025-03-15 15:06:01','2025-03-15 15:06:01'),
(263,'<p>Untuk menyesuaikan jumlah hari dalam setiap bulan.&nbsp;</p>',0,107,1,1,NULL,'2025-03-15 15:09:24','2025-03-15 15:09:24'),
(264,'<p>Untuk menghindari kesalahan dalam perhitungan tahun kabisat.&nbsp;</p>',0,107,1,1,NULL,'2025-03-15 15:09:24','2025-03-15 15:09:24'),
(265,'<p>Karena tanpa tabel koreksi, kita harus menghitung manual jumlah hari di setiap bulan.&nbsp;</p>',0,107,1,1,NULL,'2025-03-15 15:09:24','2025-03-15 15:09:24'),
(266,'<p>Semua jawaban benar.&nbsp;</p>',1,107,1,1,NULL,'2025-03-15 15:09:24','2025-03-15 15:09:24'),
(267,'true',1,108,1,1,NULL,'2025-03-15 15:10:19','2025-03-15 15:10:19'),
(268,'false',1,109,1,1,NULL,'2025-03-15 15:11:48','2025-03-15 15:11:48'),
(269,'<p>Tahun kabisat harus habis dibagi 4 dan 100.&nbsp;</p>',0,110,1,1,NULL,'2025-03-15 15:14:08','2025-03-15 15:14:08'),
(270,'<p>Tahun yang habis dibagi 400 selalu tahun kabisat.&nbsp;</p>',1,110,1,1,NULL,'2025-03-15 15:14:08','2025-03-15 15:14:08'),
(271,'<p>Tahun 2100 adalah tahun kabisat.&nbsp;</p>',0,110,1,1,NULL,'2025-03-15 15:14:08','2025-03-15 15:14:08'),
(272,'<p>Tahun 2023 adalah tahun kabisat.&nbsp;</p>',0,110,1,1,NULL,'2025-03-15 15:14:08','2025-03-15 15:14:08'),
(273,'<p>Jadwal keberangkatan kereta&nbsp;</p>',0,111,1,1,NULL,'2025-03-15 15:21:23','2025-03-15 15:21:23'),
(274,'<p>Daftar harga barang di supermarket&nbsp;</p>',0,111,1,1,NULL,'2025-03-15 15:21:23','2025-03-15 15:21:23'),
(275,'<p>Kalender&nbsp;</p>',0,111,1,1,NULL,'2025-03-15 15:21:23','2025-03-15 15:21:23'),
(276,'<p>Warna lampu lalu lintas&nbsp;</p>',1,111,1,1,NULL,'2025-03-15 15:21:23','2025-03-15 15:21:23'),
(277,'<p>Tabel harus memiliki elemen dengan tipe data yang sama&nbsp;</p>',1,112,1,1,NULL,'2025-03-15 15:25:08','2025-03-15 15:25:08'),
(278,'<p>Type komposisi bisa memiliki elemen dengan tipe data berbeda&nbsp;</p>',1,112,1,1,NULL,'2025-03-15 15:25:08','2025-03-15 15:25:08'),
(279,'<p>Tabel diakses menggunakan indeks&nbsp;</p>',1,112,1,1,NULL,'2025-03-15 15:25:08','2025-03-15 15:25:08'),
(280,'<p>Type komposisi diakses menggunakan indeks&nbsp;</p>',0,112,1,1,NULL,'2025-03-15 15:25:08','2025-03-15 15:25:08'),
(281,'0',1,113,1,1,NULL,'2025-03-15 15:25:47','2025-03-15 15:25:47'),
(282,'false',1,114,1,1,NULL,'2025-03-15 15:26:25','2025-03-15 15:26:25'),
(283,'<p>&nbsp;T[1]&nbsp;</p>',0,115,1,1,NULL,'2025-03-15 15:28:01','2025-03-15 15:28:01'),
(284,'<p>&nbsp;T[2]&nbsp;</p>',0,115,1,1,NULL,'2025-03-15 15:28:01','2025-03-15 15:28:01'),
(285,'<p>&nbsp;T(2)&nbsp;</p>',0,115,1,1,NULL,'2025-03-15 15:28:01','2025-03-15 15:28:01'),
(286,'<p>&nbsp;T{1}&nbsp;</p>',0,115,1,1,NULL,'2025-03-15 15:28:01','2025-03-15 15:28:01'),
(287,'<p>2020</p>',0,116,1,1,NULL,'2025-03-15 15:29:50','2025-03-15 15:29:50'),
(288,'<p>2100</p>',1,116,1,1,NULL,'2025-03-15 15:29:50','2025-03-15 15:29:50'),
(289,'<p>2000</p>',0,116,1,1,NULL,'2025-03-15 15:29:50','2025-03-15 15:29:50'),
(290,'<p>2024</p>',0,116,1,1,NULL,'2025-03-15 15:29:50','2025-03-15 15:29:50'),
(291,'<p>Bilangan 0 termasuk dalam bilangan ganjil.&nbsp;</p>',0,117,1,1,NULL,'2025-03-15 15:50:22','2025-03-15 15:50:22'),
(292,'<p>Bilangan 5 adalah bilangan ganjil berdasarkan definisi di atas.&nbsp;</p>',1,117,1,1,NULL,'2025-03-15 15:50:22','2025-03-15 15:50:22'),
(293,'<p>Bilangan 8 adalah bilangan ganjil.&nbsp;</p>',0,117,1,1,NULL,'2025-03-15 15:50:22','2025-03-15 15:50:22'),
(294,'<p>Semua bilangan genap termasuk dalam bilangan ganjil.&nbsp;</p>',0,117,1,1,NULL,'2025-03-15 15:50:22','2025-03-15 15:50:22'),
(295,'<p>Bilangan natural&nbsp;</p>',1,118,1,1,NULL,'2025-03-15 15:52:43','2025-03-15 15:52:43'),
(296,'<p>List/sequence&nbsp;</p>',1,118,1,1,NULL,'2025-03-15 15:52:43','2025-03-15 15:52:43'),
(297,'<p>Matriks</p>',0,118,1,1,NULL,'2025-03-15 15:52:43','2025-03-15 15:52:43'),
(298,'<p>Bilangan bulat ganjil&nbsp;</p>',1,118,1,1,NULL,'2025-03-15 15:52:43','2025-03-15 15:52:43'),
(299,'true',1,119,1,1,NULL,'2025-03-15 15:53:32','2025-03-15 15:53:32'),
(300,'<p>&nbsp;Fungsi rekursif langsung selalu memiliki dua basis kondisi.&nbsp;</p>',0,120,1,1,NULL,'2025-03-15 17:17:17','2025-03-15 17:17:17'),
(301,'<p>Fungsi rekursif langsung adalah fungsi yang memanggil dirinya sendiri dalam ekspresinya.&nbsp;</p>',1,120,1,1,NULL,'2025-03-15 17:17:17','2025-03-15 17:17:17'),
(302,'<p>Fungsi rekursif langsung selalu lebih efisien dibandingkan iteratif.&nbsp;</p>',0,120,1,1,NULL,'2025-03-15 17:17:17','2025-03-15 17:17:17'),
(303,'<p>Fungsi rekursif langsung tidak memerlukan kondisi basis.&nbsp;</p>',0,120,1,1,NULL,'2025-03-15 17:17:17','2025-03-15 17:17:17'),
(304,'<p>Fibonacci adalah contoh fungsi rekursif langsung.&nbsp;</p>',1,121,1,1,NULL,'2025-03-15 17:19:15','2025-03-15 17:19:15'),
(305,'<p>Fibonacci memiliki dua kondisi basis, yaitu untuk <strong>n = 0</strong> dan <strong>n = 1</strong>.&nbsp;</p>',1,121,1,1,NULL,'2025-03-15 17:19:15','2025-03-15 17:19:15'),
(306,'<p>Fibonacci lebih efisien dalam bentuk rekursif dibanding iteratif.&nbsp;</p>',0,121,1,1,NULL,'2025-03-15 17:19:15','2025-03-15 17:19:15'),
(307,'<p>Fungsi Fibonacci tidak membutuhkan kondisi basis untuk berjalan.&nbsp;</p>',0,121,1,1,NULL,'2025-03-15 17:19:15','2025-03-15 17:19:15'),
(308,'true',1,122,1,1,NULL,'2025-03-15 17:19:53','2025-03-15 17:19:53'),
(309,'<p>y = 1 → x&nbsp;</p>',0,123,1,1,NULL,'2025-03-15 17:34:36','2025-03-15 17:34:36'),
(310,'<p>y = 0 → x&nbsp;</p>',1,123,1,1,NULL,'2025-03-15 17:34:36','2025-03-15 17:34:36'),
(311,'<p>y = x → 0&nbsp;</p>',0,123,1,1,NULL,'2025-03-15 17:34:36','2025-03-15 17:34:36'),
(312,'<p>y = 0 → y&nbsp;</p>',0,123,1,1,NULL,'2025-03-15 17:34:36','2025-03-15 17:34:36'),
(313,'true',1,124,1,1,NULL,'2025-03-15 17:35:22','2025-03-15 17:35:22');

/*Table structure for table `ex_questions` */

DROP TABLE IF EXISTS `ex_questions`;

CREATE TABLE `ex_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `type` varchar(255) NOT NULL,
  `exercise_id` bigint(20) unsigned NOT NULL,
  `point` int(11) NOT NULL,
  `exp` int(11) NOT NULL,
  `feedback` longtext DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ex_questions_exercise_id_foreign` (`exercise_id`),
  KEY `ex_questions_created_by_foreign` (`created_by`),
  KEY `ex_questions_updated_by_foreign` (`updated_by`),
  CONSTRAINT `ex_questions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ex_questions_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ex_questions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ex_questions` */

insert  into `ex_questions`(`id`,`content`,`type`,`exercise_id`,`point`,`exp`,`feedback`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values 
(1,'<p>Apa yang menjadi konsep utama dalam paradigma pemrograman prosedural?</p>','multiple_choice',1,10,10,'<p>Paradigma pemrograman prosedural berfokus pada eksekusi perintah secara berurutan, seperti mengikuti resep masakan. Setiap langkah dilakukan dalam urutan tertentu hingga program selesai.</p>',1,1,NULL,'2025-03-13 10:47:42','2025-03-13 10:47:42'),
(2,'<p>Berikut adalah bahasa pemrograman yang menggunakan paradigma prosedural:</p>','multiple_answer',1,20,10,'<p>Bahasa seperti C dan Pascal menerapkan paradigma prosedural karena instruksinya dieksekusi secara berurutan. Sementara itu, Java lebih dikenal sebagai bahasa berorientasi objek, dan Python mendukung banyak paradigma, termasuk prosedural, tetapi lebih sering digunakan dalam paradigma lainnya.</p>',1,1,NULL,'2025-03-13 10:50:26','2025-03-13 13:39:10'),
(3,'<p>Paradigma fungsional lebih efisien dibandingkan paradigma prosedural karena menggunakan lebih sedikit pemrosesan tambahan.</p>','true_false',2,5,10,'<p>Paradigma fungsional sering kali membutuhkan lebih banyak pemrosesan tambahan, karena tidak mengubah data langsung dan sering menggunakan rekursi, yang bisa memperlambat eksekusi dibandingkan dengan pendekatan prosedural yang lebih dekat dengan cara kerja mesin.</p>',1,1,NULL,'2025-03-13 10:53:00','2025-03-13 10:53:00'),
(4,'<p>Salah satu bahasa pemrograman yang menggunakan paradigma fungsional adalah?</p>','short_answer',2,10,10,'<p>Haskell adalah salah satu bahasa pemrograman yang sepenuhnya berbasis paradigma fungsional, di mana setiap operasi dilakukan melalui fungsi matematika tanpa mengubah data secara langsung.</p>',1,1,NULL,'2025-03-13 10:53:49','2025-03-13 10:53:49'),
(5,'<p>Bahasa pemrograman berikut menerapkan paradigma deklaratif:</p>','multiple_answer',3,20,10,'<p>Prolog digunakan dalam pemrograman berbasis logika, sementara SQL adalah bahasa deklaratif yang digunakan untuk mengelola database. C dan JavaScript lebih sering digunakan dalam paradigma prosedural dan berorientasi objek.</p>',1,1,NULL,'2025-03-13 11:00:17','2025-03-13 11:00:17'),
(6,'<p>Apa konsep utama dari paradigma pemrograman berorientasi objek (OOP)?</p>','multiple_choice',4,10,10,'<p>Paradigma OOP mengorganisir kode ke dalam objek yang memiliki atribut (data) dan metode (fungsi yang dapat dijalankan oleh objek). Hal ini membuat kode lebih terstruktur dan modular.</p>',1,1,NULL,'2025-03-13 11:03:11','2025-03-13 11:03:11'),
(7,'<p>Paradigma berorientasi objek lebih cocok untuk proyek besar seperti aplikasi web dan game dibandingkan paradigma prosedural.</p>','true_false',4,5,10,'<p>OOP sangat cocok untuk proyek besar karena mendukung konsep modularitas, enkapsulasi, dan pewarisan, yang memudahkan pengelolaan dan pemeliharaan kode dalam skala besar seperti aplikasi web dan game.</p>',1,1,NULL,'2025-03-13 11:03:50','2025-03-13 11:03:50'),
(8,'<p>Apa konsep utama dari paradigma pemrograman konkuren?</p>','multiple_choice',5,10,10,'<p>Paradigma pemrograman konkuren memungkinkan eksekusi beberapa tugas dalam waktu yang bersamaan. Ini sering digunakan dalam sistem operasi, server web, dan aplikasi yang menangani banyak permintaan secara simultan.</p>',1,1,NULL,'2025-03-13 11:07:17','2025-03-13 11:07:17'),
(9,'<p>Paradigma pemrograman konkuren biasanya digunakan dalam:</p>','multiple_answer',5,20,10,'<p>Paradigma konkuren digunakan dalam sistem operasi untuk menjalankan banyak proses secara bersamaan, server web untuk menangani banyak permintaan pengguna, dan game multiplayer untuk menjalankan aksi dari banyak pemain secara real-time. Pengolahan database sederhana tidak memerlukan paradigma konkuren karena sering berjalan secara sekuensial.</p>',1,1,NULL,'2025-03-13 11:09:23','2025-03-13 11:09:23'),
(10,'<p>Paradigma pemrograman konkuren lebih mudah diimplementasikan dibanding paradigma prosedural.</p>','true_false',5,5,10,'<p>Paradigma konkuren lebih sulit diimplementasikan dibandingkan paradigma prosedural karena melibatkan komunikasi antar proses dan perlu menangani masalah seperti deadlock, race condition, dan sinkronisasi data.</p>',1,1,NULL,'2025-03-13 11:11:20','2025-03-13 11:11:20'),
(11,'<p>Paradigma pemrograman manakah yang paling sesuai dengan konsep \"menyusun fungsi-fungsi kecil yang dapat digunakan kembali tanpa memodifikasi data langsung\"?</p>','multiple_choice',6,10,10,'<p>Paradigma <strong>fungsional</strong> berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.</p>',1,1,NULL,'2025-03-13 11:14:44','2025-03-13 11:14:44'),
(12,'<p>Sebutkan satu bahasa pemrograman yang mendukung paradigma deklaratif!</p>','short_answer',6,15,10,'<p>Prolog adalah contoh bahasa pemrograman <strong>deklaratif</strong>, di mana programmer hanya menyatakan \"apa\" yang diinginkan tanpa harus mendefinisikan \"bagaimana\" cara mencapainya.</p>',1,1,NULL,'2025-03-13 11:33:45','2025-03-13 11:33:45'),
(13,'<p>SQL adalah contoh bahasa pemrograman yang menggunakan paradigma deklaratif.</p>','true_false',6,10,10,'<p>SQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.</p>',1,1,NULL,'2025-03-13 11:34:24','2025-03-13 11:34:24'),
(14,'<p>Manakah bahasa pemrograman berikut yang mendukung paradigma berorientasi objek? <strong>(Pilih lebih dari satu)</strong></p>','multiple_answer',6,20,10,'<ul><li><strong>Java, Python, dan C++</strong> adalah bahasa yang mendukung paradigma <strong>berorientasi objek (OOP)</strong>.</li><li><strong>Fortran</strong> lebih dikenal sebagai bahasa dengan paradigma <strong>prosedural</strong>.</li></ul><p><br></p>',1,1,NULL,'2025-03-13 11:54:51','2025-03-13 11:54:51'),
(15,'<p>Paradigma pemrograman yang cocok untuk pengolahan data besar dan berbasis AI adalah...</p>','multiple_choice',6,10,10,'<p>Paradigma <strong>deklaratif</strong> seperti Prolog sering digunakan dalam <strong>AI dan database</strong>, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.</p>',1,1,NULL,'2025-03-13 13:31:01','2025-03-13 13:31:01'),
(16,'<p>Mengapa paradigma konkuren penting dalam pengembangan sistem modern seperti server web dan game multiplayer?</p>','essay',6,30,10,'<p>Paradigma <strong>konkuren</strong> memungkinkan eksekusi banyak tugas secara bersamaan, meningkatkan efisiensi dan kecepatan sistem. Dalam server web dan game multiplayer, banyak permintaan harus diproses serentak agar pengguna tidak mengalami keterlambatan.</p>',1,1,NULL,'2025-03-13 13:31:59','2025-03-13 13:31:59'),
(17,'<p>Apa yang dimaksud dengan paradigma pemrograman prosedural?</p>','essay',6,20,10,'<p>Paradigma pemrograman prosedural adalah metode penulisan kode yang berfokus pada instruksi langkah demi langkah secara berurutan untuk menyelesaikan suatu masalah.</p>',1,1,NULL,'2025-03-13 13:32:38','2025-03-13 13:32:38'),
(18,'<p>Bahasa pemrograman Pascal hanya mendukung paradigma berorientasi objek.</p>','true_false',6,5,10,'<p>Pascal awalnya merupakan bahasa <strong>prosedural</strong>, tetapi versi yang lebih baru (seperti Object Pascal) juga mendukung paradigma <strong>berorientasi objek</strong>.</p>',1,1,NULL,'2025-03-13 13:33:59','2025-03-13 13:33:59'),
(19,'<p>Mana saja kelebihan paradigma fungsional dalam pemrograman? <strong>(Pilih lebih dari satu)</strong></p>','multiple_answer',6,20,10,'<p>Paradigma <strong>fungsional</strong> membuat kode lebih bersih dan bebas dari efek samping yang tidak terduga. Namun, tidak selalu lebih efisien dibanding paradigma lain, tergantung pada kasus penggunaannya.</p>',1,1,NULL,'2025-03-13 13:35:58','2025-03-13 13:35:58'),
(20,'<p>Salah satu bahasa pemrograman yang menerapkan paradigma deklaratif adalah?</p>','short_answer',3,15,10,'<p>Prolog adalah bahasa pemrograman berbasis logika yang memungkinkan programmer mendeklarasikan aturan dan fakta, lalu sistem akan menyimpulkan hasilnya berdasarkan logika yang diberikan.</p>',1,1,NULL,'2025-03-13 13:38:31','2025-03-13 13:38:31'),
(21,'<p>Dalam paradigma fungsional, sebuah fungsi bisa mengubah variabel global jika diperlukan.</p>','true_false',7,5,10,'<p>Paradigma fungsional menekankan <strong>fungsi murni (pure functions)</strong>, yang berarti setiap fungsi hanya bergantung pada input yang diberikan dan tidak boleh mengubah variabel global atau memiliki efek samping. Hal ini membuat kode lebih mudah dipahami dan diuji.</p>',1,1,NULL,'2025-03-13 15:23:25','2025-03-13 15:23:25'),
(22,'<p>Manakah dari pernyataan berikut yang benar mengenai perbedaan antara pemrograman imperatif dan fungsional?</p>','multiple_choice',7,10,10,'<ul><li><strong>A Salah</strong> → Justru paradigma fungsional yang lebih berfokus pada \"apa yang ingin dilakukan\", sedangkan imperatif lebih menekankan \"bagaimana cara melakukannya\".</li><li><strong>B Salah</strong> → Paradigma fungsional tidak menggunakan variabel yang dapat diubah (mutable variables), karena tidak ada efek samping.</li><li><strong>C Salah</strong> → Paradigma imperatif menggunakan perintah langkah demi langkah, bukan berbasis ekspresi.</li><li><strong>D Benar</strong> → Pemrograman fungsional mengutamakan ekspresi dan rekursi, bukan perubahan state seperti dalam pemrograman imperatif.</li></ul><p><br></p>',1,1,NULL,'2025-03-13 15:24:42','2025-03-13 15:24:42'),
(23,'<p>Apa yang digunakan dalam notasi fungsional untuk menggantikan loop dalam pemrograman imperatif?</p>','short_answer',8,15,10,'<p>Dalam <strong>pemrograman imperatif</strong>, kita sering menggunakan <strong>loop</strong> seperti for atau while untuk mengulang suatu proses. Namun, dalam <strong>notasi fungsional</strong>, kita tidak menggunakan loop melainkan <strong>rekursi</strong>.</p>',1,1,NULL,'2025-03-13 15:26:08','2025-03-13 15:26:08'),
(24,'<p>Dalam struktur dasar program fungsional, bagian yang menjelaskan domain, range, dan deskripsi fungsi disebut?</p>','multiple_choice',8,10,10,'<ul><li><strong>A (Judul Fungsi)</strong> → Berisi nama dan parameter fungsi.</li><li><strong>B (Definisi &amp; Spesifikasi)</strong> → Menjelaskan domain, range, dan deskripsi fungsi.</li><li><strong>C (Realisasi)</strong> → Berisi implementasi atau cara kerja fungsi.</li></ul><p><strong>D (Aplikasi)</strong> → Menunjukkan penggunaan fungsi dalam ekspresi nyata.</p><p><br></p>',1,1,NULL,'2025-03-13 15:27:26','2025-03-13 15:27:26'),
(25,'<p>Pilih semua jenis ekspresi dalam notasi fungsional:</p>','multiple_answer',9,20,10,'<p>✅ <strong>A, B, C benar</strong> → Digunakan dalam pemrograman fungsional.<br> ❌ <strong>D salah</strong> → Loop tidak ada dalam notasi fungsional, digantikan dengan rekursi.</p>',1,1,NULL,'2025-03-13 15:30:06','2025-03-13 15:30:06'),
(26,'<p>Pendekatan top-down dalam pemrograman fungsional berarti menyelesaikan detail kecil terlebih dahulu sebelum membangun fungsi utama.</p>','true_false',10,5,10,'<p>Pendekatan <strong>top-down</strong> berarti <strong>memecah masalah besar</strong> menjadi fungsi-fungsi kecil, <strong>bukan sebaliknya</strong>. Jadi, kita mulai dari konsep umum, lalu merinci ke fungsi yang lebih spesifik. Oleh karena itu, <strong>jawaban yang benar adalah False</strong>.</p>',1,1,NULL,'2025-03-13 15:32:54','2025-03-13 15:32:54'),
(27,'<p>Haskell dan LISP adalah contoh bahasa pemrograman yang mendukung paradigma fungsional.</p>','true_false',11,5,10,'<p><strong>Haskell</strong> adalah bahasa pemrograman fungsional murni, sedangkan <strong>LISP</strong> mendukung pemrograman fungsional meskipun tidak sepenuhnya fungsional. Jadi jawabannya <strong>True</strong>.</p>',1,1,NULL,'2025-03-13 15:34:12','2025-03-13 15:34:12'),
(28,'<p>Dalam paradigma fungsional, sebuah fungsi bisa mengubah variabel global jika diperlukan.</p>','true_false',12,5,10,'<p>Paradigma fungsional menekankan fungsi murni (pure functions), yang tidak boleh mengubah variabel global atau memiliki efek samping.</p>',1,1,NULL,'2025-03-13 15:40:41','2025-03-13 15:40:41'),
(29,'<p>Manakah yang merupakan ciri utama dari paradigma fungsional?</p>','multiple_choice',12,10,10,'<p>Paradigma fungsional berfokus pada ekspresi, tidak mengubah state, dan menghindari efek samping.</p>',1,1,NULL,'2025-03-13 15:41:43','2025-03-13 15:41:43'),
(30,'<p>Dalam notasi fungsional, apa yang digunakan untuk menggantikan loop dalam pemrograman imperatif?</p>','short_answer',12,15,10,'<p>Rekursi digunakan untuk menggantikan perulangan seperti for atau while dalam paradigma imperatif.</p>',1,1,NULL,'2025-03-13 15:42:40','2025-03-13 15:42:40'),
(31,'<p>Pilih semua jenis ekspresi yang termasuk dalam notasi fungsional.</p>','multiple_answer',12,20,10,'<p>Notasi fungsional tidak memiliki perulangan eksplisit seperti dalam paradigma imperatif. Sebagai gantinya, rekursi digunakan.</p>',1,1,NULL,'2025-03-13 15:44:13','2025-03-13 15:44:13'),
(32,'<p>Jelaskan perbedaan utama antara paradigma pemrograman imperatif dan fungsional.</p>','essay',12,15,10,'<p>Paradigma imperatif berfokus pada langkah-langkah eksekusi dengan mengubah state program menggunakan perulangan dan variabel yang dapat diubah. Sementara itu, paradigma fungsional menggunakan fungsi murni yang tidak mengubah state global dan mengandalkan ekspresi serta rekursi untuk pemrosesan data.</p>',1,1,NULL,'2025-03-13 15:44:52','2025-03-13 15:44:52'),
(33,'<p>Pendekatan top-down dalam pemrograman fungsional berarti menyelesaikan detail kecil terlebih dahulu sebelum membangun fungsi utama.</p>','true_false',12,5,10,'<p>Pendekatan top-down berarti memecah masalah besar menjadi fungsi-fungsi kecil, bukan sebaliknya.</p>',1,1,NULL,'2025-03-13 15:45:22','2025-03-13 15:45:22'),
(34,'<p>Dalam struktur dasar program fungsional, bagian yang menjelaskan domain, range, dan deskripsi fungsi disebut?</p>','multiple_choice',12,10,10,'<p>Bagian Definisi &amp; Spesifikasi menjelaskan domain, range, dan deskripsi fungsi dalam pemrograman fungsional.</p>',1,1,NULL,'2025-03-13 15:46:31','2025-03-13 15:46:31'),
(35,'<p>Apa istilah yang digunakan untuk fungsi yang selalu memberikan output yang sama untuk input yang sama tanpa efek samping?</p>','short_answer',12,15,10,'<p>Pure Function atau fungsi murni adalah fungsi yang tidak memiliki efek samping dan hanya bergantung pada inputnya.</p>',1,1,NULL,'2025-03-13 15:47:15','2025-03-13 15:47:15'),
(36,'<p>Dalam paradigma fungsional, teknik mana yang digunakan untuk menghindari efek samping?</p>','multiple_answer',12,20,10,'<p>Paradigma fungsional menghindari efek samping dengan menggunakan fungsi murni, tidak mengubah state global, dan menggantikan perulangan dengan rekursi.</p>',1,1,NULL,'2025-03-13 15:48:34','2025-03-13 15:48:34'),
(37,'<p>&nbsp;Apakah 4 + 5 * 2 = 18</p>','true_false',13,5,10,'<p>5 * 2 dievaluasi lebih dulu menjadi 10, lalu 4 + 10 = 14, bukan 18.</p><p><br></p>',1,1,NULL,'2025-03-13 17:01:28','2025-03-13 17:01:28'),
(38,'<p>Operator relasional mana yang mengembalikan nilai true jika 7 dibandingkan dengan 5?</p>','multiple_choice',13,10,10,'<p>7 lebih besar dari 5, jadi 7 &gt; 5 menghasilkan<strong> true</strong></p>',1,1,NULL,'2025-03-13 17:03:19','2025-03-13 17:03:19'),
(39,'<p>Apa hasil dari ekspresi 6 div 2?</p>','short_answer',14,15,10,'<p>&nbsp;div adalah pembagian bulat, sehingga 6 div 2 menghasilkan 3.</p>',1,1,NULL,'2025-03-13 17:05:46','2025-03-13 17:05:46'),
(40,'<p>Manakah dari ekspresi berikut yang bernilai true?<strong> (Pilih semua jawaban benar)</strong></p>','multiple_answer',14,20,10,'<p>10 &gt; 5 benar, 3 + 4 = 7 salah, 7 ≠ 6 benar, 2 * 2 = 4 benar.</p><p><br></p>',1,1,NULL,'2025-03-13 17:07:47','2025-03-13 17:07:47'),
(41,'<p>Jika FX3(2) menggunakan FX2, berapa hasilnya? <br><br><strong>(Jawab dengan angka saja, contoh: 0)</strong></p>','short_answer',15,15,10,'<p>&nbsp;FX3(2) = 2 * FX2(2) = 2 * 4 = 8</p>',1,1,NULL,'2025-03-13 17:11:03','2025-03-13 17:11:03'),
(42,'<p>Jika IsPositif(0), maka hasilnya <strong>true.</strong></p>','true_false',15,5,10,'<p>&nbsp;Fungsi IsPositif(x) = x ≥ 0 mengembalikan true untuk 0 karena 0 bukan negatif</p>',1,1,NULL,'2025-03-13 17:12:00','2025-03-13 17:12:00'),
(43,'<p>Jika kita menggunakan fungsi LS(0,0,3,4), berapa hasil akhirnya?</p>','multiple_choice',16,10,10,'<p>LS(0,0,3,4)<br>→ √(dif2(4,0) + dif2(3,0))<br>→ √(FX2(4) + FX2(3))<br>→ √(16 + 9)<br>→ √25<br>→ 5</p>',1,1,NULL,'2025-03-13 17:26:00','2025-03-13 17:26:00'),
(44,'<p>Evaluasi LS(1,1,4,5) akan menghasilkan 6</p>','true_false',16,5,10,'<p>LS(1,1,4,5)<br>→ √(dif2(5,1) + dif2(4,1))<br>→ √(FX2(4) + FX2(3))<br>→ √(16 + 9)<br>→ √25<br>→ 5</p>',1,1,NULL,'2025-03-13 17:26:44','2025-03-13 17:26:44'),
(45,'<p>Apa manfaat utama dari penggunaan let dalam ekspresi?</p>','multiple_choice',17,10,10,'<p>Jawaban yang benar adalah <strong>\"Menghindari evaluasi berulang dan meningkatkan keterbacaa\"</strong> karena <strong>let </strong>membantu menghindari perhitungan ulang serta membuat kode lebih mudah dibaca.</p>',1,1,NULL,'2025-03-13 18:03:01','2025-03-13 18:03:01'),
(46,'<p>Diberikan ekspresi berikut:</p><p><em>F(a, b) =<br>let p = a + b in<br>p * p</em></p><p>Jika F(3, 2) dihitung, berapa hasil akhirnya?&nbsp;</p><p><em>(Jawab dengan angka saja, contoh: </em><strong><em>109</em></strong><em>)</em></p>','short_answer',17,15,10,'<p>F(3,2)<br>→ let p = 3 + 2 in p * p<br>→ let p = 5 in 5 * 5<br>→ 25</p>',1,1,NULL,'2025-03-13 18:04:44','2025-03-13 18:04:44'),
(47,'<p><strong>let </strong>dalam suatu fungsi dapat digunakan untuk menyimpan hasil perhitungan yang akan digunakan kembali di luar fungsi tersebut.</p>','true_false',17,5,10,'<p>Pernyataan ini <strong>False</strong>, karena variabel yang dideklarasikan dengan let hanya berlaku di dalam fungsi tersebut.</p>',1,1,NULL,'2025-03-13 18:05:47','2025-03-13 18:05:47'),
(48,'<p>&nbsp;Apakah hasil dari ekspresi (5 mod 2) = 1 adalah true?&nbsp;</p>','true_false',18,5,10,'<p>&nbsp;Operator mod menghitung sisa pembagian, sehingga 5 mod 2 menghasilkan 1, yang <strong>benar</strong></p>',1,1,NULL,'2025-03-14 03:18:57','2025-03-14 03:18:57'),
(49,'<p>&nbsp;Manakah dari berikut ini yang merupakan ekspresi dalam bentuk prefix?&nbsp;</p>','multiple_choice',18,10,10,'<p>&nbsp;Bentuk prefix meletakkan operator sebelum operand, sehingga (* (+ 3 4) 5) adalah jawaban yang benar.</p>',1,1,NULL,'2025-03-14 03:20:43','2025-03-14 03:20:43'),
(50,'<p>&nbsp;Apa hasil dari ekspresi 8 div 3?&nbsp;</p>','short_answer',18,15,10,'<p>&nbsp;Operator div melakukan pembagian bulat, sehingga 8 div 3 menghasilkan 2.&nbsp;</p>',1,1,NULL,'2025-03-14 03:21:24','2025-03-14 03:21:24'),
(51,'<p>&nbsp;Pilih semua ekspresi yang menghasilkan true:&nbsp;</p>','multiple_answer',18,20,10,'<ul><li>4 + 3 = 7 benar</li><li>6 &gt; 9 salah</li><li>10 mod 2 = 0 benar</li><li>(5 &gt; 2) and (7 &gt; 3) benar</li></ul>',1,1,NULL,'2025-03-14 03:23:50','2025-03-14 03:23:50'),
(52,'<p>&nbsp;Evaluasi ekspresi (4 + 2) * 3 = 18 adalah true.&nbsp;</p>','true_false',18,5,10,'<p>(4 + 2) = 6, lalu 6 * 3 = 18, sehingga hasilnya benar.&nbsp;</p>',1,1,NULL,'2025-03-14 03:25:25','2025-03-14 03:25:25'),
(53,'<p>&nbsp;Jika FX2(x) = x * x dan x = 5, berapa hasilnya?&nbsp;</p>','short_answer',18,15,10,'<p>&nbsp;FX2(5) = 5 * 5 = 25</p>',1,1,NULL,'2025-03-14 03:29:11','2025-03-14 03:29:11'),
(54,'<p>&nbsp;Manakah dari berikut ini yang bernilai false?&nbsp;</p>','multiple_choice',18,10,10,'<p>7 ≠ 7 salah karena 7 sama dengan 7&nbsp;</p>',1,1,NULL,'2025-03-14 03:30:45','2025-03-14 03:30:45'),
(55,'<p>&nbsp;Apa bentuk postfix dari ekspresi (3 + 2) * 4? <br><em>(cara menjawab: tidak perlu menggunakan </em><strong><em>spasi </em></strong><em>dan </em><strong><em>tanda kurung</em></strong><em>)</em></p>','short_answer',18,15,10,'<p>&nbsp;Dalam postfix, operator ditempatkan setelah operand: (3 + 2) * 4 menjadi 3 2 + 4 *.&nbsp;</p>',1,1,NULL,'2025-03-14 03:33:27','2025-03-14 03:33:27'),
(56,'<p>&nbsp;Evaluasi LS(0,0,3,4) menghasilkan 6.&nbsp;</p>','true_false',18,5,10,'<p>&nbsp;LS(0,0,3,4) dihitung sebagai √(3² + 4²) = √(9 + 16) = √25 = 5.&nbsp;</p>',1,1,NULL,'2025-03-14 03:34:19','2025-03-14 03:34:19'),
(57,'<p>&nbsp;Manakah dari ekspresi berikut yang memiliki hasil 9?&nbsp;</p>','multiple_answer',18,20,10,'<ul><li><strong>FX2(3) = 3 * 3 = 9</strong> ✅ (Benar)</li><li><strong>3 + 3 * 2 = 3 + 6 = 9</strong> ✅ (Benar)&nbsp;</li></ul><p>Operasi perkalian (*) dilakukan lebih dulu sebelum penjumlahan (+), jadi hasilnya <strong>9</strong>.</p><ul><li><strong>10 - 1 = 9</strong> ✅ (Benar)</li><li><strong>81 div 9 = 9</strong> ✅ (Benar)&nbsp;</li><li>div adalah pembagian bulat, jadi <strong>81 div 9 = 9</strong>.</li></ul>',1,1,NULL,'2025-03-14 03:37:55','2025-03-14 03:37:55'),
(58,'<p>Manakah pernyataan yang benar mengenai ekspresi kondisional?</p>','multiple_choice',19,10,10,'<p>Analisa kasus dalam ekspresi kondisional sangat penting agar semua kemungkinan keadaan bisa tertangani dengan benar. Jika ada kondisi yang tidak dianalisis, maka bisa terjadi error atau hasil yang tidak diinginkan dalam program. Oleh karena itu, mencakup semua kemungkinan adalah aspek yang wajib dalam ekspresi kondisional.</p>',1,1,NULL,'2025-03-14 03:47:49','2025-03-14 03:47:49'),
(59,'<p>Apa keuntungan menggunakan else dalam ekspresi kondisional?</p>','multiple_choice',20,10,10,'<p>Penggunaan else dalam ekspresi kondisional sangat penting karena memastikan bahwa <strong>program memiliki respons default</strong> jika tidak ada kondisi lain yang terpenuhi. Tanpa else, ada kemungkinan bahwa program tidak menghasilkan output apa pun jika kondisi if tidak terpenuhi.&nbsp;</p>',1,1,NULL,'2025-03-14 04:01:37','2025-03-14 04:01:37'),
(60,'<p>Apa hasil dari ekspresi berikut jika a = 5?</p><p><strong>print(a &gt;= 5)</strong></p>','multiple_choice',21,10,10,'<p>Operator &gt;= akan mengembalikan True jika nilai di kiri lebih besar atau sama dengan nilai di kanan. Karena a bernilai 5, ekspresi a &gt;= 5 bernilai True.</p>',1,1,NULL,'2025-03-14 04:09:00','2025-03-14 04:09:00'),
(61,'<p>Jika kondisi pertama dalam ekspresi kondisional bernilai true, maka kondisi berikutnya tetap akan dievaluasi.</p>','true_false',21,5,10,'<p>Dalam banyak bahasa pemrograman, evaluasi ekspresi kondisional menggunakan <strong>short-circuiting</strong>, artinya jika satu kondisi sudah terpenuhi, maka kondisi lainnya tidak akan diperiksa.</p>',1,1,NULL,'2025-03-14 04:21:23','2025-03-14 04:21:23'),
(62,'<p>Apa keuntungan utama dari penggunaan type bentukan dalam pemrograman?</p>','multiple_choice',22,10,10,'<ul><li><strong>A</strong> – Type bentukan mempermudah pemrograman dengan menyusun data yang berkaitan menjadi satu kesatuan. </li><li><strong>B Salah:</strong> Walaupun type bentukan membantu mengorganisir data, jumlah variabel tidak selalu berkurang.</li><li><strong>C Salah:</strong> Type bentukan tetap menggunakan tipe data dasar di dalamnya.</li><li><strong>D Salah:</strong> Type bentukan tidak selalu lebih hemat memori dibanding tipe dasar.</li></ul>',1,1,NULL,'2025-03-14 08:16:15','2025-03-14 08:16:15'),
(63,'<p>Type bentukan hanya bisa digunakan dalam bahasa pemrograman berbasis objek seperti Java dan Python. (True/False?)</p>','true_false',22,5,10,'<p><strong>&nbsp;False</strong> – Type bentukan dapat digunakan di berbagai bahasa pemrograman, termasuk bahasa yang tidak berbasis objek seperti C dan Pascal.</p>',1,1,NULL,'2025-03-14 08:16:57','2025-03-14 08:16:57'),
(64,'<p>Produk dari type memungkinkan kita untuk:</p>','multiple_choice',23,10,10,'<ul><li>&nbsp; <strong>Menggabungkan beberapa tipe data menjadi satu struktur</strong> – Produk dari type memungkinkan penggabungan beberapa tipe data menjadi satu kesatuan.</li><li><strong>A Salah:</strong> Produk dari type tidak mengurangi jumlah tipe data, tetapi menyusun data lebih baik.</li><li><strong>C Salah:</strong> Produk dari type dapat menyimpan beberapa nilai sekaligus.</li><li><strong>D Salah:</strong> Produk dari type masih menggunakan tipe data dasar.</li></ul>',1,1,NULL,'2025-03-14 08:26:59','2025-03-14 08:26:59'),
(65,'<p>Produk dari type hanya dapat menyimpan angka. (True/False?)</p>','true_false',23,5,10,'<p><strong>False</strong> – Produk dari type bisa menyimpan berbagai tipe data, termasuk string, boolean, dan lainnya.</p>',1,1,NULL,'2025-03-14 08:27:31','2025-03-14 08:27:31'),
(66,'<p>Apa fungsi utama dari selektor dalam type bentukan?</p>','multiple_choice',24,10,10,'<p><strong>Jawaban: B</strong> – Selektor digunakan untuk mengambil nilai dari suatu type bentukan.</p><ul><li><strong>A Salah:</strong> Selektor tidak menggabungkan tipe data.</li><li><strong>C Salah:</strong> Konstruktor yang bertugas membuat instance baru.</li><li><strong>D Salah:</strong> Selektor tidak berhubungan langsung dengan efisiensi penyimpanan</li></ul>',1,1,NULL,'2025-03-14 08:34:34','2025-03-14 08:34:34'),
(67,'<p>Konstruktor digunakan untuk mengambil data dari type bentukan. (True/False?)</p>','true_false',24,5,10,'<p><strong>False</strong> – Konstruktor digunakan untuk membuat instance baru, bukan mengambil data.</p>',1,1,NULL,'2025-03-14 08:35:57','2025-03-14 08:35:57'),
(68,'<p>&nbsp;Fungsi MakeDate(d, m, y) digunakan untuk membuat titik koordinat.&nbsp;</p>','true_false',25,5,10,'<p>Fungsi MakeDate(d, m, y) <strong>bukan</strong> digunakan untuk membuat titik koordinat, melainkan untuk membuat suatu <strong>tanggal</strong> dalam format <strong>(hari, bulan, tahun)</strong>.</p><ul><li>d merepresentasikan <strong>hari (Hr)</strong> dalam rentang 1–31.</li><li>m merepresentasikan <strong>bulan (Bln)</strong> dalam rentang 1–12.</li><li>y merepresentasikan <strong>tahun (Thn)</strong> sebagai bilangan positif (&gt;0).</li></ul><p>Jika ingin membuat <strong>titik koordinat</strong> dalam sistem kartesian, kita harus menggunakan fungsi <strong>MakePoint(a, b)</strong>, bukan MakeDate.</p>',1,1,NULL,'2025-03-14 09:57:35','2025-03-14 09:57:35'),
(69,'<p>&nbsp;Manakah pernyataan yang benar mengenai ekspresi kondisional?&nbsp;</p>','multiple_choice',26,10,10,'<p><strong>(A) Salah</strong>, karena ekspresi kondisional bisa memiliki hanya satu kondisi.</p><p><strong>(B) Benar</strong>, evaluasi ekspresi kondisional berjalan hingga menemukan kondisi yang benar.</p><p><strong>(C) Salah</strong>, operator <strong>AND then</strong> menggunakan <strong>short-circuiting</strong>, jadi jika kondisi pertama salah, evaluasi langsung berhenti.</p><p><strong>(D) Salah</strong>, analisa kasus penting untuk memastikan semua kondisi terpenuhi tanpa tumpang tindih.</p>',1,1,NULL,'2025-03-14 10:27:06','2025-03-14 10:27:06'),
(70,'<p>&nbsp;Evaluasi ekspresi kondisional dalam bahasa pemrograman dilakukan secara berurutan hingga menemukan kondisi yang benar.&nbsp;</p>','true_false',26,5,10,'<p>Dalam pemrograman, ekspresi kondisional bekerja dengan memeriksa kondisi satu per satu. Jika kondisi pertama salah, maka program akan lanjut ke kondisi berikutnya hingga menemukan kondisi yang benar.&nbsp;</p>',1,1,NULL,'2025-03-14 10:28:10','2025-03-14 10:28:10'),
(71,'<p>&nbsp;Apa nama operator yang digunakan untuk mengevaluasi kondisi secara efisien dengan menghentikan evaluasi jika hasil sudah bisa ditentukan?&nbsp;</p>','short_answer',26,15,10,'<p>Short-circuiting adalah teknik dalam evaluasi kondisi di mana operator <strong>AND then</strong> menghentikan pengecekan jika kondisi pertama salah, dan <strong>OR else</strong> berhenti jika kondisi pertama benar.&nbsp;</p>',1,1,NULL,'2025-03-14 10:29:34','2025-03-14 10:29:34'),
(72,'<p>&nbsp;Jelaskan perbedaan antara <strong>depend on</strong> dan <strong>if-then-else</strong> dalam ekspresi kondisional.&nbsp;</p>','essay',26,20,10,'<p><strong>Depend on</strong> adalah cara menulis ekspresi kondisional dalam bentuk yang lebih sederhana, sering digunakan dalam logika formal. Sementara itu, <strong>if-then-else</strong> lebih fleksibel dan umum digunakan dalam berbagai bahasa pemrograman seperti Python, Java, dan C++.&nbsp;</p>',1,1,NULL,'2025-03-14 10:31:04','2025-03-14 10:31:04'),
(73,'<p>&nbsp;Apa keuntungan dari penggunaan <strong>else</strong> dalam ekspresi kondisional?&nbsp;</p>','multiple_choice',26,10,10,'<ul><li><strong>(A) Benar</strong>, <strong>else</strong> memastikan bahwa program tetap memberikan hasil meskipun kondisi utama tidak terpenuhi.</li><li><strong>(B) Salah</strong>, penggunaan <strong>else</strong> tidak berhubungan dengan kecepatan eksekusi.</li><li><strong>(C) Salah</strong>, program tetap bisa memiliki banyak kondisi lain selain <strong>else</strong>.</li><li><strong>(D) Salah</strong>, <strong>else</strong> dapat digunakan dalam berbagai bahasa pemrograman, tidak hanya Python.</li></ul><p><br></p>',1,1,NULL,'2025-03-14 10:32:14','2025-03-14 10:32:14'),
(74,'<p>&nbsp;Konversikan ekspresi depend on berikut ke dalam if-then-else:&nbsp;</p><p>depend on (nilai &gt;= 75) &nbsp;<br>&nbsp; &nbsp; print(\"Bagus\") &nbsp;<br>otherwise &nbsp;<br>&nbsp; &nbsp; print(\"Perlu perbaikan\") &nbsp;<br><br></p>','multiple_choice',26,15,15,'<p>&nbsp;Struktur <strong>depend on</strong> dapat dikonversi ke <strong>if-then-else</strong> dengan mengubah kata kunci <strong>depend on</strong> menjadi <strong>if</strong> dan <strong>otherwise</strong> menjadi <strong>else</strong>.&nbsp;</p>',1,1,NULL,'2025-03-14 10:34:25','2025-03-14 10:34:25'),
(75,'<p>&nbsp;Pilih semua pernyataan yang benar mengenai ekspresi kondisional:&nbsp;</p>','multiple_answer',26,20,10,'<ul><li><strong>(A) Benar</strong>, ekspresi kondisional digunakan untuk membuat keputusan berdasarkan kondisi tertentu.</li><li><strong>(B) Salah</strong>, evaluasi kondisi dilakukan secara berurutan, bukan acak.</li><li><strong>(C) Benar</strong>, analisa kasus dalam ekspresi kondisional harus mencakup semua kemungkinan agar program tidak mengalami error.</li><li><strong>(D) Benar</strong>, <strong>AND then</strong> menggunakan short-circuiting untuk menghentikan evaluasi jika kondisi pertama salah.</li></ul><p><br></p>',1,1,NULL,'2025-03-14 10:35:39','2025-03-14 10:35:39'),
(76,'<p>&nbsp;Dalam ekspresi kondisional, jika kita menggunakan <strong>if-elif-else</strong>, semua kondisi akan selalu dievaluasi.&nbsp;</p>','true_false',26,5,10,'<p>&nbsp;Dalam <strong>if-elif-else</strong>, evaluasi berhenti setelah menemukan kondisi yang benar. Jadi, jika <strong>if</strong> pertama sudah terpenuhi, maka kondisi <strong>elif</strong> dan <strong>else</strong> tidak akan diperiksa lagi.&nbsp;</p>',1,1,NULL,'2025-03-14 10:37:01','2025-03-14 10:37:01'),
(77,'<p>&nbsp;Type bentukan hanya bisa terdiri dari satu tipe data dasar.&nbsp;</p>','true_false',27,10,10,'<p>&nbsp;Type bentukan terdiri dari kombinasi beberapa tipe data dasar, bukan hanya satu.&nbsp;</p>',1,1,NULL,'2025-03-15 09:36:33','2025-03-15 09:36:33'),
(78,'<p> Manakah contoh dari type bentukan?&nbsp;</p>','multiple_choice',27,15,15,'<p>&nbsp;Integer, String, dan Boolean adalah tipe data dasar, sedangkan Koordinat (x, y) adalah contoh type bentukan.&nbsp;</p>',1,1,NULL,'2025-03-15 09:37:57','2025-03-15 09:37:57'),
(79,'<p>&nbsp;Keuntungan menggunakan type bentukan adalah... <strong><em>(Pilih semua yang benar)&nbsp;</em></strong></p>','multiple_answer',27,20,20,'<p>&nbsp;Type bentukan membantu pengorganisasian data dan mempermudah pengeditan kode, tetapi tidak selalu mempercepat eksekusi atau mengurangi ukuran kode secara drastis.&nbsp;</p>',1,1,NULL,'2025-03-15 09:39:52','2025-03-15 09:39:52'),
(80,'<p>&nbsp;Apa nama fungsi yang digunakan untuk membuat objek type bentukan dalam Python?&nbsp;</p>','short_answer',27,15,15,'<p>Konstruktor digunakan untuk membuat objek baru dari type bentukan.</p>',1,1,NULL,'2025-03-15 09:41:04','2025-03-15 09:41:04'),
(81,'<p>&nbsp;Dalam sistem koordinat kartesian, titik (0,0) disebut origin.&nbsp;</p>','true_false',27,10,10,'<p>&nbsp;Titik (0,0) adalah titik awal dalam sistem koordinat kartesian.&nbsp;</p>',1,1,NULL,'2025-03-15 09:41:55','2025-03-15 09:41:55'),
(82,'<p>&nbsp;Fungsi selektor dalam type bentukan digunakan untuk...&nbsp;</p>','multiple_choice',27,15,15,'<p>&nbsp;Selektor digunakan untuk mengambil informasi dari type bentukan yang sudah dibuat.&nbsp;</p>',1,1,NULL,'2025-03-15 09:43:19','2025-03-15 09:43:19'),
(83,'<p>&nbsp;Jelaskan perbedaan antara konstruktor dan selektor dalam type bentukan!&nbsp;</p>','essay',27,30,30,'<p>Konstruktor digunakan untuk membuat objek baru dari type bentukan, sedangkan selektor digunakan untuk mengambil nilai dari objek yang telah dibuat. Misalnya, dalam tipe koordinat (x, y), konstruktor membuat titik baru, sedangkan selektor mengambil nilai x atau y dari titik tersebut.&nbsp;</p>',1,1,NULL,'2025-03-15 09:44:15','2025-03-15 09:44:15'),
(84,'<p>&nbsp;Dalam tipe pecahan, bagian penyebut tidak boleh bernilai...&nbsp;</p>','short_answer',27,15,15,'<p>&nbsp;Penyebut pecahan tidak boleh nol karena pembagian dengan nol tidak terdefinisi.&nbsp;</p>',1,1,NULL,'2025-03-15 09:44:55','2025-03-15 09:44:55'),
(85,'<p>&nbsp;Fungsi apa saja yang bisa digunakan dalam type POINT? (Pilih semua yang benar)&nbsp;</p>','multiple_answer',27,30,30,'<p>&nbsp;Fungsi IsOrigin?, Jarak0, dan Absis digunakan dalam tipe POINT, sedangkan \"Penyebut\" digunakan dalam tipe pecahan.&nbsp;</p>',1,1,NULL,'2025-03-15 09:46:16','2025-03-15 09:46:16'),
(86,'<p>&nbsp;Jelaskan bagaimana cara menentukan kuadran dari sebuah titik dalam sistem&nbsp;</p>','essay',27,30,30,'<p>Kuadran ditentukan berdasarkan tanda nilai x dan y dari titik tersebut:</p><ul><li>Kuadran 1: x &gt; 0, y &gt; 0</li><li>Kuadran 2: x &lt; 0, y &gt; 0</li><li>Kuadran 3: x &lt; 0, y &lt; 0</li><li>Kuadran 4: x &gt; 0, y &lt; 0</li></ul><p><br></p>',1,1,NULL,'2025-03-15 09:47:05','2025-03-15 09:47:05'),
(87,'<p>&nbsp;Koleksi objek memungkinkan kita menyimpan lebih dari satu nilai dalam satu variabel.&nbsp;</p>','true_false',28,5,10,'<p>&nbsp;Koleksi objek seperti list atau array memungkinkan kita menyimpan banyak data dalam satu variabel, berbeda dengan variabel biasa yang hanya bisa menyimpan satu nilai.&nbsp;</p>',1,1,NULL,'2025-03-15 11:26:49','2025-03-15 11:26:49'),
(88,'<p>&nbsp;Manakah <strong>bukan</strong> contoh penggunaan koleksi objek dalam kehidupan sehari-hari?&nbsp;</p>','multiple_choice',28,10,10,'<ul><li><strong>A, B, dan D benar</strong> karena daftar belanjaan, riwayat chat, dan playlist lagu semuanya menggunakan koleksi objek untuk menyimpan data.</li><li><strong>C salah</strong> karena tombol power hanya satu dan tidak menyimpan banyak nilai, sehingga bukan termasuk koleksi objek.</li></ul><p><br></p>',1,1,NULL,'2025-03-15 11:28:31','2025-03-15 11:28:31'),
(89,'<p>&nbsp;Struktur data <strong>Queue</strong> paling sesuai digunakan untuk situasi berikut, kecuali...?&nbsp;</p>','multiple_choice',29,10,10,'<p><strong>A, B, dan D benar</strong> karena queue mengikuti <strong>FIFO (First In, First Out)</strong>, seperti antrean di kasir dan printer.</p><p><strong>C salah</strong> karena tumpukan piring menggunakan <strong>LIFO (Last In, First Out)</strong>, yang lebih cocok disebut sebagai <strong>Stack</strong>.</p>',1,1,NULL,'2025-03-15 11:32:56','2025-03-15 11:32:56'),
(90,'<p>&nbsp;Stack adalah struktur data yang mengikuti prinsip FIFO (First In, First Out).&nbsp;</p>','true_false',29,5,10,'<p>&nbsp;Stack mengikuti prinsip <strong>LIFO (Last In, First Out)</strong>, bukan FIFO. Artinya, elemen terakhir yang masuk akan menjadi yang pertama keluar, seperti tumpukan piring di dapur.&nbsp;</p>',1,1,NULL,'2025-03-15 11:33:38','2025-03-15 11:33:38'),
(91,'<p>&nbsp;Mana pernyataan yang <strong>benar</strong> tentang operasi pada koleksi objek?&nbsp;</p>','multiple_choice',30,10,10,'<p><strong>A salah</strong> karena remove() digunakan untuk menghapus elemen, bukan menambah.</p><p><strong>B benar</strong> karena pop() akan menghapus elemen terakhir dalam list.</p><p><strong>C salah</strong> karena insert() bisa digunakan di berbagai koleksi, termasuk list.</p><p><strong>D salah</strong> karena append() juga bisa digunakan dalam list dan queue, bukan hanya stack.</p>',1,1,NULL,'2025-03-15 11:36:38','2025-03-15 11:36:38'),
(92,'<p>&nbsp;Dalam Python, list.append(10) akan menambahkan angka 10 di awal list.&nbsp;</p>','true_false',30,5,10,'<p>&nbsp;Metode <strong>append()</strong> menambahkan elemen <strong>di akhir list</strong>, bukan di awal. Untuk menambahkan elemen di awal, kita bisa menggunakan insert(0, 10).&nbsp;</p>',1,1,NULL,'2025-03-15 11:37:46','2025-03-15 11:37:46'),
(93,'<p>&nbsp;Koleksi objek hanya bisa digunakan dalam bahasa pemrograman Python.&nbsp;</p>','true_false',31,10,10,'<p> Koleksi objek tersedia dalam berbagai bahasa pemrograman seperti Python, Java, C++, dan lainnya.&nbsp;</p>',1,1,NULL,'2025-03-15 13:44:41','2025-03-15 13:44:41'),
(94,'<p>&nbsp;Manakah dari berikut ini yang termasuk contoh koleksi objek?&nbsp;<strong>(Pilih semua yang benar)</strong></p>','multiple_answer',31,20,20,'<p>&nbsp;Integer dan Boolean adalah tipe data dasar, sedangkan List dan Stack adalah bentuk koleksi objek.&nbsp;</p>',1,1,NULL,'2025-03-15 13:46:21','2025-03-15 13:46:57'),
(95,'<p>&nbsp;Operasi apa saja yang bisa dilakukan pada koleksi objek? (Pilih semua yang benar)&nbsp;</p>','multiple_answer',31,20,20,'<p>&nbsp;Koleksi objek mendukung operasi tambah, hapus, dan akses elemen, tetapi tidak secara otomatis mengubah tipe data elemen.&nbsp;</p>',1,1,NULL,'2025-03-15 13:48:43','2025-03-15 13:48:43'),
(96,'<p>&nbsp;Struktur koleksi objek yang menggunakan konsep LIFO disebut...?&nbsp;</p>','short_answer',31,15,15,'<p>&nbsp;Stack menggunakan konsep Last In, First Out (LIFO), seperti tumpukan buku.&nbsp;</p>',1,1,NULL,'2025-03-15 13:49:46','2025-03-15 13:49:46'),
(97,'<p>&nbsp;Queue adalah struktur koleksi yang mengikuti prinsip Last In, First Out (LIFO).&nbsp;</p>','true_false',31,10,10,'<p>&nbsp;Queue menggunakan prinsip First In, First Out (FIFO), seperti antrean di kasir.&nbsp;</p>',1,1,NULL,'2025-03-15 13:50:22','2025-03-15 13:50:22'),
(98,'<p>&nbsp;Dalam Python, bagaimana cara menambahkan elemen ke dalam list?&nbsp;</p>','multiple_choice',31,15,15,'<p>&nbsp;Fungsi append() digunakan untuk menambahkan elemen ke dalam list di Python.&nbsp;</p>',1,1,NULL,'2025-03-15 13:51:33','2025-03-15 13:51:33'),
(99,'<p>Jelaskan perbedaan antara List dan Stack dalam koleksi objek!&nbsp;</p>','essay',31,25,25,'<p>List adalah koleksi yang berisi elemen berurutan dan bisa diakses berdasarkan indeks. Stack adalah struktur data yang mengikuti prinsip LIFO (Last In, First Out), di mana elemen terakhir yang dimasukkan akan diambil lebih dulu.&nbsp;</p>',1,1,NULL,'2025-03-15 13:52:22','2025-03-15 13:52:22'),
(100,'<p>&nbsp;Struktur koleksi objek yang memiliki hubungan parent-child disebut...?&nbsp;</p>','short_answer',31,15,15,'<p>&nbsp;Tree adalah struktur hierarki dengan hubungan antara parent dan child nodes.&nbsp;</p>',1,1,NULL,'2025-03-15 13:53:02','2025-03-15 13:53:02'),
(101,'<p>Bahasa pemrograman mana saja yang mendukung koleksi objek? <strong>(Pilih semua yang benar)&nbsp;</strong></p>','multiple_answer',31,20,20,'<p>&nbsp;Python, Java, dan C++ mendukung koleksi objek, sedangkan HTML adalah bahasa markup yang tidak memiliki koleksi objek.&nbsp;</p>',1,1,NULL,'2025-03-15 13:54:15','2025-03-15 13:54:15'),
(102,'<p>&nbsp;Tabel dalam pemrograman selalu dimulai dengan indeks 1 di semua bahasa pemrograman.&nbsp;</p>','true_false',32,10,10,'<p>Indeks tabel bisa dimulai dari 1 atau 0, tergantung bahasa pemrogramannya. Misalnya, Python dan C menggunakan indeks mulai dari 0, sedangkan Pascal menggunakan indeks mulai dari 1.&nbsp;</p>',1,1,NULL,'2025-03-15 14:59:26','2025-03-15 14:59:26'),
(103,'<p>&nbsp;Apa yang benar mengenai tabel dalam pemrograman?&nbsp;</p>','multiple_choice',32,15,15,'<p><strong>A Salah</strong> → Tabel bisa menyimpan berbagai tipe data, tidak hanya angka.</p><p><strong>B Benar</strong> → Indeks digunakan untuk mengakses elemen dalam tabel.</p><p><strong>C Salah</strong> → Beberapa bahasa pemrograman menggunakan indeks mulai dari 0.</p><p><strong>D Salah</strong> → Tabel bisa menyimpan angka, string, atau tipe data lainnya.</p>',1,1,NULL,'2025-03-15 15:00:54','2025-03-15 15:00:54'),
(104,'<p>&nbsp;Bagaimana cara mengakses elemen ke-3 dari tabel bernama T dalam bahasa pemrograman yang menggunakan indeks mulai dari 0?&nbsp;</p>','short_answer',32,20,20,'<p>&nbsp;Jika indeks dimulai dari 0, maka elemen ke-3 berada pada indeks 2.&nbsp;</p>',1,1,NULL,'2025-03-15 15:01:52','2025-03-15 15:01:52'),
(105,'<p>Type komposisi bisa menyimpan elemen dengan tipe data yang berbeda-beda, sedangkan tabel hanya bisa menyimpan elemen dengan tipe data yang sama.&nbsp;</p>','true_false',33,10,10,'<p>Dalam type komposisi seperti record atau struct, elemen bisa memiliki tipe data berbeda. Sedangkan dalam tabel (array), semua elemen harus memiliki tipe data yang sama.&nbsp;</p>',1,1,NULL,'2025-03-15 15:04:08','2025-03-15 15:04:08'),
(106,'<p>&nbsp;Apa perbedaan utama antara tabel dan type komposisi?&nbsp;</p>','multiple_choice',33,15,15,'<p><strong>A Benar</strong> → Elemen tabel harus memiliki tipe data yang sama.</p><p><strong>B Benar</strong> → Tabel menggunakan indeks, type komposisi menggunakan nama atribut.</p><p><strong>C Benar</strong> → Type komposisi adalah satu entitas, sedangkan tabel adalah kumpulan entitas.</p>',1,1,NULL,'2025-03-15 15:06:01','2025-03-15 15:06:01'),
(107,'<p>&nbsp;Mengapa kita menggunakan tabel koreksi dalam perhitungan hari ke- dalam setahun?&nbsp;</p>','multiple_choice',34,15,15,'<p><strong>A Benar</strong> → Tabel koreksi membantu menyesuaikan jumlah hari di setiap bulan.</p><p><strong>B Benar</strong> → Tahun kabisat perlu diperhitungkan agar perhitungan lebih akurat.</p><p><strong>C Benar</strong> → Tabel koreksi menghindari perhitungan manual yang lebih rentan terhadap kesalahan.</p>',1,1,NULL,'2025-03-15 15:09:24','2025-03-15 15:09:24'),
(108,'<p>Tabel bisa digunakan untuk menghitung hari ke- dalam satu tahun dengan lebih akurat menggunakan tabel koreksi.&nbsp;</p>','true_false',34,10,10,'<p>Tabel koreksi digunakan untuk menyesuaikan jumlah hari dalam setiap bulan sehingga perhitungan hari dalam satu tahun menjadi lebih akurat.&nbsp;</p>',1,1,NULL,'2025-03-15 15:10:19','2025-03-15 15:10:19'),
(109,'<p>&nbsp;Tahun 1900 adalah tahun kabisat karena habis dibagi 4.&nbsp;</p>','true_false',35,10,10,'<p>Tahun 1900 tidak termasuk tahun kabisat karena meskipun habis dibagi 4, tahun tersebut juga habis dibagi 100 tetapi tidak habis dibagi 400.&nbsp;</p>',1,1,NULL,'2025-03-15 15:11:48','2025-03-15 15:11:48'),
(110,'<p>&nbsp;Mana dari pernyataan berikut yang benar tentang tahun kabisat?&nbsp;</p>','multiple_choice',35,15,15,'<p><strong>A Salah</strong> → Tahun kabisat harus habis dibagi 4 dan tidak habis dibagi 100, kecuali juga habis dibagi 400.</p><p><strong>B Benar</strong> → Jika tahun habis dibagi 400, maka tahun itu pasti kabisat.</p><p><strong>C Salah</strong> → Tahun 2100 bukan tahun kabisat karena habis dibagi 100 tetapi tidak habis dibagi 400.</p><p><strong>D Salah</strong> → Tahun 2023 bukan tahun kabisat karena tidak habis dibagi 4.</p>',1,1,NULL,'2025-03-15 15:14:08','2025-03-15 15:14:08'),
(111,'<p>Berikut ini yang merupakan contoh tabel dalam kehidupan nyata, <strong>kecuali...</strong>&nbsp;</p>','multiple_choice',36,15,15,'<p>Tabel digunakan untuk menyimpan data dalam urutan tertentu dengan indeks, seperti jadwal, daftar harga, dan kalender.&nbsp;</p>',1,1,NULL,'2025-03-15 15:21:23','2025-03-15 15:21:23'),
(112,'<p>Perbedaan antara tabel dan type komposisi dalam pemrograman adalah...?&nbsp;</p>','multiple_answer',36,25,25,'<p>Type komposisi seperti struct atau class dapat memiliki elemen dengan tipe data berbeda dan biasanya diakses menggunakan nama atribut.&nbsp;</p>',1,1,NULL,'2025-03-15 15:25:08','2025-03-15 15:25:08'),
(113,'<p>&nbsp;Dalam bahasa pemrograman seperti Python dan C, indeks pertama dari tabel biasanya dimulai dari angka...?&nbsp;</p>','short_answer',36,20,20,'<p>Indeks dalam banyak bahasa pemrograman seperti Python dan C dimulai dari 0, bukan 1.&nbsp;</p>',1,1,NULL,'2025-03-15 15:25:47','2025-03-15 15:25:47'),
(114,'<p>&nbsp;Fungsi selektor dapat digunakan untuk mengakses elemen dalam tabel dengan cara yang lebih sederhana daripada indeks.&nbsp;</p>','true_false',36,10,10,'<p>Fungsi selektor memiliki cara akses yang lebih kompleks dibandingkan dengan tabel yang langsung menggunakan indeks.&nbsp;</p>',1,1,NULL,'2025-03-15 15:26:25','2025-03-15 15:26:25'),
(115,'<p>Jika T = [31, 28, 31, 30], bagaimana cara mengakses elemen kedua dalam Python?&nbsp;</p>','multiple_choice',36,15,15,'<p>Dalam Python, indeks dimulai dari 0, sehingga elemen kedua berada pada indeks 1.&nbsp;</p>',1,1,NULL,'2025-03-15 15:28:01','2025-03-15 15:28:01'),
(116,'<p>&nbsp;Tahun berikut ini adalah tahun kabisat, kecuali...?&nbsp;</p>','multiple_answer',36,20,20,'<p>&nbsp;Tahun 2100 bukan tahun kabisat karena habis dibagi 100 tetapi tidak habis dibagi 400.&nbsp;</p>',1,1,NULL,'2025-03-15 15:29:50','2025-03-15 15:29:50'),
(117,'<p>Diberikan definisi berikut:</p><ul><li>Basis: 1 adalah bilangan ganjil</li><li>Rekurens: Jika x adalah bilangan ganjil, maka x + 2 juga bilangan ganjil.</li></ul><p><strong>Manakah pernyataan yang benar berdasarkan definisi tersebut?</strong></p>','multiple_choice',37,15,15,'<p>Definisi bilangan ganjil secara rekursif menyatakan bahwa 1 adalah bilangan ganjil, dan jika suatu bilangan x adalah ganjil, maka x + 2 juga ganjil. Dari definisi ini:</p><ul><li>1 adalah ganjil</li><li>1 + 2 = 3 → ganjil</li><li>3 + 2 = 5 → ganjil&nbsp;</li></ul><p>Jadi, bilangan 5 termasuk bilangan ganjil sesuai definisi.</p>',1,1,NULL,'2025-03-15 15:50:22','2025-03-15 15:50:22'),
(118,'<p>Diketahui bahwa tipe rekursif digunakan untuk mendefinisikan struktur data atau konsep matematika yang mengacu pada dirinya sendiri. Manakah dari berikut ini yang merupakan contoh tipe rekursif?&nbsp;</p>','multiple_answer',37,20,20,'<p><strong>Bilangan natural</strong> → Didefinisikan secara rekursif dengan basis 0 dan rekursi succ(x) = x + 1.</p><p><strong>List/sequence</strong> → Dibentuk dengan basis list kosong [ ] dan rekursi dengan menambahkan elemen baru ke dalam list.</p><p><strong>Bilangan bulat ganjil</strong> → Didefinisikan dengan basis 1 dan rekursi x + 2.</p><p><strong>Matriks</strong> <strong>bukan</strong> tipe rekursif karena biasanya direpresentasikan sebagai array 2D tanpa referensi ke dirinya sendiri dalam definisi strukturalnya.</p>',1,1,NULL,'2025-03-15 15:52:43','2025-03-15 15:52:43'),
(119,'<p>Dalam bukti rekursif, jika suatu property benar untuk n = 0 dan kita membuktikan bahwa jika benar untuk n maka juga benar untuk n+1, maka kita dapat menyimpulkan bahwa property tersebut benar untuk semua n ≥ 0.&nbsp;</p>','true_false',37,10,10,'<p>Ini adalah prinsip induksi matematika, yang merupakan dasar dari pembuktian rekursif. Dengan membuktikan <strong>basis</strong> (n = 0) dan <strong>rekurens</strong> (jika benar untuk n maka benar untuk n+1), kita dapat menyimpulkan bahwa property tersebut berlaku untuk semua bilangan natural n.&nbsp;</p>',1,1,NULL,'2025-03-15 15:53:32','2025-03-15 15:53:32'),
(120,'<p>&nbsp;Manakah pernyataan yang benar mengenai fungsi rekursif langsung?&nbsp;</p>','multiple_choice',38,20,20,'<p>Fungsi rekursif langsung adalah fungsi yang dalam definisinya memanggil dirinya sendiri, seperti dalam perhitungan faktorial dan Fibonacci. Kondisi basis sangat diperlukan agar rekurens berhenti. Tidak selalu memiliki dua basis kondisi, tergantung definisi rekursinya. Selain itu, rekursi bisa lebih tidak efisien dibanding iterasi dalam beberapa kasus karena overhead pemanggilan fungsi berulang.&nbsp;</p>',1,1,NULL,'2025-03-15 17:17:17','2025-03-15 17:17:17'),
(121,'<p>&nbsp;Pilih pernyataan yang benar tentang fungsi Fibonacci dalam rekursi!&nbsp;</p>','multiple_answer',38,20,20,'<ul><li>Fibonacci adalah contoh rekursif langsung karena dalam definisinya, fungsi memanggil dirinya sendiri.</li><li>Fungsi Fibonacci memiliki dua kondisi basis: <strong>Fib(0) = 0</strong> dan <strong>Fib(1) = 1</strong>, untuk mencegah infinite recursion.</li><li>Fibonacci dalam bentuk rekursif <strong>kurang efisien</strong> dibanding iteratif karena banyaknya pemanggilan fungsi yang berulang (terutama tanpa memoization).</li><li>Tanpa kondisi basis, rekursi tidak akan pernah berhenti dan akan menyebabkan stack overflow.</li></ul>',1,1,NULL,'2025-03-15 17:19:15','2025-03-15 17:19:15'),
(122,'<p>&nbsp;Fungsi faktorial fac(n) = n * fac(n-1) adalah contoh fungsi rekursif langsung karena fungsi tersebut memanggil dirinya sendiri dalam ekspresinya.&nbsp;</p>','true_false',38,20,20,'<p>Fungsi faktorial adalah contoh rekursif langsung karena dalam implementasinya, fungsi fac(n) memanggil dirinya sendiri dengan parameter n-1. Ini adalah ciri khas rekursi langsung, di mana pemanggilan fungsi tidak melibatkan fungsi lain seperti pada rekursi tidak langsung.&nbsp;</p>',1,1,NULL,'2025-03-15 17:19:53','2025-03-15 17:19:53'),
(123,'<p>Mana yang merupakan basis dalam rekursi untuk fungsi Plus(x, y)?&nbsp;</p>','multiple_choice',39,20,20,'<p>&nbsp;Dalam rekursi, kita butuh kondisi dasar agar fungsi berhenti. Untuk fungsi Plus, basisnya adalah ketika y = 0, maka hasilnya x.&nbsp;</p>',1,1,NULL,'2025-03-15 17:34:36','2025-03-15 17:34:36'),
(124,'<p>&nbsp;Fungsi rekursif <strong>Plus(x, y)</strong> bekerja dengan cara mengurangi nilai y hingga 0.&nbsp;</p>','true_false',39,20,20,'<p>Dalam fungsi Plus(x, y), jika y &gt; 0, kita terus mengurangi y dan menambahkan 1 sampai mencapai y = 0.</p>',1,1,NULL,'2025-03-15 17:35:22','2025-03-15 17:35:22');

/*Table structure for table `exercises` */

DROP TABLE IF EXISTS `exercises`;

CREATE TABLE `exercises` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `topic_id` bigint(20) unsigned NOT NULL,
  `lesson_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exercises_topic_id_foreign` (`topic_id`),
  KEY `exercises_lesson_id_foreign` (`lesson_id`),
  KEY `exercises_created_by_foreign` (`created_by`),
  KEY `exercises_updated_by_foreign` (`updated_by`),
  CONSTRAINT `exercises_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exercises_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exercises_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exercises_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `exercises` */

insert  into `exercises`(`id`,`title`,`topic_id`,`lesson_id`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values 
(1,'Exercise I',1,2,1,1,NULL,'2025-03-13 10:46:35','2025-03-13 10:46:35'),
(2,'Exercise 2',1,3,1,1,NULL,'2025-03-13 10:52:27','2025-03-13 10:52:27'),
(3,'Exercise 3',1,4,1,1,NULL,'2025-03-13 10:55:26','2025-03-13 10:55:26'),
(4,'Exercise 4',1,5,1,1,NULL,'2025-03-13 11:02:12','2025-03-13 11:02:12'),
(5,'Exercise 5',1,6,1,1,NULL,'2025-03-13 11:05:47','2025-03-13 11:05:47'),
(6,'Final Exercise',1,7,1,1,NULL,'2025-03-13 11:13:17','2025-03-13 11:13:17'),
(7,'Exercise 1',2,8,1,1,NULL,'2025-03-13 15:22:52','2025-03-13 15:22:52'),
(8,'Exercise 2',2,9,1,1,NULL,'2025-03-13 15:25:19','2025-03-13 15:31:16'),
(9,'Exercise 3',2,10,1,1,NULL,'2025-03-13 15:28:24','2025-03-13 15:31:35'),
(10,'Exercise 4',2,11,1,1,NULL,'2025-03-13 15:32:08','2025-03-13 15:32:08'),
(11,'Exercise 5',2,12,1,1,NULL,'2025-03-13 15:33:32','2025-03-13 15:33:32'),
(12,'Final Exercise',2,12,1,1,NULL,'2025-03-13 15:39:07','2025-03-13 15:39:07'),
(13,'Exercise 1',3,13,1,1,NULL,'2025-03-13 17:00:48','2025-03-13 17:00:48'),
(14,'Exercise 2',3,14,1,1,NULL,'2025-03-13 17:05:04','2025-03-13 17:05:04'),
(15,'Exercise 3',3,15,1,1,NULL,'2025-03-13 17:09:43','2025-03-13 17:09:43'),
(16,'Exercise 4',3,16,1,1,NULL,'2025-03-13 17:23:34','2025-03-13 17:23:34'),
(17,'Exercise 5',3,17,1,1,NULL,'2025-03-13 17:59:52','2025-03-13 17:59:52'),
(18,'Final Exercise',3,17,1,1,NULL,'2025-03-14 03:17:55','2025-03-14 03:17:55'),
(19,'Exercise 1',4,18,1,1,NULL,'2025-03-14 03:46:23','2025-03-14 03:46:23'),
(20,'Exercise 2',4,19,1,1,NULL,'2025-03-14 04:00:03','2025-03-14 04:00:16'),
(21,'Exercise 3',4,20,1,1,NULL,'2025-03-14 04:07:35','2025-03-14 04:07:35'),
(22,'Exercise 1',5,21,1,1,NULL,'2025-03-14 08:14:21','2025-03-14 08:14:42'),
(23,'Exercise 2',5,22,1,1,NULL,'2025-03-14 08:22:29','2025-03-14 08:22:29'),
(24,'Exercise 3',5,23,1,1,NULL,'2025-03-14 08:30:24','2025-03-14 08:30:24'),
(25,'Exercise 4',5,24,1,1,NULL,'2025-03-14 09:52:50','2025-03-14 09:52:50'),
(26,'Final Exercise',4,20,1,1,NULL,'2025-03-14 10:10:55','2025-03-14 10:10:55'),
(27,'Final Exercise',5,24,1,1,NULL,'2025-03-15 09:35:49','2025-03-15 09:35:49'),
(28,'Exercise 1',6,25,1,1,NULL,'2025-03-15 11:26:09','2025-03-15 11:26:09'),
(29,'Exercise 2',6,26,1,1,NULL,'2025-03-15 11:31:14','2025-03-15 11:31:14'),
(30,'Exercise 3',6,27,1,1,NULL,'2025-03-15 11:35:05','2025-03-15 11:35:05'),
(31,'Final Exercise',6,28,1,1,NULL,'2025-03-15 13:43:53','2025-03-15 13:43:53'),
(32,'Exercise 1',7,29,1,1,NULL,'2025-03-15 14:58:36','2025-03-15 14:58:36'),
(33,'Exercise 2',7,30,1,1,NULL,'2025-03-15 15:03:14','2025-03-15 15:03:14'),
(34,'Exercise 3',7,31,1,1,NULL,'2025-03-15 15:06:40','2025-03-15 15:06:40'),
(35,'Exercise 4',7,32,1,1,NULL,'2025-03-15 15:11:06','2025-03-15 15:11:06'),
(36,'Final Exercise',7,32,1,1,NULL,'2025-03-15 15:18:51','2025-03-15 15:18:51'),
(37,'Exercise 1',8,33,1,1,NULL,'2025-03-15 15:48:09','2025-03-15 15:48:09'),
(38,'Exercise 1',8,35,1,1,NULL,'2025-03-15 17:15:22','2025-03-15 17:15:22'),
(39,'Exercise 2',8,36,1,1,NULL,'2025-03-15 17:32:39','2025-03-15 17:32:39'),
(52,'test exercise',9,43,1,1,NULL,'2025-03-18 08:35:20','2025-03-18 08:35:20');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `lessons` */

DROP TABLE IF EXISTS `lessons`;

CREATE TABLE `lessons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `exp` int(11) NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_topic_id_foreign` (`topic_id`),
  KEY `lessons_created_by_foreign` (`created_by`),
  KEY `lessons_updated_by_foreign` (`updated_by`),
  CONSTRAINT `lessons_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lessons_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lessons_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `lessons` */

insert  into `lessons`(`id`,`topic_id`,`name`,`content`,`exp`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values 
(1,1,'Introduction','<h2><strong>Paradigma Pemrograman: Cara Kita Berpikir dalam Koding</strong></h2><p>Bayangkan kamu adalah seorang arsitek yang ingin membangun rumah. Ada banyak cara untuk mendesain rumah tersebut, dan setiap pendekatan punya kelebihan serta kelemahannya. Begitu juga dengan pemrograman! Kita perlu memilih cara atau \"paradigma\" yang paling cocok untuk menyelesaikan masalah tertentu.</p><p>Paradigma pemrograman adalah pendekatan atau sudut pandang dalam menulis kode untuk memecahkan masalah. Setiap paradigma memiliki aturan dan cara berpikir yang berbeda. Beberapa paradigma utama dalam pemrograman akan diulas pada lesson berikutnya!!</p><p><br></p><p><br></p>',10,1,1,NULL,'2025-03-13 10:36:45','2025-03-17 10:42:29'),
(2,1,'Paradigma Prosedural (Imperatif)','<h2><strong>Paradigma Prosedural (Imperatif) ?️</strong></h2><h3><strong>Konsep:</strong></h3><p>Berfokus pada instruksi langkah demi langkah secara sekuensial (berurutan), seperti resep masakan.Konsep ini seperti mesin Von Neumann, algoritma + struktur data = program (tidak manusiawi).<figure data-trix-attachment=\"{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:351,&quot;url&quot;:&quot;https://lh7-rt.googleusercontent.com/docsz/AD_4nXc4TLHwM1rfxCSFOIWD1nUYW7LQxdbHKlUFsXY9IW-V2KXUELVG3TMmFZog5QoBktKVLLJAIYKjkMNS1fXwd-hJrEcyJzt5O9sbUxYBeNMnsD4cVfjAbu57g7z7OF-oaS12pMkY?key=YvWjYMQ3ZLm0Iy71ffXTRf8t&quot;,&quot;width&quot;:531}\" data-trix-content-type=\"image\" class=\"attachment attachment--preview\"><img src=\"https://lh7-rt.googleusercontent.com/docsz/AD_4nXc4TLHwM1rfxCSFOIWD1nUYW7LQxdbHKlUFsXY9IW-V2KXUELVG3TMmFZog5QoBktKVLLJAIYKjkMNS1fXwd-hJrEcyJzt5O9sbUxYBeNMnsD4cVfjAbu57g7z7OF-oaS12pMkY?key=YvWjYMQ3ZLm0Iy71ffXTRf8t\" width=\"531\" height=\"351\"><figcaption class=\"attachment__caption\"></figcaption></figure><strong>Contoh Dunia Nyata:</strong></p><p>Bayangkan kamu memberi tahu teman cara membuat kopi:<br>1️⃣ Rebus air<br>2️⃣ Masukkan kopi ke cangkir<br>3️⃣ Tuangkan air panas<br>4️⃣ Aduk rata</p><p>Komputer akan menjalankan instruksi secara berurutan seperti ini. Bahasa pemrograman yang menggunakan paradigma ini antara lain: <strong>Pascal, C, Fortran, Algol, Basic, Cobol, Ada</strong>.</p><h3><strong>Kelebihan:</strong></h3><p>✅ Efisien karena dekat dengan cara kerja mesin komputer<br>✅ Cocok untuk tugas-tugas sederhana dan pengolahan data</p><h3><strong>Kekurangan:</strong></h3><p>❌ Sulit dipahami untuk program besar<br>❌ Kurang fleksibel untuk perubahan</p>',10,1,1,NULL,'2025-03-13 10:38:14','2025-03-13 10:38:14'),
(3,1,'Paradigma Fungsional','<h2><strong>Paradigma Fungsional ?</strong></h2><h3><strong>Konsep:</strong>&nbsp;</h3><p>Berdasarkan fungsi matematika, tanpa mengubah data atau memperhatikan bagaimana memori bekerja.</p><h3><strong>Contoh Dunia Nyata:</strong></h3><p>Bayangkan kamu sedang memesan makanan online. Kamu hanya memasukkan pesanan, dan sistem akan mengolahnya tanpa kamu perlu tahu bagaimana makanan disiapkan di dapur.</p><p>Dalam pemrograman, ini seperti menyusun fungsi-fungsi kecil yang dapat digunakan kembali tanpa memodifikasi data langsung. Contoh bahasa yang menggunakan paradigma ini: <strong>Haskell, Lisp, Scala, APL.</strong></p><h3><strong>Kelebihan:</strong></h3><p>✅ Kode lebih bersih dan mudah dipahami<br>✅ Minim bug karena tidak mengubah data secara langsung</p><h3><strong>Kekurangan:</strong></h3><p>❌ Kurang efisien karena butuh banyak pemrosesan tambahan<br>❌ Tidak semua masalah cocok diselesaikan dengan pendekatan ini</p><p><br></p>',10,1,1,NULL,'2025-03-13 10:51:57','2025-03-13 10:51:57'),
(4,1,'Paradigma Deklaratif/Logika','<h2><strong>Paradigma Deklaratif / Logika ?</strong></h2><h3><strong>Konsep:</strong>&nbsp;</h3><p>Kamu cukup menyatakan <strong>\"Apa yang diinginkan\"</strong>, bukan <strong>\"Bagaimana melakukannya\"</strong>.</p><h3><strong>Contoh Dunia Nyata:</strong></h3><p>Misalnya, kamu bertanya kepada asisten AI seperti Google Assistant, \"Restoran terdekat yang buka sekarang?\"<br>Kamu tidak perlu mencari sendiri—AI akan mencocokkan pertanyaanmu dengan data yang tersedia dan memberikan jawaban.</p><p>Bahasa pemrograman yang menerapkan paradigma ini termasuk <strong>Prolog dan SQL</strong>.</p><h3><strong>Kelebihan:</strong></h3><p>✅ Sangat bagus untuk sistem berbasis kecerdasan buatan dan database<br>✅ Kode lebih ringkas dan mudah dibaca</p><h3><strong>Kekurangan:</strong></h3><p>❌ Tidak fleksibel untuk semua jenis aplikasi<br>❌ Eksekusi bisa lebih lambat</p>',10,1,1,NULL,'2025-03-13 10:54:55','2025-03-13 10:54:55'),
(5,1,'Paradigma Berorientasi Objek (OOP)','<h2><strong>Paradigma Berorientasi Objek (OOP) ?</strong></h2><h3><strong>Konsep:</strong>&nbsp;</h3><p>Mengorganisir kode ke dalam objek yang memiliki <strong>atribut (data)</strong> dan <strong>perilaku (fungsi/metode)</strong>.</p><h3><strong>Contoh Dunia Nyata:</strong></h3><p>Bayangkan kamu sedang mengembangkan game RPG:<br>? Ada karakter (objek) bernama <strong>Warrior</strong> dengan atribut <strong>\"health\" dan \"damage\"</strong>.<br>⚔️ Warrior bisa <strong>menyerang, bertahan, atau menggunakan skill</strong>.</p><p>Bahasa yang menggunakan paradigma ini: <strong>Java, Python, C++, smalltalk, eifel.</strong></p><h3><strong>Kelebihan:</strong></h3><p>✅ Kode lebih terstruktur dan mudah dikelola<br>✅ Cocok untuk proyek besar seperti aplikasi web dan game</p><h3><strong>Kekurangan:</strong></h3><p>❌ Bisa lebih kompleks dibanding paradigma lain<br>❌ Kadang performanya lebih lambat</p>',10,1,1,NULL,'2025-03-13 11:01:33','2025-03-13 11:01:33'),
(6,1,' Paradigma Konkuren','<h2><strong>Paradigma Konkuren ⚡</strong></h2><h3><strong>Konsep:</strong>&nbsp;</h3><p>Program dapat menjalankan banyak tugas secara bersamaan.</p><h3><strong>Contoh Dunia Nyata:</strong></h3><p>Bayangkan kamu di restoran cepat saji. Seorang kasir melayani pelanggan, sementara koki memasak, dan pelayan mengantar makanan <strong>secara bersamaan</strong>!</p><p>Contoh penggunaan: <strong>Pemrograman untuk server web, sistem operasi, atau game multiplayer</strong>.</p><h3><strong>Kelebihan:</strong></h3><p>✅ Dapat meningkatkan kecepatan eksekusi program<br>✅ Cocok untuk sistem yang menangani banyak permintaan sekaligus</p><h3><strong>Kekurangan:</strong></h3><p>❌ Lebih sulit diimplementasikan karena perlu menangani komunikasi antar proses</p>',10,1,1,NULL,'2025-03-13 11:05:24','2025-03-13 11:05:24'),
(7,1,'Bahasa Pemrograman','<h2>Bahasa Pemrograman</h2><p>Bahasa pemrograman terdiri dari berbagai tingkat, mulai dari:</p><ul><li><strong>Bahasa tingkat rendah</strong> (bahasa mesin dalam biner)</li><li><strong>Bahasa assembler</strong> (menggunakan kode mnemonik)</li><li><strong>Bahasa tingkat tinggi</strong></li><li><strong>Bahasa generasi keempat (4GL)</strong></li></ul><p>Sejak tahun 1960-an, bahasa pemrograman berkembang sangat pesat dan sering dianalogikan seperti <strong>Menara Babel</strong>, di mana banyak bahasa membuat komunikasi menjadi sulit. Setiap paradigma memiliki bahasa pemrogramannya sendiri untuk mempermudah implementasi solusi. Berikut beberapa contohnya:</p><ol><li><strong>Prosedural</strong> → Algol, Pascal, Fortran, Basic, Cobol, C, Ada</li><li><strong>Fungsional</strong> → LOGO, APL, LISP</li><li><strong>Deklaratif</strong> → Prolog</li><li><strong>Object-Oriented Murni</strong> → Smalltalk, Eiffel, Java</li></ol><p>Saat ini, beberapa bahasa seperti <strong>Turbo Pascal 5.5 dan C++</strong> telah dilengkapi dengan fitur <strong>Object-Oriented Programming (OOP)</strong> agar lebih fleksibel dalam pemrograman.</p><p><br></p><h3><strong>Belajar Memprogram vs. Belajar Bahasa Pemrograman</strong></h3><p>?️ <strong>Belajar memprogram</strong> bukan sekadar belajar bahasa pemrograman, tetapi juga mencakup strategi pemecahan masalah, metodologi, dan sistematika. Ini melibatkan <strong>analisis, sintesis, dan pemahaman masalah</strong> untuk menemukan solusi terbaik.</p><p>⌨️ <strong>Belajar bahasa pemrograman</strong>, di sisi lain, berfokus pada aturan sintaksis, penggunaan instruksi, dan cara mengoperasikan kompiler atau interpreter. Ini lebih bersifat keterampilan teknis dibandingkan analisis.</p><p>? <strong>Kesimpulan:</strong></p><ul><li><strong>Belajar pemrograman</strong> = Menjadi perancang (designer) program</li><li><strong>Belajar bahasa pemrograman</strong> = Menjadi coder (juru kode)</li></ul>',10,1,1,NULL,'2025-03-13 11:12:36','2025-03-13 11:12:36'),
(8,2,'Introduction','<h2>&nbsp;Pendahuluan ke Notasi Fungsional&nbsp;</h2><h3><strong>? Tujuan:</strong></h3><p>Memahami konsep dasar notasi fungsional dan bagaimana perbedaannya dengan paradigma pemrograman lainnya.</p><h3><strong>1. Apa Itu Notasi Fungsional?</strong></h3><p>Notasi fungsional adalah cara menuliskan program dengan pendekatan berbasis fungsi, yang berasal dari konsep <strong>matematika</strong>. Dalam paradigma ini, program dibuat dengan cara mendefinisikan <strong>fungsi-fungsi murni</strong> yang menghasilkan output berdasarkan input, tanpa mengubah <strong>state global</strong>.</p><p>? <strong>Analoginya seperti vending machine</strong>:</p><ul><li>Ketika kita memasukkan <strong>uang (input)</strong>, vending machine akan langsung memberikan <strong>minuman (output)</strong> tanpa mengubah sistem internalnya.</li></ul><p>? <strong>Ciri utama Notasi Fungsional:</strong></p><ul><li><strong>Deklaratif</strong>: Fokus pada \"apa yang ingin dilakukan\" bukan \"bagaimana caranya\".</li><li><strong>Tidak Ada Efek Samping</strong>: Tidak ada perubahan variabel global.</li><li><strong>Pemetaan dari Input ke Output</strong>: Setiap fungsi hanya bergantung pada inputnya.</li></ul><h3>&nbsp;2. Perbandingan dengan Pemrograman Imperatif&nbsp;</h3><p><strong>Paradigma Interaktif</strong>&nbsp;</p><ul><li>Karakteristik: langkah demi langkah, mengubah state.&nbsp;</li><li>Contoh: menggunakan loop, variabel berubah.</li></ul><p><strong>Paradigma Fungsional</strong></p><ul><li>Karakteristik:&nbsp; berbasis ekspresi, tanpa efek samping&nbsp;</li><li>Contoh:&nbsp; Menggunakan rekursi dan fungsi murni&nbsp;</li></ul><p>? <strong>Contoh dalam kehidupan nyata</strong>:</p><ul><li><strong>Imperatif</strong>: Memasak dengan resep yang mengubah bahan satu per satu.</li><li><strong>Fungsional</strong>: Menggunakan blender—masukkan bahan, tekan tombol, hasil langsung jadi!</li></ul><h3>&nbsp;3. Contoh Program dalam Notasi Fungsional vs Imperatif&nbsp;</h3><p><strong>Imperatif (Pascal)</strong></p><p><em>PROGRAM Tambah;<br>VAR<br>&nbsp; &nbsp;a, b, hasil: integer;<br>BEGIN<br>&nbsp; &nbsp;a := 5;<br>&nbsp; &nbsp;b := 3;<br>&nbsp; &nbsp;hasil := a + b;<br>&nbsp; &nbsp;WriteLn(hasil);<br>END.</em></p><p><strong>Fungsional (Haskell)</strong></p><p><em>tambah :: Int -&gt; Int -&gt; Int<br>tambah a b = a + b<br><br>main = print (tambah 5 3)</em></p><p><br>? <strong>Penjelasan:</strong></p><ul><li>Dalam <strong>imperatif</strong>, kita harus <strong>mendeklarasikan variabel</strong>, melakukan operasi, dan <strong>mengubah state variabel</strong>.</li><li>Dalam <strong>fungsional</strong>, kita cukup membuat fungsi tambah yang langsung memberikan hasil!</li></ul>',10,1,1,NULL,'2025-03-13 14:09:20','2025-03-13 14:09:20'),
(9,2,'Struktur Dasar Program','<h2>&nbsp;Struktur Dasar Program dalam Notasi Fungsional&nbsp;</h2><h3><strong>? Tujuan:</strong></h3><p>Memahami bagaimana struktur dasar dari program dalam notasi fungsional.</p><h3>? <strong>Struktur Program dalam Notasi Fungsional</strong></h3><ol><li><strong>Judul Fungsi</strong>: Nama dan parameter.</li><li><strong>Definisi &amp; Spesifikasi</strong>: Domain, range, dan deskripsi fungsi.</li><li><strong>Realisasi (Implementasi)</strong>: Cara fungsi bekerja.</li><li><strong>Aplikasi (Penggunaan)</strong>: Menggunakan fungsi dalam ekspresi nyata.</li></ol><p>? <strong>Contoh Program Notasi Fungsional</strong></p><p><em>-- Judul Fungsi<br>pangkat3 :: Int -&gt; Int<br><br>-- Definisi &amp; Spesifikasi<br>-- Menghitung nilai pangkat tiga dari sebuah angka<br><br>-- Realisasi<br>pangkat3 x = x * x * x<br><br>-- Aplikasi<br>main = print (pangkat3 3) -- Output: 27</em><br><br></p>',10,1,1,NULL,'2025-03-13 14:14:06','2025-03-13 14:14:06'),
(10,2,'Jenis Ekspresi dalam Notasi Fungsional','<h2>&nbsp;Jenis Ekspresi dalam Notasi Fungsional&nbsp;</h2><h3><strong>? Tujuan:</strong></h3><p>Memahami berbagai jenis ekspresi dalam notasi fungsional.</p><h3>? <strong>Jenis Ekspresi dalam Notasi Fungsional</strong></h3><ul><li><strong>Ekspresi Fungsional Dasar: </strong>Ekspresi langsung tanpa kondisi.&nbsp;</li></ul><p>Contoh:</p><p><em>kaliDua x = x * 2<br>main = print (kaliDua 5) -- Output: 10</em></p><ul><li>Ekspresi Kondisional:&nbsp; Menggunakan if-then-else.&nbsp;</li></ul><p>Contoh:</p><p><em>absValue x = if x &lt; 0 then -x else x<br>main = print (absValue (-5)) -- Output: 5</em></p><ul><li>Ekspresi Rekursif:&nbsp; Fungsi yang memanggil dirinya sendiri.&nbsp;</li></ul><p>Contoh:</p><p><em>faktorial 0 = 1<br>faktorial n = n * faktorial (n-1)<br>main = print (faktorial 5) -- Output: 120</em><br><br></p><p><br></p>',10,1,1,NULL,'2025-03-13 14:22:30','2025-03-13 14:22:30'),
(11,2,'Konsep Analisis Top-Down dalam Pemrograman Fungsional','<h2>Konsep Analisis Top-Down dalam Pemrograman Fungsional&nbsp;</h2><h3><strong>? Tujuan:</strong></h3><p>Memahami pendekatan <strong>top-down</strong> dalam pemrograman fungsional.</p><h3>? <strong>Konsep Analisis Top-Down</strong></h3><ul><li>Memecah masalah besar menjadi fungsi-fungsi kecil.</li><li>Setiap fungsi hanya fokus pada satu tugas.</li></ul><p><strong>? Contoh (Menghitung luas total beberapa persegi panjang)</strong></p><p><em>luasPersegiPanjang p l = p * l<br>totalLuas p1 l1 p2 l2 = luasPersegiPanjang p1 l1 + luasPersegiPanjang p2 l2<br>main = print (totalLuas 4 5 3 2) -- Output: 26</em><br><br></p>',10,1,1,NULL,'2025-03-13 14:25:00','2025-03-13 14:25:00'),
(12,2,'Implementasi Notasi Fungsional dalam Bahasa Pemrograman','<h2>Implementasi Notasi Fungsional dalam Bahasa Pemrograman&nbsp;</h2><h3><strong>? Tujuan:</strong></h3><p>Mengimplementasikan konsep notasi fungsional dalam bahasa pemrograman nyata.</p><h3>&nbsp;? <strong>Contoh di Haskell:</strong></h3><p>pangkat3 :: Integer -&gt; Integer<br>pangkat3 x = x * x * x</p><h3>&nbsp;? <strong>Contoh di LISP:</strong></h3><p>(defun pangkat3 (x) (* x x x))<br><br></p>',10,1,1,NULL,'2025-03-13 14:29:31','2025-03-13 14:29:31'),
(13,3,'Introduction','<h2><strong>Pengenalan Ekspresi Dasar</strong></h2><h3><strong>Apa Itu Ekspresi dalam Pemrograman Fungsional?</strong></h3><p>Ekspresi dalam pemrograman fungsional adalah sebuah teks yang terdiri dari nama, simbol, operator, fungsi, dan tanda kurung yang dapat menghasilkan suatu nilai melalui evaluasi. Dalam pemrograman fungsional, ekspresi merupakan dasar dalam membangun fungsi yang lebih kompleks.</p><h3><strong>Jenis-Jenis Operator</strong></h3><ol><li>Operator Aritmatika: +, -, *, /, mod, div<ul><li>Digunakan untuk operasi matematika dasar.</li><li>Contoh: 3 + 4 * 5 akan menghasilkan 23, karena * memiliki prioritas lebih tinggi daripada +.</li></ul></li><li>Operator Relasional: &lt;, &gt;, =, ≤, ≥, ≠<ul><li>Digunakan untuk membandingkan dua nilai.</li><li>Contoh: 3 &lt; 5 akan menghasilkan true.</li></ul></li><li>Operator Boolean: and, or<ul><li>Digunakan untuk menggabungkan ekspresi boolean.</li></ul></li></ol><p><strong>Contoh: (3 &lt; 5) and (5 &gt; 2) menghasilkan true.</strong></p><p><br></p>',10,1,1,NULL,'2025-03-13 17:00:08','2025-03-13 17:00:08'),
(14,3,'Ekspresi Aritmatika dan Boolean','<h2><strong>Ekspresi Aritmatika dan Boolean</strong></h2><h3><strong>Bentuk Notasi Ekspresi</strong></h3><p><strong>Ekspresi aritmatika dapat ditulis dalam tiga bentuk notasi:</strong></p><ol><li>Infix: Operator berada di antara dua operand. Contoh: (3 + 4) * 5</li><li>Prefix: Operator berada sebelum operand. Contoh: (* (+ 3 4) 5)</li><li>Postfix: Operator berada setelah operand. Contoh: (3 4 +) 5 *</li></ol><h3><strong>Evaluasi Ekspresi</strong></h3><p>Evaluasi ekspresi mengikuti aturan prioritas operator. Operator perkalian dan pembagian (*, /) memiliki prioritas lebih tinggi dibandingkan penjumlahan dan pengurangan (+, -).</p><p><strong>Contoh evaluasi:</strong></p><p><strong>3 + 4 * 5 → 3 + (4 * 5) → 3 + 20 → 23</strong></p><p><br></p>',10,1,1,NULL,'2025-03-13 17:04:31','2025-03-13 17:04:31'),
(15,3,'Fungsi dalam Ekspresi','<h2><strong>Fungsi dalam Ekspresi</strong></h2><h3><strong>Ekspresi dengan Fungsi</strong></h3><p><strong>Ekspresi dalam pemrograman fungsional dapat menggunakan fungsi untuk menghasilkan nilai. Contoh fungsi sederhana:</strong></p><ul><li>Fungsi Pangkat Dua:<br>FX2(x) = x * x<br>Jika x = 3, maka FX2(3) = 3 * 3 = 9.</li><li>Fungsi Pangkat Tiga:<br>FX3(x) = x * FX2(x)<br>Jika x = 2, maka FX3(2) = 2 * FX2(2) = 2 * 4 = 8.</li></ul><h3><strong>Evaluasi Fungsi</strong></h3><p>Evaluasi fungsi dilakukan dengan memasukkan nilai ke dalam fungsi yang telah didefinisikan. Contoh:</p><p><strong>MAX3(a, b, c) = MAX2(MAX2(a, b), c)</strong></p><p>Jika kita ingin mencari maksimum dari (8, 10, -2), maka:</p><ul><li>MAX2(8,10) = 10</li><li>MAX2(10,-2) = 10</li><li>MAX3(8,10,-2) = 10</li></ul><p><br></p>',10,1,1,NULL,'2025-03-13 17:09:14','2025-03-13 17:09:14'),
(16,3,'Evaluasi Fungsi','<h2>Evaluasi Fungsi</h2><h3><strong>Evaluasi Fungsi: Memahami Cara Kerja Evaluasi Ekspresi dalam Pemrograman</strong></h3><p><strong>1. Konsep Dasar Evaluasi Fungsi</strong></p><p>Evaluasi fungsi adalah proses menghitung hasil dari suatu ekspresi sesuai dengan aturan bahasa pemrograman yang digunakan. Dalam evaluasi ini, operator dapat dianggap sebagai fungsi dasar. Sebagai contoh, dalam bentuk prefix:</p><p><strong>* 2 3</strong></p><p>Dapat dipandang sebagai \"fungsi\" <strong>*(2,3)</strong> dalam notasi fungsional.</p><p>Evaluasi ekspresi dilakukan dengan cara menerapkan fungsi dan mengevaluasi ekspresi yang mengandung operand. Karena suatu ekspresi dapat memiliki banyak operand dan fungsi, urutan evaluasi sangat bergantung pada prioritas operand dan aturan evaluasi bahasa yang digunakan. Oleh karena itu, tanda kurung sering digunakan untuk memperjelas urutan evaluasi.</p><p><strong>2. Contoh Evaluasi Fungsi</strong></p><p>Misalkan kita ingin menghitung jarak antara dua titik dalam sistem koordinat kartesian menggunakan fungsi sebagai berikut:</p><p>Definisi Fungsi</p><ul><li>FX2(x): Menghasilkan kuadrat dari x.</li><li>dif2(x, y): Menghasilkan kuadrat dari selisih antara x dan y.</li><li>LS(x1, y1, x2, y2): Menghitung jarak antara dua titik (x1, y1) dan (x2, y2) dengan rumus:<br><em>LS(x1, y1, x2, y2) = √(dif2(y2, y1) + dif2(x2, x1))</em></li></ul><p><strong><br></strong>Implementasi Fungsi</p><p><em>FX2(x) = x * x</em></p><p><em>dif2(x, y) = FX2(x - y)</em></p><p><em>LS(x1, y1, x2, y2) = √(dif2(y2, y1) + dif2(x2, x1))</em></p><p>Jika kita ingin menghitung LS(1,3,5,6), proses evaluasi akan berlangsung sebagai berikut:</p><p><em>LS(1,3,5,6)</em></p><p><em>→ √(dif2(6,3) + dif2(5,1))</em></p><p><em>→ √(FX2(6-3) + FX2(5-1))</em></p><p><em>→ √(FX2(3) + FX2(4))</em></p><p><em>→ √(3*3 + 4*4)</em></p><p><em>→ √(9 + 16)</em></p><p><em>→ √25</em></p><p><em>→ 5</em></p><p><br></p>',10,1,1,NULL,'2025-03-13 17:22:49','2025-03-13 17:22:49'),
(17,3,'Ekspresi Bernama dan Nama Antara','<h2><strong>Ekspresi Bernama dan Nama Antara</strong></h2><h3><strong>1. Konsep Dasar Ekspresi Bernama</strong></h3><p>Dalam pemrograman fungsional, kita sering menggunakan ekspresi sementara dalam suatu fungsi. Ekspresi ini tidak dikomunikasikan ke dunia luar dan hanya berlaku di dalam fungsi tersebut. Untuk membuat kode lebih mudah dibaca dan menghindari perhitungan berulang, ekspresi ini dapat diberi nama menggunakan konstruksi <strong>let</strong>.</p><p><strong>Contoh Sederhana:</strong></p><p>Misalkan kita memiliki ekspresi <strong>(1 + a * b) * (1 - 2 * a * b)</strong>. Tanpa optimasi, ekspresi <strong>a * b</strong> dihitung dua kali. Dengan <strong>let</strong>, kita dapat menuliskannya sebagai berikut:</p><p><em>F(a, b) =</em></p><p><em>let p = a * b in</em></p><p><em>(1 + p) * (1 - 2 * p)</em></p><p><strong>Dalam contoh di atas:</strong></p><ul><li>p adalah nama lokal yang menyimpan hasil dari a * b.</li><li>p hanya berlaku di dalam fungsi F dan tidak dapat digunakan di luar.</li></ul><h3><strong>2. Struktur Penggunaan let</strong></h3><p>Bentuk umum dari penggunaan let dalam suatu fungsi adalah:</p><p><em>&lt;NAMA-FUNGSI&gt; :</em></p><p><em>let &lt;Nama&gt; = &lt;Ekspresi&gt; in</em></p><p><em>&lt;Realisasi-Fungsi&gt;</em></p><p><br></p><p>Jika terdapat lebih dari satu ekspresi, kita bisa menuliskannya seperti ini:</p><p><em>&lt;NAMA-FUNGSI&gt; :</em></p><p><em>let &lt;Nama-1&gt; = &lt;Ekspresi-1&gt;,</em></p><p><em>&nbsp; &nbsp; &lt;Nama-2&gt; = &lt;Ekspresi-2&gt;,</em></p><p><em>&nbsp; &nbsp; ...</em></p><p><em>&nbsp; &nbsp; &lt;Nama-k&gt; = &lt;Ekspresi-k&gt; in</em></p><p><em>&lt;Realisasi-Fungsi&gt;</em></p><p>Setiap ekspresi akan dievaluasi secara independen.</p><h3><strong>3. Manfaat Penggunaan let</strong></h3><ol><li>Menghindari Evaluasi Berulang: Dengan menggunakan let, kita bisa menyimpan hasil perhitungan sementara dan menghindari perhitungan yang sama berulang kali.</li><li>Membuat Program Lebih Mudah Dibaca: Memberi nama pada ekspresi membantu programmer memahami logika program dengan lebih cepat.</li></ol><h3><strong>4. Contoh Implementasi</strong></h3><p>Menghitung Rata-rata dengan Mengabaikan Nilai Ekstrem</p><p>Misalkan kita ingin menghitung rata-rata dari empat angka setelah mengabaikan nilai maksimum dan minimum:</p><p><em>MO(u, v, w, x) =</em></p><p><em>let S = u + v + w + x</em></p><p><em>&nbsp; &nbsp; M = max2 (max2 (max2 (u, v), w), x)</em></p><p><em>&nbsp; &nbsp; m = min2 (min2 (min2 (u, v), w), x) in</em></p><p><em>(S - m - M) / 2</em></p><p><strong>Dalam contoh ini:</strong></p><ul><li>S adalah jumlah dari semua nilai.</li><li>M adalah nilai maksimum.</li><li>m adalah nilai minimum.</li><li>Rata-rata dihitung setelah mengabaikan nilai maksimum dan minimum.</li></ul><h3><strong>5. Kesalahan Umum dalam Penggunaan let</strong></h3><p>Saat menggunakan let, kita harus berhati-hati agar tidak menggunakan nama lokal yang sama dengan parameter fungsi. Misalnya:</p><p><em>F(x, y) =</em></p><p><em>let x = 3 + 4 * 5 in</em></p><p><em>let y = x + 5 in</em></p><p><em>x + y</em></p><p>Kode di atas dapat membingungkan karena nama x dalam let menimpa parameter x dari fungsi. Sebaiknya gunakan nama yang berbeda agar tidak terjadi konflik.</p>',10,1,1,NULL,'2025-03-13 17:59:04','2025-03-13 17:59:04'),
(18,4,'Introduction','<h2>Pengenalan Ekspresi Kondisional</h2><h3>Apa Itu Ekspresi Kondisional?</h3><p>Ekspresi kondisional adalah ekspresi yang hasil evaluasinya bergantung pada kondisi tertentu. Dalam pemrograman, ekspresi ini sering digunakan untuk mengambil keputusan berdasarkan suatu keadaan.</p><p>Bayangkan kamu sedang bermain game, dan karakter hanya bisa melompat jika memiliki cukup energi. Itu adalah contoh ekspresi kondisional—karakter hanya bisa melompat jika syarat tertentu terpenuhi.</p><h3>Analisa Kasus dalam Ekspresi Kondisional</h3><p>Ekspresi kondisional sering dikaitkan dengan analisa kasus, yang merupakan cara memecah suatu masalah menjadi beberapa sub-masalah yang saling terpisah (disjoint). Dalam pemrograman, kita harus memastikan bahwa setiap kondisi yang dianalisis:</p><ol><li><strong>Tidak saling tumpang tindih</strong> (disjoint)</li><li><strong>Mencakup semua kemungkinan kasus</strong></li></ol><h3>Kesalahan Umum dalam Analisa Kasus</h3><ul><li>Ada kondisi yang terlewat (tidak semua kemungkinan tertangani)</li><li>Ada kondisi yang tumpang tindih (dua kondisi bisa berlaku sekaligus)</li></ul><p>Dengan memahami konsep ini, kita bisa menulis kode yang lebih akurat dan bebas dari bug!</p><p><br></p>',10,1,1,NULL,'2025-03-14 03:45:44','2025-03-14 03:45:44'),
(19,4,'Notasi Ekspresi Kondisional','<h2>Struktur If-Else dalam Ekspresi Kondisional</h2><h3>Cara Menulis Ekspresi Kondisional Menggunakan depend on</h3><p>Dalam beberapa bahasa pemrograman atau pendekatan logika, kita bisa menuliskan ekspresi kondisional dengan menggunakan bentuk <strong>depend on</strong>. Formatnya adalah:</p><p><em>depend on (kondisi)<br>&nbsp; &nbsp; hasil_jika_benar<br>otherwise<br>&nbsp; &nbsp; hasil_jika_salah</em></p><p>Contoh penggunaan:<br><em>depend on (nilai &gt;= 60)<br>&nbsp; &nbsp; print(\"Lulus\")<br>otherwise<br>&nbsp; &nbsp; print(\"Tidak Lulus\")</em></p><h3>Penggunaan else dalam Ekspresi Kondisional</h3><p>Dalam bentuk ekspresi kondisional lain, kita sering menggunakan else untuk menangani kondisi yang tidak memenuhi syarat utama. Misalnya:</p><p><em>if nilai &gt;= 60:<br>&nbsp; &nbsp; print(\"Lulus\")<br>else:<br>&nbsp; &nbsp; print(\"Tidak Lulus\")</em></p><p>Blok else memastikan bahwa jika <strong>tidak ada kondisi yang terpenuhi</strong>, maka ada hasil default yang akan dijalankan.</p><h2>Konversi depend on ke if-then-else</h2><p>Kita bisa mengubah bentuk depend on menjadi struktur if-then-else agar lebih sesuai dengan bahasa pemrograman seperti Python, Java, atau C++.</p><p>Bentuk depend on:</p><p><em>depend on (usia &gt;= 18)<br>&nbsp; &nbsp; print(\"Dewasa\")<br>otherwise<br>&nbsp; &nbsp; print(\"Remaja\")</em></p><p>Setelah dikonversi ke if-then-else:</p><p><em>if usia &gt;= 18:<br>&nbsp; &nbsp; print(\"Dewasa\")<br>else:<br>&nbsp; &nbsp; print(\"Remaja\")</em></p><p>Struktur if-then-else lebih umum digunakan dalam pemrograman karena lebih fleksibel dan kompatibel dengan berbagai bahasa pemrograman.</p>',10,1,1,NULL,'2025-03-14 03:51:56','2025-03-14 03:59:45'),
(20,4,'Evaluasi Ekspresi Kondisional','<h2>Evaluasi Ekspresi Kondisional</h2><h3>Cara Kerja Evaluasi Ekspresi Kondisional</h3><p>Evaluasi ekspresi kondisional dilakukan dengan mengevaluasi setiap kondisi secara berurutan hingga menemukan kondisi yang benar (true). Jika suatu kondisi terpenuhi, maka ekspresi terkait akan dieksekusi.</p><h3>Pentingnya Kondisi Mutual Exclusive</h3><p>Agar ekspresi kondisional berfungsi dengan baik, penting untuk memastikan bahwa setiap kondisi bersifat mutual exclusive (saling eksklusif). Artinya, hanya satu kondisi yang benar pada satu waktu, sehingga tidak ada ambiguitas dalam evaluasi.</p><h3>Operator AND then dan OR else</h3><p>Beberapa bahasa pemrograman menyediakan operator khusus seperti AND then dan OR else untuk mengoptimalkan evaluasi kondisi:<br><br></p><ul><li>AND then: Evaluasi berhenti jika kondisi pertama salah (short-circuiting).</li><li>OR else: Evaluasi berhenti jika kondisi pertama benar.</li></ul><p>Dengan memahami konsep ini, kita bisa menulis ekspresi kondisional yang lebih efisien dan aman.</p><h3>Pengenalan Operator Perbandingan</h3><p>Operator perbandingan digunakan dalam ekspresi kondisional untuk membandingkan dua nilai. Hasil dari operasi ini selalu berupa true atau false.</p><h3>Operator Perbandingan yang Umum Digunakan:<figure data-trix-attachment=\"{&quot;contentType&quot;:&quot;image/png&quot;,&quot;filename&quot;:&quot;image.png&quot;,&quot;filesize&quot;:21713,&quot;height&quot;:298,&quot;href&quot;:&quot;http://localhost:8000/storage/lessons/images/2aqT9VwtvnY7dNTtGJ9oB3tuMWYf6vkNN9iSA7uS.png&quot;,&quot;url&quot;:&quot;http://localhost:8000/storage/lessons/images/2aqT9VwtvnY7dNTtGJ9oB3tuMWYf6vkNN9iSA7uS.png&quot;,&quot;width&quot;:741}\" data-trix-content-type=\"image/png\" data-trix-attributes=\"{&quot;presentation&quot;:&quot;gallery&quot;}\" class=\"attachment attachment--preview attachment--png\"><a href=\"http://localhost:8000/storage/lessons/images/2aqT9VwtvnY7dNTtGJ9oB3tuMWYf6vkNN9iSA7uS.png\"><img src=\"http://localhost:8000/storage/lessons/images/2aqT9VwtvnY7dNTtGJ9oB3tuMWYf6vkNN9iSA7uS.png\" width=\"741\" height=\"298\"><figcaption class=\"attachment__caption\"><span class=\"attachment__name\">image.png</span> <span class=\"attachment__size\">21.2 KB</span></figcaption></a></figure></h3>',10,1,1,NULL,'2025-03-14 04:07:09','2025-03-14 04:20:34'),
(21,5,'Introduction','<h2><strong>Introduction – Apa Itu Type Bentukan?</strong></h2><h3><strong>Pendahuluan</strong></h3><p>Dalam pemrograman, kita sering bekerja dengan tipe data dasar seperti angka (integer), huruf (character), dan boolean (true/false). Namun, dalam banyak kasus, kita perlu merepresentasikan sesuatu yang lebih kompleks. Misalnya, bagaimana kita menyimpan data tentang seseorang yang memiliki <strong>nama, usia, dan alamat</strong>? Atau bagaimana kita menyimpan <strong>waktu</strong> dalam bentuk <strong>jam, menit, dan detik</strong>? Inilah alasan mengapa kita membutuhkan <strong>type bentukan</strong>.</p><h3><strong>Apa Itu Type Bentukan?</strong></h3><p><strong>Type bentukan</strong> adalah tipe data yang <strong>dibentuk dari kombinasi beberapa tipe data dasar</strong>. Dengan menggunakan type bentukan, kita bisa merepresentasikan data yang lebih kompleks dalam satu kesatuan.</p><h3><strong>Contoh Type Bentukan</strong></h3><ol><li><strong>Koordinat (x, y)</strong> → merepresentasikan posisi pada bidang dua dimensi.</li><li><strong>Tanggal (hari, bulan, tahun)</strong> → menyimpan informasi tentang tanggal.</li><li><strong>Waktu (jam, menit, detik)</strong> → menyimpan waktu secara lebih terstruktur.</li></ol><p><strong>Contoh dalam Python:</strong></p><p><em># Type Bentukan untuk menyimpan titik koordinat<br>Point = (5, 7)&nbsp; # x = 5, y = 7<br><br># Type Bentukan untuk menyimpan tanggal<br>Date = (14, 3, 2025)&nbsp; # hari = 14, bulan = 3, tahun = 2025</em></p><h2><strong>Keuntungan Menggunakan Type Bentukan</strong></h2><ul><li><strong>Lebih Terstruktur</strong> → Memudahkan dalam mengorganisir data. </li><li><strong>Mempermudah Pemrograman</strong> → Data yang berhubungan bisa dikelompokkan bersama. </li><li><strong>Mempermudah Maintenance</strong> → Memudahkan pembacaan dan pengeditan kode. </li><li><strong>Dapat Digunakan Kembali</strong> → Bisa digunakan dalam banyak bagian program.</li></ul>',10,1,1,NULL,'2025-03-14 07:12:32','2025-03-14 07:12:32'),
(22,5,'Produk dari Type & Contoh Penggunaannya','<h2><strong>Produk dari Type &amp; Contoh Penggunaannya</strong></h2><h3><strong>Produk dari Type</strong></h3><p>Produk dari type adalah konsep di mana beberapa tipe data digabungkan menjadi satu kesatuan. Ini memungkinkan kita membuat struktur data yang lebih fleksibel dan mudah digunakan dalam program.</p><h3><strong>Contoh Produk dari Type</strong></h3><ul><li><strong>Type \"Point\"</strong> → (x, y), yang terdiri dari dua angka integer.</li><li><strong>Type \"Date\"</strong> → (hari, bulan, tahun), yang terdiri dari tiga angka integer.</li><li><strong>Type \"Waktu\"</strong> → (jam, menit, detik), yang terdiri dari tiga angka integer.</li></ul><p><strong>Contoh dalam python:</strong></p><p><em># Definisi Type Bentukan Date<br>Date = (14, 3, 2025)&nbsp; # hari = 14, bulan = 3, tahun = 2025</em></p><p><br></p>',10,1,1,NULL,'2025-03-14 08:21:44','2025-03-14 08:21:44'),
(23,5,'Konstruktor, Selektor, dan Operasi pada Type Bentukan','<h2><strong>Konstruktor &amp; Selektor</strong></h2><p>Dalam type bentukan, kita butuh dua hal penting: </p><ol><li><strong>Konstruktor</strong> → Membantu membuat data baru.</li><li>&nbsp;<strong>Selektor</strong> → Mengambil informasi dari data yang sudah ada.</li></ol><p><strong>Contoh Konstruktor &amp; Selektor dalam Python:</strong></p><p><em># Konstruktor untuk membuat titik<br>def make_point(x, y):<br>&nbsp; &nbsp; return (x, y)<br><br># Selektor untuk mengambil nilai x dan y dari sebuah titik<br>def get_x(point):<br>&nbsp; &nbsp; return point[0]<br><br>def get_y(point):<br>&nbsp; &nbsp; return point[1]<br><br># Penggunaan<br>titik = make_point(3, 4)<br>print(get_x(titik))&nbsp; # Output: 3<br>print(get_y(titik))&nbsp; # Output: 4</em></p><p><br></p>',10,1,1,NULL,'2025-03-14 08:29:43','2025-03-14 08:29:43'),
(24,5,'Contoh Kasus Sederhana Pemrosesan Tipe Terstruktur','<p>Dalam pemrograman, sering kali kita berurusan dengan data yang memiliki struktur tertentu, seperti titik dalam koordinat, pecahan, atau tanggal. Dengan menggunakan <strong>tipe terstruktur</strong>, kita bisa mengorganisir data ini dengan lebih rapi dan mudah diolah. Yuk, kita pelajari beberapa contoh penggunaannya! ✨</p><h2><strong>Kasus 1: Tipe POINT</strong></h2><p>Didefinisikan suatu tipe bernama <strong>Point</strong>, yang merepresentasikan suatu titik dalam koordinat kartesian yang terdiri dari <strong>absis (x)</strong> dan <strong>ordinat (y)</strong>.</p><h3><strong>Definisi Tipe</strong></h3><pre>TYPE POINT\nDEFINISI TYPE:\ntype point : &lt;x: real , y: real&gt;\n{&lt;x,y&gt; adalah sebuah point, dengan x sebagai absis dan y sebagai ordinat}</pre><p><strong>Penjelasan:</strong></p><ul><li>Bayangkan sebuah peta dengan sumbu <strong>X (horizontal)</strong> dan <strong>Y (vertikal)</strong>.</li><li>Titik di dalam peta memiliki koordinat tertentu, misalnya (3,4).</li><li>Kita bisa membuat tipe data khusus untuk menyimpan informasi ini!</li></ul><h3><strong>Definisi dan Spesifikasi Selektor</strong></h3><pre>Absis : point → real\n{Absis(P) memberikan absis dari titik P}\n\nOrdinat : point → real\n{Ordinat(P) memberikan ordinat dari titik P}</pre><p><strong>Penjelasan:</strong></p><ul><li><strong>Absis (x)</strong> adalah posisi titik di sumbu horizontal.</li><li><strong>Ordinat (y)</strong> adalah posisi titik di sumbu vertikal.</li><li>Misalnya, jika titik <strong>P = (3,4)</strong>, maka <strong>Absis(P) = 3</strong> dan <strong>Ordinat(P) = 4</strong>.</li></ul><h3><strong>Definisi dan Spesifikasi Predikat</strong></h3><pre>IsOrigin? : point → boolean\n{IsOrigin?(P) bernilai benar jika P adalah titik origin (0,0)}</pre><p><strong>Penjelasan:</strong></p><ul><li><strong>Titik origin (0,0)</strong> adalah titik awal pada koordinat kartesian.</li><li>Fungsi <strong>IsOrigin?</strong> akan mengecek apakah suatu titik berada di titik origin atau tidak.</li></ul><h3><strong>Definisi Operator/Fungsi Tambahan</strong></h3><pre>Jarak : 2 point → real\n{Jarak(P1,P2) menghitung jarak antara dua titik P1 dan P2}\n\nJarak0 : point → real\n{Jarak0(P) menghitung jarak titik terhadap titik pusat (0,0)}\n\nKuadran : point → integer [1..4]\n{Kuadran(P) menentukan kuadran di mana titik berada}</pre><p><strong>Penjelasan:</strong></p><ul><li><strong>Jarak(P1, P2)</strong> menghitung jarak antara dua titik, misalnya antara (3,4) dan (6,8).</li><li><strong>Jarak0(P)</strong> menghitung jarak suatu titik dari pusat (0,0).</li><li><strong>Kuadran(P)</strong> menentukan kuadran tempat titik berada:<ul><li>Kuadran 1: (x &gt; 0, y &gt; 0)</li><li>Kuadran 2: (x &lt; 0, y &gt; 0)</li><li>Kuadran 3: (x &lt; 0, y &lt; 0)</li><li>Kuadran 4: (x &gt; 0, y &lt; 0)</li></ul></li></ul><h2><strong>Kasus 2: Tipe PECAHAN</strong></h2><p>Didefinisikan tipe <strong>Pecahan</strong>, yang terdiri dari <strong>pembilang (n)</strong> dan <strong>penyebut (d)</strong>.</p><h3><strong>Definisi Tipe</strong></h3><pre>type pecahan : &lt;n: integer &gt;=0, d: integer &gt;0&gt;\n{n adalah pembilang dan d adalah penyebut yang tidak boleh nol}</pre><p><strong>Penjelasan:</strong></p><ul><li>Pecahan adalah bilangan dalam bentuk <strong>n/d</strong>, seperti <strong>3/4</strong> atau <strong>5/2</strong>.</li><li><strong>n</strong> adalah pembilang (angka di atas), dan <strong>d</strong> adalah penyebut (angka di bawah).</li><li>Penyebut <strong>tidak boleh nol</strong>, karena pembagian dengan nol tidak terdefinisi!</li></ul><h3><strong>Definisi Operator Aritmatika</strong></h3><pre>AddP : 2 pecahan → pecahan\n{Menjumlahkan dua pecahan P1 dan P2}</pre><p><strong>Penjelasan:</strong></p><ul><li>Untuk menjumlahkan pecahan, samakan penyebut dulu, lalu tambahkan pembilangnya.</li><li>Misalnya, <strong>1/2 + 1/3 = (3/6 + 2/6) = 5/6</strong>.</li></ul><h2><strong>Kasus 3: Tipe PENANGGALAN</strong></h2><p>Didefinisikan suatu tipe <strong>Date</strong>, yang terdiri dari <strong>hari (Hr), bulan (Bln), dan tahun (Thn)</strong>.</p><h3><strong>Definisi Tipe</strong></h3><pre>type Hr : integer [1...31]\ntype Bln : integer [1...12]\ntype Thn : integer &gt; 0\ntype date : &lt;d: Hr, m: Bln, y: Thn&gt;\n{&lt;d,m,y&gt; adalah tanggal d bulan m tahun y}</pre><p><strong>Penjelasan:</strong></p><ul><li>Tanggal terdiri dari <strong>hari, bulan, dan tahun</strong>.</li><li>Misalnya, <strong>tanggal 17 Agustus 1945</strong> disimpan sebagai <strong>(17, 8, 1945)</strong>.</li><li>Kita bisa menggunakan tipe ini untuk mempermudah perhitungan tanggal!</li></ul><h2><strong>Kesimpulan</strong></h2><p>Dengan menggunakan <strong>tipe terstruktur</strong>, kita bisa mengelola data yang lebih kompleks dengan lebih rapi. Dari contoh di atas, kita bisa melihat bagaimana: </p><ul><li><strong>Tipe Point</strong> digunakan untuk menyimpan koordinat dan menghitung jarak. </li><li><strong>Tipe Pecahan</strong> memudahkan perhitungan bilangan pecahan. </li><li><strong>Tipe Date</strong> membantu pengolahan tanggal.</li></ul><p><br></p>',10,1,1,NULL,'2025-03-14 09:24:02','2025-03-14 09:50:47'),
(25,6,'Introduction','<h2><strong>Pengenalan Koleksi Objek</strong></h2><h3>? Apa Itu Koleksi Objek?</h3><p>Dalam pemrograman, kita sering bekerja dengan data yang jumlahnya banyak dan terus berubah. Misalnya, dalam sebuah aplikasi kalender, kita perlu menyimpan banyak tanggal dalam satu tahun. Atau dalam aplikasi toko online, kita harus mengelola daftar produk yang terus bertambah.</p><p>Kalau hanya menggunakan <strong>type dasar</strong> seperti integer atau string, kita hanya bisa menyimpan satu nilai dalam satu variabel. Begitu juga dengan <strong>type komposisi</strong> seperti struct atau class, yang hanya bisa menyimpan satu objek dalam satu entitas.</p><p>Nah, di sinilah <strong>koleksi objek</strong> berperan! Koleksi objek adalah cara untuk mengelola banyak data dalam satu wadah. Dengan koleksi objek, kita bisa menyimpan, mengakses, dan mengelola banyak objek dengan lebih efisien.</p><h3>? Mengapa Kita Membutuhkan Koleksi Objek?</h3><p>Bayangkan kalau kita harus menyimpan <strong>100 angka</strong> dalam program. Kalau tanpa koleksi, kita harus membuat 100 variabel seperti ini:</p><p><strong><em>int angka1, angka2, angka3, ..., angka100;</em></strong></p><p>Wah, ribet banget kan? ?‍? Dengan koleksi objek, kita cukup membuat <strong>satu variabel saja</strong> yang bisa menyimpan banyak angka!</p><p>Misalnya dalam bahasa pemrograman seperti Python:</p><p><strong><em>angka = [10, 20, 30, 40, 50]</em></strong></p><p>Atau dalam Java:</p><p><strong><em>ArrayList&lt;Integer&gt; angka = new ArrayList&lt;&gt;();</em></strong></p><p>&nbsp;Nah, lebih ringkas dan praktis, kan? <br><br></p>',10,1,1,NULL,'2025-03-15 10:54:29','2025-03-15 10:54:29'),
(26,6,'Struktur dan Organisasi Koleksi Objek','<h2><strong>Struktur dan Organisasi Koleksi Objek</strong></h2><h3>? Bagaimana Koleksi Objek Diorganisir?</h3><p>Sebuah koleksi objek memiliki dua kondisi utama:</p><ol><li><strong>Kosong</strong> → Belum ada objek yang dimasukkan ke dalam koleksi.</li><li><strong>Berisi</strong> → Sudah ada satu atau lebih objek yang disimpan.</li></ol><p>Agar data dalam koleksi bisa digunakan dengan baik, kita perlu memahami <strong>bagaimana koleksi tersebut diorganisir</strong>. Beberapa cara pengorganisasian koleksi yang umum digunakan adalah:</p><ul><li><strong>List</strong> → Koleksi berurutan yang bisa bertambah atau berkurang.</li><li><strong>Stack</strong> → Struktur LIFO (<em>Last In, First Out</em>), seperti tumpukan buku.</li><li><strong>Queue</strong> → Struktur FIFO (<em>First In, First Out</em>), seperti antrean di kasir.</li><li><strong>Tree</strong> → Struktur hierarki dengan hubungan parent-child.</li><li><strong>Graph</strong> → Struktur kompleks dengan node dan edge.</li></ul><p>Misalnya, dalam kehidupan nyata:</p><ul><li><strong>List</strong> → Daftar belanja yang bisa bertambah atau berkurang.</li><li><strong>Stack</strong> → Tumpukan piring di restoran, yang paling atas diambil lebih dulu.</li><li><strong>Queue</strong> → Antrean tiket bioskop, yang pertama datang, pertama dilayani.</li></ul><p>Dengan memahami struktur ini, kita bisa memilih jenis koleksi yang paling sesuai dengan kebutuhan kita! ?</p><p><br></p>',10,1,1,NULL,'2025-03-15 10:55:49','2025-03-15 10:55:49'),
(27,6,'Operasi Dasar pada Koleksi Objek','<h3>? Apa yang Bisa Dilakukan dengan Koleksi Objek?</h3><p>Koleksi objek bukan hanya sekadar tempat menyimpan data, tapi juga bisa <strong>dimanipulasi</strong> dengan berbagai operasi. Berikut beberapa operasi penting dalam koleksi objek:</p><p><strong>Membuat Koleksi Kosong</strong><br> Sebelum digunakan, koleksi harus dibuat terlebih dahulu.</p><p><em>list_angka = []&nbsp; # List kosong dalam Python</em></p><p><strong>Menambahkan Elemen ke Koleksi</strong><br> Kita bisa menambahkan elemen baru ke dalam koleksi.</p><p><em>list_angka.append(10)&nbsp; # Menambahkan angka 10 ke dalam list</em></p><p><strong>Mengakses Elemen dalam Koleksi</strong><br> Elemen dalam koleksi bisa diakses berdasarkan posisinya. <br><em>print(list_angka[0])&nbsp; # Mengakses elemen pertama dari list</em></p><p><strong>Menghapus Elemen dari Koleksi</strong><br> Jika tidak lagi dibutuhkan, elemen bisa dihapus. <br><em>list_angka.remove(10)&nbsp; # Menghapus angka 10 dari list</em></p><p><strong>Mengecek Apakah Koleksi Kosong </strong><br><em>if len(list_angka) == 0:<br>&nbsp; &nbsp; print(\"Koleksi masih kosong!\")</em></p><p><strong>Mengecek Apakah Suatu Elemen Ada dalam Koleksi </strong><br><em>if 10 in list_angka:<br>&nbsp; &nbsp; print(\"Angka 10 ada dalam koleksi!\")</em></p><p>&nbsp;Operasi-operasi ini membantu kita mengelola koleksi objek dengan lebih fleksibel dan efisien!&nbsp;</p><p><br></p>',10,1,1,NULL,'2025-03-15 11:02:45','2025-03-15 11:02:45'),
(28,6,'Implementasi Koleksi dalam Berbagai Bahasa Pemrograman','<h2>&nbsp;Implementasi Koleksi dalam Berbagai Bahasa Pemrograman&nbsp;</h2><p>Tidak semua bahasa pemrograman menangani koleksi objek dengan cara yang sama. Beberapa contoh:</p><ul><li><strong>Python</strong> menyediakan list, set, dan dictionary untuk mengelola koleksi.</li><li><strong>Java/Kotlin</strong> memiliki ArrayList, LinkedList, dan HashMap.</li><li><strong>C++</strong> menggunakan vector dan map.</li></ul><p><strong>Contoh sederhana implementasi dalam Python:</strong></p><p><em>data = [\"apel\", \"mangga\", \"pisang\"]<br>data.append(\"jeruk\")&nbsp; # Menambahkan elemen baru<br>print(data[1])&nbsp; # Mengakses elemen kedua<br>data.remove(\"mangga\")&nbsp; # Menghapus elemen</em></p><p><strong>&nbsp;Dan dalam Java:&nbsp;</strong></p><p><em>ArrayList&lt;String&gt; data = new ArrayList&lt;&gt;();<br>data.add(\"apel\");<br>data.add(\"mangga\");<br>System.out.println(data.get(1)); // Mengakses elemen kedua<br>data.remove(\"mangga\"); // Menghapus elemen</em><br><br> Dengan memahami bagaimana berbagai bahasa menangani koleksi objek, kita bisa lebih mudah mengimplementasikannya dalam program!&nbsp;</p><p><br></p>',10,1,1,NULL,'2025-03-15 11:05:28','2025-03-15 11:05:28'),
(29,7,'Introduction','<h2><strong>Apa itu Tabel?</strong></h2><p>Tabel adalah sekumpulan elemen yang tersusun secara berurutan (kontigu) dan bisa diakses menggunakan indeks.&nbsp;</p><p>Bayangkan tabel seperti daftar atau array dalam pemrograman yang sering kita pakai untuk menyimpan banyak data sekaligus! ?</p><h2><strong>Contoh Tabel dalam Kehidupan Sehari-hari</strong></h2><p>Kita sering menjumpai tabel dalam berbagai bentuk, seperti:<br>✅ <strong>Jadwal perjalanan</strong>&nbsp; (misalnya daftar jam keberangkatan kereta)<br> ✅ <strong>Tabel harga barang</strong>&nbsp; (misalnya daftar harga makanan di restoran)<br> ✅ <strong>Kalender</strong>&nbsp; (misalnya daftar jumlah hari dalam setiap bulan)</p><h2><strong>Struktur Tabel dalam Pemrograman</strong></h2><p>Tabel bisa digunakan untuk menyimpan data yang memiliki <strong>indeks</strong>. Indeks ini membantu kita mengakses elemen tertentu dalam tabel dengan mudah.</p><p>Contoh tabel sederhana:</p><p><strong>[31, 28, 31, 80]<br></strong>Tabel ini memiliki <strong>4 elemen</strong>, dan setiap elemen dapat diakses berdasarkan posisinya. Misalnya:</p><ul><li>Elemen pertama: <strong>31</strong> (indeks ke-1)</li><li>Elemen kedua: <strong>28</strong> (indeks ke-2)</li></ul><p>Setiap elemen tabel harus memiliki <strong>tipe data yang sama</strong>, misalnya semua integer atau semua string.</p><h3><strong>Cara Mengakses Elemen dalam Tabel</strong></h3><p>Untuk mengambil elemen dalam tabel, kita gunakan indeks. Misalnya:</p><p><strong>T[i]</strong><br>Artinya, kita mengambil elemen ke-i dari tabel T.</p><p>? <strong>Ingat!</strong> Indeks biasanya dimulai dari angka 1 (tergantung bahasa pemrogramannya).</p><p><br></p><p><br></p>',10,1,1,NULL,'2025-03-15 14:03:56','2025-03-15 14:03:56'),
(30,7,'Perbedaan Tabel dengan Struktur Data Lain','<p>Tabel sering dibandingkan dengan <strong>type komposisi</strong> dan <strong>fungsi selektor</strong>. Yuk, kita bahas perbedaannya!</p><h3><strong>Perbedaan Tabel dengan Type Komposisi</strong></h3><ol><li><strong>Elemen tabel harus memiliki tipe data yang sama</strong>, sedangkan elemen dalam type komposisi bisa berbeda-beda.</li><li><strong>Elemen dalam type komposisi diakses berdasarkan nama</strong>, sedangkan tabel diakses berdasarkan <strong>indeks</strong>.</li><li><strong>Type komposisi adalah satu objek</strong>, sedangkan tabel adalah <strong>kumpulan objek</strong>.</li></ol><p>? Contoh <strong>type komposisi</strong>:</p><p><em>type DataMahasiswa = &lt;nama: string, umur: integer, jurusan: string&gt;</em></p><p>&nbsp;? Contoh <strong>tabel</strong>: <br><em>[\"Alice\", \"Bob\", \"Charlie\"]</em></p><p>Kalau kita ingin mengakses umur dari <strong>DataMahasiswa</strong>, kita harus menyebutkan namanya (umur). Sedangkan dalam tabel, kita cukup menyebutkan indeksnya.</p><h3><strong>Perbedaan Tabel dengan Fungsi Selektor</strong></h3><ul><li>Tabel menggunakan indeks untuk mengakses elemen.</li><li>Fungsi selektor menggunakan cara yang lebih kompleks untuk mengambil nilai tertentu.</li><li>Beberapa bahasa pemrograman, seperti <strong>LISP</strong>, merepresentasikan tabel sebagai <strong>list</strong> dengan fungsi akses khusus.</li></ul><p>? <strong>Kesimpulan</strong>: Jika memungkinkan, kita lebih baik menggunakan tabel karena lebih sederhana dan langsung!</p><p><br><br></p>',10,1,1,NULL,'2025-03-15 14:05:58','2025-03-15 14:05:58'),
(31,7,'Penggunaan Tabel dalam Pemrograman','<h3><strong>Contoh 1: Menghitung Hari Ke-</strong></h3><p>Misalkan kita ingin membuat program yang menghitung <strong>hari ke-berapa</strong> dari sebuah tanggal dalam satu tahun.</p><p>Misalnya:</p><p><em>Input: &lt;1,1,1993&gt; &nbsp;<br>Output: 1 (karena itu adalah hari pertama dalam tahun 1993)</em></p><p><em>Input: &lt;4,2,1979&gt; &nbsp;<br>Output: 35 (karena 4 Februari adalah hari ke-35)</em></p><p>Untuk melakukan ini, kita butuh <strong>koreksi jumlah hari di setiap bulan</strong>. Kita bisa menggunakan tabel <strong>koreksi</strong> untuk menghitung jumlah hari secara akurat.</p><p>Berikut contoh tabel koreksi:</p><p><em>[0,1,-1,0,0,1,1,2,3,3,4,4]</em></p><p>&nbsp;Angka-angka dalam tabel ini adalah nilai koreksi jumlah hari pada bulan tertentu.</p><p>Jika kita ingin menghitung jumlah hari dalam satu tahun, kita bisa menggunakan rumus:</p><p>NH(D) = 30 * (Month(D) - 1) + Day(D) + KoreksiB</p><p>Jika tahun tersebut adalah <strong>tahun kabisat</strong>, kita harus menambah 1 hari ekstra jika tanggal yang dihitung <strong>setelah Februari</strong>.&nbsp;</p><p><br><br><br><br></p><p><br></p>',10,1,1,NULL,'2025-03-15 14:09:36','2025-03-15 14:09:36'),
(32,7,'Tahun Kabisat dan Koreksi Hari','<h3><strong>Apa itu Tahun Kabisat?</strong></h3><p>Tahun kabisat adalah tahun yang memiliki <strong>366 hari</strong> (bukan 365) karena bulan Februari memiliki <strong>29 hari</strong>.</p><p><strong>Aturan Tahun Kabisat:</strong><br> ✔ Tahun habis dibagi <strong>4</strong> <strong>dan</strong> <strong>tidak</strong> habis dibagi <strong>100</strong><br> ✔ ATAU tahun habis dibagi <strong>400</strong></p><p>? Contoh:<br>✔ <strong>2000</strong> adalah tahun kabisat (karena habis dibagi 400)<br> ❌ <strong>1900</strong> bukan tahun kabisat (karena habis dibagi 100, tapi tidak habis dibagi 400)<br> ✔ <strong>2024</strong> adalah tahun kabisat (karena habis dibagi 4 dan tidak habis dibagi 100)</p><h3><strong>Cara Menentukan Tahun Kabisat dalam Program</strong></h3><p>Kita bisa membuat fungsi berikut:</p><p><em>IsKabisat?(a) = (a mod 4 = 0 and a mod 100 ≠ 0) or (a mod 400 = 0)</em></p><p>Fungsi ini akan menghasilkan <strong>true</strong> jika tahun tersebut adalah kabisat, dan <strong>false</strong> jika bukan.</p><h3><strong>Menyesuaikan Perhitungan Hari dengan Tahun Kabisat</strong></h3><p>Jika bulan yang dihitung lebih dari Februari <strong>dan</strong> tahun tersebut adalah kabisat, kita tambahkan <strong>1 hari ekstra</strong>! ?</p><p>Rumus perhitungan hari ke- dalam setahun:</p><p><em>NH(D) = 30 * (Month(D) - 1) + Day(D) + KoreksiB + &nbsp;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if m &gt; 2 and IsKabisat?(Year(D)) then 1 else 0</em></p><p>&nbsp;✨ Dengan cara ini, kita bisa menghitung <strong>hari ke-berapa</strong> dalam setahun dengan lebih akurat!&nbsp;</p><h2>P<strong>enutup &amp; Kesimpulan</strong> ?</h2><p>1️⃣ <strong>Tabel</strong> adalah struktur data yang menyimpan elemen dalam urutan tertentu dengan indeks.<br> 2️⃣ Tabel berbeda dengan <strong>type komposisi</strong> dan <strong>fungsi selektor</strong>.<br> 3️⃣ Tabel sangat berguna untuk menyimpan dan mengakses data secara efisien.<br> 4️⃣ Dalam contoh <strong>menghitung hari ke- dalam satu tahun</strong>, kita bisa menggunakan tabel koreksi.<br> 5️⃣ <strong>Tahun kabisat</strong> mempengaruhi jumlah hari dalam satu tahun dan harus diperhitungkan dalam program.</p><p>✨ <strong>Dengan pemahaman ini, kamu bisa lebih mudah memahami konsep tabel dan penerapannya dalam pemrograman!</strong> ?</p><p><br><br></p><p><br></p>',10,1,1,NULL,'2025-03-15 14:12:05','2025-03-15 14:12:05'),
(33,8,'Introduction','<h2><strong>Apa Itu Rekursi? ?</strong></h2><p>Bayangkan kamu sedang melihat cermin yang di dalamnya ada bayangan dirimu, dan di dalam bayangan itu ada lagi bayangan yang lebih kecil, begitu terus sampai tak terhingga. Nah, konsep rekursi dalam pemrograman mirip seperti ini!</p><p>? <strong>Definisi sederhana:</strong><br> Sebuah entitas (seperti fungsi atau tipe data) disebut <em>rekursif</em> jika dalam definisinya terdapat dirinya sendiri.</p><h3><strong>? Contoh Sederhana:</strong></h3><p>Misalnya, mendefinisikan bilangan ganjil secara rekursif:</p><ul><li><strong>Basis (awal):</strong> 1 adalah bilangan ganjil.</li><li><strong>Rekurens (lanjutan):</strong> Jika <em>x</em> adalah bilangan ganjil, maka <em>x + 2</em> juga bilangan ganjil.</li></ul><h2><strong>2. Mengapa Rekursi Itu Penting? ?</strong></h2><p>Rekursi digunakan dalam banyak hal, misalnya:<br>&nbsp;✔️ Menyelesaikan masalah yang berulang seperti faktorial dan Fibonacci.<br>&nbsp;✔️ Struktur data seperti <em>tree</em> dan <em>list</em> dalam pemrograman.<br> ✔️ Memecahkan persoalan kompleks menjadi lebih sederhana.</p><h2><strong>3. Pembuktian Rekursif: Seberapa Benar, Sih? ?</strong></h2><p>Dalam rekursi, kita harus memastikan bahwa semua elemen memenuhi sifat yang sama.</p><h3><strong>Contoh: Apakah 10ⁿ - 1 Selalu Habis Dibagi 9?</strong></h3><p>? <strong>Basis:</strong> Untuk <em>n = 0</em>, benar karena 10⁰ - 1 = 0 (habis dibagi 9).<br> ? <strong>Rekurens:</strong> Jika benar untuk <em>n</em>, maka kita tunjukkan bahwa benar untuk <em>n + 1</em>.<br> ? <strong>Kesimpulan:</strong> Karena sifat ini tetap benar untuk setiap <em>n</em>, maka pernyataan ini benar untuk semua <em>n</em>.</p><p>? <strong>Analoginya:</strong> Bayangkan kamu menyusun kartu domino dalam pola tertentu. Jika kamu berhasil menempatkan kartu pertama dengan benar, dan setiap kartu berikutnya diletakkan sesuai pola yang sama, maka seluruh susunan akan benar! ?</p><h2><strong>4. Rekursi dalam Kehidupan Sehari-hari ?</strong></h2><p>Rekursi tidak hanya ada di dunia pemrograman lho, sayang! Contohnya:<br>✔️ <strong>Cermin dalam cermin</strong> – seperti yang kita bahas tadi!<br> ✔️ <strong>Matryoshka (boneka Rusia)</strong> – boneka dalam boneka yang semakin kecil.<br> ✔️ <strong>Folder di komputer</strong> – di dalam folder bisa ada folder lain, begitu seterusnya!</p><p><br></p>',10,1,1,NULL,'2025-03-15 15:45:53','2025-03-15 15:45:53'),
(34,8,'Fungsi Rekursif','<h2><strong>Apa Itu Fungsi Rekursif?</strong></h2><p>❓ <strong>Pernah nggak sih kepikiran cara menghitung faktorial atau Fibonacci secara otomatis tanpa harus menuliskan semua angkanya satu per satu?</strong></p><p>Nah, di sinilah <strong>fungsi rekursif</strong> beraksi! ?<br> Fungsi rekursif adalah fungsi yang <strong>memanggil dirinya sendiri</strong> dalam prosesnya. Ada dua jenis rekursi:</p><ol><li><strong>Rekursif Langsung</strong> ?&nbsp;<ul><li>Fungsi memanggil dirinya sendiri dalam prosesnya.</li><li>Contoh: Menghitung faktorial n! = n × (n-1)!</li></ul></li><li><strong>Rekursif Tidak Langsung</strong> ?&nbsp;<ul><li>Fungsi F() memanggil fungsi lain G(), dan G() balik lagi memanggil F().</li><li>Contoh: Sistem saling ketergantungan dalam program.</li></ul></li></ol><p>? <strong>Catatan Penting:</strong><br> Setiap fungsi rekursif harus punya <strong>kondisi basis</strong>, yaitu kondisi yang membuat rekursi berhenti. Kalau nggak ada kondisi basis, program bakal jalan terus tanpa akhir alias <strong>infinite loop!</strong> ⚠️</p><p><br></p>',10,1,1,NULL,'2025-03-15 17:10:49','2025-03-15 17:11:17'),
(35,8,'Contoh Rekursi Langsung','<h2><strong>Contoh Rekursi Langsung - Faktorial!</strong></h2><p>Misalnya kita mau menghitung faktorial 5!:</p><p><em>def faktorial(n):<br>&nbsp; &nbsp; if n == 0:<br>&nbsp; &nbsp; &nbsp; &nbsp; return 1<br>&nbsp; &nbsp; else:<br>&nbsp; &nbsp; &nbsp; &nbsp; return n * faktorial(n-1)<br><br>print(faktorial(5))&nbsp; # Output: 120</em></p><p>? <strong>Bagaimana cara kerjanya?</strong></p><ol><li>faktorial(5) = 5 * faktorial(4)</li><li>faktorial(4) = 4 * faktorial(3)</li><li>faktorial(3) = 3 * faktorial(2)</li><li>faktorial(2) = 2 * faktorial(1)</li><li>faktorial(1) = 1 * faktorial(0)</li><li>faktorial(0) = 1 (Kondisi basis)</li></ol><p>Hasil akhirnya 5! = 5 × 4 × 3 × 2 × 1 = 120&nbsp;</p><h2><strong>Contoh Rekursi Langsung - Fibonacci!</strong></h2><p>Deret Fibonacci adalah angka yang setiap nilainya adalah hasil penjumlahan dua angka sebelumnya:</p><p><strong>0, 1, 1, 2, 3, 5, 8, 13, …</strong></p><p>Contoh kode rekursifnya:</p><p>def fibonacci(n):<br>&nbsp; &nbsp; if n == 0:<br>&nbsp; &nbsp; &nbsp; &nbsp; return 0<br>&nbsp; &nbsp; elif n == 1:<br>&nbsp; &nbsp; &nbsp; &nbsp; return 1<br>&nbsp; &nbsp; else:<br>&nbsp; &nbsp; &nbsp; &nbsp; return fibonacci(n-1) + fibonacci(n-2)<br><br>print(fibonacci(6))&nbsp; # Output: 8<br><br>? <strong>Bagaimana cara kerjanya?</strong></p><ol><li>fibonacci(6) = fibonacci(5) + fibonacci(4)</li><li>fibonacci(5) = fibonacci(4) + fibonacci(3)</li><li>fibonacci(4) = fibonacci(3) + fibonacci(2)</li><li>… dan seterusnya sampai ke kondisi basis (fibonacci(0) dan fibonacci(1)).</li></ol><p><br></p><p><br></p>',10,1,1,NULL,'2025-03-15 17:12:10','2025-03-15 17:12:10'),
(36,8,'Rekursi pada Bilangan Bulat','<p>Bayangkan kamu memiliki sebuah robot cerdas yang hanya bisa mengerjakan tugas kecil berulang kali. Jika kamu ingin menghitung sesuatu yang besar, kamu cukup memberi robot itu aturan sederhana dan biarkan dia mengerjakannya sampai selesai! Nah, itulah yang kita sebut sebagai <strong>rekursi</strong>!&nbsp;</p><p>Pada bagian ini, kita akan belajar bagaimana cara <strong>bilangan bulat (integer) didefinisikan secara rekursif</strong> dan bagaimana kita bisa membuat fungsi rekursif untuk operasi dasar seperti <strong>penjumlahan, perkalian, dan pemangkatan.</strong></p><p><strong>&nbsp;Definisi Integer secara Rekursif</strong></p><ol><li><strong>Basis:</strong><ul><li>Nol (<strong>0</strong>) adalah bilangan integer.</li></ul></li><li><strong>Rekursif:</strong><ul><li>Jika <strong>n</strong> adalah bilangan integer, maka <strong>n + 1</strong> juga bilangan integer.</li><li>Jika <strong>n</strong> adalah bilangan integer, maka <strong>n - 1</strong> juga bilangan integer.</li></ul></li></ol><p>? <strong>Artinya, semua bilangan bulat bisa dibentuk dari 0 dengan cara menambah atau mengurangi 1 terus-menerus!</strong></p><h2><strong>Rekursi dalam Operasi Dasar</strong></h2><p>Sekarang, kita akan melihat bagaimana konsep ini bisa digunakan untuk mendefinisikan operasi dasar:</p><h3><strong>1. Penjumlahan (Plus)</strong></h3><p>Kamu ingin menjumlahkan dua angka, misalnya <strong>Plus(3, 2)</strong>. Alih-alih langsung menjumlahkan, kita bisa mendefinisikan operasi ini sebagai:</p><p><strong>Aturan Rekursif</strong>:</p><ul><li><strong>Basis</strong>: Jika y = 0, maka hasilnya x.</li><li><strong>Rekursi</strong>: Jika y &gt; 0, maka hasilnya adalah <strong>1 + Plus(x, y-1)</strong>.</li></ul><p><strong>Kode Rekursif (Versi Y):</strong></p><p><em>def Plus(x, y):<br>&nbsp; &nbsp; if y == 0:<br>&nbsp; &nbsp; &nbsp; &nbsp; return x<br>&nbsp; &nbsp; else:<br>&nbsp; &nbsp; &nbsp; &nbsp; return 1 + Plus(x, y - 1)<br><br>print(Plus(3, 2))&nbsp; # Output: 5</em></p><p>&nbsp;? <strong>Analogi Simpel:</strong><br> Bayangkan kamu punya 3 apel dan temanmu memberimu 2 apel lagi. Daripada langsung menghitung semua, kita tambahkan apel satu per satu hingga habis.&nbsp;</p><h3><strong>2. Perkalian (Mul)</strong></h3><p>Bagaimana kalau kita ingin mengalikan dua angka, seperti <strong>Mul(3, 4)</strong>?</p><p><strong>Aturan Rekursif</strong>:</p><ul><li><strong>Basis</strong>: Jika y = 0, maka hasilnya 0.</li><li><strong>Rekursi</strong>: Jika y &gt; 0, maka hasilnya adalah <strong>x + Mul(x, y-1)</strong>.</li></ul><p><strong>Kode Rekursif:</strong></p><p><em>def Mul(x, y):<br>&nbsp; &nbsp; if y == 0:<br>&nbsp; &nbsp; &nbsp; &nbsp; return 0<br>&nbsp; &nbsp; else:<br>&nbsp; &nbsp; &nbsp; &nbsp; return x + Mul(x, y - 1)<br><br>print(Mul(3, 4))&nbsp; # Output: 12</em></p><p><strong>Analogi Simpel:</strong><br> Bayangkan kamu ingin menghitung 3 × 4. Alih-alih langsung menghitung, kamu bisa menambahkan <strong>3</strong> sebanyak <strong>4 kali</strong> (3 + 3 + 3 + 3).&nbsp;</p><h3>3<strong>. Pemangkatan (Exp)</strong></h3><p>Bagaimana kalau kita ingin menghitung pemangkatan, seperti <strong>Exp(2, 3)</strong>?</p><p><strong>Aturan Rekursif</strong>:</p><ul><li><strong>Basis</strong>: Jika y = 0, maka hasilnya 1.</li><li><strong>Rekursi</strong>: Jika y &gt; 0, maka hasilnya adalah <strong>x * Exp(x, y-1)</strong>.</li></ul><p><strong>Kode Rekursif:</strong></p><p><em>def Exp(x, y):<br>&nbsp; &nbsp; if y == 0:<br>&nbsp; &nbsp; &nbsp; &nbsp; return 1<br>&nbsp; &nbsp; else:<br>&nbsp; &nbsp; &nbsp; &nbsp; return x * Exp(x, y - 1)<br><br>print(Exp(2, 3))&nbsp; # Output: 8</em></p><p><strong>Analogi Simpel:</strong><br> Bayangkan kamu ingin menghitung <strong>2³</strong>. Daripada langsung menghitung, kamu bisa berpikir:<br> 2³ = 2 × 2² = 2 × (2 × 2¹) = 2 × (2 × (2 × 1)).&nbsp;</p>',10,1,1,NULL,'2025-03-15 17:32:18','2025-03-15 17:32:18'),
(39,9,'edit test','<p>testing edit</p>',10,1,1,NULL,'2025-03-17 09:51:23','2025-03-17 20:46:42'),
(43,9,'test lesson','<h2>test lesson</h2>',10,1,1,NULL,'2025-03-17 20:42:20','2025-03-17 20:42:20');

/*Table structure for table `levels` */

DROP TABLE IF EXISTS `levels`;

CREATE TABLE `levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `exp_needed` int(11) NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `levels_level_unique` (`level`),
  KEY `levels_created_by_foreign` (`created_by`),
  KEY `levels_updated_by_foreign` (`updated_by`),
  CONSTRAINT `levels_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `levels_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `levels` */

insert  into `levels`(`id`,`level`,`exp_needed`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values 
(1,1,0,1,1,NULL,'2025-03-13 09:40:56','2025-03-13 09:40:56'),
(2,2,200,1,1,NULL,'2025-03-13 09:40:56','2025-03-13 09:40:56'),
(3,3,400,1,1,NULL,'2025-03-13 09:40:56','2025-03-13 09:40:56'),
(4,4,600,1,1,NULL,'2025-03-13 09:40:56','2025-03-13 09:40:56'),
(5,5,800,1,1,NULL,'2025-03-13 09:40:56','2025-03-13 09:40:56'),
(6,6,1000,1,1,NULL,'2025-03-13 09:40:56','2025-03-13 09:40:56'),
(7,7,1200,1,1,NULL,'2025-03-13 09:40:56','2025-03-13 09:40:56'),
(8,8,1400,1,1,NULL,'2025-03-13 09:40:56','2025-03-13 09:40:56'),
(9,9,1600,1,1,NULL,'2025-03-13 09:40:56','2025-03-13 09:40:56'),
(10,10,1800,1,1,NULL,'2025-03-13 09:40:56','2025-03-13 09:40:56');

/*Table structure for table `markets` */

DROP TABLE IF EXISTS `markets`;

CREATE TABLE `markets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('Avatar','Gift') NOT NULL,
  `title` varchar(255) NOT NULL,
  `picture` longtext NOT NULL,
  `price` bigint(20) NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `markets_created_by_foreign` (`created_by`),
  KEY `markets_updated_by_foreign` (`updated_by`),
  CONSTRAINT `markets_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `markets_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `markets` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_100000_create_password_reset_tokens_table',1),
(2,'2019_08_19_000000_create_failed_jobs_table',1),
(3,'2019_12_14_000001_create_personal_access_tokens_table',1),
(4,'2025_01_10_000000_create_admins_table',1),
(5,'2025_01_10_000001_create_levels_table',1),
(6,'2025_01_10_000002_create_users_table',1),
(7,'2025_01_10_000003_create_topics_table',1),
(8,'2025_01_10_000005_create_lessons_table',1),
(9,'2025_01_10_042235_create_exercises_table',1),
(10,'2025_01_10_042306_create_ex_questions_table',1),
(11,'2025_01_10_042315_create_ex_answers_table',1),
(12,'2025_02_07_012456_create_quests_table',1),
(13,'2025_02_07_021643_create_quest_answers_table',1),
(14,'2025_02_07_024058_create_markets_table',1),
(16,'2025_02_13_013642_create_take_lessons_table',1),
(17,'2025_02_11_030226_create_take_exercises_table',2);

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `quest_answers` */

DROP TABLE IF EXISTS `quest_answers`;

CREATE TABLE `quest_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  `quest_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quest_answers_quest_id_foreign` (`quest_id`),
  KEY `quest_answers_created_by_foreign` (`created_by`),
  KEY `quest_answers_updated_by_foreign` (`updated_by`),
  CONSTRAINT `quest_answers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quest_answers_quest_id_foreign` FOREIGN KEY (`quest_id`) REFERENCES `quests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quest_answers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quest_answers` */

insert  into `quest_answers`(`id`,`content`,`is_correct`,`quest_id`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values 
(1,'<p>Fungsional</p>',1,1,1,1,NULL,'2025-03-12 09:07:40','2025-03-12 09:07:40'),
(2,'<p>Prosedural</p>',0,1,1,1,NULL,'2025-03-12 09:07:40','2025-03-12 09:07:40'),
(3,'<p>Berorientasi Objek</p>',0,1,1,1,NULL,'2025-03-12 09:07:40','2025-03-12 09:07:40'),
(4,'<p>Deklaratif</p>',0,1,1,1,NULL,'2025-03-12 09:07:41','2025-03-12 09:07:41'),
(5,'true',1,2,1,1,NULL,'2025-03-12 09:08:36','2025-03-12 09:08:36'),
(10,'<p>Prosedural</p>',0,4,1,1,NULL,'2025-03-12 09:12:32','2025-03-12 09:12:32'),
(11,'<p>Fungsional</p>',0,4,1,1,NULL,'2025-03-12 09:12:32','2025-03-12 09:12:32'),
(12,'<p>Deklaratif</p>',0,4,1,1,NULL,'2025-03-12 09:12:32','2025-03-12 09:12:32'),
(13,'<p>Konkuren</p>',0,4,1,1,NULL,'2025-03-12 09:12:32','2025-03-12 09:12:32'),
(14,'Prolog',1,5,1,1,NULL,'2025-03-12 09:13:37','2025-03-12 09:13:37'),
(15,'<ul><li><strong>Paradigma prosedural</strong> berfokus pada instruksi yang dieksekusi secara berurutan, seperti langkah-langkah dalam resep masakan. Kode tersusun dalam bentuk fungsi yang dipanggil sesuai kebutuhan.</li><li><strong>Paradigma berorientasi objek</strong> mengorganisir kode ke dalam objek yang memiliki atribut (data) dan perilaku (metode). Ini memungkinkan kode lebih modular dan mudah dikelola.</li></ul><p><br></p>',0,6,1,1,NULL,'2025-03-12 09:14:44','2025-03-12 09:14:44'),
(16,'C',1,7,1,1,NULL,'2025-03-14 08:24:59','2025-03-14 08:24:59'),
(17,'<p>True &amp;&amp; True</p>',0,8,1,1,NULL,'2025-03-14 16:27:41','2025-03-14 16:27:41'),
(18,'<p> False &amp;&amp; True</p>',1,8,1,1,NULL,'2025-03-14 16:27:41','2025-03-14 16:27:41'),
(19,'<p>(3 &gt; 2) &amp;&amp; (5 &lt; 10)</p>',0,8,1,1,NULL,'2025-03-14 16:27:41','2025-03-14 16:27:41'),
(20,'<p>True || False</p>',0,8,1,1,NULL,'2025-03-14 16:27:41','2025-03-14 16:27:41'),
(21,'5',1,9,1,1,NULL,'2025-03-14 16:35:50','2025-03-14 16:35:50');

/*Table structure for table `quests` */

DROP TABLE IF EXISTS `quests`;

CREATE TABLE `quests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `type` varchar(255) NOT NULL,
  `point` int(11) NOT NULL,
  `exp` int(11) NOT NULL,
  `difficulty` enum('Easy','Medium','Hard') NOT NULL,
  `feedback` longtext DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quests_created_by_foreign` (`created_by`),
  KEY `quests_updated_by_foreign` (`updated_by`),
  CONSTRAINT `quests_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quests_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quests` */

insert  into `quests`(`id`,`title`,`content`,`type`,`point`,`exp`,`difficulty`,`feedback`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values 
(1,'Quest 1','<p>Paradigma pemrograman manakah yang paling sesuai dengan konsep \"menyusun fungsi-fungsi kecil yang dapat digunakan kembali tanpa memodifikasi data langsung\"?</p>','multiple_choice',10,10,'Easy','<p>Paradigma <strong>fungsional</strong> berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma <strong>fungsional</strong> berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.</p>',1,1,NULL,'2025-03-12 09:07:40','2025-03-12 09:07:40'),
(2,'Quest 2','<p>SQL adalah contoh bahasa pemrograman yang menggunakan paradigma deklaratif.</p>','true_false',5,10,'Easy','<p>SQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.</p>',1,1,NULL,'2025-03-12 09:08:36','2025-03-12 09:08:36'),
(4,'Quest 4','<p>Paradigma pemrograman yang cocok untuk pengolahan data besar dan berbasis AI adalah...</p>','multiple_choice',10,10,'Easy','<p>Paradigma <strong>deklaratif</strong> seperti Prolog sering digunakan dalam <strong>AI dan database</strong>, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.</p>',1,1,NULL,'2025-03-12 09:12:32','2025-03-12 09:12:32'),
(5,'Quest 5','<p>_____ merupakan salah satu bahasa pemrograman yang mendukung paradigma deklaratif.<em><br><br>Jawab pada kolom yang tersedia tanpa ada spasi tambahan, contoh: Prosedural</em></p>','short_answer',20,20,'Medium','<p>Prolog adalah contoh bahasa pemrograman <strong>deklaratif</strong>, di mana programmer hanya menyatakan \"apa\" yang diinginkan tanpa harus mendefinisikan \"bagaimana\" cara mencapainya.</p>',1,1,NULL,'2025-03-12 09:13:37','2025-03-12 09:13:37'),
(6,'Quest 6','<p>Jelaskan perbedaan utama antara paradigma pemrograman prosedural dan berorientasi objek!</p><p><br></p>','essay',50,20,'Hard','<ul><li><strong>Paradigma prosedural</strong> berfokus pada instruksi yang dieksekusi secara berurutan, seperti langkah-langkah dalam resep masakan. Kode tersusun dalam bentuk fungsi yang dipanggil sesuai kebutuhan.</li><li><strong>Paradigma berorientasi objek</strong> mengorganisir kode ke dalam objek yang memiliki atribut (data) dan perilaku (metode). Ini memungkinkan kode lebih modular dan mudah dikelola.</li></ul><p><br></p>',1,1,NULL,'2025-03-12 09:14:44','2025-03-12 09:14:44'),
(7,'Quest 3','<p>Bahasa pemrograman prosedural yang populer dan sering digunakan adalah?</p>','short_answer',10,10,'Easy','<p>Bahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.</p>',1,1,NULL,'2025-03-14 08:24:59','2025-03-14 08:24:59'),
(8,'Quest 7','<p>Manakah ekspresi berikut yang akan menghasilkan nilai False?&nbsp;</p>','multiple_choice',10,10,'Easy','<p>a. <strong>True &amp;&amp; True</strong> → <strong>True</strong> (Karena operator &amp;&amp; atau <strong>AND</strong> hanya menghasilkan True jika kedua operand bernilai True)<br> b. <strong>not False</strong> → <strong>True</strong> (Operator not membalik nilai False menjadi True)<br> c. <strong>True || False</strong> → <strong>True</strong> (Operator || atau <strong>OR</strong> menghasilkan True jika salah satu operand bernilai True)<br> d. <strong>(3 &gt; 2) &amp;&amp; (5 &lt; 10)</strong> → <strong>True</strong> (Karena 3 &gt; 2 bernilai True dan 5 &lt; 10 juga True, maka hasilnya True)<br> e. <strong>False &amp;&amp; True</strong> → <strong>False</strong> (Karena operator <strong>AND</strong> hanya menghasilkan True jika kedua operand True, sedangkan di sini ada False)</p><p><strong>Kesimpulan:</strong> Satu-satunya ekspresi yang menghasilkan False adalah <strong>opsi e</strong>.</p>',1,1,NULL,'2025-03-14 16:27:41','2025-03-14 16:27:41'),
(9,'Quest 8','<p>Jika x bernilai 7 dan y bernilai 3, maka hasil dari ekspresi (xdivy) + (xmody) adalah..</p>','short_answer',20,20,'Easy','<p>Diketahui:</p><ul><li>x=7x = 7x=7</li><li>y=3y = 3y=3</li><li>Ekspresi: (x div y)+(x mod y)(x \\text{ div } y) + (x \\text{ mod } y)(x div y)+(x mod y)</li></ul><h3>Perhitungan:</h3><p><strong>Operasi div</strong> (pembagian bilangan bulat tanpa sisa)</p><p>7÷3=27</p><p>Jadi, x div y=2</p><p><strong>Operasi mod</strong> (sisa hasil bagi)</p><p>7 mod 3=17</p><p>Karena 7 dibagi 3 hasilnya 2 dengan sisa 1, maka x mod y=1.</p><p><strong>Penjumlahan hasilnya:</strong></p><p>(2)+(1)=3(2) + (1) = 3(2)+(1)=3</p><p>Jadi, hasil dari ekspresi tersebut adalah <strong>5.</strong></p>',1,1,NULL,'2025-03-14 16:35:50','2025-03-14 16:35:50');

/*Table structure for table `take_exercises` */

DROP TABLE IF EXISTS `take_exercises`;

CREATE TABLE `take_exercises` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exercise_id` bigint(20) unsigned NOT NULL,
  `topic_id` bigint(20) unsigned NOT NULL,
  `lesson_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `answers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`answers`)),
  `total_correct` int(11) NOT NULL,
  `total_question` int(11) NOT NULL,
  `score` double(8,2) NOT NULL,
  `reward_exp` int(11) NOT NULL,
  `reward_point` int(11) NOT NULL,
  `total_exp` int(11) NOT NULL,
  `total_point` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `take_exercises_exercise_id_foreign` (`exercise_id`),
  KEY `take_exercises_topic_id_foreign` (`topic_id`),
  KEY `take_exercises_lesson_id_foreign` (`lesson_id`),
  KEY `take_exercises_user_id_foreign` (`user_id`),
  CONSTRAINT `take_exercises_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE,
  CONSTRAINT `take_exercises_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `take_exercises_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `take_exercises_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `take_exercises` */

insert  into `take_exercises`(`id`,`exercise_id`,`topic_id`,`lesson_id`,`user_id`,`answers`,`total_correct`,`total_question`,`score`,`reward_exp`,`reward_point`,`total_exp`,`total_point`,`deleted_at`,`created_at`,`updated_at`) values 
(1,1,1,2,1,'{}',0,2,0.00,0,0,0,0,NULL,'2025-03-13 18:06:28','2025-03-13 18:06:28'),
(2,2,1,3,1,'{\"0\":{\"correct_answer\":\"false\",\"correct_answer_index\":1,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma fungsional sering kali membutuhkan lebih banyak pemrosesan tambahan, karena tidak mengubah data langsung dan sering menggunakan rekursi, yang bisa memperlambat eksekusi dibandingkan dengan pendekatan prosedural yang lebih dekat dengan cara kerja mesin.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":3,\"user_answer\":\"True\",\"user_answer_index\":0},\"1\":{\"correct_answer_index\":\"Haskell\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eHaskell adalah salah satu bahasa pemrograman yang sepenuhnya berbasis paradigma fungsional, di mana setiap operasi dilakukan melalui fungsi matematika tanpa mengubah data secara langsung.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":4,\"user_answer_index\":\"t\"}}',0,2,0.00,20,15,0,0,NULL,'2025-03-14 09:38:01','2025-03-14 09:38:01'),
(3,3,1,4,1,'{\"1\":{\"correct_answer_index\":\"Prolog\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eProlog adalah bahasa pemrograman berbasis logika yang memungkinkan programmer mendeklarasikan aturan dan fakta, lalu sistem akan menyimpulkan hasilnya berdasarkan logika yang diberikan.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":20,\"user_answer_index\":\"tes\"}}',0,2,0.00,10,15,0,0,NULL,'2025-03-14 09:38:13','2025-03-14 09:38:13'),
(4,4,1,5,1,'{\"0\":{\"correct_answer_id\":16,\"correct_answer_index\":1,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma OOP mengorganisir kode ke dalam objek yang memiliki atribut (data) dan metode (fungsi yang dapat dijalankan oleh objek). Hal ini membuat kode lebih terstruktur dan modular.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":6,\"user_answer_id\":15,\"user_answer_index\":0},\"1\":{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eOOP sangat cocok untuk proyek besar karena mendukung konsep modularitas, enkapsulasi, dan pewarisan, yang memudahkan pengelolaan dan pemeliharaan kode dalam skala besar seperti aplikasi web dan game.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":7,\"user_answer\":\"False\",\"user_answer_index\":1}}',0,2,0.00,20,15,0,0,NULL,'2025-03-14 09:38:26','2025-03-14 09:38:26'),
(5,5,1,6,1,'{\"0\":{\"correct_answer_id\":21,\"correct_answer_index\":1,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma pemrograman konkuren memungkinkan eksekusi beberapa tugas dalam waktu yang bersamaan. Ini sering digunakan dalam sistem operasi, server web, dan aplikasi yang menangani banyak permintaan secara simultan.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":8,\"user_answer_id\":20,\"user_answer_index\":0},\"2\":{\"correct_answer\":\"false\",\"correct_answer_index\":1,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma konkuren lebih sulit diimplementasikan dibandingkan paradigma prosedural karena melibatkan komunikasi antar proses dan perlu menangani masalah seperti deadlock, race condition, dan sinkronisasi data.\\u003c/p\\u003e\",\"point_gained\":5,\"question_id\":10,\"user_answer\":\"False\",\"user_answer_index\":1}}',1,3,0.33,20,15,10,5,NULL,'2025-03-14 10:37:35','2025-03-14 10:37:35'),
(6,6,1,7,1,'{\"0\":{\"correct_answer_id\":30,\"correct_answer_index\":1,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":11,\"user_answer_id\":29,\"user_answer_index\":0},\"2\":{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":13,\"user_answer\":\"False\",\"user_answer_index\":1},\"4\":{\"correct_answer_id\":41,\"correct_answer_index\":2,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003edeklaratif\\u003c/strong\\u003e seperti Prolog sering digunakan dalam \\u003cstrong\\u003eAI dan database\\u003c/strong\\u003e, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":15,\"user_answer_id\":40,\"user_answer_index\":1},\"7\":{\"correct_answer\":\"false\",\"correct_answer_index\":1,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003ePascal awalnya merupakan bahasa \\u003cstrong\\u003eprosedural\\u003c/strong\\u003e, tetapi versi yang lebih baru (seperti Object Pascal) juga mendukung paradigma \\u003cstrong\\u003eberorientasi objek\\u003c/strong\\u003e.\\u003c/p\\u003e\",\"point_gained\":5,\"question_id\":18,\"user_answer\":\"False\",\"user_answer_index\":1}}',1,9,0.11,40,35,10,5,NULL,'2025-03-14 10:38:02','2025-03-14 10:38:02'),
(7,7,2,8,1,'{\"0\":{\"correct_answer\":\"false\",\"correct_answer_index\":1,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma fungsional menekankan \\u003cstrong\\u003efungsi murni (pure functions)\\u003c/strong\\u003e, yang berarti setiap fungsi hanya bergantung pada input yang diberikan dan tidak boleh mengubah variabel global atau memiliki efek samping. Hal ini membuat kode lebih mudah dipahami dan diuji.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":21,\"user_answer\":\"True\",\"user_answer_index\":0},\"1\":{\"correct_answer_id\":59,\"correct_answer_index\":3,\"exp_gained\":0,\"feedback\":\"\\u003cul\\u003e\\u003cli\\u003e\\u003cstrong\\u003eA Salah\\u003c/strong\\u003e → Justru paradigma fungsional yang lebih berfokus pada \\\"apa yang ingin dilakukan\\\", sedangkan imperatif lebih menekankan \\\"bagaimana cara melakukannya\\\".\\u003c/li\\u003e\\u003cli\\u003e\\u003cstrong\\u003eB Salah\\u003c/strong\\u003e → Paradigma fungsional tidak menggunakan variabel yang dapat diubah (mutable variables), karena tidak ada efek samping.\\u003c/li\\u003e\\u003cli\\u003e\\u003cstrong\\u003eC Salah\\u003c/strong\\u003e → Paradigma imperatif menggunakan perintah langkah demi langkah, bukan berbasis ekspresi.\\u003c/li\\u003e\\u003cli\\u003e\\u003cstrong\\u003eD Benar\\u003c/strong\\u003e → Pemrograman fungsional mengutamakan ekspresi dan rekursi, bukan perubahan state seperti dalam pemrograman imperatif.\\u003c/li\\u003e\\u003c/ul\\u003e\\u003cp\\u003e\\u003cbr\\u003e\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":22,\"user_answer_id\":56,\"user_answer_index\":0}}',0,2,0.00,20,15,0,0,NULL,'2025-03-14 16:50:02','2025-03-14 16:50:02');

/*Table structure for table `take_lessons` */

DROP TABLE IF EXISTS `take_lessons`;

CREATE TABLE `take_lessons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `topic_id` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `take_lessons` */

insert  into `take_lessons`(`id`,`lesson_id`,`user_id`,`topic_id`,`deleted_at`,`created_at`,`updated_at`) values 
(1,1,1,1,NULL,'2025-03-13 10:38:38','2025-03-13 10:38:38'),
(2,2,1,1,NULL,'2025-03-13 10:38:44','2025-03-13 10:38:44'),
(3,3,1,1,NULL,'2025-03-13 13:28:39','2025-03-13 13:28:39'),
(4,4,1,1,NULL,'2025-03-13 13:36:37','2025-03-13 13:36:37'),
(5,5,1,1,NULL,'2025-03-13 15:54:12','2025-03-13 15:54:12'),
(6,6,1,1,NULL,'2025-03-13 15:54:42','2025-03-13 15:54:42'),
(7,7,1,1,NULL,'2025-03-13 15:54:58','2025-03-13 15:54:58'),
(8,8,1,2,NULL,'2025-03-14 16:49:44','2025-03-14 16:49:44');

/*Table structure for table `take_quests` */

DROP TABLE IF EXISTS `take_quests`;

CREATE TABLE `take_quests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quest_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `score` double(8,2) NOT NULL,
  `reward_exp` int(11) NOT NULL,
  `reward_point` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `take_quests_user_id_foreign` (`user_id`),
  KEY `take_quests_quest_id_foreign` (`quest_id`),
  CONSTRAINT `take_quests_quest_id_foreign` FOREIGN KEY (`quest_id`) REFERENCES `quests` (`id`),
  CONSTRAINT `take_quests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `take_quests` */

insert  into `take_quests`(`id`,`quest_id`,`user_id`,`answer`,`is_correct`,`score`,`reward_exp`,`reward_point`,`deleted_at`,`created_at`,`updated_at`) values 
(1,1,1,'{}',0,0.00,0,0,NULL,'2025-03-13 17:39:40','2025-03-13 17:39:40'),
(2,1,1,'{}',0,0.00,0,0,NULL,'2025-03-13 17:45:19','2025-03-13 17:45:19'),
(3,1,1,'{}',0,0.00,0,0,NULL,'2025-03-13 17:46:46','2025-03-13 17:46:46'),
(4,1,1,'{}',0,0.00,0,0,NULL,'2025-03-13 17:48:32','2025-03-13 17:48:32'),
(5,1,1,'{}',0,0.00,0,0,NULL,'2025-03-13 17:50:43','2025-03-13 17:50:43'),
(6,1,1,'{}',0,0.00,0,0,NULL,'2025-03-13 17:52:06','2025-03-13 17:52:06'),
(7,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":1,\"user_answer_id\":1,\"user_answer_index\":1}',1,100.00,20,20,NULL,'2025-03-13 17:53:29','2025-03-13 17:53:29'),
(8,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":1,\"user_answer_id\":1,\"user_answer_index\":0}',1,100.00,20,20,NULL,'2025-03-13 21:10:44','2025-03-13 21:10:44'),
(9,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":1,\"user_answer_id\":1,\"user_answer_index\":9}',1,100.00,20,20,NULL,'2025-03-13 21:11:09','2025-03-13 21:11:09'),
(10,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":1,\"user_answer_id\":2,\"user_answer_index\":0}',0,0.00,10,10,NULL,'2025-03-13 21:11:29','2025-03-13 21:11:29'),
(11,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":1,\"user_answer_id\":2,\"user_answer_index\":0}',0,0.00,0,0,NULL,'2025-03-13 21:14:44','2025-03-13 21:14:44'),
(12,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":1,\"user_answer_id\":1,\"user_answer_index\":0}',1,100.00,10,10,NULL,'2025-03-13 21:14:53','2025-03-13 21:14:53'),
(13,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":1,\"user_answer_id\":1,\"user_answer_index\":0}',1,100.00,10,10,NULL,'2025-03-13 21:54:46','2025-03-13 21:54:46'),
(14,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":1,\"user_answer_id\":1,\"user_answer_index\":0}',1,100.00,10,10,NULL,'2025-03-13 22:58:44','2025-03-13 22:58:44'),
(15,2,1,'{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":5,\"question_id\":2,\"user_answer\":\"True\",\"user_answer_index\":0}',1,100.00,10,5,NULL,'2025-03-14 01:24:19','2025-03-14 01:24:19'),
(16,7,1,'{\"correct_answer_index\":\"C\",\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":7,\"user_answer_index\":\"C\"}',1,100.00,10,10,NULL,'2025-03-14 08:43:53','2025-03-14 08:43:53'),
(17,2,1,'{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":2,\"user_answer\":\"False\",\"user_answer_index\":1}',0,0.00,0,0,NULL,'2025-03-14 08:47:26','2025-03-14 08:47:26'),
(18,7,1,'{\"correct_answer_index\":\"C\",\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":7,\"user_answer_index\":\"C\"}',1,100.00,10,10,NULL,'2025-03-14 09:18:41','2025-03-14 09:18:41'),
(19,7,1,'{\"correct_answer_index\":\"C\",\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":7,\"user_answer_index\":\"C\"}',1,100.00,10,10,NULL,'2025-03-14 09:20:29','2025-03-14 09:20:29'),
(20,4,1,'{\"correct_answer_id\":0,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003edeklaratif\\u003c/strong\\u003e seperti Prolog sering digunakan dalam \\u003cstrong\\u003eAI dan database\\u003c/strong\\u003e, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":4,\"user_answer_id\":11,\"user_answer_index\":1}',0,0.00,0,0,NULL,'2025-03-14 09:24:54','2025-03-14 09:24:54'),
(21,4,1,'{\"correct_answer_id\":0,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003edeklaratif\\u003c/strong\\u003e seperti Prolog sering digunakan dalam \\u003cstrong\\u003eAI dan database\\u003c/strong\\u003e, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":4,\"user_answer_id\":13,\"user_answer_index\":3}',0,0.00,0,0,NULL,'2025-03-14 09:26:51','2025-03-14 09:26:51'),
(22,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":1,\"user_answer_id\":3,\"user_answer_index\":2}',0,0.00,0,0,NULL,'2025-03-14 09:41:00','2025-03-14 09:41:00'),
(23,4,1,'{\"correct_answer_id\":0,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003edeklaratif\\u003c/strong\\u003e seperti Prolog sering digunakan dalam \\u003cstrong\\u003eAI dan database\\u003c/strong\\u003e, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":4,\"user_answer_id\":13,\"user_answer_index\":3}',0,0.00,0,0,NULL,'2025-03-14 09:47:25','2025-03-14 09:47:25'),
(24,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":1,\"user_answer_id\":3,\"user_answer_index\":2}',0,0.00,0,0,NULL,'2025-03-14 09:55:33','2025-03-14 09:55:33'),
(25,4,1,'{\"correct_answer_id\":0,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003edeklaratif\\u003c/strong\\u003e seperti Prolog sering digunakan dalam \\u003cstrong\\u003eAI dan database\\u003c/strong\\u003e, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":4,\"user_answer_id\":12,\"user_answer_index\":2}',0,0.00,0,0,NULL,'2025-03-14 10:16:52','2025-03-14 10:16:52'),
(26,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":1,\"user_answer_id\":1,\"user_answer_index\":0}',1,100.00,10,10,NULL,'2025-03-14 10:20:23','2025-03-14 10:20:23'),
(27,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":1,\"user_answer_id\":1,\"user_answer_index\":0}',1,100.00,10,10,NULL,'2025-03-14 10:47:45','2025-03-14 10:47:45'),
(28,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":1,\"user_answer_id\":4,\"user_answer_index\":3}',0,0.00,0,0,NULL,'2025-03-14 10:50:11','2025-03-14 10:50:11'),
(29,2,1,'{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":5,\"question_id\":2,\"user_answer\":\"True\",\"user_answer_index\":0}',1,100.00,10,5,NULL,'2025-03-14 10:51:47','2025-03-14 10:51:47'),
(30,7,1,'{\"correct_answer_index\":\"C\",\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":7,\"user_answer_index\":\"C\"}',1,100.00,10,10,NULL,'2025-03-14 10:54:08','2025-03-14 10:54:08'),
(31,2,1,'{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":2,\"user_answer\":\"False\",\"user_answer_index\":1}',0,0.00,0,0,NULL,'2025-03-14 10:56:27','2025-03-14 10:56:27'),
(32,7,1,'{\"correct_answer_index\":\"C\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":7,\"user_answer_index\":\"uu\"}',0,0.00,0,0,NULL,'2025-03-14 10:56:48','2025-03-14 10:56:48'),
(33,7,1,'{\"correct_answer_index\":\"C\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":7,\"user_answer_index\":\"A\"}',0,0.00,0,0,NULL,'2025-03-14 11:13:17','2025-03-14 11:13:17'),
(34,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":1,\"user_answer_id\":1,\"user_answer_index\":0}',1,100.00,10,10,NULL,'2025-03-14 11:20:19','2025-03-14 11:20:19'),
(35,7,1,'{\"correct_answer\":\"C\",\"correct_answer_index\":\"C\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":7,\"user_answer\":null,\"user_answer_index\":\"daykg\"}',0,0.00,0,0,NULL,'2025-03-14 11:21:53','2025-03-14 11:21:53'),
(36,7,1,'{\"correct_answer\":\"C\",\"correct_answer_index\":\"C\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":7,\"user_answer\":\"Jawaban gue ini aja sih\",\"user_answer_index\":0}',0,0.00,0,0,NULL,'2025-03-14 11:31:13','2025-03-14 11:31:13'),
(37,7,1,'{\"correct_answer\":\"C\",\"correct_answer_index\":\"C\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":7,\"user_answer\":\"o\",\"user_answer_index\":0}',0,0.00,0,0,NULL,'2025-03-14 11:37:06','2025-03-14 11:37:06'),
(38,7,1,'{\"correct_answer\":\"C\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":7,\"user_answer\":\"linkail\",\"user_answer_index\":0}',0,0.00,0,0,NULL,'2025-03-14 11:40:50','2025-03-14 11:40:50'),
(39,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":1,\"user_answer_id\":1,\"user_answer_index\":0}',1,100.00,10,10,NULL,'2025-03-14 11:43:46','2025-03-14 11:43:46'),
(40,7,1,'{\"correct_answer\":\"C\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":7,\"user_answer\":\"hhh\",\"user_answer_index\":0}',0,0.00,0,0,NULL,'2025-03-14 11:58:53','2025-03-14 11:58:53'),
(41,2,1,'{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":2,\"user_answer\":\"False\",\"user_answer_index\":1}',0,0.00,0,0,NULL,'2025-03-14 11:59:22','2025-03-14 11:59:22'),
(42,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":1,\"user_answer_id\":3,\"user_answer_index\":2}',0,0.00,0,0,NULL,'2025-03-14 11:59:48','2025-03-14 11:59:48'),
(43,4,1,'{\"correct_answer_id\":0,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003edeklaratif\\u003c/strong\\u003e seperti Prolog sering digunakan dalam \\u003cstrong\\u003eAI dan database\\u003c/strong\\u003e, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":4,\"user_answer_id\":13,\"user_answer_index\":3}',0,0.00,0,0,NULL,'2025-03-14 12:08:38','2025-03-14 12:08:38'),
(44,2,1,'{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":5,\"question_id\":2,\"user_answer\":\"True\",\"user_answer_index\":0}',1,100.00,10,5,NULL,'2025-03-14 12:58:38','2025-03-14 12:58:38'),
(45,7,1,'{\"correct_answer\":\"C\",\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":7,\"user_answer\":\"C\",\"user_answer_index\":0}',1,100.00,10,10,NULL,'2025-03-14 12:59:40','2025-03-14 12:59:40'),
(46,7,1,'{\"correct_answer\":\"C\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":7,\"user_answer\":\"ererhhhhju\",\"user_answer_index\":0}',0,0.00,0,0,NULL,'2025-03-14 13:25:33','2025-03-14 13:25:33'),
(47,7,1,'{\"correct_answer\":\"C\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":7,\"user_answer\":\"bahasa kalbu\",\"user_answer_index\":0}',0,0.00,0,0,NULL,'2025-03-14 13:58:49','2025-03-14 13:58:49'),
(48,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":1,\"user_answer_id\":1,\"user_answer_index\":0}',1,100.00,10,10,NULL,'2025-03-14 14:04:26','2025-03-14 14:04:26'),
(49,2,1,'{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":2,\"user_answer\":\"False\",\"user_answer_index\":1}',0,0.00,0,0,NULL,'2025-03-14 14:12:11','2025-03-14 14:12:11'),
(50,2,1,'{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":5,\"question_id\":2,\"user_answer\":\"True\",\"user_answer_index\":0}',1,100.00,10,5,NULL,'2025-03-14 14:12:28','2025-03-14 14:12:28'),
(51,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":1,\"user_answer_id\":3,\"user_answer_index\":2}',0,0.00,0,0,NULL,'2025-03-14 14:53:18','2025-03-14 14:53:18'),
(52,2,1,'{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":2,\"user_answer\":\"False\",\"user_answer_index\":1}',0,0.00,0,0,NULL,'2025-03-14 14:58:15','2025-03-14 14:58:15'),
(53,4,1,'{\"correct_answer_id\":0,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003edeklaratif\\u003c/strong\\u003e seperti Prolog sering digunakan dalam \\u003cstrong\\u003eAI dan database\\u003c/strong\\u003e, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":4,\"user_answer_id\":12,\"user_answer_index\":2}',0,0.00,0,0,NULL,'2025-03-14 14:59:00','2025-03-14 14:59:00'),
(54,4,1,'{\"correct_answer_id\":0,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003edeklaratif\\u003c/strong\\u003e seperti Prolog sering digunakan dalam \\u003cstrong\\u003eAI dan database\\u003c/strong\\u003e, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":4,\"user_answer_id\":11,\"user_answer_index\":1}',0,0.00,0,0,NULL,'2025-03-14 15:03:07','2025-03-14 15:03:07'),
(55,2,1,'{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":5,\"question_id\":2,\"user_answer\":\"True\",\"user_answer_index\":0}',1,100.00,10,5,NULL,'2025-03-14 15:40:30','2025-03-14 15:40:30'),
(56,2,1,'{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":5,\"question_id\":2,\"user_answer\":\"True\",\"user_answer_index\":0}',1,100.00,10,5,NULL,'2025-03-14 16:28:58','2025-03-14 16:28:58'),
(57,2,1,'{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":2,\"user_answer\":\"False\",\"user_answer_index\":1}',0,0.00,0,0,NULL,'2025-03-14 16:29:46','2025-03-14 16:29:46'),
(58,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":1,\"user_answer_id\":2,\"user_answer_index\":1}',0,0.00,0,0,NULL,'2025-03-14 16:30:02','2025-03-14 16:30:02'),
(59,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":1,\"user_answer_id\":2,\"user_answer_index\":1}',0,0.00,0,0,NULL,'2025-03-14 16:31:02','2025-03-14 16:31:02'),
(60,7,1,'{\"correct_answer\":\"C\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":7,\"user_answer\":\"Fortran\",\"user_answer_index\":0}',0,0.00,0,0,NULL,'2025-03-14 16:34:32','2025-03-14 16:34:32'),
(61,7,1,'{\"correct_answer\":\"C\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":7,\"user_answer\":\"Java\",\"user_answer_index\":0}',0,0.00,0,0,NULL,'2025-03-14 16:41:28','2025-03-14 16:41:28'),
(62,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":1,\"user_answer_id\":4,\"user_answer_index\":3}',0,0.00,0,0,NULL,'2025-03-14 16:42:54','2025-03-14 16:42:54'),
(63,7,1,'{\"correct_answer\":\"C\",\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eBahasa C adalah salah satu bahasa pemrograman prosedural yang paling terkenal dan masih digunakan hingga sekarang dalam berbagai aplikasi sistem.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":7,\"user_answer\":\"HTML\",\"user_answer_index\":0}',0,0.00,0,0,NULL,'2025-03-14 16:49:28','2025-03-14 16:49:28'),
(64,4,1,'{\"correct_answer_id\":0,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003edeklaratif\\u003c/strong\\u003e seperti Prolog sering digunakan dalam \\u003cstrong\\u003eAI dan database\\u003c/strong\\u003e, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":4,\"user_answer_id\":10,\"user_answer_index\":0}',0,0.00,0,0,NULL,'2025-03-14 17:01:48','2025-03-14 17:01:48'),
(65,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":1,\"user_answer_id\":3,\"user_answer_index\":2}',0,0.00,0,0,NULL,'2025-03-14 17:02:20','2025-03-14 17:02:20'),
(66,4,1,'{\"correct_answer_id\":0,\"correct_answer_index\":0,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003edeklaratif\\u003c/strong\\u003e seperti Prolog sering digunakan dalam \\u003cstrong\\u003eAI dan database\\u003c/strong\\u003e, karena programmer hanya perlu mendeklarasikan aturan dan sistem akan menyelesaikan masalah secara otomatis.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":4,\"user_answer_id\":12,\"user_answer_index\":2}',0,0.00,0,0,NULL,'2025-03-14 17:02:47','2025-03-14 17:02:47'),
(67,8,1,'{\"correct_answer_id\":18,\"correct_answer_index\":1,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003ea. \\u003cstrong\\u003eTrue \\u0026amp;\\u0026amp; True\\u003c/strong\\u003e → \\u003cstrong\\u003eTrue\\u003c/strong\\u003e (Karena operator \\u0026amp;\\u0026amp; atau \\u003cstrong\\u003eAND\\u003c/strong\\u003e hanya menghasilkan True jika kedua operand bernilai True)\\u003cbr\\u003e b. \\u003cstrong\\u003enot False\\u003c/strong\\u003e → \\u003cstrong\\u003eTrue\\u003c/strong\\u003e (Operator not membalik nilai False menjadi True)\\u003cbr\\u003e c. \\u003cstrong\\u003eTrue || False\\u003c/strong\\u003e → \\u003cstrong\\u003eTrue\\u003c/strong\\u003e (Operator || atau \\u003cstrong\\u003eOR\\u003c/strong\\u003e menghasilkan True jika salah satu operand bernilai True)\\u003cbr\\u003e d. \\u003cstrong\\u003e(3 \\u0026gt; 2) \\u0026amp;\\u0026amp; (5 \\u0026lt; 10)\\u003c/strong\\u003e → \\u003cstrong\\u003eTrue\\u003c/strong\\u003e (Karena 3 \\u0026gt; 2 bernilai True dan 5 \\u0026lt; 10 juga True, maka hasilnya True)\\u003cbr\\u003e e. \\u003cstrong\\u003eFalse \\u0026amp;\\u0026amp; True\\u003c/strong\\u003e → \\u003cstrong\\u003eFalse\\u003c/strong\\u003e (Karena operator \\u003cstrong\\u003eAND\\u003c/strong\\u003e hanya menghasilkan True jika kedua operand True, sedangkan di sini ada False)\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003eKesimpulan:\\u003c/strong\\u003e Satu-satunya ekspresi yang menghasilkan False adalah \\u003cstrong\\u003eopsi e\\u003c/strong\\u003e.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":8,\"user_answer_id\":18,\"user_answer_index\":1}',1,100.00,10,10,NULL,'2025-03-14 17:03:06','2025-03-14 17:03:06'),
(68,8,1,'{\"correct_answer_id\":18,\"correct_answer_index\":1,\"exp_gained\":0,\"feedback\":\"\\u003cp\\u003ea. \\u003cstrong\\u003eTrue \\u0026amp;\\u0026amp; True\\u003c/strong\\u003e → \\u003cstrong\\u003eTrue\\u003c/strong\\u003e (Karena operator \\u0026amp;\\u0026amp; atau \\u003cstrong\\u003eAND\\u003c/strong\\u003e hanya menghasilkan True jika kedua operand bernilai True)\\u003cbr\\u003e b. \\u003cstrong\\u003enot False\\u003c/strong\\u003e → \\u003cstrong\\u003eTrue\\u003c/strong\\u003e (Operator not membalik nilai False menjadi True)\\u003cbr\\u003e c. \\u003cstrong\\u003eTrue || False\\u003c/strong\\u003e → \\u003cstrong\\u003eTrue\\u003c/strong\\u003e (Operator || atau \\u003cstrong\\u003eOR\\u003c/strong\\u003e menghasilkan True jika salah satu operand bernilai True)\\u003cbr\\u003e d. \\u003cstrong\\u003e(3 \\u0026gt; 2) \\u0026amp;\\u0026amp; (5 \\u0026lt; 10)\\u003c/strong\\u003e → \\u003cstrong\\u003eTrue\\u003c/strong\\u003e (Karena 3 \\u0026gt; 2 bernilai True dan 5 \\u0026lt; 10 juga True, maka hasilnya True)\\u003cbr\\u003e e. \\u003cstrong\\u003eFalse \\u0026amp;\\u0026amp; True\\u003c/strong\\u003e → \\u003cstrong\\u003eFalse\\u003c/strong\\u003e (Karena operator \\u003cstrong\\u003eAND\\u003c/strong\\u003e hanya menghasilkan True jika kedua operand True, sedangkan di sini ada False)\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003eKesimpulan:\\u003c/strong\\u003e Satu-satunya ekspresi yang menghasilkan False adalah \\u003cstrong\\u003eopsi e\\u003c/strong\\u003e.\\u003c/p\\u003e\",\"point_gained\":0,\"question_id\":8,\"user_answer_id\":20,\"user_answer_index\":3}',0,0.00,0,0,NULL,'2025-03-14 17:05:12','2025-03-14 17:05:12'),
(69,1,1,'{\"correct_answer_id\":1,\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eParadigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.Paradigma \\u003cstrong\\u003efungsional\\u003c/strong\\u003e berfokus pada fungsi matematika dan menghindari perubahan langsung pada data, sehingga kode lebih bersih dan minim bug.\\u003c/p\\u003e\",\"point_gained\":10,\"question_id\":1,\"user_answer_id\":1,\"user_answer_index\":0}',1,100.00,10,10,NULL,'2025-03-14 17:05:27','2025-03-14 17:05:27'),
(70,2,1,'{\"correct_answer\":\"true\",\"correct_answer_index\":0,\"exp_gained\":10,\"feedback\":\"\\u003cp\\u003eSQL bekerja dengan cara mendeklarasikan hasil yang diinginkan (misalnya, menampilkan data dari tabel) tanpa perlu menjelaskan bagaimana cara sistem mengambil data tersebut.\\u003c/p\\u003e\",\"point_gained\":5,\"question_id\":2,\"user_answer\":\"True\",\"user_answer_index\":0}',1,100.00,10,5,NULL,'2025-03-14 17:08:34','2025-03-14 17:08:34');

/*Table structure for table `topics` */

DROP TABLE IF EXISTS `topics`;

CREATE TABLE `topics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topics_created_by_foreign` (`created_by`),
  KEY `topics_updated_by_foreign` (`updated_by`),
  CONSTRAINT `topics_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `topics_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `topics` */

insert  into `topics`(`id`,`name`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Paradigma Pemrograman',1,1,'2025-03-13 10:35:24','2025-03-13 10:35:24',NULL),
(2,'Notasi Fungsional',1,1,'2025-03-13 13:57:27','2025-03-13 13:57:27',NULL),
(3,'Ekspresi Dasar',1,1,'2025-03-13 16:58:55','2025-03-13 16:59:05',NULL),
(4,'Ekspresi Kondisional',1,1,'2025-03-14 03:44:47','2025-03-14 03:44:47',NULL),
(5,'Tipe Bentukan',1,1,'2025-03-14 07:10:39','2025-03-14 07:10:39',NULL),
(6,'Koleksi Objek',1,1,'2025-03-15 10:51:12','2025-03-15 10:51:12',NULL),
(7,'Tabel',1,1,'2025-03-15 13:56:52','2025-03-15 13:56:52',NULL),
(8,'Ekspresi Rekursif',1,1,'2025-03-15 15:43:33','2025-03-15 15:43:33',NULL),
(9,'testing',1,1,'2025-03-17 09:35:17','2025-03-17 20:25:56',NULL),
(11,'test',1,1,'2025-03-17 19:50:22','2025-03-17 19:50:22',NULL),
(12,'testt',1,1,'2025-03-17 19:51:39','2025-03-17 19:51:39',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nim` varchar(255) NOT NULL,
  `angkatan` int(11) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT '2025-03-13 09:27:04',
  `total_point` int(11) NOT NULL DEFAULT 0,
  `total_exp` int(11) NOT NULL DEFAULT 0,
  `level_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_created_by_foreign` (`created_by`),
  KEY `users_updated_by_foreign` (`updated_by`),
  KEY `users_level_id_foreign` (`level_id`),
  CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`nim`,`angkatan`,`email_verified_at`,`password`,`last_login`,`total_point`,`total_exp`,`level_id`,`created_by`,`updated_by`,`deleted_at`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Emely Angelica Lestari','emelyangelicalestari@gmail.com','11S21052',2021,NULL,'$2y$10$6zOM4MMIU1lX2Mo2R5YtTe56d9bQla.LOCPd9SLelU3JdO3Z5NUQ6','2025-03-13 09:27:04',50,140,1,1,1,NULL,NULL,'2025-03-13 09:44:00','2025-03-16 21:31:45'),
(2,'Enrico Hezkiel Sirait','enricohs30@gmail.com','11S21034',2021,NULL,'$2y$10$NRPP1Jut9tWAvo6B9S4ZfuvXfLPer/YJ1jNm4/aI6YelxD.6LkR6m','2025-03-13 09:27:04',0,0,1,1,1,NULL,NULL,'2025-03-13 09:48:17','2025-03-13 09:48:17'),
(3,'Boy Martahan Sitorus','sitorusboy0123@gmail.com','11S21025',2021,NULL,'$2y$10$6PmFkRfCO4HZh3.IopGSuuzU4m.yySUYeBbD9H/X5j7skK8tCGlya','2025-03-13 09:27:04',0,0,1,1,1,NULL,NULL,'2025-03-13 09:51:40','2025-03-13 09:51:40'),
(4,'David Vincent Gurning','ifs21001@students.del.ac.id','11S21001',2021,NULL,'$2y$10$YRtJCHmByWoeHxQdTm4be.5vX.vYlaBbd18SDl/4Om2ZwT2HSPpkK','2025-03-13 09:27:04',0,0,1,1,1,NULL,NULL,'2025-03-13 09:53:51','2025-03-13 09:53:51'),
(5,'Rifqi Haikal Chairiansyah','ifs21002@students.del.id','11S21002',2021,NULL,'$2y$10$uGAspYpp89wOneDf3mHFweuR1PYwZzxfAfJ5A62jZWbrw7hGZ71VG','2025-03-13 09:27:04',0,0,1,1,1,NULL,NULL,'2025-03-15 14:16:15','2025-03-15 14:16:15'),
(6,'Benhard Yudha','ifs21003@stedents.del.ac.id','11S21003',2021,NULL,'$2y$10$7OV9FYUV9wHaG.4OO3Plzeszu8TMNBzgJpVSCeWd4dwkYgHb5qeVq','2025-03-13 09:27:04',0,0,1,1,1,NULL,NULL,'2025-03-15 14:17:10','2025-03-15 14:17:10'),
(7,'Riris Iyut Roito Siregar','ifs21004@students.del.id','11S21004',2021,NULL,'$2y$10$f1nCAiESkpHHBMHnTFhPjuzy7Cou4G70lA1DAewyT7S8UET/6oNmG','2025-03-13 09:27:04',0,0,1,1,1,NULL,NULL,'2025-03-15 14:18:44','2025-03-15 14:18:44'),
(8,'Tesalonika Aprisda Sitopu','ifs21005@students.del.id','11S21005',2021,NULL,'$2y$10$A1SKQ0SwHCQ3r4eTfmXsueMPnzjHPRzMXU/brz.m3wI5vGRlGaTE2','2025-03-13 09:27:04',0,0,1,1,1,NULL,NULL,'2025-03-15 14:19:55','2025-03-15 14:19:55'),
(9,'Salwa Zahira Sofa Harahap','ifs21006@students.del.id','11S21006',2021,NULL,'$2y$10$NIs9qlq8tPqRU.J6K.a6R.T/yRCjCnXJZJdYAjh88rQ/ggUzdSp7q','2025-03-13 09:27:04',0,0,1,1,1,NULL,NULL,'2025-03-15 14:20:40','2025-03-15 14:20:40'),
(10,'Tiara Yuliandari','ifs21007@students.del.id','11S21007',2021,NULL,'$2y$10$qYJZXl8h2mVjV8qYu8sx6.P/5msGyPEs6rv6jE8z39LXvIBRMjHQK','2025-03-13 09:27:04',0,0,1,1,1,NULL,NULL,'2025-03-15 14:23:52','2025-03-15 14:23:52'),
(14,'demo','testinguse12r@gmail.com','11s2121',2020,NULL,'$2y$10$9JkvGzY5pik2GV8HRFyQrOoOfO77352S2guc4kHdS1UzU/kgYvzWe','2025-03-13 09:27:04',0,0,1,1,1,NULL,NULL,'2025-03-17 19:46:23','2025-03-17 19:46:23'),
(15,'Emely Angelica Lestari','ememe@gmail.com','11S21052',2021,NULL,'$2y$10$JRpAr25qcny//O09NcP0t.U09ZLOUF8Qlq67ds8ZxuXnbw/h9oqFS','2025-03-13 09:27:04',0,0,1,1,1,NULL,NULL,'2025-03-17 19:52:29','2025-03-17 19:52:29');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
