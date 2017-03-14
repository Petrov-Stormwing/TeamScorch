-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 14 март 2017 в 13:35
-- Версия на сървъра: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teamscorch`
--

-- --------------------------------------------------------

--
-- Структура на таблица `comments`
--

CREATE TABLE `comments` (
  `ID` int(11) NOT NULL,
  `Content` varchar(255) CHARACTER SET utf8 NOT NULL,
  `UserID` int(11) NOT NULL,
  `PostID` int(11) NOT NULL,
  `Deleted` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `comments`
--

INSERT INTO `comments` (`ID`, `Content`, `UserID`, `PostID`, `Deleted`) VALUES
(1, 'Who is this person?', 1, 2, 0),
(2, 'I hate FACEBOOK!!!!', 1, 1, 0),
(3, 'This is the greatest programmer, ever!!!', 2, 2, 0),
(4, 'If you hate it, then delete it! :D', 2, 1, 0),
(5, 'gogoogogo', 3, 3, 0),
(6, 'gogoogogo', 3, 3, 0),
(7, 'gogoogogo', 3, 3, 0),
(8, 'gogoogogo', 3, 3, 0);

-- --------------------------------------------------------

--
-- Структура на таблица `posts`
--

CREATE TABLE `posts` (
  `ID` int(11) NOT NULL,
  `Title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Content` text CHARACTER SET utf8 NOT NULL,
  `UserID` int(11) NOT NULL,
  `DateCreated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `posts`
--

INSERT INTO `posts` (`ID`, `Title`, `Content`, `UserID`, `DateCreated`) VALUES
(1, 'Facebook API for custom emotions/actions/doing/everything', 'SimpleText is the native text editor for the Apple classic Mac OS.[1] SimpleText allows editing including text formatting (underline, italic, bold, etc.), fonts, and sizes. It was developed to integrate the features included in the different versions of TeachText that were created by various software development groups within Apple.[2]', 1, '2017-03-14 11:41:36'),
(2, 'Wallis Nunataks', 'Wallis Nunataks (66°52′S 55°39′ECoordinates: 66°52′S 55°39′E) is a four nunataks with steep rock faces on their south and east sides, standing 4 nautical miles (7 km) east-northeast of Mount Storegutt in Enderby Land. Mapped from ANARE (Australian National Antarctic Research Expeditions) surveys and air photos, 1954-66. Named by Antarctic Names Committee of Australia (ANCA) for G.R. Wallis, geologist with the ANARE (Nella Dan), 1965.', 1, '2017-03-14 11:42:11'),
(3, 'Mynewpost', 'adjoifero', 3, '2017-03-14 13:17:00');

-- --------------------------------------------------------

--
-- Структура на таблица `tags`
--

CREATE TABLE `tags` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PostID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Схема на данните от таблица `tags`
--

INSERT INTO `tags` (`ID`, `Name`, `PostID`) VALUES
(1, 'apple', 1),
(2, 'facebook', 1),
(3, 'text', 1),
(4, 'wallis', 2),
(5, 'nunataks', 2),
(6, 'australia', 2),
(7, 'wow', 3);

-- --------------------------------------------------------

--
-- Структура на таблица `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `AccessLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `users`
--

INSERT INTO `users` (`ID`, `Name`, `Email`, `Password`, `AccessLevel`) VALUES
(1, 'SoftUni USER', 'softuni@softuni.bg', '$2y$10$SYcfG3U0FzusUlZX4XnHUO/ces1qpemGl8WLRW/J9xVMatadb.a1W', 1),
(2, 'FakeRoyal', 'royal@softuni.bg', '$2y$10$1YGlXiCUOtpTjqBYKpczkeorlNwu5/LY4Agi0qEfg2iq.et/Jcl6.', 0),
(3, 'radoslav radev', 'radoslav0134@gmail.com', '$2y$10$l3keNIBSs7GBu.5Xd8Ffde/rVPBiiNSh1CLS9oz7MU6kXpOU4tmsu', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
