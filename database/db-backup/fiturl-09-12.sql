-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 12, 2019 at 06:55 AM
-- Server version: 5.7.27
-- PHP Version: 7.1.32-1+0~20190902.23+debian9~1.gbp9d1be7

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fiturl`
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
  `region` varchar(64) COLLATE utf16_bin DEFAULT NULL,
  `country` varchar(64) COLLATE utf16_bin DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf16_bin DEFAULT NULL,
  `country_code` varchar(16) COLLATE utf16_bin DEFAULT NULL,
  `state` varchar(64) COLLATE utf16_bin DEFAULT NULL,
  `city` varchar(64) COLLATE utf16_bin DEFAULT NULL,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `session`, `region`, `country`, `timezone`, `country_code`, `state`, `city`, `zip_code`, `iso_code`, `lat`, `long`, `postal_code`, `area_code`, `metro_code`, `ip`, `mac`, `time_start`, `time_end`, `visit_count`, `visit_pages`, `activity_json`, `agent`, `isp`, `org`, `business_name`, `business_website`, `blocked`, `show_info`, `raw_data`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'a7bab868-84f8-485e-b1e4-ac44e1eba3b3', 'Asia', 'India', 'Asia/Kolkata', 'IN', 'Rajasthan', 'Jaipur', '302001', 'IN', '26.9133', '75.7879', '302001', '302001', '302001', '223.238.154.142', NULL, '2019-09-01 02:15:46', '2019-09-01 12:14:53', 70, NULL, NULL, 'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0', 'Bharti Airtel', 'Bharti Airtel', 'Bharti Airtel', NULL, 0, NULL, '{\"city\":{\"confidence\":10,\"geoname_id\":1269515,\"names\":{\"ja\":\"ジャイプル\",\"pt-BR\":\"Jaipur\",\"ru\":\"Джайпур\",\"de\":\"Jaipur\",\"en\":\"Jaipur\",\"es\":\"Jaipur\",\"fr\":\"Jaipur\"}},\"continent\":{\"code\":\"AS\",\"geoname_id\":6255147,\"names\":{\"ja\":\"アジア\",\"pt-BR\":\"Ásia\",\"ru\":\"Азия\",\"zh-CN\":\"亚洲\",\"de\":\"Asien\",\"en\":\"Asia\",\"es\":\"Asia\",\"fr\":\"Asie\"}},\"country\":{\"confidence\":99,\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\"}},\"location\":{\"accuracy_radius\":200,\"latitude\":26.9133,\"longitude\":75.7879,\"time_zone\":\"Asia/Kolkata\"},\"postal\":{\"confidence\":10,\"code\":\"302001\"},\"registered_country\":{\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\"}},\"subdivisions\":[{\"confidence\":90,\"iso_code\":\"RJ\",\"geoname_id\":1258899,\"names\":{\"fr\":\"Rajasthan\",\"ja\":\"ラージャスターン州\",\"pt-BR\":\"Rajastão\",\"ru\":\"Раджастхан\",\"zh-CN\":\"拉贾斯坦邦\",\"en\":\"Rajasthan\",\"es\":\"Rajastán\"}}],\"traits\":{\"user_type\":\"cellular\",\"autonomous_system_number\":45609,\"autonomous_system_organization\":\"Bharti Airtel Ltd. AS for GPRS Service\",\"isp\":\"Bharti Airtel\",\"organization\":\"Bharti Airtel\",\"ip_address\":\"223.238.154.142\"},\"represented_country\":{\"names\":{}}}', '2019-08-23 03:45:46', '2019-09-01 12:24:12', NULL),
(2, 'a7bab868-84f8-485e-b1e4-ac44e1eba3b3', 'Asia', 'India', 'Asia/Kolkata', 'IN', 'Rajasthan', 'Jaipur', '302001', 'IN', '26.9133', '75.7879', '302001', '302001', '302001', '223.238.154.142', NULL, '2019-09-01 05:49:14', NULL, 1, NULL, NULL, 'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0', 'Bharti Airtel', 'Bharti Airtel', 'Bharti Airtel', NULL, 0, NULL, '{\"city\":{\"confidence\":10,\"geoname_id\":1269515,\"names\":{\"ja\":\"ジャイプル\",\"pt-BR\":\"Jaipur\",\"ru\":\"Джайпур\",\"de\":\"Jaipur\",\"en\":\"Jaipur\",\"es\":\"Jaipur\",\"fr\":\"Jaipur\"}},\"continent\":{\"code\":\"AS\",\"geoname_id\":6255147,\"names\":{\"pt-BR\":\"Ásia\",\"ru\":\"Азия\",\"zh-CN\":\"亚洲\",\"de\":\"Asien\",\"en\":\"Asia\",\"es\":\"Asia\",\"fr\":\"Asie\",\"ja\":\"アジア\"}},\"country\":{\"confidence\":99,\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\"}},\"location\":{\"accuracy_radius\":200,\"latitude\":26.9133,\"longitude\":75.7879,\"time_zone\":\"Asia/Kolkata\"},\"postal\":{\"confidence\":10,\"code\":\"302001\"},\"registered_country\":{\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\"}},\"subdivisions\":[{\"confidence\":90,\"iso_code\":\"RJ\",\"geoname_id\":1258899,\"names\":{\"en\":\"Rajasthan\",\"es\":\"Rajastán\",\"fr\":\"Rajasthan\",\"ja\":\"ラージャスターン州\",\"pt-BR\":\"Rajastão\",\"ru\":\"Раджастхан\",\"zh-CN\":\"拉贾斯坦邦\"}}],\"traits\":{\"user_type\":\"cellular\",\"autonomous_system_number\":45609,\"autonomous_system_organization\":\"Bharti Airtel Ltd. AS for GPRS Service\",\"isp\":\"Bharti Airtel\",\"organization\":\"Bharti Airtel\",\"ip_address\":\"223.238.154.142\"},\"represented_country\":{\"names\":{}}}', '2019-09-01 00:19:14', '2019-09-01 00:19:14', NULL),
(3, 'a7bab868-84f8-485e-b1e4-ac44e1eba3b3', 'Asia', 'India', 'Asia/Kolkata', 'IN', 'Rajasthan', 'Jaipur', '302004', 'IN', '26.9133', '75.7879', '302004', '302004', '302004', '2401:4900:3051:c252:e029:9a5d:3c7d:cb3', NULL, '2019-09-01 08:07:02', NULL, 1, NULL, NULL, 'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0', 'Bharti Airtel', 'Bharti Airtel', 'Bharti Airtel', NULL, 0, NULL, '{\"city\":{\"confidence\":40,\"geoname_id\":1269515,\"names\":{\"ja\":\"ジャイプル\",\"pt-BR\":\"Jaipur\",\"ru\":\"Джайпур\",\"de\":\"Jaipur\",\"en\":\"Jaipur\",\"es\":\"Jaipur\",\"fr\":\"Jaipur\"}},\"continent\":{\"code\":\"AS\",\"geoname_id\":6255147,\"names\":{\"pt-BR\":\"Ásia\",\"ru\":\"Азия\",\"zh-CN\":\"亚洲\",\"de\":\"Asien\",\"en\":\"Asia\",\"es\":\"Asia\",\"fr\":\"Asie\",\"ja\":\"アジア\"}},\"country\":{\"confidence\":99,\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\"}},\"location\":{\"accuracy_radius\":200,\"latitude\":26.9133,\"longitude\":75.7879,\"time_zone\":\"Asia/Kolkata\"},\"postal\":{\"confidence\":10,\"code\":\"302004\"},\"registered_country\":{\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\"}},\"subdivisions\":[{\"confidence\":90,\"iso_code\":\"RJ\",\"geoname_id\":1258899,\"names\":{\"pt-BR\":\"Rajastão\",\"ru\":\"Раджастхан\",\"zh-CN\":\"拉贾斯坦邦\",\"en\":\"Rajasthan\",\"es\":\"Rajastán\",\"fr\":\"Rajasthan\",\"ja\":\"ラージャスターン州\"}}],\"traits\":{\"user_type\":\"residential\",\"autonomous_system_number\":45609,\"autonomous_system_organization\":\"Bharti Airtel Ltd. AS for GPRS Service\",\"isp\":\"Bharti Airtel\",\"organization\":\"Bharti Airtel\",\"ip_address\":\"2401:4900:3051:c252:e029:9a5d:3c7d:cb3\"},\"represented_country\":{\"names\":{}}}', '2019-09-01 08:07:02', '2019-09-01 08:07:02', NULL),
(4, 'a7bab868-84f8-485e-b1e4-ac44e1eba3b3', 'Asia', 'India', 'Asia/Kolkata', 'IN', 'Rajasthan', 'Jaipur', '302004', 'IN', '26.9133', '75.7879', '302004', '302004', '302004', '2401:4900:3051:c252:e029:9a5d:3c7d:cb3', NULL, '2019-09-01 11:46:46', NULL, 1, NULL, NULL, 'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0', 'Bharti Airtel', 'Bharti Airtel', 'Bharti Airtel', NULL, 0, NULL, '{\"city\":{\"confidence\":40,\"geoname_id\":1269515,\"names\":{\"de\":\"Jaipur\",\"en\":\"Jaipur\",\"es\":\"Jaipur\",\"fr\":\"Jaipur\",\"ja\":\"ジャイプル\",\"pt-BR\":\"Jaipur\",\"ru\":\"Джайпур\"}},\"continent\":{\"code\":\"AS\",\"geoname_id\":6255147,\"names\":{\"de\":\"Asien\",\"en\":\"Asia\",\"es\":\"Asia\",\"fr\":\"Asie\",\"ja\":\"アジア\",\"pt-BR\":\"Ásia\",\"ru\":\"Азия\",\"zh-CN\":\"亚洲\"}},\"country\":{\"confidence\":99,\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\"}},\"location\":{\"accuracy_radius\":200,\"latitude\":26.9133,\"longitude\":75.7879,\"time_zone\":\"Asia/Kolkata\"},\"postal\":{\"confidence\":10,\"code\":\"302004\"},\"registered_country\":{\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\"}},\"subdivisions\":[{\"confidence\":90,\"iso_code\":\"RJ\",\"geoname_id\":1258899,\"names\":{\"zh-CN\":\"拉贾斯坦邦\",\"en\":\"Rajasthan\",\"es\":\"Rajastán\",\"fr\":\"Rajasthan\",\"ja\":\"ラージャスターン州\",\"pt-BR\":\"Rajastão\",\"ru\":\"Раджастхан\"}}],\"traits\":{\"user_type\":\"residential\",\"autonomous_system_number\":45609,\"autonomous_system_organization\":\"Bharti Airtel Ltd. AS for GPRS Service\",\"isp\":\"Bharti Airtel\",\"organization\":\"Bharti Airtel\",\"ip_address\":\"2401:4900:3051:c252:e029:9a5d:3c7d:cb3\"},\"represented_country\":{\"names\":{}}}', '2019-09-01 11:46:46', '2019-09-01 11:46:46', NULL),
(5, 'a7bab868-84f8-485e-b1e4-ac44e1eba3b3', 'Asia', 'India', 'Asia/Kolkata', 'IN', 'Rajasthan', 'Jaipur', '302004', 'IN', '26.9133', '75.7879', '302004', '302004', '302004', '2401:4900:3051:c252:e029:9a5d:3c7d:cb3', NULL, '2019-09-01 11:46:46', NULL, 1, NULL, NULL, 'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0', 'Bharti Airtel', 'Bharti Airtel', 'Bharti Airtel', NULL, 0, NULL, '{\"city\":{\"confidence\":40,\"geoname_id\":1269515,\"names\":{\"de\":\"Jaipur\",\"en\":\"Jaipur\",\"es\":\"Jaipur\",\"fr\":\"Jaipur\",\"ja\":\"ジャイプル\",\"pt-BR\":\"Jaipur\",\"ru\":\"Джайпур\"}},\"continent\":{\"code\":\"AS\",\"geoname_id\":6255147,\"names\":{\"de\":\"Asien\",\"en\":\"Asia\",\"es\":\"Asia\",\"fr\":\"Asie\",\"ja\":\"アジア\",\"pt-BR\":\"Ásia\",\"ru\":\"Азия\",\"zh-CN\":\"亚洲\"}},\"country\":{\"confidence\":99,\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\"}},\"location\":{\"accuracy_radius\":200,\"latitude\":26.9133,\"longitude\":75.7879,\"time_zone\":\"Asia/Kolkata\"},\"postal\":{\"confidence\":10,\"code\":\"302004\"},\"registered_country\":{\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\"}},\"subdivisions\":[{\"confidence\":90,\"iso_code\":\"RJ\",\"geoname_id\":1258899,\"names\":{\"zh-CN\":\"拉贾斯坦邦\",\"en\":\"Rajasthan\",\"es\":\"Rajastán\",\"fr\":\"Rajasthan\",\"ja\":\"ラージャスターン州\",\"pt-BR\":\"Rajastão\",\"ru\":\"Раджастхан\"}}],\"traits\":{\"user_type\":\"residential\",\"autonomous_system_number\":45609,\"autonomous_system_organization\":\"Bharti Airtel Ltd. AS for GPRS Service\",\"isp\":\"Bharti Airtel\",\"organization\":\"Bharti Airtel\",\"ip_address\":\"2401:4900:3051:c252:e029:9a5d:3c7d:cb3\"},\"represented_country\":{\"names\":{}}}', '2019-09-01 11:46:46', '2019-09-01 11:46:46', NULL),
(6, 'e0633c9a-8678-4ae3-bc10-c93548b4e733', NULL, NULL, 'UTC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-08 15:48:31', '2019-09-08 17:13:54', 4, NULL, NULL, 'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0', NULL, NULL, NULL, NULL, 0, NULL, 'null', '2019-09-08 15:48:31', '2019-09-08 17:24:40', NULL),
(7, 'e0633c9a-8678-4ae3-bc10-c93548b4e733', NULL, NULL, 'UTC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-08 17:11:53', NULL, 1, NULL, NULL, 'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0', NULL, NULL, NULL, NULL, 0, NULL, 'null', '2019-09-08 17:11:53', '2019-09-08 17:11:53', NULL),
(8, 'e0633c9a-8678-4ae3-bc10-c93548b4e733', NULL, NULL, 'UTC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-12 01:06:49', NULL, 1, NULL, NULL, 'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0', NULL, NULL, NULL, NULL, 0, NULL, 'null', '2019-09-12 01:06:49', '2019-09-12 01:06:49', NULL);

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
(1, 1, '2', 'b', 'testttt', 'bN', 'https://github.com/notifme/notifme-sdk', NULL, NULL, 'github.com', 0, 0, '2019-08-31 21:20:39', '2019-09-01 02:50:39', NULL),
(2, 1, '2', 'b', 'kio', 'bO', 'https://github.com/notifme/notifme-sdk', NULL, NULL, 'github.com', 0, 0, '2019-08-31 21:22:20', '2019-09-01 02:52:20', NULL),
(3, 1, '2', 'b', 'testinggggg', 'bP', 'https://www.google-analytics.com/analytics.js', NULL, NULL, 'www.google-analytics.com', 0, 0, '2019-08-31 21:33:47', '2019-09-01 03:03:47', NULL),
(4, 1, '2', 'b', '45', 'bQ', 'https://github.com/ronakjain2012/FitURL/projects/1?fullscreen=true', NULL, NULL, 'github.com', 0, 0, '2019-08-31 21:55:46', '2019-09-01 03:25:46', NULL),
(5, 1, '2', 'b', NULL, 'bR', 'https://github.com/ronakjain2012/FitURL/projects/1?fullscreen=true85', NULL, NULL, 'github.com', 0, 0, '2019-08-31 21:59:11', '2019-09-01 03:29:11', NULL),
(6, 1, '2', 'b', NULL, 'bS', 'https://vuetifyjs.com/en/components/cards#cards', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-08-31 22:50:04', '2019-09-01 04:20:04', NULL),
(7, 1, '2', 'b', NULL, 'bT', 'https://github.com/notifme/notifme-sdk', NULL, NULL, 'github.com', 0, 0, '2019-08-31 22:50:43', '2019-09-01 04:20:43', NULL),
(8, 1, '2', 'b', NULL, 'bU', 'http://localhost:3000/', NULL, NULL, 'localhost:3000', 0, 0, '2019-08-31 22:52:36', '2019-09-01 04:22:36', NULL),
(9, 1, '2', 'b', '879879876', 'bV', 'https://demos.creative-tim.com/vuetify-material-dashboard/documentation/component-docs/cards.html#stats-card', NULL, NULL, 'demos.creative-tim.com', 0, 0, '2019-09-01 00:20:21', '2019-09-01 05:50:21', NULL),
(10, 1, '2', 'b', NULL, 'bW', 'https://demos.creative-tim.com/vuetify-material-dashboard/documentation/component-docs/cards.html#stats-card35', NULL, NULL, 'demos.creative-tim.com', 0, 0, '2019-09-01 00:22:01', '2019-09-01 05:52:01', NULL),
(11, 1, '2', 'b', NULL, 'bX', 'https://demos.creative-tim.com/vuetify-material-dashboard/documentation/component-docs/cards.html#stats-card', NULL, NULL, 'demos.creative-tim.com', 0, 0, '2019-09-01 00:24:02', '2019-09-01 05:54:02', NULL),
(12, 1, '2', 'b', NULL, 'bY', 'https://vuetifyjs.com/en/components/buttons#apiasd', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-09-01 00:30:52', '2019-09-01 06:00:52', NULL),
(13, 1, '2', 'b', NULL, 'bZ', 'https://github.com/ronakjain2012/FitURL/projects/1?fullscreen=true', NULL, NULL, 'github.com', 0, 0, '2019-09-01 00:39:38', '2019-09-01 06:09:38', NULL),
(14, 1, '2', 'b', 'aszcxc', 'b0', 'https://github.com/notifme/notifme-sdkas', NULL, NULL, 'github.com', 0, 0, '2019-09-01 00:43:33', '2019-09-01 06:13:33', NULL),
(15, 1, '2', 'b', NULL, 'b1', 'https://vuetifyjs.com/en/components/buttons#api', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-09-01 00:47:29', '2019-09-01 06:17:29', NULL),
(16, 1, '2', 'b', NULL, 'b2', 'https://vuetifyjs.com/en/components/buttons#api', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-09-01 00:47:35', '2019-09-01 06:17:35', NULL),
(17, 1, '2', 'b', NULL, 'b3', 'https://vuetifyjs.com/en/components/buttons#api', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-09-01 00:47:44', '2019-09-01 06:17:44', NULL),
(18, 1, '2', 'b', NULL, 'b4', 'https://vuetifyjs.com/en/components/buttons#api', NULL, NULL, 'vuetifyjs.com', 0, 0, '2019-09-01 00:47:48', '2019-09-01 06:17:48', NULL),
(19, 1, '2', 'b', NULL, 'b5', 'https://material.io/resources/icons/?icon=keyboard_arrow_left&style=baseline', NULL, NULL, 'material.io', 0, 0, '2019-09-01 00:49:40', '2019-09-01 06:19:40', NULL),
(20, 1, '2', 'b', NULL, 'b6', 'https://material.io/resources/icons/?icon=keyboard_arrow_left&style=baseline', NULL, NULL, 'material.io', 0, 0, '2019-09-01 00:50:47', '2019-09-01 06:20:47', NULL),
(21, 1, '2', 'b', NULL, 'b7', 'https://material.io/resources/icons/?icon=keyboard_arrow_left&style=baseline', NULL, NULL, 'material.io', 0, 0, '2019-09-01 00:50:51', '2019-09-01 06:20:51', NULL),
(22, 1, '2', 'b', NULL, 'b8', 'https://github.com/ronakjain2012/FitURL/projects/1?fullscreen=true', NULL, NULL, 'github.com', 0, 0, '2019-09-01 00:52:51', '2019-09-01 06:22:51', NULL);

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
  `expire_time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `url_settings`
--

INSERT INTO `url_settings` (`_id`, `url_id`, `session_id`, `timezone`, `user_name`, `user_email`, `user_mobile`, `user_country`, `user_state`, `user_city`, `show_ads`, `record_stats`, `expire_date`, `expire_time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-08-31 21:22:20', '2019-08-31 21:22:20', NULL),
(2, 3, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-08-31 21:33:47', '2019-08-31 21:33:47', NULL),
(3, 4, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-08-31 21:55:46', '2019-08-31 21:55:46', NULL),
(4, 5, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-08-31 21:59:12', '2019-08-31 21:59:12', NULL),
(5, 6, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-08-31 22:50:04', '2019-08-31 22:50:04', NULL),
(6, 7, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-08-31 22:50:43', '2019-08-31 22:50:43', NULL),
(7, 8, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-08-31 22:52:36', '2019-08-31 22:52:36', NULL),
(8, 9, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-09-01 00:20:22', '2019-09-01 00:20:22', NULL),
(9, 10, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-09-01 00:22:01', '2019-09-01 00:22:01', NULL),
(10, 11, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-09-01 00:24:02', '2019-09-01 00:24:02', NULL),
(11, 12, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-09-01 00:30:52', '2019-09-01 00:30:52', NULL),
(12, 13, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-09-01 00:39:38', '2019-09-01 00:39:38', NULL),
(13, 14, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-09-01 00:43:33', '2019-09-01 00:43:33', NULL),
(14, 15, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-09-01 00:47:29', '2019-09-01 00:47:29', NULL),
(15, 16, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-09-01 00:47:35', '2019-09-01 00:47:35', NULL),
(16, 17, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-09-01 00:47:44', '2019-09-01 00:47:44', NULL),
(17, 18, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-09-01 00:47:48', '2019-09-01 00:47:48', NULL),
(18, 19, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-09-01 00:49:40', '2019-09-01 00:49:40', NULL),
(19, 20, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-09-01 00:50:47', '2019-09-01 00:50:47', NULL),
(20, 21, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-09-01 00:50:51', '2019-09-01 00:50:51', NULL),
(21, 22, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'Rajasthan', 'Jaipur', 1, 0, NULL, NULL, '2019-09-01 00:52:51', '2019-09-01 00:52:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visit_logs`
--

CREATE TABLE `visit_logs` (
  `id` bigint(32) UNSIGNED NOT NULL,
  `url_id` bigint(32) UNSIGNED NOT NULL,
  `session_id` bigint(32) UNSIGNED DEFAULT NULL,
  `visited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `redirected_at` timestamp NULL DEFAULT NULL,
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
-- Indexes for table `visit_logs`
--
ALTER TABLE `visit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_logs_ibfk_1` (`url_id`),
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
  MODIFY `id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `short_urls`
--
ALTER TABLE `short_urls`
  MODIFY `_id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `url_settings`
--
ALTER TABLE `url_settings`
  MODIFY `_id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `visit_logs`
--
ALTER TABLE `visit_logs`
  MODIFY `id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT;
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

--
-- Constraints for table `visit_logs`
--
ALTER TABLE `visit_logs`
  ADD CONSTRAINT `visit_logs_ibfk_1` FOREIGN KEY (`url_id`) REFERENCES `short_urls` (`_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `visit_logs_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
