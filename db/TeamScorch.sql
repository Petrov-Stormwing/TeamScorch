-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 16 март 2017 в 18:29
-- Версия на сървъра: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.17-1+deb.sury.org~xenial+4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TeamScorch`
--

-- --------------------------------------------------------

--
-- Структура на таблица `Comments`
--

CREATE TABLE `Comments` (
  `ID` int(11) NOT NULL,
  `Content` varchar(255) CHARACTER SET utf8 NOT NULL,
  `UserID` int(11) NOT NULL,
  `PostID` int(11) NOT NULL,
  `Deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `Comments`
--

INSERT INTO `Comments` (`ID`, `Content`, `UserID`, `PostID`, `Deleted`) VALUES
(1, 'Who is this person?', 1, 2, 0),
(2, 'I hate FACEBOOK!!!!', 1, 1, 0),
(3, 'This is the greatest programmer, ever!!!', 2, 2, 0),
(4, 'If you hate it, then delete it! :D', 2, 1, 0),
(5, 'ffffffffffffffffffffffffffffff', 1, 2, 1);

-- --------------------------------------------------------

--
-- Структура на таблица `Posts`
--

CREATE TABLE `Posts` (
  `ID` int(11) NOT NULL,
  `Title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Content` text CHARACTER SET utf8 NOT NULL,
  `UserID` int(11) NOT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `Deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `Posts`
--

INSERT INTO `Posts` (`ID`, `Title`, `Content`, `UserID`, `DateCreated`, `Deleted`) VALUES
(1, 'Facebook API for custom emotions/actions/doing/everything', 'SimpleText is the native text editor for the Apple classic Mac OS.[1] SimpleText allows editing including text formatting (underline, italic, bold, etc.), fonts, and sizes. It was developed to integrate the features included in the different versions of TeachText that were created by various software development groups within Apple.[2]', 1, '2017-03-14 11:41:36', 0),
(2, 'Wallis Nunataks', 'Wallis Nunataks (66°52′S 55°39′ECoordinates: 66°52′S 55°39′E) is a four nunataks with steep rock faces on their south and east sides, standing 4 nautical miles (7 km) east-northeast of Mount Storegutt in Enderby Land. Mapped from ANARE (Australian National Antarctic Research Expeditions) surveys and air photos, 1954-66. Named by Antarctic Names Committee of Australia (ANCA) for G.R. Wallis, geologist with the ANARE (Nella Dan), 1965.', 1, '2017-03-14 11:42:11', 0),
(3, 'Facebook API for custom emotions/actions/doing/everything', '332323223323232323232', 1, '2017-03-16 17:46:57', 1);

-- --------------------------------------------------------

--
-- Структура на таблица `Tags`
--

CREATE TABLE `Tags` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PostID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Схема на данните от таблица `Tags`
--

INSERT INTO `Tags` (`ID`, `Name`, `PostID`) VALUES
(1, 'apple', 1),
(2, 'facebook', 1),
(3, 'text', 1),
(4, 'wallis', 2),
(5, 'nunataks', 2),
(6, 'australia', 2),
(7, 'tag', 3),
(8, 'tag2', 3),
(9, 'tag3', 3),
(10, 'facebook', 3),
(11, 'tag', 3),
(12, 'tag2', 3),
(13, 'tag3', 3),
(14, 'facebook', 3);

-- --------------------------------------------------------

--
-- Структура на таблица `Users`
--

CREATE TABLE `Users` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `AccessLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `Users`
--

INSERT INTO `Users` (`ID`, `Name`, `Email`, `Password`, `AccessLevel`) VALUES
(1, 'SoftUni USER', 'softuni@softuni.bg', '$2y$10$SYcfG3U0FzusUlZX4XnHUO/ces1qpemGl8WLRW/J9xVMatadb.a1W', 1),
(2, 'FakeRoyal', 'royal@softuni.bg', '$2y$10$1YGlXiCUOtpTjqBYKpczkeorlNwu5/LY4Agi0qEfg2iq.et/Jcl6.', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Tags`
--
ALTER TABLE `Tags`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Comments`
--
ALTER TABLE `Comments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `Posts`
--
ALTER TABLE `Posts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Tags`
--
ALTER TABLE `Tags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
