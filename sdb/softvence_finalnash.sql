-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 25, 2025 at 07:51 PM
-- Server version: 10.6.24-MariaDB
-- PHP Version: 8.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `softvence_finalnash`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_settings`
--

CREATE TABLE `admin_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `invoice_number` varchar(255) DEFAULT NULL,
  `last_order_number` int(11) DEFAULT NULL,
  `delivery_charge` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `hotline` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`id`, `title`, `email`, `logo`, `favicon`, `invoice_number`, `last_order_number`, `delivery_charge`, `copyright`, `address`, `hotline`, `created_at`, `updated_at`) VALUES
(1, 'My Admin Panel', 'admin@example.com', 'uploads/admin-logo.png', 'uploads/admin-favicon.ico', '5278', 5279, '5', '© 2025 My Admin Panel. All rights reserved.', '123 Admin Street, City, Country', '+880123456789', '2025-10-08 13:03:05', '2025-11-25 19:31:40');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banner_title` varchar(255) NOT NULL,
  `banner_subtitle` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 = active, 0 = inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `banner_title`, `banner_subtitle`, `url`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Buy you best product now', 'Elegant Rose Eau de Parfum – Romantic & Sophisticated', 'https://www.figma.com/design/jRViK8eQdJJA02sF6A3f77/laurensw2025-%7C%7C-Wix_Buddy-%7C%7C-FO52159940A05?node-id=17-3796&p=f&t=2bWYCnRBlJJFUDhc-0', '1', '2025-10-09 21:39:08', '2025-10-09 21:39:08');

-- --------------------------------------------------------

--
-- Table structure for table `banner_images`
--

CREATE TABLE `banner_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banner_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner_images`
--

INSERT INTO `banner_images` (`id`, `banner_id`, `image_path`, `created_at`, `updated_at`) VALUES
(19, 3, 'uploads/banner/450-68e82b7c37cbb-1760045948.jpg', '2025-10-09 21:39:08', '2025-10-09 21:39:08'),
(20, 3, 'uploads/banner/450-68e82b7c38f63-1760045948.jpg', '2025-10-09 21:39:08', '2025-10-09 21:39:08'),
(21, 3, 'uploads/banner/450-68e82b7c39e38-1760045948.jpg', '2025-10-09 21:39:08', '2025-10-09 21:39:08'),
(22, 3, 'uploads/banner/450-68e82b7c3ae65-1760045948.jpg', '2025-10-09 21:39:08', '2025-10-09 21:39:08'),
(23, 3, 'uploads/banner/450-68e82b7c3bf22-1760045948.jpg', '2025-10-09 21:39:08', '2025-10-09 21:39:08'),
(24, 3, 'uploads/banner/450-68e82b7c3da3d-1760045948.jpg', '2025-10-09 21:39:08', '2025-10-09 21:39:08');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `blog_type` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 = active, 0 = inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `blog_type`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, '5 Timeless Perfumes That Make a Lasting Impression', '5-timeless-perfumes-that-make-a-lasting-impression', 'featured', 'There’s something magical about a good perfume — it can lift your mood, spark memories, and even define your personality. Whether you’re heading out on a romantic date, a formal event, or just want to smell amazing every day, the right fragrance can make all the difference.<br data-start=\"558\" data-end=\"561\">\r\nHere are <strong data-start=\"570\" data-end=\"593\">5 timeless perfumes</strong> that never fail to turn heads.', 'uploads/banner/300-68e936bfed944-1760114367.jpg', '1', '2025-10-08 22:43:21', '2025-10-10 16:39:27'),
(2, 'Amber Oud Classic – Luxurious & Warm', 'amber-oud-classic-luxurious-warm', 'featured', 'There’s something magical about a good perfume — it can lift your mood, spark memories, and even define your personality. Whether you’re heading out on a romantic date, a formal event, or just want to smell amazing every day, the right fragrance can make all the difference.<br data-start=\"558\" data-end=\"561\">\r\nHere are <strong data-start=\"570\" data-end=\"593\">5 timeless perfumes</strong> that never fail to turn heads.', 'uploads/banner/300-68e936907ee3d-1760114320.jpg', '1', '2025-10-08 22:44:35', '2025-10-10 16:38:40'),
(3, 'Pure Blossom – Everyday Elegance', 'pure-blossom-everyday-elegance', 'featured', 'There’s something magical about a good perfume — it can lift your mood, spark memories, and even define your personality. Whether you’re heading out on a romantic date, a formal event, or just want to smell amazing every day, the right fragrance can make all the difference.<br data-start=\"558\" data-end=\"561\">\r\nHere are <strong data-start=\"570\" data-end=\"593\">5 timeless perfumes</strong> that never fail to turn heads.', 'uploads/banner/300-68e9366e64bfe-1760114286.jpg', '1', '2025-10-08 22:45:35', '2025-10-10 16:38:06');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('cIFBxiRKRQJbvRMe', 's:7:\"forever\";', 2079389646),
('d5gNFGkBpmaxMxkr', 's:7:\"forever\";', 2079380349),
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:48:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:14:\"dashboard view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:18:\"dynamic-pages view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:20:\"dynamic-pages create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:18:\"dynamic-pages edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:20:\"dynamic-pages delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:11:\"review view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:13:\"review create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:11:\"review edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:13:\"review delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:10:\"offer view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:12:\"offer create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:10:\"offer edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:12:\"offer delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:10:\"video view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:12:\"video create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:10:\"video edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:12:\"video delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:9:\"blog view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:11:\"blog create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:9:\"blog edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:11:\"blog delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:11:\"banner view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:13:\"banner status\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:13:\"banner create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:11:\"banner edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:13:\"banner delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:12:\"product view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:14:\"product create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:12:\"product edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:14:\"product delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:14:\"promocode view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:16:\"promocode create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:14:\"promocode edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:16:\"promocode delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:13:\"category view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:15:\"category create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:13:\"category edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:15:\"category delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:19:\"mail setting update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:22:\"profile setting update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:21:\"system setting update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:20:\"admin setting update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:10:\"order view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:19:\"order update status\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:9:\"user view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:15:\"role management\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:15:\"permission view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:21:\"newsletter management\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:11:\"Super Admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:9:\"Wirehouse\";s:1:\"c\";s:3:\"web\";}}}', 1764185354);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `p_type` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `p_type`, `product_id`, `created_at`, `updated_at`) VALUES
(148, 12, NULL, 7, '2025-11-25 00:13:58', '2025-11-25 00:13:58'),
(170, 1, 'offer', 1, '2025-11-25 19:46:20', '2025-11-25 19:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 = active, 0 = inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `category_image`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'skin care', NULL, 'skin-care', NULL, '1', '2025-10-08 13:08:20', '2025-10-08 13:08:20'),
(2, 'Makeup', NULL, 'makeup', NULL, '1', '2025-10-08 14:19:15', '2025-10-08 14:19:15'),
(3, 'Medicine', 'uploads/category/150-68e6d75190c14-1759958865.png', 'medicine', NULL, '1', '2025-10-08 21:27:45', '2025-10-08 21:27:45');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `blog_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `blog_id`, `name`, `email`, `comment`, `created_at`, `updated_at`) VALUES
(1, '10', '2', 'Mobarok', 'mali201@gmail.com', '123456789', '2025-11-22 17:50:33', '2025-11-22 17:50:33');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dynamic_pages`
--

CREATE TABLE `dynamic_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `feature_sections`
--

CREATE TABLE `feature_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feature_sections`
--

INSERT INTO `feature_sections` (`id`, `key`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'free_shipping', 'Free Shipping', 'Get free shipping on orders over 150', '2025-10-08 13:03:05', '2025-11-10 17:29:45'),
(2, 'support_24_7', 'Support 24/7', 'We are here to help you anytime', '2025-10-08 13:03:05', '2025-10-08 13:03:05');

-- --------------------------------------------------------

--
-- Table structure for table `get_in_touches`
--

CREATE TABLE `get_in_touches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image_galleries`
--

CREATE TABLE `image_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 = active, 0 = inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image_galleries`
--

INSERT INTO `image_galleries` (`id`, `product_id`, `image_path`, `status`, `created_at`, `updated_at`) VALUES
(4, 1, 'uploads/gallery/150-68e6c4f665da1-1759954166.png', '1', '2025-10-08 14:09:26', '2025-10-08 14:09:26'),
(5, 1, 'uploads/gallery/150-68e6c4f6674ca-1759954166.png', '1', '2025-10-08 14:09:26', '2025-10-08 14:09:26'),
(20, 2, 'uploads/gallery/150-68e6d8b9c04a8-1759959225.jpg', '1', '2025-10-08 21:33:45', '2025-10-08 21:33:45'),
(21, 2, 'uploads/gallery/150-68e6d8b9c1204-1759959225.jpg', '1', '2025-10-08 21:33:45', '2025-10-08 21:33:45'),
(22, 2, 'uploads/gallery/150-68e6d8b9c1c9e-1759959225.jpg', '1', '2025-10-08 21:33:45', '2025-10-08 21:33:45'),
(55, 13, 'uploads/gallery/150-68e827a2024c6-1760044962.png', '1', '2025-10-09 21:22:42', '2025-10-09 21:22:42'),
(56, 13, 'uploads/gallery/150-68e827a202d53-1760044962.png', '1', '2025-10-09 21:22:42', '2025-10-09 21:22:42'),
(57, 13, 'uploads/gallery/150-68e827a203ad5-1760044962.png', '1', '2025-10-09 21:22:42', '2025-10-09 21:22:42'),
(58, 13, 'uploads/gallery/150-68e827a204340-1760044962.png', '1', '2025-10-09 21:22:42', '2025-10-09 21:22:42'),
(59, 12, 'uploads/gallery/150-68e827bfb0340-1760044991.png', '1', '2025-10-09 21:23:11', '2025-10-09 21:23:11'),
(60, 12, 'uploads/gallery/150-68e827bfb0bd9-1760044991.png', '1', '2025-10-09 21:23:11', '2025-10-09 21:23:11'),
(61, 12, 'uploads/gallery/150-68e827bfb1256-1760044991.png', '1', '2025-10-09 21:23:11', '2025-10-09 21:23:11'),
(62, 11, 'uploads/gallery/150-68e827dbc7232-1760045019.png', '1', '2025-10-09 21:23:39', '2025-10-09 21:23:39'),
(63, 11, 'uploads/gallery/150-68e827dbc7b6e-1760045019.png', '1', '2025-10-09 21:23:39', '2025-10-09 21:23:39'),
(64, 11, 'uploads/gallery/150-68e827dbc82fa-1760045019.png', '1', '2025-10-09 21:23:39', '2025-10-09 21:23:39'),
(65, 11, 'uploads/gallery/150-68e827dbc8a32-1760045019.png', '1', '2025-10-09 21:23:39', '2025-10-09 21:23:39'),
(66, 10, 'uploads/gallery/150-68e8280110d11-1760045057.png', '1', '2025-10-09 21:24:17', '2025-10-09 21:24:17'),
(67, 10, 'uploads/gallery/150-68e8280111706-1760045057.png', '1', '2025-10-09 21:24:17', '2025-10-09 21:24:17'),
(68, 10, 'uploads/gallery/150-68e8280111ee9-1760045057.png', '1', '2025-10-09 21:24:17', '2025-10-09 21:24:17'),
(69, 9, 'uploads/gallery/150-68e8284fe2a44-1760045135.png', '1', '2025-10-09 21:25:35', '2025-10-09 21:25:35'),
(70, 9, 'uploads/gallery/150-68e8284fe32d0-1760045135.png', '1', '2025-10-09 21:25:35', '2025-10-09 21:25:35'),
(71, 9, 'uploads/gallery/150-68e8284fe39e2-1760045135.png', '1', '2025-10-09 21:25:35', '2025-10-09 21:25:35'),
(72, 8, 'uploads/gallery/150-68e82869042e0-1760045161.png', '1', '2025-10-09 21:26:01', '2025-10-09 21:26:01'),
(73, 8, 'uploads/gallery/150-68e8286904eb9-1760045161.png', '1', '2025-10-09 21:26:01', '2025-10-09 21:26:01'),
(74, 8, 'uploads/gallery/150-68e8286905780-1760045161.png', '1', '2025-10-09 21:26:01', '2025-10-09 21:26:01'),
(75, 8, 'uploads/gallery/150-68e82869064bc-1760045161.png', '1', '2025-10-09 21:26:01', '2025-10-09 21:26:01'),
(76, 7, 'uploads/gallery/150-68e82885d92ea-1760045189.png', '1', '2025-10-09 21:26:29', '2025-10-09 21:26:29'),
(77, 7, 'uploads/gallery/150-68e82885da9d4-1760045189.png', '1', '2025-10-09 21:26:29', '2025-10-09 21:26:29'),
(78, 7, 'uploads/gallery/150-68e82885db5f4-1760045189.png', '1', '2025-10-09 21:26:29', '2025-10-09 21:26:29'),
(79, 6, 'uploads/gallery/150-68e828a652271-1760045222.png', '1', '2025-10-09 21:27:02', '2025-10-09 21:27:02'),
(80, 6, 'uploads/gallery/150-68e828a6534c8-1760045222.png', '1', '2025-10-09 21:27:02', '2025-10-09 21:27:02'),
(81, 6, 'uploads/gallery/150-68e828a653f98-1760045222.png', '1', '2025-10-09 21:27:02', '2025-10-09 21:27:02'),
(82, 5, 'uploads/gallery/150-68e828c64d75a-1760045254.png', '1', '2025-10-09 21:27:34', '2025-10-09 21:27:34'),
(83, 5, 'uploads/gallery/150-68e828c64e31e-1760045254.png', '1', '2025-10-09 21:27:34', '2025-10-09 21:27:34'),
(84, 5, 'uploads/gallery/150-68e828c64ea36-1760045254.png', '1', '2025-10-09 21:27:34', '2025-10-09 21:27:34'),
(85, 5, 'uploads/gallery/150-68e828c64f276-1760045254.png', '1', '2025-10-09 21:27:34', '2025-10-09 21:27:34'),
(86, 4, 'uploads/gallery/150-68e828e22cc04-1760045282.png', '1', '2025-10-09 21:28:02', '2025-10-09 21:28:02'),
(87, 4, 'uploads/gallery/150-68e828e22e3d2-1760045282.png', '1', '2025-10-09 21:28:02', '2025-10-09 21:28:02'),
(88, 4, 'uploads/gallery/150-68e828e22ef22-1760045282.png', '1', '2025-10-09 21:28:02', '2025-10-09 21:28:02'),
(89, 3, 'uploads/gallery/150-68e828fb67d3b-1760045307.png', '1', '2025-10-09 21:28:27', '2025-10-09 21:28:27'),
(90, 3, 'uploads/gallery/150-68e828fb684f0-1760045307.png', '1', '2025-10-09 21:28:27', '2025-10-09 21:28:27'),
(91, 3, 'uploads/gallery/150-68e828fb68b5a-1760045307.png', '1', '2025-10-09 21:28:27', '2025-10-09 21:28:27'),
(92, 3, 'uploads/gallery/150-68e828fb69278-1760045307.png', '1', '2025-10-09 21:28:27', '2025-10-09 21:28:27'),
(93, 14, 'uploads/gallery/300-68e8292045cd3-1760045344.png', '1', '2025-10-09 21:29:04', '2025-10-09 21:29:04'),
(94, 14, 'uploads/gallery/300-68e8292046407-1760045344.png', '1', '2025-10-09 21:29:04', '2025-10-09 21:29:04'),
(95, 14, 'uploads/gallery/300-68e8292046836-1760045344.png', '1', '2025-10-09 21:29:04', '2025-10-09 21:29:04'),
(96, 14, 'uploads/gallery/300-68e8292046bd4-1760045344.png', '1', '2025-10-09 21:29:04', '2025-10-09 21:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `stock_status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 = in stock, 0 = out of stock',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `product_id`, `variation_id`, `quantity`, `stock_status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 97, '1', '2025-10-08 13:10:49', '2025-11-25 17:55:51'),
(2, 2, NULL, 2, '1', '2025-10-08 14:25:35', '2025-11-25 16:11:35'),
(3, 3, NULL, 793, '1', '2025-10-08 21:28:51', '2025-11-25 17:55:51'),
(4, 4, NULL, 492, '1', '2025-10-08 21:30:42', '2025-11-25 00:18:32'),
(5, 5, NULL, 212, '1', '2025-10-08 21:37:15', '2025-11-25 19:31:40'),
(6, 6, NULL, 727, '1', '2025-10-08 21:38:11', '2025-10-26 20:14:14'),
(7, 7, NULL, 713, '1', '2025-10-08 21:40:14', '2025-10-27 16:39:34'),
(8, 8, NULL, 397, '1', '2025-10-08 21:40:33', '2025-11-22 21:41:59'),
(9, 9, NULL, 198, '1', '2025-10-08 21:41:14', '2025-10-08 21:41:14'),
(10, 10, NULL, 208, '1', '2025-10-08 21:41:42', '2025-10-24 00:54:00'),
(11, 11, NULL, 147, '1', '2025-10-08 21:44:26', '2025-11-24 19:45:36'),
(12, 12, NULL, 678, '1', '2025-10-08 21:44:59', '2025-10-24 00:22:38'),
(13, 13, NULL, 67, '1', '2025-10-08 21:45:27', '2025-10-10 21:14:40'),
(14, 14, NULL, 62, '1', '2025-10-09 21:29:04', '2025-10-09 21:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_settings`
--

CREATE TABLE `invoice_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `invoice_logo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_settings`
--

INSERT INTO `invoice_settings` (`id`, `title`, `invoice_logo`, `created_at`, `updated_at`) VALUES
(1, 'ddd', 'uploads/allurdevine.png', '2025-11-25 17:08:00', '2025-11-25 17:08:00');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"eb4c2452-3b3d-4de6-9883-0423acadc4df\",\"displayName\":\"App\\\\Jobs\\\\NewsletterJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewsletterJob\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\NewsletterJob\\\":2:{s:14:\\\"\\u0000*\\u0000newsletters\\\";a:1:{i:0;s:27:\\\"mobarok.softvence@gmail.com\\\";}s:10:\\\"\\u0000*\\u0000offerId\\\";i:3;}\"}}', 0, NULL, 1761075855, 1761075855);

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
(4, '2025_06_14_192721_create_systems_table', 1),
(5, '2025_06_14_230628_create_admin_settings_table', 1),
(6, '2025_07_12_175142_create_categories_table', 1),
(7, '2025_07_13_202936_create_products_table', 1),
(8, '2025_07_13_202937_create_product_variations_table', 1),
(9, '2025_07_15_191830_create_inventories_table', 1),
(10, '2025_07_16_174035_create_banners_table', 1),
(11, '2025_07_16_193134_create_blogs_table', 1),
(12, '2025_07_16_210527_create_videos_table', 1),
(13, '2025_07_16_222103_create_offers_table', 1),
(14, '2025_07_17_171029_create_reviews_table', 1),
(15, '2025_07_17_202006_create_shipping_addresses_table', 1),
(16, '2025_07_17_202743_create_socials_table', 1),
(17, '2025_07_17_203317_create_dynamic_pages_table', 1),
(18, '2025_07_17_203501_create_contact_us_table', 1),
(19, '2025_07_17_203610_create_get_in_touches_table', 1),
(20, '2025_07_17_203754_create_newsletters_table', 1),
(21, '2025_07_20_203734_create_wishlists_table', 1),
(22, '2025_07_20_223515_create_image_galleries_table', 1),
(23, '2025_07_21_230654_create_colors_table', 1),
(24, '2025_07_21_230703_create_sizes_table', 1),
(25, '2025_07_21_231242_create_orders_table', 1),
(26, '2025_07_21_232354_create_order_item_details_table', 1),
(27, '2025_07_24_203536_create_order_billing_infos_table', 1),
(28, '2025_07_27_212334_create_user_reviews_table', 1),
(29, '2025_07_31_212804_create_comments_table', 1),
(30, '2025_09_07_215119_create_promo_codes_table', 1),
(31, '2025_09_08_211820_create_promo_code_users_table', 1),
(32, '2025_09_10_213740_create_permission_tables', 1),
(33, '2025_09_11_171605_create_offer_products_table', 1),
(34, '2025_09_15_183911_create_feature_sections_table', 1),
(35, '2025_09_16_224901_create_invoice_settings_table', 1),
(36, '2025_09_17_210717_create_sliders_table', 1),
(37, '2025_09_17_215642_create_sliders_images_table', 1),
(38, '2025_10_02_191055_create_carts_table', 1),
(39, '2025_10_07_213449_create_banner_images_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'mobarok.softvence@gmail.com', '2025-10-11 23:17:40', '2025-10-11 23:17:40');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `discount_type` enum('percent','fixed') NOT NULL DEFAULT 'percent',
  `discount_value` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) NOT NULL,
  `offer_start_date` date NOT NULL,
  `offer_end_date` date NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `offer_name`, `discount_type`, `discount_value`, `total_price`, `discount_price`, `offer_start_date`, `offer_end_date`, `image`, `description`, `qty`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Winifred Ryan', 'percent', 10.00, 2368.00, 2131.20, '2025-10-09', '2025-10-09', 'uploads/offers/150-68e9808856007-1760133256.jpg', NULL, 1, 1, '2025-10-08 22:03:33', '2025-11-24 23:43:30'),
(3, 'Iona Mcintyre', 'fixed', 100.00, 1824.00, 1724.00, '2025-10-22', '2026-10-14', 'uploads/offers/150-68f7e2d887a52-1761075928.jpg', NULL, 1, 1, '2025-10-21 19:44:15', '2025-11-24 21:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `offer_products`
--

CREATE TABLE `offer_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `offer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offer_products`
--

INSERT INTO `offer_products` (`id`, `offer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2025-11-24 23:43:30', '2025-11-24 23:43:30'),
(2, 1, 7, '2025-11-24 23:43:30', '2025-11-24 23:43:30'),
(15, 3, 3, '2025-11-24 21:37:24', '2025-11-24 21:37:24'),
(16, 3, 4, '2025-11-24 21:37:24', '2025-11-24 21:37:24'),
(17, 1, 3, '2025-11-24 23:43:30', '2025-11-24 23:43:30');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `payment_status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `status` enum('pending','received','completed','shipped','delivered') NOT NULL DEFAULT 'pending',
  `payment_method` varchar(255) DEFAULT NULL,
  `sub_total` float NOT NULL DEFAULT 0,
  `discount_amount` float NOT NULL DEFAULT 0,
  `total_amount` float NOT NULL DEFAULT 0,
  `shipping_cost` float NOT NULL DEFAULT 0,
  `coupon_code` varchar(255) DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `cancel_reason` varchar(255) DEFAULT NULL,
  `placed_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `promo_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_number`, `payment_status`, `status`, `payment_method`, `sub_total`, `discount_amount`, `total_amount`, `shipping_cost`, `coupon_code`, `is_paid`, `cancel_reason`, `placed_at`, `delivered_at`, `created_at`, `updated_at`, `promo_code`) VALUES
(66, 1, '5342', 'pending', 'pending', 'hesabe', 550, 0, 660, 100, NULL, 0, NULL, '2025-10-23 23:43:15', NULL, '2025-10-23 23:43:15', '2025-10-23 23:43:15', '2'),
(67, 1, '5343', 'pending', 'pending', 'hesabe', 550, 0, 660, 100, NULL, 0, NULL, '2025-10-23 23:44:48', NULL, '2025-10-23 23:44:48', '2025-10-23 23:44:48', '2'),
(68, 1, '5344', 'pending', 'pending', 'hesabe', 1265, 0, 1315, 50, NULL, 0, NULL, '2025-10-23 23:54:07', NULL, '2025-10-23 23:54:07', '2025-10-23 23:54:07', NULL),
(69, 1, '5345', 'pending', 'pending', 'hesabe', 715, 0, 765, 50, NULL, 0, NULL, '2025-10-23 23:59:57', NULL, '2025-10-23 23:59:57', '2025-10-23 23:59:57', NULL),
(70, 1, '5346', 'completed', 'completed', 'hesabe', 10, 0, 60, 50, NULL, 1, NULL, '2025-10-24 00:01:17', NULL, '2025-10-24 00:01:17', '2025-10-24 00:03:50', NULL),
(71, 4, '5347', 'pending', 'pending', 'cod', 1542, 0, 1592, 50, NULL, 0, NULL, '2025-10-24 00:11:08', NULL, '2025-10-24 00:11:08', '2025-10-24 00:11:08', NULL),
(72, 1, '5348', 'pending', 'pending', 'cod', 10, 0, 60, 50, NULL, 0, NULL, '2025-10-24 00:14:03', NULL, '2025-10-24 00:14:03', '2025-10-24 00:14:03', NULL),
(73, 1, '5349', 'completed', 'completed', 'hesabe', 10, 0, 60, 50, NULL, 1, NULL, '2025-10-24 00:14:37', NULL, '2025-10-24 00:14:37', '2025-10-24 00:15:20', NULL),
(74, 1, '5350', 'pending', 'pending', 'hesabe', 10, 0, 60, 50, NULL, 0, NULL, '2025-10-24 00:16:49', NULL, '2025-10-24 00:16:49', '2025-10-24 00:16:49', NULL),
(75, 1, '5351', 'completed', 'completed', 'hesabe', 10, 0, 60, 50, NULL, 1, NULL, '2025-10-24 00:17:59', NULL, '2025-10-24 00:17:59', '2025-10-24 00:18:45', NULL),
(76, 4, '5352', 'completed', 'completed', 'hesabe', 691, 0, 741, 50, NULL, 1, NULL, '2025-10-24 00:22:03', NULL, '2025-10-24 00:22:03', '2025-10-24 00:22:38', NULL),
(78, 4, '5353', 'pending', 'pending', 'cod', 356, 0, 406, 50, NULL, 0, NULL, '2025-10-24 00:25:38', NULL, '2025-10-24 00:25:38', '2025-10-24 00:25:38', NULL),
(79, 4, '5354', 'completed', 'completed', 'hesabe', 581, 0, 631, 50, NULL, 1, NULL, '2025-10-24 00:33:19', NULL, '2025-10-24 00:33:19', '2025-10-24 00:34:14', NULL),
(80, 4, '5355', 'pending', 'pending', 'hesabe', 460, 0, 510, 50, NULL, 0, NULL, '2025-10-24 00:42:35', NULL, '2025-10-24 00:42:35', '2025-10-24 00:42:35', NULL),
(81, 4, '5356', 'pending', 'pending', 'hesabe', 491, 0, 541, 50, NULL, 0, NULL, '2025-10-24 00:46:58', NULL, '2025-10-24 00:46:58', '2025-10-24 00:46:58', NULL),
(82, 4, '5357', 'pending', 'pending', 'hesabe', 594, 0, 644, 50, NULL, 0, NULL, '2025-10-24 00:49:50', NULL, '2025-10-24 00:49:50', '2025-10-24 00:49:50', NULL),
(83, 4, '5358', 'pending', 'pending', 'hesabe', 144, 0, 194, 50, NULL, 0, NULL, '2025-10-24 00:52:32', NULL, '2025-10-24 00:52:32', '2025-10-24 00:52:32', NULL),
(84, 4, '5359', 'completed', 'completed', 'hesabe', 144, 0, 194, 50, NULL, 1, NULL, '2025-10-24 00:53:27', NULL, '2025-10-24 00:53:27', '2025-10-24 00:54:00', NULL),
(85, 4, '5360', 'pending', 'pending', 'cod', 356, 0, 406, 50, NULL, 0, NULL, '2025-10-24 00:54:45', NULL, '2025-10-24 00:54:45', '2025-10-24 00:54:45', NULL),
(86, 2, '5361', 'completed', 'delivered', 'cod', 102, 0, 152, 50, NULL, 1, NULL, '2025-10-25 15:36:23', '2025-10-26 19:04:24', '2025-10-25 15:36:23', '2025-10-26 19:04:24', NULL),
(87, 2, '5362', 'pending', 'pending', 'cod', 1265, 0, 1315, 50, NULL, 0, NULL, '2025-10-26 20:11:38', NULL, '2025-10-26 20:11:38', '2025-10-26 20:11:38', NULL),
(88, 2, '5363', 'completed', 'completed', 'hesabe', 458, 0, 508, 50, NULL, 1, NULL, '2025-10-26 20:12:48', NULL, '2025-10-26 20:12:48', '2025-10-26 20:14:14', NULL),
(89, 2, '5364', 'pending', 'pending', 'cod', 31, 0, 81, 50, NULL, 0, NULL, '2025-10-27 16:39:34', NULL, '2025-10-27 16:39:34', '2025-10-27 16:39:34', NULL),
(90, 8, '5365', 'pending', 'pending', 'cod', 550, 0, 600, 50, NULL, 0, NULL, '2025-11-22 01:12:49', NULL, '2025-11-22 01:12:49', '2025-11-22 01:12:49', '100'),
(93, 1, '5366', 'pending', 'pending', 'cod', 550, 0, 660, 100, NULL, 0, NULL, '2025-11-22 17:24:33', NULL, '2025-11-22 17:24:33', '2025-11-22 17:24:33', '2'),
(94, 1, '5367', 'pending', 'pending', 'cod', 10, 0, 60, 50, NULL, 0, NULL, '2025-11-22 18:45:36', NULL, '2025-11-22 18:45:36', '2025-11-22 18:45:36', NULL),
(95, 1, '5368', 'pending', 'pending', 'cod', 640, 0, 690, 50, NULL, 0, NULL, '2025-11-22 21:41:59', NULL, '2025-11-22 21:41:59', '2025-11-22 21:41:59', NULL),
(97, 1, '5369', 'pending', 'pending', 'cod', 715, 0, 765, 50, NULL, 0, NULL, '2025-11-22 21:43:58', NULL, '2025-11-22 21:43:58', '2025-11-22 21:43:58', NULL),
(98, 12, '5370', 'pending', 'pending', 'cod', 102, 0, 152, 50, NULL, 0, NULL, '2025-11-24 17:11:12', NULL, '2025-11-24 17:11:12', '2025-11-24 17:11:12', NULL),
(99, 1, '5371', 'pending', 'pending', 'cod', 3575, 0, 3625, 50, NULL, 0, NULL, '2025-11-24 17:59:08', NULL, '2025-11-24 17:59:08', '2025-11-24 17:59:08', NULL),
(100, 2, '5372', 'pending', 'pending', 'cod', 1122, 0, 1172, 50, NULL, 0, NULL, '2025-11-24 19:45:36', NULL, '2025-11-24 19:45:36', '2025-11-24 19:45:36', '100'),
(101, 1, '5373', 'pending', 'pending', 'cod', 725, 0, 775, 50, NULL, 0, NULL, '2025-11-24 23:49:04', NULL, '2025-11-24 23:49:04', '2025-11-24 23:49:04', NULL),
(102, 1, '5374', 'pending', 'pending', 'cod', 725, 0, 775, 50, NULL, 0, NULL, '2025-11-24 23:49:35', NULL, '2025-11-24 23:49:35', '2025-11-24 23:49:35', '100'),
(103, 1, '5375', 'pending', 'pending', 'cod', 715, 0, 765, 50, NULL, 0, NULL, '2025-11-25 00:08:18', NULL, '2025-11-25 00:08:18', '2025-11-25 00:08:18', '100'),
(104, 1, '5376', 'pending', 'pending', 'cod', 1175, 0, 1215, 50, NULL, 0, NULL, '2025-11-25 00:18:32', NULL, '2025-11-25 00:18:32', '2025-11-25 00:18:32', '100'),
(105, 1, '5377', 'pending', 'pending', 'cod', 550, 0, 600, 50, NULL, 0, NULL, '2025-11-25 00:49:08', NULL, '2025-11-25 00:49:08', '2025-11-25 00:49:08', NULL),
(106, 1, '5378', 'pending', 'pending', 'cod', 550, 0, 595, 50, NULL, 0, NULL, '2025-11-25 00:55:08', NULL, '2025-11-25 00:55:08', '2025-11-25 00:55:08', 'Mash5'),
(107, 1, '5379', 'pending', 'pending', 'cod', 450, 0, 495, 50, NULL, 0, NULL, '2025-11-25 00:58:50', NULL, '2025-11-25 00:58:50', '2025-11-25 00:58:50', 'Mash5'),
(108, 1, '5380', 'pending', 'pending', 'cod', 550, 0, 595, 50, NULL, 0, NULL, '2025-11-25 16:11:35', NULL, '2025-11-25 16:11:35', '2025-11-25 16:11:35', 'Mash5'),
(109, 1, '5381', 'pending', 'pending', 'hesabe', 450, 0, 495, 50, NULL, 0, NULL, '2025-11-25 16:20:04', NULL, '2025-11-25 16:20:04', '2025-11-25 16:20:04', 'Mash5'),
(110, 1, '5382', 'pending', 'pending', 'hesabe', 450, 0, 495, 50, NULL, 0, NULL, '2025-11-25 16:20:20', NULL, '2025-11-25 16:20:20', '2025-11-25 16:20:20', 'Mash5'),
(111, 1, '5278', 'pending', 'pending', 'cod', 2846.2, 0, 2846.2, 5, NULL, 0, NULL, '2025-11-25 17:55:51', NULL, '2025-11-25 17:55:51', '2025-11-25 17:55:51', 'Mash5'),
(112, 1, '5279', 'pending', 'pending', 'cod', 281, 0, 281, 5, NULL, 0, NULL, '2025-11-25 19:31:40', NULL, '2025-11-25 19:31:40', '2025-11-25 19:31:40', 'Mash5');

-- --------------------------------------------------------

--
-- Table structure for table `order_billing_infos`
--

CREATE TABLE `order_billing_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `town` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_billing_infos`
--

INSERT INTO `order_billing_infos` (`id`, `order_id`, `name`, `last_name`, `email`, `phone`, `address`, `town`, `state`, `zipcode`, `created_at`, `updated_at`) VALUES
(66, 66, 'md kawsar ali', NULL, 'kawsarali@gmail.com', '1234564690', '123 Mainfff Street', 'Downtown', 'California', '90001', '2025-10-23 23:43:15', '2025-10-23 23:43:15'),
(67, 67, 'md kawsar ali', NULL, 'kawsarali@gmail.com', '1234564690', '123 Mainfff Street', 'Downtown', 'California', '90001', '2025-10-23 23:44:48', '2025-10-23 23:44:48'),
(68, 68, 'Charissa Farmer Holloway', NULL, 'nomino@mailinator.com', '96551234567', 'Deleniti nisi sequi', 'Et voluptatem repell', 'Suscipit sit sunt es', '88953', '2025-10-23 23:54:07', '2025-10-23 23:54:07'),
(69, 69, 'Charissa Farmer Holloway', NULL, 'nomino@mailinator.com', '96551234567', 'Deleniti nisi sequi', 'Et voluptatem repell', 'Suscipit sit sunt es', '88953', '2025-10-23 23:59:57', '2025-10-23 23:59:57'),
(70, 70, 'Charissa Farmer Holloway', NULL, 'nomino@mailinator.com', '96551234567', 'Deleniti nisi sequi', 'Et voluptatem repell', 'Suscipit sit sunt es', '88953', '2025-10-24 00:01:17', '2025-10-24 00:01:17'),
(71, 71, 'Alice Love Ellis', NULL, 'najijaq@mailinator.com', '96545852', 'Voluptatum dignissim', 'Aspernatur error vol', 'Excepturi qui qui ni', '23977', '2025-10-24 00:11:08', '2025-10-24 00:11:08'),
(72, 72, 'Charissa Farmer Holloway', NULL, 'nomino@mailinator.com', '96551234567', 'Deleniti nisi sequi', 'Et voluptatem repell', 'Suscipit sit sunt es', '88953', '2025-10-24 00:14:03', '2025-10-24 00:14:03'),
(73, 73, 'Charissa Farmer Holloway', NULL, 'nomino@mailinator.com', '96551234567', 'Deleniti nisi sequi', 'Et voluptatem repell', 'Suscipit sit sunt es', '88953', '2025-10-24 00:14:37', '2025-10-24 00:14:37'),
(74, 74, 'Charissa Farmer Holloway', NULL, 'nomino@mailinator.com', '96551234567', 'Deleniti nisi sequi', 'Et voluptatem repell', 'Suscipit sit sunt es', '88953', '2025-10-24 00:16:49', '2025-10-24 00:16:49'),
(75, 75, 'Charissa Farmer Holloway', NULL, 'nomino@mailinator.com', '96551234567', 'Deleniti nisi sequi', 'Et voluptatem repell', 'Suscipit sit sunt es', '88953', '2025-10-24 00:17:59', '2025-10-24 00:17:59'),
(76, 76, 'kawsar Doyle', NULL, 'cekapi@mailinator.com', '96545852', 'Dignissimos hic vel', 'Distinctio Dolorum', 'Quam molestiae sint', '43974', '2025-10-24 00:22:03', '2025-10-24 00:22:03'),
(78, 78, 'Maryam Coffey Hill', NULL, 'ginipib@mailinator.com', '96545852', 'Sint consectetur ve', 'Aspernatur eiusmod e', 'Aspernatur recusanda', '70709', '2025-10-24 00:25:38', '2025-10-24 00:25:38'),
(79, 79, 'Yuri Bush Calderon', NULL, 'bykydima@mailinator.com', '96545852', 'Distinctio Mollit q', 'Rem magni et eligend', 'Ex blanditiis est e', '78060', '2025-10-24 00:33:19', '2025-10-24 00:33:19'),
(80, 80, 'Robin Suarez Oliver', NULL, 'pekimenan@mailinator.com', '96545852', 'Rerum ratione sed ma', 'Explicabo Blanditii', 'Ex dolorum eligendi', '61650', '2025-10-24 00:42:35', '2025-10-24 00:42:35'),
(81, 81, 'Melodie Lopez Hammond', NULL, 'kavutugec@mailinator.com', '96545852', 'Alias qui numquam fu', 'Dolor possimus repe', 'Aute odio adipisicin', '38893', '2025-10-24 00:46:58', '2025-10-24 00:46:58'),
(82, 82, 'Kamal Joseph Oconnor', NULL, 'sehokiru@mailinator.com', '96545852', 'Id consequatur Sol', 'Sint dolor repudian', 'At corrupti digniss', '59326', '2025-10-24 00:49:50', '2025-10-24 00:49:50'),
(83, 83, 'Alvin Mccarty Fisher', NULL, 'dyxipesog@mailinator.com', '96545852', 'Expedita consequatur', 'Sit rerum qui ex ut', 'Voluptatem irure vol', '73354', '2025-10-24 00:52:32', '2025-10-24 00:52:32'),
(84, 84, 'Kiayada Odonnell Lambert', NULL, 'kihec@mailinator.com', '96545852', 'Eu nemo eveniet do', 'Pariatur Omnis aliq', 'Aute rerum sunt dolo', '87731', '2025-10-24 00:53:27', '2025-10-24 00:53:27'),
(85, 85, 'Len Vincent Tate', NULL, 'cynago@mailinator.com', '96545852', 'Ad corporis animi i', 'Consequat Similique', 'Id rerum accusantium', '66849', '2025-10-24 00:54:45', '2025-10-24 00:54:45'),
(86, 86, 'Charde Robinson Stokes', NULL, 'hudu@mailinator.com', '96534567', 'Qui consectetur duc', 'Itaque aliqua Recus', 'Laborum culpa eveni', '32454', '2025-10-25 15:36:23', '2025-10-25 15:36:23'),
(87, 87, 'md kawsar  ali', NULL, 'ali@gmail.com', '96525325', 'ss', 'dhaka', 'dfd', '6300', '2025-10-26 20:11:38', '2025-10-26 20:11:38'),
(88, 88, 'md kawsar  ali', NULL, 'ali@gmail.com', '96525325', 'ss', 'dhaka', 'dfd', '6300', '2025-10-26 20:12:48', '2025-10-26 20:12:48'),
(89, 89, 'Neil Carlson Fletcher', NULL, 'sumagu@mailinator.com', '96556569', 'Fugiat dolor modi id', 'Voluptatem dolorem s', 'Non porro culpa porr', '50085', '2025-10-27 16:39:34', '2025-10-27 16:39:34'),
(90, 90, 'Adrienne Shields Mccormick', NULL, 'wycogus@mailinator.com', '51234567', 'Dolores qui labore v', 'Ad laborum qui ipsa', 'Officiis unde blandi', '90078', '2025-11-22 01:12:49', '2025-11-22 01:12:49'),
(93, 93, 'md kawsar ali', NULL, 'kawsarali@gmail.com', '1234564690', '123 Mainfff Street', 'Downtown', 'California', '90001', '2025-11-22 17:24:33', '2025-11-22 17:24:33'),
(94, 94, 'Mobarok Ayan', NULL, 'mali201@gmail.com', '51234567', 'as', 'as', 'as', 'as', '2025-11-22 18:45:36', '2025-11-22 18:45:36'),
(95, 95, 'Mobarok Mobarok', NULL, 'mali201@gmail.com', '51234567', 'as', 'as', 'as', 'as', '2025-11-22 21:41:59', '2025-11-22 21:41:59'),
(97, 97, 'Mobarok Mobarok', NULL, 'mali201@gmail.com', '51234567', 'as', 'as', 'as', 'as', '2025-11-22 21:43:58', '2025-11-22 21:43:58'),
(98, 98, 'Mobarok Mobarok', NULL, 'mali201@gmail.com', '+96550011223', 'as', 'as', 'as', 'as', '2025-11-24 17:11:12', '2025-11-24 17:11:12'),
(99, 99, 'Mobarok Ayan', NULL, 'mali201@gmail.com', '+96550011223', 'as', 'as', 'as', 'as', '2025-11-24 17:59:08', '2025-11-24 17:59:08'),
(100, 100, 'Lisandra Gibbs Rowe', NULL, 'toce@mailinator.com', '96551234567', 'Dolore dolor nulla u', 'Sequi mollitia simil', 'Dolore elit duis mo', '38877', '2025-11-24 19:45:36', '2025-11-24 19:45:36'),
(101, 101, 'Colorado Maddox Martinez', NULL, 'tusujyj@mailinator.com', '+96551234567', 'Voluptates explicabo', 'Occaecat voluptates', 'Sit reprehenderit qu', '22463', '2025-11-24 23:49:04', '2025-11-24 23:49:04'),
(102, 102, 'Colorado Maddox Martinez', NULL, 'tusujyj@mailinator.com', '+96551234567', 'Voluptates explicabo', 'Occaecat voluptates', 'Sit reprehenderit qu', '22463', '2025-11-24 23:49:35', '2025-11-24 23:49:35'),
(103, 103, 'Colorado Maddox Martinez', NULL, 'tusujyj@mailinator.com', '+96551234567', 'Voluptates explicabo', 'Occaecat voluptates', 'Sit reprehenderit qu', '22463', '2025-11-25 00:08:18', '2025-11-25 00:08:18'),
(104, 104, 'Charissa Espinoza Osborn', NULL, 'kaju@mailinator.com', '+96551234567', 'Possimus modi expli', 'Ab nostrum iusto neq', 'Quo velit aspernatu', '25583', '2025-11-25 00:18:32', '2025-11-25 00:18:32'),
(105, 105, 'Colorado Maddox Martinez', NULL, 'tusujyj@mailinator.com', '51234567', 'Voluptates explicabo', 'Occaecat voluptates', 'Sit reprehenderit qu', '22463', '2025-11-25 00:49:08', '2025-11-25 00:49:08'),
(106, 106, 'Colorado Maddox Martinez', NULL, 'tusujyj@mailinator.com', '51234567', 'Voluptates explicabo', 'Occaecat voluptates', 'Sit reprehenderit qu', '22463', '2025-11-25 00:55:09', '2025-11-25 00:55:09'),
(107, 107, 'Colorado Maddox Martinez', NULL, 'tusujyj@mailinator.com', '51234567', 'Voluptates explicabo', 'Occaecat voluptates', 'Sit reprehenderit qu', '22463', '2025-11-25 00:58:50', '2025-11-25 00:58:50'),
(108, 108, 'Colorado Maddox Martinez', NULL, 'tusujyj@mailinator.com', '51234567', 'Voluptates explicabo', 'Occaecat voluptates', 'Sit reprehenderit qu', '22463', '2025-11-25 16:11:35', '2025-11-25 16:11:35'),
(109, 109, 'Colorado Maddox Martinez', NULL, 'tusujyj@mailinator.com', '51234567', 'Voluptates explicabo', 'Occaecat voluptates', 'Sit reprehenderit qu', '22463', '2025-11-25 16:20:04', '2025-11-25 16:20:04'),
(110, 110, 'Colorado Maddox Martinez', NULL, 'tusujyj@mailinator.com', '51234567', 'Voluptates explicabo', 'Occaecat voluptates', 'Sit reprehenderit qu', '22463', '2025-11-25 16:20:20', '2025-11-25 16:20:20'),
(111, 111, 'Mobarok Mobarok', NULL, 'mali201@gmail.com', '51234567', 'as', 'as', 'as', 'as', '2025-11-25 17:55:51', '2025-11-25 17:55:51'),
(112, 112, 'Colorado Maddox Martinez', NULL, 'tusujyj@mailinator.com', '51234567', 'Voluptates explicabo', 'Occaecat voluptates', 'Sit reprehenderit qu', '22463', '2025-11-25 19:31:40', '2025-11-25 19:31:40');

-- --------------------------------------------------------

--
-- Table structure for table `order_item_details`
--

CREATE TABLE `order_item_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `item_total` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_item_details`
--

INSERT INTO `order_item_details` (`id`, `order_id`, `product_id`, `color_id`, `size_id`, `quantity`, `price`, `item_total`, `created_at`, `updated_at`) VALUES
(88, 66, 2, NULL, NULL, 1, NULL, NULL, '2025-10-23 23:43:15', '2025-10-23 23:43:15'),
(89, 67, 2, NULL, NULL, 1, NULL, NULL, '2025-10-23 23:44:48', '2025-10-23 23:44:48'),
(90, 68, 3, NULL, NULL, 1, NULL, NULL, '2025-10-23 23:54:07', '2025-10-23 23:54:07'),
(91, 68, 2, NULL, NULL, 1, NULL, NULL, '2025-10-23 23:54:07', '2025-10-23 23:54:07'),
(92, 69, 3, NULL, NULL, 1, NULL, NULL, '2025-10-23 23:59:57', '2025-10-23 23:59:57'),
(93, 70, 4, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:01:17', '2025-10-24 00:01:17'),
(94, 71, 3, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:11:08', '2025-10-24 00:11:08'),
(95, 71, 4, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:11:08', '2025-10-24 00:11:08'),
(96, 71, 11, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:11:08', '2025-10-24 00:11:08'),
(97, 71, 3, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:11:08', '2025-10-24 00:11:08'),
(98, 72, 4, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:14:03', '2025-10-24 00:14:03'),
(99, 73, 4, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:14:37', '2025-10-24 00:14:37'),
(100, 74, 4, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:16:49', '2025-10-24 00:16:49'),
(101, 75, 4, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:17:59', '2025-10-24 00:17:59'),
(102, 76, 12, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:22:03', '2025-10-24 00:22:03'),
(103, 78, 6, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:25:38', '2025-10-24 00:25:38'),
(104, 79, 2, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:33:19', '2025-10-24 00:33:19'),
(105, 79, 7, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:33:19', '2025-10-24 00:33:19'),
(106, 80, 1, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:42:35', '2025-10-24 00:42:35'),
(107, 80, 4, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:42:35', '2025-10-24 00:42:35'),
(108, 81, 1, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:46:58', '2025-10-24 00:46:58'),
(109, 81, 4, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:46:58', '2025-10-24 00:46:58'),
(110, 81, 7, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:46:58', '2025-10-24 00:46:58'),
(111, 82, 1, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:49:50', '2025-10-24 00:49:50'),
(112, 82, 4, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:49:50', '2025-10-24 00:49:50'),
(113, 82, 7, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:49:50', '2025-10-24 00:49:50'),
(114, 82, 10, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:49:50', '2025-10-24 00:49:50'),
(115, 83, 4, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:52:32', '2025-10-24 00:52:32'),
(116, 83, 7, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:52:32', '2025-10-24 00:52:32'),
(117, 83, 10, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:52:32', '2025-10-24 00:52:32'),
(118, 84, 4, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:53:27', '2025-10-24 00:53:27'),
(119, 84, 7, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:53:27', '2025-10-24 00:53:27'),
(120, 84, 10, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:53:27', '2025-10-24 00:53:27'),
(121, 85, 6, NULL, NULL, 1, NULL, NULL, '2025-10-24 00:54:45', '2025-10-24 00:54:45'),
(122, 86, 11, NULL, NULL, 1, NULL, NULL, '2025-10-25 15:36:23', '2025-10-25 15:36:23'),
(123, 87, 3, NULL, NULL, 1, NULL, NULL, '2025-10-26 20:11:38', '2025-10-26 20:11:38'),
(124, 87, 2, NULL, NULL, 1, NULL, NULL, '2025-10-26 20:11:38', '2025-10-26 20:11:38'),
(125, 88, 11, NULL, NULL, 1, NULL, NULL, '2025-10-26 20:12:48', '2025-10-26 20:12:48'),
(126, 88, 6, NULL, NULL, 1, NULL, NULL, '2025-10-26 20:12:48', '2025-10-26 20:12:48'),
(127, 89, 7, NULL, NULL, 1, NULL, NULL, '2025-10-27 16:39:34', '2025-10-27 16:39:34'),
(128, 90, 2, NULL, NULL, 1, NULL, NULL, '2025-11-22 01:12:49', '2025-11-22 01:12:49'),
(129, 93, 2, NULL, NULL, 1, NULL, NULL, '2025-11-22 17:24:33', '2025-11-22 17:24:33'),
(130, 94, 4, NULL, NULL, 1, NULL, NULL, '2025-11-22 18:45:36', '2025-11-22 18:45:36'),
(131, 95, 2, NULL, NULL, 1, NULL, NULL, '2025-11-22 21:41:59', '2025-11-22 21:41:59'),
(132, 95, 8, NULL, NULL, 1, NULL, NULL, '2025-11-22 21:41:59', '2025-11-22 21:41:59'),
(133, 97, 3, NULL, NULL, 1, NULL, NULL, '2025-11-22 21:43:58', '2025-11-22 21:43:58'),
(134, 98, 11, NULL, NULL, 1, NULL, NULL, '2025-11-24 17:11:12', '2025-11-24 17:11:12'),
(135, 99, 3, NULL, NULL, 5, NULL, NULL, '2025-11-24 17:59:08', '2025-11-24 17:59:08'),
(136, 100, 11, NULL, NULL, 11, NULL, NULL, '2025-11-24 19:45:36', '2025-11-24 19:45:36'),
(137, 101, 4, NULL, NULL, 1, NULL, NULL, '2025-11-24 23:49:04', '2025-11-24 23:49:04'),
(138, 101, 3, NULL, NULL, 1, NULL, NULL, '2025-11-24 23:49:04', '2025-11-24 23:49:04'),
(139, 102, 4, NULL, NULL, 1, NULL, NULL, '2025-11-24 23:49:35', '2025-11-24 23:49:35'),
(140, 102, 3, NULL, NULL, 1, NULL, NULL, '2025-11-24 23:49:35', '2025-11-24 23:49:35'),
(141, 103, 3, NULL, NULL, 1, NULL, NULL, '2025-11-25 00:08:18', '2025-11-25 00:08:18'),
(142, 104, 4, NULL, NULL, 1, NULL, NULL, '2025-11-25 00:18:32', '2025-11-25 00:18:32'),
(143, 104, 1, NULL, NULL, 1, NULL, NULL, '2025-11-25 00:18:32', '2025-11-25 00:18:32'),
(144, 104, 3, NULL, NULL, 1, NULL, NULL, '2025-11-25 00:18:32', '2025-11-25 00:18:32'),
(145, 105, 2, NULL, NULL, 1, NULL, NULL, '2025-11-25 00:49:08', '2025-11-25 00:49:08'),
(146, 106, 2, NULL, NULL, 1, NULL, NULL, '2025-11-25 00:55:09', '2025-11-25 00:55:09'),
(147, 107, 1, NULL, NULL, 1, NULL, NULL, '2025-11-25 00:58:50', '2025-11-25 00:58:50'),
(148, 108, 2, NULL, NULL, 1, NULL, NULL, '2025-11-25 16:11:35', '2025-11-25 16:11:35'),
(149, 109, 1, NULL, NULL, 1, NULL, NULL, '2025-11-25 16:20:04', '2025-11-25 16:20:04'),
(150, 110, 1, NULL, NULL, 1, NULL, NULL, '2025-11-25 16:20:20', '2025-11-25 16:20:20'),
(151, 111, 3, NULL, NULL, 1, NULL, NULL, '2025-11-25 17:55:51', '2025-11-25 17:55:51'),
(152, 111, 1, NULL, NULL, 1, NULL, NULL, '2025-11-25 17:55:51', '2025-11-25 17:55:51'),
(153, 112, 5, NULL, NULL, 1, NULL, NULL, '2025-11-25 19:31:40', '2025-11-25 19:31:40');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard view', 'web', '2025-10-08 13:03:04', '2025-10-08 13:03:04'),
(2, 'dynamic-pages view', 'web', '2025-10-08 13:03:04', '2025-10-08 13:03:04'),
(3, 'dynamic-pages create', 'web', '2025-10-08 13:03:04', '2025-10-08 13:03:04'),
(4, 'dynamic-pages edit', 'web', '2025-10-08 13:03:04', '2025-10-08 13:03:04'),
(5, 'dynamic-pages delete', 'web', '2025-10-08 13:03:04', '2025-10-08 13:03:04'),
(6, 'review view', 'web', '2025-10-08 13:03:04', '2025-10-08 13:03:04'),
(7, 'review create', 'web', '2025-10-08 13:03:04', '2025-10-08 13:03:04'),
(8, 'review edit', 'web', '2025-10-08 13:03:04', '2025-10-08 13:03:04'),
(9, 'review delete', 'web', '2025-10-08 13:03:04', '2025-10-08 13:03:04'),
(10, 'offer view', 'web', '2025-10-08 13:03:04', '2025-10-08 13:03:04'),
(11, 'offer create', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(12, 'offer edit', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(13, 'offer delete', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(14, 'video view', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(15, 'video create', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(16, 'video edit', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(17, 'video delete', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(18, 'blog view', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(19, 'blog create', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(20, 'blog edit', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(21, 'blog delete', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(22, 'banner view', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(23, 'banner status', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(24, 'banner create', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(25, 'banner edit', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(26, 'banner delete', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(27, 'product view', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(28, 'product create', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(29, 'product edit', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(30, 'product delete', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(31, 'promocode view', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(32, 'promocode create', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(33, 'promocode edit', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(34, 'promocode delete', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(35, 'category view', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(36, 'category create', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(37, 'category edit', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(38, 'category delete', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(39, 'mail setting update', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(40, 'profile setting update', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(41, 'system setting update', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(42, 'admin setting update', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(43, 'order view', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(44, 'order update status', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(45, 'user view', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(46, 'role management', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(47, 'permission view', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(48, 'newsletter management', 'web', '2025-10-08 13:03:05', '2025-10-08 13:03:05');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `product_type` varchar(200) DEFAULT NULL,
  `product_version_type` enum('arabic','english') NOT NULL DEFAULT 'arabic',
  `short_description` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `additional_description` longtext DEFAULT NULL,
  `regular_price` double NOT NULL DEFAULT 0,
  `discount_price` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `weight_unit` enum('kg','g','lb') NOT NULL DEFAULT 'kg',
  `status` enum('1','2','0') NOT NULL DEFAULT '1' COMMENT '1 = published, 2 = draft, 0 = unpublished',
  `product_image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `slug`, `product_code`, `brand`, `product_type`, `product_version_type`, `short_description`, `description`, `additional_description`, `regular_price`, `discount_price`, `weight`, `weight_unit`, `status`, `product_image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Radiant Glow Face Cream', 'radiant-glow-face-cream', NULL, 'Allurdevine', NULL, 'english', 'Hydrating face cream for smooth and glowing skin', '<p>This face cream deeply moisturizes your skin while enhancing natural radiance. Enriched with vitamins and antioxidants, it helps reduce dryness and improves skin texture.</p>', '<p>Apply twice daily on cleansed skin. Suitable for all skin types. Dermatologically tested and cruelty-free</p>', 500, 450, NULL, 'kg', '1', 'uploads/product/300-68e6b7392e586-1759950649.png', '2025-10-08 13:10:49', '2025-10-08 13:10:49'),
(2, 2, 'Velvet Matte Lipstick', 'velvet-matte-lipstick', NULL, 'Allurdevine', NULL, 'english', 'Long-lasting matte lipstick with intense color', '<ul><li>Experience a velvety smooth texture with our Matte Lipstick. </li><li>Provides rich pigmentation and stays vibrant for hours without smudging or fading</li><li>Provides rich pigmentation and stays vibrant for hours without smudging or fading</li><li>Provides rich pigmentation and stays vibrant for hours without smudging or fading</li><li>Provides rich pigmentation and stays vibrant for hours without smudging or fading</li><li>Provides rich pigmentation and stays vibrant for hours without smudging or fading</li><li>Provides rich pigmentation and stays vibrant for hours without smudging or fading</li></ul>', '<ul><li>Available in 12 stunning shades. Apply directly or with a lip brush for precise application. Paraben-free formula.”Available in 12 stunning shades. Apply directly or with a lip brush for precise application. Paraben-free formula.”</li><li>Available in 12 stunning shades. Apply directly or with a lip brush for precise application. Paraben-free formula.”Available in 12 stunning shades. Apply directly or with a lip brush for precise application. Paraben-free formula.”</li><li>Available in 12 stunning shades. Apply directly or with a lip brush for precise application. Paraben-free formula.”Available in 12 stunning shades. Apply directly or with a lip brush for precise application. Paraben-free formula.”<br></li></ul>', 800, 550, NULL, 'kg', '1', 'uploads/product/150-68e6d8b9bb667-1759959225.jpg', '2025-10-08 14:25:35', '2025-10-08 21:33:45'),
(3, 1, 'Mira Harmon', 'mira-harmon', NULL, 'Allurdevine', NULL, 'arabic', 'Step into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk.', '<p>Step into a world of elegance and allure with <em data-start=\"481\" data-end=\"496\">Euphoria Mist</em>. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget.Step into a world of elegance and allure with <em data-start=\"481\" data-end=\"496\">Euphoria Mist</em>. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget.Step into a world of elegance and allure with <em data-start=\"481\" data-end=\"496\">Euphoria Mist</em>. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget.</p>', '<p>Step into a world of elegance and allure with <em data-start=\"481\" data-end=\"496\">Euphoria Mist</em>. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget.</p>', 920, 715, NULL, 'kg', '1', 'uploads/product/150-68e828fb63035-1760045307.png', '2025-10-08 21:28:50', '2025-10-09 21:28:27'),
(4, 1, 'Jin Mathis', 'jin-mathis', NULL, 'Allurdevine', NULL, 'english', 'Aperiam est consecte', '<p data-pm-slice=\"0 0 []\">Step into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget</p>', '<p data-pm-slice=\"0 0 []\">Step into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forgetStep into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget</p>', 904, 10, NULL, 'kg', '1', 'uploads/product/150-68e828e21f05b-1760045282.png', '2025-10-08 21:30:42', '2025-10-09 21:28:02'),
(5, 2, 'Colt Garza', 'colt-garza', NULL, 'Allurdevine', 'featured', 'english', 'Dolore sequi in in e', NULL, '<p data-pm-slice=\"0 0 []\">Step into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget</p>', 281, NULL, NULL, 'kg', '1', 'uploads/product/150-68e828c649658-1760045254.png', '2025-10-08 21:37:15', '2025-10-09 21:27:34'),
(6, 3, 'Kalia Mckenzie', 'kalia-mckenzie', NULL, 'Allurdevine', 'featured', 'english', 'Natus qui molestias', '<p data-pm-slice=\"0 0 []\">Step into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget</p>', '<p data-pm-slice=\"0 0 []\">Step into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget</p>', 356, NULL, NULL, 'kg', '1', 'uploads/product/150-68e828a64a907-1760045222.png', '2025-10-08 21:38:11', '2025-10-09 21:27:02'),
(7, 1, 'Kelly Gates', 'kelly-gates', NULL, 'Allurdevine', NULL, 'arabic', 'Minima dignissimos e', '<p data-pm-slice=\"0 0 []\">Step into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget</p>', '<p data-pm-slice=\"0 0 []\">Step into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forgetStep into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget</p>', 648, 31, NULL, 'kg', '1', 'uploads/product/150-68e82885d41b5-1760045189.png', '2025-10-08 21:40:14', '2025-10-09 21:26:29'),
(8, 2, 'Demetrius Powell', 'demetrius-powell', NULL, 'Allurdevine', NULL, 'arabic', 'Et mollit vel nulla', NULL, NULL, 90, NULL, NULL, 'kg', '1', 'uploads/product/150-68e82868f32b5-1760045160.png', '2025-10-08 21:40:33', '2025-10-09 21:26:00'),
(9, 1, 'Laurel Gibbs', 'laurel-gibbs', NULL, 'Allurdevine', 'featured', 'arabic', 'Harum voluptas conse', '<p data-pm-slice=\"0 0 []\">Step into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget</p>', '<p data-pm-slice=\"0 0 []\">Step into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forgetStep into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget</p>', 161, NULL, NULL, 'kg', '1', 'uploads/product/150-68e8284fdd04c-1760045135.png', '2025-10-08 21:41:14', '2025-10-09 21:25:35'),
(10, 3, 'Ryan Crawford', 'ryan-crawford', NULL, 'Allurdevine', NULL, 'english', 'Iusto molestiae cons', NULL, NULL, 103, NULL, NULL, 'kg', '1', 'uploads/product/150-68e8280103ff0-1760045057.png', '2025-10-08 21:41:42', '2025-10-09 21:24:17'),
(11, 1, 'Malcolm Ross', 'malcolm-ross', NULL, 'Allurdevine', 'featured', 'arabic', 'Aut velit nemo volu', NULL, NULL, 102, NULL, NULL, 'kg', '1', 'uploads/product/150-68e827dbc3536-1760045019.png', '2025-10-08 21:44:26', '2025-10-09 21:23:39'),
(12, 1, 'Lillian Casey', 'lillian-casey', NULL, 'Allurdevine', NULL, 'arabic', 'Facilis aliquip blan', NULL, NULL, 691, NULL, NULL, 'kg', '1', 'uploads/product/150-68e827bfacdc3-1760044991.png', '2025-10-08 21:44:59', '2025-10-09 21:23:11'),
(13, 3, 'Elton Weaver', 'elton-weaver', NULL, 'Allurdevine', NULL, 'arabic', 'Nesciunt laudantium', NULL, NULL, 184, 22, NULL, 'kg', '1', 'uploads/product/150-68e827a1f2374-1760044961.png', '2025-10-08 21:45:27', '2025-10-09 21:22:41'),
(14, 3, 'Price Ferrell', 'price-ferrell', NULL, 'Allurdevine', 'featured', 'english', 'Quos id eiusmod duci', '<p data-pm-slice=\"0 0 []\">Step into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget</p>', '<p data-pm-slice=\"0 0 []\">Step into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget</p>', 743, NULL, NULL, 'kg', '1', 'uploads/product/300-68e8292043e93-1760045344.png', '2025-10-09 21:29:04', '2025-11-25 18:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('fixed','percent') NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `min_order_amount` decimal(10,2) DEFAULT NULL,
  `max_uses` int(11) DEFAULT NULL,
  `uses` int(11) NOT NULL DEFAULT 0,
  `max_users` int(11) DEFAULT NULL,
  `used_by_users` int(11) NOT NULL DEFAULT 0,
  `expires_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promo_codes`
--

INSERT INTO `promo_codes` (`id`, `code`, `type`, `value`, `min_order_amount`, `max_uses`, `uses`, `max_users`, `used_by_users`, `expires_at`, `status`, `created_at`, `updated_at`) VALUES
(2, '100', 'fixed', 10.00, 10.00, 100, 16, 100, 0, '2026-01-08 00:00:00', 0, '2025-11-22 01:12:10', '2025-11-25 00:35:30'),
(3, 'Mash5', 'fixed', 5.00, 10.00, 100, 12, 100, 0, '2025-12-18 00:00:00', 1, '2025-11-25 00:34:36', '2025-11-25 19:31:31');

-- --------------------------------------------------------

--
-- Table structure for table `promo_code_users`
--

CREATE TABLE `promo_code_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `promo_code_id` bigint(20) UNSIGNED NOT NULL,
  `used_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promo_code_users`
--

INSERT INTO `promo_code_users` (`id`, `user_id`, `promo_code_id`, `used_at`, `created_at`, `updated_at`) VALUES
(2, 8, 2, '2025-11-22 01:12:36', '2025-11-22 01:12:36', '2025-11-22 01:12:36'),
(3, 8, 2, '2025-11-22 01:32:30', '2025-11-22 01:32:30', '2025-11-22 01:32:30'),
(4, 2, 2, '2025-11-24 19:44:48', '2025-11-24 19:44:48', '2025-11-24 19:44:48'),
(5, 1, 2, '2025-11-24 23:49:19', '2025-11-24 23:49:19', '2025-11-24 23:49:19'),
(6, 1, 2, '2025-11-24 23:54:42', '2025-11-24 23:54:42', '2025-11-24 23:54:42'),
(7, 1, 2, '2025-11-24 23:55:15', '2025-11-24 23:55:15', '2025-11-24 23:55:15'),
(8, 1, 2, '2025-11-24 23:55:51', '2025-11-24 23:55:51', '2025-11-24 23:55:51'),
(9, 1, 2, '2025-11-24 23:57:24', '2025-11-24 23:57:24', '2025-11-24 23:57:24'),
(10, 12, 2, '2025-11-25 00:03:17', '2025-11-25 00:03:17', '2025-11-25 00:03:17'),
(11, 1, 2, '2025-11-25 00:07:57', '2025-11-25 00:07:57', '2025-11-25 00:07:57'),
(12, 1, 2, '2025-11-25 00:08:09', '2025-11-25 00:08:09', '2025-11-25 00:08:09'),
(13, 1, 2, '2025-11-25 00:08:33', '2025-11-25 00:08:33', '2025-11-25 00:08:33'),
(14, 12, 2, '2025-11-25 00:11:58', '2025-11-25 00:11:58', '2025-11-25 00:11:58'),
(15, 1, 2, '2025-11-25 00:17:09', '2025-11-25 00:17:09', '2025-11-25 00:17:09'),
(16, 1, 2, '2025-11-25 00:17:31', '2025-11-25 00:17:31', '2025-11-25 00:17:31'),
(17, 1, 2, '2025-11-25 00:19:26', '2025-11-25 00:19:26', '2025-11-25 00:19:26'),
(18, 1, 3, '2025-11-25 00:44:43', '2025-11-25 00:44:43', '2025-11-25 00:44:43'),
(19, 1, 3, '2025-11-25 00:46:07', '2025-11-25 00:46:07', '2025-11-25 00:46:07'),
(20, 1, 3, '2025-11-25 00:48:56', '2025-11-25 00:48:56', '2025-11-25 00:48:56'),
(21, 1, 3, '2025-11-25 00:49:59', '2025-11-25 00:49:59', '2025-11-25 00:49:59'),
(22, 1, 3, '2025-11-25 00:51:42', '2025-11-25 00:51:42', '2025-11-25 00:51:42'),
(23, 1, 3, '2025-11-25 00:54:59', '2025-11-25 00:54:59', '2025-11-25 00:54:59'),
(24, 1, 3, '2025-11-25 00:58:38', '2025-11-25 00:58:38', '2025-11-25 00:58:38'),
(25, 1, 3, '2025-11-25 16:11:24', '2025-11-25 16:11:24', '2025-11-25 16:11:24'),
(26, 1, 3, '2025-11-25 16:19:26', '2025-11-25 16:19:26', '2025-11-25 16:19:26'),
(27, 1, 3, '2025-11-25 16:19:53', '2025-11-25 16:19:53', '2025-11-25 16:19:53'),
(28, 1, 3, '2025-11-25 17:55:43', '2025-11-25 17:55:43', '2025-11-25 17:55:43'),
(29, 1, 3, '2025-11-25 19:31:31', '2025-11-25 19:31:31', '2025-11-25 19:31:31');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `review_content` text NOT NULL,
  `rating_point` float NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0' COMMENT '1 = approved, 0 = pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `name`, `photo`, `review_content`, `rating_point`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mobarok', 'uploads/review/150-68e9342542286-1760113701.png', 'Fresh, clean, and uplifting — just like a walk on the beach. The citrusy top notes hit first, followed by a subtle woody base that gives it depth. I love wearing this daily, especially in summer.', 5, '1', '2025-10-08 22:27:00', '2025-10-10 16:28:21'),
(2, 'Mahi', 'uploads/review/150-68e93417bab1d-1760113687.png', 'I love wearing this daily, especially in summer. The only downside is the longevity; it fades after about 4–5 hours, so I reapply once midday', 4, '1', '2025-10-08 22:27:30', '2025-10-10 16:28:07'),
(3, 'Kawser', 'uploads/review/150-68e934003f2d9-1760113664.png', 'Fresh, clean, and uplifting — just like a walk on the beach. The citrusy top notes hit first, followed by a subtle woody base that gives it depth. I love wearing this daily, especially in summer.', 5, '1', '2025-10-08 22:27:54', '2025-10-10 16:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2025-10-08 13:03:04', '2025-10-08 13:03:04'),
(2, 'Wirehouse', 'web', '2025-10-26 19:50:04', '2025-10-26 19:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(40, 2),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1);

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
('0is6QlgKv5KlN31COuCmpbPiRlzdrVonZiQYEFru', NULL, '87.236.176.78', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHpUOFBadHV0NGo3dWgxMjRVQkFlbHZ4TWpaNE5UcTd2MVJoTWFoeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vZmluYWxuYXNoLnNvZnR2ZW5jZWZzZC54eXovbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1764098724),
('39te3b4apDfyYEsg0j3oQGV5Gs7IB9Q1oihSysWh', 1, '103.174.189.33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiY2QyNk9VTEdTUWtWcWNMUU5wSVhxOGJTRFRMZWRFWDhXbWM0bWJ3eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vZmluYWxuYXNoLnNvZnR2ZW5jZWZzZC54eXovb2ZmZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1764100157),
('4AeoipaV5866mXjiBFB2m90kekUK6VOLa6hxcAbG', NULL, '87.236.176.37', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDBnYkliOVUxUEl2ZG5reFBMMzc1b1pFZWVrdjJRU2ltYUgzQkZmdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9maW5hbG5hc2guc29mdHZlbmNlZnNkLnh5ei9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1764094362),
('FSKVatWP0xjN5paefL3UvUJqoJjbFi5E60h6g8Uw', NULL, '87.236.176.78', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVJxaW5vOWNFRmM0M05CYmNWM3pHcU5HZlpwcFhRalkxMG5NV3FlWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vZmluYWxuYXNoLnNvZnR2ZW5jZWZzZC54eXoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1764098723),
('jTO7aHzoNivptKId3FhuX13Txe6E68oz5BCArTBn', NULL, '51.254.204.161', 'Mozilla/5.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEJ1MG9RYm5hRUZ0U2o3SWdHQW5SaTlpb0xjcTJ1aHBrWXdzZVFZTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vZmluYWxuYXNoLnNvZnR2ZW5jZWZzZC54eXoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1764092413),
('kzFyjsQ0GLNjYCkco23hOCrTSbVdrAQ6hCNAFVPM', 1, '103.174.189.33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoid09yOW9MeHIyS05nek9CODYyanBDalczbm5nV0RuZURER3VBSXFxcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHBzOi8vZmluYWxuYXNoLnNvZnR2ZW5jZWZzZC54eXovcHJvZHVjdC9lZGl0LzE0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1764093796);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `town` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `button_link` varchar(255) DEFAULT NULL,
  `page_name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `description`, `button_text`, `button_link`, `page_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Glow Like Never Before', 'Discover our premium skincare collection for radiant, healthy skin.', NULL, NULL, 'products', 1, '2025-10-08 13:07:31', '2025-10-08 13:07:31'),
(2, '💫 Discover Your Natural Glow', 'Unlock radiant skin with our new organic skincare line', NULL, NULL, 'offers', 1, '2025-10-10 16:41:53', '2025-10-10 16:41:53'),
(4, 'Luxury Fragrance for Every Mood', 'Where elegance meets passion in every drop', NULL, NULL, 'videos', 1, '2025-10-10 16:45:27', '2025-10-10 16:45:27'),
(5, '🌷 Shop Fragrances', 'Perfume bottle with floral background and mist effect', NULL, NULL, 'blog', 1, '2025-10-10 16:46:24', '2025-10-10 16:46:24'),
(6, 'Glow Like Never Before', NULL, NULL, NULL, 'contact', 1, '2025-11-25 16:06:31', '2025-11-25 16:06:31'),
(7, 'about', NULL, NULL, NULL, 'about', 1, '2025-11-25 16:07:56', '2025-11-25 16:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `sliders_images`
--

CREATE TABLE `sliders_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders_images`
--

INSERT INTO `sliders_images` (`id`, `slider_id`, `image_path`, `created_at`, `updated_at`) VALUES
(21, 2, 'uploads/slider/300-68e93dc5691f4-1760116165.jpg', '2025-10-10 17:09:25', '2025-10-10 17:09:25'),
(23, 4, 'uploads/slider/300-68e93de4a2b21-1760116196.jpg', '2025-10-10 17:09:56', '2025-10-10 17:09:56'),
(24, 5, 'uploads/slider/300-68e93df026a21-1760116208.jpg', '2025-10-10 17:10:08', '2025-10-10 17:10:08'),
(25, 1, 'uploads/slider/300-68e93e64f1252-1760116324.jpg', '2025-10-10 17:12:04', '2025-10-10 17:12:04'),
(26, 6, 'uploads/slider/300-6925d4075e1b2-1764086791.jpg', '2025-11-25 16:06:31', '2025-11-25 16:06:31'),
(27, 7, 'uploads/slider/300-6925d45c7ed4e-1764086876.jpg', '2025-11-25 16:07:56', '2025-11-25 16:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socials`
--

INSERT INTO `socials` (`id`, `name`, `url`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Instagram', 'https://instagram.com/', '1', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(2, 'Facebook', 'https://facebook.com/', '1', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(3, 'Twitter', 'https://twitter.com/', '1', '2025-10-08 13:03:05', '2025-10-08 13:03:05'),
(4, 'TikTok', 'https://tiktok.com/', '1', '2025-10-08 13:03:05', '2025-10-08 13:03:05');

-- --------------------------------------------------------

--
-- Table structure for table `systems`
--

CREATE TABLE `systems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `systems`
--

INSERT INTO `systems` (`id`, `title`, `email`, `logo`, `favicon`, `copyright`, `created_at`, `updated_at`) VALUES
(1, 'Allurdevine', 'admin@gmail.com', '150/150-68fa5684cc7b4-1761236612.png', '150/150-68fa5684cc8c4-1761236612.png', '@admin', '2025-10-23 16:23:32', '2025-10-23 16:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `otp` varchar(10) DEFAULT NULL,
  `otp_expired_at` timestamp NULL DEFAULT NULL,
  `otp_verified_at` timestamp NULL DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `password_reset_token_expires_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive','banned') NOT NULL DEFAULT 'active',
  `last_login_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `terms_and_conditions` tinyint(1) NOT NULL DEFAULT 0,
  `reason` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone`, `email_verified_at`, `password`, `profile_photo`, `role`, `otp`, `otp_expired_at`, `otp_verified_at`, `password_reset_token`, `password_reset_token_expires_at`, `status`, `last_login_at`, `is_admin`, `terms_and_conditions`, `reason`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'SuperAdmin', NULL, 'superadmin@gmail.com', NULL, NULL, '$2y$12$qdcJLmzQ/t6P0b8wgRDP3uSR.w3SKKgIfCfv1.s31CnxcjQ0pQ56i', 'uploads/profilePhoto/150-68fa569aaa7d1-1761236634.png', 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-25 16:33:55', 0, 0, NULL, NULL, 'EJi3gb8AmkW0Oz8u2ggLZSD6XLsuSC7lNuVwhy1pVET9ldWssuBwP63S109e', '2025-10-08 13:03:04', '2025-11-25 16:33:55'),
(2, 'Ali', NULL, 'ali@gmail.com', NULL, NULL, '$2y$12$bUSZFgp4kYTFQVIsBCP3HeGtmxYt759Akj2WunILIWrsYYmw2ESRm', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-10-27 16:33:28', 0, 0, NULL, NULL, NULL, '2025-10-23 20:35:27', '2025-10-27 16:33:28'),
(3, 'kawser', NULL, 'kawsersoftvence@gmail.com', NULL, NULL, '$2y$12$oUfcJ3DNZeK3uhScrFpBDO2QmlOh7xUz1EdDAxoXVHQ.QKRVm5O9e', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-10-23 20:49:41', 0, 0, NULL, NULL, NULL, '2025-10-23 20:49:41', '2025-10-23 20:49:41'),
(4, 'kawsar ahmed', NULL, 'fl.kawsarahmed@gmail.com', NULL, NULL, '$2y$12$LGjt6BLPU2.JeMiFfpsgIOqY17HfFJjPkF4K5dXDpEIUByH4kYezy', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-10-23 20:53:02', 0, 0, NULL, NULL, NULL, '2025-10-23 20:52:43', '2025-10-23 20:53:02'),
(5, 'ali', NULL, 'alihosain@gmail.com', NULL, NULL, '$2y$12$FZa47HS9h7gvWObNWAS2LeD968aloaMpQgKOKgqL4AE742mgGuTqO', 'uploads/default.png', 'user', NULL, NULL, NULL, NULL, NULL, 'active', NULL, 1, 0, NULL, NULL, NULL, '2025-10-26 19:48:37', '2025-10-26 19:48:37'),
(6, 'mobarok', NULL, 'cesag86934@moondyal.com', NULL, NULL, '$2y$12$mbi2QheDn7mU9h4SDey3lOOD3KpFAV/2mR4xbwjPdzZ6NbEeF5c8O', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-21 17:40:32', 0, 0, NULL, NULL, NULL, '2025-11-21 17:40:13', '2025-11-21 17:40:32'),
(7, 'asdasdasdsd', NULL, 'farhadmia.cu@gmail.com', NULL, NULL, '$2y$12$EjY5Epo5VDIIVHKs9IpIvOyQ0EiJFVStG3lzwCBQd9P6nNEL4jHai', NULL, 'user', '252775', '2025-11-21 18:32:55', NULL, NULL, NULL, 'active', '2025-11-21 18:17:06', 0, 0, NULL, NULL, NULL, '2025-11-21 18:17:06', '2025-11-21 18:17:55'),
(8, 'User', NULL, 'pesad37143@bipochub.com', NULL, NULL, '$2y$12$w3YqL4Xlkjdwew67yEE7CucFDgmqDu/J2B.NfF64.4aU0uDADbRTi', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-22 00:54:07', 0, 0, NULL, NULL, NULL, '2025-11-21 20:44:58', '2025-11-22 00:54:07'),
(9, 'miasoftvence@gmail.com', NULL, 'miasoftvence@gmail.com', NULL, NULL, '$2y$12$99siY9lEORN1JLckP9a5CetB4MZ9p9Bg6IP./Tpr2IIrMCDSkpb3K', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-21 22:01:45', 0, 0, NULL, NULL, NULL, '2025-11-21 22:00:43', '2025-11-21 22:01:45'),
(10, 'Mobarok', NULL, 'wipofe7049@moondyal.com', NULL, NULL, '$2y$12$cK02bmZZHPG7cJ2.1uC8celh4dYyWkoHeEoA6sTzjTHIf7NLRRPXC', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-22 17:40:41', 0, 0, NULL, NULL, NULL, '2025-11-22 17:40:24', '2025-11-22 17:40:41'),
(11, 'Mobarok', NULL, 'fokeya7602@moondyal.com', NULL, NULL, '$2y$12$VK0gXDkGOUJIaKCMqF87COPHe390GrMQnY0ZWAerG/OuUYKS1KR9i', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-22 21:55:44', 0, 0, NULL, NULL, NULL, '2025-11-22 21:55:44', '2025-11-22 21:55:44'),
(12, 'Mobarok', NULL, 'kavab98283@okcdeals.com', NULL, NULL, '$2y$12$n4PfHwEweSlcHkusmWv8iO1U1e/SgCo4bxzZ1vK9clJSdvktRMNaa', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-22 21:58:26', 0, 0, NULL, NULL, NULL, '2025-11-22 21:57:36', '2025-11-22 21:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `user_reviews`
--

CREATE TABLE `user_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `review_content` text NOT NULL,
  `rating_point` float NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0' COMMENT '1 = approved, 0 = pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_reviews`
--

INSERT INTO `user_reviews` (`id`, `user_id`, `product_id`, `review_content`, `rating_point`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Step into a world of elegance and allure with Euphoria Mist. This enchanting fragrance opens with soft floral notes of jasmine and rose, blending effortlessly with warm hints of vanilla and musk. Designed for the modern soul who believes in confidence wrapped in grace, this perfume lingers beautifully all day — leaving a trail that’s impossible to forget.', 5, '1', '2025-10-09 18:14:08', '2025-10-09 18:14:22'),
(2, 1, 3, 'Hello', 5, '0', '2025-10-11 23:16:57', '2025-10-11 23:16:57'),
(3, 1, 10, 'hi', 5, '0', '2025-10-19 20:39:56', '2025-10-19 20:39:56'),
(4, 1, 10, 'hi', 5, '0', '2025-10-19 20:40:16', '2025-10-19 20:40:16');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `video_type` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `youtube_link` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 = active, 0 = inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `title`, `video_type`, `thumbnail`, `youtube_link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Quis pariatur Aliqu', 'popular', 'uploads/video/300-68e934ac5ffe5-1760113836.png', 'https://www.youtube.com/watch?v=X9uex_L-HbQ&list=RDX9uex_L-HbQ&start_radio=1', '1', '2025-10-08 22:53:07', '2025-10-10 16:30:36'),
(2, 'Accusantium hic id', 'popular', 'uploads/video/300-68e93498dfedd-1760113816.png', 'https://www.youtube.com/watch?v=X9uex_L-HbQ&list=RDX9uex_L-HbQ&start_radio=1', '1', '2025-10-08 22:53:46', '2025-10-10 16:30:16'),
(3, 'Accusantium minima t', 'featured', 'uploads/video/300-68e93483b3d8a-1760113795.png', 'https://www.youtube.com/watch?v=xkdFcusIcvY&list=RDxkdFcusIcvY&start_radio=1', '1', '2025-10-10 16:29:55', '2025-10-10 16:29:55'),
(4, 'Ex accusantium sunt', 'featured', 'uploads/video/300-68e934c3bd8ae-1760113859.png', 'https://www.youtube.com/watch?v=xkdFcusIcvY&list=RDxkdFcusIcvY&start_radio=1', '1', '2025-10-10 16:30:59', '2025-10-10 16:30:59'),
(5, 'Cupidatat aut dolore', 'featured', 'uploads/video/300-68e934dc1aa82-1760113884.png', 'https://www.youtube.com/watch?v=xkdFcusIcvY&list=RDxkdFcusIcvY&start_radio=1', '1', '2025-10-10 16:31:24', '2025-10-10 16:31:24'),
(6, 'Voluptate facere nos', 'popular', 'uploads/video/300-68e934f69b047-1760113910.png', 'https://www.youtube.com/watch?v=xkdFcusIcvY&list=RDxkdFcusIcvY&start_radio=1', '1', '2025-10-10 16:31:50', '2025-10-10 16:31:50'),
(7, 'Perspiciatis id ten', 'featured', 'uploads/video/300-68e9358b1ac40-1760114059.png', 'https://www.youtube.com/watch?v=xkdFcusIcvY&list=RDxkdFcusIcvY&start_radio=1', '1', '2025-10-10 16:34:19', '2025-10-10 16:34:19');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(19, 2, 2, '2025-10-26 20:17:55', '2025-10-26 20:17:55'),
(20, 2, 4, '2025-10-26 20:17:59', '2025-10-26 20:17:59'),
(21, 2, 7, '2025-10-26 20:18:02', '2025-10-26 20:18:02'),
(22, 2, 12, '2025-10-26 20:18:04', '2025-10-26 20:18:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner_images`
--
ALTER TABLE `banner_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banner_images_banner_id_foreign` (`banner_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dynamic_pages`
--
ALTER TABLE `dynamic_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feature_sections`
--
ALTER TABLE `feature_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `feature_sections_key_unique` (`key`);

--
-- Indexes for table `get_in_touches`
--
ALTER TABLE `get_in_touches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_galleries`
--
ALTER TABLE `image_galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_galleries_product_id_foreign` (`product_id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventories_product_id_variation_id_unique` (`product_id`,`variation_id`),
  ADD KEY `inventories_variation_id_foreign` (`variation_id`);

--
-- Indexes for table `invoice_settings`
--
ALTER TABLE `invoice_settings`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_products`
--
ALTER TABLE `offer_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_products_offer_id_foreign` (`offer_id`),
  ADD KEY `offer_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_billing_infos`
--
ALTER TABLE `order_billing_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_billing_infos_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_item_details`
--
ALTER TABLE `order_item_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_item_details_order_id_foreign` (`order_id`),
  ADD KEY `order_item_details_product_id_foreign` (`product_id`),
  ADD KEY `order_item_details_color_id_foreign` (`color_id`),
  ADD KEY `order_item_details_size_id_foreign` (`size_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_variations_color_size_unique` (`color`,`size`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `promo_codes_code_unique` (`code`);

--
-- Indexes for table `promo_code_users`
--
ALTER TABLE `promo_code_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promo_code_users_user_id_foreign` (`user_id`),
  ADD KEY `promo_code_users_promo_code_id_foreign` (`promo_code_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders_images`
--
ALTER TABLE `sliders_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sliders_images_slider_id_foreign` (`slider_id`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `systems`
--
ALTER TABLE `systems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_reviews`
--
ALTER TABLE `user_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_reviews_user_id_foreign` (`user_id`),
  ADD KEY `user_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banner_images`
--
ALTER TABLE `banner_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dynamic_pages`
--
ALTER TABLE `dynamic_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_sections`
--
ALTER TABLE `feature_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `get_in_touches`
--
ALTER TABLE `get_in_touches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image_galleries`
--
ALTER TABLE `image_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `invoice_settings`
--
ALTER TABLE `invoice_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `offer_products`
--
ALTER TABLE `offer_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `order_billing_infos`
--
ALTER TABLE `order_billing_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `order_item_details`
--
ALTER TABLE `order_item_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `promo_code_users`
--
ALTER TABLE `promo_code_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sliders_images`
--
ALTER TABLE `sliders_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `systems`
--
ALTER TABLE `systems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_reviews`
--
ALTER TABLE `user_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banner_images`
--
ALTER TABLE `banner_images`
  ADD CONSTRAINT `banner_images_banner_id_foreign` FOREIGN KEY (`banner_id`) REFERENCES `banners` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `image_galleries`
--
ALTER TABLE `image_galleries`
  ADD CONSTRAINT `image_galleries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventories`
--
ALTER TABLE `inventories`
  ADD CONSTRAINT `inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventories_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `product_variations` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `offer_products`
--
ALTER TABLE `offer_products`
  ADD CONSTRAINT `offer_products_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offer_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_billing_infos`
--
ALTER TABLE `order_billing_infos`
  ADD CONSTRAINT `order_billing_infos_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_item_details`
--
ALTER TABLE `order_item_details`
  ADD CONSTRAINT `order_item_details_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `order_item_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_item_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_item_details_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promo_code_users`
--
ALTER TABLE `promo_code_users`
  ADD CONSTRAINT `promo_code_users_promo_code_id_foreign` FOREIGN KEY (`promo_code_id`) REFERENCES `promo_codes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promo_code_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD CONSTRAINT `shipping_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sliders_images`
--
ALTER TABLE `sliders_images`
  ADD CONSTRAINT `sliders_images_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_reviews`
--
ALTER TABLE `user_reviews`
  ADD CONSTRAINT `user_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
