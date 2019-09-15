-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 15, 2019 at 09:29 PM
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
(1, '93844daa-b81b-4f6b-86a8-b14cea2a926f', 'Asia', 'India', 'Asia/Kolkata', 'IN', 'National Capital Territory of Delhi', 'Delhi', '110054', 'IN', '28.6504', '77.2372', '110054', '110054', '110054', '2405:201:5e04:d7a:8667:724d:a679:beaa', NULL, '2019-09-15 14:24:29', '2019-09-15 10:14:28', 22, NULL, NULL, 'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0', 'Jio', 'Jio', 'Jio', NULL, 0, NULL, '{\"city\":{\"confidence\":70,\"geoname_id\":1273294,\"names\":{\"ja\":\"デリー\",\"pt-BR\":\"Deli\",\"ru\":\"Дели\",\"zh-CN\":\"德里\",\"de\":\"Delhi\",\"en\":\"Delhi\",\"es\":\"Delhi\",\"fr\":\"Delhi\"}},\"continent\":{\"code\":\"AS\",\"geoname_id\":6255147,\"names\":{\"pt-BR\":\"Ásia\",\"ru\":\"Азия\",\"zh-CN\":\"亚洲\",\"de\":\"Asien\",\"en\":\"Asia\",\"es\":\"Asia\",\"fr\":\"Asie\",\"ja\":\"アジア\"}},\"country\":{\"confidence\":99,\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\"}},\"location\":{\"accuracy_radius\":1,\"latitude\":28.6504,\"longitude\":77.2372,\"time_zone\":\"Asia/Kolkata\"},\"postal\":{\"confidence\":1,\"code\":\"110054\"},\"registered_country\":{\"iso_code\":\"IN\",\"geoname_id\":1269750,\"names\":{\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"pt-BR\":\"Índia\",\"ru\":\"Индия\",\"zh-CN\":\"印度\",\"de\":\"Indien\",\"en\":\"India\"}},\"subdivisions\":[{\"confidence\":99,\"iso_code\":\"DL\",\"geoname_id\":1273293,\"names\":{\"de\":\"Delhi\",\"en\":\"National Capital Territory of Delhi\",\"fr\":\"Delhi\"}}],\"traits\":{\"user_type\":\"cellular\",\"autonomous_system_number\":55836,\"autonomous_system_organization\":\"Reliance Jio Infocomm Limited\",\"isp\":\"Jio\",\"organization\":\"Jio\",\"ip_address\":\"2405:201:5e04:d7a:8667:724d:a679:beaa\",\"network\":\"2405:201:5e04::/50\"},\"represented_country\":{\"names\":{}}}', '2019-09-13 18:24:29', '2019-09-15 10:16:50', NULL);

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
(1, 1, '2', 'b', NULL, 'bN', 'https://adonisjs.com/docs/4.1/lucid#_findorcreate_whereattributes_values', NULL, NULL, 'adonisjs.com', 0, 0, '2019-09-15 09:07:42', '2019-09-15 14:37:42', NULL),
(2, 1, '2', 'b', NULL, 'bO', 'https://analytics.google.com/analytics/web/#/report-home/a37608390w66053002p67907719', NULL, NULL, 'analytics.google.com', 0, 0, '2019-09-15 09:48:03', '2019-09-15 15:18:03', NULL),
(3, 1, '2', 'b', NULL, 'bP', 'https://adonisjs.com/docs/4.1/lucid#_findorcreate_whereattributes_values', NULL, NULL, 'adonisjs.com', 0, 0, '2019-09-15 09:48:23', '2019-09-15 15:18:23', NULL),
(4, 1, '2', 'b', NULL, 'bQ', 'https://adonisjs.com/docs/4.1/lucid#_findorcreate_whereattributes_values', NULL, NULL, 'adonisjs.com', 0, 0, '2019-09-15 09:51:23', '2019-09-15 15:21:23', NULL);

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
(1, 1, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'National Capital Territory of Delhi', 'Delhi', 1, 0, NULL, NULL, '2019-09-15 09:07:42', '2019-09-15 09:07:42', NULL),
(2, 2, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'National Capital Territory of Delhi', 'Delhi', 1, 0, NULL, NULL, '2019-09-15 09:48:03', '2019-09-15 09:48:03', NULL),
(3, 3, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'National Capital Territory of Delhi', 'Delhi', 1, 0, NULL, NULL, '2019-09-15 09:48:24', '2019-09-15 09:48:24', NULL),
(4, 4, 1, 'Asia/Kolkata', NULL, NULL, NULL, 'IN', 'National Capital Territory of Delhi', 'Delhi', 1, 0, NULL, NULL, '2019-09-15 09:51:24', '2019-09-15 09:51:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visit_logs`
--

CREATE TABLE `visit_logs` (
  `id` bigint(32) UNSIGNED NOT NULL,
  `url_id` bigint(32) UNSIGNED DEFAULT NULL,
  `session_id` bigint(32) UNSIGNED DEFAULT NULL,
  `visited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visit_start` timestamp NULL DEFAULT NULL,
  `visit_end` timestamp NULL DEFAULT NULL,
  `skip_ad` tinyint(1) NOT NULL DEFAULT '0',
  `redirected_at` timestamp NULL DEFAULT NULL,
  `invalid_hit` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `visit_logs`
--

INSERT INTO `visit_logs` (`id`, `url_id`, `session_id`, `visited_at`, `visit_start`, `visit_end`, `skip_ad`, `redirected_at`, `invalid_hit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 1, '2019-09-15 09:53:14', '2019-09-15 09:53:14', NULL, 0, NULL, 1, '2019-09-15 09:53:15', '2019-09-15 09:53:15', NULL);

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
  MODIFY `id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `short_urls`
--
ALTER TABLE `short_urls`
  MODIFY `_id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `url_settings`
--
ALTER TABLE `url_settings`
  MODIFY `_id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `visit_logs`
--
ALTER TABLE `visit_logs`
  MODIFY `id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
