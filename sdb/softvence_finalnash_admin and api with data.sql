-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 27, 2025 at 02:04 AM
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
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `welcome_title` varchar(255) DEFAULT NULL,
  `welcome_description` text DEFAULT NULL,
  `story_title` varchar(255) DEFAULT NULL,
  `story_description` text DEFAULT NULL,
  `philosophy_title` varchar(255) DEFAULT NULL,
  `philosophy_description` text DEFAULT NULL,
  `product_title` varchar(255) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `community_title` varchar(255) DEFAULT NULL,
  `community_description` text DEFAULT NULL,
  `touch_title` varchar(255) DEFAULT NULL,
  `touch_description` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=Published, 0=Unpublished',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `language_id`, `welcome_title`, `welcome_description`, `story_title`, `story_description`, `philosophy_title`, `philosophy_description`, `product_title`, `product_description`, `community_title`, `community_description`, `touch_title`, `touch_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Welcome to Allurdevine Skincare by farhad', 'At Allurdevine Skincare, we believe that every person deserves to feel confident and beautiful in their own skin. Established in 2018, our mission has been to provide exceptional skincare products that cater to all skin types and needs.', 'Our Story', 'At Allurdevine Skincare, we believe that every person deserves to feel confident and beautiful in their own skin. Established in 2018, our mission has been to provide exceptional skincare products that cater to all skin types and needs. At Allurdevine Skincare, we believe that every person deserves to feel confident and beautiful in their own skin. Established in 2018, our mission has been to provide exceptional skincare.', 'Our Philosophy', 'At Allurdevine Skincare, we believe that every person deserves to feel confident and beautiful in their own skin. Established in 2018, our mission has been to provide exceptional skincare products that cater to all skin types and needs.', 'Our Products', 'At Allurdevine Skincare, we believe that every person deserves to feel confident and beautiful in their own skin. Established in 2018, our mission has been to provide exceptional skincare products that cater to all skin types and needs.', 'Join Our Community', 'At Allurdevine Skincare, we believe that every person deserves to feel confident and beautiful in their own skin. Established in 2018, our mission has been to provide exceptional skincare products that cater to all skin types and needs.', 'Get in Touch', 'At Allurdevine Skincare, we believe that every person deserves to feel confident and beautiful in their own skin. Established in 2018, our mission has been to provide exceptional skincare products that cater to all skin types and needs.', 1, '2025-11-23 12:26:23', '2025-11-24 18:15:11'),
(2, 2, 'مرحبًا بك في ألورديفين للعناية بالبشرة', 'في ألورديفين للعناية بالبشرة، نؤمن بأن كل شخص يستحق أن يشعر بالثقة والجمال في بشرته. تأسسنا في عام 2018، وكانت مهمتنا تقديم منتجات عناية بالبشرة استثنائية تلبي جميع أنواع واحتياجات البشرة.', 'قصتنا', 'في ألورديفين للعناية بالبشرة، نؤمن بأن كل شخص يستحق أن يشعر بالثقة والجمال في بشرته. تأسسنا في عام 2018، وكانت مهمتنا تقديم منتجات عناية بالبشرة استثنائية تلبي جميع أنواع واحتياجات البشرة. في ألورديفين للعناية بالبشرة، نؤمن بأن كل شخص يستحق أن يشعر بالثقة والجمال في بشرته. تأسسنا في عام 2018، وكانت مهمتنا تقديم عناية استثنائية.', 'فلسفتنا', 'في ألورديفين للعناية بالبشرة، نؤمن بأن كل شخص يستحق أن يشعر بالثقة والجمال في بشرته. تأسسنا في عام 2018، وكانت مهمتنا تقديم منتجات عناية بالبشرة استثنائية تلبي جميع أنواع واحتياجات البشرة.', 'منتجاتنا', 'في ألورديفين للعناية بالبشرة، نؤمن بأن كل شخص يستحق أن يشعر بالثقة والجمال في بشرته. تأسسنا في عام 2018، وكانت مهمتنا تقديم منتجات عناية بالبشرة استثنائية تلبي جميع أنواع واحتياجات البشرة.', 'انضم إلى مجتمعنا', 'في ألورديفين للعناية بالبشرة، نؤمن بأن كل شخص يستحق أن يشعر بالثقة والجمال في بشرته. تأسسنا في عام 2018، وكانت مهمتنا تقديم منتجات عناية بالبشرة استثنائية تلبي جميع أنواع واحتياجات البشرة.', 'تواصل معنا', 'في ألورديفين للعناية بالبشرة، نؤمن بأن كل شخص يستحق أن يشعر بالثقة والجمال في بشرته. تأسسنا في عام 2018، وكانت مهمتنا تقديم منتجات عناية بالبشرة استثنائية تلبي جميع أنواع واحتياجات البشرة.', 1, '2025-11-23 12:47:17', '2025-11-23 12:59:48');

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
(1, 'My Admin Panel', 'admin@example.com', 'uploads/adminlogo/image-692750d6dc4e2-1764184278.png', 'uploads/admin-favicon.ico', '5278', 5287, '5', NULL, '123 Admin Street, City, Country', '+880123456789', '2025-10-08 13:03:05', '2025-11-27 01:29:31');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
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

INSERT INTO `banners` (`id`, `language_id`, `banner_title`, `banner_subtitle`, `url`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 'Buy you best product now', 'Elegant Rose Eau de Parfum – Romantic & Sophisticated', 'https://www.figma.com/design/jRViK8eQdJJA02sF6A3f77/laurensw2025-%7C%7C-Wix_Buddy-%7C%7C-FO52159940A05?node-id=17-3796&p=f&t=2bWYCnRBlJJFUDhc-0', '1', '2025-10-09 21:39:08', '2025-10-09 21:39:08'),
(4, 2, 'Main slider', 'Subtitle', 'https://allurdevine.net/products?lang=ar', '1', '2025-11-26 17:34:00', '2025-11-26 17:34:00');

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
(24, 3, 'uploads/banner/450-68e82b7c3da3d-1760045948.jpg', '2025-10-09 21:39:08', '2025-10-09 21:39:08'),
(25, 4, 'uploads/banner/450-69273a089024b-1764178440.jpeg', '2025-11-26 17:34:00', '2025-11-26 17:34:00'),
(26, 4, 'uploads/banner/450-69273a089112a-1764178440.jpeg', '2025-11-26 17:34:00', '2025-11-26 17:34:00'),
(27, 4, 'uploads/banner/450-69273a0891aff-1764178440.jpeg', '2025-11-26 17:34:00', '2025-11-26 17:34:00'),
(28, 4, 'uploads/banner/450-69273a08925aa-1764178440.jpeg', '2025-11-26 17:34:00', '2025-11-26 17:34:00'),
(29, 4, 'uploads/banner/450-69273a0892f3b-1764178440.jpeg', '2025-11-26 17:34:00', '2025-11-26 17:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
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

INSERT INTO `blogs` (`id`, `language_id`, `title`, `slug`, `blog_type`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(4, 2, 'ماء الميسيلا السر اليومي لبشرة نظيفة ومشرقة', 'maaa-almysyla-alsr-alyomy-lbshr-nthyf-omshrk', 'featured', '<span id=\"docs-internal-guid-6c40cee6-7fff-798d-0119-871570e35915\"><br><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">لقد أصبح ماء ميسيلار منتجًا لا غنى عنه في عالم العناية بالبشرة، ولهذا السبب! هذا المنتج اللطيف والفعال يستحق مكانة مميزة في روتينك .اليومي للعناية بالبشرة</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">دعونا نتعرف على الفوائد المذهلة لماء ميسيلار ولماذا يجب أن يكون جزءًا من مستحضرات جمالك.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">١. </span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">تنظيف لطيف:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> ماء ميسيلار هو منظف لا يحتاج إلى شطف، يستخدم تكنولوجيا الميسيلات لرفع الأوساخ والزيوت والمكياج عن البشرة. إنه مثالي لجميع أنواع البشرة، بما في ذلك البشرة الحساسة، لأنه ينظف دون تجريد البشرة من زيوتها الطبيعية.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٢. </span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">إزالة المكياج بسهولة:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> من أهم فوائد ماء ميسيلار هو قدرته على إزالة المكياج بسرعة وفعالية. سواء كنت تتعاملين مع ماسكارا مقاومة للماء أو أحمر شفاه طويل الأمد، فإن ماء ميسيلار يجعل عملية الإزالة سهلة ومريحة.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٣. </span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">يرطب ويهدئ:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> على عكس العديد من المنظفات التقليدية، يحتوي ماء ميسيلار غالبًا على مكونات مرطبة تساعد على الحفاظ على بشرتك مرطبة وملطفة. إنه مفيد بشكل خاص لأولئك الذين يعانون من بشرة جافة أو حساسة.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٤. </span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">مريح وسهل الحمل:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> ماء ميسيلار مريح للغاية، خاصة عندما تكونين في الطريق. تركيبته التي لا تحتاج إلى شطف تعني أنه يمكنك استخدامه في أي وقت وأي مكان - مثالي لللمسات السريعة أو لإنعاش بشرتك أثناء السفر.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٥. </span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">متعدد الوظائف:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> لا يقوم ماء ميسيلار بتنظيف وإزالة المكياج فقط، بل يمكن استخدامه أيضًا كتونر. يساعد في توازن مستويات الحموضة في البشرة وتحضيرها للخطوات التالية في روتين العناية بالبشرة.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٦. </span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">مناسب لجميع أنواع البشرة:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> سواء كانت بشرتك دهنية أو جافة أو حساسة أو مختلطة، فإن ماء ميسيلار هو منتج متعدد الاستخدامات يمكنه العمل للجميع. إنه لطيف بما يكفي للاستخدام اليومي ولن يسبب التهيج.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">كيفية استخدام ماء ميسيلار:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> استخدام ماء ميسيلار بسيط للغاية. فقط بللي وسادة قطنية بالمنتج وامسحيها بلطف على وجهك. لا حاجة للشطف - فقط اتبعيها بمرطبك المفضل وستكونين جاهزة!</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">أدخلي ماء ميسيلار في روتين العناية بالبشرة الخاص بك واستمتعي بفوائده بنفسك. إنه منتج مبتكر يعد بتنظيف البشرة وإنعاشها وإشراقها بأقل جهد ممكن</span></p><div><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"><br></span></div></span>', 'uploads/banner/300-69274f057b4e6-1764183813.jpeg', '1', '2025-11-09 14:02:11', '2025-11-26 19:03:33'),
(5, 2, 'اكتشف فوائد تونر الرش الخاص بنا', 'aktshf-foayd-tonr-alrsh-alkhas-bna', 'featured', '<span id=\"docs-internal-guid-f9dcf625-7fff-0f22-d80e-375a5aa22445\"><br><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">يعتبر التونر خطوة أساسية في أي روتين للعناية بالبشرة، وغالبًا ما يتم تجاهله لكنه ذو فوائد كبيرة. تم تصميم تونر الرش الخاص بنا ليمنح بشرتك الانتعاش، الترطيب، والتوازن، مما يجعله ضرورة في روتينك اليومي. إليك لماذا يتميز تونر الرش الخاص بنا ولماذا يجب عليك أن تجعله جزءًا من روتين العناية ببشرتك.</span></p><h4 dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:2pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">فوائد تونر الرش الخاص بنا</span></h4><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">١. </span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">يوازن درجة حموضة البشرة</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: يساعد تونر الرش الخاص بنا في استعادة توازن درجة الحموضة الطبيعية للبشرة، والتي قد تتأثر بالتنظيف. هذا أمر حيوي للحفاظ على صحة البشرة ومنع مشاكل مثل الجفاف أو زيادة إنتاج الزيت.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٢. </span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">يرطب وينعش البشرة</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: مليء بالمكونات المرطبة، يوفر تونر الرش الخاص بنا دفعة فورية من الترطيب، مما يترك بشرتك منتعشة ومفعمة بالحيوية. إنه مثالي لمنح بشرتك انتعاشًا سريعًا طوال اليوم.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٣. </span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">يقلل من حجم المسام</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: الاستخدام المنتظم لتونر الرش الخاص بنا يساعد على شد وتقليل ظهور المسام، مما يمنح بشرتك مظهرًا أكثر نعومة وصفاءً.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٤. </span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">يجهز البشرة للمرطبات والسيروم</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: من خلال إزالة الشوائب المتبقية وتجهيز البشرة، يضمن تونر الرش الخاص بنا امتصاص السيروم والمرطبات بشكل أكثر فعالية، مما يعظم فوائدها.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٥. </span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">يهدئ ويلطف البشرة</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: يحتوي تونر الرش الخاص بنا على مكونات نباتية مهدئة، تساعد في تهدئة التهيج وتقليل الاحمرار، مما يجعله مناسبًا لجميع أنواع البشرة بما في ذلك البشرة الحساسة.</span></p><h4 dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:2pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">كيفية استخدام تونر الرش الخاص بنا</span></h4><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">١. </span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">نظف بشرتك</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: ابدأ بوجه نظيف. استخدم منظفك المفضل لإزالة المكياج والأوساخ والشوائب.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٢. </span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">ضع التونر</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: لديك خياران:</span></p><ul style=\"margin-bottom: 0px; padding-inline-start: 48px;\"><li dir=\"ltr\" style=\"list-style-type: disc; font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space: pre;\" aria-level=\"1\"><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:0pt;\" role=\"presentation\"><span style=\"font-size: 14pt; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; text-wrap-mode: wrap;\">الرش المباشر</span><span style=\"font-size: 14pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; text-wrap-mode: wrap;\">: أغلق عينيك وفمك، ثم رش التونر مباشرة على وجهك من مسافة حوالي ٦-٨ بوصات. دع التونر يمتص بشكل طبيعي أو ربته برفق بأصابعك.</span></p></li><li dir=\"ltr\" style=\"list-style-type: disc; font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space: pre;\" aria-level=\"1\"><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:0pt;margin-bottom:12pt;\" role=\"presentation\"><span style=\"font-size: 14pt; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; text-wrap-mode: wrap;\">استخدام القطنة</span><span style=\"font-size: 14pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; text-wrap-mode: wrap;\">: رش كمية صغيرة من التونر على قطعة قطن وامسح بها وجهك ورقبتك بلطف. تجنب منطقة العين.</span></p></li></ul><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٣. </span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">اتبع روتين العناية بالبشرة الخاص بك</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: بعد وضع التونر، تابع بوضع السيروم، المرطبات، وأي علاجات أخرى تستخدمها.</span></p><h4 dir=\"rtl\" style=\"line-height: 1.38; margin-top: 12pt; margin-bottom: 2pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">ختاما</span></h4><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">يمكن أن يحدث استخدام تونر الرش الخاص بنا في روتين العناية ببشرتك فرقًا كبيرًا في صحة ومظهر بشرتك. خصائصه المتوازنة والمرطبة والمهدئة تعمل معًا لتعزيز جمال بشرتك الطبيعي. جربه اليوم واختبر الفوائد بنفسك</span></p><div><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"><br></span></div></span>', 'uploads/banner/300-69274ef858da5-1764183800.png', '1', '2025-11-09 14:13:09', '2025-11-26 19:03:20'),
(6, 2, 'غسول الوجه الرغوي بالفرشاة وبشرة نضره', 'ghsol-alogh-alrghoy-balfrsha-obshr-ndrh', 'featured', '<span id=\"docs-internal-guid-79bf0748-7fff-5015-8c34-d74bf69b19fc\"><br><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">في عالم العناية بالبشرة، العثور على غسول الوجه المثالي يمكن أن يكون تغييراً كبيراً. غسول الوجه الرغوي بالفرشاة مصمم لتوفير تنظيف عميق وشامل للبشرة بينما يكون لطيفاً عليها. هذا المنتج المبتكر يجمع بين قوة تنظيف الغسول الرغوي وفوائد التقشير للفرشاة المدمجة، مما يجعله ضرورياً في روتين العناية بالبشرة اليومي.</span></p><h4 dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:2pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">فوائد غسول الوجه الرغوي بالفرشاة</span></h4><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">١. تنظيف عميق للبشرة</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">الصيغة الرغوية تتغلغل بعمق في المسام لإزالة الأوساخ والزيوت والشوائب. الرغوة اللطيفة والفعالة تضمن تنظيف بشرتك بالكامل دون تجريدها من الرطوبة الطبيعية.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٢. فرشاة مدمجة للتقشير اللطيف</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">الفرشاة المدمجة مصممة لتقشير البشرة بلطف، إزالة خلايا الجلد الميتة وتعزيز تجديد الخلايا. هذا يساعد على كشف بشرة أكثر إشراقاً ونضارة ويمكن أن يحسن امتصاص منتجات العناية بالبشرة الأخرى.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٣. مريح وصحي</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">التصميم الكل في واحد يجعل هذا الغسول مريحاً للغاية في الاستخدام. الفرشاة تضمن تطبيقاً متساوياً ومتناسقاً في كل مرة. بالإضافة إلى ذلك، رأس الفرشاة سهل التنظيف، مما يحافظ على النظافة ويقلل من خطر نمو البكتيريا.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٤. مناسب لجميع أنواع البشرة</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">غسول الوجه الرغوي بالفرشاة مناسب لجميع أنواع البشرة، بما في ذلك البشرة الحساسة. الصيغة اللطيفة خالية من المواد الكيميائية القاسية، مما يجعله آمناً وفعالاً للاستخدام اليومي.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٥. تحسين نسيج البشرة</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">الاستخدام المنتظم لغسول الوجه الرغوي بالفرشاة يمكن أن يحسن نسيج بشرتك، مما يجعلها أكثر نعومة وتجانساً. مزيج التنظيف والتقشير يساعد على تقليل مظهر المسام ويترك بشرتك تبدو منعشة وصحية</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٦. سهل الاستخدام</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">استخدام غسول الوجه الرغوي بالفرشاة بسيط. بلل وجهك، ضع الرغوة، ودلك بلطف بالفرشاة بحركات دائرية. اشطف جيداً وجفف. للحصول على أفضل النتائج، استخدمه مرتين يومياً، صباحاً ومساءً.</span></p><h4 dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:2pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">خاتمة</span></h4><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">إدخال غسول الوجه الرغوي بالفرشاة في روتين العناية بالبشرة يمكن أن يحول بشرتك. مع فعالية التنظيف العميق والتقشير اللطيف والتصميم المريح، إنه الحل المثالي للحصول على بشرة نظيفة ومشرقة. جربه اليوم واختبر الفوائد بنفسك!</span></p><br></span>', 'uploads/banner/300-69274eec89d5a-1764183788.jpeg', '1', '2025-11-09 14:15:17', '2025-11-26 19:03:08'),
(7, 2, 'غسول الوجه الكريمي المثالي للبشرة الحساسة', 'ghsol-alogh-alkrymy-almthaly-llbshr-alhsas', 'featured', '<span id=\"docs-internal-guid-03e1d1b8-7fff-55d9-15c0-bc2affec4ffe\"><br><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">تحتاج البشرة الحساسة إلى عناية خاصة واهتمام، وغسول الوجه الكريمي لدينا مصمم خصيصًا لذلك. فيما يلي أهم الفوائد التي تجعله ضروريًا في روتين العناية بالبشرة الخاص بك</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">١. يهدئ التهيج:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> يحتوي غسول الوجه الكريمي لدينا على مكونات تهدئ البشرة المتهيجة، مما يقلل من الاحمرار والانزعاج.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٢. يرطب ويغذي:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> بفضل المكونات المرطبة، يساعد على الحفاظ على توازن رطوبة البشرة، مما يمنع الجفاف والتقشر.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٣. تنظيف لطيف:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> على عكس المنظفات القاسية، يزيل غسول الوجه الخاص بنا الشوائب والمكياج بلطف دون تجريد البشرة من زيوتها الطبيعية.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٤. خالي من المواد الكيميائية القاسية:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> خالي من البارابين، والكبريتات، والعطور الصناعية، مما يجعله مثاليًا للبشرة الحساسة.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٥. اختبار الجلد:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> تم اختبار غسول الوجه لدينا من قبل أطباء الجلد لضمان سلامته وفعاليته للبشرة الحساسة.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٦. يغذي ويحمي:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> يحتوي على مستخلصات طبيعية تغذي البشرة مع توفير حاجز وقائي ضد العوامل البيئية الضارة.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٧. يحسن نسيج البشرة:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> الاستخدام المنتظم يمكن أن يساعد في تحسين النسيج العام لبشرتك، مما يجعلها أكثر نعومة وإشراقًا.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٨. سهل الاستخدام:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> يتميز بقوامه الكريمي الذي يسهل تطبيقه وشطفه، مما يترك بشرتك ناعمة ومنتعشة.</span></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">.</span><span style=\"font-size: 15pt; font-family: Arial, sans-serif; color: rgb(32, 33, 36); font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> </span><span style=\"font-size: 15pt; font-family: Arial, sans-serif; color: rgb(4, 12, 40); font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٩</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> عبوات صديقة للبيئة:</span><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> نحن نهتم بالبيئة، وعبواتنا صديقة للبيئة وقابلة لإعادة التدوير.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">جربي العناية اللطيفة والبشرة المتألقة التي يقدمها غسول الوجه الكريمي لدينا. إنه الإضافة المثالية لروتين العناية بالبشرة الخاص بك لتهدئة وحماية البشرة الحساسة</span><span style=\"font-size: 11pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">.</span></p><br></span>', 'uploads/banner/300-69274edbda80b-1764183771.jpeg', '1', '2025-11-10 15:17:46', '2025-11-26 19:02:51');
INSERT INTO `blogs` (`id`, `language_id`, `title`, `slug`, `blog_type`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(8, 2, 'انتعاش وتوازن غسول البشرة الدهنية', 'antaaash-otoazn-ghsol-albshr-aldhny', 'featured', '<span id=\"docs-internal-guid-a58c3cd7-7fff-aca4-13df-4f697c8569ca\"><br><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">يمكن أن يكون الحفاظ على بشرة صحية وخالية من اللمعان تحدياً، خاصة لأولئك الذين لديهم بشرة دهنية. غسول الوجه الكريمي للبشرة الدهنية مصمم خصيصاً لمعالجة هذه المخاوف، ويوفر تنظيفاً عميقاً مع الحفاظ على توازن رطوبة البشرة الطبيعية. إليك بعض الفوائد الرئيسية</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">١. </span><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">تنظيف عميق</span><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: غسول الوجه الخاص بنا يتغلغل بعمق في المسام، ويزيل الزيت الزائد والأوساخ والشوائب بفعالية دون تجريد بشرتك من رطوبتها الأساسية.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٢. </span><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">السيطرة على الزيت</span><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: التركيبة الفريدة تساعد في تنظيم إنتاج الزيت، مما يقلل من مظهر اللمعان ويحافظ على انتعاش البشرة طوال اليوم.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٣. </span><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">منع البثور</span><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: من خلال تنظيف المسام بعمق، يساعد غسول الوجه الخاص بنا في منع تراكم البكتيريا والزهم الذي يمكن أن يؤدي إلى حب الشباب والبثور.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٤. </span><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">لطيف على البشرة</span><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: على الرغم من خصائصه القوية في التنظيف، يضمن الملمس الكريمي لمسة لطيفة، مما يجعله مناسباً للاستخدام اليومي دون التسبب في تهيج أو جفاف.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٥. </span><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">إحساس منعش</span><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: غني بالمكونات المهدئة، يترك غسول الوجه بشرتك تشعر بالبرودة والانتعاش والتجديد بعد كل استخدام.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٦. </span><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">ترطيب متوازن</span><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: بينما يتحكم في الزيت بشكل فعال، يضمن غسول الوجه أيضاً أن تبقى بشرتك مرطبة وناعمة، مما يمنع الشعور بالضيق والجفاف الذي يرتبط غالباً بمنتجات التحكم في الزيت.</span></p><p dir=\"ltr\" style=\"line-height:1.38;text-align: right;margin-top:12pt;margin-bottom:12pt;\"><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">اختبر التوازن المثالي بين التنظيف العميق والعناية اللطيفة مع غسول الوجه الكريمي للبشرة الدهنية، واستمتعي ببشرة أكثر وضوحاً وصحة كل يوم.</span></p><div><span style=\"font-size: 15pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"><br></span></div></span>', 'uploads/banner/300-69274ec68f9fd-1764183750.jpeg', '1', '2025-11-10 15:20:12', '2025-11-26 19:02:30'),
(9, 2, 'احصلي على بشرة مشعة مع غسول الوجه للبشرة العادية إلى الجافة', 'ahsly-aal-bshr-mshaa-maa-ghsol-alogh-llbshr-alaaady-al-algaf', 'featured', '<span id=\"docs-internal-guid-95aa2e06-7fff-34ff-93f0-2702ba537f18\"><br><p dir=\"rtl\" style=\"line-height: 1.38; margin-top: 12pt; margin-bottom: 12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">لقد أصبح اختيار غسول الوجه المناسب أمرًا بالغ الأهمية، خاصة لأولئك الذين يمتلكون بشرة عادية إلى جافة. تركيبتنا الخاصة من غسول الوجه توفر العديد من الفوائد التي تلبي الاحتياجات الفريدة لبشرتك. إليك لماذا يجب أن يكون غسول الوجه للبشرة العادية إلى الجافة جزءًا أساسيًا من روتينك اليومي للعناية بالبشرة.</span></p><p dir=\"rtl\" style=\"line-height: 1.38; margin-top: 12pt; margin-bottom: 12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">١. تنظيف لطيف: غسول الوجه الخاص بنا يزيل الشوائب والأوساخ والمكياج بلطف دون تجريد بشرتك من زيوتها الطبيعية. هذا يضمن بقاء بشرتك نظيفة ومتوازنة دون الشعور بالجفاف أو الشد.</span></p><p dir=\"rtl\" style=\"line-height: 1.38; margin-top: 12pt; margin-bottom: 12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٢. تركيبة مرطبة: معزز بمكونات مرطبة، يساعد غسول الوجه الخاص بنا في الحفاظ على مستويات الرطوبة في بشرتك. هذا أمر أساسي لمنع الجفاف والحفاظ على بشرتك ناعمة ومرنة.</span></p><p dir=\"rtl\" style=\"line-height: 1.38; margin-top: 12pt; margin-bottom: 12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٣. يغذي البشرة: غني بالفيتامينات ومضادات الأكسدة، يغذي غسول الوجه بشرتك، مما يعزز مظهرًا صحيًا ومشرقًا. تساعد هذه العناصر الغذائية في إصلاح وحماية بشرتك من التلف البيئي.</span></p><p dir=\"rtl\" style=\"line-height: 1.38; margin-top: 12pt; margin-bottom: 12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٤. يهدئ التهيج: يحتوي غسول الوجه الخاص بنا على مكونات مهدئة تساعد في تهدئة أي تهيج أو احمرار. إنه مثالي للبشرة الحساسة، مما يوفر تجربة تنظيف لطيفة ومريحة.</span></p><p dir=\"rtl\" style=\"line-height: 1.38; margin-top: 12pt; margin-bottom: 12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٥. يحسن ملمس البشرة: الاستخدام المنتظم لغسول الوجه يمكن أن يحسن ملمس بشرتك، مما يجعلها أكثر نعومة وتجانسًا. تساعد الخصائص المرطبة والمغذية في تقليل التقشر وتعزيز المظهر العام لبشرتك.</span></p><p dir=\"rtl\" style=\"line-height: 1.38; margin-top: 12pt; margin-bottom: 12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">٦. يهيئ البشرة للعناية الإضافية: استخدام غسول الوجه الخاص بنا كخطوة أولى في روتين العناية بالبشرة يضمن تحضير بشرتك بشكل مثالي لتطبيق السيروم والمرطبات والعلاجات الأخرى. البشرة النظيفة تتيح امتصاصًا أفضل لهذه المنتجات.</span></p><p dir=\"rtl\" style=\"line-height: 1.38; margin-top: 12pt; margin-bottom: 12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">كيفية الاستخدام: للاستخدام، ضعي كمية صغيرة من غسول الوجه على البشرة المبللة. دلكي بلطف بحركات دائرية، ثم اشطفي جيدًا بالماء الفاتر. جففي وجهك بمنشفة نظيفة وتبعيها بمرطبك المفضل.</span></p><p dir=\"rtl\" style=\"line-height: 1.38; margin-top: 12pt; margin-bottom: 12pt;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">أدخلي غسول الوجه للبشرة العادية إلى الجافة في روتينك اليومي واستمتعي بالفوائد التحويلية. تمتعي ببشرة نظيفة ومرطبة ومشرقة كل يوم.</span></p><div><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"><br></span></div></span>', 'uploads/banner/300-69274eb6aa532-1764183734.jpeg', '1', '2025-11-10 15:21:53', '2025-11-26 19:02:14'),
(10, 1, 'Get radiant skin with this facial wash for normal to dry skin.', 'get-radiant-skin-with-this-facial-wash-for-normal-to-dry-skin', NULL, '<div>Choosing the right face wash has become crucial, especially for those with normal to dry skin. Our specially formulated face wash offers numerous benefits tailored to your skin\'s unique needs. Here\'s why a face wash for normal to dry skin should be an essential part of your daily skincare routine.</div><div><br></div><div>1. Gentle Cleansing: Our face wash gently removes impurities, dirt, and makeup without stripping your skin of its natural oils. This ensures your skin stays clean and balanced without feeling dry or tight.</div><div><br></div><div>2. Hydrating Formula: Enriched with moisturizing ingredients, our face wash helps maintain your skin\'s moisture levels. This is essential for preventing dryness and keeping your skin soft and supple.</div><div><br></div><div>3. Nourishes Skin: Rich in vitamins and antioxidants, our face wash nourishes your skin, promoting a healthy, radiant complexion. These nutrients help repair and protect your skin from environmental damage.</div><div><br></div><div>4. Soothes Irritation: Our face wash contains soothing ingredients that help calm any irritation or redness. It\'s ideal for sensitive skin, providing a gentle and comfortable cleansing experience. 5. Improves skin texture: Regular use of our facial wash can improve your skin\'s texture, leaving it smoother and more even-toned. Its moisturizing and nourishing properties help reduce flaking and enhance your skin\'s overall appearance.</div><div><br></div><div>6. Prepares skin for extra care: Using our facial wash as the first step in your skincare routine ensures your skin is perfectly prepared for serums, moisturizers, and other treatments. Clean skin allows for better absorption of these products.</div><div><br></div><div>How to use: To use, apply a small amount of facial wash to wet skin. Gently massage in circular motions, then rinse thoroughly with lukewarm water. Pat your face dry with a clean towel and follow with your favorite moisturizer.</div><div><br></div><div>Incorporate our facial wash for normal to dry skin into your daily routine and experience its transformative benefits. Enjoy clean, hydrated, and radiant skin every day.</div>', 'uploads/banner/300-69274ea68c89a-1764183718.jpeg', '1', '2025-11-22 17:12:23', '2025-11-26 19:01:58'),
(11, 1, 'Refreshing and balancing face wash for oily skin', 'refreshing-and-balancing-face-wash-for-oily-skin', 'featured', '<div>Maintaining healthy, shine-free skin can be a challenge, especially for those with oily skin. Our creamy face wash for oily skin is specially formulated to address these concerns, providing a deep cleanse while preserving the skin\'s natural moisture balance. Here are some of the key benefits:</div><div><br></div><div>1. Deep Cleansing: Our face wash penetrates deep into pores, effectively removing excess oil, dirt, and impurities without stripping your skin of its essential moisture.</div><div><br></div><div>2. Oil Control: The unique formula helps regulate oil production, reducing the appearance of shine and keeping skin feeling fresh all day.</div><div><br></div><div>3. Breakout Prevention: By deeply cleansing pores, our face wash helps prevent the buildup of bacteria and sebum that can lead to acne and breakouts.</div><div><br></div><div>4. Gentle on Skin: Despite its powerful cleansing properties, the creamy texture ensures a gentle touch, making it suitable for daily use without causing irritation or dryness.</div><div><br></div><div>5. Refreshing Feel: Enriched with soothing ingredients, this face wash leaves your skin feeling cool, refreshed, and rejuvenated after every use. 6. Balanced Hydration: While effectively controlling oil, this face wash also ensures your skin stays hydrated and smooth, preventing the tightness and dryness often associated with oil-control products.</div><div><br></div><div>Experience the perfect balance between deep cleansing and gentle care with this creamy face wash for oily skin, and enjoy clearer, healthier-looking skin every day.</div>', 'uploads/banner/300-69274e9898ce1-1764183704.jpeg', '1', '2025-11-22 17:13:10', '2025-11-26 19:01:44'),
(12, 1, 'Creamy facial wash ideal for sensitive skin', 'creamy-facial-wash-ideal-for-sensitive-skin', 'featured', '<div>Sensitive skin needs special care and attention, and our creamy face wash is specially formulated for that. Here are the top benefits that make it essential in your skincare routine:</div><div><br></div><div>1. Soothes Irritation: Our creamy face wash contains ingredients that soothe irritated skin, reducing redness and discomfort.</div><div><br></div><div>2. Hydrates and Nourishes: Thanks to its moisturizing ingredients, it helps maintain the skin\'s moisture balance, preventing dryness and flaking.</div><div><br></div><div>3. Gentle Cleansing: Unlike harsh cleansers, our face wash gently removes impurities and makeup without stripping the skin of its natural oils.</div><div><br></div><div>4. Free from Harsh Chemicals: Free from parabens, sulfates, and artificial fragrances, making it ideal for sensitive skin.</div><div><br></div><div>5. Dermatologically Tested: Our face wash has been dermatologically tested to ensure its safety and effectiveness for sensitive skin.</div><div><br></div><div>6. Nourishes and Protects: Contains natural extracts that nourish the skin while providing a protective barrier against harmful environmental factors.</div><div><br></div><div>7. Improves skin texture: Regular use can help improve your skin\'s overall texture, leaving it smoother and more radiant.</div><div><br></div><div>8. Easy to use: Its creamy texture makes it easy to apply and rinse off, leaving your skin feeling soft and refreshed.</div><div><br></div><div><br></div><div>9. Eco-friendly packaging: We care about the environment, and our packaging is eco-friendly and recyclable.</div><div><br></div><div>Experience the gentle care and radiant skin that our creamy facial wash provides. It\'s the perfect addition to your skincare routine to soothe and protect sensitive skin.</div>', 'uploads/banner/300-69274e89d64f4-1764183689.jpeg', '1', '2025-11-22 17:13:50', '2025-11-26 19:01:29'),
(13, 1, 'Discover the benefits of our spray toner', 'discover-the-benefits-of-our-spray-toner', NULL, '<div>Toner is an essential step in any skincare routine, yet it\'s often overlooked but offers significant benefits. Our spray toner is designed to refresh, hydrate, and balance your skin, making it a must-have in your daily routine. Here\'s why our spray toner stands out and why you should make it part of your skincare regimen.</div><div><br></div><div>Benefits of Our Spray Toner</div><div><br></div><div>1. Balances Skin pH: Our spray toner helps restore the skin\'s natural pH balance, which can be disrupted by cleansing. This is vital for maintaining healthy skin and preventing issues like dryness or excess oil production.</div><div><br></div><div>2. Hydrates and Refreshes Skin: Packed with hydrating ingredients, our spray toner provides an instant boost of moisture, leaving your skin feeling refreshed and revitalized. It\'s perfect for giving your skin a quick boost throughout the day.</div><div><br></div><div>3. Minimizes Pore Size: Regular use of our spray toner helps tighten and minimize the appearance of pores, giving your skin a smoother, clearer look.</div><div><br></div><div>4. Prepares skin for moisturizers and serums: By removing residual impurities and prepping the skin, our spray toner ensures more effective absorption of serums and moisturizers, maximizing their benefits.</div><div><br></div><div>5. Soothes and calms skin: Our spray toner contains soothing botanical ingredients that help calm irritation and reduce redness, making it suitable for all skin types, including sensitive skin.</div><div><br></div><div>How to use our spray toner:</div><div>1. Cleanse your skin: Start with a clean face. Use your favorite cleanser to remove makeup, dirt, and impurities.</div><div><br></div><div>2. Apply toner: You have two options:</div><div><br></div><div>Direct spray: Close your eyes and mouth, then spray the toner directly onto your face from about 6-8 inches away. Let the toner absorb naturally or gently pat it in with your fingers.</div><div><br></div><div>Cotton applicator: Spray a small amount of toner onto a cotton pad and gently wipe your face and neck. Avoid the eye area.</div><div><br></div><div>3. Follow your skincare routine: After applying the toner, follow with your serum, moisturizer, and any other treatments you use.</div><div><br></div><div>In conclusion, using our spray toner in your skincare routine can make a significant difference to the health and appearance of your skin. Its balancing, hydrating, and soothing properties work together to enhance your skin\'s natural beauty. Try it today and experience the benefits for yourself.</div>', 'uploads/banner/300-69274e79c728b-1764183673.jpeg', '1', '2025-11-22 17:14:39', '2025-11-26 19:01:13');

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
('lS9DnlLJsDqeIdrr', 's:7:\"forever\";', 2079530557),
('otp_data_farhadmia.cu@gmail.com', 'a:2:{s:3:\"otp\";i:819455;s:4:\"used\";b:1;}', 1764178036),
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:48:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:14:\"dashboard view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:18:\"dynamic-pages view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:20:\"dynamic-pages create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:18:\"dynamic-pages edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:20:\"dynamic-pages delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:11:\"review view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:13:\"review create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:11:\"review edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:13:\"review delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:10:\"offer view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:12:\"offer create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:10:\"offer edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:12:\"offer delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:10:\"video view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:12:\"video create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:10:\"video edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:12:\"video delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:9:\"blog view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:11:\"blog create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:9:\"blog edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:11:\"blog delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:11:\"banner view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:13:\"banner status\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:13:\"banner create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:11:\"banner edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:13:\"banner delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:12:\"product view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:14:\"product create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:12:\"product edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:14:\"product delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:14:\"promocode view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:16:\"promocode create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:14:\"promocode edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:16:\"promocode delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:13:\"category view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:15:\"category create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:13:\"category edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:15:\"category delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:19:\"mail setting update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:22:\"profile setting update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:21:\"system setting update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:20:\"admin setting update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:10:\"order view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:19:\"order update status\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:9:\"user view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:15:\"role management\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:15:\"permission view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:21:\"newsletter management\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:11:\"Super Admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:9:\"Wirehouse\";s:1:\"c\";s:3:\"web\";}}}', 1764271928),
('SZuKymtO8NivpZ3X', 's:7:\"forever\";', 2079537772),
('uG4aLjXMhvKq8VDf', 's:7:\"forever\";', 2079538118);

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

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
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

INSERT INTO `categories` (`id`, `language_id`, `name`, `category_image`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'skincare', NULL, 'skincare', NULL, '1', '2025-10-08 13:08:20', '2025-11-09 13:39:20'),
(6, 2, 'العناية بالبشرة', NULL, 'alaanay-balbshr', NULL, '1', '2025-11-22 16:48:09', '2025-11-22 17:01:00'),
(9, 1, 'body lotion', NULL, 'body-lotion', NULL, '1', '2025-11-22 17:00:48', '2025-11-22 17:00:48'),
(10, 2, 'غسول الجسم', NULL, 'ghsol-algsm', NULL, '1', '2025-11-22 17:01:21', '2025-11-22 17:01:21');

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
(1, '10', '2', 'Mobarok', 'mali201@gmail.com', '123456789', '2025-11-22 17:50:33', '2025-11-22 17:50:33'),
(2, '13', '11', 'Freestanding Tubs', 'superadmin@gmail.com', 'farhad', '2025-11-27 01:42:27', '2025-11-27 01:42:27');

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
  `language_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
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

--
-- Dumping data for table `get_in_touches`
--

INSERT INTO `get_in_touches` (`id`, `full_name`, `subject`, `email_address`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'Md Farhad Mia', 'DFSF', 'fmfarhad23222@gmail.com', 'DFSF', '2025-11-27 01:42:04', '2025-11-27 01:42:04');

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
(97, 39, 'uploads/gallery/300-69274aae2be80-1764182702.png', '1', '2025-11-26 18:45:02', '2025-11-26 18:45:02'),
(98, 39, 'uploads/gallery/300-69274aae2ccee-1764182702.png', '1', '2025-11-26 18:45:02', '2025-11-26 18:45:02'),
(99, 40, 'uploads/gallery/300-69274b03eee69-1764182787.jpg', '1', '2025-11-26 18:46:27', '2025-11-26 18:46:27'),
(100, 40, 'uploads/gallery/300-69274b03ef421-1764182787.jpg', '1', '2025-11-26 18:46:27', '2025-11-26 18:46:27'),
(101, 41, 'uploads/gallery/300-69274b506a5bd-1764182864.png', '1', '2025-11-26 18:47:44', '2025-11-26 18:47:44'),
(102, 41, 'uploads/gallery/300-69274b506af0b-1764182864.png', '1', '2025-11-26 18:47:44', '2025-11-26 18:47:44'),
(103, 42, 'uploads/gallery/300-69274b9fdb84d-1764182943.png', '1', '2025-11-26 18:49:03', '2025-11-26 18:49:03'),
(104, 42, 'uploads/gallery/300-69274b9fdbe80-1764182943.png', '1', '2025-11-26 18:49:03', '2025-11-26 18:49:03'),
(105, 43, 'uploads/gallery/300-69274be53b88f-1764183013.png', '1', '2025-11-26 18:50:13', '2025-11-26 18:50:13'),
(106, 43, 'uploads/gallery/300-69274be53c14e-1764183013.png', '1', '2025-11-26 18:50:13', '2025-11-26 18:50:13'),
(107, 44, 'uploads/gallery/300-69274c2d604b2-1764183085.png', '1', '2025-11-26 18:51:25', '2025-11-26 18:51:25'),
(108, 44, 'uploads/gallery/300-69274c2d60f63-1764183085.png', '1', '2025-11-26 18:51:25', '2025-11-26 18:51:25'),
(109, 45, 'uploads/gallery/300-69274c4eca9b2-1764183118.jpg', '1', '2025-11-26 18:51:58', '2025-11-26 18:51:58'),
(110, 45, 'uploads/gallery/300-69274c4ecaf09-1764183118.jpg', '1', '2025-11-26 18:51:58', '2025-11-26 18:51:58'),
(111, 46, 'uploads/gallery/300-69274c76d1866-1764183158.jpg', '1', '2025-11-26 18:52:38', '2025-11-26 18:52:38'),
(112, 46, 'uploads/gallery/300-69274c76d221a-1764183158.jpg', '1', '2025-11-26 18:52:38', '2025-11-26 18:52:38');

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
(15, 39, NULL, 100, '1', '2025-11-26 18:45:02', '2025-11-26 18:45:02'),
(16, 40, NULL, 100, '1', '2025-11-26 18:46:27', '2025-11-26 18:46:27'),
(17, 41, NULL, 100, '1', '2025-11-26 18:47:44', '2025-11-26 18:47:44'),
(18, 42, NULL, 99, '1', '2025-11-26 18:49:03', '2025-11-26 19:26:33'),
(19, 43, NULL, 100, '1', '2025-11-26 18:50:13', '2025-11-26 18:50:13'),
(20, 44, NULL, 999, '1', '2025-11-26 18:51:25', '2025-11-27 01:29:31'),
(21, 45, NULL, 491, '1', '2025-11-26 18:51:58', '2025-11-26 18:51:58'),
(22, 46, NULL, 994, '1', '2025-11-26 18:52:38', '2025-11-26 18:52:38');

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
(1, 'ddd', 'uploads/invoiceLogo/image-692750de9fdba-1764184286.png', '2025-11-25 17:08:00', '2025-11-26 19:11:26');

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
(1, 'default', '{\"uuid\":\"eb4c2452-3b3d-4de6-9883-0423acadc4df\",\"displayName\":\"App\\\\Jobs\\\\NewsletterJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewsletterJob\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\NewsletterJob\\\":2:{s:14:\\\"\\u0000*\\u0000newsletters\\\";a:1:{i:0;s:27:\\\"mobarok.softvence@gmail.com\\\";}s:10:\\\"\\u0000*\\u0000offerId\\\";i:3;}\"}}', 0, NULL, 1761075855, 1761075855),
(2, 'default', '{\"uuid\":\"954db9f2-0b74-440b-bec8-2e817dc31aa1\",\"displayName\":\"App\\\\Jobs\\\\NewsletterJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewsletterJob\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\NewsletterJob\\\":2:{s:14:\\\"\\u0000*\\u0000newsletters\\\";a:1:{i:0;s:27:\\\"mobarok.softvence@gmail.com\\\";}s:10:\\\"\\u0000*\\u0000offerId\\\";i:4;}\"}}', 0, NULL, 1764183293, 1764183293),
(3, 'default', '{\"uuid\":\"132b10c3-0567-4a29-96a2-001fa4f6b8f4\",\"displayName\":\"App\\\\Jobs\\\\NewsletterJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewsletterJob\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\NewsletterJob\\\":2:{s:14:\\\"\\u0000*\\u0000newsletters\\\";a:1:{i:0;s:27:\\\"mobarok.softvence@gmail.com\\\";}s:10:\\\"\\u0000*\\u0000offerId\\\";i:5;}\"}}', 0, NULL, 1764185272, 1764185272),
(4, 'default', '{\"uuid\":\"bbd8d9df-e5ad-473a-bf00-303df8eb5570\",\"displayName\":\"App\\\\Jobs\\\\NewsletterJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewsletterJob\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\NewsletterJob\\\":2:{s:14:\\\"\\u0000*\\u0000newsletters\\\";a:1:{i:0;s:27:\\\"mobarok.softvence@gmail.com\\\";}s:10:\\\"\\u0000*\\u0000offerId\\\";i:6;}\"}}', 0, NULL, 1764186374, 1764186374);

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
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `image`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'uploads/languages-images/flag-united-kingdom.png', '2025-11-25 21:11:18', '2025-11-25 21:11:18'),
(2, 'Arabic', 'ar', 'uploads/languages-images/united-arab-emirates.png', '2025-11-25 21:11:18', '2025-11-25 21:11:18');

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
(39, '2025_10_07_213449_create_banner_images_table', 1),
(40, '2025_11_25_210256_create_languages_table', 2),
(41, '2025_11_25_211532_add_language_id_to_categories_table', 3),
(42, '2025_11_26_162849_create_about_us_table', 4),
(43, '2025_11_26_202618_add_language_id_to_offer_products_table', 5),
(44, '2025_11_27_000000_remove_product_id_foreign_from_carts_table', 6);

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
  `language_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
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
(112, 1, '5279', 'pending', 'pending', 'cod', 281, 0, 281, 5, NULL, 0, NULL, '2025-11-25 19:31:40', NULL, '2025-11-25 19:31:40', '2025-11-25 19:31:40', 'Mash5'),
(113, 2, '5280', 'pending', 'pending', 'cod', 2581.2, 0, 2581.2, 5, NULL, 0, NULL, '2025-11-25 20:02:03', NULL, '2025-11-25 20:02:03', '2025-11-25 20:02:03', 'Mash5'),
(114, 2, '5281', 'pending', 'pending', 'cod', 550, 0, 550, 5, NULL, 0, NULL, '2025-11-25 20:03:26', NULL, '2025-11-25 20:03:26', '2025-11-25 20:03:26', 'Mash5'),
(115, 2, '5282', 'pending', 'pending', 'cod', 1724, 0, 1724, 5, NULL, 0, NULL, '2025-11-25 20:04:26', NULL, '2025-11-25 20:04:26', '2025-11-25 20:04:26', 'Mash5'),
(116, 1, '5283', 'pending', 'pending', 'cod', 743, 0, 743, 5, NULL, 0, NULL, '2025-11-26 17:16:44', NULL, '2025-11-26 17:16:44', '2025-11-26 17:16:44', 'Mash5'),
(117, 1, '5284', 'pending', 'pending', 'cod', 1724, 0, 1724, 5, NULL, 0, NULL, '2025-11-26 17:17:24', NULL, '2025-11-26 17:17:24', '2025-11-26 17:17:24', 'Mash5'),
(118, 13, '5285', 'pending', 'received', 'cod', 2131.2, 0, 2131.2, 5, NULL, 0, NULL, '2025-11-26 17:28:32', NULL, '2025-11-26 17:28:32', '2025-11-27 01:19:58', 'Mash5'),
(119, 13, '5286', 'pending', 'pending', 'cod', 9999, 0, 9994, 5, NULL, 0, NULL, '2025-11-26 19:26:33', NULL, '2025-11-26 19:26:33', '2025-11-26 19:26:33', 'test01'),
(123, 13, '5287', 'pending', 'pending', 'cod', 600, 0, 595, 5, NULL, 0, NULL, '2025-11-27 01:29:31', NULL, '2025-11-27 01:29:31', '2025-11-27 01:29:31', 'test01');

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
(112, 112, 'Colorado Maddox Martinez', NULL, 'tusujyj@mailinator.com', '51234567', 'Voluptates explicabo', 'Occaecat voluptates', 'Sit reprehenderit qu', '22463', '2025-11-25 19:31:40', '2025-11-25 19:31:40'),
(113, 113, 'dsfds asdf', NULL, 'sdf@gmail.com', '51234567', 'sdf', 'sadf', 'sadf', '2312', '2025-11-25 20:02:03', '2025-11-25 20:02:03'),
(114, 114, 'dsf sdf', NULL, 'sdf@email.com', '51234567', 'sdfds', 'sdf', 'sdf', '12', '2025-11-25 20:03:26', '2025-11-25 20:03:26'),
(115, 115, 'asdf sadf', NULL, 'sdf@yahoo.com', '51234567', 'asdf', 'sdf', 'sdf', '324', '2025-11-25 20:04:26', '2025-11-25 20:04:26'),
(116, 116, 'Colorado Maddox Martinez', NULL, 'tusujyj@mailinator.com', '51234567', 'Voluptates explicabo', 'Occaecat voluptates', 'Sit reprehenderit qu', '22463', '2025-11-26 17:16:44', '2025-11-26 17:16:44'),
(117, 117, 'Colorado Maddox Martinez', NULL, 'tusujyj@mailinator.com', '51234567', 'Voluptates explicabo', 'Occaecat voluptates', 'Sit reprehenderit qu', '22463', '2025-11-26 17:17:24', '2025-11-26 17:17:24'),
(118, 118, 'sadf Martinez', NULL, 'tusujyj@mailinator.com', '51234567', 'Tempora architecto o', 'Harum est proident', 'Sit reprehenderit qu', '1217', '2025-11-26 17:28:32', '2025-11-26 17:28:32'),
(119, 119, 'Velit ut qui placeat Martinez', NULL, 'tusujyj@mailinator.com', '51234567', 'Tempora architecto o', 'Harum est proident', 'Sit reprehenderit qu', '1217', '2025-11-26 19:26:33', '2025-11-26 19:26:33'),
(123, 123, 'F Mia', NULL, 'farhadmia.cu@gmail.com', '51234567', 'Tempora architecto o', 'Harum est proident', 'Officiis unde blandi', '1217', '2025-11-27 01:29:31', '2025-11-27 01:29:31');

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
(161, 119, 42, NULL, NULL, 1, NULL, NULL, '2025-11-26 19:26:33', '2025-11-26 19:26:33'),
(162, 123, 44, NULL, NULL, 1, NULL, NULL, '2025-11-27 01:29:31', '2025-11-27 01:29:31');

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
  `language_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
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

INSERT INTO `products` (`id`, `language_id`, `category_id`, `product_name`, `slug`, `product_code`, `brand`, `product_type`, `product_version_type`, `short_description`, `description`, `additional_description`, `regular_price`, `discount_price`, `weight`, `weight_unit`, `status`, `product_image`, `created_at`, `updated_at`) VALUES
(39, 2, 6, 'غسول للبشرة العادية والجافة', 'ghsol-llbshr-alaaady-oalgaf', NULL, 'Allurdevine', 'featured', 'english', 'عالجي بشرتك بالملمس الحريري لمنظف الوجه الكريمي المصمم بخبرة لتنقية وتهدئة البشرة الجافة. يستهدف الأوساخ والمكياج والشوائب مع الحفاظ على حاجز رطوبة البشرة وتوازن درجة الحموضة.', '<p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">امنحي بشرتك بعض العناية التي تحتاجها مع غسول الوجه الكريمي المرطب من Allurdevine، المصمم خصيصًا لتجديد شباب البشرة الجافة والعاديه. يقوم هذا المنظف اللطيف بتقشير الوجه والرقبة بلطف لإزالة الأوساخ والمكياج من المسام مع توفير الترطيب في نفس الوقت.</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">&nbsp;النتائج؟ مظهر أكثر نضارة ونعومة وإشراقًا بشكل واضح.</span></p><p><span id=\"docs-internal-guid-d06c7a1b-7fff-b51b-28d4-293c4c002a1a\"><br></span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">يعتمد فيتامين E والصبار على آثارهما المتناغمه، ويعملان جنبًا إلى جنب للحفاظ على الرطوبة وتقليل الاحمرار وتهدئة التهاب الجلد. هذا المنظف غني أيضًا بالبيتين، وهو حمض أميني مرطب يشتهر بقدراته المرطبة التي توفر تأثيرًا ممتلئًا. معًا، تعمل هذه المكونات على استعادة إشراقتك، وتتركك ببشرة ناعمة وندية.</span></p>', '<p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">نوع البشرة: العاديه والجافه</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">مقاسات العبوه: 20 * 3.5 * 2.5 سم</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">وزن العبوة: 170 جرام</span></p><p><span id=\"docs-internal-guid-f6cc051b-7fff-db22-08ee-7a8b33f2b927\"></span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">حجم العبوه: 100 ملل</span></p>', 777, 750.569, NULL, 'kg', '1', 'uploads/product/300-69274aae24558-1764182702.png', '2025-11-26 18:45:02', '2025-11-27 01:32:47'),
(40, 2, 10, 'غسول للبشرة الدهنية', 'ghsol-llbshr-aldhny', NULL, 'Allurdevine', 'featured', 'english', 'هل تبحثين عن غسول وجه للبشرة الدهنية وله تأثير لطيف علي البشره؟ مثالي للبشرة المعرضة لحب الشباب، هذا المنظف المنعش للبشرة الدهنية يزيل الدهون الزائدة وخلايا الجلد الميتة والأوساخ من المسام دون تجريد البشرة من زيوتها الطبيعية.', '<p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 15pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">غسول للبشرة الدهنيه: هل تبحثين عن غسول وجه خال من اللمعان ومثالي للبشره المعرضه لحب الشباب؟ هذا الغسول المنعش للبشرة الدهنية يعمل على تنظيف خلايا الجلد من الشوائب من المسام دون تجريد البشرة من زيوتها.</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 15pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">غني بفيتامين </span><span style=\"font-size: 17.5pt; font-family: Arial, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">ھ</span><span style=\"font-size: 15pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: يتميز فيتامين </span><span style=\"font-size: 17.5pt; font-family: Arial, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">ھ</span><span style=\"font-size: 15pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> بخصائصه الغذائية والعلاجية، وهو أحد مضادات الأكسدة القوية التي تعمل على ترطيب البشرة وأصلاحها.</span></p><p><span id=\"docs-internal-guid-d4db3f2f-7fff-1a1f-cf02-42af65e1704f\"></span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 15pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">يحتوي أيضًا على مستحضر تجميل زوسترا مارينا : وهو مكوني يأتي من نبات بحري، هذا المستخلص النباتي المغذي يساعد البشرة علي الحفاظ علي الرطوبة.</span></p>', '<p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 15pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">غسول للبشرة الدهنيه: هل تبحثين عن غسول وجه خال من اللمعان ومثالي للبشره المعرضه لحب الشباب؟ هذا الغسول المنعش للبشرة الدهنية يعمل على تنظيف خلايا الجلد من الشوائب من المسام دون تجريد البشرة من زيوتها.</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 15pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">غني بفيتامين </span><span style=\"font-size: 17.5pt; font-family: Arial, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">ھ</span><span style=\"font-size: 15pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">: يتميز فيتامين </span><span style=\"font-size: 17.5pt; font-family: Arial, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">ھ</span><span style=\"font-size: 15pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"> بخصائصه الغذائية والعلاجية، وهو أحد مضادات الأكسدة القوية التي تعمل على ترطيب البشرة وأصلاحها.</span></p><p><span id=\"docs-internal-guid-d4db3f2f-7fff-1a1f-cf02-42af65e1704f\"></span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 15pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">يحتوي أيضًا على مستحضر تجميل زوسترا مارينا : وهو مكوني يأتي من نبات بحري، هذا المستخلص النباتي المغذي يساعد البشرة علي الحفاظ علي الرطوبة.</span></p>', 1200, 1000.999, NULL, 'kg', '1', 'uploads/product/300-69274b03ed6b1-1764182787.jpg', '2025-11-26 18:46:27', '2025-11-27 01:32:34'),
(41, 2, 10, 'غسول للبشرة الحساسة', 'ghsol-llbshr-alhsas', NULL, 'Allurdevine', 'featured', 'english', 'غلفي بشرتك بالملمس الحريري لمنظف الوجه اللطيف من Allurdevine، المصمم بخبرة لأنواع البشرة الأكثر حساسية. يمنح هذا المزيج الفريد بشرتك دفعة قوية، مما يجعلها تشعر بالانتعاش والنعومة والتوازن بعد غسلة واحدة.', '<p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">امنحي بشرتك العناية التي تحتاجها مع غسول الوجه المرطب من Allurdevine, المصمم لتجديد شباب البشرة, يقوم هذا الغسول بتقشير الوجه والرقبه لازاله الاوساخ و الشوائب من المسام مع توفير الترطيب اللازم والنتيجه بشرة اكثر نضاره و نعومه.</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">ستختبري التأثيرات العلاجية لفيتامين E عند استخدام الغسول الذي يحتوي علي احد العناصر الغذائيه الرائعة التي تعمل علي ترطيب البشرة وازاله اثار الاضرار البيئية, يعمل هذا المكون مع portulaca oleracea علي تحفيز تدفق الدم واصلاح الخلايا لتنعيم البشرة.</span></p><div><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"><br></span></div>', '<p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">نوع البشرة: الحساسة</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">مقاسات العبوه: 20 * 3.5 * 2.5 سم</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">وزن العبوة: 170 جرام</span></p><p><span id=\"docs-internal-guid-1f151613-7fff-3481-3e0e-b80515386ba5\"></span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">حجم العبوه: 100 ملل</span></p>', 1000, 900.999, NULL, 'kg', '1', 'uploads/product/300-69274b50675a9-1764182864.png', '2025-11-26 18:47:44', '2025-11-27 01:32:17'),
(42, 2, 6, 'وايبس مزيل مكياج', 'oaybs-mzyl-mkyag', NULL, 'Allurdevine', 'featured', 'english', 'مناديل فعالة لإزالة المكياج لجميع أنواع البشرة - مناديل مزيلة للمكياج خالية من الروائح والزيوت من Allurdevine، غنية بفيتامين E ومصممة خصيصًا لتكون لطيفة بما فيه الكفاية على مناطق العين الحساسة ومرتدي العدسات اللاصقة، هذه المناديل المبللة الطبيعية بالكامل لغسل الوجه وترطب البشرة. يغذي حتى البشرة الحساسة، ويتركها تبدو نظيفة ومنتعشة وحيوية.', '<p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">مناديل ازاله المكياج التي تنظف بشرتك وتغذيها وترطبها.</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">قد يصعب إزالة المكياج والأوساخ والشوائب الموجودة على وجهك، خاصة الماسكارا المقاومة للماء!</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">تعتبر مناديل الوجه المزيلة للمكياج من Allurdevine الطريقة الفعالة والمفيدة للغاية لإزالة الشوائب والمكياج العنيد المقاوم للماء.</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">معبأ بفيتامين E لتغذية وترطيب بشرتك، وبتركيبة لطيفة مصممة خصيصًا لمناطق العين الحساسة ولمستخدمي العدسات اللاصقة.</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">تم اختباره من قبل أطباء العيون وأطباء الجلد وهو لطيف بما يكفي ليكون بمثابة منظف يومي.</span></p><div><span style=\"font-size: 14pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"><br></span></div>', '<p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">نوع البشرة: الكل</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">مقاسات العبوه: 11.45 * 9.9 * 4.5 سم</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">وزن العبوة: 140 جرام</span></p><p dir=\"rtl\" style=\"margin-bottom: 0pt; margin-top: 0pt; line-height: 1.38;\"><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\">حجم العبوه:&nbsp; 25 منديل</span></p><div><span style=\"font-size: 14.5pt; font-family: Montserrat, sans-serif; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; font-variant-emoji: normal; vertical-align: baseline; white-space-collapse: preserve;\"><br></span></div>', 600, 499.999, NULL, 'kg', '1', 'uploads/product/300-69274b9fd9aa3-1764182943.png', '2025-11-26 18:49:03', '2025-11-27 01:32:02'),
(43, 1, 9, 'Foaming wash', 'foaming-wash', NULL, 'Allurdevine', 'featured', 'english', 'This foaming facial cleanser balances pH levels and features a built-in brush: Ready to revitalize your skin? With its integrated massage brush, this foaming cleanser penetrates your pores to remove imperfections and leaves your skin looking visibly brighter after just one wash.\r\n\r\nThis moisturizing cleanser doesn\'t strip your skin of its natural oils.', '<p><span style=\"font-weight: bolder; font-family: Arial, sans-serif; font-size: 20px; text-align: right; white-space-collapse: preserve;\">Elevate your skincare game with Allordivine Hydrating Foaming Facial Cleanser, expertly formulated to leave your skin visibly brighter after just one wash.\r\n\r\nAs you massage this light, refreshing foam onto your face and neck, it gently exfoliates and removes impurities without stripping your skin of its natural oil barrier. Say hello to clean, soft, and supple skin.\r\n\r\nExperience the therapeutic effects of Vitamin E, a powerful antioxidant that hydrates, repairs, and protects skin from environmental damage. It works in conjunction with Japanese honeysuckle extract, providing intense hydration and slowing the signs of aging.</span></p>', '<p><span style=\"font-weight: bolder; color: rgb(34, 38, 42); font-family: Arial, sans-serif; font-size: 18.6667px; text-align: right; white-space-collapse: preserve;\">Skin type: All\r\n\r\nPackage dimensions: 20 x 2.9 x 2.9 cm\r\n\r\nPackage weight: 150 grams\r\n\r\nPackage volume: 100 ml</span></p>', 10000, 9000, NULL, 'kg', '1', 'uploads/product/300-69274be539181-1764183013.png', '2025-11-26 18:50:13', '2025-11-26 18:50:13'),
(44, 1, 1, 'Micellar water', 'micellar-water', NULL, 'Allurdevine', 'featured', 'english', 'Ready for a refresh? This invigorating micellar water cleanses away makeup residue and excess oil while minimizing pores and evening out skin tone. It\'s also gentle on the skin, cleansing thoroughly without drying or irritating it.', '<p><span style=\"font-weight: bolder; font-family: Arial, sans-serif; font-size: 15.3333px; text-align: right; white-space-collapse: preserve;\">Rosefine Micellar Water deeply cleanses the skin and removes all traces of makeup from the pores of the face, eyes, and lips in one step. This micellar cleanser provides a superior feeling of cleanliness and freshness, restoring your skin\'s radiance and vitality. It does not cause redness or skin irritation during use.\r\n\r\nVitamin E and Aloe Vera work together to maintain hydration and reduce redness and inflammation. This formula also contains niacinamide, collagen, and triple antioxidant glycogen to provide your skin with ample moisture.\r\n\r\nMousseary water is made with simple, effective, and natural ingredients. All our products are approved by a team of expert dermatologists and are fragrance-free and alcohol-free. They are enriched with natural ingredients that leave the skin feeling soft and nourished.</span></p>', '<p><span style=\"font-weight: bolder; color: rgb(34, 38, 42); font-family: Arial, sans-serif; font-size: 18px; text-align: right; white-space-collapse: preserve;\">Skin type: All\r\n\r\nPackage dimensions: 13.97 * 6.5 * 6.5 cm\r\n\r\nPackage weight: 320 grams\r\n\r\nPackage volume: 250 ml</span></p>', 777, 600, NULL, 'kg', '1', 'uploads/product/300-69274c2d5bb29-1764183085.png', '2025-11-26 18:51:25', '2025-11-27 01:28:15'),
(45, 1, 1, 'Odysseus Rosa', 'odysseus-rosa', NULL, 'Allurdevine', 'featured', 'english', 'Non qui sed ut qui r', 'sdf', 'ad', 1000, 900, NULL, 'kg', '1', 'uploads/product/300-69274c4ec91aa-1764183118.jpg', '2025-11-26 18:51:58', '2025-11-27 01:28:02'),
(46, 1, 9, 'Debra Fuentes', 'debra-fuentes', NULL, 'Allurdevine', 'featured', 'english', 'Aut quidem voluptate', 'asdf', 'sdf', 931, 800, NULL, 'kg', '1', 'uploads/product/300-69274c76cebc3-1764183158.jpg', '2025-11-26 18:52:38', '2025-11-27 01:27:46');

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
(4, 'test01', 'fixed', 10.00, 10.00, 100, 2, 100, 0, '2026-01-08 00:00:00', 1, '2025-11-26 18:53:34', '2025-11-27 01:29:26');

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
(37, 13, 4, '2025-11-26 19:26:05', '2025-11-26 19:26:05', '2025-11-26 19:26:05'),
(38, 13, 4, '2025-11-27 01:29:26', '2025-11-27 01:29:26', '2025-11-27 01:29:26');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
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

INSERT INTO `reviews` (`id`, `language_id`, `name`, `photo`, `review_content`, `rating_point`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mobarok', 'uploads/review/150-68e9342542286-1760113701.png', 'Fresh, clean, and uplifting — just like a walk on the beach. The citrusy top notes hit first, followed by a subtle woody base that gives it depth. I love wearing this daily, especially in summer.', 5, '1', '2025-10-08 22:27:00', '2025-10-10 16:28:21'),
(2, 1, 'Mahi', 'uploads/review/150-68e93417bab1d-1760113687.png', 'I love wearing this daily, especially in summer. The only downside is the longevity; it fades after about 4–5 hours, so I reapply once midday', 4, '1', '2025-10-08 22:27:30', '2025-10-10 16:28:07'),
(3, 1, 'Kawser', 'uploads/review/150-68e934003f2d9-1760113664.png', 'Fresh, clean, and uplifting — just like a walk on the beach. The citrusy top notes hit first, followed by a subtle woody base that gives it depth. I love wearing this daily, especially in summer.', 5, '1', '2025-10-08 22:27:54', '2025-10-10 16:27:44');

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
('E4Xl0GehWqPh71yU7SJcTjszjlUBRf8U2l6jjXRO', NULL, '23.27.145.155', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWY3VURPbDdOQXZTOGN3OFNaZ1IzNUNsTUgzOEF5b1Mza3owczJEYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3LmZpbmFsbmFzaC5zb2Z0dmVuY2Vmc2QueHl6L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764207460),
('P8Fb9pX6kqFcb2xReBiPuxz0WSnAk3GsykPMIUVF', 1, '103.174.189.33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidXRobHBBYkNReEJsQm55ZHdaTW94V0pUSGNjZVp1NTU3QXV5dE9RTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vZmluYWxuYXNoLnNvZnR2ZW5jZWZzZC54eXovb2ZmZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1764208954),
('r2FCHwHfmBfPNxm0emKxb9CBs8KBQm8OV5ElziEb', NULL, '23.27.145.198', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHI2SmdGNGhFSkFyaHdVNEtXeGpIdTBTUzBJWnY5OXBaWWNiSzQ3RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vZmluYWxuYXNoLnNvZnR2ZW5jZWZzZC54eXovbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1764207479);

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
  `language_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
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

INSERT INTO `sliders` (`id`, `language_id`, `title`, `description`, `button_text`, `button_link`, `page_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Products Def e', 'Discover our premium skincare collection for radiant, healthy skin.', NULL, NULL, 'products', 1, '2025-10-08 13:07:31', '2025-11-22 16:29:26'),
(4, 1, 'Videos DEF', 'Where elegance meets passion in every drop', NULL, NULL, 'videos', 1, '2025-10-10 16:45:27', '2025-11-06 00:59:04'),
(6, 1, 'About us', NULL, NULL, NULL, 'about', 1, '2025-11-06 00:57:54', '2025-11-06 00:58:07'),
(7, 1, 'Contact Def', NULL, NULL, NULL, 'contact', 1, '2025-11-06 01:01:00', '2025-11-06 01:02:44'),
(8, 1, 'Details Def', NULL, NULL, NULL, 'product details', 1, '2025-11-06 01:01:27', '2025-11-06 01:01:27'),
(10, 1, 'profile info', 'Pro info', NULL, NULL, 'profile onfo', 1, '2025-11-09 13:31:12', '2025-11-09 13:31:12'),
(11, 1, 'Shopping cart', 'Cart', NULL, NULL, 'shoppping carts', 1, '2025-11-09 13:32:15', '2025-11-09 13:32:15'),
(12, 1, 'Checkout', 'checkout def', NULL, NULL, 'checkout', 1, '2025-11-09 13:32:57', '2025-11-09 13:32:57'),
(13, 1, 'wish list', 'Wish list Def', NULL, NULL, 'wish list', 1, '2025-11-09 13:33:52', '2025-11-09 13:33:52'),
(14, 1, 'Order History', 'History def', NULL, NULL, 'order  history', 1, '2025-11-09 13:34:56', '2025-11-09 13:34:56'),
(15, 1, 'change password', 'Change Paseword', NULL, NULL, 'checkout', 1, '2025-11-09 13:35:44', '2025-11-10 18:21:52'),
(16, 1, 'blog def', NULL, NULL, NULL, 'blog', 1, '2025-11-13 01:09:33', '2025-11-13 01:09:33'),
(17, 1, 'offers', NULL, NULL, NULL, 'offers', 1, '2025-11-20 15:44:07', '2025-11-20 15:44:07'),
(19, 2, 'Products Def', 'Products Def e', NULL, NULL, 'products', 1, '2025-11-22 16:33:27', '2025-11-22 16:33:27'),
(20, 2, 'Videos DEF', 'Videos DEF', NULL, NULL, 'videos', 1, '2025-11-22 16:34:22', '2025-11-22 16:34:22'),
(21, 2, 'About us', 'About us', NULL, NULL, 'about', 1, '2025-11-22 16:34:49', '2025-11-22 16:40:44'),
(22, 2, 'Contact Def', 'Contact Def', NULL, NULL, 'contact', 1, '2025-11-22 16:35:15', '2025-11-22 16:35:15'),
(23, 2, 'Details Def', 'Details Def', NULL, NULL, 'product details', 1, '2025-11-22 16:36:16', '2025-11-22 16:36:16'),
(24, 2, 'profile info', 'profile info', NULL, NULL, 'profile onfo', 1, '2025-11-22 16:37:22', '2025-11-22 16:37:22'),
(25, 2, 'Shopping cart', 'Shopping cart', NULL, NULL, 'shoppping carts', 1, '2025-11-22 16:37:42', '2025-11-22 16:37:42'),
(26, 2, 'Checkout', 'Checkout', NULL, NULL, 'checkout', 1, '2025-11-22 16:38:12', '2025-11-22 16:38:12'),
(27, 2, 'wish list', 'wish list', NULL, NULL, 'wish list', 1, '2025-11-22 16:38:34', '2025-11-22 16:38:34'),
(28, 2, 'Order History', 'Order History', NULL, NULL, 'order  history', 1, '2025-11-22 16:39:20', '2025-11-22 16:39:20'),
(29, 2, 'change password', 'change password', NULL, NULL, 'change password', 1, '2025-11-22 16:39:46', '2025-11-22 16:39:46'),
(30, 2, 'blog def', 'blog def', NULL, NULL, 'blog', 1, '2025-11-22 16:40:04', '2025-11-22 16:40:04'),
(31, 2, 'Offers', 'offers', NULL, NULL, 'offers', 1, '2025-11-22 16:40:35', '2025-11-27 01:49:48');

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
(32, 1, 'uploads/slider/300-692744e900ad6-1764181225.jpeg', '2025-11-26 18:20:25', '2025-11-26 18:20:25'),
(34, 4, 'uploads/slider/300-6927451389fdc-1764181267.jpeg', '2025-11-26 18:21:07', '2025-11-26 18:21:07'),
(35, 6, 'uploads/slider/300-69274527ec91e-1764181287.jpeg', '2025-11-26 18:21:27', '2025-11-26 18:21:27'),
(36, 7, 'uploads/slider/300-6927453882b48-1764181304.jpeg', '2025-11-26 18:21:44', '2025-11-26 18:21:44'),
(37, 8, 'uploads/slider/300-6927454680e15-1764181318.jpeg', '2025-11-26 18:21:58', '2025-11-26 18:21:58'),
(38, 10, 'uploads/slider/300-69274553c114d-1764181331.jpeg', '2025-11-26 18:22:11', '2025-11-26 18:22:11'),
(39, 11, 'uploads/slider/300-6927455ff040b-1764181343.jpeg', '2025-11-26 18:22:23', '2025-11-26 18:22:23'),
(40, 12, 'uploads/slider/300-6927457455e0f-1764181364.jpeg', '2025-11-26 18:22:44', '2025-11-26 18:22:44'),
(41, 31, 'uploads/slider/300-6927457f20cb6-1764181375.jpeg', '2025-11-26 18:22:55', '2025-11-26 18:22:55'),
(42, 13, 'uploads/slider/300-6927459264cc8-1764181394.jpeg', '2025-11-26 18:23:14', '2025-11-26 18:23:14'),
(43, 14, 'uploads/slider/300-692745a608678-1764181414.jpeg', '2025-11-26 18:23:34', '2025-11-26 18:23:34'),
(44, 16, 'uploads/slider/300-692745afa00f6-1764181423.jpeg', '2025-11-26 18:23:43', '2025-11-26 18:23:43'),
(45, 19, 'uploads/slider/300-692745ca07136-1764181450.jpeg', '2025-11-26 18:24:10', '2025-11-26 18:24:10'),
(46, 17, 'uploads/slider/300-692745db60439-1764181467.jpeg', '2025-11-26 18:24:27', '2025-11-26 18:24:27'),
(47, 15, 'uploads/slider/300-692745e43db9b-1764181476.jpeg', '2025-11-26 18:24:36', '2025-11-26 18:24:36'),
(48, 20, 'uploads/slider/300-692745f0e8462-1764181488.jpeg', '2025-11-26 18:24:48', '2025-11-26 18:24:48'),
(49, 21, 'uploads/slider/300-692745ff391cf-1764181503.jpeg', '2025-11-26 18:25:03', '2025-11-26 18:25:03'),
(50, 22, 'uploads/slider/300-6927460e30bc3-1764181518.jpeg', '2025-11-26 18:25:18', '2025-11-26 18:25:18'),
(51, 24, 'uploads/slider/300-692746194fa51-1764181529.jpeg', '2025-11-26 18:25:29', '2025-11-26 18:25:29'),
(52, 25, 'uploads/slider/300-6927462d63348-1764181549.jpeg', '2025-11-26 18:25:49', '2025-11-26 18:25:49'),
(53, 26, 'uploads/slider/300-69274638e7b76-1764181560.jpeg', '2025-11-26 18:26:00', '2025-11-26 18:26:00'),
(54, 27, 'uploads/slider/300-692746441d6d4-1764181572.jpeg', '2025-11-26 18:26:12', '2025-11-26 18:26:12'),
(55, 28, 'uploads/slider/300-6927464d79a36-1764181581.jpeg', '2025-11-26 18:26:21', '2025-11-26 18:26:21'),
(56, 29, 'uploads/slider/300-69274658444b2-1764181592.jpeg', '2025-11-26 18:26:32', '2025-11-26 18:26:32'),
(57, 30, 'uploads/slider/300-692746650aa99-1764181605.jpeg', '2025-11-26 18:26:45', '2025-11-26 18:26:45'),
(58, 23, 'uploads/slider/300-69274677e6370-1764181623.jpeg', '2025-11-26 18:27:03', '2025-11-26 18:27:03');

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
(1, 'SuperAdmin', NULL, 'superadmin@gmail.com', NULL, NULL, '$2y$12$qdcJLmzQ/t6P0b8wgRDP3uSR.w3SKKgIfCfv1.s31CnxcjQ0pQ56i', 'uploads/profilePhoto/150-68fa569aaa7d1-1761236634.png', 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-26 22:34:26', 0, 0, NULL, NULL, 'EJi3gb8AmkW0Oz8u2ggLZSD6XLsuSC7lNuVwhy1pVET9ldWssuBwP63S109e', '2025-10-08 13:03:04', '2025-11-26 22:34:26'),
(2, 'Ali', NULL, 'ali@gmail.com', NULL, NULL, '$2y$12$bUSZFgp4kYTFQVIsBCP3HeGtmxYt759Akj2WunILIWrsYYmw2ESRm', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-10-27 16:33:28', 0, 0, NULL, NULL, NULL, '2025-10-23 20:35:27', '2025-10-27 16:33:28'),
(3, 'kawser', NULL, 'kawsersoftvence@gmail.com', NULL, NULL, '$2y$12$oUfcJ3DNZeK3uhScrFpBDO2QmlOh7xUz1EdDAxoXVHQ.QKRVm5O9e', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-10-23 20:49:41', 0, 0, NULL, NULL, NULL, '2025-10-23 20:49:41', '2025-10-23 20:49:41'),
(4, 'kawsar ahmed', NULL, 'fl.kawsarahmed@gmail.com', NULL, NULL, '$2y$12$LGjt6BLPU2.JeMiFfpsgIOqY17HfFJjPkF4K5dXDpEIUByH4kYezy', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-10-23 20:53:02', 0, 0, NULL, NULL, NULL, '2025-10-23 20:52:43', '2025-10-23 20:53:02'),
(5, 'ali', NULL, 'alihosain@gmail.com', NULL, NULL, '$2y$12$FZa47HS9h7gvWObNWAS2LeD968aloaMpQgKOKgqL4AE742mgGuTqO', 'uploads/default.png', 'user', NULL, NULL, NULL, NULL, NULL, 'active', NULL, 1, 0, NULL, NULL, NULL, '2025-10-26 19:48:37', '2025-10-26 19:48:37'),
(6, 'mobarok', NULL, 'cesag86934@moondyal.com', NULL, NULL, '$2y$12$mbi2QheDn7mU9h4SDey3lOOD3KpFAV/2mR4xbwjPdzZ6NbEeF5c8O', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-21 17:40:32', 0, 0, NULL, NULL, NULL, '2025-11-21 17:40:13', '2025-11-21 17:40:32'),
(8, 'User', NULL, 'pesad37143@bipochub.com', NULL, NULL, '$2y$12$w3YqL4Xlkjdwew67yEE7CucFDgmqDu/J2B.NfF64.4aU0uDADbRTi', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-22 00:54:07', 0, 0, NULL, NULL, NULL, '2025-11-21 20:44:58', '2025-11-22 00:54:07'),
(9, 'miasoftvence@gmail.com', NULL, 'miasoftvence@gmail.com', NULL, NULL, '$2y$12$99siY9lEORN1JLckP9a5CetB4MZ9p9Bg6IP./Tpr2IIrMCDSkpb3K', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-21 22:01:45', 0, 0, NULL, NULL, NULL, '2025-11-21 22:00:43', '2025-11-21 22:01:45'),
(10, 'Mobarok', NULL, 'wipofe7049@moondyal.com', NULL, NULL, '$2y$12$cK02bmZZHPG7cJ2.1uC8celh4dYyWkoHeEoA6sTzjTHIf7NLRRPXC', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-22 17:40:41', 0, 0, NULL, NULL, NULL, '2025-11-22 17:40:24', '2025-11-22 17:40:41'),
(11, 'Mobarok', NULL, 'fokeya7602@moondyal.com', NULL, NULL, '$2y$12$VK0gXDkGOUJIaKCMqF87COPHe390GrMQnY0ZWAerG/OuUYKS1KR9i', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-22 21:55:44', 0, 0, NULL, NULL, NULL, '2025-11-22 21:55:44', '2025-11-22 21:55:44'),
(12, 'Mobarok', NULL, 'kavab98283@okcdeals.com', NULL, NULL, '$2y$12$n4PfHwEweSlcHkusmWv8iO1U1e/SgCo4bxzZ1vK9clJSdvktRMNaa', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-22 21:58:26', 0, 0, NULL, NULL, NULL, '2025-11-22 21:57:36', '2025-11-22 21:58:26'),
(13, 'farhadmia.cu@gmail.com', NULL, 'farhadmia.cu@gmail.com', NULL, NULL, '$2y$12$6TvrrjJ1F2uLQ9TRa26QOO1bmQoV5wgQcuGBv0juEUGP0imfMhRrO', NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '2025-11-26 19:13:19', 0, 0, NULL, NULL, NULL, '2025-11-26 17:26:16', '2025-11-26 19:13:19');

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
(5, 13, NULL, 'dsf', 5, '0', '2025-11-26 19:13:42', '2025-11-26 19:13:42'),
(6, 13, NULL, 'farhad', 5, '0', '2025-11-26 19:13:54', '2025-11-26 19:13:54'),
(7, 13, NULL, 'f', 5, '0', '2025-11-26 19:14:39', '2025-11-26 19:14:39'),
(8, 13, NULL, 'ssss', 4, '1', '2025-11-26 19:19:01', '2025-11-26 19:19:16'),
(9, 1, NULL, 'Great Products', 5, '0', '2025-11-26 19:38:08', '2025-11-26 19:38:08'),
(10, 1, NULL, 'Hello', 5, '0', '2025-11-26 19:39:24', '2025-11-26 19:39:24'),
(11, 1, NULL, 'asdas', 5, '0', '2025-11-26 19:41:19', '2025-11-26 19:41:19'),
(12, 1, NULL, 'Best product ever', 5, '0', '2025-11-26 19:42:31', '2025-11-26 19:42:31');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
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

INSERT INTO `videos` (`id`, `language_id`, `title`, `video_type`, `thumbnail`, `youtube_link`, `status`, `created_at`, `updated_at`) VALUES
(8, 1, 'Vitamin E', 'featured', 'uploads/video/300-6910511cdbaee-1762677020.jpeg', 'https://www.youtube.com/watch?v=8qIhcYs6We4', '1', '2025-11-09 15:30:20', '2025-11-10 14:56:22'),
(10, 1, 'Summer', 'featured', 'uploads/video/300-6927503179c4a-1764184113.jpeg', 'https://www.youtube.com/watch?v=k84WEyeEIhU', '1', '2025-11-09 15:33:32', '2025-11-26 19:08:33'),
(11, 1, 'Toner and micellar', 'featured', 'uploads/video/300-69275022adc6d-1764184098.jpeg', 'https://www.youtube.com/shorts/7Tt0HnjdDNg', '1', '2025-11-09 15:34:55', '2025-11-26 19:08:18'),
(12, 1, 'Eman Alhusaini', 'featured', 'uploads/video/300-6927ab82e0ee5-1764207490.jpeg', 'https://www.youtube.com/watch?v=hKwl19rstzk', '1', '2025-11-10 14:57:24', '2025-11-27 01:38:10'),
(13, 1, 'Daneeda', 'popular', 'uploads/video/300-6927aba605812-1764207526.jpeg', 'https://www.youtube.com/watch?v=k84WEyeEIhU', '1', '2025-11-10 15:00:26', '2025-11-27 01:39:13'),
(14, 1, 'Zeinab alalwan', 'popular', 'uploads/video/300-69274ff56f15b-1764184053.jpeg', 'https://www.youtube.com/watch?v=P2X-Hz-kp9I', '1', '2025-11-10 15:01:04', '2025-11-26 19:07:33'),
(15, 1, 'Hanadi Alkandari', 'popular', 'uploads/video/300-69274fe36b75c-1764184035.jpeg', 'https://www.youtube.com/watch?v=rd7-STYvoOs&t=60s', '1', '2025-11-10 15:01:44', '2025-11-26 19:07:15'),
(16, 2, 'هنادي الكندري', 'featured', 'uploads/video/300-69274fd1f3af8-1764184017.jpeg', 'https://www.youtube.com/watch?v=rd7-STYvoOs&t=60s', '1', '2025-11-22 17:16:06', '2025-11-26 19:06:57'),
(17, 2, 'دانيدا', 'popular', 'uploads/video/300-69274fc0d112f-1764184000.jpeg', 'https://youtu.be/OSPpOgwTT14?si=0WNqtstSzEB4rFey', '1', '2025-11-22 17:16:49', '2025-11-26 19:06:40'),
(18, 2, 'دانيدا', 'featured', 'uploads/video/300-69274facb917d-1764183980.jpeg', 'https://youtu.be/OSPpOgwTT14?si=0WNqtstSzEB4rFey', '1', '2025-11-22 17:18:09', '2025-11-26 19:06:20'),
(19, 2, 'صيف', 'popular', 'uploads/video/300-69274f9e5f25a-1764183966.jpeg', 'https://www.youtube.com/watch?v=k84WEyeEIhU', '1', '2025-11-22 17:18:44', '2025-11-26 19:06:06');

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
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_language_id_foreign` (`language_id`);

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
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`),
  ADD KEY `blogs_language_id_foreign` (`language_id`);

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
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_language_id_foreign` (`language_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `dynamic_pages_language_id_foreign` (`language_id`);

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
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_name_unique` (`name`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `offers_language_id_foreign` (`language_id`);

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
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_language_id_foreign` (`language_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_language_id_foreign` (`language_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `sliders_language_id_foreign` (`language_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_language_id_foreign` (`language_id`);

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
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banner_images`
--
ALTER TABLE `banner_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `image_galleries`
--
ALTER TABLE `image_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `invoice_settings`
--
ALTER TABLE `invoice_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `offer_products`
--
ALTER TABLE `offer_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `order_billing_infos`
--
ALTER TABLE `order_billing_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `order_item_details`
--
ALTER TABLE `order_item_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `promo_code_users`
--
ALTER TABLE `promo_code_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `sliders_images`
--
ALTER TABLE `sliders_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_reviews`
--
ALTER TABLE `user_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `banner_images`
--
ALTER TABLE `banner_images`
  ADD CONSTRAINT `banner_images_banner_id_foreign` FOREIGN KEY (`banner_id`) REFERENCES `banners` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `dynamic_pages`
--
ALTER TABLE `dynamic_pages`
  ADD CONSTRAINT `dynamic_pages_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON UPDATE CASCADE;

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
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON UPDATE CASCADE;

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
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `promo_code_users`
--
ALTER TABLE `promo_code_users`
  ADD CONSTRAINT `promo_code_users_promo_code_id_foreign` FOREIGN KEY (`promo_code_id`) REFERENCES `promo_codes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promo_code_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON UPDATE CASCADE;

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
-- Constraints for table `sliders`
--
ALTER TABLE `sliders`
  ADD CONSTRAINT `sliders_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON UPDATE CASCADE;

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
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON UPDATE CASCADE;

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
