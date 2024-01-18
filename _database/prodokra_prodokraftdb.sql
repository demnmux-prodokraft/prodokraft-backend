-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 18, 2024 at 02:27 PM
-- Server version: 10.6.16-MariaDB
-- PHP Version: 8.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prodokra_prodokraftdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'admin', '9876543210', 1, 'def.png', 'admin@gmail.com', NULL, '$2y$10$KBs3TIAduF5MSLdrkODQu.OujDqPmENhBdmsHv1/3.wTZtZgKURx.', 'HCbrfQRhynNyFsPdxA1OQuXDk9l1gNlPdSQ2QtZY9UHyWYiJa2JIhSB5uhP6', '2023-03-14 16:59:24', '2023-03-14 16:59:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `module_access` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(1, 1, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(20) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `banner_type` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `resource_type` varchar(191) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`) VALUES
(7, '2023-10-14-652a6fa1744c0.png', 'Main Section Banner', 1, '2023-08-28 04:38:01', '2023-10-14 16:18:51', 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/online-shop-banner-design-template-ced8d381ed48595c749de9949ff917ae_screen.jpg?ts=1600552562', 'product', 1),
(12, '2023-10-12-65283b63ef0e3.png', 'Main Banner', 1, '2023-10-12 13:01:01', '2023-11-04 16:18:42', 'CHCHCH', 'product', 1),
(13, '2023-10-12-65287f6abbbba.png', 'Footer Banner', 1, '2023-10-12 14:39:18', '2023-10-14 16:18:49', 'vjvjjkk', 'product', 1),
(14, '2023-10-12-65287cd572765.png', 'Footer Banner', 1, '2023-10-12 14:40:32', '2023-10-14 16:18:48', 'gjjgk', 'product', 1),
(18, '2023-11-04-65469fec880b3.png', 'Main Banner', 1, '2023-11-04 14:18:02', '2023-11-04 14:22:36', 'https://www.prodokraft.com/product/flirt-bomkai-silk-saree-DJgSoK', 'product', 4),
(19, '2023-11-04-6546baa00fd63.png', 'Main Banner', 1, '2023-11-04 16:11:57', '2023-11-04 16:18:44', 'https://www.prodokraft.com/product/whe-black-compassion-upcycled-fabric-and-repurposed-wood-earring-7bKZpY', 'product', 4);

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) DEFAULT NULL,
  `address_type` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip` int(10) UNSIGNED DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chanel', '2023-08-26-64e9f6594655d.png', 1, '2023-08-26 07:25:53', '2023-08-26 07:25:53'),
(2, 'Skiee', '2023-08-14-64da43a502383.png', 1, '2023-08-14 09:39:25', '2023-08-14 09:39:25'),
(3, 'Rolex', '2023-08-28-64ec89d5614c8.png', 1, '2023-08-28 06:19:41', '2023-08-28 06:19:41'),
(4, 'boyanika', '2023-10-17-652ed2cc20d09.png', 1, '2023-10-17 13:00:36', '2023-10-17 13:00:36'),
(5, 'Black Hill', '2023-10-17-652ee7d008f62.png', 1, '2023-10-17 14:30:16', '2023-10-17 14:30:16'),
(6, 'VerthPC', '2023-10-17-652eeaf9df1dd.png', 1, '2023-10-17 14:43:45', '2023-10-17 14:43:45'),
(7, 'COCO LENI', '2023-10-17-652ef17028e14.png', 1, '2023-10-17 15:11:20', '2023-10-17 15:11:20'),
(8, 'Okhai', '2023-10-17-652ef55b7c701.png', 1, '2023-10-17 15:28:03', '2023-10-17 15:28:03'),
(9, 'JOMPERS', '2023-11-10-654e024f5483a.png', 1, '2023-11-10 04:43:35', '2023-11-10 04:43:35');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '3', '2020-10-11 07:43:44', '2023-08-14 06:54:10'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"direction\":\"ltr\",\"code\":\"en\",\"status\":0,\"default\":false},{\"id\":2,\"name\":\"English\",\"direction\":\"ltr\",\"code\":\"in\",\"status\":1,\"default\":true}]', '2020-10-11 07:53:02', '2024-01-05 01:03:32'),
(3, 'mail_config', '{\"status\":0,\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}', '2020-10-12 10:29:18', '2021-07-06 12:32:01'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"environment\":\"sandbox\",\"store_id\":\"\",\"store_password\":\"\"}', '2020-11-09 08:36:51', '2022-12-03 06:13:58'),
(7, 'paypal', '{\"status\":\"0\",\"environment\":\"sandbox\",\"paypal_client_id\":\"\",\"paypal_secret\":\"\"}', '2020-11-09 08:51:39', '2022-12-03 06:13:58'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(10, 'company_phone', '', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'PRODOKRAFT', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2021-05-25-60ad1b313a9d4.png', NULL, '2021-05-25 21:43:45'),
(13, 'company_mobile_logo', '2021-02-20-6030c88c91911.png', NULL, '2021-02-20 14:30:04'),
(14, 'terms_condition', '<p>terms and conditions</p>', NULL, '2021-06-11 01:51:36'),
(15, 'about_us', '<p>this is about us page. hello and hi from about page description..</p>', NULL, '2021-06-11 01:42:53'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'help@prodokraft.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#a67c52\",\"secondary\":\"#000000\"}', '2020-10-11 13:53:02', '2023-10-14 12:25:01'),
(19, 'company_footer_logo', '2021-02-20-6030c8a02a5f9.png', NULL, '2021-02-20 14:30:24'),
(20, 'company_copyright_text', '© Prodokraft 2023. All rights reserved.', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2020-12-08 12:54:53'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2020-12-08 12:54:48'),
(23, 'company_fav_icon', '2021-03-02-603df1634614f.png', '2020-10-11 13:53:02', '2021-03-02 14:03:48'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'AAAAzU4ntcQ:APA91bHmeA15dQdL0sYfPFfCVqkSnDQ2e7BnlcsBcJVmfWmXJHQTwkdkBGh57yOBEXtuCzFjVTZfpY5kX_13XCWYBvbA1YhoPj8grofFMfHRsMZAi7DUsdRj256QPnAYnF8OJ-2mXyw0', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pen message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order con Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order pro Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order ouut Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order del Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 12:30:14'),
(33, 'sales_commission', '0', NULL, '2021-06-11 18:13:13'),
(34, 'seller_registration', '1', NULL, '2021-06-04 21:02:48'),
(35, 'pnc_language', '[\"en\",\"in\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<p>my privacy policy</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2021-07-06 11:09:07'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'single_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]', NULL, NULL),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '1', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'IN', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'sellerwise_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"environment\":\"sandbox\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, '2022-12-03 06:13:58'),
(59, 'forgot_password_verification', 'phone', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '10', NULL, NULL),
(62, 'flutterwave', '{\"status\":1,\"public_key\":\"\",\"secret_key\":\"\",\"hash\":\"\"}', NULL, NULL),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', NULL, NULL),
(64, 'announcement', '{\"status\":null,\"color\":null,\"text_color\":null,\"announcement\":null}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":0,\"site_key\":\"\",\"secret_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(67, 'seller_pos', '0', NULL, NULL),
(68, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(69, 'paytm', '{\"status\":0,\"environment\":\"sandbox\",\"paytm_merchant_key\":\"\",\"paytm_merchant_mid\":\"\",\"paytm_merchant_website\":\"\",\"paytm_refund_url\":\"\"}', NULL, '2022-12-03 06:13:58'),
(70, 'refund_day_limit', '0', NULL, NULL),
(71, 'business_mode', 'multi', NULL, NULL),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}', NULL, NULL),
(73, 'decimal_point_settings', '2', NULL, NULL),
(74, 'shop_address', 'Prodokraft', NULL, NULL),
(75, 'billing_input_by_customer', '1', NULL, NULL),
(76, 'wallet_status', '0', NULL, NULL),
(77, 'loyalty_point_status', '0', NULL, NULL),
(78, 'wallet_add_refund', '0', NULL, NULL),
(79, 'loyalty_point_exchange_rate', '0', NULL, NULL),
(80, 'loyalty_point_item_purchase_point', '0', NULL, NULL),
(81, 'loyalty_point_minimum_point', '0', NULL, NULL),
(82, 'minimum_order_limit', '1', NULL, NULL),
(83, 'product_brand', '1', NULL, NULL),
(84, 'digital_product', '1', NULL, NULL),
(85, 'delivery_boy_expected_delivery_date_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(86, 'order_canceled', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(87, 'timezone', 'UTC', NULL, NULL),
(88, 'default_location', '{\"lat\":null,\"lng\":null}', NULL, NULL),
(89, 'loader_gif', '2023-10-14-652ad5f469efc.png', NULL, NULL),
(90, 'twilio_sms', '{\"status\":\"1\",\"sid\":\"AC0c6cd45bafba0017db8e4a370fc69b2e\",\"messaging_service_sid\":\"AC0c6cd45bafba0017db8e4a370fc69b2e\",\"token\":\"6271a7c0900318d28d7a55d337dd9ab1\",\"from\":\"+18508135882\",\"otp_template\":\"Your otp is #OTP#\"}', '2023-12-23 13:08:46', '2023-12-23 13:08:46');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'physical',
  `digital_product_type` varchar(30) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `choices` text DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `variant` text DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 1,
  `slug` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `cart_group_id`, `product_id`, `product_type`, `digital_product_type`, `color`, `choices`, `variations`, `variant`, `quantity`, `price`, `tax`, `discount`, `slug`, `name`, `thumbnail`, `seller_id`, `seller_is`, `created_at`, `updated_at`, `shop_info`, `shipping_cost`, `shipping_type`) VALUES
(4, 10, '10-SWzGz-1703365992', 18, 'physical', NULL, '#FFFF00', '[]', '{\"color\":\"Yellow\"}', 'Yellow', 1, 3333, 0, 0, 'test-UEu59h', 'Test', '2023-12-23-658749b2e934f.png', 1, 'seller', '2023-12-23 15:43:12', '2023-12-23 15:43:12', 'demo shop', 0.00, 'order_wise'),
(15, 23, '23-OI7dl-1703566565', 10, 'physical', NULL, NULL, '[]', '[]', '', 1, 1600, 0, 0, 'floss-appetiser-platesspecial-offers-on-sets-of-1216-6DgNtH', 'Floss Appetiser Plates(Special Offers On Sets Of 12/16)', '2023-10-17-652ee9708e370.png', 1, 'seller', '2023-12-25 23:26:05', '2023-12-25 23:26:05', 'demo shop', 0.00, 'order_wise'),
(17, 6, '6-OhZra-1704448347', 14, 'physical', NULL, '#FFFF00', '[]', '{\"color\":\"Yellow\"}', 'Yellow', 1, 3999, 719.82, 1999.5, 'jumpers-men-white-embroidered-kurtas-WEjkCA', 'Jumpers Men White Embroidered Kurtas', '2023-11-10-654e06f428ad4.png', 1, 'seller', '2024-01-05 04:22:27', '2024-01-05 04:22:27', 'demo shop', 0.00, 'order_wise');

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_shippings`
--

INSERT INTO `cart_shippings` (`id`, `cart_group_id`, `shipping_method_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, '0-xNDpi-1693035665', 2, 5.00, '2023-08-26 02:11:58', '2023-08-26 02:11:58'),
(2, '2-AhEjc-1694435332', 2, 5.00, '2023-09-11 09:25:25', '2023-09-11 09:25:25');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`) VALUES
(1, 'Apparel', 'apparel', '2023-10-14-652b079bbc98f.png', 0, 0, '2023-09-11 09:19:34', '2023-11-02 01:22:19', 1, 0),
(2, 'Craft', 'craft', '2023-10-14-652b075d6c754.png', 0, 0, '2023-09-11 09:22:17', '2023-11-02 01:22:34', 1, 1),
(29, 'Decor', 'decor', '2023-10-12-652875243d24f.png', 0, 0, '2023-10-12 17:07:24', '2023-10-14 01:15:33', 1, 3),
(30, 'Artifacts', 'artifacts', '2023-10-13-6529916ced761.png', 0, 0, '2023-10-13 13:20:20', '2023-10-14 01:15:53', 1, 4),
(31, 'Pottery', 'pottery', '2023-10-14-652ad9a916a5a.png', 2, 1, '2023-10-14 12:40:49', '2023-10-14 12:40:49', 0, 1),
(32, 'Jewellery', 'jewellery', '2023-10-14-652ada85a225c.png', 2, 1, '2023-10-14 12:44:29', '2023-10-14 12:44:29', 0, 2),
(33, 'Candle', 'candle', '2023-10-14-652adafd69102.png', 2, 1, '2023-10-14 12:46:29', '2023-10-14 12:46:29', 0, 3),
(34, 'Soap', 'soap', '2023-10-14-652adb696c943.png', 2, 1, '2023-10-14 12:48:17', '2023-10-14 12:48:17', 0, 4),
(35, 'Ceramics', 'ceramics', '2023-10-14-652adb9298df9.png', 2, 1, '2023-10-14 12:48:58', '2023-10-14 12:48:58', 0, 5),
(36, 'Clothing', 'clothing', '2023-10-14-652adc9a28f47.png', 1, 1, '2023-10-14 12:53:22', '2023-10-14 12:53:22', 0, 1),
(37, 'Footwear', 'footwear', '2023-10-14-652add0ac9297.png', 1, 1, '2023-10-14 12:55:14', '2023-10-14 12:55:14', 0, 2),
(38, 'Accesories', 'accesories', '2023-10-14-652ade84e7fba.png', 1, 1, '2023-10-14 13:01:32', '2023-10-14 13:01:32', 0, 3),
(39, 'Bags', 'bags', '2023-10-14-652adf371eece.png', 1, 1, '2023-10-14 13:04:31', '2023-10-14 13:04:31', 0, 4),
(40, 'Shawl', 'shawl', '2023-10-14-652ae07f5f03f.png', 1, 1, '2023-10-14 13:09:59', '2023-10-14 13:09:59', 0, 5),
(41, 'Eyewear', 'eyewear', '2023-10-14-652afea68c90c.png', 2, 1, '2023-10-14 15:18:38', '2023-10-17 15:12:36', 0, 6),
(42, 'Watches', 'watches', '2023-10-14-652aff0c93a9c.png', 2, 1, '2023-10-14 15:20:20', '2023-10-14 15:20:20', 0, 7),
(43, 'Saree', 'saree', NULL, 36, 2, '2023-10-17 12:55:13', '2023-10-17 12:55:13', 0, NULL),
(44, '3 PIECE SALWAR SET', '3-piece-salwar-set', NULL, 36, 2, '2023-10-17 13:26:53', '2023-10-17 13:26:53', 0, NULL),
(45, 'Herbal', 'herbal', NULL, 34, 2, '2023-10-17 14:48:26', '2023-10-17 14:48:26', 0, NULL),
(46, 'Polaroid', 'polaroid', NULL, 41, 2, '2023-10-17 15:07:45', '2023-10-17 15:07:45', 0, NULL),
(47, 'Earring', 'earring', NULL, 32, 2, '2023-10-17 15:25:09', '2023-10-17 15:25:09', 0, NULL),
(48, 'KURTA', 'kurta', NULL, 36, 2, '2023-11-10 04:44:47', '2023-11-10 04:44:47', 0, 1),
(49, 'Curtains', 'curtains', '2024-01-10-659e9fce4ad78.png', 29, 1, '2024-01-10 08:16:54', '2024-01-10 08:16:54', 0, 1),
(50, 'POT', 'pot', '2024-01-10-659ea01917969.png', 30, 1, '2024-01-10 08:18:09', '2024-01-10 08:18:09', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_shipping_costs`
--

CREATE TABLE `category_shipping_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_shipping_costs`
--

INSERT INTO `category_shipping_costs` (`id`, `seller_id`, `category_id`, `cost`, `multiply_qty`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0.00, NULL, '2023-08-14 09:48:21', '2023-08-14 09:48:21'),
(2, 1, 2, 0.00, NULL, '2023-08-28 12:44:14', '2023-08-28 12:44:14'),
(3, 1, 3, 0.00, NULL, '2023-08-28 12:44:14', '2023-08-28 12:44:14'),
(4, 1, 4, 0.00, NULL, '2023-08-28 12:44:14', '2023-08-28 12:44:14'),
(5, 0, 1, 0.00, NULL, '2023-09-22 19:32:42', '2023-09-22 19:32:42'),
(6, 0, 2, 0.00, NULL, '2023-09-22 19:32:42', '2023-09-22 19:32:42'),
(7, 0, 29, 0.00, NULL, '2023-11-02 07:24:59', '2023-11-02 07:24:59'),
(8, 0, 30, 0.00, NULL, '2023-11-02 07:24:59', '2023-11-02 07:24:59'),
(9, 1, 29, 0.00, NULL, '2023-11-02 11:58:22', '2023-11-02 11:58:22'),
(10, 1, 30, 0.00, NULL, '2023-11-02 11:58:22', '2023-11-02 11:58:22');

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `message` text NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_admin` tinyint(1) DEFAULT NULL,
  `sent_by_delivery_man` tinyint(1) DEFAULT NULL,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_admin` tinyint(1) DEFAULT NULL,
  `seen_by_delivery_man` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `mobile_number` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(1, 'JosephLyday', 'no.reply.DidierLarsson@gmail.com', '84294279245', 'Giving comments via the feedback form.', 'Howdy-doody! prodokraft.com \r\n \r\nDid you know that it is possible to send business proposal approСЂriately and legitimately? We make available a new legitimate method of sending business offers through contact forms. You can locate these kinds of feedback forms on numerous webpages. \r\nWhen such business offers are sent, no personal data is employed, and messages are dispatched to forms specifically created to securely and safely receive messages and appeals. Feedback Forms make sure that messages won\'t be seen as junk, as they are considered essential. \r\nWe want you to trу our service without anу cost! \r\nWe shall deliver up to 50,000 messages to you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis offer is automatically generated. \r\nPlease use the contact details below to get in touch with us. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:feedbackform2019 \r\nWhatsApp  +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\n \r\nWe only use chat for communication.', 0, '0', '2023-09-19 11:17:14', '2023-09-19 11:17:14', NULL),
(2, 'PhilVaf', 'draikkimr976@gmail.com', '82476218922', 'Hello, i am write about your   prices', 'Ola, quería saber o seu prezo.', 0, '0', '2023-09-22 09:53:49', '2023-09-22 09:53:49', NULL),
(3, 'Mike Ralphs', 'mikeBouhLyhody@gmail.com', '83595796496', 'Improve local visibility for prodokraft.com', 'If you are looking to rank your local business on Google Maps in a specific area, this service is for you. \r\n \r\nGoogle Map Stacking is a highly effective technique for ranking your GMB within a specific mile radius. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/product/google-maps-pointers/ \r\n \r\nThanks and Regards \r\nMike Ralphs\r\n \r\n \r\nPS: Want a comprehensive local plan that covers everything? \r\nhttps://www.speed-seo.net/product/local-seo-bundle/', 0, '0', '2023-09-26 23:19:13', '2023-09-26 23:19:13', NULL),
(4, 'Mike Green', 'mikeAnaeme@gmail.com', '84127652514', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.org/affiliate-dashboard/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Green\r\n \r\nMonkey Digital', 0, '0', '2023-10-02 02:25:28', '2023-10-02 02:25:28', NULL),
(5, 'Libby Evans', 'libbyevans461@gmail.com', '204-444-4360', 'Accelerate Your Instagram Growth: Gain 400-1200 New Followers Monthly', 'Hi there,\r\n\r\nWe run an Instagram growth service, which increases your number of followers safely and practically. \r\n\r\nWe aim to gain you 400-1200+ real human followers per month, with all actions safe as they are made manually (no bots).\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nLet me know if you wish to see some of our previous work.\r\n\r\nKind Regards,\r\nLibby', 0, '0', '2023-10-06 04:31:56', '2023-10-06 04:31:56', NULL),
(6, 'Mike Salomon', 'mikeBeaubsisa@gmail.com', '88364964136', 'Domain Authority of your prodokraft.com', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Ahrefs Domain Rating \r\nhttps://www.monkeydigital.co/ahrefs-seo/ \r\n \r\nThanks and regards \r\nMike Salomon', 0, '0', '2023-10-09 20:37:15', '2023-10-09 20:37:15', NULL),
(7, 'PhilVaf', 'alvinbbm41@gmail.com', '88122327714', 'Hallo,   writing about your the price for reseller', 'Ողջույն, ես ուզում էի իմանալ ձեր գինը.', 0, '0', '2023-10-12 01:22:33', '2023-10-12 01:22:33', NULL),
(8, 'Mike King', 'mikeel@gmail.com', '88734495265', 'NEW: Semrush Backlinks', 'Hello \r\n \r\nThis is Mike King\r\n \r\nLet me show you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your prodokraft.com SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\n \r\nRegards \r\n \r\nMike King\r\n \r\nmike@strictlydigital.net', 0, '0', '2023-10-16 05:53:21', '2023-10-16 05:53:21', NULL),
(9, 'HRM Bah Mbi', 'hrhmbambi@gmail.com', '82535265779', 'Bulk Supply', 'Attn. Director, \r\n \r\nWe are interested in your products. Please contact us if your company can handle a bulk supply of your products to Cameroon. \r\nPlease send your reply to bahmbi3@aghemfondom.com \r\n \r\nHRM Bah Mbi', 0, '0', '2023-10-23 08:13:07', '2023-10-23 08:13:07', NULL),
(10, 'CharlesOppom', 'yasen.krasen.13+91588@mail.ru', '82557648367', 'Mfheidjwhfuh HUJUHGUJH djwidjwfhuefejjifeh NUHUUUhufhedjefheuhufheudhuwfhu', 'Nguheidjiwfefhei ijiwdwjurFEJDKWIJFEIF аоушвцшургаруш ШОРГПГОШРГРПГОГРГ iryuieoieifegjejj bvncehfedjiehfu prodokraft.com', 0, '0', '2023-10-25 05:53:38', '2023-10-25 05:53:38', NULL),
(11, 'Mike Carey', 'mikeBouhLyhody@gmail.com', '86378969662', 'Improve local visibility for prodokraft.com', 'If you are looking to rank your local business on Google Maps in a specific area, this service is for you. \r\n \r\nGoogle Map Stacking is a highly effective technique for ranking your GMB within a specific mile radius. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/product/google-maps-pointers/ \r\n \r\nThanks and Regards \r\nMike Carey\r\n \r\n \r\nPS: Want a comprehensive local plan that covers everything? \r\nhttps://www.speed-seo.net/product/local-seo-bundle/', 0, '0', '2023-10-25 18:38:27', '2023-10-25 18:38:27', NULL),
(12, 'Walterimite', 'skyemdv@gmail.com', '82399922867', 'How to make money from email newsletters from $30,000 per month', 'Guaranteed income from email newsletters over $30,000 per month http://marketing-56543514.yowatashiworld.com/offer?30611', 0, '0', '2023-10-30 03:17:34', '2023-10-30 03:17:34', NULL),
(13, 'Walterimite', 'skyemdv@gmail.com', '84631167557', 'How to make money from email newsletters from $30,000 per month', 'Guaranteed income from email newsletters over $30,000 per month http://marketing-56543514.yowatashiworld.com/offer?30611', 0, '0', '2023-10-30 03:17:38', '2023-10-30 03:17:38', NULL),
(14, 'Walterimite', 'skyemdv@gmail.com', '83848378939', 'How to make money from email newsletters from $30,000 per month', 'Guaranteed income from email newsletters over $30,000 per month http://marketing-56543514.yowatashiworld.com/offer?30611', 0, '0', '2023-10-30 03:17:45', '2023-10-30 03:17:45', NULL),
(15, 'Mike Austin', 'mikeAnaeme@gmail.com', '87161533396', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.org/affiliate-dashboard/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Austin\r\n \r\nMonkey Digital', 0, '0', '2023-11-04 00:50:08', '2023-11-04 00:50:08', NULL),
(16, 'Mike Francis', 'mikeBouhLyhody@gmail.com', '88514668314', 'FREE fast ranks for prodokraft.com', 'Hi there \r\n \r\nJust checked your prodokraft.com baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\n \r\nRegards \r\nMike Francis\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', 0, '0', '2023-11-04 12:13:21', '2023-11-04 12:13:21', NULL),
(17, 'Mike Oldridge', 'peterkere@gmail.com', '83252226166', 'Whitehat SEO for prodokraft.com', 'Hi there \r\n \r\nI have just verified your SEO on  prodokraft.com for its SEO metrics and saw that your website could use a boost. \r\n \r\nWe will enhance your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\n \r\nRegards \r\nMike Oldridge\r\nDigital X SEO Experts', 0, '0', '2023-11-08 10:53:43', '2023-11-08 10:53:43', NULL),
(18, 'MaryskaEr8943', 'maryskaFlougs2319@gmail.com', '81196792396', 'application for click ReCaptcha-3 captcha', 'XEvil 6.0 automatically solve most kind of captchas, \r\nIncluding such type of captchas: ReCaptcha v.2, ReCaptcha v.3, Hotmail (Microsoft), Google captcha, Solve Media, BitcoinFaucet, Steam, +12k \r\n+ hCaptcha, ArkoseLabs FunCaptcha supported in new XEvil 6.0! \r\n \r\n1.) Fast, easy, precisionly \r\nXEvil is the fastest captcha killer in the world. Its has no solving limits, no threads number limits \r\nyou can solve even 1.000.000.000 captchas per day and it will cost 0 (ZERO) USD! Just buy license for 59 USD and all! \r\n \r\n2.) Several APIs support \r\nXEvil supports more than 6 different, worldwide known API: 2Captcha, anti-captchas.com (antigate), RuCaptcha, DeathByCaptcha, etc. \r\njust send your captcha via HTTP request, as you can send into any of that service - and XEvil will solve your captcha! \r\nSo, XEvil is compatible with hundreds of applications for SEO/SMM/password recovery/parsing/posting/clicking/cryptocurrency/etc. \r\n \r\n3.) Useful support and manuals \r\nAfter purchase, you got access to a private tech.support forum, Wiki, Skype/Telegram online support \r\nDevelopers will train XEvil to your type of captcha for FREE and very fast - just send them examples \r\n \r\n4.) How to get free trial use of XEvil full version? \r\n- Try to search in Google \"Home of XEvil\" \r\n- you will find IPs with opened port 80 of XEvil users (click on any IP to ensure) \r\n- try to send your captcha via 2captcha API ino one of that IPs \r\n- if you got BAD KEY error, just tru another IP \r\n- enjoy! :) \r\n- (its not work for hCaptcha!) \r\n \r\nWARNING: Free XEvil DEMO does NOT support ReCaptcha, hCaptcha and most other types of captcha! \r\n \r\nhttp://XEvil.Net/', 0, '0', '2023-11-10 03:56:47', '2023-11-10 03:56:47', NULL),
(19, 'PhilVaf', 'septon36giannixi@gmail.com', '87329915227', 'Aloha, i writing about   the price for reseller', 'Szia, meg akartam tudni az árát.', 0, '0', '2023-11-11 04:45:39', '2023-11-11 04:45:39', NULL),
(20, 'Mike Francis', 'mikeel@gmail.com', '87594388974', 'NEW: Semrush Backlinks', 'Hi \r\n \r\nThis is Mike Francis\r\n \r\nLet me present you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your prodokraft.com SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\n \r\nRegards \r\n \r\nMike Francis\r\n \r\nmike@strictlydigital.net', 0, '0', '2023-11-13 06:56:32', '2023-11-13 06:56:32', NULL),
(21, 'ShawnWhila', 'katana01@hotmail.de', '88888414854', 'SEXY GIRLS IN YOUR CITY ARE LOOKING FOR DATING', 'The best women for sex in your town http://sex-2968.terratm.com/questionnaire-322', 0, '0', '2023-11-18 06:50:45', '2023-11-18 06:50:45', NULL),
(22, 'ShawnWhila', 'katana01@hotmail.de', '86654175128', 'SEXY GIRLS IN YOUR CITY ARE LOOKING FOR DATING', 'The best women for sex in your town http://sex-2968.terratm.com/questionnaire-322', 0, '0', '2023-11-18 06:50:48', '2023-11-18 06:50:48', NULL),
(23, 'ShawnWhila', 'katana01@hotmail.de', '88164863817', 'SEXY GIRLS IN YOUR CITY ARE LOOKING FOR DATING', 'The best women for sex in your town http://sex-2968.terratm.com/questionnaire-322', 0, '0', '2023-11-18 06:50:52', '2023-11-18 06:50:52', NULL),
(24, 'ShawnWhila', 'katana01@hotmail.de', '83396337367', 'SEXY GIRLS IN YOUR CITY ARE LOOKING FOR DATING', 'The best women for sex in your town http://sex-2968.terratm.com/questionnaire-322', 0, '0', '2023-11-18 06:50:56', '2023-11-18 06:50:56', NULL),
(25, 'Terrypop', 'briand92@hotmail.com', '85382623854', 'Take the survey for a generous reward', 'Your opinion is important to us, so we are ready to pay up to $5000 - http://take-survey-51.hindisa.xyz/page-28', 0, '0', '2023-11-19 05:43:42', '2023-11-19 05:43:42', NULL),
(26, 'Terrypop', 'briand92@hotmail.com', '85898124397', 'Take the survey for a generous reward', 'Your opinion is important to us, so we are ready to pay up to $5000 - http://take-survey-51.hindisa.xyz/page-28', 0, '0', '2023-11-19 05:43:46', '2023-11-19 05:43:46', NULL),
(27, 'Terrypop', 'briand92@hotmail.com', '83533547474', 'Take the survey for a generous reward', 'Your opinion is important to us, so we are ready to pay up to $5000 - http://take-survey-51.hindisa.xyz/page-28', 0, '0', '2023-11-19 05:43:49', '2023-11-19 05:43:49', NULL),
(28, 'Terrypop', 'briand92@hotmail.com', '86781694924', 'Take the survey for a generous reward', 'Your opinion is important to us, so we are ready to pay up to $5000 - http://take-survey-51.hindisa.xyz/page-28', 0, '0', '2023-11-19 05:43:53', '2023-11-19 05:43:53', NULL),
(29, 'Mike Turner', 'mikeBouhLyhody@gmail.com', '87382924598', 'Improve local visibility for prodokraft.com', 'If you are looking to rank your local business on Google Maps in a specific area, this service is for you. \r\n \r\nGoogle Map Stacking is a highly effective technique for ranking your GMB within a specific mile radius. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/product/google-maps-pointers/ \r\n \r\nThanks and Regards \r\nMike Turner\r\n \r\n \r\nPS: Want a comprehensive local plan that covers everything? \r\nhttps://www.speed-seo.net/product/local-seo-bundle/', 0, '0', '2023-11-22 22:36:17', '2023-11-22 22:36:17', NULL),
(30, 'WilmerDib', 'franziscool@gmail.com', '88121636495', 'Make Your Money Work for You: Earnings on Investments from $9000 Daily', 'Investing Magic: Earnings on Investments Starting at Just $9000 https://marketplacebest888.sell.app/product/what-experts-are-silent-about-or-top-17-cryptocurrencies-that-will-soon-fly-to-the-moon?6344917', 0, '0', '2023-11-23 03:08:43', '2023-11-23 03:08:43', NULL),
(31, 'WilmerDib', 'franziscool@gmail.com', '85813273739', 'Make Your Money Work for You: Earnings on Investments from $9000 Daily', 'Investing Magic: Earnings on Investments Starting at Just $9000 https://marketplacebest888.sell.app/product/what-experts-are-silent-about-or-top-17-cryptocurrencies-that-will-soon-fly-to-the-moon?6344917', 0, '0', '2023-11-23 03:08:46', '2023-11-23 03:08:46', NULL),
(32, 'WilmerDib', 'franziscool@gmail.com', '88895929848', 'Make Your Money Work for You: Earnings on Investments from $9000 Daily', 'Investing Magic: Earnings on Investments Starting at Just $9000 https://marketplacebest888.sell.app/product/what-experts-are-silent-about-or-top-17-cryptocurrencies-that-will-soon-fly-to-the-moon?6344917', 0, '0', '2023-11-23 03:08:54', '2023-11-23 03:08:54', NULL),
(33, 'Pitroda Satyan', 'projectdept@kanzalshamsprojectmgt.com', '83175999826', 'LOAN INVESTMENT PROGRAM', 'Greetings, \r\n \r\nAm glad to connect with you, My name is Pitroda Satyan G, am an investment consultant with KANZ ALSHAMS PROJECT CONSULTANT, I have been mandated by the company to source for investment opportunities and companies seeking for funding, business loans, for its project(s). Do you have any investment or project that is seeking for capital to fund it? \r\n \r\nOur Investments financing focus is on: \r\n \r\nSeed Capital, Early-Stage, Start-Up Ventures, , Brokerage, Private Finance, Renewable Energy Project, Commercial Real Estate, Blockchain, Technology, Telecommunication, Infrastructure, Agriculture, Animal Breeding, Hospitality, Healthcare, Oil/Gas/Refinery. Application reserved for business executives and companies with proven business records in search of funding for expansion or forcapital investments.. \r\n \r\nKindly contact me for further details. \r\n \r\nawait your return e.mail soonest. \r\n \r\nRegards \r\n \r\nDr. Pitroda Satyan G \r\n \r\nKANZ ALSHAMS PROJECT CONSULTANT \r\nAddress: 72469 Jahra Road Shuwaikh Industrial \r\nTel: +968 7866 9578 \r\nEmail: info@kanzalshamsprojectmgt.com', 0, '0', '2023-11-27 21:21:53', '2023-11-27 21:21:53', NULL),
(34, 'ManuelPef', 'carlisleshane@hotmail.com', '81539285782', 'LinkBoost Pro: Elevate, Dominate, Conquer Google\'s Front Page', 'Rise to the Top: 1500 Backlinks, 1 Month, SEO Supremacy https://marketplacebest888.sell.app/product/linkboost-pro-1500-high-quality-backlinks-with-da-50-80?92730309', 0, '0', '2023-11-27 23:56:19', '2023-11-27 23:56:19', NULL),
(35, 'ManuelPef', 'carlisleshane@hotmail.com', '83732666165', 'LinkBoost Pro: Elevate, Dominate, Conquer Google\'s Front Page', 'Rise to the Top: 1500 Backlinks, 1 Month, SEO Supremacy https://marketplacebest888.sell.app/product/linkboost-pro-1500-high-quality-backlinks-with-da-50-80?92730309', 0, '0', '2023-11-27 23:56:23', '2023-11-27 23:56:23', NULL),
(36, 'ManuelPef', 'carlisleshane@hotmail.com', '83419936811', 'LinkBoost Pro: Elevate, Dominate, Conquer Google\'s Front Page', 'Rise to the Top: 1500 Backlinks, 1 Month, SEO Supremacy https://marketplacebest888.sell.app/product/linkboost-pro-1500-high-quality-backlinks-with-da-50-80?92730309', 0, '0', '2023-11-27 23:56:27', '2023-11-27 23:56:27', NULL),
(37, 'ManuelPef', 'carlisleshane@hotmail.com', '88877811159', 'LinkBoost Pro: Elevate, Dominate, Conquer Google\'s Front Page', 'Rise to the Top: 1500 Backlinks, 1 Month, SEO Supremacy https://marketplacebest888.sell.app/product/linkboost-pro-1500-high-quality-backlinks-with-da-50-80?92730309', 0, '0', '2023-11-27 23:56:31', '2023-11-27 23:56:31', NULL),
(38, 'Mike Gilbert', 'mikeBouhLyhody@gmail.com', '85942267419', 'FREE fast ranks for prodokraft.com', 'Hi there \r\n \r\nJust checked your prodokraft.com baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\n \r\nRegards \r\nMike Gilbert\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', 0, '0', '2023-11-28 10:29:40', '2023-11-28 10:29:40', NULL),
(39, 'Mike Nash', 'mikeAnaeme@gmail.com', '87615658728', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.org/affiliate-dashboard/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Nash\r\n \r\nMonkey Digital', 0, '0', '2023-12-02 06:12:17', '2023-12-02 06:12:17', NULL),
(40, 'Mike Porter', 'mikeBeaubsisa@gmail.com', '83488119861', 'Domain Authority of your prodokraft.com', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Ahrefs Domain Rating \r\nhttps://www.monkeydigital.co/ahrefs-seo/ \r\n \r\nThanks and regards \r\nMike Porter', 0, '0', '2023-12-09 15:54:28', '2023-12-09 15:54:28', NULL),
(41, 'Mike Longman', 'peterkere@gmail.com', '84168977221', 'Whitehat SEO for prodokraft.com', 'Hello \r\n \r\nI have just verified your SEO on  prodokraft.com for its SEO Trend and saw that your website could use a boost. \r\n \r\nWe will enhance your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\n \r\nRegards \r\nMike Longman\r\nDigital X SEO Experts', 0, '0', '2023-12-09 19:11:55', '2023-12-09 19:11:55', NULL),
(42, 'PhilVaf', 'septon36giannixi@gmail.com', '83214914327', 'Aloha, i am write about your the prices', 'Γεια σου, ήθελα να μάθω την τιμή σας.', 0, '0', '2023-12-10 16:31:46', '2023-12-10 16:31:46', NULL),
(43, 'BestFarmcop', 'iunskiygipertonik@gmail.com', '88143976712', 'Buy pills without restrictions. Money Back Guaranteed 30-day refunds.', 'TruePills, No prescription needed, Buy pills without restrictions. Money Back Guaranteed 30-day refunds. \r\n \r\n<b>Viagra</b> buy, discount! without prescription. \r\n<b>Cialis</b> buy, discount! without prescription. \r\nViagra Professional buy, discount! without prescription. \r\nCialis Professional buy, discount! without prescription. \r\n \r\nViagra Super Active buy, discount! without prescription. \r\nCialis Super Active buy, discount! without prescription. \r\n<b>Synthroid</b> buy, discount! without prescription. \r\n \r\nhttps://cutt.ly/4wP5bDuH \r\n \r\nhttp://bit.ly/3GAiEsU', 0, '0', '2023-12-10 21:44:12', '2023-12-10 21:44:12', NULL),
(44, 'Thomasowele', 'jaburke78@yahoo.com.au', '84445912725', 'THE EASY WAY TO $1,000,000: CREATE GAMES WITHOUT ANY SKILLS', 'GAME CREATION UNLEASHED: TURN NO SKILLS INTO A $1,000,000 VENTURE https://web.nfuonline.com/ClickModels/Log?emailid=7605&destinationUrl=https%3A%2F%2Fshoppy.gg%2Fproduct%2FsdrduvV%3F4765 \r\n \r\n \r\n \r\n \r\n \r\nd9hz3w8w6g5i6y8o \r\nf3sv7p8o8r0e7p1n \r\np3fy9d9r5z0e1k3h', 0, '0', '2023-12-10 22:09:45', '2023-12-10 22:09:45', NULL),
(45, 'Thomasowele', 'jaburke78@yahoo.com.au', '85431726173', 'THE EASY WAY TO $1,000,000: CREATE GAMES WITHOUT ANY SKILLS', 'GAME CREATION UNLEASHED: TURN NO SKILLS INTO A $1,000,000 VENTURE https://web.nfuonline.com/ClickModels/Log?emailid=7605&destinationUrl=https%3A%2F%2Fshoppy.gg%2Fproduct%2FsdrduvV%3F4765 \r\n \r\n \r\n \r\n \r\n \r\nd9hz3w8w6g5i6y8o \r\nf3sv7p8o8r0e7p1n \r\np3fy9d9r5z0e1k3h', 0, '0', '2023-12-10 22:09:49', '2023-12-10 22:09:49', NULL),
(46, 'Thomasowele', 'jaburke78@yahoo.com.au', '89548875135', 'THE EASY WAY TO $1,000,000: CREATE GAMES WITHOUT ANY SKILLS', 'GAME CREATION UNLEASHED: TURN NO SKILLS INTO A $1,000,000 VENTURE https://web.nfuonline.com/ClickModels/Log?emailid=7605&destinationUrl=https%3A%2F%2Fshoppy.gg%2Fproduct%2FsdrduvV%3F4765 \r\n \r\n \r\n \r\n \r\n \r\nd9hz3w8w6g5i6y8o \r\nf3sv7p8o8r0e7p1n \r\np3fy9d9r5z0e1k3h', 0, '0', '2023-12-10 22:09:53', '2023-12-10 22:09:53', NULL),
(47, 'Thomasowele', 'jaburke78@yahoo.com.au', '88466727686', 'THE EASY WAY TO $1,000,000: CREATE GAMES WITHOUT ANY SKILLS', 'GAME CREATION UNLEASHED: TURN NO SKILLS INTO A $1,000,000 VENTURE https://web.nfuonline.com/ClickModels/Log?emailid=7605&destinationUrl=https%3A%2F%2Fshoppy.gg%2Fproduct%2FsdrduvV%3F4765 \r\n \r\n \r\n \r\n \r\n \r\nd9hz3w8w6g5i6y8o \r\nf3sv7p8o8r0e7p1n \r\np3fy9d9r5z0e1k3h', 0, '0', '2023-12-10 22:09:57', '2023-12-10 22:09:57', NULL),
(48, 'Mike Black', 'mikeel@gmail.com', '82423273695', 'NEW: Semrush Backlinks', 'Good Day \r\n \r\nThis is Mike Black\r\n \r\nLet me show you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your prodokraft.com SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\n \r\nRegards \r\n \r\nMike Black\r\n \r\nmike@strictlydigital.net', 0, '0', '2023-12-11 07:55:31', '2023-12-11 07:55:31', NULL),
(49, 'TobiasSuh', 'no.reply.HelmuthJanssen@gmail.com', '89437551799', 'Are you on the lookout for a cost-effective and creative advertising option for a cost-effective price?', 'Good morning! prodokraft.com \r\n \r\nDid you know that it is possible to send commercial offer completely legit? We tender a secure and innovative way of sending requests through contact forms. Feedback forms like these can be seen on many websites. \r\nWhen such business offers are sent, no personal data is employed, and messages are dispatched to forms specifically created to securely and safely receive messages and appeals. As Feedback Forms messages are considered important, they will not be marked as spam. \r\nWe offer you to try our service for free. \r\nWe will dispatch up to 50,000 messages for you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis offer is automatically generated. \r\nPlease use the contact details below to get in touch with us. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:feedbackform2019 \r\nWhatsApp  +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\n \r\nWe only use chat for communication.', 0, '0', '2023-12-12 00:34:15', '2023-12-12 00:34:15', NULL),
(50, 'RobertVaf', 'lucido.leinteract@gmail.com', '86242436997', 'Aloha, i write about your   prices', 'Прывітанне, я хацеў даведацца Ваш прайс.', 0, '0', '2023-12-14 04:15:32', '2023-12-14 04:15:32', NULL),
(51, 'Jesuscunty', 'kaitlynsmith1288@yahoo.com', '81642218618', 'The $3 Per Minute Revolution: Autopilot Earnings Made Easy', 'The Future of Income: $3 Per Minute Flows Effortlessly on Autopilot https://shr.gg/flow?5600 \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nw4gg6g4s7g1h5v2r \r\ny2yj8r6t9b5z0z4m \r\ns1hb2h5m8u7x5z2o', 0, '0', '2023-12-15 10:09:09', '2023-12-15 10:09:09', NULL),
(52, 'Jesuscunty', 'kaitlynsmith1288@yahoo.com', '87473926819', 'The $3 Per Minute Revolution: Autopilot Earnings Made Easy', 'The Future of Income: $3 Per Minute Flows Effortlessly on Autopilot https://shr.gg/flow?5600 \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nw4gg6g4s7g1h5v2r \r\ny2yj8r6t9b5z0z4m \r\ns1hb2h5m8u7x5z2o', 0, '0', '2023-12-15 10:09:13', '2023-12-15 10:09:13', NULL),
(53, 'Jesuscunty', 'kaitlynsmith1288@yahoo.com', '84142259298', 'The $3 Per Minute Revolution: Autopilot Earnings Made Easy', 'The Future of Income: $3 Per Minute Flows Effortlessly on Autopilot https://shr.gg/flow?5600 \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nw4gg6g4s7g1h5v2r \r\ny2yj8r6t9b5z0z4m \r\ns1hb2h5m8u7x5z2o', 0, '0', '2023-12-15 10:09:17', '2023-12-15 10:09:17', NULL),
(54, 'Jesuscunty', 'kaitlynsmith1288@yahoo.com', '84969298668', 'The $3 Per Minute Revolution: Autopilot Earnings Made Easy', 'The Future of Income: $3 Per Minute Flows Effortlessly on Autopilot https://shr.gg/flow?5600 \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nw4gg6g4s7g1h5v2r \r\ny2yj8r6t9b5z0z4m \r\ns1hb2h5m8u7x5z2o', 0, '0', '2023-12-15 10:09:21', '2023-12-15 10:09:21', NULL),
(55, 'Mike White', 'mikeBouhLyhody@gmail.com', '82376766664', 'Improve local visibility for prodokraft.com', 'If you are looking to rank your local business on Google Maps in a specific area, this service is for you. \r\n \r\nGoogle Map Stacking is a highly effective technique for ranking your GMB within a specific mile radius. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/product/google-maps-pointers/ \r\n \r\nDecember SALE -30% coupon: XMS30 \r\n \r\nThanks and Regards \r\nMike Mike White\r\n \r\n \r\nPS: Want a comprehensive local plan that covers everything? \r\nhttps://www.speed-seo.net/product/local-seo-bundle/', 0, '0', '2023-12-19 00:54:27', '2023-12-19 00:54:27', NULL),
(56, 'Thomasrig', 'exchangeaibot@proton.me', '83157515895', 'Free USDT and NFT tokens - take part in the promotion from Trust Wallet!', 'Enter the Trust Wallet giveaway and win up to $750,000 and NFT vouchers! Just go to the official giveaway page at https://trustgiveawayse.com/trust connect your wallet and receive a guaranteed prize. Good luck!', 0, '0', '2023-12-19 05:35:59', '2023-12-19 05:35:59', NULL),
(57, 'Megan Atkinson', 'meganatkinson149@gmail.com', '03.59.53.63.85', 'Instagram Promotion: Grow your followers by 300-1000 each month', 'Hi there,\r\n\r\nWe run an Instagram growth service, which increases your number of followers both safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 300-1000+ followers per month.\r\n- Real, human followers: People follow you because they are interested in your business or niche.\r\n- Safe: All actions are made manually. We do not use any bots.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you are interested, and have any questions, reply back and we can discuss further.\r\n\r\nKind Regards,\r\nMegan', 0, '0', '2023-12-20 18:54:21', '2023-12-20 18:54:21', NULL),
(58, 'Mike Gimson', 'mikeAnaeme@gmail.com', '89555824712', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.org/affiliate-dashboard/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Gimson\r\n \r\nMonkey Digital', 0, '0', '2023-12-30 11:07:05', '2023-12-30 11:07:05', NULL),
(59, 'Mike Michaelson', 'mikeBouhLyhody@gmail.com', '81721559753', 'FREE fast ranks for prodokraft.com', 'Hi there \r\n \r\nJust checked your prodokraft.com baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\nRegards \r\nMike Michaelson\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', 0, '0', '2023-12-31 14:20:42', '2023-12-31 14:20:42', NULL),
(60, 'Abdul Rahman', 'mohamadabdulraman447@gmail.com', '85672663445', '02-01-2024', 'Hello, \r\n \r\nOur investors are seeking business opportunities and projects for possible funding and capital financing. We can discuss more. \r\n \r\nRegards \r\n \r\nMr Abdul Rahman \r\nA.N Brokers \r\nLondon \r\ninfo@alnasserbrokers.com \r\nMobile: +447741944775 \r\nWhatsApp: +447741944775', 0, '0', '2024-01-04 14:23:22', '2024-01-04 14:23:22', NULL),
(61, 'BestFarmcop', 'iunskiygipertonik@gmail.com', '83682218445', 'Buy pills without restrictions. Money Back Guaranteed 30-day refunds.', 'TruePills, No prescription needed, Buy pills without restrictions. Money Back Guaranteed 30-day refunds. \r\n \r\n<b>Viagra</b> buy, discount! without prescription. \r\n<b>Cialis</b> buy, discount! without prescription. \r\nViagra Professional buy, discount! without prescription. \r\nCialis Professional buy, discount! without prescription. \r\n \r\nViagra Super Active buy, discount! without prescription. \r\nCialis Super Active buy, discount! without prescription. \r\n<b>Synthroid</b> buy, discount! without prescription. \r\n \r\nhttps://cutt.ly/4wP5bDuH \r\n \r\nhttp://bit.ly/3GAiEsU', 0, '0', '2024-01-05 08:32:22', '2024-01-05 08:32:22', NULL),
(62, 'Mike Ward', 'peterkere@gmail.com', '82826727773', 'Whitehat SEO for prodokraft.com', 'Good Day \r\n \r\nI have just verified your SEO on  prodokraft.com for its SEO Trend and saw that your website could use a boost. \r\n \r\nWe will improve your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\n \r\nRegards \r\nMike Ward\r\n \r\nDigital X SEO Experts', 0, '0', '2024-01-07 07:07:57', '2024-01-07 07:07:57', NULL),
(63, 'Jacobs Louw', 'jacobs.louw@yahoo.com', '81723743178', 'Resolving your financial challenges. Let\'s connect', 'Attention: President/CEO \r\n \r\nAs a consultant catering to a diverse clientle, including wealthy families, private equity firms, hedge fund, venture capital firms, and other investors, l am here to address the specific financing concerns that may be causing stress. \r\n \r\nShare your financial challenges, and let\'s explore tailored solution together. Reach out to me at: jacobslouw48@gmail.com \r\n \r\nTo initiate a conversation about how we can collaborate to achieve your financial goals. \r\n \r\nThank you for considering this opportunity. \r\n \r\nWarm Regards. \r\n \r\nJacobs Louw', 0, '0', '2024-01-09 08:21:23', '2024-01-09 08:21:23', NULL),
(64, 'Kurtisphifs', 'maloney_taylor@yahoo.com', '86122361223', 'Epic Proportions: New Meme Token Predicted to Surge 300,000,000%', 'WATCH OUT THIS NEW MEME TOKEN COULD SURGE BY AN ASTOUNDING 300,000,000% http://coco-ranking.com/sky/rank5/rl_out.cgi?id=choki&url=https%3A%2F%2Ftelegra.ph%2Fch-01-09%3F10 \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\np3ms3w6l4t9w9e2y \r\nw8vq1s4h6q9e5h0p \r\nn8du0p9z6z8f6y3w', 0, '0', '2024-01-10 05:05:27', '2024-01-10 05:05:27', NULL),
(65, 'Kurtisphifs', 'maloney_taylor@yahoo.com', '81661818617', 'Epic Proportions: New Meme Token Predicted to Surge 300,000,000%', 'WATCH OUT THIS NEW MEME TOKEN COULD SURGE BY AN ASTOUNDING 300,000,000% http://coco-ranking.com/sky/rank5/rl_out.cgi?id=choki&url=https%3A%2F%2Ftelegra.ph%2Fch-01-09%3F10 \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\np3ms3w6l4t9w9e2y \r\nw8vq1s4h6q9e5h0p \r\nn8du0p9z6z8f6y3w', 0, '0', '2024-01-10 05:05:31', '2024-01-10 05:05:31', NULL),
(66, 'Kurtisphifs', 'maloney_taylor@yahoo.com', '82894181382', 'Epic Proportions: New Meme Token Predicted to Surge 300,000,000%', 'WATCH OUT THIS NEW MEME TOKEN COULD SURGE BY AN ASTOUNDING 300,000,000% http://coco-ranking.com/sky/rank5/rl_out.cgi?id=choki&url=https%3A%2F%2Ftelegra.ph%2Fch-01-09%3F10 \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\np3ms3w6l4t9w9e2y \r\nw8vq1s4h6q9e5h0p \r\nn8du0p9z6z8f6y3w', 0, '0', '2024-01-10 05:05:35', '2024-01-10 05:05:35', NULL),
(67, 'Kurtisphifs', 'maloney_taylor@yahoo.com', '82511714382', 'Epic Proportions: New Meme Token Predicted to Surge 300,000,000%', 'WATCH OUT THIS NEW MEME TOKEN COULD SURGE BY AN ASTOUNDING 300,000,000% http://coco-ranking.com/sky/rank5/rl_out.cgi?id=choki&url=https%3A%2F%2Ftelegra.ph%2Fch-01-09%3F10 \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\np3ms3w6l4t9w9e2y \r\nw8vq1s4h6q9e5h0p \r\nn8du0p9z6z8f6y3w', 0, '0', '2024-01-10 05:05:39', '2024-01-10 05:05:39', NULL),
(68, 'Mike Neal', 'mikeel@gmail.com', '88874747582', 'NEW: Semrush Backlinks', 'Good Day \r\n \r\nThis is Mike Neal\r\n \r\nLet me present you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your prodokraft.com SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\nRegards \r\nMike Neal\r\n \r\nmike@strictlydigital.net', 0, '0', '2024-01-12 18:01:11', '2024-01-12 18:01:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_type` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `terms` text NOT NULL DEFAULT 'Nan',
  `code` varchar(15) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_type`, `title`, `terms`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`, `limit`) VALUES
(1, 'discount_on_purchase', 'Welcome Offer', 'Nan', 'Welcometoprodok', '2023-12-26', '2024-01-31', 10.00, 10.00, 20.00, 'percentage', 1, '2023-12-26 01:11:50', '2023-12-26 01:11:50', 1),
(2, 'discount_on_purchase', 'Test', 'Test Terms', 'nyk7dzqbq6', '2024-01-04', '2024-01-28', 100.00, 100.00, 5.00, 'percentage', 1, '2024-01-03 13:07:08', '2024-01-03 13:07:08', 10);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'USD', '1', 1, NULL, '2021-06-27 13:39:37'),
(2, 'BDT', '৳', 'BDT', '84', 1, NULL, '2024-01-05 01:08:41'),
(3, 'Indian Rupi', '₹', 'INR', '1', 1, '2020-10-15 17:23:04', '2024-01-05 01:09:27'),
(4, 'Euro', '€', 'EUR', '100', 1, '2021-05-25 21:00:23', '2021-06-04 18:25:29'),
(5, 'YEN', '¥', 'JPY', '110', 1, '2021-06-10 22:08:31', '2021-06-26 14:21:10'),
(6, 'Ringgit', 'RM', 'MYR', '4.16', 1, '2021-07-03 11:08:33', '2021-07-03 11:10:37'),
(7, 'Rand', 'R', 'ZAR', '14.26', 1, '2021-07-03 11:12:38', '2021-07-03 11:12:42');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) DEFAULT NULL,
  `transaction_method` varchar(30) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_notifications`
--

CREATE TABLE `deliveryman_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_wallets`
--

CREATE TABLE `deliveryman_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `current_balance` decimal(50,2) NOT NULL DEFAULT 0.00,
  `cash_in_hand` decimal(50,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `total_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_country_codes`
--

CREATE TABLE `delivery_country_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_transactions`
--

CREATE TABLE `delivery_man_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `transaction_id` char(36) NOT NULL,
  `debit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `identity_number` varchar(30) DEFAULT NULL,
  `identity_type` varchar(50) DEFAULT NULL,
  `identity_image` varchar(191) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_online` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_zip_codes`
--

CREATE TABLE `delivery_zip_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zipcode` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contacts`
--

CREATE TABLE `emergency_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`, `product_id`, `deal_type`) VALUES
(1, 'Flash Deals', '2023-12-01', '2024-01-31', 0, 0, NULL, NULL, '2023-08-28-64ec8a3a7ac00.png', 'flash-deals', '2023-08-28 06:21:22', '2023-12-26 01:08:22', NULL, 'flash_deal'),
(2, 'Welcome Offer', '2024-01-26', '2024-01-31', 1, 0, NULL, NULL, '2023-12-26-658a74ba449b0.png', 'welcome-offer', '2023-12-26 01:07:46', '2023-12-26 01:07:56', NULL, 'flash_deal');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60),
(142, '2022_01_22_101601_change_cart_col_type', 61),
(143, '2022_01_23_031359_add_column_to_orders_table', 61),
(144, '2022_01_28_235054_add_status_to_admins_table', 61),
(145, '2022_02_01_214654_add_pos_status_to_sellers_table', 61),
(146, '2019_12_14_000001_create_personal_access_tokens_table', 62),
(147, '2022_02_11_225355_add_checked_to_orders_table', 62),
(148, '2022_02_14_114359_create_refund_requests_table', 62),
(149, '2022_02_14_115757_add_refund_request_to_order_details_table', 62),
(150, '2022_02_15_092604_add_order_details_id_to_transactions_table', 62),
(151, '2022_02_15_121410_create_refund_transactions_table', 62),
(152, '2022_02_24_091236_add_multiple_column_to_refund_requests_table', 62),
(153, '2022_02_24_103827_create_refund_statuses_table', 62),
(154, '2022_03_01_121420_add_refund_id_to_refund_transactions_table', 62),
(155, '2022_03_10_091943_add_priority_to_categories_table', 63),
(156, '2022_03_13_111914_create_shipping_types_table', 63),
(157, '2022_03_13_121514_create_category_shipping_costs_table', 63),
(158, '2022_03_14_074413_add_four_column_to_products_table', 63),
(159, '2022_03_15_105838_add_shipping_to_carts_table', 63),
(160, '2022_03_16_070327_add_shipping_type_to_orders_table', 63),
(161, '2022_03_17_070200_add_delivery_info_to_orders_table', 63),
(162, '2022_03_18_143339_add_shipping_type_to_carts_table', 63),
(163, '2022_04_06_020313_create_subscriptions_table', 64),
(164, '2022_04_12_233704_change_column_to_products_table', 64),
(165, '2022_04_19_095926_create_jobs_table', 64),
(166, '2022_05_12_104247_create_wallet_transactions_table', 65),
(167, '2022_05_12_104511_add_two_column_to_users_table', 65),
(168, '2022_05_14_063309_create_loyalty_point_transactions_table', 65),
(169, '2022_05_26_044016_add_user_type_to_password_resets_table', 65),
(170, '2022_04_15_235820_add_provider', 66),
(171, '2022_07_21_101659_add_code_to_products_table', 66),
(172, '2022_07_26_103744_add_notification_count_to_notifications_table', 66),
(173, '2022_07_31_031541_add_minimum_order_qty_to_products_table', 66),
(174, '2022_08_11_172839_add_product_type_and_digital_product_type_and_digital_file_ready_to_products', 67),
(175, '2022_08_11_173941_add_product_type_and_digital_product_type_and_digital_file_to_order_details', 67),
(176, '2022_08_20_094225_add_product_type_and_digital_product_type_and_digital_file_ready_to_carts_table', 67),
(177, '2022_10_04_160234_add_banking_columns_to_delivery_men_table', 68),
(178, '2022_10_04_161339_create_deliveryman_wallets_table', 68),
(179, '2022_10_04_184506_add_deliverymanid_column_to_withdraw_requests_table', 68),
(180, '2022_10_11_103011_add_deliverymans_columns_to_chattings_table', 68),
(181, '2022_10_11_144902_add_deliverman_id_cloumn_to_reviews_table', 68),
(182, '2022_10_17_114744_create_order_status_histories_table', 68),
(183, '2022_10_17_120840_create_order_expected_delivery_histories_table', 68),
(184, '2022_10_18_084245_add_deliveryman_charge_and_expected_delivery_date', 68),
(185, '2022_10_18_130938_create_delivery_zip_codes_table', 68),
(186, '2022_10_18_130956_create_delivery_country_codes_table', 68),
(187, '2022_10_20_164712_create_delivery_man_transactions_table', 68),
(188, '2022_10_27_145604_create_emergency_contacts_table', 68),
(189, '2022_10_29_182930_add_is_pause_cause_to_orders_table', 68),
(190, '2022_10_31_150604_add_address_phone_country_code_column_to_delivery_men_table', 68),
(191, '2022_11_05_185726_add_order_id_to_reviews_table', 68),
(192, '2022_11_07_190749_create_deliveryman_notifications_table', 68),
(193, '2022_11_08_132745_change_transaction_note_type_to_withdraw_requests_table', 68),
(194, '2022_11_10_193747_chenge_order_amount_seller_amount_admin_commission_delivery_charge_tax_toorder_transactions_table', 68);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `notification_count` int(11) NOT NULL DEFAULT 0,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('1ef7d25918ffd64f933ebe3a3ae73ba632fb141bf065efc286861de249162262f9797edaca952812', 6, 1, 'LaravelAuthApp', '[]', 0, '2023-12-24 09:48:24', '2023-12-24 09:48:24', '2024-12-24 15:18:24'),
('40f85f589435f939310a0a6be0d3da06e977f0feff4d62af76fa44aebc1ba22e15ded7437f19270a', 10, 1, 'LaravelAuthApp', '[]', 0, '2023-12-23 15:40:10', '2023-12-23 15:40:10', '2024-12-23 21:10:10'),
('4c76b33ec28e1926432b19661cbc63097b77c595217ac8c1acf5ab4653654ae372902d0c8114bd3e', 10, 1, 'LaravelAuthApp', '[]', 0, '2023-12-23 15:39:44', '2023-12-23 15:39:44', '2024-12-23 21:09:44'),
('5c8097302cf07682ee9432a59342d6a988e220ecb1dc5b4e56c88686cdad63cd675128dc261072dd', 23, 1, 'LaravelAuthApp', '[]', 0, '2023-12-24 08:53:17', '2023-12-24 08:53:17', '2024-12-24 14:23:17'),
('6450ecc03b3ef8c23601180966b3529a906990b4f655c52f120affca0d90cf3484921f69983773e1', 22, 1, 'LaravelAuthApp', '[]', 0, '2023-12-24 08:51:26', '2023-12-24 08:51:26', '2024-12-24 14:21:26'),
('71756dcb0b3045579182e1074f7ba55ebe88f0f246798cff59cd37524875c8bbe103b57ee064337d', 6, 1, 'LaravelAuthApp', '[]', 0, '2023-12-24 09:48:50', '2023-12-24 09:48:50', '2024-12-24 15:18:50'),
('7b310c3e56ef385494aad44e39d9d5048d4baf0e9b2440674d0250d5af984fcea47a2c470d535bdd', 23, 1, 'LaravelAuthApp', '[]', 0, '2023-12-24 08:54:32', '2023-12-24 08:54:32', '2024-12-24 14:24:32'),
('7cbcdea93f393b5748a9a0836fc05c5f5f85e16c0f07946d964b584193c54b7b945527c9bf940701', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-12-23 13:35:24', '2023-12-23 13:35:24', '2024-12-23 19:05:24'),
('a2c0360d80ad766b3665cfcfccf7b24622024a7df053250e99d8bbd3571816a0406525a038c5943a', 22, 1, 'LaravelAuthApp', '[]', 0, '2023-12-24 08:53:53', '2023-12-24 08:53:53', '2024-12-24 14:23:53'),
('cfd55b261226b7dc124669b2e46a3cbbc8f2ef33b712946ff7c4fe10ce0b561b7a03a7bd0588a83c', 21, 1, 'LaravelAuthApp', '[]', 0, '2023-12-23 13:49:16', '2023-12-23 13:49:16', '2024-12-23 19:19:16'),
('d256120e4337c4fd13593038aa726ccc784b2b7496e406915d6e0e6daf3ed097f5917f3fcc29f218', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-12-23 13:38:09', '2023-12-23 13:38:09', '2024-12-23 19:08:09');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`, `provider`) VALUES
(1, NULL, '6valley1678786101 Personal Access Client', 'KD5NyTJlJjSMSswnp8AOwiFI4ach72LJFbTUogsX', 'http://localhost', 1, 0, 0, '2023-08-16 09:45:28', '2023-08-16 09:45:28', NULL),
(2, NULL, '6valley1678786101 Password Grant Client', '0mxNIBaRvLP3gXdTF9prZZrU8HCveAgICLQlNYht', 'http://localhost', 0, 1, 0, '2023-08-16 09:45:28', '2023-08-16 09:45:28', 'users');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-08-16 09:45:28', '2023-08-16 09:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `customer_type` varchar(10) DEFAULT NULL,
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) DEFAULT NULL,
  `transaction_ref` varchar(30) DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `is_pause` varchar(20) NOT NULL DEFAULT '0',
  `cause` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `shipping_address_data` text DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `deliveryman_charge` double NOT NULL DEFAULT 0,
  `expected_delivery_date` date DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text DEFAULT NULL,
  `order_type` varchar(191) NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) DEFAULT NULL,
  `delivery_type` varchar(191) DEFAULT NULL,
  `delivery_service_name` varchar(191) DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `digital_file_after_sell` varchar(191) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_status` varchar(15) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_expected_delivery_histories`
--

CREATE TABLE `order_expected_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `expected_delivery_date` date NOT NULL,
  `cause` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status_histories`
--

CREATE TABLE `order_status_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `cause` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(50,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `delivery_charge` decimal(50,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `delivered_by` varchar(191) NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`identity`, `token`, `created_at`, `user_type`) VALUES
('7978730925', '6787', '2023-12-24 08:42:04', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_or_email_verifications`
--

INSERT INTO `phone_or_email_verifications` (`id`, `phone_or_email`, `token`, `created_at`, `updated_at`) VALUES
(1, 'jsaniya298@gmail.com', '2700', '2023-10-11 07:17:01', '2023-10-11 07:17:01'),
(2, 'jsaniya298@gmail.com', '2317', '2023-10-11 07:18:55', '2023-10-11 07:18:55'),
(3, 'saniyajain70241@gmail.com', '9657', '2023-10-11 07:22:50', '2023-10-11 07:22:50'),
(4, 'jsaniya298@gmail.com', '3944', '2023-10-11 07:23:22', '2023-10-11 07:23:22'),
(5, 'chutiyaji.swaraj@gmail.com', '7935', '2023-10-28 01:33:01', '2023-10-28 01:33:01'),
(6, 'Dmohanty.chintu@gmail.com', '5257', '2023-10-30 05:38:46', '2023-10-30 05:38:46'),
(7, 'chitaranjan7684@gmail.com', '6646', '2023-11-02 21:56:40', '2023-11-02 21:56:40'),
(8, '+918810625561', '6195', '2023-11-26 01:04:55', '2023-11-26 01:04:55'),
(9, 'demo@gmail.com', '8272', '2023-11-27 01:43:31', '2023-11-27 01:43:31'),
(10, 'jsaniya298@gmail.com', '8807', '2023-11-27 01:44:26', '2023-11-27 01:44:26'),
(11, 'jsaniya298@gmail.com', '9507', '2023-11-27 01:46:33', '2023-11-27 01:46:33'),
(12, 'jsaniya298@gmail.com', '1976', '2023-11-27 01:47:13', '2023-11-27 01:47:13'),
(13, 'demo@gmail.com', '7574', '2023-12-14 01:46:27', '2023-12-14 01:46:27'),
(14, '+918810625566', '2384', '2023-12-21 11:00:40', '2023-12-21 11:00:40'),
(15, '+913453453452', '6956', '2023-12-23 12:50:12', '2023-12-23 12:50:12'),
(16, '+918595873415', '8892', '2023-12-23 13:03:07', '2023-12-23 13:03:07'),
(17, '+911234567898', '4166', '2023-12-23 13:11:29', '2023-12-23 13:11:29'),
(18, '+913343236523', '9255', '2023-12-23 13:28:35', '2023-12-23 13:28:35'),
(19, '+911234567890', '9766', '2023-12-23 13:30:12', '2023-12-23 13:30:12'),
(20, '+918595673415', '2768', '2023-12-23 13:31:35', '2023-12-23 13:31:35'),
(22, '+911234567890', '5146', '2023-12-23 13:43:58', '2023-12-23 13:43:58'),
(23, '+912222222822', '1280', '2023-12-23 13:45:37', '2023-12-23 13:45:37'),
(24, '+912262222822', '7357', '2023-12-23 13:46:53', '2023-12-23 13:46:53'),
(30, 'chutiyaji.swaraj@gmail.com', '7409', '2023-12-25 02:54:05', '2023-12-25 02:54:05'),
(31, 'sanchitt@gmail.com', '1829', '2023-12-30 00:33:11', '2023-12-30 00:33:11'),
(32, '+918810625561', '4488', '2023-12-31 08:36:56', '2023-12-31 08:36:56'),
(33, '+918984230058', '1842', '2024-01-07 11:38:58', '2024-01-07 11:38:58'),
(34, '+918984230058', '2313', '2024-01-07 11:40:24', '2024-01-07 11:40:24'),
(35, '+918984230058', '3547', '2024-01-07 11:41:56', '2024-01-07 11:41:56'),
(36, '+916371999937', '2088', '2024-01-07 12:29:32', '2024-01-07 12:29:32'),
(37, '+918810625561', '7217', '2024-01-17 13:44:59', '2024-01-17 13:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'physical',
  `category_ids` varchar(80) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `digital_product_type` varchar(30) DEFAULT NULL,
  `digital_file_ready` varchar(191) DEFAULT NULL,
  `images` longtext DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `flash_deal` varchar(255) DEFAULT NULL,
  `video_provider` varchar(30) DEFAULT NULL,
  `video_url` varchar(150) DEFAULT NULL,
  `colors` varchar(150) DEFAULT NULL,
  `sizes` varchar(150) DEFAULT NULL,
  `material` text NOT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `variation` text DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `return_policy` text NOT NULL DEFAULT '0',
  `exchange_policy` text NOT NULL DEFAULT '0',
  `tax` varchar(191) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) DEFAULT NULL,
  `discount` varchar(191) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `minimum_order_qty` int(11) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `product_type`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `digital_product_type`, `digital_file_ready`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `sizes`, `material`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `return_policy`, `exchange_policy`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `minimum_order_qty`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`, `code`) VALUES
(4, 'seller', 1, 'Artichoke Traditional cotton Saree', 'artichoke-traditional-cotton-saree-CoMAUp', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"36\",\"position\":2},{\"id\":\"43\",\"position\":3}]', 4, 'kg', 1, 1, NULL, NULL, '[\"2023-10-17-652ed3842ab95.png\",\"2023-10-17-652ed3842ba53.png\",\"2023-10-17-652ed3842bb9f.png\"]', '2023-10-17-652ed3842bcb5.png', '0', NULL, 'youtube', NULL, '[]', NULL, '', 0, 'null', '[]', '[]', 0, 9999, 7999, '0', '0', '0', 'percent', '20', 'percent', 1, 1, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Exclusive Handwoven Nuapatna cotton saree Artichoke base with checks &amp; traditional ikat in body , border dark slate gray&nbsp; base with plain &amp;&nbsp; Pallu dark slate gray base with stripes ,&nbsp; Blouse piece attached in dark Slate Gray.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Specifications:</strong></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>WEIGHT</th>\r\n			<td>600 g</td>\r\n		</tr>\r\n		<tr>\r\n			<th>DIMENSIONS</th>\r\n			<td>6.20 &times; 1.18 m</td>\r\n		</tr>\r\n		<tr>\r\n			<th>MATERIAL</th>\r\n			<td>2/120s*2/120s mercerized cotton</td>\r\n		</tr>\r\n		<tr>\r\n			<th>PRODUCT-ORIGIN</th>\r\n			<td>Nuapatna</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Special Instructions</strong></p>\r\n\r\n<ul>\r\n	<li>Colour hues may slightly vary from that which appears in the image.</li>\r\n	<li>Minor irregularities are the uniqueness of handlooms and make each piece exquisite</li>\r\n	<li>First wash in cold water Wash dark and light colours separately</li>\r\n	<li>Do not squeeze or wring</li>\r\n	<li>Store in a clean and dry place, away from insects, dust, excessive light, and moisture</li>\r\n</ul>', 0, NULL, '2023-10-17 13:03:40', '2023-10-17 14:16:57', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '113639'),
(5, 'seller', 1, 'Copper Red & Cobalt Blue bomkai silk saree', 'copper-red-cobalt-blue-bomkai-silk-saree-pbZPbE', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"36\",\"position\":2},{\"id\":\"43\",\"position\":3}]', 4, 'kg', 1, 1, NULL, NULL, '[\"2023-10-17-652ed4d1d7a5e.png\",\"2023-10-17-652ed4d1d84b6.png\",\"2023-10-17-652ed4d1d86ee.png\",\"2023-10-17-652ed4d1ef3b9.png\"]', '2023-10-17-652ed4d216367.png', NULL, NULL, 'youtube', NULL, '[]', NULL, '', 0, 'null', '[]', '[]', 0, 15999, 7999, '0', '0', '0', 'percent', '7999', 'flat', 1, 1, '<table style=\"width:920px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Exclusive Handwoven bomkai silk saree Copper Red &amp; Cobalt Blue base with traditional ikat &amp; motifs in body, Border Maroon base with&nbsp; rudrakshya dobby ,Pallu Maroon base with traditional ikat &amp; bomkai motifs&nbsp; &amp; blouse piece attached in maroon.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Specifications:</strong></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>WEIGHT</th>\r\n			<td>600 g</td>\r\n		</tr>\r\n		<tr>\r\n			<th>DIMENSIONS</th>\r\n			<td>6.20 &times; 1.18 m</td>\r\n		</tr>\r\n		<tr>\r\n			<th>MATERIAL</th>\r\n			<td>Mulberry Silk</td>\r\n		</tr>\r\n		<tr>\r\n			<th>PRODUCT-ORIGIN</th>\r\n			<td>Sambalpur</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Special Instructions</strong></p>\r\n\r\n<ul>\r\n	<li>Color hues may slightly vary from that which appears in the image.</li>\r\n	<li>Minor irregularities are the uniqueness of handlooms and make each piece exquisite</li>\r\n	<li>First wash in cold water Wash dark and light colors separately</li>\r\n	<li>Do not squeeze or wring</li>\r\n	<li>Store in a clean and dry place, away from insects, dust, excessive light, and moisture</li>\r\n</ul>', 0, NULL, '2023-10-17 13:09:14', '2023-10-17 13:17:46', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '155260'),
(6, 'seller', 1, 'Flirt bomkai silk saree', 'flirt-bomkai-silk-saree-DJgSoK', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"36\",\"position\":2},{\"id\":\"43\",\"position\":3}]', 4, 'kg', 1, 1, NULL, NULL, '[\"2023-10-17-652ed8207e27d.png\",\"2023-10-17-652ed8207ec57.png\",\"2023-10-17-652ed8207ed9a.png\",\"2023-10-17-652ed8207ef21.png\"]', '2023-10-17-652ed8208873f.png', NULL, NULL, 'youtube', NULL, '[\"#FFC0CB\"]', NULL, '', 0, 'null', '[]', '[{\"type\":\"Pink\",\"price\":13499,\"sku\":\"Fbss-Pink\",\"qty\":1}]', 0, 13499, 9999, '0', '0', '0', 'percent', '30', 'percent', 1, 1, '<p>Exclusive Handwoven bomkai silk saree flirt base with butta in body, Border maroon base with rudraksha dobby, pasapali &amp; temple ikat,Pallu maroon base with jhoti &amp; traditional ikat &amp; Blouse piece attached in maroon.</p>\r\n\r\n<p><strong>Specifications:</strong></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>WEIGHT</th>\r\n			<td>600 g</td>\r\n		</tr>\r\n		<tr>\r\n			<th>DIMENSIONS</th>\r\n			<td>6.20 &times; 1.18 m</td>\r\n		</tr>\r\n		<tr>\r\n			<th>MATERIAL</th>\r\n			<td>Mulberry Silk</td>\r\n		</tr>\r\n		<tr>\r\n			<th>PRODUCT-ORIGIN</th>\r\n			<td>Sonepur</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Special Instructions</strong></p>\r\n\r\n<ul>\r\n	<li>Color hues may slightly vary from that which appears in the image.</li>\r\n	<li>Minor irregularities are the uniqueness of handlooms and make each piece exquisite</li>\r\n	<li>Suggest Dry Clean</li>\r\n	<li>Do not squeeze or wring</li>\r\n	<li>Store in a clean and dry place, away from insects, dust, excessive light, and moisture</li>\r\n</ul>', 0, NULL, '2023-10-17 13:23:20', '2023-11-10 07:30:10', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '107663'),
(7, 'seller', 1, 'Amber bomkai sambalpuri silk saree', 'amber-bomkai-sambalpuri-silk-saree-xaLOeI', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"36\",\"position\":2},{\"id\":\"43\",\"position\":3}]', 4, 'kg', 1, 1, NULL, NULL, '[\"2023-10-17-652ed8ba5adac.png\",\"2023-10-17-652ed8ba5b7cd.png\",\"2023-10-17-652ed8ba5b915.png\",\"2023-10-17-652ed8ba5ba46.png\"]', '2023-10-17-652ed8ba69bad.png', NULL, NULL, 'youtube', NULL, '[]', NULL, '', 0, 'null', '[]', '[]', 0, 14999, 9999, '0', '0', '0', 'percent', '30', 'flat', 2, 1, '<table style=\"width:624px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Exclusive Handwoven bomkai silk saree Amber base with plain in body, Border Antique Ruby base with rudrakshya dobby &amp; temple ikat ,Pallu Antique Ruby base with traditional motifs ikat &amp; Blouse piece attached in Antique Ruby.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Specifications:</strong></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>WEIGHT</th>\r\n			<td>600 g</td>\r\n		</tr>\r\n		<tr>\r\n			<th>DIMENSIONS</th>\r\n			<td>6.20 &times; 1.18 m</td>\r\n		</tr>\r\n		<tr>\r\n			<th>MATERIAL</th>\r\n			<td>Silk</td>\r\n		</tr>\r\n		<tr>\r\n			<th>PRODUCT-ORIGIN</th>\r\n			<td>Sambalpur</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Special Instructions</strong></p>\r\n\r\n<ul>\r\n	<li>Color hues may slightly vary from that which appears in the image.</li>\r\n	<li>Minor irregularities are the uniqueness of handlooms and make each piece exquisite</li>\r\n	<li>Suggest Dry Clean</li>\r\n	<li>Do not squeeze or wring</li>\r\n	<li>Store in a clean and dry place, away from insects, dust, excessive light, and moisture</li>\r\n</ul>', 0, NULL, '2023-10-17 13:25:54', '2023-10-17 13:25:58', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '182005'),
(8, 'seller', 1, 'Catalina Blue cotton dress material', 'catalina-blue-cotton-dress-material-OcJ13A', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"36\",\"position\":2},{\"id\":\"44\",\"position\":3}]', 4, 'kg', 1, 1, NULL, NULL, '[\"2023-10-17-652ed98ecbf8b.png\",\"2023-10-17-652ed98ece155.png\",\"2023-10-17-652ed98ece222.png\"]', '2023-10-17-652ed98ece2e4.png', NULL, NULL, 'youtube', NULL, '[]', NULL, '', 0, 'null', '[]', '[]', 0, 1999, 1199, '0', '0', '0', 'percent', '49', 'flat', 1, 1, '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:64px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Exclusive Handwoven traditional cotton dress material in Catalina Blue base with traditional pasapalli ikat &amp; butta motifs in body &amp; Dupatta in Battleship Grey base with plain in body &amp; border butta motifs with temple motifs &amp; Salwar plain in Battleship Grey.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Specifications:</strong></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>WEIGHT</th>\r\n			<td>600 g</td>\r\n		</tr>\r\n		<tr>\r\n			<th>DIMENSIONS</th>\r\n			<td>Kurta-2.5mtr, Duppata-2.5mtr, Salwar-2.5mtr</td>\r\n		</tr>\r\n		<tr>\r\n			<th>PRODUCT-ORIGIN</th>\r\n			<td>Nuapatna</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Special Instructions</strong></p>\r\n\r\n<ul>\r\n	<li>Color hues may slightly vary from that which appears in the image.</li>\r\n	<li>Minor irregularities are the uniqueness of handlooms and make each piece exquisite</li>\r\n	<li>First wash in cold water Wash dark and light colors separately</li>\r\n	<li>Do not squeeze or wring</li>\r\n	<li>Store in a clean and dry place, away from insects, dust, excessive light, and moisture</li>\r\n</ul>', 0, NULL, '2023-10-17 13:29:26', '2023-10-17 13:29:29', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '110380'),
(9, 'seller', 1, 'Dark Green cotton dress material', 'dark-green-cotton-dress-material-agQU6P', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"36\",\"position\":2},{\"id\":\"44\",\"position\":3}]', 4, 'kg', 1, 1, NULL, NULL, '[\"2023-10-17-652eda1d5acdb.png\",\"2023-10-17-652eda1d5ce97.png\",\"2023-10-17-652eda1d5cf49.png\"]', '2023-10-17-652eda1d5cff9.png', NULL, NULL, 'youtube', NULL, '[]', NULL, '', 0, 'null', '[]', '[]', 0, 1299, 599, '0', '0', '0', 'percent', '60', 'percent', 0, 1, '<table style=\"width:810px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Exclusive Handwoven traditional Nuapatna cotton dress material in Dark Green&nbsp; base with traditional&nbsp; ikat in body &amp; dupatta in Cyber Yellow&nbsp; base plain in body with small butty and border Cyber Yellow&nbsp; base&nbsp; and Salwar in&nbsp; Cyber Yellow in plain</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Specifications:</strong></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>WEIGHT</th>\r\n			<td>600 g</td>\r\n		</tr>\r\n		<tr>\r\n			<th>DIMENSIONS</th>\r\n			<td>Kurta-2.5mtr, Duppata-2.5mtr, Salwar-2.5mtr</td>\r\n		</tr>\r\n		<tr>\r\n			<th>PRODUCT-ORIGIN</th>\r\n			<td>Nuapatna</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Special Instructions</strong></p>\r\n\r\n<ul>\r\n	<li>Color hues may slightly vary from that which appears in the image.</li>\r\n	<li>Minor irregularities are the uniqueness of handlooms and make each piece exquisite</li>\r\n	<li>First wash in cold water Wash dark and light colors separately</li>\r\n	<li>Do not squeeze or wring</li>\r\n	<li>Store in a clean and dry place, away from insects, dust, excessive light, and moisture</li>\r\n</ul>', 0, NULL, '2023-10-17 13:31:49', '2023-10-17 13:31:54', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '184273'),
(10, 'seller', 1, 'Floss Appetiser Plates(Special Offers On Sets Of 12/16)', 'floss-appetiser-platesspecial-offers-on-sets-of-1216-6DgNtH', 'physical', '[{\"id\":\"2\",\"position\":1},{\"id\":\"35\",\"position\":2}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-17-652ee9708d8be.png\",\"2023-10-17-652ee9708e283.png\"]', '2023-10-17-652ee9708e370.png', NULL, NULL, 'youtube', NULL, '[]', NULL, '', 0, 'null', '[]', '[]', 0, 1600, 1499, '0', '0', '0', 'percent', '0', 'percent', 5, 1, '<p>Decorated with Floss Flowers and Sal Leaves, these Appetiser Plates take us back to Sambhar Road in Corbett National Park.</p>\r\n\r\n<p>Suited for desserts &amp; single serve snacks.</p>\r\n\r\n<p>A tiger/tigress is recognised by its stripes.</p>\r\n\r\n<p>We honour this occurrence in our rendering of Paaro.</p>', 0, NULL, '2023-10-17 14:37:12', '2023-10-17 14:37:21', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '150032'),
(11, 'seller', 1, 'Green Tea and Aloe Vera', 'green-tea-and-aloe-vera-dMpiA4', 'physical', '[{\"id\":\"2\",\"position\":1},{\"id\":\"34\",\"position\":2}]', 6, 'pc', 1, 1, NULL, NULL, '[\"2023-10-17-652eeda4e1e1b.png\",\"2023-10-17-652eeda4e3f99.png\",\"2023-10-17-652eeda52dac2.png\"]', '2023-10-17-652eeda53bf3c.png', NULL, NULL, 'youtube', NULL, '[]', NULL, '', 0, 'null', '[]', '[]', 0, 400, 300, '0', '0', '0', 'percent', '0', 'percent', 0, 1, '<p>Ultra-Refreshing, Hydrating and Soothing Soap For Normal Combination and Dry Skin</p>\r\n\r\n<p>Our ultra-refreshing bar soap freshens and hydrates while fighting acne with its anti-bacterial properties &amp; creamy lather gently exfoliates to remove dead skin.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hop in the shower and get green clean with this ultra-refreshing bar soap. Packed with anti-oxidant rich green tea it freshens and hydrates while fighting acne with its anti-bacterial properties. With Aloe Vera juice to soothe and cool the skin, its creamy lather gently exfoliates to remove dead skin and keep spotty or disturbed skin cleansed and clear. Take a refreshing walk in the park or just shower with this lively bar that will leave you smelling sharp and fresh!</p>', 0, NULL, '2023-10-17 14:55:09', '2023-10-17 14:55:13', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '141436'),
(12, 'seller', 1, 'COCO LENI', 'coco-leni-RqxIWc', 'physical', '[{\"id\":\"2\",\"position\":1},{\"id\":\"41\",\"position\":2},{\"id\":\"46\",\"position\":3}]', 7, 'pc', 1, 1, NULL, NULL, '[\"2023-10-17-652ef2d5eb48b.png\"]', '2023-10-17-652ef2d5edeec.png', NULL, NULL, 'youtube', NULL, '[]', NULL, '', 0, 'null', '[]', '[]', 0, 4992, 4900, '0', '0', '0', 'percent', '0', 'percent', 0, 1, '<p>Introducing the Paradise sunglasses, a true classic in every sense of the word. These tailor-made sunglasses boast a vintage-inspired Pantos eyewear shape that exudes sophistication and elegance.<br />\r\n<br />\r\nThe thin and light arms of the Paradise sunglasses come with grips at the end to prevent slipping, ensuring maximum comfort and convenience.<br />\r\n<br />\r\nThe Pantos shape is a timeless design that never goes out of style. From the beach to the city streets, the Paradise sunglasses are the ultimate expression of your refined taste and style.</p>', 0, NULL, '2023-10-17 15:17:17', '2023-10-17 15:17:22', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '109804'),
(13, 'seller', 1, 'Whe Black Compassion Upcycled Fabric And Repurposed Wood Earring', 'whe-black-compassion-upcycled-fabric-and-repurposed-wood-earring-7bKZpY', 'physical', '[{\"id\":\"2\",\"position\":1},{\"id\":\"32\",\"position\":2},{\"id\":\"47\",\"position\":3}]', 8, 'kg', 1, 1, NULL, NULL, '[\"2023-10-17-652efba16db82.png\",\"2023-10-17-652efba16e623.png\"]', '2023-10-17-652efba16e6a9.png', NULL, NULL, 'youtube', NULL, '[]', NULL, '', 0, 'null', '[]', '[]', 0, 599, 499, '0', '0', '0', 'percent', '0', 'percent', 5, 1, '<p>This product is made from Repurposed Fabric and Wood. The fabric comes from waste generated during garment cutting. Repurposed Wood is actually made by compressing wood dust generated in furniture production. The collection is a perfect assortment for your formal wear.</p>', 0, NULL, '2023-10-17 15:54:49', '2023-10-18 01:17:22', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '161674'),
(14, 'seller', 1, 'Jumpers Men White Embroidered Kurtas', 'jumpers-men-white-embroidered-kurtas-WEjkCA', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"36\",\"position\":2},{\"id\":\"48\",\"position\":3}]', 9, 'kg', 1, 1, NULL, NULL, '[\"2023-11-10-654e06f428991.png\",\"2023-11-10-654e08b798018.png\"]', '2023-11-10-654e06f428ad4.png', NULL, NULL, 'youtube', NULL, '[\"#FFFFFF\",\"#FFFF00\"]', 'M,S', '', 0, 'null', '[]', '[{\"type\":\"White\",\"price\":3999,\"sku\":\"JMWEK-White\",\"qty\":1},{\"type\":\"Yellow\",\"price\":3999,\"sku\":\"JMWEK-Yellow\",\"qty\":1}]', 0, 3999, 1099, '7', '0', '18', 'percent', '50', 'percent', 2, 1, '<p>PRODUCT DETAILS ----&nbsp;</p>\r\n\r\n<p><br />\r\nColour: white<br />\r\nSolid woven design<br />\r\nMandarin collar<br />\r\nLong, regular sleeves<br />\r\nStraight shape with regular style<br />\r\nThread work detail<br />\r\nAbove knee with straight hem<br />\r\nMachine weave regular cotton</p>\r\n\r\n<p>Size &amp; Fit</p>\r\n\r\n<p>The model (height 6&#39;) is wearing a size M</p>\r\n\r\n<p>Material &amp;; Care<br />\r\nWash with mild detergent 100% Cotton.</p>\r\n\r\n<p><br />\r\nSpecifications<br />\r\nSleeve Length - Long Sleeves</p>\r\n\r\n<p>Shape - Straight Neck - Mandarin Collar<br />\r\nPrint or Pattern Type - Solid<br />\r\nDesign Styling - Regular Slit Detail - Multiple Slits<br />\r\nOrnamentation - Thread Work<br />\r\nLength - Above Knee<br />\r\nHemline - Straight<br />\r\n<br />\r\nColour Family - Earthy<br />\r\nWeave Pattern - Regular<br />\r\n<br />\r\nWeave Type - Machine Weave<br />\r\nOccasion - Festive</p>', 0, NULL, '2023-11-10 05:03:24', '2023-11-28 01:06:49', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '103488'),
(16, 'admin', 1, 'Test', 'test-yrw4AH', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"36\",\"position\":2},{\"id\":\"48\",\"position\":3}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-12-23-65874692c3d38.png\"]', '2023-12-23-65874692c6735.png', NULL, NULL, 'youtube', NULL, '[\"#F0F8FF\",\"#F5F5DC\"]', 'S,M,L', '', 0, 'null', '[]', '[{\"type\":\"AliceBlue\",\"price\":0,\"sku\":null,\"qty\":0},{\"type\":\"Beige\",\"price\":0,\"sku\":null,\"qty\":0}]', 0, 1111, 1111, '0', '0', '0', 'percent', '0', 'flat', 0, 1, NULL, 0, NULL, '2023-12-23 15:14:02', '2023-12-23 15:14:02', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '156491'),
(18, 'seller', 1, 'Test', 'test-UEu59h', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"36\",\"position\":2},{\"id\":\"48\",\"position\":3}]', 7, 'pc', 1, 1, NULL, NULL, '[\"2023-12-23-658749b2e4250.png\"]', '2023-12-23-658749b2e934f.png', NULL, NULL, 'youtube', NULL, '[\"#F5F5DC\",\"#FFFF00\"]', 'L,XL,XXL', '', 0, 'null', '[]', '[{\"type\":\"Beige\",\"price\":3333,\"sku\":\"T-Beige\",\"qty\":1},{\"type\":\"Yellow\",\"price\":3333,\"sku\":\"T-Yellow\",\"qty\":1}]', 0, 3333, 3333, '0', '0', '0', 'percent', '0', 'flat', 2, 1, NULL, 0, NULL, '2023-12-23 15:27:22', '2023-12-23 15:27:25', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '119468'),
(19, 'seller', 2, 'NewTest', 'newtest-796yHo', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"36\",\"position\":2},{\"id\":\"44\",\"position\":3}]', 1, 'pc', 1, 1, NULL, NULL, '[\"2023-12-31-65911d69ddea1.png\"]', '2023-12-31-65911d69e188a.png', NULL, NULL, 'youtube', NULL, '[\"#FFC0CB\"]', 'M,XL', 'cotton', 0, 'null', '[]', '[{\"type\":\"Pink\",\"price\":1200,\"sku\":\"N-Pink\",\"qty\":1}]', 0, 1200, 1200, '0', '0', '0', 'percent', '0', 'flat', 1, 1, NULL, 0, NULL, '2023-12-31 02:21:05', '2023-12-31 02:21:09', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '146819'),
(20, 'admin', 1, 'Testt', 'testt-42N7wq', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"36\",\"position\":2},{\"id\":\"43\",\"position\":3}]', 8, 'pc', 1, 1, NULL, NULL, '[\"2023-12-31-65911f75b7cc8.png\"]', '2023-12-31-65911f75b8778.png', NULL, NULL, 'youtube', NULL, '[\"#000000\"]', 'L', 'silk', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":6600,\"sku\":\"T-Black\",\"qty\":1}]', 0, 6600, 6600, '0', '0', '0', 'percent', '0', 'flat', 1, 1, NULL, 0, NULL, '2023-12-31 02:29:49', '2023-12-31 02:29:49', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '140280'),
(21, 'seller', 2, 'test rolex', 'testttt-EZTp45', 'physical', '[{\"id\":\"2\",\"position\":1},{\"id\":\"32\",\"position\":2},{\"id\":\"47\",\"position\":3}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2024-01-01-6592a721af7e2.png\"]', '2024-01-01-6592a721b2170.png', NULL, NULL, 'youtube', NULL, '[]', 'not_applicable', '', 0, 'null', '[]', '[]', 0, 100000, 100000, '4', '10', '0', 'percent', '0', 'flat', 0, 1, NULL, 0, NULL, '2024-01-01 06:20:57', '2024-01-01 06:23:34', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '150724');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `refund_reason` longtext NOT NULL,
  `images` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext DEFAULT NULL,
  `rejected_note` longtext DEFAULT NULL,
  `payment_info` longtext DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL,
  `change_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE `refund_transactions` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_for` varchar(191) DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) DEFAULT NULL,
  `paid_to` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_status` varchar(191) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_saved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) NOT NULL,
  `key` varchar(150) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `visible_for` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) NOT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `adhaar` varchar(150) DEFAULT 'XXXXXX',
  `phone` varchar(25) DEFAULT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `auth_token` text DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `f_name`, `l_name`, `adhaar`, `phone`, `image`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `account_no`, `holder_name`, `auth_token`, `sales_commission_percentage`, `gst`, `cm_firebase_token`, `pos_status`) VALUES
(1, 'Demo', 'd', 'XXXXXX', '9999966666', '2023-08-14-64da457ee8e19.png', 'demoseller@gmail.com', '$2y$10$RcMEEgsh01r5v/Eu3p7K4uwz0xjQSSX4cSzr9qnK/e38Vd5sZGc0e', 'approved', 'Anh3rcqLKMRcWOoxgU3orOBwspVc9tAxOzpNFsNjNKT2LJkWjJYao2HgK96E', '2023-08-14 09:47:19', '2023-09-13 07:27:18', NULL, NULL, NULL, NULL, 'MD4fpSnOwTQvsB4sxBS1mtmAwyfqJkUxBpCBMessXS47wMm9Rc', NULL, NULL, 'cKVopCZvTGG7yL9UzeGQHZ:APA91bEtkeREz7-GuuWAz9JTrKzyR8JDemYsYclIa30H5fAKvUr2bguEfUAmJjpMoWGP8KNR37mhQw_X1CTtiiFPoZM_t4TuFwsDk7A9U42l9-Sv-64g84B1gA4pXZFGjLziv1ECCnp4', 0),
(2, 'test2', 'test', 'ABCD1234', '918810625561', '2023-12-24-65883093b3fe7.png', 'test@gmail.com', '$2y$10$h88U5OFOiL9aWTTNnc1ZL.GZhdFV20Lge3T.m0B/IvX4ExKOAityO', 'approved', 'nztzTK0sNgWaPEvpxxiXVcuJTki6bcldYcbpdps9vnZOWw7ssi25HVCMNfrI', '2023-12-24 07:52:27', '2023-12-24 07:52:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_wallets`
--

INSERT INTO `seller_wallets` (`id`, `seller_id`, `total_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_given`, `pending_withdraw`, `delivery_charge_earned`, `collected_cash`, `total_tax_collected`) VALUES
(1, 1, 0, 0, '2023-08-14 09:47:19', '2023-08-14 09:47:19', 0.00, 0.00, 0.00, 0.00, 0.00),
(2, 2, 0, 0, '2023-12-24 07:52:27', '2023-12-24 07:52:27', 0.00, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `contact_person_name` varchar(50) DEFAULT NULL,
  `address_type` varchar(20) NOT NULL DEFAULT 'home',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`) VALUES
(1, '6', 'Debasis Mohanty', 'Home', 'E-67, Iffco Township, Paradee', 'Paradeep', '754142', '+917978730925', '2023-12-24 09:53:02', '2023-12-24 09:53:02', NULL, 'India', '0.0', '0.0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL DEFAULT 'admin',
  `title` varchar(100) DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'admin', 'Company Vehicle', 5.00, '2 Week', 1, '2021-05-25 20:57:04', '2021-05-25 20:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint(20) NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_types`
--

INSERT INTO `shipping_types` (`id`, `seller_id`, `shipping_type`, `created_at`, `updated_at`) VALUES
(1, 0, 'product_wise', '2023-09-22 19:37:56', '2023-09-22 19:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `seller_id`, `name`, `address`, `contact`, `image`, `created_at`, `updated_at`, `banner`) VALUES
(1, 1, 'demo shop', 'madurai', '9999966666', '2023-08-14-64da457f03a07.png', '2023-08-14 09:47:19', '2023-08-14 09:47:19', '2023-08-14-64da457f03b57.png'),
(2, 2, 'test2', 'test2', '918810625561', '2023-12-24-65883093c45ae.png', '2023-12-24 07:52:27', '2023-12-24 07:52:27', '2023-12-24-65883093c4636.png');

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', 'https://www.w3schools.com/howto/howto_css_table_responsive.asp', 'fa fa-twitter', 1, 1, '2020-12-31 21:18:03', '2023-10-12 15:07:37'),
(2, 'linkedin', 'https://www.linkedin.com/company/prodokraft/', 'fa fa-linkedin', 1, 1, '2021-02-27 16:23:01', '2023-11-02 07:31:19'),
(3, 'google-plus', 'https://dev.6amtech.com/', 'fa fa-google-plus-square', 0, 1, '2021-02-27 16:23:30', '2023-10-12 15:08:02'),
(4, 'pinterest', 'https://dev.6amtech.com/', 'fa fa-pinterest', 1, 1, '2021-02-27 16:24:14', '2021-02-27 16:24:26'),
(5, 'instagram', 'https://dev.6amtech.com/', 'fa fa-instagram', 1, 1, '2021-02-27 16:24:36', '2021-02-27 16:24:41'),
(6, 'facebook', 'facebook.com', 'fa fa-facebook', 1, 1, '2021-02-27 19:19:42', '2021-06-11 17:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'general.swaraj@gmail.com', '2023-09-12 09:51:55', '2023-09-12 09:51:55'),
(2, 'VQbTiJ.qhtccmm@spinapp.bar', '2023-11-03 23:09:07', '2023-11-03 23:09:07'),
(3, 'JJiBqe.hcmjjp@rottack.autos', '2023-11-16 06:38:37', '2023-11-16 06:38:37'),
(4, 'AVlCnV.qqwwppm@kerfuffle.asia', '2023-11-22 01:35:17', '2023-11-22 01:35:17'),
(5, 'SrqHRJ.hhmctjd@flexduck.click', '2023-11-28 01:58:05', '2023-11-28 01:58:05'),
(6, 'bmFPNk.cdtqbc@balneary.biz', '2023-12-01 13:19:39', '2023-12-01 13:19:39'),
(7, 'cjnWsn.tbddcdh@tarboosh.shop', '2023-12-08 08:54:34', '2023-12-08 08:54:34'),
(8, 'NPOdjk.tqjpcjw@brasswire.me', '2023-12-09 18:04:19', '2023-12-09 18:04:19'),
(9, 'vjdoCL.bdctjth@sabletree.foundation', '2023-12-11 06:11:31', '2023-12-11 06:11:31'),
(10, 'PKjRko.phdddmm@scranch.shop', '2023-12-14 15:57:13', '2023-12-14 15:57:13'),
(11, 'zoxcoc.qhjjtjh@rottack.autos', '2023-12-17 11:19:51', '2023-12-17 11:19:51');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `priority` varchar(15) NOT NULL DEFAULT 'low',
  `description` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) DEFAULT NULL,
  `admin_message` varchar(191) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) DEFAULT NULL,
  `paid_to` varchar(15) DEFAULT NULL,
  `payment_method` varchar(15) DEFAULT NULL,
  `payment_status` varchar(10) NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) NOT NULL,
  `translationable_id` bigint(20) NOT NULL,
  `locale` varchar(191) NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`translationable_type`, `translationable_id`, `locale`, `key`, `value`, `id`) VALUES
('App\\Model\\Product', 5, 'in', 'name', 'Copper Red & Cobalt Blue bomkai silk saree', 0),
('App\\Model\\Product', 5, 'in', 'description', '<table style=\"width:920px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Exclusive Handwoven bomkai silk saree Copper Red &amp; Cobalt Blue base with traditional ikat &amp; motifs in body, Border Maroon base with&nbsp; rudrakshya dobby ,Pallu Maroon base with traditional ikat &amp; bomkai motifs&nbsp; &amp; blouse piece attached in maroon.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Specifications:</strong></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>WEIGHT</th>\r\n			<td>600 g</td>\r\n		</tr>\r\n		<tr>\r\n			<th>DIMENSIONS</th>\r\n			<td>6.20 &times; 1.18 m</td>\r\n		</tr>\r\n		<tr>\r\n			<th>MATERIAL</th>\r\n			<td>Mulberry Silk</td>\r\n		</tr>\r\n		<tr>\r\n			<th>PRODUCT-ORIGIN</th>\r\n			<td>Sambalpur</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Special Instructions</strong></p>\r\n\r\n<ul>\r\n	<li>Color hues may slightly vary from that which appears in the image.</li>\r\n	<li>Minor irregularities are the uniqueness of handlooms and make each piece exquisite</li>\r\n	<li>First wash in cold water Wash dark and light colors separately</li>\r\n	<li>Do not squeeze or wring</li>\r\n	<li>Store in a clean and dry place, away from insects, dust, excessive light, and moisture</li>\r\n</ul>', 0),
('App\\Model\\Product', 13, 'in', 'name', 'Whe Black Compassion Upcycled Fabric And Repurposed Wood Earring', 0),
('App\\Model\\Product', 13, 'in', 'description', '<p>This product is made from Repurposed Fabric and Wood. The fabric comes from waste generated during garment cutting. Repurposed Wood is actually made by compressing wood dust generated in furniture production. The collection is a perfect assortment for your formal wear.</p>', 0),
('App\\Model\\Product', 14, 'in', 'name', 'Jumpers Men White Embroidered Kurtas', 0),
('App\\Model\\Product', 14, 'in', 'description', '<p>PRODUCT DETAILS ----&nbsp;</p>\r\n\r\n<p><br />\r\nColour: white<br />\r\nSolid woven design<br />\r\nMandarin collar<br />\r\nLong, regular sleeves<br />\r\nStraight shape with regular style<br />\r\nThread work detail<br />\r\nAbove knee with straight hem<br />\r\nMachine weave regular cotton</p>\r\n\r\n<p>Size &amp; Fit</p>\r\n\r\n<p>The model (height 6&#39;) is wearing a size M</p>\r\n\r\n<p>Material &amp;; Care<br />\r\nWash with mild detergent 100% Cotton.</p>\r\n\r\n<p><br />\r\nSpecifications<br />\r\nSleeve Length - Long Sleeves</p>\r\n\r\n<p>Shape - Straight Neck - Mandarin Collar<br />\r\nPrint or Pattern Type - Solid<br />\r\nDesign Styling - Regular Slit Detail - Multiple Slits<br />\r\nOrnamentation - Thread Work<br />\r\nLength - Above Knee<br />\r\nHemline - Straight<br />\r\n<br />\r\nColour Family - Earthy<br />\r\nWeave Pattern - Regular<br />\r\n<br />\r\nWeave Type - Machine Weave<br />\r\nOccasion - Festive</p>', 0),
('App\\Model\\Product', 6, 'in', 'name', 'Flirt bomkai silk saree', 0),
('App\\Model\\Product', 6, 'in', 'description', '<p>Exclusive Handwoven bomkai silk saree flirt base with butta in body, Border maroon base with rudraksha dobby, pasapali &amp; temple ikat,Pallu maroon base with jhoti &amp; traditional ikat &amp; Blouse piece attached in maroon.</p>\r\n\r\n<p><strong>Specifications:</strong></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>WEIGHT</th>\r\n			<td>600 g</td>\r\n		</tr>\r\n		<tr>\r\n			<th>DIMENSIONS</th>\r\n			<td>6.20 &times; 1.18 m</td>\r\n		</tr>\r\n		<tr>\r\n			<th>MATERIAL</th>\r\n			<td>Mulberry Silk</td>\r\n		</tr>\r\n		<tr>\r\n			<th>PRODUCT-ORIGIN</th>\r\n			<td>Sonepur</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Special Instructions</strong></p>\r\n\r\n<ul>\r\n	<li>Color hues may slightly vary from that which appears in the image.</li>\r\n	<li>Minor irregularities are the uniqueness of handlooms and make each piece exquisite</li>\r\n	<li>Suggest Dry Clean</li>\r\n	<li>Do not squeeze or wring</li>\r\n	<li>Store in a clean and dry place, away from insects, dust, excessive light, and moisture</li>\r\n</ul>', 0),
('App\\Model\\Product', 15, 'in', 'name', 'ABC', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `house_no` varchar(50) DEFAULT NULL,
  `apartment_no` varchar(50) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) DEFAULT NULL,
  `payment_card_brand` varchar(191) DEFAULT NULL,
  `payment_card_fawry_token` text DEFAULT NULL,
  `login_medium` varchar(191) DEFAULT NULL,
  `social_id` varchar(191) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_balance` double(8,2) DEFAULT NULL,
  `loyalty_point` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`, `wallet_balance`, `loyalty_point`) VALUES
(5, NULL, 'Swaraj Chutiya', 'Chutiya', '7606008579', 'def.png', 'chutiyaji.swaraj@gmail.com', NULL, '$2y$10$MAnsSOeJTg0RUclmtn5VqO2lV0qXdy5SArei0W8Oe95uXsVHCUirm', NULL, '2023-10-28 01:33:01', '2023-10-28 01:33:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(6, NULL, 'Debasis', 'Mohanty', '+917978730925', 'def.png', 'Dmohanty.chintu@gmail.com', NULL, '$2y$10$Jkww2NpRgXQYyRWaSU0tIOhnZeZsBflKJfCyVj6suJDOr4dd3weiW', NULL, '2023-10-30 05:38:46', '2023-12-24 09:48:50', NULL, NULL, NULL, NULL, NULL, NULL, 'fGGaFLm1TMOr1VgN5OyAEu:APA91bFIqc-MlsANESI-0BWDnjIy7gZpq8BFyvwNfi8rv_yIM4TMXHwnWrkTuhrCdpbihqf5P6AKJKdDQccUnVL5UvtCxVFq89IjNDH8kIHDJp9c4zvRjHTS_wqlrfjS1ZGJZGF4wi1i', 1, NULL, NULL, NULL, NULL, NULL, 1, 'bn0kOAY0oYH3hgXHQqL9QNN0aExg3mmaSLH3VVkq', 0, NULL, NULL),
(7, NULL, 'Chitaranjana', 'Mohanty', '7684027454', 'def.png', 'chitaranjan7684@gmail.com', NULL, '$2y$10$wfCuQ32foATOQ0zwSvfxrephwRdwQF9jDh9ecN4H5ZagdDzZdiPhG', NULL, '2023-11-02 21:56:40', '2023-11-02 21:56:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(9, NULL, 'user', 'user1', '+917024181097', 'def.png', 'jsaniya298@gmail.com', NULL, '$2y$10$C3csciPfDIFGjZ08Ay4S7OVwoejeZj5iG7/8p0SNu1N17a.0bNfGC', NULL, '2023-11-27 01:44:25', '2023-11-27 01:44:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(10, NULL, 'Sanchit', 'Dang', '+918810625561', 'def.png', 'sanchit@gmail.com', NULL, '$2y$10$drPiCLzU/Mr/NyZX1Ixbg.PiGtDS2Youe6WHaEsNY35ixVBhAMwUC', 'AXZSBgRYquVtc3V3Rt4uikJiBL5juajdL0eKjppOx4YZHqJ7mLmnuqFbeaYv', '2023-12-21 11:00:40', '2023-12-23 15:40:10', NULL, NULL, NULL, NULL, NULL, NULL, 'c_mKy6pMS0ifTcDGFG3tkT:APA91bEm2zBALSFpJr2Lm1msMxHdi4uAkO2ZhGpfIl7C6eSHV6Jd21sKEGQa5mCSsUQuCuyvwqB2n28X8qhxKOAKmJRDsSOQskCEkV6zrlNaBfSWK4xAMZQEE56p-zrGrWfqDPPIbvlA', 1, NULL, NULL, NULL, NULL, NULL, 1, 'ZAaba3zhT6B5N884dRZLDMEJzfNAjvkgERWlBGos', 0, NULL, NULL),
(17, NULL, 'Sana', 'aa', '+912222222222', 'def.png', 'sana@gmail.com', NULL, '$2y$10$drPiCLzU/Mr/NyZX1Ixbg.PiGtDS2Youe6WHaEsNY35ixVBhAMwUC', NULL, '2023-12-23 13:34:30', '2023-12-23 13:38:09', NULL, NULL, NULL, NULL, NULL, NULL, 'fU5vEpnvSBypA_Vle6PRjl:APA91bEksc47vbwjTdxpXTxZpc9NkRK9P4vBsCnwPDsN5GcC7wub1wZMCfR2Do0Vfdk0V3rGwuwyullsqrXYsso28Y1p29Ye5XPhhjiTjLMscm6osvpy0VaY997vjzy4WxqOMTxTffd7', 1, NULL, NULL, NULL, NULL, NULL, 1, 'HPw3n0dPiuMyzpWvGJER3vhkpVg1mu2MysxA59Ri', 0, NULL, NULL),
(23, NULL, 'Swaraj', 'Samal', '917848082411', '2023-12-25-658934b011cb4.png', 'general.swarajsamal@gmail.com', NULL, '$2y$10$KWa3thnBjtoCajUHKH6HsuzpyU6CbtVy02fa8MjZZv66cgSIAR22a', '7yOgT4b1By9ksMh4XuiEa4mBBTrSchbxSGukWhUgFouJLAVkySIfhNh42PdH', '2023-12-24 08:53:01', '2023-12-25 02:22:16', NULL, NULL, NULL, NULL, NULL, NULL, 'emVloD3wSuChgXYxHrhudG:APA91bEvJePAqfcYFfZoybhhhBvM4i9lMX2zVivEVkdYL04xMzxbg6BHarC2EDE-hgcDcj7-HTITxuiM3kwtHNCt7ErGdaPRzrQyajPfS5NujqnMt73zEzE8mca2HBFmKctSwvA44kWP', 1, NULL, NULL, NULL, NULL, NULL, 1, 'nZecETsE9qPAjqVs3GPL3RTsZ03TqyMDN2dCHMPW', 0, NULL, NULL),
(24, NULL, 'Sanchit', 'Dang', '918810625561', 'def.png', 'sanchit@gmail.com', NULL, '$2y$10$ouZgvxJgu3kCI7WDmnnjIOy8JupfHCl7cDfe4/si1b.0zfxYTdE5K', NULL, '2023-12-30 00:33:10', '2024-01-17 13:44:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, '7ir0q1eONXQOvC9CRAUh8hpjK81WxpdxbFcBt64k', 0, NULL, NULL),
(25, NULL, 'Jyotiranjan', 'Mohanty', '+918984230058', 'def.png', 'jyotiranjanm24@gmail.com', NULL, '$2y$10$rEI.OWkKRR2m71RzS6tRE.Y5psx9I.STf3EXNZVBA9RawI7n3Q2Uq', NULL, '2024-01-07 11:38:57', '2024-01-07 11:40:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 'RzDYWOOTFQ9OD23VhKkkpvE0V5dGK5hApGn8dvcT', 0, NULL, NULL),
(26, NULL, 'Subhashree', 'Pattnayak', '+916371999937', 'def.png', 'subhashree.17apr@gmail.com', NULL, '$2y$10$h5mwjCJc1tYc1ZjBHf9NMeqpJWitRAUoeAlng0KzkpFeSAaqgWJJW', NULL, '2024-01-07 12:29:32', '2024-01-07 12:29:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, '6zrTgTprplvSG50bEPbSLd5Hnl44dZRqdwHoJWnq', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 23, 18, '2023-12-25 02:17:53', '2023-12-25 02:17:53'),
(3, 23, 7, '2023-12-25 02:18:00', '2023-12-25 02:18:00'),
(6, 6, 18, '2023-12-26 02:15:03', '2023-12-26 02:15:03');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` int(20) NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) NOT NULL DEFAULT '0.00',
  `transaction_note` text DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_notifications`
--
ALTER TABLE `deliveryman_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_wallets`
--
ALTER TABLE `deliveryman_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_country_codes`
--
ALTER TABLE `delivery_country_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_transactions`
--
ALTER TABLE `delivery_man_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_zip_codes`
--
ALTER TABLE `delivery_zip_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryman_notifications`
--
ALTER TABLE `deliveryman_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryman_wallets`
--
ALTER TABLE `deliveryman_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_country_codes`
--
ALTER TABLE `delivery_country_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_transactions`
--
ALTER TABLE `delivery_man_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_zip_codes`
--
ALTER TABLE `delivery_zip_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
