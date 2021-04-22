-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2021 at 02:30 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astu_guide_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_calendars`
--

CREATE TABLE `academic_calendars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `academic_calendars`
--

INSERT INTO `academic_calendars` (`id`, `title`, `date`, `description`, `created_at`, `updated_at`) VALUES
(1, '1st Semester Registration', '2021-02-08', 'Feb 8-9 (Monday - Tuesday)', '2021-03-13 01:15:04', '2021-03-13 01:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `ambulances`
--

CREATE TABLE `ambulances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ambulances`
--

INSERT INTO `ambulances` (`id`, `driver_name`, `phone_number`, `created_at`, `updated_at`) VALUES
(1, 'abdu', '0929897632', '2021-03-13 02:42:03', '2021-03-13 02:42:03');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-03-11 05:03:42', '2021-03-11 05:03:42'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-03-11 05:03:42', '2021-03-11 05:03:42');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(57, 1, 'phone_number', 'text', 'Phone Number', 0, 1, 1, 1, 1, 1, '{}', 7),
(58, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 1, 1, 1, 1, '{}', 8),
(59, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(60, 7, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(61, 7, 'astu_id', 'text', 'Astu Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(62, 7, 'school', 'text', 'School', 1, 1, 1, 1, 1, 1, '{}', 4),
(63, 7, 'department', 'text', 'Department', 0, 1, 1, 1, 1, 1, '{}', 5),
(64, 7, 'year', 'text', 'Year', 1, 1, 1, 1, 1, 1, '{}', 6),
(65, 7, 'section', 'text', 'Section', 1, 1, 1, 1, 1, 1, '{}', 7),
(66, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(67, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(68, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(69, 8, 'article_number', 'number', 'Article Number', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|integer\"}}', 2),
(70, 8, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:255\"}}', 3),
(71, 8, 'body', 'text_area', 'Body', 1, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|string\"}}', 4),
(72, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 5),
(73, 8, 'updated_at', 'timestamp', 'Updated At', 0, 1, 1, 0, 0, 0, '{}', 6),
(74, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(75, 9, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(76, 9, 'date', 'date', 'Date', 1, 1, 1, 1, 1, 1, '{}', 3),
(77, 9, 'description', 'text', 'Description', 0, 0, 1, 1, 1, 1, '{}', 4),
(78, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(79, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 6),
(80, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(81, 10, 'driver_name', 'text', 'Driver Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(82, 10, 'phone_number', 'text', 'Phone Number', 1, 1, 1, 1, 1, 1, '{}', 3),
(83, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(84, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 5);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-03-11 05:03:40', '2021-03-11 05:15:08'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-03-11 05:03:40', '2021-03-11 05:03:40'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-03-11 05:03:40', '2021-03-11 05:03:40'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-03-11 05:03:42', '2021-03-11 05:03:42'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(7, 'students', 'students', 'Student', 'Students', 'voyager-people', 'App\\Models\\Student', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-03-11 05:15:53', '2021-03-11 05:16:28'),
(8, 'rule_and_regulations', 'rule-and-regulations', 'Rule And Regulation', 'Rule And Regulations', 'voyager-documentation', 'App\\Models\\RuleAndRegulation', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-03-12 07:39:15', '2021-03-12 07:40:49'),
(9, 'academic_calendars', 'academic-calendars', 'Academic Calendar', 'Academic Calendars', 'voyager-calendar', 'App\\Models\\AcademicCalendar', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2021-03-13 01:09:38', '2021-03-13 01:09:38'),
(10, 'ambulances', 'ambulances', 'Ambulance', 'Ambulances', 'voyager-truck', 'App\\Models\\EssentialInformation\\Ambulance', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2021-03-13 02:30:27', '2021-03-13 02:30:27');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-03-11 05:03:41', '2021-03-11 05:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-03-11 05:03:41', '2021-03-11 05:03:41', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 8, '2021-03-11 05:03:41', '2021-03-13 02:31:02', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', '#058af0', NULL, 3, '2021-03-11 05:03:41', '2021-03-12 07:48:40', 'voyager.users.index', 'null'),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-03-11 05:03:41', '2021-03-11 05:03:41', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 12, '2021-03-11 05:03:41', '2021-03-13 02:31:02', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2021-03-11 05:03:41', '2021-03-11 05:17:03', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2021-03-11 05:03:41', '2021-03-11 05:17:03', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2021-03-11 05:03:41', '2021-03-11 05:17:03', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2021-03-11 05:03:41', '2021-03-11 05:17:03', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 13, '2021-03-11 05:03:41', '2021-03-13 02:31:02', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 11, '2021-03-11 05:03:42', '2021-03-13 02:31:02', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 9, '2021-03-11 05:04:35', '2021-03-13 02:31:02', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 10, '2021-03-11 05:04:35', '2021-03-13 02:31:02', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2021-03-11 05:04:36', '2021-03-11 05:17:03', 'voyager.hooks', NULL),
(15, 1, 'Students', '', '_self', 'voyager-people', '#058af0', NULL, 4, '2021-03-11 05:15:53', '2021-03-12 07:47:40', 'voyager.students.index', 'null'),
(16, 1, 'Rule And Regulations', '', '_self', 'voyager-documentation', '#058af0', NULL, 5, '2021-03-12 07:39:15', '2021-03-12 07:48:53', 'voyager.rule-and-regulations.index', 'null'),
(17, 1, 'Academic Calendars', '', '_self', 'voyager-calendar', '#058af0', NULL, 6, '2021-03-13 01:09:38', '2021-03-13 01:10:15', 'voyager.academic-calendars.index', 'null'),
(18, 1, 'Ambulances', '', '_self', 'voyager-truck', '#058af0', NULL, 7, '2021-03-13 02:30:27', '2021-03-13 02:31:38', 'voyager.ambulances.index', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2021_03_10_202656_create_users_table', 1),
(4, '2021_03_10_202657_create_password_resets_table', 1),
(5, '2021_03_10_202658_create_failed_jobs_table', 1),
(7, '2021_03_10_205016_create_mobile_password_resets_table', 2),
(8, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(29, '2016_01_01_000000_add_voyager_user_fields', 4),
(30, '2016_01_01_000000_create_data_types_table', 4),
(31, '2016_05_19_173453_create_menu_table', 4),
(32, '2016_10_21_190000_create_roles_table', 4),
(33, '2016_10_21_190000_create_settings_table', 4),
(34, '2016_11_30_135954_create_permission_table', 4),
(35, '2016_11_30_141208_create_permission_role_table', 4),
(36, '2016_12_26_201236_data_types__add__server_side', 4),
(37, '2017_01_13_000000_add_route_to_menu_items_table', 4),
(38, '2017_01_14_005015_create_translations_table', 4),
(39, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 4),
(40, '2017_03_06_000000_add_controller_to_data_types_table', 4),
(41, '2017_04_21_000000_add_order_to_data_rows_table', 4),
(42, '2017_07_05_210000_add_policyname_to_data_types_table', 4),
(43, '2017_08_05_000000_add_group_to_settings_table', 4),
(44, '2017_11_26_013050_add_user_role_relationship', 4),
(45, '2017_11_26_015000_create_user_roles_table', 4),
(46, '2018_03_11_000000_add_user_settings', 4),
(47, '2018_03_14_000000_add_details_to_data_types_table', 4),
(48, '2018_03_16_000000_make_settings_value_nullable', 4),
(49, '2016_01_01_000000_create_pages_table', 5),
(50, '2016_01_01_000000_create_posts_table', 5),
(51, '2016_02_15_204651_create_categories_table', 5),
(52, '2017_04_11_000000_alter_post_nullable_fields_table', 5),
(54, '2021_03_11_233349_create_rule_and_regulations_table', 7),
(56, '2021_03_10_205660_create_students_table', 8),
(57, '2021_03_12_170325_create_academic_calendars_table', 9),
(60, '2021_03_12_173453_create_offices_table', 10),
(61, '2021_03_12_173631_create_ambulances_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_password_resets`
--

CREATE TABLE `mobile_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offices`
--

CREATE TABLE `offices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-03-11 05:04:35', '2021-03-11 05:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@admin.com', '$2y$10$Yyzd4QNRjyblmL5EtjbTPejn5ADmtCCPFNnnDGJsY5qDs60e1hwty', '2021-03-12 18:01:33');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(2, 'browse_bread', NULL, '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(3, 'browse_database', NULL, '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(4, 'browse_media', NULL, '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(5, 'browse_compass', NULL, '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(6, 'browse_menus', 'menus', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(7, 'read_menus', 'menus', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(8, 'edit_menus', 'menus', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(9, 'add_menus', 'menus', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(10, 'delete_menus', 'menus', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(11, 'browse_roles', 'roles', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(12, 'read_roles', 'roles', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(13, 'edit_roles', 'roles', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(14, 'add_roles', 'roles', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(15, 'delete_roles', 'roles', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(16, 'browse_users', 'users', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(17, 'read_users', 'users', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(18, 'edit_users', 'users', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(19, 'add_users', 'users', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(20, 'delete_users', 'users', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(21, 'browse_settings', 'settings', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(22, 'read_settings', 'settings', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(23, 'edit_settings', 'settings', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(24, 'add_settings', 'settings', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(25, 'delete_settings', 'settings', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(26, 'browse_categories', 'categories', '2021-03-11 05:03:42', '2021-03-11 05:03:42'),
(27, 'read_categories', 'categories', '2021-03-11 05:03:42', '2021-03-11 05:03:42'),
(28, 'edit_categories', 'categories', '2021-03-11 05:03:42', '2021-03-11 05:03:42'),
(29, 'add_categories', 'categories', '2021-03-11 05:03:42', '2021-03-11 05:03:42'),
(30, 'delete_categories', 'categories', '2021-03-11 05:03:42', '2021-03-11 05:03:42'),
(31, 'browse_posts', 'posts', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(32, 'read_posts', 'posts', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(33, 'edit_posts', 'posts', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(34, 'add_posts', 'posts', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(35, 'delete_posts', 'posts', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(36, 'browse_pages', 'pages', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(37, 'read_pages', 'pages', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(38, 'edit_pages', 'pages', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(39, 'add_pages', 'pages', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(40, 'delete_pages', 'pages', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(41, 'browse_hooks', NULL, '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(42, 'browse_students', 'students', '2021-03-11 05:15:53', '2021-03-11 05:15:53'),
(43, 'read_students', 'students', '2021-03-11 05:15:53', '2021-03-11 05:15:53'),
(44, 'edit_students', 'students', '2021-03-11 05:15:53', '2021-03-11 05:15:53'),
(45, 'add_students', 'students', '2021-03-11 05:15:53', '2021-03-11 05:15:53'),
(46, 'delete_students', 'students', '2021-03-11 05:15:53', '2021-03-11 05:15:53'),
(47, 'browse_rule_and_regulations', 'rule_and_regulations', '2021-03-12 07:39:15', '2021-03-12 07:39:15'),
(48, 'read_rule_and_regulations', 'rule_and_regulations', '2021-03-12 07:39:15', '2021-03-12 07:39:15'),
(49, 'edit_rule_and_regulations', 'rule_and_regulations', '2021-03-12 07:39:15', '2021-03-12 07:39:15'),
(50, 'add_rule_and_regulations', 'rule_and_regulations', '2021-03-12 07:39:15', '2021-03-12 07:39:15'),
(51, 'delete_rule_and_regulations', 'rule_and_regulations', '2021-03-12 07:39:15', '2021-03-12 07:39:15'),
(52, 'browse_academic_calendars', 'academic_calendars', '2021-03-13 01:09:38', '2021-03-13 01:09:38'),
(53, 'read_academic_calendars', 'academic_calendars', '2021-03-13 01:09:38', '2021-03-13 01:09:38'),
(54, 'edit_academic_calendars', 'academic_calendars', '2021-03-13 01:09:38', '2021-03-13 01:09:38'),
(55, 'add_academic_calendars', 'academic_calendars', '2021-03-13 01:09:38', '2021-03-13 01:09:38'),
(56, 'delete_academic_calendars', 'academic_calendars', '2021-03-13 01:09:38', '2021-03-13 01:09:38'),
(57, 'browse_ambulances', 'ambulances', '2021-03-13 02:30:27', '2021-03-13 02:30:27'),
(58, 'read_ambulances', 'ambulances', '2021-03-13 02:30:27', '2021-03-13 02:30:27'),
(59, 'edit_ambulances', 'ambulances', '2021-03-13 02:30:27', '2021-03-13 02:30:27'),
(60, 'add_ambulances', 'ambulances', '2021-03-13 02:30:27', '2021-03-13 02:30:27'),
(61, 'delete_ambulances', 'ambulances', '2021-03-13 02:30:27', '2021-03-13 02:30:27');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
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
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'nice', '714a94a91b892a2c3dadfb278d413c20cd6994a4ac58ed1989e8ad824325d4a1', '[\"*\"]', NULL, '2021-03-11 06:27:57', '2021-03-11 06:27:57'),
(2, 'App\\Models\\User', 1, 'nice', 'fea4192d5bf844a41ecee3e627aa6e44f2be5e7326765010b8929d8cbb7ff887', '[\"*\"]', NULL, '2021-03-11 06:28:02', '2021-03-11 06:28:02'),
(3, 'App\\Models\\User', 1, 'nice', '1f0f7b316818b30f3571de5d5172fe37ac3520ffdea765b74a2fe9fdd42317f7', '[\"*\"]', '2021-03-11 10:43:41', '2021-03-11 06:28:51', '2021-03-11 10:43:41'),
(4, 'App\\Models\\User', 1, 'Pixel 2', 'fac49d3a5848e487e7813f564b3189226c207b7095a9f2544753cb40574a633a', '[\"*\"]', NULL, '2021-03-11 10:38:43', '2021-03-11 10:38:43'),
(5, 'App\\Models\\User', 1, 'Pixel 2', 'dc14633636b55dfe421ff06d90c3938548d2c534f877900de42cd0a8c0ec9eb7', '[\"*\"]', NULL, '2021-03-11 10:39:48', '2021-03-11 10:39:48'),
(6, 'App\\Models\\User', 1, 'Pixel 2', 'e671e1f1e9c9ee9c77973703f317f1dcec5da92d8af323ef1b500cd97618b35b', '[\"*\"]', NULL, '2021-03-11 10:48:55', '2021-03-11 10:48:55'),
(7, 'App\\Models\\User', 1, 'Pixel 2', 'ee946d0702ad2a3965479faeae6d5ab1d64b03e9e32b85f17f657d04d4c708d8', '[\"*\"]', NULL, '2021-03-11 10:49:07', '2021-03-11 10:49:07'),
(8, 'App\\Models\\User', 1, 'Pixel 2', 'e2fe015e820ebf7f6392910ed2171bb5404340c9781884c5d7fc3ca8acbe7026', '[\"*\"]', NULL, '2021-03-11 10:50:38', '2021-03-11 10:50:38'),
(9, 'App\\Models\\User', 1, 'Pixel 2', '2a867be39f0b142344025b98e81a038ceb183875728df769628840fc6040d9c5', '[\"*\"]', NULL, '2021-03-11 10:51:37', '2021-03-11 10:51:37'),
(10, 'App\\Models\\User', 1, 'Pixel 2', 'e5e12a595dd0ca35f1623a2927f44974b6cf677603a8cc6eed933e08dcff8d74', '[\"*\"]', NULL, '2021-03-11 10:52:10', '2021-03-11 10:52:10'),
(11, 'App\\Models\\User', 1, 'Pixel 2', '13469e01c2c4c6dd6f470386c3e91e75e569387db3bba9ad5934023ea9cafa96', '[\"*\"]', NULL, '2021-03-11 10:52:33', '2021-03-11 10:52:33'),
(12, 'App\\Models\\User', 1, 'Pixel 2', '8ebe16e5695d0f30a0ecf2ef3263e8053a50d5e0d45295d3fdd60e38a6a54d9c', '[\"*\"]', NULL, '2021-03-11 10:52:56', '2021-03-11 10:52:56'),
(13, 'App\\Models\\User', 1, 'Pixel 2', '386e6231e73e6c02c78e8cfab85715fc5c9c2504d55ee17bc62ef5f9bdea4b49', '[\"*\"]', '2021-03-11 10:53:31', '2021-03-11 10:53:31', '2021-03-11 10:53:31'),
(14, 'App\\Models\\User', 1, 'Pixel 2', '3403d16cd0d1e8ab6acf91d6bd4063d90bd4859fc487de052f522ce88e8221ee', '[\"*\"]', '2021-03-11 10:53:58', '2021-03-11 10:53:58', '2021-03-11 10:53:58'),
(15, 'App\\Models\\User', 1, 'Pixel 2', 'f85919e55135c72aab7820ec0d68a15852d606521eafd053d1f03f14ac374a85', '[\"*\"]', '2021-03-11 10:55:13', '2021-03-11 10:55:12', '2021-03-11 10:55:13'),
(16, 'App\\Models\\User', 1, 'Pixel 2', 'c74ad90c2418de21fed64c7f1e7afb6afac90f30a649eb2edc94ccf5e1b2115a', '[\"*\"]', NULL, '2021-03-11 11:28:51', '2021-03-11 11:28:51'),
(17, 'App\\Models\\User', 1, 'Pixel 2', '31ec084e8fc7c0c3c4f60c0f87a1bbfebf25955effa8ebb2cef503440c84ac78', '[\"*\"]', NULL, '2021-03-11 11:29:21', '2021-03-11 11:29:21'),
(18, 'App\\Models\\User', 1, 'Pixel 2', 'b113854ab0d0431cd71ee5dc99a1b00f1e6854c4ee6eb8ce849392e71dc9d52e', '[\"*\"]', NULL, '2021-03-11 11:31:42', '2021-03-11 11:31:42'),
(19, 'App\\Models\\User', 1, 'Pixel 2', '834b368f9728d58461c67f361a3d670a949cacd2a6ebb462e321e3d91b258291', '[\"*\"]', '2021-03-11 11:33:42', '2021-03-11 11:33:38', '2021-03-11 11:33:42'),
(20, 'App\\Models\\User', 1, 'Pixel 2', '5569de3d79a82ba36922986d249ad99c4108314c6b1ab6c26652b78cb5d1ac37', '[\"*\"]', '2021-03-11 11:35:15', '2021-03-11 11:35:10', '2021-03-11 11:35:15'),
(21, 'App\\Models\\User', 1, 'Pixel 2', '7af95e90355830601ce380e03a2b84d2ec3eb1103360c7052bcbd3ef13afadf4', '[\"*\"]', '2021-03-11 11:37:59', '2021-03-11 11:37:55', '2021-03-11 11:37:59'),
(22, 'App\\Models\\User', 1, 'Pixel 2', 'f6236276ccfc68b445bae7ef406cb011714e4e63c9accce93a7e0547bba6467e', '[\"*\"]', '2021-03-11 11:39:34', '2021-03-11 11:39:30', '2021-03-11 11:39:34'),
(23, 'App\\Models\\User', 1, 'Pixel 2', '4579376e31426ecc81b759d85dc8da9ebcd733b0acc69c81ec349a7e599366bd', '[\"*\"]', '2021-03-11 11:40:12', '2021-03-11 11:40:10', '2021-03-11 11:40:12'),
(24, 'App\\Models\\User', 1, 'Pixel 2', '9aac5799d6be8a6fea37ac62b8e6d1dba9f4a07bc690d7b5383148722b9ca065', '[\"*\"]', '2021-03-11 11:47:39', '2021-03-11 11:47:36', '2021-03-11 11:47:39'),
(25, 'App\\Models\\User', 1, 'Pixel 2', 'b8750b566eeda294cb6b940a7f27a79032af4b2ca947239313839f6725edba75', '[\"*\"]', '2021-03-11 11:49:12', '2021-03-11 11:49:12', '2021-03-11 11:49:12'),
(26, 'App\\Models\\User', 1, 'Pixel 2', '039e5d8a149e80f3e6abf299e3185534b4f93375fe1134f1da44276081005d7d', '[\"*\"]', '2021-03-11 11:49:28', '2021-03-11 11:49:28', '2021-03-11 11:49:28'),
(27, 'App\\Models\\User', 1, 'Pixel 2', '1bdd924be1321aae994e58f5d4afacf578238900ead10bc5c8c0050bcd65d4d0', '[\"*\"]', '2021-03-11 11:50:52', '2021-03-11 11:50:52', '2021-03-11 11:50:52'),
(28, 'App\\Models\\User', 1, 'Pixel 2', '89a48aa1946bdd48ba33579d9fc0b8d943150d5638371ca3dc1e6225ad64a8ec', '[\"*\"]', '2021-03-11 11:50:57', '2021-03-11 11:50:57', '2021-03-11 11:50:57'),
(29, 'App\\Models\\User', 1, 'Pixel 2', '6d8c26cc3b3fdcd3e3ff25f4eb7b0f9fd8f3042daa2a9654e351733d4c828ce5', '[\"*\"]', '2021-03-11 11:51:55', '2021-03-11 11:51:54', '2021-03-11 11:51:55'),
(30, 'App\\Models\\User', 1, 'Pixel 2', '4e5319aed5441a8529e429a01b9d5c797e280259c7a154f08f08c1d1cd706e2c', '[\"*\"]', '2021-03-11 11:53:15', '2021-03-11 11:53:12', '2021-03-11 11:53:15'),
(31, 'App\\Models\\User', 1, 'Pixel 2', 'c100e3b26d1ab7f69136362460a31e225b24465722592c9005026fb5cdb6b269', '[\"*\"]', '2021-03-11 11:53:49', '2021-03-11 11:53:45', '2021-03-11 11:53:49'),
(32, 'App\\Models\\User', 1, 'Pixel 2', '00fb1276478f1766d465639662ac6188e0fd8fd887481976f3e6b21ab8d0d02a', '[\"*\"]', '2021-03-11 11:54:45', '2021-03-11 11:54:43', '2021-03-11 11:54:45'),
(33, 'App\\Models\\User', 1, 'Pixel 2', 'cd76536fd5d22655cae3eb9102580882eec355dc5c74906a055c2d17ec946ccf', '[\"*\"]', '2021-03-11 11:56:12', '2021-03-11 11:56:10', '2021-03-11 11:56:12'),
(34, 'App\\Models\\User', 1, 'Pixel 2', 'de6820e9ec2cf8ff0e764bae09c9ba3c1f2d9dfa4675f9f4f59e0c86bb60b983', '[\"*\"]', '2021-03-11 11:56:36', '2021-03-11 11:56:33', '2021-03-11 11:56:36'),
(35, 'App\\Models\\User', 1, 'Pixel 2', 'd4bd946f7b07fe7f314f664b3385ec45f3e3b2996d594ac385dae640bebe901e', '[\"*\"]', '2021-03-11 11:57:09', '2021-03-11 11:57:06', '2021-03-11 11:57:09'),
(36, 'App\\Models\\User', 1, 'Pixel 2', 'd7b9637ba0a730641812ee18b46ff95ab172f4665608985a2b1080e8c2933189', '[\"*\"]', '2021-03-11 12:07:00', '2021-03-11 12:06:59', '2021-03-11 12:07:00'),
(37, 'App\\Models\\User', 1, 'Pixel 2', '2d4825e697288ab4fac3603ae5d1998df8eb80fdd11592af923e59f2057f7378', '[\"*\"]', '2021-03-11 12:07:34', '2021-03-11 12:07:33', '2021-03-11 12:07:34'),
(38, 'App\\Models\\User', 1, 'Pixel 2', '7535bcdd27b3f6c9eb4d0a57382f4aae16779b83157362c681e56be95d877741', '[\"*\"]', '2021-03-11 12:09:03', '2021-03-11 12:09:02', '2021-03-11 12:09:03'),
(39, 'App\\Models\\User', 1, 'Pixel 2', '5b0d02b042b90c61baaa180386bbbc1f735d1498ba5268996cf189ea1ae15f52', '[\"*\"]', NULL, '2021-03-11 12:09:23', '2021-03-11 12:09:23'),
(40, 'App\\Models\\User', 1, 'Pixel 2', '6c0ba6867f9b1457d39be18420230799ab2ccb9b9d04ed43cefb0fd1d7ca3379', '[\"*\"]', NULL, '2021-03-11 12:10:16', '2021-03-11 12:10:16'),
(41, 'App\\Models\\User', 1, 'Pixel 2', '381472f4b5ca4b02030c0850ffafe4b179f166eb81ee9c42d786e625d619a168', '[\"*\"]', '2021-03-11 12:10:40', '2021-03-11 12:10:40', '2021-03-11 12:10:40'),
(42, 'App\\Models\\User', 1, 'Pixel 2', 'bd6ce30a7ccd1e4b84c2a70ffd8c375af2028b65c683d0207c7e75028d1dd5a7', '[\"*\"]', NULL, '2021-03-11 12:44:59', '2021-03-11 12:44:59'),
(43, 'App\\Models\\User', 1, 'Pixel 2', 'dbfb62fcd061af65b5b38a4aa5b74a25e4bdf5e494a594840edd9647dcd741b1', '[\"*\"]', NULL, '2021-03-11 12:46:44', '2021-03-11 12:46:44'),
(44, 'App\\Models\\User', 1, 'Pixel 2', '021ccf0a015fe45e3eb0a8cada821da8ad4cc7ad17877823fc94f6342b0ed452', '[\"*\"]', NULL, '2021-03-11 12:47:49', '2021-03-11 12:47:49'),
(45, 'App\\Models\\User', 1, 'Pixel 2', 'a0568cb9236ac3c5c92951b589b9c2955499fd7cf396d134262713d2865c884c', '[\"*\"]', NULL, '2021-03-11 12:49:39', '2021-03-11 12:49:39'),
(46, 'App\\Models\\User', 1, 'Pixel 2', '71054b809364ce4b8c022ac1f1996f5c54a802fa0f35802a4d04224de151f519', '[\"*\"]', NULL, '2021-03-12 00:35:32', '2021-03-12 00:35:32'),
(47, 'App\\Models\\User', 1, 'Pixel 2', '86c9b75a85890ec1368c7d80d3bd3c9306b6d1ce272ef5cd4c1f693841f1d5d2', '[\"*\"]', NULL, '2021-03-12 05:43:23', '2021-03-12 05:43:23'),
(48, 'App\\Models\\User', 1, 'Pixel 2', '4896c8113b701e098feb61d501f6a74d78e49ac793de4d74e2aee331fe325cbc', '[\"*\"]', NULL, '2021-03-12 05:44:02', '2021-03-12 05:44:02'),
(49, 'App\\Models\\User', 1, 'Pixel 2', 'd344838d70359f6cfdc4f084c98825931d25dd9d89590645c32bf1765701ae86', '[\"*\"]', NULL, '2021-03-12 06:01:56', '2021-03-12 06:01:56'),
(50, 'App\\Models\\User', 1, 'Pixel 2', 'c9a8c6ac627b1361323b7290b57a3914775e2e61f096892c65b4ec5499f46313', '[\"*\"]', NULL, '2021-03-12 06:03:38', '2021-03-12 06:03:38'),
(51, 'App\\Models\\User', 1, 'Pixel 2', 'd4252a153420a7f900a46d7d2f04483ba210e5b8310b28fd1673a133aac48032', '[\"*\"]', NULL, '2021-03-12 06:10:38', '2021-03-12 06:10:38'),
(52, 'App\\Models\\User', 1, 'Pixel 2', 'f2db8f7c679af480a48847886fad07dac978206e9d0c99d706e1ebad2cfc0d53', '[\"*\"]', NULL, '2021-03-12 06:10:56', '2021-03-12 06:10:56'),
(53, 'App\\Models\\User', 1, 'Pixel 2', '95838f3a7a31a6cdbd8e81685f15694eedcf739e5eb74361d96c161a48470474', '[\"*\"]', NULL, '2021-03-12 06:11:23', '2021-03-12 06:11:23'),
(54, 'App\\Models\\User', 1, 'Pixel 2', '4ed964c02c54ec0820a084b4cea319524dc827f906da310500ecc2ee57dc6964', '[\"*\"]', NULL, '2021-03-12 07:07:28', '2021-03-12 07:07:28'),
(55, 'App\\Models\\User', 1, 'Pixel 2', 'c302be170a155c43129ea9070c911558db1707cfeedc7ecef2f7e48b324889cd', '[\"*\"]', NULL, '2021-03-12 11:00:00', '2021-03-12 11:00:00'),
(56, 'App\\Models\\User', 1, 'pixel', '6c89dc8aa1ace769c54d8935b34e27a2b3cc54edda6f9bd1b201bf76aacf2ced', '[\"*\"]', NULL, '2021-03-12 19:31:21', '2021-03-12 19:31:21'),
(57, 'App\\Models\\User', 1, 'pixel', '0949224b34030068c224c148ff4268d8a3aa3fd31a88e93ad1e35a1ed485b7ff', '[\"*\"]', NULL, '2021-03-12 19:33:52', '2021-03-12 19:33:52'),
(58, 'App\\Models\\User', 1, 'nice', '8c678fd56e36ff60223218d6ed0d67595fb0aec1b6f62a1a69596deef311a2be', '[\"*\"]', NULL, '2021-03-12 19:34:28', '2021-03-12 19:34:28'),
(59, 'App\\Models\\User', 1, 'Pixel 2', '793d8edcde90b5b92ccc5f6f2db6f0e20aaacf74be3aa28a60d1bd51db4c6691', '[\"*\"]', NULL, '2021-03-12 19:38:21', '2021-03-12 19:38:21'),
(60, 'App\\Models\\User', 1, 'nice', '376fecc543f958334ba07a295c6513824ae3372582c2584de66acb804b33ac59', '[\"*\"]', NULL, '2021-03-12 19:38:46', '2021-03-12 19:38:46'),
(61, 'App\\Models\\User', 1, 'Pixel 2', '1f2bdb236ce3ee7fe2aed6c6a307092f99baec335e483e4ea088cbd4a3d1acce', '[\"*\"]', NULL, '2021-03-12 19:39:28', '2021-03-12 19:39:28'),
(62, 'App\\Models\\User', 1, 'Pixel 2', '8262655f30f82c3d958f635d1b39ef97241fe5a81bb5117010672008d3174ff1', '[\"*\"]', NULL, '2021-03-12 19:42:36', '2021-03-12 19:42:36'),
(63, 'App\\Models\\User', 1, 'Pixel 2', '86ef6ee8ae67de3a8dc6b94c47bc4e3650634c990ae69f2666e46cda72a9d959', '[\"*\"]', NULL, '2021-03-12 19:43:21', '2021-03-12 19:43:21'),
(64, 'App\\Models\\User', 4, 'Pixel 2', 'f8bd021b20146f57206ee97175f5356892e97e922616f225c3e57ce716cdab01', '[\"*\"]', NULL, '2021-03-12 19:55:52', '2021-03-12 19:55:52'),
(65, 'App\\Models\\User', 5, 'Pixel 2', '5c715d960f079fd2c897bbde1d7d1a5e52769eeb7d7b3ac4b5dc7cfa7c5a3d6e', '[\"*\"]', NULL, '2021-03-12 20:23:43', '2021-03-12 20:23:43'),
(66, 'App\\Models\\User', 6, 'Pixel 2', '1811931c614cdf4f99c379298fd5fec91eb1472f7efe03c4103991be9fe08034', '[\"*\"]', NULL, '2021-03-12 20:25:08', '2021-03-12 20:25:08'),
(67, 'App\\Models\\User', 7, 'Pixel 2', 'aa7293b8b66deeaedf98365c9bf6034c9e7efbd3f7fe2c52ddeae09e9d644ad2', '[\"*\"]', NULL, '2021-03-12 20:26:06', '2021-03-12 20:26:06'),
(68, 'App\\Models\\User', 8, 'Pixel 2', '8ff14a3181e78139f29917334effcf39ab8454a17a16c60cf13e47ad3b8a6dd7', '[\"*\"]', NULL, '2021-03-12 20:28:54', '2021-03-12 20:28:54'),
(69, 'App\\Models\\User', 1, 'Pixel 2', '50c47678860350cb84e58bff397eb6af4b819dd6b9865cbd28258317f4a8e938', '[\"*\"]', NULL, '2021-03-12 20:35:13', '2021-03-12 20:35:13'),
(70, 'App\\Models\\User', 1, 'nice', 'c392d43dd1eefa795801246c49c35922d370c9bc374269b7626c55c65348f4ad', '[\"*\"]', NULL, '2021-03-12 20:35:54', '2021-03-12 20:35:54'),
(71, 'App\\Models\\User', 1, 'Pixel 2', 'c4fd490917584f364b3a664a7d6e663ed2192bcf430eed3eb2183e293c3e4446', '[\"*\"]', NULL, '2021-03-12 20:37:33', '2021-03-12 20:37:33'),
(72, 'App\\Models\\User', 9, 'Pixel 2', '465af292dadf279229a33e493502263b03bbe725bd5ba67dcdeff1090e40c6bd', '[\"*\"]', NULL, '2021-03-12 20:38:27', '2021-03-12 20:38:27'),
(73, 'App\\Models\\User', 1, 'Pixel 2', '2da14ff34850598d908cb0222a4f2e89d8ef7bc13736b4a9deb78414e249a6ca', '[\"*\"]', NULL, '2021-03-12 20:40:56', '2021-03-12 20:40:56'),
(74, 'App\\Models\\User', 10, 'Pixel 2', '879af21fa6e25003e94a1b6b6c2e3cd4bdbafdba0aca0a11326aa1769477f30b', '[\"*\"]', NULL, '2021-03-12 20:41:49', '2021-03-12 20:41:49'),
(75, 'App\\Models\\User', 10, 'Pixel 2', '17ccc3bbc9b33ae20d040e23e9699dba3873675c362e5b110d5cb2a53c3454b1', '[\"*\"]', NULL, '2021-03-12 20:42:08', '2021-03-12 20:42:08');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-11 05:04:35', '2021-03-11 05:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(2, 'user', 'Normal User', '2021-03-11 05:03:41', '2021-03-11 05:03:41'),
(3, 'student', 'Student', '2021-03-11 05:12:28', '2021-03-11 05:12:28');

-- --------------------------------------------------------

--
-- Table structure for table `rule_and_regulations`
--

CREATE TABLE `rule_and_regulations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `article_number` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rule_and_regulations`
--

INSERT INTO `rule_and_regulations` (`id`, `article_number`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 82, 'POST 8', '82.1 Adding and drop Adding and drop Adding and drop Adding and dropAdding and drop Adding and drop Adding and dropAdding and dropAdding and drop', '2021-03-12 07:39:58', '2021-03-12 07:39:58');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `astu_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` year(4) NOT NULL,
  `section` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `astu_id`, `school`, `department`, `year`, `section`, `created_at`, `updated_at`) VALUES
(1, 8, 'asd', 'CES', 'PCE', 2001, '2', '2021-03-12 20:28:54', '2021-03-12 20:28:54'),
(2, 9, 'asdasd', 'MES', 'PCE', 2001, '2', '2021-03-12 20:38:27', '2021-03-12 20:38:27'),
(3, 10, 'a/ur15168/10', 'MES', 'PCE', 2001, '2', '2021-03-12 20:41:49', '2021-03-12 20:41:49');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-03-11 05:04:35', '2021-03-11 05:04:35'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-03-11 05:04:36', '2021-03-11 05:04:36'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-03-11 05:04:36', '2021-03-11 05:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `phone_number`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, NULL, '$2y$10$KcVSiNXhbfZvoIqJIKsrp.TJjsXISWuYxWLt.T50WYKJ0GPgaQZ2O', 'xPkKYRfyHUapCaLbi3bDDXPcV8Ygu86hI9XaHiQs2tprZJUnPlYOVoMzrcEV', NULL, '2021-03-11 05:04:35', '2021-03-12 20:35:13'),
(8, 3, 'asd', 'asd@sad', 'users/default.png', NULL, NULL, '$2y$10$oX32xqYYq.vfJ1ur1xn53.CEot24E.eF9BR0egHxXmeul/EVBeYDe', NULL, NULL, '2021-03-12 20:28:54', '2021-03-12 20:28:54'),
(9, 3, 'asd', 'admin@admin.comsaasd', 'users/default.png', NULL, NULL, '$2y$10$l8/.SHGm2iAc0SKpcwHooOefJlBkcGrAG0/SGJYQrTKgLHxxnd/V.', NULL, NULL, '2021-03-12 20:38:27', '2021-03-12 20:38:27'),
(10, 3, 'test', 'test@gail.com', 'users/default.png', NULL, NULL, '$2y$10$HbcSCbK9k4vFwoe9XybhE.5Gn2avS9MqA9U4w06g.4Bkb9.dXwYpq', NULL, NULL, '2021-03-12 20:41:49', '2021-03-12 20:41:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_calendars`
--
ALTER TABLE `academic_calendars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ambulances`
--
ALTER TABLE `ambulances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_password_resets`
--
ALTER TABLE `mobile_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile_password_resets_email_index` (`email`);

--
-- Indexes for table `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `rule_and_regulations`
--
ALTER TABLE `rule_and_regulations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_user_id_foreign` (`user_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_calendars`
--
ALTER TABLE `academic_calendars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ambulances`
--
ALTER TABLE `ambulances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `mobile_password_resets`
--
ALTER TABLE `mobile_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `offices`
--
ALTER TABLE `offices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rule_and_regulations`
--
ALTER TABLE `rule_and_regulations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
