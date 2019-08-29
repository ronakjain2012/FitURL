-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 29, 2019 at 08:43 AM
-- Server version: 10.1.41-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shorter`
--

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint(32) UNSIGNED NOT NULL,
  `session_id` bigint(32) UNSIGNED DEFAULT NULL,
  `name` varchar(256) COLLATE utf16_bin DEFAULT NULL,
  `email` varchar(256) COLLATE utf16_bin DEFAULT NULL,
  `mobile` varchar(16) COLLATE utf16_bin DEFAULT NULL,
  `topic` varchar(256) COLLATE utf16_bin DEFAULT NULL,
  `topic_desc` varchar(1024) COLLATE utf16_bin DEFAULT NULL,
  `response` varchar(1024) COLLATE utf16_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(32) UNSIGNED NOT NULL,
  `session_id` bigint(32) UNSIGNED DEFAULT NULL,
  `quote` varchar(1024) COLLATE utf16_bin NOT NULL,
  `author` varchar(128) COLLATE utf16_bin DEFAULT NULL,
  `category_keywords` varchar(1024) COLLATE utf16_bin DEFAULT NULL,
  `keywords` varchar(1024) COLLATE utf16_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(32) UNSIGNED NOT NULL,
  `session` varchar(256) COLLATE utf16_bin NOT NULL,
  `region` varchar(64) COLLATE utf16_bin NOT NULL,
  `country` varchar(64) COLLATE utf16_bin NOT NULL,
  `timezone` varchar(255) COLLATE utf16_bin DEFAULT NULL,
  `country_code` varchar(16) COLLATE utf16_bin DEFAULT NULL,
  `state` varchar(64) COLLATE utf16_bin NOT NULL,
  `city` varchar(64) COLLATE utf16_bin NOT NULL,
  `zip_code` varchar(16) COLLATE utf16_bin DEFAULT NULL,
  `iso_code` varchar(16) COLLATE utf16_bin DEFAULT NULL,
  `lat` varchar(32) COLLATE utf16_bin DEFAULT NULL,
  `long` varchar(32) COLLATE utf16_bin DEFAULT NULL,
  `postal_code` varchar(16) COLLATE utf16_bin DEFAULT NULL,
  `area_code` varchar(16) COLLATE utf16_bin DEFAULT NULL,
  `metro_code` varchar(16) COLLATE utf16_bin DEFAULT NULL,
  `ip` varchar(64) COLLATE utf16_bin DEFAULT NULL,
  `mac` varchar(64) COLLATE utf16_bin DEFAULT NULL,
  `time_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_end` timestamp NULL DEFAULT NULL,
  `visit_count` int(32) NOT NULL DEFAULT '0',
  `visit_pages` varchar(2048) COLLATE utf16_bin DEFAULT NULL,
  `activity_json` varchar(2048) COLLATE utf16_bin DEFAULT NULL,
  `agent` varchar(256) COLLATE utf16_bin DEFAULT NULL,
  `isp` varchar(256) COLLATE utf16_bin DEFAULT NULL,
  `org` varchar(128) COLLATE utf16_bin DEFAULT NULL,
  `business_name` varchar(128) COLLATE utf16_bin DEFAULT NULL,
  `business_website` varchar(128) COLLATE utf16_bin DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT '0',
  `show_info` varchar(2048) COLLATE utf16_bin DEFAULT NULL,
  `raw_data` text COLLATE utf16_bin,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `session`, `region`, `country`, `timezone`, `country_code`, `state`, `city`, `zip_code`, `iso_code`, `lat`, `long`, `postal_code`, `area_code`, `metro_code`, `ip`, `mac`, `time_start`, `time_end`, `visit_count`, `visit_pages`, `activity_json`, `agent`, `isp`, `org`, `business_name`, `business_website`, `blocked`, `show_info`, `raw_data`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 'ac65329c-885c-47fd-bb35-cc82146d5df8', 'Asia', 'India', 'Asia/Kolkata', 'IN', 'Rajasthan', 'Jaipur', '302012', 'IN', '26.9133', '75.7879', '302012', '302012', '302012', '223.238.233.145', NULL, '2019-08-25 17:09:10', '2019-08-25 17:14:28', 5, NULL, NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 'Bharti Airtel', 'Bharti Airtel', 'Bharti Airtel', NULL, 0, NULL, '{\"city\":{\"confidence\":30,\"geoname_id\":1269515,\"names\":{\"en\":\"Jaipur\",\"es\":\"Jaipur\",\"fr\":\"Jaipur\",\"ja\":\"ジャイプル\",\"pt-BR\":\"Jaipur\",\"ru\":\"Джайпур\",\"de\":\"Jaipur\"}},\"continent\":{\"code\":\"AS\",\"geoname_id\":6255147,\"names\":{\"de\":\"Asien\",\"en\":\"Asia\",\"es\":\"Asia\",\"fr\":\"Asie\",\"ja\":\"アジア\",\"pt-BR\":\"Ásia\",\"ru\":\"Азия\",\"zh-CN\":\"亚洲\"}},\"country\":{\"confidence\":99,\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\"}},\"location\":{\"accuracy_radius\":200,\"latitude\":26.9133,\"longitude\":75.7879,\"time_zone\":\"Asia/Kolkata\"},\"postal\":{\"confidence\":10,\"code\":\"302012\"},\"registered_country\":{\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\"}},\"subdivisions\":[{\"confidence\":99,\"iso_code\":\"RJ\",\"geoname_id\":1258899,\"names\":{\"ru\":\"Раджастхан\",\"zh-CN\":\"拉贾斯坦邦\",\"en\":\"Rajasthan\",\"es\":\"Rajastán\",\"fr\":\"Rajasthan\",\"ja\":\"ラージャスターン州\",\"pt-BR\":\"Rajastão\"}}],\"traits\":{\"user_type\":\"cellular\",\"autonomous_system_number\":45609,\"autonomous_system_organization\":\"Bharti Airtel Ltd. AS for GPRS Service\",\"isp\":\"Bharti Airtel\",\"organization\":\"Bharti Airtel\",\"ip_address\":\"223.238.233.145\"},\"represented_country\":{\"names\":{}}}', '2019-08-25 17:09:10', '2019-08-25 17:31:48', NULL),
(10, 'c3c5438d-3575-4f6d-a62c-032213d4f6b3', 'Asia', 'India', 'Asia/Kolkata', 'IN', 'Rajasthan', 'Jaipur', '302021', 'IN', '26.9133', '75.7879', '302021', '302021', '302021', '223.238.225.22', NULL, '2019-08-28 16:06:29', '2019-08-28 16:09:59', 20, NULL, NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 'Bharti Airtel', 'Bharti Airtel', 'Bharti Airtel', NULL, 0, NULL, '{\"city\":{\"confidence\":30,\"geoname_id\":1269515,\"names\":{\"en\":\"Jaipur\",\"es\":\"Jaipur\",\"fr\":\"Jaipur\",\"ja\":\"ジャイプル\",\"pt-BR\":\"Jaipur\",\"ru\":\"Джайпур\",\"de\":\"Jaipur\"}},\"continent\":{\"code\":\"AS\",\"geoname_id\":6255147,\"names\":{\"fr\":\"Asie\",\"ja\":\"アジア\",\"pt-BR\":\"Ásia\",\"ru\":\"Азия\",\"zh-CN\":\"亚洲\",\"de\":\"Asien\",\"en\":\"Asia\",\"es\":\"Asia\"}},\"country\":{\"confidence\":99,\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\"}},\"location\":{\"accuracy_radius\":200,\"latitude\":26.9133,\"longitude\":75.7879,\"time_zone\":\"Asia/Kolkata\"},\"postal\":{\"confidence\":10,\"code\":\"302021\"},\"registered_country\":{\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\"}},\"subdivisions\":[{\"confidence\":90,\"iso_code\":\"RJ\",\"geoname_id\":1258899,\"names\":{\"es\":\"Rajastán\",\"fr\":\"Rajasthan\",\"ja\":\"ラージャスターン州\",\"pt-BR\":\"Rajastão\",\"ru\":\"Раджастхан\",\"zh-CN\":\"拉贾斯坦邦\",\"en\":\"Rajasthan\"}}],\"traits\":{\"user_type\":\"residential\",\"autonomous_system_number\":45609,\"autonomous_system_organization\":\"Bharti Airtel Ltd. AS for GPRS Service\",\"isp\":\"Bharti Airtel\",\"organization\":\"Bharti Airtel\",\"ip_address\":\"223.238.225.22\"},\"represented_country\":{\"names\":{}}}', '2019-08-26 03:36:29', '2019-08-28 21:40:19', NULL),
(11, '6ba31fa6-7498-434e-aafc-edd94858e4e8', 'Asia', 'India', 'Asia/Kolkata', 'IN', 'Rajasthan', 'Jaipur', '302004', 'IN', '26.9133', '75.7879', '302004', '302004', '302004', '2401:4900:305b:1b32:858f:427d:a753:f050', NULL, '2019-08-28 17:17:38', '2019-08-28 16:10:02', 17, NULL, NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Bharti Airtel', 'Bharti Airtel', 'Bharti Airtel', NULL, 0, NULL, '{\"city\":{\"confidence\":40,\"geoname_id\":1269515,\"names\":{\"ru\":\"Джайпур\",\"de\":\"Jaipur\",\"en\":\"Jaipur\",\"es\":\"Jaipur\",\"fr\":\"Jaipur\",\"ja\":\"ジャイプル\",\"pt-BR\":\"Jaipur\"}},\"continent\":{\"code\":\"AS\",\"geoname_id\":6255147,\"names\":{\"zh-CN\":\"亚洲\",\"de\":\"Asien\",\"en\":\"Asia\",\"es\":\"Asia\",\"fr\":\"Asie\",\"ja\":\"アジア\",\"pt-BR\":\"Ásia\",\"ru\":\"Азия\"}},\"country\":{\"confidence\":99,\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\"}},\"location\":{\"accuracy_radius\":200,\"latitude\":26.9133,\"longitude\":75.7879,\"time_zone\":\"Asia/Kolkata\"},\"postal\":{\"confidence\":10,\"code\":\"302004\"},\"registered_country\":{\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\"}},\"subdivisions\":[{\"confidence\":90,\"iso_code\":\"RJ\",\"geoname_id\":1258899,\"names\":{\"zh-CN\":\"拉贾斯坦邦\",\"en\":\"Rajasthan\",\"es\":\"Rajastán\",\"fr\":\"Rajasthan\",\"ja\":\"ラージャスターン州\",\"pt-BR\":\"Rajastão\",\"ru\":\"Раджастхан\"}}],\"traits\":{\"user_type\":\"residential\",\"autonomous_system_number\":45609,\"autonomous_system_organization\":\"Bharti Airtel Ltd. AS for GPRS Service\",\"isp\":\"Bharti Airtel\",\"organization\":\"Bharti Airtel\",\"ip_address\":\"2401:4900:305b:1b32:858f:427d:a753:f050\"},\"represented_country\":{\"names\":{}}}', '2019-08-26 15:47:38', '2019-08-28 21:40:19', NULL),
(12, '6ba31fa6-7498-434e-aafc-edd94858e4e8', 'Asia', 'India', 'Asia/Kolkata', 'IN', 'Rajasthan', 'Jaipur', '302004', 'IN', '26.9133', '75.7879', '302004', '302004', '302004', '2401:4900:305b:3e6a:858f:427d:a753:f050', NULL, '2019-08-28 18:22:18', NULL, 1, NULL, NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Bharti Airtel', 'Bharti Airtel', 'Bharti Airtel', NULL, 0, NULL, '{\"city\":{\"confidence\":40,\"geoname_id\":1269515,\"names\":{\"en\":\"Jaipur\",\"es\":\"Jaipur\",\"fr\":\"Jaipur\",\"ja\":\"ジャイプル\",\"pt-BR\":\"Jaipur\",\"ru\":\"Джайпур\",\"de\":\"Jaipur\"}},\"continent\":{\"code\":\"AS\",\"geoname_id\":6255147,\"names\":{\"fr\":\"Asie\",\"ja\":\"アジア\",\"pt-BR\":\"Ásia\",\"ru\":\"Азия\",\"zh-CN\":\"亚洲\",\"de\":\"Asien\",\"en\":\"Asia\",\"es\":\"Asia\"}},\"country\":{\"confidence\":99,\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\"}},\"location\":{\"accuracy_radius\":200,\"latitude\":26.9133,\"longitude\":75.7879,\"time_zone\":\"Asia/Kolkata\"},\"postal\":{\"confidence\":10,\"code\":\"302004\"},\"registered_country\":{\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\"}},\"subdivisions\":[{\"confidence\":90,\"iso_code\":\"RJ\",\"geoname_id\":1258899,\"names\":{\"es\":\"Rajastán\",\"fr\":\"Rajasthan\",\"ja\":\"ラージャスターン州\",\"pt-BR\":\"Rajastão\",\"ru\":\"Раджастхан\",\"zh-CN\":\"拉贾斯坦邦\",\"en\":\"Rajasthan\"}}],\"traits\":{\"user_type\":\"residential\",\"autonomous_system_number\":45609,\"autonomous_system_organization\":\"Bharti Airtel Ltd. AS for GPRS Service\",\"isp\":\"Bharti Airtel\",\"organization\":\"Bharti Airtel\",\"ip_address\":\"2401:4900:305b:3e6a:858f:427d:a753:f050\"},\"represented_country\":{\"names\":{}}}', '2019-08-28 12:52:18', '2019-08-28 12:52:18', NULL),
(13, 'c3c5438d-3575-4f6d-a62c-032213d4f6b3', 'Asia', 'India', 'Asia/Kolkata', 'IN', 'Rajasthan', 'Jaipur', '302012', 'IN', '26.9133', '75.7879', '302012', '302012', '302012', '223.178.145.184', NULL, '2019-08-28 18:45:17', NULL, 1, NULL, NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 'Bharti Airtel', 'Bharti Airtel', 'Bharti Airtel', NULL, 0, NULL, '{\"city\":{\"confidence\":30,\"geoname_id\":1269515,\"names\":{\"de\":\"Jaipur\",\"en\":\"Jaipur\",\"es\":\"Jaipur\",\"fr\":\"Jaipur\",\"ja\":\"ジャイプル\",\"pt-BR\":\"Jaipur\",\"ru\":\"Джайпур\"}},\"continent\":{\"code\":\"AS\",\"geoname_id\":6255147,\"names\":{\"ru\":\"Азия\",\"zh-CN\":\"亚洲\",\"de\":\"Asien\",\"en\":\"Asia\",\"es\":\"Asia\",\"fr\":\"Asie\",\"ja\":\"アジア\",\"pt-BR\":\"Ásia\"}},\"country\":{\"confidence\":99,\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\"}},\"location\":{\"accuracy_radius\":500,\"latitude\":26.9133,\"longitude\":75.7879,\"time_zone\":\"Asia/Kolkata\"},\"postal\":{\"confidence\":10,\"code\":\"302012\"},\"registered_country\":{\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\"}},\"subdivisions\":[{\"confidence\":80,\"iso_code\":\"RJ\",\"geoname_id\":1258899,\"names\":{\"en\":\"Rajasthan\",\"es\":\"Rajastán\",\"fr\":\"Rajasthan\",\"ja\":\"ラージャスターン州\",\"pt-BR\":\"Rajastão\",\"ru\":\"Раджастхан\",\"zh-CN\":\"拉贾斯坦邦\"}}],\"traits\":{\"user_type\":\"residential\",\"autonomous_system_number\":45609,\"autonomous_system_organization\":\"Bharti Airtel Ltd. AS for GPRS Service\",\"isp\":\"Bharti Airtel\",\"organization\":\"Bharti Airtel\",\"ip_address\":\"223.178.145.184\"},\"represented_country\":{\"names\":{}}}', '2019-08-28 18:45:17', '2019-08-28 18:45:17', NULL),
(14, '6ba31fa6-7498-434e-aafc-edd94858e4e8', 'Asia', 'India', 'Asia/Kolkata', 'IN', 'Rajasthan', 'Jaipur', '302001', 'IN', '26.9133', '75.7879', '302001', '302001', '302001', '223.238.206.224', NULL, '2019-08-29 02:24:46', NULL, 1, NULL, NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Bharti Airtel', 'Bharti Airtel', 'Bharti Airtel', NULL, 0, NULL, '{\"city\":{\"confidence\":20,\"geoname_id\":1269515,\"names\":{\"de\":\"Jaipur\",\"en\":\"Jaipur\",\"es\":\"Jaipur\",\"fr\":\"Jaipur\",\"ja\":\"ジャイプル\",\"pt-BR\":\"Jaipur\",\"ru\":\"Джайпур\"}},\"continent\":{\"code\":\"AS\",\"geoname_id\":6255147,\"names\":{\"es\":\"Asia\",\"fr\":\"Asie\",\"ja\":\"アジア\",\"pt-BR\":\"Ásia\",\"ru\":\"Азия\",\"zh-CN\":\"亚洲\",\"de\":\"Asien\",\"en\":\"Asia\"}},\"country\":{\"confidence\":99,\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\"}},\"location\":{\"accuracy_radius\":200,\"latitude\":26.9133,\"longitude\":75.7879,\"time_zone\":\"Asia/Kolkata\"},\"postal\":{\"confidence\":10,\"code\":\"302001\"},\"registered_country\":{\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\"}},\"subdivisions\":[{\"confidence\":90,\"iso_code\":\"RJ\",\"geoname_id\":1258899,\"names\":{\"ja\":\"ラージャスターン州\",\"pt-BR\":\"Rajastão\",\"ru\":\"Раджастхан\",\"zh-CN\":\"拉贾斯坦邦\",\"en\":\"Rajasthan\",\"es\":\"Rajastán\",\"fr\":\"Rajasthan\"}}],\"traits\":{\"user_type\":\"cellular\",\"autonomous_system_number\":45609,\"autonomous_system_organization\":\"Bharti Airtel Ltd. AS for GPRS Service\",\"isp\":\"Bharti Airtel\",\"organization\":\"Bharti Airtel\",\"ip_address\":\"223.238.206.224\"},\"represented_country\":{\"names\":{}}}', '2019-08-28 20:54:46', '2019-08-28 20:54:46', NULL),
(15, 'c3c5438d-3575-4f6d-a62c-032213d4f6b3', 'Asia', 'India', 'Asia/Kolkata', 'IN', 'Rajasthan', 'Jaipur', '302001', 'IN', '26.9133', '75.7879', '302001', '302001', '302001', '223.238.206.224', NULL, '2019-08-29 02:24:46', NULL, 1, NULL, NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 'Bharti Airtel', 'Bharti Airtel', 'Bharti Airtel', NULL, 0, NULL, '{\"city\":{\"confidence\":20,\"geoname_id\":1269515,\"names\":{\"ja\":\"ジャイプル\",\"pt-BR\":\"Jaipur\",\"ru\":\"Джайпур\",\"de\":\"Jaipur\",\"en\":\"Jaipur\",\"es\":\"Jaipur\",\"fr\":\"Jaipur\"}},\"continent\":{\"code\":\"AS\",\"geoname_id\":6255147,\"names\":{\"fr\":\"Asie\",\"ja\":\"アジア\",\"pt-BR\":\"Ásia\",\"ru\":\"Азия\",\"zh-CN\":\"亚洲\",\"de\":\"Asien\",\"en\":\"Asia\",\"es\":\"Asia\"}},\"country\":{\"confidence\":99,\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\"}},\"location\":{\"accuracy_radius\":200,\"latitude\":26.9133,\"longitude\":75.7879,\"time_zone\":\"Asia/Kolkata\"},\"postal\":{\"confidence\":10,\"code\":\"302001\"},\"registered_country\":{\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\"}},\"subdivisions\":[{\"confidence\":90,\"iso_code\":\"RJ\",\"geoname_id\":1258899,\"names\":{\"en\":\"Rajasthan\",\"es\":\"Rajastán\",\"fr\":\"Rajasthan\",\"ja\":\"ラージャスターン州\",\"pt-BR\":\"Rajastão\",\"ru\":\"Раджастхан\",\"zh-CN\":\"拉贾斯坦邦\"}}],\"traits\":{\"user_type\":\"cellular\",\"autonomous_system_number\":45609,\"autonomous_system_organization\":\"Bharti Airtel Ltd. AS for GPRS Service\",\"isp\":\"Bharti Airtel\",\"organization\":\"Bharti Airtel\",\"ip_address\":\"223.238.206.224\"},\"represented_country\":{\"names\":{}}}', '2019-08-28 20:54:46', '2019-08-28 20:54:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `short_urls`
--

CREATE TABLE `short_urls` (
  `_id` bigint(32) UNSIGNED NOT NULL,
  `session_id` bigint(32) UNSIGNED DEFAULT NULL,
  `partition_index_number` varchar(1) COLLATE utf16_bin DEFAULT NULL,
  `partition_index` varchar(1) COLLATE utf16_bin DEFAULT NULL,
  `special_url` varchar(255) COLLATE utf16_bin DEFAULT NULL,
  `short_url` varchar(1024) COLLATE utf16_bin DEFAULT NULL,
  `original_url` varchar(1024) COLLATE utf16_bin DEFAULT NULL,
  `url_meta` text COLLATE utf16_bin,
  `url_category` varchar(255) COLLATE utf16_bin DEFAULT NULL,
  `domain` varchar(255) COLLATE utf16_bin DEFAULT NULL,
  `force_disabled` tinyint(1) DEFAULT '0',
  `hits` bigint(32) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `short_urls`
--

INSERT INTO `short_urls` (`_id`, `session_id`, `partition_index_number`, `partition_index`, `special_url`, `short_url`, `original_url`, `url_meta`, `url_category`, `domain`, `force_disabled`, `hits`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, '2', 'b', 'as', 'bN', 'https://momentjs.com/docs/#/use-it/', NULL, NULL, 'momentjs.com', 0, 0, '2019-08-28 10:44:21', '2019-08-28 16:14:21', NULL),
(2, NULL, '2', 'b', 'as', 'bO', 'https://momentjs.com/docs/#/use-it/', NULL, NULL, 'momentjs.com', 0, 0, '2019-08-28 10:44:27', '2019-08-28 16:14:27', NULL),
(3, NULL, '2', 'b', 'as', 'bP', 'https://momentjs.com/docs/#/use-it/', NULL, NULL, 'momentjs.com', 0, 0, '2019-08-28 10:45:39', '2019-08-28 16:15:39', NULL),
(4, NULL, '2', 'b', 'as', 'bQ', 'https://momentjs.com/docs/#/use-it/', NULL, NULL, 'momentjs.com', 0, 0, '2019-08-28 10:47:23', '2019-08-28 16:17:23', NULL),
(5, NULL, '2', 'b', 'as', 'bR', 'https://momentjs.com/docs/#/use-it/', NULL, NULL, 'momentjs.com', 0, 0, '2019-08-28 10:47:40', '2019-08-28 16:17:40', NULL),
(6, NULL, '2', 'b', 'as', 'bS', 'https://momentjs.com/docs/#/use-it/', NULL, NULL, 'momentjs.com', 0, 0, '2019-08-28 10:50:58', '2019-08-28 16:20:58', NULL),
(7, NULL, '2', 'b', 'as', 'bT', 'https://momentjs.com/docs/#/use-it/', NULL, NULL, 'momentjs.com', 0, 0, '2019-08-28 10:52:09', '2019-08-28 16:22:09', NULL),
(8, NULL, '2', 'b', 'as', 'bU', 'https://momentjs.com/docs/#/use-it/', NULL, NULL, 'momentjs.com', 0, 0, '2019-08-28 10:52:29', '2019-08-28 10:52:30', NULL),
(9, NULL, '2', 'b', 'as', 'bV', 'https://momentjs.com/docs/#/use-it/', NULL, NULL, 'momentjs.com', 0, 0, '2019-08-28 10:56:53', '2019-08-28 10:56:54', NULL),
(10, NULL, '2', 'b', NULL, 'bW', 'https://cloud.digitalocean.com/droplets/155719469/graphs?i=4ffc3b&period=hour&preserveScrollPosition=true', NULL, NULL, 'cloud.digitalocean.com', 0, 0, '2019-08-28 11:48:30', '2019-08-28 17:18:30', NULL),
(11, NULL, '2', 'b', NULL, 'bX', 'https://momentjs.com/docs/#/use-it/987', NULL, NULL, 'momentjs.com', 0, 0, '2019-08-28 11:57:04', '2019-08-28 17:27:04', NULL),
(12, NULL, '2', 'b', NULL, 'bY', 'https://momentjs.com/docs/#/use-it/9876', NULL, NULL, 'momentjs.com', 0, 0, '2019-08-28 11:59:10', '2019-08-28 17:29:10', NULL),
(13, NULL, '2', 'b', NULL, 'bZ', 'https://momentjs.com/docs/#/use-it/9876', NULL, NULL, 'momentjs.com', 0, 0, '2019-08-28 12:48:07', '2019-08-28 18:18:07', NULL),
(14, NULL, '2', 'b', NULL, 'b0', 'https://momentjs.com/docs/#/use-it/9876', NULL, NULL, 'momentjs.com', 0, 0, '2019-08-28 12:57:17', '2019-08-28 18:27:17', NULL),
(15, NULL, '2', 'b', NULL, 'b1', 'https://momentjs.com/docs/#/use-it/9876', NULL, NULL, 'momentjs.com', 0, 0, '2019-08-28 12:57:29', '2019-08-28 18:27:29', NULL),
(16, NULL, '2', 'b', NULL, 'b2', 'https://vuetifyjs.com/en/styles/colors#material-colors', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:26:37', '2019-08-28 18:56:37', NULL),
(17, NULL, '2', 'b', NULL, 'b3', 'https://vuetifyjs.com/en/styles/colors#material-colors', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:26:53', '2019-08-28 18:56:53', NULL),
(18, NULL, '2', 'b', NULL, 'b4', 'https://vuetifyjs.com/en/styles/colors#material-colors', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:27:05', '2019-08-28 18:57:05', NULL),
(19, NULL, '2', 'b', NULL, 'b5', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:28:11', '2019-08-28 18:58:11', NULL),
(20, NULL, '2', 'b', NULL, 'b6', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:29:19', '2019-08-28 18:59:19', NULL),
(21, NULL, '2', 'b', NULL, 'b7', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:30:09', '2019-08-28 19:00:09', NULL),
(22, NULL, '2', 'b', NULL, 'b8', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:30:11', '2019-08-28 19:00:11', NULL),
(23, NULL, '2', 'b', NULL, 'b9', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:31:30', '2019-08-28 19:01:30', NULL),
(24, NULL, '2', 'c', NULL, 'ca', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:31:40', '2019-08-28 19:01:40', NULL),
(25, NULL, '2', 'c', NULL, 'cb', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:33:22', '2019-08-28 13:33:23', NULL),
(26, NULL, '2', 'c', NULL, 'cc', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:33:44', '2019-08-28 19:03:44', NULL),
(27, NULL, '2', 'c', NULL, 'cd', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:33:55', '2019-08-28 19:03:55', NULL),
(28, NULL, '2', 'c', NULL, 'ce', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:34:05', '2019-08-28 19:04:05', NULL),
(29, NULL, '2', 'c', NULL, 'cf', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:34:18', '2019-08-28 19:04:18', NULL),
(30, NULL, '2', 'c', NULL, 'cg', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:34:41', '2019-08-28 19:04:41', NULL),
(31, NULL, '2', 'c', NULL, 'ch', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:34:51', '2019-08-28 19:04:51', NULL),
(32, NULL, '2', 'c', NULL, 'ci', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:36:31', '2019-08-28 19:06:31', NULL),
(33, NULL, '2', 'c', NULL, 'cj', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:36:37', '2019-08-28 19:06:37', NULL),
(34, NULL, '2', 'c', NULL, 'ck', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 13:36:43', '2019-08-28 19:06:43', NULL),
(35, NULL, '2', 'c', '4', 'cl', 'https://bitly.com/', NULL, NULL, 'bitly.com', 0, 0, '2019-08-28 13:52:13', '2019-08-28 19:22:13', NULL),
(36, NULL, '2', 'c', 'lop8654', 'cm', 'https://bitly.com/', NULL, NULL, 'bitly.com', 0, 0, '2019-08-28 13:53:43', '2019-08-28 13:53:44', NULL),
(37, NULL, '2', 'c', 'lop8654', 'cn', 'https://bitly.com/', NULL, NULL, 'bitly.com', 0, 0, '2019-08-28 13:54:06', '2019-08-28 19:24:06', NULL),
(38, NULL, '2', 'c', NULL, 'co', 'https://www.google.com/appserve/mkt/optout/AFnwnKXLDnK8ilIUpbnWeMu2F0OfW7kl2vX6AbkMCWCSXKwnYUmTcZcavhKh5elqLDZDHTfl?hl=en', NULL, NULL, 'www.google.com', 0, 0, '2019-08-28 20:36:53', '2019-08-29 02:06:53', NULL),
(39, NULL, '2', 'c', '589o', 'cp', 'https://www.google.com/appserve/mkt/optout/AFnwnKXLDnK8ilIUpbnWeMu2F0OfW7kl2vX6AbkMCWCSXKwnYUmTcZcavhKh5elqLDZDHTfl?hl=en', NULL, NULL, 'www.google.com', 0, 0, '2019-08-28 20:37:03', '2019-08-29 02:07:03', NULL),
(40, NULL, '2', 'c', '589o', 'cq', 'https://www.google.com/appserve/mkt/optout/AFnwnKXLDnK8ilIUpbnWeMu2F0OfW7kl2vX6AbkMCWCSXKwnYUmTcZcavhKh5elqLDZDHTfl?hl=en', NULL, NULL, 'www.google.com', 0, 0, '2019-08-28 20:37:09', '2019-08-29 02:07:09', NULL),
(41, NULL, '2', 'c', '589o', 'cr', 'https://www.google.com/appserve/mkt/optout/AFnwnKXLDnK8ilIUpbnWeMu2F0OfW7kl2vX6AbkMCWCSXKwnYUmTcZcavhKh5elqLDZDHTfl?hl=en', NULL, NULL, 'www.google.com', 0, 0, '2019-08-28 20:37:14', '2019-08-28 20:37:15', NULL),
(42, NULL, '2', 'c', '589o', 'cs', 'https://www.google.com/appserve/mkt/optout/AFnwnKXLDnK8ilIUpbnWeMu2F0OfW7kl2vX6AbkMCWCSXKwnYUmTcZcavhKh5elqLDZDHTfl?hl=en', NULL, NULL, 'www.google.com', 0, 0, '2019-08-28 20:41:26', '2019-08-29 02:11:26', NULL),
(43, NULL, '2', 'c', '589o', 'ct', 'https://www.google.com/appserve/mkt/optout/AFnwnKXLDnK8ilIUpbnWeMu2F0OfW7kl2vX6AbkMCWCSXKwnYUmTcZcavhKh5elqLDZDHTfl?hl=en', NULL, NULL, 'www.google.com', 0, 0, '2019-08-28 20:41:34', '2019-08-29 02:11:34', NULL),
(44, NULL, '2', 'c', 'lop8654', 'cu', 'https://bitly.com/', NULL, NULL, 'bitly.com', 0, 0, '2019-08-28 20:46:48', '2019-08-29 02:16:48', NULL),
(45, NULL, '2', 'c', 'bc', 'cv', 'https://vuetifyjs.com/en/components/snackbars', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-28 20:55:05', '2019-08-29 02:25:05', NULL),
(46, NULL, '2', 'c', NULL, 'cw', 'https://cloud.digitalocean.com/droplets/155719469/graphs?i=4ffc3b&period=hour&preserveScrollPosition=true', NULL, NULL, 'cloud.digitalocean.com', 0, 0, '2019-08-28 21:01:58', '2019-08-29 02:31:58', NULL),
(47, NULL, '2', 'c', NULL, 'cx', 'https://cloud.digitalocean.com/droplets/155719469/graphs?i=4ffc3b&period=hour&preserveScrollPosition=true', NULL, NULL, 'cloud.digitalocean.com', 0, 0, '2019-08-28 21:02:02', '2019-08-29 02:32:02', NULL),
(48, NULL, '2', 'c', 'asdf', 'cy', 'https://cloud.digitalocean.com/droplets/155719469/graphs?i=4ffc3b&period=hour&preserveScrollPosition=true', NULL, NULL, 'cloud.digitalocean.com', 0, 0, '2019-08-28 21:02:06', '2019-08-29 02:32:06', NULL),
(49, NULL, '2', 'c', NULL, 'cz', ' https://cl oud.digitalocea n.com/droplets/155719469/graphs?i=4ffc3b&period=hour&preserveScrollPosition=true 234', NULL, NULL, 'cl oud.digitalocea n.com', 0, 0, '2019-08-28 21:02:38', '2019-08-29 02:32:38', NULL),
(50, NULL, '2', 'c', '798', 'cA', ' https://cl oud.digitalocea n.com/droplets/155719469/graphs?i=4ffc3b&period=hour&preserveScrollPosition=true 234', NULL, NULL, 'cl oud.digitalocea n.com', 0, 0, '2019-08-28 21:02:48', '2019-08-29 02:32:48', NULL),
(51, NULL, '2', 'c', 'logh', 'cB', 'https://www.crazydomains.in/login/domain-name-login/', NULL, NULL, 'www.crazydomains.in', 0, 0, '2019-08-28 21:10:23', '2019-08-29 02:40:23', NULL),
(52, NULL, '2', 'c', 'loghd', 'cC', 'https://www.crazydomains.in/login/domain-name-login/', NULL, NULL, 'www.crazydomains.in', 0, 0, '2019-08-28 21:37:10', '2019-08-29 03:07:10', NULL),
(53, NULL, '2', 'c', 'man', 'cD', 'https://manage.crazydomains.in/members/web-hosting/', NULL, NULL, 'manage.crazydomains.in', 0, 0, '2019-08-28 21:40:38', '2019-08-29 03:10:38', NULL),
(54, NULL, '2', 'c', 'we', 'cE', 'https://manage.crazydomains.in/members/web-hosting/', NULL, NULL, 'manage.crazydomains.in', 0, 0, '2019-08-28 21:40:57', '2019-08-29 03:10:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `url_settings`
--

CREATE TABLE `url_settings` (
  `_id` bigint(32) UNSIGNED NOT NULL,
  `url_id` bigint(32) UNSIGNED NOT NULL,
  `session_id` bigint(32) UNSIGNED DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf16_bin NOT NULL DEFAULT 'utc',
  `user_name` varchar(32) COLLATE utf16_bin DEFAULT NULL,
  `user_email` varchar(255) COLLATE utf16_bin DEFAULT NULL,
  `user_mobile` varchar(16) COLLATE utf16_bin DEFAULT NULL,
  `user_country` varchar(255) COLLATE utf16_bin DEFAULT NULL,
  `user_state` varchar(255) COLLATE utf16_bin DEFAULT NULL,
  `user_city` varchar(255) COLLATE utf16_bin DEFAULT NULL,
  `show_ads` tinyint(1) NOT NULL DEFAULT '1',
  `record_stats` tinyint(1) NOT NULL DEFAULT '0',
  `expire_date` date DEFAULT NULL,
  `expire_tiime` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `short_urls`
--
ALTER TABLE `short_urls`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `special_url` (`special_url`(191)),
  ADD KEY `short_url` (`short_url`(191)),
  ADD KEY `original_url` (`original_url`(191)),
  ADD KEY `partition_index` (`partition_index`),
  ADD KEY `partition_index_number` (`partition_index_number`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `url_settings`
--
ALTER TABLE `url_settings`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `url_id` (`url_id`),
  ADD KEY `session_id` (`session_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `short_urls`
--
ALTER TABLE `short_urls`
  MODIFY `_id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `url_settings`
--
ALTER TABLE `url_settings`
  MODIFY `_id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `quotes`
--
ALTER TABLE `quotes`
  ADD CONSTRAINT `quotes_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `short_urls`
--
ALTER TABLE `short_urls`
  ADD CONSTRAINT `short_urls_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `url_settings`
--
ALTER TABLE `url_settings`
  ADD CONSTRAINT `url_settings_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `url_settings_ibfk_2` FOREIGN KEY (`url_id`) REFERENCES `short_urls` (`_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
