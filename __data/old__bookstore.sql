-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 06, 2020 at 03:30 PM
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
  `synopsis` mediumtext NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `kategori_id`, `title`, `harga`, `author`, `image_url`, `no_isbn`, `berat`, `synopsis`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Kambing Jantan', 150000, 'Raditya Dika', 'uploads/asset/img/kambing_jantan.jpg', 'AB3301', 150, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-07-23 16:12:03', '2020-08-06 12:25:10', '2020-08-02 02:00:42'),
(2, 1, 'Kambing Betina', 130000, 'Raditya Dika', 'uploads/asset/img/kambing_betina.jpg', 'AB3302', 150, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-07-24 14:01:15', '2020-08-06 12:25:03', NULL),
(3, 1, 'Cinta Brontosaurus', 120000, 'Raditya Dika', 'uploads/asset/images/2020-07-24T14:46:46.414Z-yoga-profil.jpeg', 'AA500', 120, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-07-24 14:46:46', '2020-08-06 12:25:28', NULL),
(4, 1, 'Merana Tanpa Akhir', 125000, 'Yoga Lahipa', 'uploads/asset/images/2020-07-25T03:47:37.222Z-yoga-profil.jpeg', 'AB3303', 100, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-07-25 03:47:37', '2020-08-06 12:24:48', NULL),
(5, 2, 'Pencari Cinta', 125000, 'Yoga Lahipa', 'uploads/asset/images/2020-07-25T03:59:51.516Z-yoga-profil.jpeg', 'AB3303', 100, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-07-25 03:59:51', '2020-08-06 12:24:42', '2020-08-02 11:22:58'),
(6, 6, 'Toko Sebelah Laku', 125000, 'Yoga Lahipa', 'uploads/asset/images/image_url-1596344963146.jpeg', 'AB3303', 90, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-08-02 05:09:23', '2020-08-06 12:24:30', NULL),
(7, 8, 'awdaw adaw', 3434343, 'awdawda', 'uploads/asset/images/image_url-1596346404268.jpeg', '3adaw', 334, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-08-02 05:33:24', '2020-08-06 12:25:24', '2020-08-02 05:49:03'),
(8, 9, 'Menjadi Seorang Developer Fullstack', 300000, 'Yoga Lahipa', 'uploads/asset/images/image_url-1596347298497.jpeg', 'AB385', 33, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-08-02 05:48:18', '2020-08-06 12:24:16', NULL),
(9, 9, 'Janda Semok', 300000, 'Yono', 'uploads/asset/images/image_url-1596366334205.png', 'AC2858', 22, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non aliquam enim. Donec dignissim interdum nisi, eget posuere est. In lectus neque, convallis id blandit quis, dictum in tellus. Quisque non diam dui. Vestibulum vitae velit quis turpis placerat auctor eget nec lacus.', '2020-08-02 11:05:34', '2020-08-06 12:24:08', NULL),
(10, 8, 'Coba', 333, 'Coba', 'uploads/asset/images/image_url-1596701514612.jpeg', '333', 333, '333', '2020-08-06 08:11:54', '2020-08-06 13:02:30', '2020-08-06 13:02:30');

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
(1, 6, 9, 1, '2020-08-06 07:12:33', '2020-08-06 07:12:33', NULL);

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
(3, 'Action', '2020-07-24 13:59:46', '2020-07-24 14:00:02', '2020-07-24 14:00:02'),
(4, 'Buku Import', '2020-07-25 05:59:31', '2020-07-26 13:03:07', NULL),
(5, 'Buku Terlaris', '2020-07-26 11:36:22', '2020-07-26 11:36:22', NULL),
(6, 'Komik', '2020-07-31 13:59:56', '2020-07-31 15:14:18', NULL),
(7, 'Cerpen', '2020-07-31 14:05:32', '2020-07-31 14:05:32', NULL),
(8, 'Komik', '2020-07-31 14:06:19', '2020-07-31 14:06:19', NULL),
(9, 'Komputer', '2020-07-31 14:10:31', '2020-08-02 13:22:27', NULL),
(10, 'Ini kategori', '2020-08-02 05:15:35', '2020-08-02 13:17:02', '2020-08-02 13:17:02'),
(11, 'Cobaaa', '2020-08-02 12:41:43', '2020-08-02 13:21:27', '2020-08-02 13:21:27');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` int(20) NOT NULL,
  `total_price` int(20) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `total_price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 3, 2, 390000, '2020-07-24 15:17:32', '2020-07-26 17:35:31', NULL);

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
(1, 3, 2, 'Kambing Betina', 1, 130000, 130000, '2020-07-24 15:17:32', '2020-07-26 17:35:13', NULL),
(2, 3, 1, 'Kambing Jantan', 2, 130000, 260000, '2020-07-24 15:17:32', '2020-07-26 17:35:20', NULL);

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
(7, 2, 'Supardi', 'supardi', '$2b$10$3sUVI5sNJ/.UULvhOBKPjOU5CUMdmIG63yP6cI0Mucu/j11bstff6', 'supardi@gmail.com', '2020-08-01 01:12:16', '2020-08-01 01:12:16', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
