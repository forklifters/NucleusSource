-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2017 at 03:35 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nucleusvision`
--

-- --------------------------------------------------------

--
-- Table structure for table `investors`
--

CREATE TABLE `investors` (
  `investor_id` int(11) NOT NULL,
  `id` varchar(255) NOT NULL,
  `bitcoin_id` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `residence` varchar(100) NOT NULL,
  `id_type` varchar(100) NOT NULL,
  `id_num` varchar(100) NOT NULL,
  `doc1` varchar(255) NOT NULL,
  `doc2` varchar(255) NOT NULL,
  `thumb1` varchar(255) DEFAULT NULL,
  `thumb2` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `prflag` varchar(1) DEFAULT NULL,
  `bonus_per` int(11) DEFAULT NULL,
  `lock_in_period` int(11) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `investors`
--

INSERT INTO `investors` (`investor_id`, `id`, `bitcoin_id`, `email`, `first_name`, `last_name`, `dob`, `nationality`, `gender`, `residence`, `id_type`, `id_num`, `doc1`, `doc2`, `thumb1`, `thumb2`, `status`, `prflag`, `bonus_per`, `lock_in_period`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, '0xe41d2489571d322189246dafa5ebde1f4699f499', NULL, 'satya.lst02@gmail.com', 'Sush', 'S', '2017-10-02', 'INDIAN', 'Female', 'UNITED STATES OF AMERICA', 'DRIVING LICENSE', 'DOE**MJ501P1', '2f4adbd3dac248dac2f085d55e2bb86b-2017-10-31-11-33-40.jpg', '292d954ee6337b4018915f17aaddb4fd-2017-10-31-11-33-40.jpg', NULL, NULL, 'Pending', '0', NULL, NULL, NULL, NULL, '2017-10-31 18:03:40', '2017-12-05 10:41:18'),
(4, '0xe41d2489571d322189246dafa5ebde1f4699f497', NULL, 'satya.lst02@gmail.com', 'Mike', 'Ste', '1988-11-03', 'INDIAN', 'Male', 'INDIA', 'PASSPORT', 'gfhdhf6667', '7b98689146736ffe54b5e083e4603756-2017-11-01-05-07-18.png', '3c5fa2177c5d71ab0e72cf6b815b6767-2017-11-01-05-07-18.png', NULL, NULL, 'Pending', '1', 15, 12, NULL, NULL, '2017-11-01 11:37:18', '2017-12-05 09:00:34'),
(11, '0xe41d2489571d322189246dafa5ebde1f4699f498', NULL, 'satya.lst02@gmail.com', 'Avi', 'Ptiti', '1998-11-05', 'INDIAN', 'Male', 'INDIA', 'PASSPORT', 'sdfsd', '6c8173e1cf7d07e4d7ea122a0c47351e-2017-11-02-09-26-56.png', 'b514d8dfaa5a1c69c03b96e27040c67e-2017-11-02-09-26-56.png', NULL, NULL, 'Pending', '0', NULL, NULL, NULL, NULL, '2017-12-04 06:26:56', '2017-11-14 03:19:28'),
(15, '0xbb9bc244d798123fde783fcc1c72d3bb8c189413', 'dsadsad', 'satya.lst01@gmail.com', 'satya', 'b', '1987-11-04', 'ANGOLAN', 'Male', 'AMERICAN SAMOA', 'NRIC', '5454', 'c59faa3be9ed30f7066592015a10b98d-2017-11-17-04-46-31.jpg', '0c3ba36d03bf0920540a33385c4eb680-2017-11-17-04-46-31.jpg', '1510917391c59faa3be9ed30f7066592015a10b98d-2017-11-17-04-46-31.jpg', '15109173910c3ba36d03bf0920540a33385c4eb680-2017-11-17-04-46-31.jpg', 'Rejected', '1', 10, 10, NULL, NULL, '2017-11-17 11:16:31', '2017-12-06 11:56:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_02_11_154328_create_user_logs_table', 1),
('2017_02_22_070427_create_investors_table', 1),
('2017_02_27_060328_create_roles_table', 1),
('2017_02_27_065923_create_role_user_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role`) VALUES
(2, 'Admin'),
(1, 'Super'),
(3, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2017-10-27 07:40:09', '2017-10-27 07:40:09');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `dt_sales_users` datetime NOT NULL,
  `dt_sales_public` datetime NOT NULL,
  `bonus_percentage` int(11) NOT NULL,
  `no_first_buyers` int(11) NOT NULL,
  `token_price` int(11) NOT NULL,
  `min_amount` int(11) NOT NULL,
  `audit_period_days` int(11) NOT NULL,
  `max_limit` varchar(100) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `updated_by` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `dt_sales_users`, `dt_sales_public`, `bonus_percentage`, `no_first_buyers`, `token_price`, `min_amount`, `audit_period_days`, `max_limit`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '2017-10-31 19:28:00', '2017-10-31 19:28:00', 10, 5, 10, 1000, 90, '-', '', '', '2017-10-31 08:29:15', '2017-10-31 08:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` int(20) DEFAULT NULL,
  `test1` varchar(20) DEFAULT NULL,
  `test2` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `test1`, `test2`) VALUES
(1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Inactive',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `status`, `remember_token`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Nucleus', 'admin@nucleus.vision', '$2y$10$9/iAlrzitygiWbR9nhtjj.81ukUnsxCFEalC3d.ELuCyPqmMEGm4a', 'Active', 'ncxcr3FK8priEM8RhZf3ENa2yHCS9AeBEu3j7eC2Gs9To2qZUVRlLKARtiFa', NULL, NULL, '2017-10-27 07:40:08', '2017-11-23 03:32:28');

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `user_log_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_logs`
--

INSERT INTO `user_logs` (`user_log_id`, `user_id`, `login_time`, `logout_time`, `ip_address`) VALUES
(1, 1, '2017-10-27 18:40:44', '2017-10-27 19:45:34', '127.0.0.1'),
(2, 1, '2017-10-27 19:47:23', NULL, '127.0.0.1'),
(3, 1, '2017-10-27 19:59:01', '2017-10-27 20:01:19', '127.0.0.1'),
(4, 1, '2017-10-27 20:01:49', '2017-10-27 20:21:15', '127.0.0.1'),
(5, 1, '2017-10-27 20:27:49', '2017-10-27 20:44:52', '127.0.0.1'),
(6, 1, '2017-10-30 20:00:09', NULL, '127.0.0.1'),
(7, 1, '2017-10-31 14:52:30', '2017-10-31 15:10:35', '127.0.0.1'),
(8, 1, '2017-10-31 15:12:41', NULL, '127.0.0.1'),
(9, 1, '2017-10-31 05:04:56', '2017-10-31 06:33:21', '183.82.122.15'),
(10, 1, '2017-10-31 06:35:29', NULL, '183.82.122.15'),
(11, 1, '2017-10-31 06:48:43', '2017-10-31 07:26:24', '183.82.122.15'),
(12, 1, '2017-10-31 07:26:32', '2017-10-31 07:29:05', '183.82.122.15'),
(13, 1, '2017-10-31 07:29:13', '2017-10-31 07:30:35', '183.82.122.15'),
(14, 1, '2017-10-31 10:47:39', NULL, '70.121.16.237'),
(15, 1, '2017-10-31 18:40:22', '2017-10-31 18:41:31', '157.48.23.61'),
(16, 1, '2017-10-31 18:42:08', NULL, '70.121.16.237'),
(17, 1, '2017-10-31 18:52:29', '2017-10-31 18:54:29', '183.83.194.70'),
(18, 1, '2017-10-31 22:26:22', '2017-10-31 22:29:43', '183.82.122.15'),
(19, 1, '2017-10-31 22:34:38', NULL, '183.82.122.15'),
(20, 1, '2017-11-01 04:41:07', NULL, '183.82.122.15'),
(21, 1, '2017-11-01 04:47:41', NULL, '183.82.122.15'),
(22, 1, '2017-11-01 04:59:39', '2017-11-01 06:49:37', '183.82.122.15'),
(23, 1, '2017-11-01 06:50:29', NULL, '183.82.122.15'),
(24, 1, '2017-11-01 11:10:49', NULL, '183.83.194.70'),
(25, 1, '2017-11-01 19:38:04', '2017-11-01 20:09:01', '183.83.194.70'),
(26, 1, '2017-11-01 22:15:25', NULL, '208.54.86.228'),
(27, 1, '2017-11-01 22:43:50', '2017-11-02 02:10:04', '183.82.122.15'),
(28, 1, '2017-11-02 02:26:25', NULL, '183.82.122.15'),
(29, 1, '2017-11-02 08:58:17', NULL, '106.201.35.206'),
(30, 1, '2017-11-02 18:22:24', '2017-11-02 18:23:17', '183.83.194.70'),
(31, 1, '2017-11-02 18:23:30', '2017-11-02 18:30:55', '183.83.194.70'),
(32, 1, '2017-11-02 21:53:19', NULL, '70.121.16.237'),
(33, 1, '2017-11-02 22:41:18', NULL, '183.82.122.15'),
(34, 1, '2017-11-04 10:08:07', NULL, '127.0.0.1'),
(35, 1, '2017-11-04 15:32:50', NULL, '127.0.0.1'),
(36, 1, '2017-11-06 10:45:32', '2017-11-06 14:10:08', '127.0.0.1'),
(37, 1, '2017-11-06 14:20:47', '2017-11-06 14:20:51', '127.0.0.1'),
(38, 1, '2017-11-06 14:22:34', NULL, '127.0.0.1'),
(39, 1, '2017-11-06 15:19:46', NULL, '127.0.0.1'),
(40, 1, '2017-11-13 16:21:50', NULL, '127.0.0.1'),
(41, 1, '2017-11-14 11:30:12', NULL, '127.0.0.1'),
(42, 1, '2017-11-14 19:01:41', NULL, '127.0.0.1'),
(43, 1, '2017-11-15 10:51:35', NULL, '127.0.0.1'),
(44, 1, '2017-11-17 11:15:40', NULL, '127.0.0.1'),
(45, 1, '2017-11-20 14:29:39', NULL, '127.0.0.1'),
(46, 1, '2017-11-23 14:32:25', '2017-11-23 14:32:28', '127.0.0.1'),
(47, 1, '2017-11-23 18:11:58', NULL, '127.0.0.1'),
(48, 1, '2017-11-24 11:30:09', NULL, '127.0.0.1'),
(49, 1, '2017-11-24 15:42:31', NULL, '127.0.0.1'),
(50, 1, '2017-12-01 11:45:20', NULL, '127.0.0.1'),
(51, 1, '2017-12-05 10:10:40', NULL, '127.0.0.1'),
(52, 1, '2017-12-06 10:52:12', NULL, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `user_verify`
--

CREATE TABLE `user_verify` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` text,
  `activation_code` varchar(255) DEFAULT NULL,
  `kyc_edit_token` varchar(255) DEFAULT NULL,
  `email_activated` int(11) NOT NULL DEFAULT '0',
  `kyc_completed` int(11) NOT NULL DEFAULT '0',
  `kyc_edit_completed` int(11) NOT NULL DEFAULT '0',
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_verify`
--

INSERT INTO `user_verify` (`id`, `email`, `token`, `activation_code`, `kyc_edit_token`, `email_activated`, `kyc_completed`, `kyc_edit_completed`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, 'sushmita@bellboi.com', '5d76b3de9cee6004cf1484b918f25da0', NULL, NULL, 0, 0, 0, NULL, NULL, '2017-10-31 17:50:27', NULL),
(4, 'sush_111@hotmail.com', 'e845b7bec624f6421a2be6e9e86d2491', NULL, NULL, 0, 0, 0, NULL, NULL, '2017-11-03 17:24:27', NULL),
(5, 'avinash.pitti@gmail.com', '44914e5e71e901f7d7b38b704f7a1cde', NULL, NULL, 0, 0, 0, NULL, NULL, '2017-11-01 11:30:48', NULL),
(6, 'satya.lst01@gmail.com', '42e054984125ea2e0aa103e8f4138947', NULL, '12e0290e95cb6b34863eaafff3a1e97b', 1, 1, 0, NULL, NULL, '2017-11-17 11:07:37', '2017-12-06 11:56:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `investors`
--
ALTER TABLE `investors`
  ADD PRIMARY KEY (`investor_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `roles_role_unique` (`role`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_index` (`user_id`),
  ADD KEY `role_user_role_id_index` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`user_log_id`),
  ADD KEY `user_logs_user_id_index` (`user_id`);

--
-- Indexes for table `user_verify`
--
ALTER TABLE `user_verify`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `investors`
--
ALTER TABLE `investors`
  MODIFY `investor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `user_log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `user_verify`
--
ALTER TABLE `user_verify`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
