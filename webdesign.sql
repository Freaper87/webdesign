-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 30. Mrz 2018 um 10:47
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `webdesign`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `assets`
--

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(10, 1, 1, 'catblock.jpg', 'image', 500, 500, 62649, NULL, '2018-03-21 18:11:58', '2018-03-21 18:11:59', '2018-03-21 18:11:59', '97641511-a8dd-445c-b13d-77cd4e497735');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `categories`
--

INSERT INTO `categories` (`id`, `groupId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(8, 1, '2018-03-21 17:41:24', '2018-03-21 17:41:24', 'c37c0b4f-576d-4181-90ca-5566121a6827'),
(9, 1, '2018-03-21 17:41:38', '2018-03-21 17:41:38', '59684fce-bc7f-41b5-91ac-539187941ff7');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `categorygroups`
--

INSERT INTO `categorygroups` (`id`, `structureId`, `fieldLayoutId`, `name`, `handle`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 4, 'Blog', 'blog', '2018-03-21 17:40:59', '2018-03-21 17:40:59', '376572a0-8626-4ea7-9fbb-7f86839f596b');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `categorygroups_sites`
--

INSERT INTO `categorygroups_sites` (`id`, `groupId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'categories/{slug}', 'blog/_category', '2018-03-21 17:40:59', '2018-03-21 17:40:59', '2ace7729-0ba0-445b-a948-2bfe9fc638ce');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_blogsubtitle` text,
  `field_blogBody` text,
  `field_pageCopy` text,
  `field_seo` text,
  `field_heroslogan` text,
  `field_herotitle` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_blogsubtitle`, `field_blogBody`, `field_pageCopy`, `field_seo`, `field_heroslogan`, `field_herotitle`) VALUES
(1, 1, 1, NULL, '2018-03-21 12:23:31', '2018-03-21 12:23:31', '3c0f410b-e755-4e79-ae79-f07cd4813b92', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, 'Webdesign', '2018-03-21 16:22:39', '2018-03-26 09:30:01', '140166f5-f0ea-4389-8e89-2ad42c699f3f', NULL, NULL, '<p> </p>', '{\"title\":\"Webdesign \",\"description\":\"\",\"keywords\":\"[]\",\"score\":\"\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}}', 'Lorem Ipsum Dolor', 'Lorem ipsum dolor sit\r\namet consectetur adipisicing elit. \r\nTotam, corporis, tempore!'),
(3, 3, 1, 'My first blog entry', '2018-03-21 16:48:09', '2018-03-21 17:44:59', '61385673-e9c8-468b-895d-b3d80eaad7cf', 'Blogging yay', '<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>', NULL, NULL, NULL, NULL),
(4, 4, 1, 'Prozess', '2018-03-21 16:51:36', '2018-03-22 19:02:47', '5f074c57-a0df-4c2b-876a-05840525f0aa', NULL, NULL, '<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>', '{\"title\":\"My Mprocess Title\",\"description\":\"This is a meta description\",\"keywords\":\"[]\",\"score\":\"\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}}', NULL, NULL),
(5, 5, 1, 'My second Blog ', '2018-03-21 17:18:24', '2018-03-21 17:44:48', 'c13d93ce-5dc3-4a7f-8bd8-369df776b58c', 'second!!', '<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>', NULL, NULL, NULL, NULL),
(7, 7, 1, 'Leistungen', '2018-03-21 17:37:58', '2018-03-22 19:02:02', '0953d179-7a72-4f4b-902c-9848375b85e5', NULL, NULL, '<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>', '{\"title\":\"\",\"description\":\"\",\"keywords\":\"\",\"score\":\"neutral\",\"social\":{\"twitter\":{\"title\":\"\",\"image\":null,\"description\":\"\"},\"facebook\":{\"title\":\"\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[]}}', NULL, NULL),
(8, 8, 1, 'personal', '2018-03-21 17:41:24', '2018-03-21 17:41:24', 'd6820054-413d-49d1-a325-03a6b3ee498c', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 9, 1, 'craft-cms', '2018-03-21 17:41:38', '2018-03-21 17:41:38', 'daf06313-4942-4c66-966d-184720e9c6f2', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 10, 1, 'Catblock', '2018-03-21 18:11:59', '2018-03-21 18:11:59', '59f8dced-5144-45ef-9a1b-32242f8d7620', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 11, 1, 'FAQs', '2018-03-22 17:39:26', '2018-03-22 19:02:02', 'd8ca5c51-e743-4dca-bb4b-76e4d78fb350', NULL, NULL, '<p>FAQs</p>', '{\"title\":\"\",\"description\":\"\",\"keywords\":\"\",\"score\":\"neutral\",\"social\":{\"twitter\":{\"title\":\"\",\"image\":null,\"description\":\"\"},\"facebook\":{\"title\":\"\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[]}}', NULL, NULL),
(12, 12, 1, 'Kontakt', '2018-03-22 17:39:38', '2018-03-22 19:02:02', '6a3756f1-c443-4d0d-ab01-a3afeca69d09', NULL, NULL, '<p>Kontakt</p>', '{\"title\":\"\",\"description\":\"\",\"keywords\":\"\",\"score\":\"neutral\",\"social\":{\"twitter\":{\"title\":\"\",\"image\":null,\"description\":\"\"},\"facebook\":{\"title\":\"\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[]}}', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `deprecationerrors`
--

INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ElementQuery::getIterator()', 'C:\\Users\\Freaper\\Desktop\\Website\\xampp-7\\htdocs\\webdesign\\craft\\craft\\templates\\_layout.twig:25', '2018-03-28 12:52:55', 'C:\\Users\\Freaper\\Desktop\\Website\\xampp-7\\htdocs\\webdesign\\craft\\craft\\templates\\_layout.twig', 25, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":398,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\storage\\\\runtime\\\\compiled_templates\\\\04\\\\04e7ce238b1bbb6d25943f66ab3b5f6db92093510278bccb531cb1da1949a672.php\",\"line\":61,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_33e335cb7c284ff74ef7a957e97a96e339e5a4e02be663ba67bda328c1b32ddc\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\twig\\\\twig\\\\lib\\\\Twig\\\\Template.php\",\"line\":390,\"class\":\"__TwigTemplate_33e335cb7c284ff74ef7a957e97a96e339e5a4e02be663ba67bda328c1b32ddc\",\"method\":\"doDisplay\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"POS_HEAD\\\" => 1, ...], [\\\"main\\\" => [__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_33e335cb7c284ff74ef7a957e97a96e339e5a4e02be663ba67bda328c1b32ddc\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\twig\\\\Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"POS_HEAD\\\" => 1, ...], [\\\"main\\\" => [__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_33e335cb7c284ff74ef7a957e97a96e339e5a4e02be663ba67bda328c1b32ddc\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\twig\\\\twig\\\\lib\\\\Twig\\\\Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"POS_HEAD\\\" => 1, ...], [\\\"main\\\" => [__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_33e335cb7c284ff74ef7a957e97a96e339e5a4e02be663ba67bda328c1b32ddc\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\twig\\\\Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"POS_HEAD\\\" => 1, ...], [\\\"main\\\" => [__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_33e335cb7c284ff74ef7a957e97a96e339e5a4e02be663ba67bda328c1b32ddc\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\storage\\\\runtime\\\\compiled_templates\\\\40\\\\40a484fd18cc00d19dc66de419a68824bbc6d53be8eb96a8e42ef9cd7cead7e1.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"POS_HEAD\\\" => 1, ...], [\\\"main\\\" => [__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\twig\\\\twig\\\\lib\\\\Twig\\\\Template.php\",\"line\":390,\"class\":\"__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818\",\"method\":\"doDisplay\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"POS_HEAD\\\" => 1, ...], [\\\"main\\\" => [__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\twig\\\\Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"POS_HEAD\\\" => 1, ...], [\\\"main\\\" => [__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\twig\\\\twig\\\\lib\\\\Twig\\\\Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"POS_HEAD\\\" => 1, ...], [\\\"main\\\" => [__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\twig\\\\Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[], []\"},{\"objectClass\":\"__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\twig\\\\twig\\\\lib\\\\Twig\\\\Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[]\"},{\"objectClass\":\"__TwigTemplate_189469daabb3eb6e2dbb37569ce63e073cbab94c50875f102e8cfed070c42818\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\twig\\\\twig\\\\lib\\\\Twig\\\\Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":113,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":77,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"\\\", []\"},{\"objectClass\":null,\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":74,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":237,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":226,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\Users\\\\Freaper\\\\Desktop\\\\Website\\\\xampp-7\\\\htdocs\\\\webdesign\\\\craft\\\\craft\\\\web\\\\index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-03-28 12:52:55', '2018-03-28 12:52:55', '70dfea65-90cc-4a2a-b54a-8833d3ee00af');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `elements`
--

INSERT INTO `elements` (`id`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'craft\\elements\\User', 1, 0, '2018-03-21 12:23:31', '2018-03-21 12:23:31', '916150d6-211e-4ca8-b09c-8425459330f5'),
(2, 2, 'craft\\elements\\Entry', 1, 0, '2018-03-21 16:22:39', '2018-03-26 09:30:01', 'b87399c6-b62e-4ece-9f9c-e4d63aaffb0d'),
(3, 1, 'craft\\elements\\Entry', 1, 0, '2018-03-21 16:48:09', '2018-03-21 17:44:59', 'a11e2f86-4c87-46bb-a751-77ea056a4610'),
(4, 3, 'craft\\elements\\Entry', 1, 0, '2018-03-21 16:51:36', '2018-03-22 19:02:47', 'c527e23e-a679-4612-8fd1-a059ac44c673'),
(5, 1, 'craft\\elements\\Entry', 1, 0, '2018-03-21 17:18:24', '2018-03-21 17:44:48', '570a2af3-04d1-44aa-a42f-3227eafd707e'),
(7, 3, 'craft\\elements\\Entry', 1, 0, '2018-03-21 17:37:58', '2018-03-22 19:02:02', '663d9743-a75f-4d88-a761-2af62767f6c5'),
(8, 4, 'craft\\elements\\Category', 1, 0, '2018-03-21 17:41:24', '2018-03-21 17:41:24', '08073ec0-7581-4fe7-b0d7-5219725ba17e'),
(9, 4, 'craft\\elements\\Category', 1, 0, '2018-03-21 17:41:38', '2018-03-21 17:41:38', '198ee160-539d-41cb-bb18-fa5b0890e529'),
(10, 5, 'craft\\elements\\Asset', 1, 0, '2018-03-21 18:11:59', '2018-03-21 18:11:59', '93e426f0-1f37-40e6-8ed8-01e100c98c27'),
(11, 3, 'craft\\elements\\Entry', 1, 0, '2018-03-22 17:39:26', '2018-03-22 19:02:02', '994f1cfb-7765-4e05-a0b3-871d58b99fcf'),
(12, 3, 'craft\\elements\\Entry', 1, 0, '2018-03-22 17:39:38', '2018-03-22 19:02:02', 'f96f9130-bcc5-48cc-a143-6df9aa5847cf');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2018-03-21 12:23:31', '2018-03-21 12:23:31', 'eac543e9-f84b-495c-b367-4e41a7476720'),
(2, 2, 1, 'homepage', '', 1, '2018-03-21 16:22:39', '2018-03-26 09:30:01', '86bc52c7-894b-47ba-b80f-307050b344ee'),
(3, 3, 1, 'my-first-blog-entry', 'my-first-blog-entry', 1, '2018-03-21 16:48:09', '2018-03-21 17:44:59', '8054319c-02af-400a-b742-c87f6b2b1e2a'),
(4, 4, 1, 'about', 'about', 1, '2018-03-21 16:51:36', '2018-03-22 19:02:47', '7994349c-ff2e-44e4-84e4-d139503f96c7'),
(5, 5, 1, 'my-second-blog', 'my-second-blog', 1, '2018-03-21 17:18:24', '2018-03-21 17:44:48', 'e24a7a77-2630-46f3-9d4a-aef74297653b'),
(7, 7, 1, 'contact', 'contact', 1, '2018-03-21 17:37:58', '2018-03-22 19:02:02', '2a660eb4-05fe-4616-9009-4b92ed6de4a1'),
(8, 8, 1, 'personal', 'categories/personal', 1, '2018-03-21 17:41:24', '2018-03-21 17:41:25', 'c3e1706f-b721-4d35-b455-28dbb6058506'),
(9, 9, 1, 'craft-cms', 'categories/craft-cms', 1, '2018-03-21 17:41:38', '2018-03-21 17:41:41', '5b957200-567c-4b39-b9c1-9d79716cf0d0'),
(10, 10, 1, NULL, NULL, 1, '2018-03-21 18:11:59', '2018-03-21 18:11:59', '241a5fd7-bd7b-450f-b482-61dd0acbda7c'),
(11, 11, 1, 'faqs', 'faqs', 1, '2018-03-22 17:39:26', '2018-03-22 19:02:02', '48a057c5-84bd-4a0c-864b-f1bc3ac2aa8c'),
(12, 12, 1, 'kontakt', 'kontakt', 1, '2018-03-22 17:39:38', '2018-03-22 19:02:02', '936b2c10-d287-4696-a6c2-45fa1ec0b8e3');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 2, 2, NULL, '2018-03-21 16:22:39', NULL, '2018-03-21 16:22:39', '2018-03-26 09:30:01', 'a37ed0cc-5d8f-47c5-b08a-3284a728bfe6'),
(3, 1, 1, 1, '2018-03-21 16:48:00', NULL, '2018-03-21 16:48:09', '2018-03-21 17:44:59', 'e6600824-0e11-4566-a4b8-6e348190e44a'),
(4, 3, 3, 1, '2018-03-21 16:51:00', NULL, '2018-03-21 16:51:36', '2018-03-22 19:02:47', 'eac70bab-bf23-4b9a-8e2a-8663dd2634ba'),
(5, 1, 1, 1, '2018-03-21 17:18:00', NULL, '2018-03-21 17:18:24', '2018-03-21 17:44:48', '5fbd3a07-7073-4400-a491-eee453cbc865'),
(7, 3, 3, 1, '2018-03-21 17:37:00', NULL, '2018-03-21 17:37:58', '2018-03-22 19:02:02', '704ac321-5748-4513-9ed2-515cd8dec157'),
(11, 3, 3, 1, '2018-03-22 17:39:26', NULL, '2018-03-22 17:39:26', '2018-03-22 19:02:02', 'db290355-cae3-4495-8f75-6e5e53f813a4'),
(12, 3, 3, 1, '2018-03-22 17:39:38', NULL, '2018-03-22 17:39:38', '2018-03-22 19:02:02', 'df2bcc26-89ff-41dc-8b09-1048d2e9a165');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `entrydrafts`
--

CREATE TABLE `entrydrafts` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` tinyint(3) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 'Blog', 'blog', 1, 'Title', NULL, 1, '2018-03-21 16:21:56', '2018-03-21 17:44:29', '8900dcb2-11aa-40a6-b2b7-680263052b87'),
(2, 2, 2, 'Homepage', 'homepage', 1, 'Webdesign', NULL, 1, '2018-03-21 16:22:39', '2018-03-26 09:19:51', 'f446c119-ec30-4196-a130-d690c1fd5760'),
(3, 3, 3, 'Pages', 'pages', 1, 'Page Title', NULL, 1, '2018-03-21 16:48:47', '2018-03-22 19:01:59', '9ed3cae7-4574-454e-9cf6-71a557526bae');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `entryversions`
--

CREATE TABLE `entryversions` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL,
  `num` smallint(6) UNSIGNED NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `entryversions`
--

INSERT INTO `entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `siteId`, `num`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 3, 1, 1, 1, 1, '', '{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"My first blog entry\",\"slug\":\"my-first-blog-entry\",\"postDate\":1521650888,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":\"<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>\",\"1\":\"Blogging yay\"}}', '2018-03-21 16:48:09', '2018-03-21 16:48:09', '6563b13a-81ee-46f2-8cea-5d552324ec98'),
(2, 4, 3, 1, 1, 1, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"About\",\"slug\":\"about\",\"postDate\":1521651096,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":\"<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>\"}}', '2018-03-21 16:51:37', '2018-03-21 16:51:37', 'bc8c229e-013a-46f8-86f2-319b46b681a6'),
(3, 5, 1, 1, 1, 1, '', '{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"My second Blog \",\"slug\":\"my-second-blog\",\"postDate\":1521652704,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":\"<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>\",\"1\":\"second!!\"}}', '2018-03-21 17:18:25', '2018-03-21 17:18:25', 'f39d38c4-3f60-48f8-b5d1-d0adf4b43b6a'),
(5, 7, 3, 1, 1, 1, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Contact\",\"slug\":\"contact\",\"postDate\":1521653878,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":\"<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>\"}}', '2018-03-21 17:37:58', '2018-03-21 17:37:58', 'f88fee8d-473e-4d2a-8e87-bea722ea0a04'),
(6, 5, 1, 1, 1, 2, '', '{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"My second Blog \",\"slug\":\"my-second-blog\",\"postDate\":1521652680,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":\"<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>\",\"1\":\"second!!\",\"5\":[\"8\"]}}', '2018-03-21 17:44:48', '2018-03-21 17:44:48', 'a6e21804-7f9a-47ad-8867-9e645c9ef5ff'),
(7, 3, 1, 1, 1, 2, '', '{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"My first blog entry\",\"slug\":\"my-first-blog-entry\",\"postDate\":1521650880,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":\"<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>\",\"1\":\"Blogging yay\",\"5\":[\"9\"]}}', '2018-03-21 17:44:59', '2018-03-21 17:44:59', '768f9682-52a2-4ba9-b853-78c2211ff183'),
(8, 4, 3, 1, 1, 2, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"About\",\"slug\":\"about\",\"postDate\":1521651060,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":\"<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>\",\"6\":[\"10\"]}}', '2018-03-21 18:12:06', '2018-03-21 18:12:06', '063707c2-6e03-4951-9dc0-162b3c9876dc'),
(9, 4, 3, 1, 1, 3, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Prozess\",\"slug\":\"about\",\"postDate\":1521651060,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":\"<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>\",\"6\":[\"10\"]}}', '2018-03-22 17:38:34', '2018-03-22 17:38:34', '7c7c94f5-c524-4053-841d-f8442716bed5'),
(10, 7, 3, 1, 1, 2, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Leistungen\",\"slug\":\"contact\",\"postDate\":1521653820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":\"<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>\",\"6\":[]}}', '2018-03-22 17:38:50', '2018-03-22 17:38:50', '15ed718e-2998-4970-b790-eccc33e13f20'),
(11, 7, 3, 1, 1, 3, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Leistungen\",\"slug\":\"contact\",\"postDate\":1521653820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":\"<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>\",\"6\":[]}}', '2018-03-22 17:38:54', '2018-03-22 17:38:54', '5336777e-2694-482c-bcbf-618e28fd64ff'),
(12, 11, 3, 1, 1, 1, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"FAQs\",\"slug\":\"faqs\",\"postDate\":1521740366,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":\"<p>FAQs</p>\",\"6\":[]}}', '2018-03-22 17:39:26', '2018-03-22 17:39:26', '5044035b-f4d9-4eff-b78c-5b71965f9098'),
(13, 12, 3, 1, 1, 1, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Kontakt\",\"slug\":\"kontakt\",\"postDate\":1521740378,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":\"<p>Kontakt</p>\",\"6\":[]}}', '2018-03-22 17:39:39', '2018-03-22 17:39:39', '6b8680aa-4012-4e0f-beea-fe5796db956d'),
(14, 4, 3, 1, 1, 4, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Prozess\",\"slug\":\"about\",\"postDate\":1521651060,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":\"<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>\",\"6\":[\"10\"],\"8\":\"Prozess beschreibung\",\"7\":\"Prozess\"}}', '2018-03-22 18:35:58', '2018-03-22 18:35:58', '5772b61d-25fb-4c30-b43c-9ee6357c31aa'),
(15, 4, 3, 1, 1, 5, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Prozess\",\"slug\":\"about\",\"postDate\":1521651060,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":\"<p><i><strong>Lorem ipsum dolor sit amet</strong></i>, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est <i><strong>Lorem ipsum dolor sit amet</strong></i>. Lorem ipsum dolor sit .</p>\",\"6\":[\"10\"],\"9\":{\"title\":\"My Mprocess Title\",\"description\":\"This is a meta description\",\"keywords\":\"[]\",\"score\":\"\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}}}}', '2018-03-22 19:02:47', '2018-03-22 19:02:47', 'c0ccd3d7-8c63-4d51-8854-eb769643de97'),
(16, 2, 2, 1, 1, 1, 'Revision from Mar 26, 2018, 2:17:00 AM', '{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1521649359,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"6\":[],\"9\":{\"title\":\"\",\"description\":\"\",\"keywords\":\"\",\"score\":\"neutral\",\"social\":{\"twitter\":{\"title\":\"\",\"image\":null,\"description\":\"\"},\"facebook\":{\"title\":\"\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[]}}}}', '2018-03-26 09:17:21', '2018-03-26 09:17:21', 'e0d01f10-8829-4b1c-b69c-5a025107e64f'),
(17, 2, 2, 1, 1, 2, '', '{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Webdesign\",\"slug\":\"homepage\",\"postDate\":1521649359,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"3\":\"<p> </p>\",\"6\":[],\"9\":{\"title\":\"Webdesign \",\"description\":\"\",\"keywords\":\"[]\",\"score\":\"\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}}}}', '2018-03-26 09:17:22', '2018-03-26 09:17:22', '72343ad2-0fae-46a9-a23a-80c4b79f7d1b'),
(18, 2, 2, 1, 1, 3, '', '{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Webdesign\",\"slug\":\"homepage\",\"postDate\":1521649359,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"10\":\"Lorem Ipsum Dolor\",\"11\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Totam, corporis, tempore!\",\"9\":{\"title\":\"Webdesign \",\"description\":\"\",\"keywords\":\"[]\",\"score\":\"\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}}}}', '2018-03-26 09:20:16', '2018-03-26 09:20:16', '15abe551-c46c-4d6c-bcfc-b0219cdc3615'),
(19, 2, 2, 1, 1, 4, '', '{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Webdesign\",\"slug\":\"homepage\",\"postDate\":1521649359,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"10\":\"Lorem Ipsum Dolor\",\"11\":\"Lorem ipsum dolor <br/>sit amet consectetur adipisicing elit. Totam, corporis, tempore!\",\"9\":{\"title\":\"Webdesign \",\"description\":\"\",\"keywords\":\"[]\",\"score\":\"\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}}}}', '2018-03-26 09:26:55', '2018-03-26 09:26:55', '450ba967-35ce-47ff-8bfa-d1140ecda7ad'),
(20, 2, 2, 1, 1, 5, '', '{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Webdesign\",\"slug\":\"homepage\",\"postDate\":1521649359,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"10\":\"Lorem Ipsum Dolor\",\"11\":\"Lorem ipsum dolor sit \\r\\namet consectetur adipisicing elit. \\r\\nTotam, corporis, tempore!\",\"9\":{\"title\":\"Webdesign \",\"description\":\"\",\"keywords\":\"[]\",\"score\":\"\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}}}}', '2018-03-26 09:27:42', '2018-03-26 09:27:42', 'f7497b9b-7749-4851-a7f1-b63d5cc49e78'),
(21, 2, 2, 1, 1, 6, '', '{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Webdesign\",\"slug\":\"homepage\",\"postDate\":1521649359,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"10\":\"Lorem Ipsum Dolor\",\"11\":\"Lorem ipsum dolor sit \\r\\namet consectetur adipisicing elit. \\r\\nTotam, corporis, tempore!\",\"9\":{\"title\":\"Webdesign \",\"description\":\"\",\"keywords\":\"[]\",\"score\":\"\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}}}}', '2018-03-26 09:27:54', '2018-03-26 09:27:54', 'cbcdf584-0c6d-472e-9c0e-531d17c7bf81'),
(22, 2, 2, 1, 1, 7, '', '{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Webdesign\",\"slug\":\"homepage\",\"postDate\":1521649359,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"10\":\"Lorem Ipsum Dolor\",\"11\":\"Lorem ipsum dolor sit <br/>\\r\\namet consectetur adipisicing elit. \\r\\nTotam, corporis, tempore!\",\"9\":{\"title\":\"Webdesign \",\"description\":\"\",\"keywords\":\"[]\",\"score\":\"\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}}}}', '2018-03-26 09:28:07', '2018-03-26 09:28:07', 'ffa4b6a6-5ab0-47cb-bdb5-87b0953a582c'),
(23, 2, 2, 1, 1, 8, '', '{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Webdesign\",\"slug\":\"homepage\",\"postDate\":1521649359,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"10\":\"Lorem Ipsum Dolor\",\"11\":\"Lorem ipsum dolor sit\\r\\namet consectetur adipisicing elit. \\r\\nTotam, corporis, tempore!\",\"9\":{\"title\":\"Webdesign \",\"description\":\"\",\"keywords\":\"[]\",\"score\":\"\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}}}}', '2018-03-26 09:30:01', '2018-03-26 09:30:01', '4bd10a2e-96eb-4083-8f61-8f5de51dd5a0');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2018-03-21 12:23:30', '2018-03-21 12:23:30', '60b91a2d-51c3-40ca-97a0-a36a6fce5c18'),
(2, 'blog', '2018-03-21 16:27:01', '2018-03-21 16:27:01', '411c478b-3797-4e7a-8905-22f9b3dc571f'),
(3, 'Pages', '2018-03-21 16:49:50', '2018-03-21 16:49:50', '0e0ec39e-8eac-42d9-b2d6-be27b1009b75');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` tinyint(3) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(4, 1, 3, 1, 0, 1, '2018-03-21 17:44:29', '2018-03-21 17:44:29', 'ab4f1cc2-833d-42d7-a531-673900bf9645'),
(5, 1, 3, 2, 0, 2, '2018-03-21 17:44:29', '2018-03-21 17:44:29', 'ebe175d8-50c2-4cd0-90d4-a618b1639787'),
(6, 1, 3, 5, 0, 3, '2018-03-21 17:44:29', '2018-03-21 17:44:29', '4bac5062-984d-4876-b3bb-8ccbd21a78da'),
(26, 3, 13, 3, 0, 1, '2018-03-22 19:01:59', '2018-03-22 19:01:59', '9d7a5782-33ca-46b9-ad97-bc7b2463a661'),
(27, 3, 13, 6, 0, 2, '2018-03-22 19:01:59', '2018-03-22 19:01:59', '7c5b796c-8bde-4f8c-b2b3-9f2df575e4e0'),
(28, 3, 14, 9, 0, 1, '2018-03-22 19:01:59', '2018-03-22 19:01:59', 'c75295b8-7e66-47df-b596-169d1ed985f7'),
(32, 2, 17, 10, 0, 1, '2018-03-26 09:19:51', '2018-03-26 09:19:51', '971b13f2-1cff-4cbc-8826-7a3ff9387837'),
(33, 2, 17, 11, 0, 2, '2018-03-26 09:19:51', '2018-03-26 09:19:51', 'd6fab506-defa-4579-83c5-1cfe7c2b4922'),
(34, 2, 18, 9, 0, 1, '2018-03-26 09:19:51', '2018-03-26 09:19:51', '71708bc1-005b-4529-b488-11c2ad8cd43b');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2018-03-21 16:21:56', '2018-03-21 17:44:29', '4d23743e-add6-426c-85df-b8bb163459ee'),
(2, 'craft\\elements\\Entry', '2018-03-21 16:22:39', '2018-03-26 09:19:51', '811bb2fb-985b-4d2b-b44f-9d32e5832167'),
(3, 'craft\\elements\\Entry', '2018-03-21 16:48:47', '2018-03-22 19:01:59', '79410589-6425-4809-9411-63cb12f316c8'),
(4, 'craft\\elements\\Category', '2018-03-21 17:40:59', '2018-03-21 17:40:59', '891333f7-b8f8-4835-af16-fee875c57c75'),
(5, 'craft\\elements\\Asset', '2018-03-21 18:10:51', '2018-03-22 18:31:16', 'fd586fb4-7743-43c9-a83c-8a2588695039');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` tinyint(3) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 1, 'blog', 1, '2018-03-21 17:44:29', '2018-03-21 17:44:29', 'd5ea5115-839d-44ae-b7a3-3cf59b6efe69'),
(13, 3, 'Pages', 1, '2018-03-22 19:01:59', '2018-03-22 19:01:59', '773c0490-66f5-47ae-99e2-6d5639a31f67'),
(14, 3, 'SEO', 2, '2018-03-22 19:01:59', '2018-03-22 19:01:59', '897a3062-6138-49b1-a2bf-011acb405f2d'),
(17, 2, 'Pages', 1, '2018-03-26 09:19:51', '2018-03-26 09:19:51', '940f11a3-891e-46e2-b771-12d2c3bf2a86'),
(18, 2, 'SEO', 2, '2018-03-26 09:19:51', '2018-03-26 09:19:51', '8d326db2-4cfb-48f1-8fee-7b7960f475b3');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 'BlogSubtitle', 'blogsubtitle', 'global', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-03-21 16:28:37', '2018-03-21 17:10:58', '6d133ed4-8e40-4c55-9a24-bb0ec0b34a48'),
(2, 2, 'Blog Body', 'blogBody', 'global', '', 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"Standard.json\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2018-03-21 16:28:53', '2018-03-22 18:22:56', 'e5db17ba-4005-490d-b42c-e40beb626fac'),
(3, 3, 'Page Copy', 'pageCopy', 'global', '', 'none', NULL, 'craft\\ckeditor\\Field', '{\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"columnType\":\"text\"}', '2018-03-21 16:50:11', '2018-03-21 16:50:11', 'f589c567-861f-49ae-b424-3c645d9e22a8'),
(5, 2, 'Category', 'category', 'global', '', 'site', NULL, 'craft\\fields\\Categories', '{\"branchLimit\":\"\",\"sources\":\"*\",\"source\":\"group:1\",\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":\"\",\"localizeRelations\":false}', '2018-03-21 17:43:57', '2018-03-21 17:43:57', '632eccf9-adb9-42de-8eb5-cd40742cb9a6'),
(6, 3, 'pageImage', 'pageimage', 'global', '', 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"/storage/upload\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":[\"folder:1\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}', '2018-03-21 18:06:18', '2018-03-22 18:16:00', 'b0a977a6-0a16-4b5d-ba30-637e977f72c0'),
(9, 3, 'Seo', 'seo', 'global', '', 'none', NULL, 'ether\\seo\\fields\\SeoField', '{\"titleSuffix\":\"\",\"socialImage\":\"\",\"hideSocial\":\"\",\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}', '2018-03-22 19:01:33', '2018-03-22 19:01:33', '499e8a3d-25a8-44d8-9cda-3c22d0e10198'),
(10, 3, 'HeroSlogan', 'heroslogan', 'global', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-03-26 09:19:06', '2018-03-26 09:19:06', 'e7668d4f-3127-4997-ac07-5b001da460c3'),
(11, 3, 'HeroTitle', 'herotitle', 'global', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-03-26 09:19:24', '2018-03-26 09:27:22', '96220897-12e9-4f04-93f8-b30d1ca1e8da');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `edition` tinyint(3) UNSIGNED NOT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `on` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `edition`, `timezone`, `name`, `on`, `maintenance`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.0.0-RC15', '3.0.83', 0, 'America/Los_Angeles', 'webdesign', 1, 1, 'ElTZ1UkX68RF', '2018-03-21 12:23:30', '2018-03-26 16:57:51', '5347ed08-b7e5-42df-a175-6b8628f12e54');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` tinyint(3) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` tinyint(3) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `migrations`
--

INSERT INTO `migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'app', 'Install', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '131fa544-bc48-4dcf-9a37-a85c89e3a8f0'),
(2, NULL, 'app', 'm150403_183908_migrations_table_changes', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '161127fb-b678-447f-b5ae-39c1e9b7345c'),
(3, NULL, 'app', 'm150403_184247_plugins_table_changes', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '425a3e7c-2021-4572-8d25-3227f2de47e8'),
(4, NULL, 'app', 'm150403_184533_field_version', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', 'bb663214-1183-4ebf-9b02-3f799b376790'),
(5, NULL, 'app', 'm150403_184729_type_columns', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', 'fc728a3f-7514-49f3-88d8-e42130e24a18'),
(6, NULL, 'app', 'm150403_185142_volumes', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '3c76a803-4059-4c12-93b2-e45644f73d1d'),
(7, NULL, 'app', 'm150428_231346_userpreferences', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', 'b94d9370-8abc-49c7-b310-c7b2c8f2aeaf'),
(8, NULL, 'app', 'm150519_150900_fieldversion_conversion', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', 'e4bea1eb-de1e-4acb-b23e-e9acbc187827'),
(9, NULL, 'app', 'm150617_213829_update_email_settings', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '3c774cbe-c519-40e4-b521-a82e4860401b'),
(10, NULL, 'app', 'm150721_124739_templatecachequeries', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', 'cd01b7a0-85a9-482d-8138-ce1e2704f2c6'),
(11, NULL, 'app', 'm150724_140822_adjust_quality_settings', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '97e28a8b-282f-40c6-a30c-866b993bb380'),
(12, NULL, 'app', 'm150815_133521_last_login_attempt_ip', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2003037a-2c95-4420-9af1-3c6ee72a41d3'),
(13, NULL, 'app', 'm151002_095935_volume_cache_settings', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', 'c1cb3e0d-9102-479d-b74b-5d0ec4161d70'),
(14, NULL, 'app', 'm151005_142750_volume_s3_storage_settings', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '0ec25557-6e69-41e8-9ed0-c845aafdb872'),
(15, NULL, 'app', 'm151016_133600_delete_asset_thumbnails', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '6f1c017b-5073-480b-9736-4157dc107734'),
(16, NULL, 'app', 'm151209_000000_move_logo', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '78af4766-df62-49ca-9eaf-a07ae99ca43c'),
(17, NULL, 'app', 'm151211_000000_rename_fileId_to_assetId', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '98121144-bdb6-48f4-a843-44c27eb6c041'),
(18, NULL, 'app', 'm151215_000000_rename_asset_permissions', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '03946139-9316-49a5-b34d-72e640edfc2b'),
(19, NULL, 'app', 'm160707_000001_rename_richtext_assetsource_setting', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', 'e33bf188-73d4-4b32-9a0b-c9090eff4f9e'),
(20, NULL, 'app', 'm160708_185142_volume_hasUrls_setting', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', 'cc14a6b6-9ccc-4088-8d84-bc0e2177693e'),
(21, NULL, 'app', 'm160714_000000_increase_max_asset_filesize', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', 'd6a9f907-a1fe-42b7-9d29-2e9f04090bda'),
(22, NULL, 'app', 'm160727_194637_column_cleanup', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', 'c28a216e-4e17-456c-86a8-2d8e2df0a7ac'),
(23, NULL, 'app', 'm160804_110002_userphotos_to_assets', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '55a56ddd-09e5-4bc0-8fe2-904eeb6d141b'),
(24, NULL, 'app', 'm160807_144858_sites', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '2018-03-21 12:23:33', 'b701b270-c89c-4c26-904d-e11c1a424a85'),
(25, NULL, 'app', 'm160829_000000_pending_user_content_cleanup', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '814fe4bb-d33e-4d5b-967d-6799991ec8b6'),
(26, NULL, 'app', 'm160830_000000_asset_index_uri_increase', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', 'f4d443b1-f227-415a-a7c5-1a274c4a283a'),
(27, NULL, 'app', 'm160912_230520_require_entry_type_id', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '58a4fb03-15a3-48d7-9136-578a30451ac9'),
(28, NULL, 'app', 'm160913_134730_require_matrix_block_type_id', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', 'fb4ce7f7-ca20-4eaf-a9aa-73ac5b8e24f1'),
(29, NULL, 'app', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '5fd0ee75-b733-4370-b324-49a5fa543619'),
(30, NULL, 'app', 'm160920_231045_usergroup_handle_title_unique', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '52df8606-1949-492d-942e-cacfe6c41d1c'),
(31, NULL, 'app', 'm160925_113941_route_uri_parts', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', 'ba7885f2-6fd1-4269-8b52-19b576988658'),
(32, NULL, 'app', 'm161006_205918_schemaVersion_not_null', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '70b7f338-badf-4847-b99f-4eb1f8e2c04d'),
(33, NULL, 'app', 'm161007_130653_update_email_settings', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2e70dbfe-d7de-4102-bff4-4f6667174ca8'),
(34, NULL, 'app', 'm161013_175052_newParentId', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '3b29aec5-e5c9-4458-8882-aef0e625d47c'),
(35, NULL, 'app', 'm161021_102916_fix_recent_entries_widgets', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', 'eba30089-5acc-4b7c-b7ba-bca8f0ad9930'),
(36, NULL, 'app', 'm161021_182140_rename_get_help_widget', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '589a4e84-b1f9-4e67-be14-188deeb9eb5e'),
(37, NULL, 'app', 'm161025_000000_fix_char_columns', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '96a2980e-f487-45a6-8c06-76f9cf1bfe2d'),
(38, NULL, 'app', 'm161029_124145_email_message_languages', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '035a8629-a696-4c8b-b60d-a26fca094979'),
(39, NULL, 'app', 'm161108_000000_new_version_format', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '0ab35ad5-6581-41a7-9450-0830ca5714c4'),
(40, NULL, 'app', 'm161109_000000_index_shuffle', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '169901bd-b222-49e9-9fd5-0284c8281dff'),
(41, NULL, 'app', 'm161122_185500_no_craft_app', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', 'd7b47d3b-37f2-4a0d-b920-4e8face86d85'),
(42, NULL, 'app', 'm161125_150752_clear_urlmanager_cache', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', 'f2880540-b8ac-40b5-b0b4-bf0a09d48352'),
(43, NULL, 'app', 'm161220_000000_volumes_hasurl_notnull', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', 'dc9cb72a-a31c-4f36-87c1-b7889ad8ec5e'),
(44, NULL, 'app', 'm170114_161144_udates_permission', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', 'b21dc85f-8409-4a9a-ab8d-27714e84d2af'),
(45, NULL, 'app', 'm170120_000000_schema_cleanup', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', 'a8a2e7ad-4cb3-4aea-8b55-8b9db2b55bf2'),
(46, NULL, 'app', 'm170126_000000_assets_focal_point', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', 'ba2bb87d-3568-4217-a467-27d5caaf16fb'),
(47, NULL, 'app', 'm170206_142126_system_name', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '7ed2cac4-6a35-493c-a325-53ddf57053cf'),
(48, NULL, 'app', 'm170217_044740_category_branch_limits', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '21af3ad3-02aa-4f3d-ba30-365a4ddb088e'),
(49, NULL, 'app', 'm170217_120224_asset_indexing_columns', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', 'a6dab80d-281a-4da1-8eb3-8dde548c44c0'),
(50, NULL, 'app', 'm170223_224012_plain_text_settings', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '3490b55c-ab75-478e-a0fd-f0a5c8e22868'),
(51, NULL, 'app', 'm170227_120814_focal_point_percentage', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', 'aa1d335c-475b-42b9-8d51-a256de5ab7d1'),
(52, NULL, 'app', 'm170228_171113_system_messages', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '8214f018-4598-46c6-96a7-9d09b9ccc5e8'),
(53, NULL, 'app', 'm170303_140500_asset_field_source_settings', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', 'd3c4be7c-1a86-42c3-b570-72cdeb55c718'),
(54, NULL, 'app', 'm170306_150500_asset_temporary_uploads', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '287de381-f723-4844-b17e-e22918ad1a47'),
(55, NULL, 'app', 'm170414_162429_rich_text_config_setting', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '00dabb1f-d158-4cf5-87f1-23944b9d9e85'),
(56, NULL, 'app', 'm170523_190652_element_field_layout_ids', '2018-03-21 12:23:34', '2018-03-21 12:23:34', '2018-03-21 12:23:34', 'd166232e-4dbd-4d14-bcac-c976624ae86b'),
(57, NULL, 'app', 'm170612_000000_route_index_shuffle', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', 'b444e51d-3d87-4daa-9872-aad4d1ab3977'),
(58, NULL, 'app', 'm170621_195237_format_plugin_handles', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '864bc286-f814-475c-997c-a53f7f1250bb'),
(59, NULL, 'app', 'm170630_161028_deprecation_changes', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', 'f24ee45f-2643-40df-b701-7d3c7fb13f89'),
(60, NULL, 'app', 'm170703_181539_plugins_table_tweaks', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '68b402e3-e038-4a91-a47c-95519263def1'),
(61, NULL, 'app', 'm170704_134916_sites_tables', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '4fa6a0fb-6bf4-4873-bb91-12eee306a895'),
(62, NULL, 'app', 'm170706_183216_rename_sequences', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '84d4ab85-e705-4941-8069-0bf66134fc28'),
(63, NULL, 'app', 'm170707_094758_delete_compiled_traits', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', 'ffbe4def-9f46-4d47-ad81-c64b5b05c73f'),
(64, NULL, 'app', 'm170731_190138_drop_asset_packagist', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '953a6e85-c746-48b3-afba-c5b11b89b4e6'),
(65, NULL, 'app', 'm170810_201318_create_queue_table', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '38ed4783-38b9-4e82-92aa-fe26eeeeb774'),
(66, NULL, 'app', 'm170816_133741_delete_compiled_behaviors', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '45d5a63f-0d31-4546-9d98-3af0a7730bf7'),
(67, NULL, 'app', 'm170821_180624_deprecation_line_nullable', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', 'ed60f6ea-593d-4a4b-9081-49e9ab32ab9c'),
(68, NULL, 'app', 'm170903_192801_longblob_for_queue_jobs', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', 'dd3eebce-e313-4b98-8810-e152764ab509'),
(69, NULL, 'app', 'm170914_204621_asset_cache_shuffle', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', 'fd73e4fd-618c-48ac-a9c6-fdecafda83df'),
(70, NULL, 'app', 'm171011_214115_site_groups', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '758207df-176d-4471-822e-b29ddf33a86d'),
(71, NULL, 'app', 'm171012_151440_primary_site', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', 'b9ae3de9-530a-4c97-9f92-e886f7c94417'),
(72, NULL, 'app', 'm171013_142500_transform_interlace', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '4d8244ce-53e7-4105-8466-b455a6193d5b'),
(73, NULL, 'app', 'm171016_092553_drop_position_select', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '05759d80-1557-4370-bbc8-8785a5480831'),
(74, NULL, 'app', 'm171016_221244_less_strict_translation_method', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '2018-03-21 12:23:35', '15ed9629-b264-400e-a658-34c8a992417e'),
(75, NULL, 'app', 'm171107_000000_assign_group_permissions', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '17d9bc8f-8bfc-47f0-b55a-5c272d455182'),
(76, NULL, 'app', 'm171117_000001_templatecache_index_tune', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '511842f5-e02e-4eac-a88d-dcd59df1289b'),
(77, NULL, 'app', 'm171126_105927_disabled_plugins', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '4964d7f4-5490-43c7-93e5-44dfec99d414'),
(78, NULL, 'app', 'm171130_214407_craftidtokens_table', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '0d5acf09-cbe1-4b90-a188-5b0457d33695'),
(79, NULL, 'app', 'm171202_004225_update_email_settings', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '5d6d2a9e-84fb-4d11-852a-d4224fd5215a'),
(80, NULL, 'app', 'm171204_000001_templatecache_index_tune_deux', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '98fb0235-e1a6-4748-9f73-3384c7eb5855'),
(81, NULL, 'app', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', 'dd2473af-fcc0-48cb-be18-009724e6f063'),
(82, NULL, 'app', 'm171210_142046_fix_db_routes', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '23632445-db6a-4f93-a7d4-6c9cf39ac79d'),
(83, NULL, 'app', 'm171218_143135_longtext_query_column', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', 'f5a275d3-41f8-466b-a41f-c8feb40825f8'),
(84, NULL, 'app', 'm171231_055546_environment_variables_to_aliases', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', 'aff5eb03-4da7-4373-9fa0-cdebf7bf520c'),
(85, NULL, 'app', 'm180113_153740_drop_users_archived_column', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', 'f91b2b77-7be2-4e9f-b563-f69b515abb4f'),
(86, NULL, 'app', 'm180122_213433_propagate_entries_setting', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '3b5cb4e3-1eee-444d-b6b8-758024e4bf78'),
(87, NULL, 'app', 'm180124_230459_fix_propagate_entries_values', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', 'ae324924-0d0b-454b-85bc-69562759f391'),
(88, NULL, 'app', 'm180128_235202_set_tag_slugs', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', 'b580bcbb-5310-4974-a5a5-561e7d863283'),
(89, NULL, 'app', 'm180202_185551_fix_focal_points', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', 'c119624f-95f1-455a-a9f1-9b582d26063f'),
(90, NULL, 'app', 'm180217_172123_tiny_ints', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '2018-03-21 12:23:36', '03d72aac-9bdf-42fb-8e6e-97e18fc12a28'),
(91, 2, 'plugin', 'Install', '2018-03-22 18:22:16', '2018-03-22 18:22:16', '2018-03-22 18:22:16', '932ce897-683e-4476-846a-b0d51c2df37b'),
(94, 4, 'plugin', 'Install', '2018-03-22 18:58:16', '2018-03-22 18:58:16', '2018-03-22 18:58:16', '87c42982-e2e1-4765-9ba6-f1441a08fd2d');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKey` char(24) DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','unknown') NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKey`, `licenseKeyStatus`, `enabled`, `settings`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ckeditor', '1.0.0-beta.2', '1.0.0', NULL, 'unknown', 1, NULL, '2018-03-21 16:45:01', '2018-03-21 16:45:01', '2018-03-28 12:35:57', '90ae0fe6-da2c-43bf-b316-3f7c26c4da3b'),
(2, 'redactor', '1.0.1', '1.0.0', NULL, 'unknown', 1, NULL, '2018-03-22 18:22:16', '2018-03-22 18:22:16', '2018-03-28 12:35:57', '37a9c2cc-868f-40cd-bd21-554013c2f98a'),
(4, 'seo', '3.2.2', '3.0.0', NULL, 'unknown', 1, NULL, '2018-03-22 18:58:15', '2018-03-22 18:58:15', '2018-03-28 12:35:57', '1f326b31-4461-4fcf-a1dc-e792ed5d640f');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` tinyint(3) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `relations`
--

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 5, 5, NULL, 8, 1, '2018-03-21 17:44:48', '2018-03-21 17:44:48', '81bd6719-5990-4119-b350-b8e87201813e'),
(2, 5, 3, NULL, 9, 1, '2018-03-21 17:44:59', '2018-03-21 17:44:59', 'd8cc7d20-3020-4af8-907a-3a257d3136cf'),
(12, 6, 4, NULL, 10, 1, '2018-03-22 19:02:47', '2018-03-22 19:02:47', '6b3aa311-69f5-4a03-8241-25459fa3c946');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `siteId` int(11) DEFAULT NULL,
  `uriParts` varchar(255) NOT NULL,
  `uriPattern` varchar(255) NOT NULL,
  `template` varchar(500) NOT NULL,
  `sortOrder` tinyint(3) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' freaper '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' freaper gmx de '),
(1, 'slug', 0, 1, ''),
(2, 'slug', 0, 1, ' homepage '),
(2, 'title', 0, 1, ' webdesign '),
(3, 'field', 1, 1, ' blogging yay '),
(3, 'field', 2, 1, ' lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat sed diam voluptua at vero eos et accusam et justo duo dolores et ea rebum stet clita kasd gubergren no sea takimata sanctus est lorem ipsum dolor sit amet lorem ipsum dolor sit '),
(3, 'slug', 0, 1, ' my first blog entry '),
(3, 'title', 0, 1, ' my first blog entry '),
(4, 'field', 3, 1, ' lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat sed diam voluptua at vero eos et accusam et justo duo dolores et ea rebum stet clita kasd gubergren no sea takimata sanctus est lorem ipsum dolor sit amet lorem ipsum dolor sit '),
(4, 'slug', 0, 1, ' about '),
(4, 'title', 0, 1, ' prozess '),
(5, 'field', 1, 1, ' second '),
(5, 'field', 2, 1, ' lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat sed diam voluptua at vero eos et accusam et justo duo dolores et ea rebum stet clita kasd gubergren no sea takimata sanctus est lorem ipsum dolor sit amet lorem ipsum dolor sit '),
(5, 'slug', 0, 1, ' my second blog '),
(5, 'title', 0, 1, ' my second blog '),
(11, 'title', 0, 1, ' faqs '),
(12, 'field', 3, 1, ' kontakt '),
(12, 'field', 6, 1, ''),
(12, 'slug', 0, 1, ' kontakt '),
(12, 'title', 0, 1, ' kontakt '),
(4, 'field', 7, 1, ' prozess '),
(7, 'field', 7, 1, ''),
(11, 'field', 6, 1, ''),
(11, 'field', 3, 1, ' faqs '),
(7, 'field', 3, 1, ' lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat sed diam voluptua at vero eos et accusam et justo duo dolores et ea rebum stet clita kasd gubergren no sea takimata sanctus est lorem ipsum dolor sit amet lorem ipsum dolor sit '),
(7, 'slug', 0, 1, ' contact '),
(7, 'title', 0, 1, ' leistungen '),
(8, 'slug', 0, 1, ' personal '),
(8, 'title', 0, 1, ' personal '),
(9, 'slug', 0, 1, ' craft cms '),
(9, 'title', 0, 1, ' craft cms '),
(3, 'field', 5, 1, ' craft cms '),
(5, 'field', 5, 1, ' personal '),
(4, 'field', 6, 1, ' catblock '),
(11, 'slug', 0, 1, ' faqs '),
(7, 'field', 6, 1, ''),
(10, 'filename', 0, 1, ' catblock jpg '),
(10, 'extension', 0, 1, ' jpg '),
(10, 'kind', 0, 1, ' image '),
(10, 'slug', 0, 1, ''),
(10, 'title', 0, 1, ' catblock '),
(11, 'field', 7, 1, ''),
(12, 'field', 7, 1, ''),
(4, 'field', 8, 1, ' prozess beschreibung '),
(7, 'field', 8, 1, ''),
(11, 'field', 8, 1, ''),
(12, 'field', 8, 1, ''),
(4, 'field', 9, 1, ' my mprocess title this is a meta description '),
(7, 'field', 9, 1, ''),
(11, 'field', 9, 1, ''),
(12, 'field', 9, 1, ''),
(2, 'field', 3, 1, ''),
(2, 'field', 6, 1, ''),
(2, 'field', 9, 1, ' webdesign '),
(2, 'field', 10, 1, ' lorem ipsum dolor '),
(2, 'field', 11, 1, ' lorem ipsum dolor sit amet consectetur adipisicing elit totam corporis tempore ');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagateEntries` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagateEntries`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'Blog', 'blog', 'channel', 1, 1, '2018-03-21 16:21:56', '2018-03-21 16:21:56', '8b297cfa-fd2d-4ae9-bee8-6a12d57ba422'),
(2, NULL, 'Homepage', 'homepage', 'single', 1, 1, '2018-03-21 16:22:39', '2018-03-21 16:22:39', '435fe188-ffbb-4036-9c43-2a211630873b'),
(3, 1, 'Pages', 'pages', 'structure', 1, 1, '2018-03-21 16:48:47', '2018-03-21 17:31:45', '11a42293-a627-4df9-8d09-78b062ee2516');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '{slug}', 'blog/_entry', 1, '2018-03-21 16:21:56', '2018-03-21 16:21:56', 'c97a7c23-7db6-41ca-a65a-c5426f026d1b'),
(2, 2, 1, 1, '/', 'index', 1, '2018-03-21 16:22:39', '2018-03-21 16:22:39', '24e410ae-018f-4e14-afa2-1da91a184794'),
(3, 3, 1, 1, '{parent.uri}/{slug}', 'pages/_entry', 1, '2018-03-21 16:48:47', '2018-03-21 17:31:45', '2637e224-93d4-40ba-9bbb-2d01b8778e91');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `seo_redirects`
--

CREATE TABLE `seo_redirects` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `type` enum('301','302') NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `seo_sitemap`
--

CREATE TABLE `seo_sitemap` (
  `id` int(11) NOT NULL,
  `group` enum('sections','categories','customUrls') NOT NULL,
  `url` varchar(255) NOT NULL,
  `frequency` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL,
  `priority` float NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'yl6I1Wsku1SlnC2QgjmmrLWExfLGyEmK4SUqW0glUo4sYe4MoK2Edm5Z4vaG9Q5Id9eC7vft-Gfogy549PEk7xHKUPaXn2AmBlTc', '2018-03-22 17:37:22', '2018-03-22 19:37:14', '9885a5b3-5b32-48e9-a99c-db5171586a92');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'webdesign', '2018-03-21 12:23:31', '2018-03-21 12:23:31', '6441ed65-0783-46d8-9378-0b8d1a355e3b');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` tinyint(3) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 'webdesign', 'default', 'en-US', 1, '@web/', 1, '2018-03-21 12:23:31', '2018-03-21 12:23:31', '859438a6-666f-4286-9c3c-f50a835c2477');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `structureelements`
--

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, NULL, 1, 1, 10, 0, '2018-03-21 16:51:37', '2018-03-22 17:39:39', 'b38b6c36-5f4a-4343-8029-8dda78cc05da'),
(2, 1, 4, 1, 2, 3, 1, '2018-03-21 16:51:37', '2018-03-22 17:39:10', '1cc9fc8a-dc00-45c4-a94b-477970eaa944'),
(4, 1, 7, 1, 4, 5, 1, '2018-03-21 17:37:58', '2018-03-22 17:39:10', '506843f7-c660-4b70-a6c0-2565dde4409c'),
(5, 2, NULL, 5, 1, 6, 0, '2018-03-21 17:41:24', '2018-03-21 17:41:38', '873a091d-59ad-4f28-b43c-058eb145b699'),
(6, 2, 8, 5, 2, 3, 1, '2018-03-21 17:41:24', '2018-03-21 17:41:24', '528bcd94-ca30-40d1-960c-21f6bbf7ff79'),
(7, 2, 9, 5, 4, 5, 1, '2018-03-21 17:41:38', '2018-03-21 17:41:38', '369c37fd-c751-4cfa-9f6a-d8019952da49'),
(8, 1, 11, 1, 6, 7, 1, '2018-03-22 17:39:26', '2018-03-22 17:39:26', '9a974690-143a-432c-a8bd-44d1d6e7eb81'),
(9, 1, 12, 1, 8, 9, 1, '2018-03-22 17:39:39', '2018-03-22 17:39:39', '51edcf8d-e7ca-4019-9c9f-7fef1ba91e4f');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `structures`
--

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, '2018-03-21 16:48:47', '2018-03-21 17:31:45', '97b2c9c3-1be0-4ef6-b9f1-543a02232721'),
(2, NULL, '2018-03-21 17:40:59', '2018-03-21 17:40:59', '5a9ca7ee-b330-4e74-9884-053ef948933e');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `systemsettings`
--

CREATE TABLE `systemsettings` (
  `id` int(11) NOT NULL,
  `category` varchar(15) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `systemsettings`
--

INSERT INTO `systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'email', '{\"fromEmail\":\"freaper@gmx.de\",\"fromName\":\"webdesign\",\"transportType\":\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"}', '2018-03-21 12:23:33', '2018-03-21 12:23:33', '94a0048a-7557-447c-809c-8351ea294f89');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `client` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `client`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Freaper', NULL, NULL, NULL, 'freaper@gmx.de', '$2y$13$ybx7CxkW1IVUuBM08ueQpuG8QoHVGOtbq1UFZ3hTQl2IuwG2of2Oq', 1, 0, 0, 0, 0, '2018-03-28 12:35:48', '::1', NULL, NULL, '2018-03-22 12:16:57', NULL, NULL, NULL, NULL, 0, '2018-03-21 12:23:32', '2018-03-21 12:23:32', '2018-03-28 12:35:48', '281d6ae8-a048-4ce5-88c6-d99db29c3172');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Images', '', '2018-03-21 18:10:51', '2018-03-21 18:10:51', '8e295b02-6978-4c04-b917-db4790baf0a7'),
(2, NULL, NULL, 'Temporary source', NULL, '2018-03-21 18:11:17', '2018-03-21 18:11:17', 'ddd0da73-1050-4b00-8806-2fcf5c8727e5'),
(3, 2, NULL, 'user_1', 'user_1/', '2018-03-21 18:11:17', '2018-03-21 18:11:17', '47db919d-5e64-41ca-a4c1-24852ae43068'),
(4, 1, 1, 'storage', 'storage/', '2018-03-21 18:12:06', '2018-03-21 18:12:06', 'f2a848e4-82b7-4fe3-87cb-4ff18b4adf97'),
(5, 4, 1, 'upload', 'storage/upload/', '2018-03-21 18:12:06', '2018-03-21 18:12:06', 'da8e3d76-8db6-4605-9e6b-fa4e9f7dff36');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` tinyint(3) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `volumes`
--

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 5, 'Images', 'images', 'craft\\volumes\\Local', 1, '@web/assets', '{\"path\":\"@webroot/assets\"}', 1, '2018-03-21 18:10:51', '2018-03-22 18:31:16', 'cc106f17-e9b2-4f02-b7e8-65bf894a0777');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` tinyint(3) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, 0, '{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}', 1, '2018-03-21 13:01:39', '2018-03-21 13:01:39', '7e13704e-d87b-4d14-bde5-ce50fa79230d'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, 0, '[]', 1, '2018-03-21 13:01:39', '2018-03-21 13:01:39', '4ccd957a-2cb5-499c-9c73-266725711f15'),
(3, 1, 'craft\\widgets\\Updates', 3, 0, '[]', 1, '2018-03-21 13:01:39', '2018-03-21 13:01:39', '78a8a857-edfe-47d1-a22f-b10188915d8e'),
(4, 1, 'craft\\widgets\\Feed', 4, 0, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2018-03-21 13:01:39', '2018-03-21 13:01:39', '4cdce9c0-4e2f-4ba3-8128-17085f4644d1');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indizes für die Tabelle `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assets_filename_folderId_unq_idx` (`filename`,`folderId`),
  ADD KEY `assets_folderId_idx` (`folderId`),
  ADD KEY `assets_volumeId_idx` (`volumeId`);

--
-- Indizes für die Tabelle `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indizes für die Tabelle `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`);

--
-- Indizes für die Tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_groupId_idx` (`groupId`);

--
-- Indizes für die Tabelle `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `categorygroups_handle_unq_idx` (`handle`),
  ADD KEY `categorygroups_structureId_idx` (`structureId`),
  ADD KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indizes für die Tabelle `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `content_siteId_idx` (`siteId`),
  ADD KEY `content_title_idx` (`title`);

--
-- Indizes für die Tabelle `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craftidtokens_userId_fk` (`userId`);

--
-- Indizes für die Tabelle `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indizes für die Tabelle `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`);

--
-- Indizes für die Tabelle `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `elements_type_idx` (`type`),
  ADD KEY `elements_enabled_idx` (`enabled`),
  ADD KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`);

--
-- Indizes für die Tabelle `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD UNIQUE KEY `elements_sites_uri_siteId_unq_idx` (`uri`,`siteId`),
  ADD KEY `elements_sites_siteId_idx` (`siteId`),
  ADD KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `elements_sites_enabled_idx` (`enabled`);

--
-- Indizes für die Tabelle `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_postDate_idx` (`postDate`),
  ADD KEY `entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `entries_authorId_idx` (`authorId`),
  ADD KEY `entries_sectionId_idx` (`sectionId`),
  ADD KEY `entries_typeId_idx` (`typeId`);

--
-- Indizes für die Tabelle `entrydrafts`
--
ALTER TABLE `entrydrafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrydrafts_sectionId_idx` (`sectionId`),
  ADD KEY `entrydrafts_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `entrydrafts_siteId_idx` (`siteId`),
  ADD KEY `entrydrafts_creatorId_idx` (`creatorId`);

--
-- Indizes für die Tabelle `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  ADD UNIQUE KEY `entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  ADD KEY `entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `entryversions`
--
ALTER TABLE `entryversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entryversions_sectionId_idx` (`sectionId`),
  ADD KEY `entryversions_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `entryversions_siteId_idx` (`siteId`),
  ADD KEY `entryversions_creatorId_idx` (`creatorId`);

--
-- Indizes für die Tabelle `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldgroups_name_unq_idx` (`name`);

--
-- Indizes für die Tabelle `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indizes für die Tabelle `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouts_type_idx` (`type`);

--
-- Indizes für die Tabelle `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indizes für die Tabelle `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `fields_groupId_idx` (`groupId`),
  ADD KEY `fields_context_idx` (`context`);

--
-- Indizes für die Tabelle `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `globalsets_name_unq_idx` (`name`),
  ADD UNIQUE KEY `globalsets_handle_unq_idx` (`handle`),
  ADD KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  ADD KEY `matrixblocks_ownerSiteId_idx` (`ownerSiteId`);

--
-- Indizes für die Tabelle `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `migrations_pluginId_idx` (`pluginId`),
  ADD KEY `migrations_type_pluginId_idx` (`type`,`pluginId`);

--
-- Indizes für die Tabelle `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plugins_handle_unq_idx` (`handle`),
  ADD KEY `plugins_enabled_idx` (`enabled`);

--
-- Indizes für die Tabelle `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`);

--
-- Indizes für die Tabelle `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `relations_sourceId_idx` (`sourceId`),
  ADD KEY `relations_targetId_idx` (`targetId`),
  ADD KEY `relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indizes für die Tabelle `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `routes_uriPattern_idx` (`uriPattern`),
  ADD KEY `routes_siteId_idx` (`siteId`);

--
-- Indizes für die Tabelle `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `searchindex_keywords_idx` (`keywords`);

--
-- Indizes für die Tabelle `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `sections_name_unq_idx` (`name`),
  ADD KEY `sections_structureId_idx` (`structureId`);

--
-- Indizes für die Tabelle `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `sections_sites_siteId_idx` (`siteId`);

--
-- Indizes für die Tabelle `seo_redirects`
--
ALTER TABLE `seo_redirects`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `seo_sitemap`
--
ALTER TABLE `seo_sitemap`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_uid_idx` (`uid`),
  ADD KEY `sessions_token_idx` (`token`),
  ADD KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `sessions_userId_idx` (`userId`);

--
-- Indizes für die Tabelle `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indizes für die Tabelle `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sitegroups_name_unq_idx` (`name`);

--
-- Indizes für die Tabelle `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sites_handle_unq_idx` (`handle`),
  ADD KEY `sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `sites_groupId_fk` (`groupId`);

--
-- Indizes für die Tabelle `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `structureelements_root_idx` (`root`),
  ADD KEY `structureelements_lft_idx` (`lft`),
  ADD KEY `structureelements_rgt_idx` (`rgt`),
  ADD KEY `structureelements_level_idx` (`level`),
  ADD KEY `structureelements_elementId_idx` (`elementId`);

--
-- Indizes für die Tabelle `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `systemmessages_language_idx` (`language`);

--
-- Indizes für die Tabelle `systemsettings`
--
ALTER TABLE `systemsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemsettings_category_unq_idx` (`category`);

--
-- Indizes für die Tabelle `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taggroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `taggroups_handle_unq_idx` (`handle`),
  ADD KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_groupId_idx` (`groupId`);

--
-- Indizes für die Tabelle `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `templatecacheelements_elementId_idx` (`elementId`);

--
-- Indizes für die Tabelle `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `templatecachequeries_type_idx` (`type`);

--
-- Indizes für die Tabelle `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `templatecaches_siteId_idx` (`siteId`);

--
-- Indizes für die Tabelle `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unq_idx` (`token`),
  ADD KEY `tokens_expiryDate_idx` (`expiryDate`);

--
-- Indizes für die Tabelle `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `usergroups_name_unq_idx` (`name`);

--
-- Indizes für die Tabelle `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `usergroups_users_userId_idx` (`userId`);

--
-- Indizes für die Tabelle `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_name_unq_idx` (`name`);

--
-- Indizes für die Tabelle `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indizes für die Tabelle `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `userpermissions_users_userId_idx` (`userId`);

--
-- Indizes für die Tabelle `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unq_idx` (`username`),
  ADD UNIQUE KEY `users_email_unq_idx` (`email`),
  ADD KEY `users_uid_idx` (`uid`),
  ADD KEY `users_verificationCode_idx` (`verificationCode`),
  ADD KEY `users_photoId_fk` (`photoId`);

--
-- Indizes für die Tabelle `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `volumefolders_parentId_idx` (`parentId`),
  ADD KEY `volumefolders_volumeId_idx` (`volumeId`);

--
-- Indizes für die Tabelle `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumes_name_unq_idx` (`name`),
  ADD UNIQUE KEY `volumes_handle_unq_idx` (`handle`),
  ADD KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `entrydrafts`
--
ALTER TABLE `entrydrafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `entryversions`
--
ALTER TABLE `entryversions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT für Tabelle `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT für Tabelle `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT für Tabelle `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `seo_redirects`
--
ALTER TABLE `seo_redirects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `seo_sitemap`
--
ALTER TABLE `seo_sitemap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `systemsettings`
--
ALTER TABLE `systemsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `entrydrafts`
--
ALTER TABLE `entrydrafts`
  ADD CONSTRAINT `entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `entryversions`
--
ALTER TABLE `entryversions`
  ADD CONSTRAINT `entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entryversions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
