-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 13, 2020 at 12:35 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `harga` int(15) NOT NULL,
  `author` varchar(150) NOT NULL,
  `image_url` varchar(150) NOT NULL,
  `no_isbn` varchar(50) NOT NULL,
  `berat` int(15) NOT NULL,
  `stok` int(15) NOT NULL DEFAULT 0,
  `synopsis` mediumtext NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `kategori_id`, `title`, `harga`, `author`, `image_url`, `no_isbn`, `berat`, `stok`, `synopsis`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Kambing Jantan', 150000, 'Raditya Dika', 'uploads/asset/images/Book-cover-page-2-CRC.png', 'AB3301', 150, 9, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-07-23 16:12:03', '2020-08-13 10:32:31', NULL),
(2, 1, 'Kambing Betina', 130000, 'Raditya Dika', 'uploads/asset/images/ikan-cabe.jpg', 'AB3302', 150, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-07-24 14:01:15', '2020-08-13 09:22:52', NULL),
(3, 1, 'Cinta Brontosaurus', 120000, 'Raditya Dika', 'uploads/asset/images/2020-07-24T14:46:46.414Z-yoga-profil.jpeg', 'AA500', 120, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-07-24 14:46:46', '2020-08-13 09:22:56', NULL),
(4, 1, 'Merana Tanpa Akhir', 125000, 'Yoga Lahipa', 'uploads/asset/images/2020-07-25T03:47:37.222Z-yoga-profil.jpeg', 'AB3303', 100, 8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-07-25 03:47:37', '2020-08-13 10:32:31', NULL),
(5, 2, 'Pencari Cinta', 125000, 'Yoga Lahipa', 'uploads/asset/images/2020-07-25T03:59:51.516Z-yoga-profil.jpeg', 'AB3303', 100, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-07-25 03:59:51', '2020-08-13 17:29:25', NULL),
(6, 4, 'Kambing Muda Berjalan', 210000, 'Yoga Lahipa', 'uploads/asset/images/image_url-1596520000986.png', 'AC330', 333, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-08-04 05:46:41', '2020-08-13 09:23:07', NULL),
(7, 5, 'Bukan Untuk Dibaca Oleh Pemula!', 175000, 'Mike Portnoy', 'uploads/asset/images/image_url-1596558953752.png', 'AD3213', 115, 7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-08-04 16:35:53', '2020-08-13 10:34:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `buku_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `buku_id`, `qty`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 3, 1, '2020-08-03 03:16:33', '2020-08-03 05:50:42', NULL),
(5, 3, 1, 1, '2020-08-03 06:35:30', '2020-08-03 18:35:17', NULL),
(37, 6, 7, 1, '2020-08-10 11:47:09', '2020-08-10 11:47:09', NULL),
(38, 6, 6, 1, '2020-08-10 11:47:13', '2020-08-10 11:47:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Buku Baru', '2020-07-23 15:16:42', '2020-07-26 12:26:34', NULL),
(2, 'Best Seller', '2020-07-23 15:17:37', '2020-07-26 12:38:44', NULL),
(3, 'Buku Import', '2020-07-24 13:59:46', '2020-08-11 02:17:22', NULL),
(4, 'Memasak', '2020-07-25 05:59:31', '2020-08-11 02:17:36', NULL),
(5, 'Komputer', '2020-07-26 11:36:22', '2020-08-11 02:18:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_id` varchar(150) NOT NULL,
  `total` int(20) NOT NULL,
  `total_price` int(20) NOT NULL,
  `proceed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `transaction_id`, `total`, `total_price`, `proceed`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 6, '_s8y0uqm92', 2, 275000, 0, '2020-08-10 03:25:03', '2020-08-10 03:25:03', NULL),
(18, 7, '_8b8fed88v', 2, 335000, 0, '2020-08-10 15:01:43', '2020-08-10 15:01:43', NULL),
(19, 7, '_c7xpvxozr', 1, 210000, 1, '2020-08-10 15:02:47', '2020-08-12 18:39:12', NULL),
(20, 7, '_ccefurtcl', 2, 420000, 0, '2020-08-10 15:12:02', '2020-08-10 15:12:02', NULL),
(21, 7, '_t2nzfcb41', 2, 300000, 0, '2020-08-10 15:13:04', '2020-08-10 15:13:04', NULL),
(22, 7, '_vj03tye03', 1, 210000, 0, '2020-08-10 15:13:36', '2020-08-10 15:13:36', NULL),
(23, 5, '_6z9mg3u0s', 2, 350000, 1, '2020-08-12 15:14:40', '2020-08-13 00:44:16', NULL),
(24, 7, '_fdtg5kfxh', 3, 425000, 0, '2020-08-13 10:30:10', '2020-08-13 10:30:10', NULL),
(25, 7, '_06sud0asm', 3, 400000, 0, '2020-08-13 10:32:31', '2020-08-13 10:32:31', NULL),
(26, 7, '_p6trnb43r', 3, 525000, 0, '2020-08-13 10:34:03', '2020-08-13 10:34:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `buku_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `quantity` int(20) NOT NULL,
  `price` int(20) NOT NULL,
  `total` int(20) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `order_id`, `buku_id`, `title`, `quantity`, `price`, `total`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, 17, 4, 'Merana Tanpa Akhir', 1, 125000, 125000, '2020-08-10 03:25:03', '2020-08-10 03:25:03', NULL),
(15, 17, 1, 'Kambing Jantan', 1, 150000, 150000, '2020-08-10 03:25:03', '2020-08-10 03:25:03', NULL),
(16, 18, 5, 'Pencari Cinta', 1, 125000, 125000, '2020-08-10 15:01:43', '2020-08-10 15:01:43', NULL),
(17, 18, 6, 'Kambing Muda Berjalan', 1, 210000, 210000, '2020-08-10 15:01:43', '2020-08-10 15:01:43', NULL),
(18, 19, 6, 'Kambing Muda Berjalan', 1, 210000, 210000, '2020-08-10 15:02:47', '2020-08-10 15:02:47', NULL),
(19, 20, 6, 'Kambing Muda Berjalan', 2, 210000, 420000, '2020-08-10 15:12:02', '2020-08-10 15:12:02', NULL),
(20, 21, 5, 'Pencari Cinta', 1, 125000, 125000, '2020-08-10 15:13:04', '2020-08-10 15:13:04', NULL),
(21, 21, 7, 'Bukan Untuk Dibaca Oleh Pemula!', 1, 175000, 175000, '2020-08-10 15:13:04', '2020-08-10 15:13:04', NULL),
(22, 22, 6, 'Kambing Muda Berjalan', 1, 210000, 210000, '2020-08-10 15:13:36', '2020-08-10 15:13:36', NULL),
(23, 23, 7, 'Bukan Untuk Dibaca Oleh Pemula!', 2, 175000, 350000, '2020-08-12 15:14:40', '2020-08-12 15:14:40', NULL),
(24, 24, 7, 'Bukan Untuk Dibaca Oleh Pemula!', 1, 175000, 175000, '2020-08-13 10:30:10', '2020-08-13 10:30:10', NULL),
(25, 24, 5, 'Pencari Cinta', 2, 125000, 250000, '2020-08-13 10:30:10', '2020-08-13 10:30:10', NULL),
(26, 25, 4, 'Merana Tanpa Akhir', 2, 125000, 250000, '2020-08-13 10:32:31', '2020-08-13 10:32:31', NULL),
(27, 25, 1, 'Kambing Jantan', 1, 150000, 150000, '2020-08-13 10:32:31', '2020-08-13 10:32:31', NULL),
(28, 26, 7, 'Bukan Untuk Dibaca Oleh Pemula!', 3, 175000, 525000, '2020-08-13 10:34:03', '2020-08-13 10:34:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', '2020-07-26 17:13:22', '2020-07-26 17:13:22', NULL),
(2, 'member', '2020-07-26 17:14:54', '2020-07-26 17:14:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(192) NOT NULL,
  `email` varchar(256) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `username`, `password`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 2, 'John Doe', 'johndoe', '$2b$10$E3PA.r8p6ACjcocGOEPgHuh844gze.gHpPE3Gi19qLbEsJuOlUViC', 'email@gmail.com', '2020-07-22 09:49:32', '2020-07-26 17:15:24', NULL),
(4, 2, 'John Roe', 'johnroe', '$2b$10$uIVnpovK36dXFKCjwV1XnOXvm3lzPK6u5jW0vFUZA1qebCZwj3azG', 'email@gmail.com', '2020-07-22 15:50:08', '2020-07-26 17:15:27', NULL),
(5, 1, 'Super Admin', 'adminkeren', '$2b$10$axQ/miMOyldlSXoxylBV0uMjbenMZ8Z/EzFLPnkL1rW5qFPIvVqi6', 'superadmin@email.com', '2020-07-25 05:37:56', '2020-07-26 17:15:30', NULL),
(6, 2, 'Mike Portnoy', 'portnoy', '$2b$10$cVQSvm2/rf3Hg.RgwAwjHepoht/iMiBPT0fUyROp.pEIfPKNLZTFm', 'portnoy@gmail.com', '2020-07-26 11:27:24', '2020-07-26 11:27:24', NULL),
(7, 2, 'yoga lahipa', 'lahipa', '$2b$10$bwW6MDPB0jiw6bO7Kx0wYOXkFYesPOc9etJY/UHMZeTxsMOMKqXlK', 'dwiyogalahipa@gmail.com', '2020-08-05 02:15:36', '2020-08-05 02:15:36', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kategori_id` (`kategori_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_buku_id` (`buku_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_buku_id` (`buku_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idx_role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `orders_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orders_detail_ibfk_2` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
