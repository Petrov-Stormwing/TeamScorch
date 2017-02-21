-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 21 фев 2017 в 14:26
-- Версия на сървъра: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtest`
--
CREATE DATABASE IF NOT EXISTS `dbtest` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dbtest`;

-- --------------------------------------------------------

--
-- Структура на таблица `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `stockPrice` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `company`
--

INSERT INTO `company` (`id`, `cname`, `stockPrice`, `country`) VALUES
(1, 'Sony', 123, 'Japan'),
(2, 'Samsung', 321, 'China'),
(3, 'Tesla', 450, 'USA');

-- --------------------------------------------------------

--
-- Структура на таблица `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `product`
--

INSERT INTO `product` (`id`, `pname`, `price`, `category`, `company_name`) VALUES
(1, 'XPERIA Z', 100, 'Phone', 'Sony'),
(2, 'Galaxy 7', 400, 'Phone', 'Samsung'),
(3, 'Model S', 1000, 'Car', 'Tesla');

-- --------------------------------------------------------

--
-- Структура на таблица `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура на таблица `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `userEmail` varchar(60) NOT NULL,
  `userPass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT;--
-- Database: `homework`
--
CREATE DATABASE IF NOT EXISTS `homework` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `homework`;

-- --------------------------------------------------------

--
-- Структура на таблица `boxoffice`
--

CREATE TABLE `boxoffice` (
  `id` int(10) UNSIGNED NOT NULL,
  `movie_id` int(10) UNSIGNED DEFAULT NULL,
  `rating` float(7,3) NOT NULL,
  `domestic_sales` int(10) UNSIGNED NOT NULL,
  `internation_sales` int(10) UNSIGNED NOT NULL,
  `aspect_ratio` float(7,5) UNSIGNED NOT NULL,
  `language` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `boxoffice`
--

INSERT INTO `boxoffice` (`id`, `movie_id`, `rating`, `domestic_sales`, `internation_sales`, `aspect_ratio`, `language`) VALUES
(1, 5, 8.200, 380843261, 555900000, 1.85000, 'English'),
(2, 14, 7.400, 268492764, 475066843, 1.85000, 'English'),
(3, 12, 6.400, 191452396, 368400000, 1.78000, 'English'),
(4, 3, 7.900, 245852179, 239163000, 1.85000, 'English'),
(5, 6, 8.000, 261441092, 370001000, 2.40000, 'French'),
(6, 9, 8.500, 223808164, 297503696, 1.78000, 'English'),
(7, 11, 8.400, 415004880, 648167031, 1.85000, 'English'),
(8, 1, 8.300, 191796233, 170162503, 1.85000, 'English'),
(9, 7, 7.200, 244082982, 217900167, 1.78000, 'English'),
(10, 10, 8.300, 293004164, 438338580, 1.85000, 'English'),
(11, 4, 8.100, 289916256, 272900000, 1.85000, 'English'),
(12, 2, 7.200, 162798565, 200600000, 1.85000, 'English'),
(13, 13, 7.200, 237283207, 301700000, 1.85000, 'English');

-- --------------------------------------------------------

--
-- Структура на таблица `directors`
--

CREATE TABLE `directors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `born_date` date NOT NULL,
  `died_date` date DEFAULT NULL,
  `born_place` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `directors`
--

INSERT INTO `directors` (`id`, `name`, `born_date`, `died_date`, `born_place`) VALUES
(1, 'John Lasseter', '1958-01-12', NULL, 'Hollywood, LA, CA'),
(2, 'Pete Docter', '1968-10-09', NULL, 'Minnesota, USA'),
(3, 'Andrew Stanton', '1965-12-03', NULL, 'Massachusetts, USA'),
(4, 'Brad Bird', '1957-09-24', NULL, 'Montana, USA'),
(5, 'Lee Unkrich', '1957-08-08', NULL, 'Ohio, USA'),
(6, 'Brenda Chapman', '1957-08-08', NULL, 'Illinois, USA'),
(7, 'Dan Scanlon', '1976-06-21', NULL, 'Michigan, USA');

-- --------------------------------------------------------

--
-- Структура на таблица `movies`
--

CREATE TABLE `movies` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL,
  `director` varchar(250) NOT NULL,
  `year` year(4) NOT NULL,
  `length_min` int(11) NOT NULL,
  `aspect_ratio` float(7,5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `movies`
--

INSERT INTO `movies` (`id`, `title`, `director`, `year`, `length_min`, `aspect_ratio`) VALUES
(1, 'Toy Story', 'John Lasseter', 1995, 81, 0.00000),
(2, 'A Bug''s Life', 'John Lasseter', 1998, 95, 0.00000),
(3, 'Toy Story 2', 'John Lasseter', 1999, 93, 0.00000),
(4, 'Monsters, Inc.', 'Pete Docter', 2001, 92, 0.00000),
(5, 'Finding Nemo', 'Andrew Stanton', 2003, 107, 0.00000),
(6, 'The Incredibles', 'Brad Bird', 2004, 116, 0.00000),
(7, 'Cars', 'John Lasseter', 2006, 117, 0.00000),
(8, 'Ratatouille', 'Brad Bird', 2007, 115, 0.00000),
(9, 'WALL-E', 'Andrew Stanton', 2008, 104, 0.00000),
(10, 'Up', 'Pete Docter', 2009, 101, 0.00000),
(11, 'Toy Story 3', 'Lee Unkrich', 2010, 103, 0.00000),
(12, 'Cars 2', 'John Lasseter', 2011, 120, 0.00000),
(13, 'Brave', 'Brenda Chapman', 2012, 102, 0.00000),
(14, 'Monsters University', 'Dan Scanlon', 2013, 110, 0.00000),
(15, 'WALL-G', 'Brenda Chapman', 2042, 97, 0.00000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boxoffice`
--
ALTER TABLE `boxoffice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boxoffice`
--
ALTER TABLE `boxoffice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `directors`
--
ALTER TABLE `directors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `boxoffice`
--
ALTER TABLE `boxoffice`
  ADD CONSTRAINT `boxoffice_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `boxoffice_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);
--
-- Database: `homework21dec`
--
CREATE DATABASE IF NOT EXISTS `homework21dec` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `homework21dec`;

-- --------------------------------------------------------

--
-- Структура на таблица `boxoffice`
--

CREATE TABLE `boxoffice` (
  `Rating` double DEFAULT NULL,
  `Domestic_sales` bigint(20) DEFAULT NULL,
  `International_sales` bigint(20) DEFAULT NULL,
  `Aspect_ratio` double DEFAULT NULL,
  `Movie_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `boxoffice`
--

INSERT INTO `boxoffice` (`Rating`, `Domestic_sales`, `International_sales`, `Aspect_ratio`, `Movie_id`, `Id`) VALUES
(8.2, 380843261, 555900000, 1.85, 5, 1),
(7.4, 268492764, 475066843, 1.85, 14, 2),
(8, 206445654, 417277164, 1.85, 8, 3),
(6.4, 191452396, 368400000, 1.7778, 12, 4),
(7.9, 245852179, 239163000, 1.85, 3, 5),
(8, 261441092, 370001000, 2.35, 6, 6),
(8.5, 223808164, 297503696, 1.7778, 9, 7),
(8.4, 415004880, 648167031, 1.85, 11, 8),
(7.2, 244082982, 217900167, 1.7778, 7, 9),
(8.3, 293004164, 438338580, 1.85, 10, 10),
(8.1, 289916256, 272900000, 1.85, 4, 11),
(7.2, 237283207, 301700000, 1.85, 13, 12),
(8.2, 356454367, 857611174, 1.85, 20, 13),
(6.8, 123087120, 208839027, 2.35, 21, 14);

-- --------------------------------------------------------

--
-- Структура на таблица `boxoffice_old`
--

CREATE TABLE `boxoffice_old` (
  `Rating` double DEFAULT NULL,
  `Domestic_sales` bigint(20) DEFAULT NULL,
  `International_sales` bigint(20) DEFAULT NULL,
  `Aspect_ratio` double DEFAULT NULL,
  `Movie_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `boxoffice_old`
--

INSERT INTO `boxoffice_old` (`Rating`, `Domestic_sales`, `International_sales`, `Aspect_ratio`, `Movie_id`, `Id`) VALUES
(8.2, 380843261, 555900000, 1.85, 5, 1),
(7.4, 268492764, 475066843, 1.85, 14, 2),
(8, 206445654, 417277164, 1.85, 8, 3),
(6.4, 191452396, 368400000, 1.7778, 12, 4),
(7.9, 245852179, 239163000, 1.85, 3, 5),
(8, 261441092, 370001000, 2.35, 6, 6),
(8.5, 223808164, 297503696, 1.7778, 9, 7),
(8.4, 415004880, 648167031, 1.85, 11, 8),
(7.2, 244082982, 217900167, 1.7778, 7, 9),
(8.3, 293004164, 438338580, 1.85, 10, 10),
(8.1, 289916256, 272900000, 1.85, 4, 11),
(7.2, 237283207, 301700000, 1.85, 13, 12),
(8.2, 356454367, 857611174, 1.85, 20, 13),
(6.8, 123087120, 208839027, 2.35, 21, 14);

-- --------------------------------------------------------

--
-- Структура на таблица `buildings`
--

CREATE TABLE `buildings` (
  `Building_name` char(2) NOT NULL,
  `Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `buildings`
--

INSERT INTO `buildings` (`Building_name`, `Capacity`) VALUES
('1e', 24),
('1w', 32),
('2e', 16),
('2w', 20);

-- --------------------------------------------------------

--
-- Структура на таблица `coaches`
--

CREATE TABLE `coaches` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `egn` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `coaches`
--

INSERT INTO `coaches` (`id`, `name`, `egn`) VALUES
(1, '???? ??????', '7509041245'),
(2, '?????? ?????? ???????', '8010091245'),
(3, '????? ??????? ????????', '8407106352'),
(4, '????? ??????? ????????', '7010102045'),
(5, '????? ?????? ??????', '7106041278');

-- --------------------------------------------------------

--
-- Структура на таблица `directors`
--

CREATE TABLE `directors` (
  `Director_name` varchar(255) DEFAULT NULL,
  `Born_date` date DEFAULT NULL,
  `Died_date` date DEFAULT NULL,
  `Born_place` varchar(1024) DEFAULT NULL,
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `directors`
--

INSERT INTO `directors` (`Director_name`, `Born_date`, `Died_date`, `Born_place`, `Id`) VALUES
('John Lasseter', NULL, NULL, NULL, 1),
('Pete Docter', NULL, NULL, NULL, 2),
('Andrew Stanton', NULL, NULL, NULL, 3),
('Brad Bird', NULL, NULL, NULL, 4),
('Lee Unkrich', NULL, NULL, NULL, 5),
('Brenda Chapman', NULL, NULL, NULL, 6),
('Dan Scanlon', NULL, NULL, NULL, 7),
('Brian Fee', NULL, NULL, NULL, 8),
('Peter Sohn', NULL, NULL, NULL, 9),
('Mark Andrews', NULL, NULL, NULL, 10),
('Steve Purcell', NULL, NULL, NULL, 11),
('Doug Sweetland', NULL, NULL, NULL, 12);

-- --------------------------------------------------------

--
-- Структура на таблица `directors1`
--

CREATE TABLE `directors1` (
  `Movie_id_obsolete` int(11) DEFAULT NULL,
  `Director_name` varchar(255) DEFAULT NULL,
  `Born_date` date DEFAULT NULL,
  `Died_date` date DEFAULT NULL,
  `Born_place` varchar(1024) DEFAULT NULL,
  `Id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `directors1`
--

INSERT INTO `directors1` (`Movie_id_obsolete`, `Director_name`, `Born_date`, `Died_date`, `Born_place`, `Id`) VALUES
(3, 'John Lasseter', NULL, NULL, NULL, 1),
(4, 'Pete Docter', NULL, NULL, NULL, 2),
(5, 'Andrew Stanton', NULL, NULL, NULL, 3),
(6, 'Brad Bird', NULL, NULL, NULL, 4),
(7, 'John Lasseter', NULL, NULL, NULL, 5),
(8, 'Brad Bird', NULL, NULL, NULL, 6),
(9, 'Andrew Stanton', NULL, NULL, NULL, 7),
(10, 'Pete Docter', NULL, NULL, NULL, 8),
(11, 'Lee Unkrich', NULL, NULL, NULL, 9),
(12, 'John Lasseter', NULL, NULL, NULL, 10),
(13, 'Brenda Chapman', NULL, NULL, NULL, 11),
(14, 'Dan Scanlon', NULL, NULL, NULL, 12),
(15, 'Brad Bird', NULL, NULL, NULL, 13),
(17, 'Brian Fee', NULL, NULL, NULL, 14),
(18, 'Lee Unkrich', NULL, NULL, NULL, 15),
(19, 'Andrew Stanton', NULL, NULL, NULL, 16),
(20, 'Pete Docter', NULL, NULL, NULL, 17),
(21, 'Peter Sohn', NULL, NULL, NULL, 18),
(NULL, 'Mark Andrews', NULL, NULL, NULL, 19),
(NULL, 'Steve Purcell', NULL, NULL, NULL, 20);

-- --------------------------------------------------------

--
-- Структура на таблица `employees`
--

CREATE TABLE `employees` (
  `Role` varchar(20) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Building` char(2) DEFAULT NULL,
  `Years_employed` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `employees`
--

INSERT INTO `employees` (`Role`, `Name`, `Building`, `Years_employed`) VALUES
('Engineer', 'Becky A.', '1e', 4),
('Engineer', 'Dan B.', '1e', 2),
('Engineer', 'Sharon F.', '1e', 6),
('Engineer', 'Dan M.', '1e', 4),
('Engineer', 'Malcom S.', '1e', 1),
('Artist', 'Tylar S.', '2w', 2),
('Artist', 'Sherman D.', '2w', 8),
('Artist', 'Jakob J.', '2w', 6),
('Artist', 'Lillia A.', '2w', 7),
('Artist', 'Brandon J.', '2w', 7),
('Manager', 'Scott K.', '1e', 9),
('Manager', 'Shirlee M.', '1e', 3),
('Manager', 'Daria O.', '2w', 6),
('Engineer', 'Yancy I.', NULL, 0),
('Artist', 'Oliver P.', NULL, 0),
(NULL, 'Janet J.', '2w', 1);

-- --------------------------------------------------------

--
-- Структура на таблица `language`
--

CREATE TABLE `language` (
  `Movie_id` int(11) NOT NULL,
  `Lang_name` varchar(50) DEFAULT NULL,
  `IsSubtitles` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `language`
--

INSERT INTO `language` (`Movie_id`, `Lang_name`, `IsSubtitles`) VALUES
(3, 'Arabic', 1),
(5, 'English', 0),
(14, 'English', 0),
(8, 'English', 0),
(12, 'English', 0),
(3, 'English', 0),
(9, 'English', 0),
(11, 'English', 0),
(7, 'English', 0),
(10, 'English', 0),
(4, 'English', 0),
(13, 'English', 0),
(6, 'English', 0),
(20, 'English', 0),
(21, 'English', 0),
(18, 'English', 1),
(6, 'French', 1),
(8, 'French', 0),
(18, 'French', 1),
(7, 'Italian', 1),
(7, 'Japanese', 1),
(3, 'Spanish', 1),
(11, 'Spanish', 1),
(7, 'Yiddish', 1);

-- --------------------------------------------------------

--
-- Структура на таблица `movies`
--

CREATE TABLE `movies` (
  `Id` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Length_min` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `movies`
--

INSERT INTO `movies` (`Id`, `Title`, `Year`, `Length_min`) VALUES
(3, 'Toy Story 2', 1999, 93),
(4, 'Monsters, Inc.', 2001, 92),
(5, 'Finding Nemo', 2003, 107),
(6, 'The Incredibles', 2004, 116),
(7, 'Cars', 2006, 117),
(8, 'Ratatouille', 2007, 115),
(9, 'WALL-E', 2008, 104),
(10, 'Up', 2009, 101),
(11, 'Toy Story 3', 2010, 103),
(12, 'Cars 2', 2011, 120),
(13, 'Brave', 2012, 102),
(14, 'Monsters University', 2013, 110),
(15, 'The Incredibles 2', 2018, NULL),
(16, 'Toy Story 4', 2019, NULL),
(17, 'Cars 3', 2017, 91),
(18, 'Coco', 2017, 90),
(19, 'Finding Dory', 2016, 97),
(20, 'Inside Out', 2015, 94),
(21, 'The Good Dinosaur', 2015, 93);

-- --------------------------------------------------------

--
-- Структура на таблица `moviesdirectedby`
--

CREATE TABLE `moviesdirectedby` (
  `Movie_id` int(11) NOT NULL,
  `Director_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `moviesdirectedby`
--

INSERT INTO `moviesdirectedby` (`Movie_id`, `Director_id`) VALUES
(3, 1),
(4, 2),
(5, 3),
(6, 4),
(7, 1),
(8, 4),
(9, 3),
(10, 2),
(11, 5),
(12, 1),
(13, 6),
(14, 7),
(15, 4),
(17, 8),
(18, 5),
(19, 3),
(20, 2),
(21, 9),
(3, 5),
(4, 5),
(5, 5),
(13, 10),
(13, 11);

-- --------------------------------------------------------

--
-- Структура на таблица `sportgroups`
--

CREATE TABLE `sportgroups` (
  `id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `dayOfWeek` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  `hourOfTraining` time NOT NULL,
  `sport_id` int(11) NOT NULL,
  `coach_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `sportgroups`
--

INSERT INTO `sportgroups` (`id`, `location`, `dayOfWeek`, `hourOfTraining`, `sport_id`, `coach_id`) VALUES
(1, 'Sofia-Mladost 1', 'Monday', '08:00:00', 1, 1),
(2, 'Sofia-Mladost 1', 'Monday', '09:30:00', 1, 1),
(3, 'Sofia- Liylin 7', 'Sunday', '09:00:00', 2, 2),
(4, 'Sofia-Nadezhda', 'Sunday', '08:00:00', 1, NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `sports`
--

CREATE TABLE `sports` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `sports`
--

INSERT INTO `sports` (`id`, `name`) VALUES
(1, 'Football'),
(2, 'Volleyball');

-- --------------------------------------------------------

--
-- Структура на таблица `student_sport`
--

CREATE TABLE `student_sport` (
  `student_id` int(11) NOT NULL,
  `sportGroup_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `student_sport`
--

INSERT INTO `student_sport` (`student_id`, `sportGroup_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2);

-- --------------------------------------------------------

--
-- Структура на таблица `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `egn` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `students`
--

INSERT INTO `students` (`id`, `name`, `egn`, `address`, `phone`, `class`) VALUES
(1, 'Iliyan Ivanov', '9401150045', 'Sofia-Mladost 1', '0893452120', '10'),
(2, 'Ivan Iliev Georgiev', '9510104512', 'Sofia-Liylin', '0894123456', '11'),
(3, 'Elena Petrova Petrova', '9505052154', 'Sofia-Mladost 3', '0897852412', '11'),
(4, 'Ivan Iliev Iliev', '9510104542', 'Sofia-Mladost 3', '0894123457', '11'),
(5, 'Maria Hristova Dimova', '9510104547', 'Sofia-Mladost 4', '0894123442', '11'),
(6, 'Antoaneta Ivanova Georgieva', '9411104547', 'Sofia-Krasno selo', '0874526235', '10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boxoffice`
--
ALTER TABLE `boxoffice`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `boxoffice_old`
--
ALTER TABLE `boxoffice_old`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`Building_name`);

--
-- Indexes for table `coaches`
--
ALTER TABLE `coaches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `egn` (`egn`);

--
-- Indexes for table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `sportgroups`
--
ALTER TABLE `sportgroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_sport`
--
ALTER TABLE `student_sport`
  ADD PRIMARY KEY (`student_id`,`sportGroup_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `egn` (`egn`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boxoffice`
--
ALTER TABLE `boxoffice`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `boxoffice_old`
--
ALTER TABLE `boxoffice_old`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `coaches`
--
ALTER TABLE `coaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `directors`
--
ALTER TABLE `directors`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `sportgroups`
--
ALTER TABLE `sportgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sports`
--
ALTER TABLE `sports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;--
-- Database: `hw`
--
CREATE DATABASE IF NOT EXISTS `hw` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hw`;

-- --------------------------------------------------------

--
-- Структура на таблица `activedrivers`
--

CREATE TABLE `activedrivers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `egn` varchar(11) DEFAULT NULL,
  `taxi_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `activedrivers`
--

INSERT INTO `activedrivers` (`id`, `name`, `egn`, `taxi_id`) VALUES
(1, '???? ??????', '7508084455', 2),
(2, '?????? ???????', '8005054488', 1);

-- --------------------------------------------------------

--
-- Структура на таблица `books`
--

CREATE TABLE `books` (
  `Id` int(11) NOT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `Author` varchar(200) DEFAULT NULL,
  `Genre` varchar(200) DEFAULT NULL,
  `Price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура на таблица `boxoffice`
--

CREATE TABLE `boxoffice` (
  `Rating` double DEFAULT NULL,
  `Domestic_sales` varchar(255) DEFAULT NULL,
  `International_sales` varchar(255) DEFAULT NULL,
  `Aspect_ratio` double DEFAULT NULL,
  `Language` varchar(255) DEFAULT NULL,
  `Movie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `boxoffice`
--

INSERT INTO `boxoffice` (`Rating`, `Domestic_sales`, `International_sales`, `Aspect_ratio`, `Language`, `Movie_id`) VALUES
(8.2, '380843261', '555900000', 1.85, 'English', 5),
(7.4, '268492764', '475066843', 1.85, 'English', 14),
(8, '206445654', '417277164', 1.85, 'English', 8),
(6.4, '191452396', '368400000', 1.78, 'English', 12),
(7.9, '245852179', '239163000', 1.85, 'English', 3),
(8, '261441092', '370001000', 2.4, 'French', 6),
(8.5, '223808164', '297503696', 1.78, 'English', 9),
(8.4, '415004880', '648167031', 1.85, 'English', 11),
(8.3, '191796233', '170162503', 1.85, 'English', 1),
(7.2, '244082982', '217900167', 1.78, 'English', 7),
(8.3, '293004164', '438338580', 1.85, 'English', 10),
(8.1, '289916256', '272900000', 1.85, 'English', 4),
(7.2, '162798565', '200600000', 1.85, 'English', 2),
(7.2, '237283207', '301700000', 1.85, 'English', 13);

-- --------------------------------------------------------

--
-- Структура на таблица `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `egn` varchar(11) DEFAULT NULL,
  `taxi_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `egn`, `taxi_id`) VALUES
(1, '???? ??????', '7508084455', 2),
(2, '?????? ???????', '8005054488', 1),
(3, '????? ???????????', '8404046699', NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `director` varchar(250) NOT NULL,
  `year` year(4) NOT NULL,
  `length_min` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `movies`
--

INSERT INTO `movies` (`id`, `title`, `director`, `year`, `length_min`) VALUES
(1, 'Toy Story', 'John Lasseter', 1995, 81),
(2, 'A Bug''s Life', 'John Lasseter', 1998, 95),
(3, 'Toy Story 2', 'John Lasseter', 1999, 93),
(4, 'Monsters, Inc.', 'Pete Docter', 2001, 92),
(5, 'Finding Nemo', 'Andrew Stanton', 2003, 107),
(6, 'The Incredibles', 'Brad Bird', 2004, 116),
(7, 'Cars', 'John Lasseter', 2006, 117),
(8, 'Ratatouille', 'Brad Bird', 2007, 115),
(9, 'WALL-E', 'Andrew Stanton', 2008, 104),
(10, 'Up', 'Pete Docter', 2009, 101),
(11, 'Toy Story 3', 'Lee Unkrich', 2010, 103),
(12, 'Cars 2', 'John Lasseter', 2011, 120),
(13, 'Brave', 'Brenda Chapman', 2012, 102),
(14, 'Monsters University', 'Dan Scanlon', 2013, 110),
(15, 'WALL-G', 'Brenda Chapman', 2042, 97),
(18, 'The Incredibles 2', 'Brad Bird', 2018, NULL),
(19, 'Toy Story 4', 'John Lasseter', 2019, NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(145) DEFAULT NULL,
  `egn` varchar(11) DEFAULT NULL,
  `address` varchar(245) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `class` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `students`
--

INSERT INTO `students` (`id`, `name`, `egn`, `address`, `phone`, `class`) VALUES
(1, 'Елена Петрова Петрова', '0505050505', '67 Hristo Shishmanov Str.', '0899600969', 132),
(2, 'Иван Илиев Илиев', '0606060605', 'София, Младост 4', '0899666606', 131),
(3, 'Мария Христова Димова', '05011103578', 'София, Дружба 1', '0874561232', 132);

-- --------------------------------------------------------

--
-- Структура на таблица `taxis`
--

CREATE TABLE `taxis` (
  `id` int(11) NOT NULL,
  `regnom` varchar(8) DEFAULT NULL,
  `make` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `taxis`
--

INSERT INTO `taxis` (`id`, `regnom`, `make`) VALUES
(1, 'CA0101YY', 'Kia'),
(2, 'CA0202CC', 'Suzuki'),
(3, 'CA0303BB', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activedrivers`
--
ALTER TABLE `activedrivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxis`
--
ALTER TABLE `taxis`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activedrivers`
--
ALTER TABLE `activedrivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `taxis`
--
ALTER TABLE `taxis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;--
-- Database: `mysqli_login`
--
CREATE DATABASE IF NOT EXISTS `mysqli_login` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mysqli_login`;

-- --------------------------------------------------------

--
-- Структура на таблица `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `username`, `email`, `password`) VALUES
(1, 'radoslav013', 'radoslav0134@gmail.com', '$2y$10$evukcwSAuSQLxL6rLXTBfOCpXPfATy1P5s.EI3Z/pEoeUJ42Zujky'),
(2, 'pen4o', 'pen4o@abv.bg', '$2y$10$IGXzkhzGlO4.q3NXJA84Neoz9.MoEN6Qs3Mgi88JBG4LSrLVKuwnm'),
(3, 'pen40', 'pen40@abv.bg', '$2y$10$5OVzBkkNerSCcbQrkjwJAOWPpijBh3lMlPEtzy3VQYb7TuZqUABZe'),
(4, 'viktoriq', 'viktoriq@abv.bg', '$2y$10$EMBoXMHwWFPe9Q5xZ7gRYuYV1NydyhizM3Qm3aJYJRp6Gy7ACiVR.'),
(5, 'jivot71', 'jivot71@abv.bg', '$2y$10$tbSGlMgyPf01CPowQSpbF.JNcfmALxkNJdofsGABBOPBj9cxuszvm'),
(6, 'test123', 'test@abv.bg', '$2y$10$7.fkH94A/KcfzgElAJYmA.fw8Q8yJdLvWTdUVng.dwSMHaZfKyEw2'),
(7, 'rado123', 'rado@abv.bg', '$2y$10$fK/nBaqXAOjvUUWc524IO.ngFGD4BmxXRVAKPiS7OjXkpXVTCWChm'),
(8, 'cveti123', 'cveti123@abv.bg', '$2y$10$/q74fZGHHi/l9XcjbxBggestrDlB0555C.djXm5pFBTPlQ6XIIKza');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;--
-- Database: `pdo_ret`
--
CREATE DATABASE IF NOT EXISTS `pdo_ret` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pdo_ret`;

-- --------------------------------------------------------

--
-- Структура на таблица `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `user` int(11) NOT NULL,
  `done` tinyint(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `items`
--

INSERT INTO `items` (`id`, `name`, `user`, `done`, `created`) VALUES
(1, 'Go vegan!!', 1, 0, '2016-12-14 00:00:00'),
(2, 'Fruit', 2, 1, '2016-12-13 00:00:00');

-- --------------------------------------------------------

--
-- Структура на таблица `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'alex', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;--
-- Database: `project`
--
CREATE DATABASE IF NOT EXISTS `project` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `project`;

-- --------------------------------------------------------

--
-- Структура на таблица `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `attendance`
--

INSERT INTO `attendance` (`id`, `name`, `email`, `phone`, `address`, `comment`) VALUES
(1, 'Christian', 'christian_rizal@interconti.com', '0887945655', 'Baker str', NULL),
(2, 'Sing', 'singgih93@mailcity.com', '0885647466', 'Perusha str', NULL),
(3, 'Ivan', 'idonk_gebhoy@yahoo.com', '0887945785', 'Ivan Mangafov str', NULL),
(4, 'Petar', 'info@houseofbali.com', '0887525655', 'Hristo Smirnenski str', NULL),
(5, 'Kristina', 'kyohana@toureast.net', '0887989655', 'Ivan Shishman str', NULL),
(6, 'Yasen', 'sales@nusaduahotel.com', '0887456655', 'Oborishte str', NULL),
(7, 'Yana', 'jayakarta@mataram.wasantara.net.id', '0887947895', 'Bulgaria str', NULL),
(8, 'Martin', 'mapindo@indo.net.id', '0887945123', 'Tarnovo str', NULL),
(9, 'Simona', 'sm@ramayanahotel.com', '0887945568', 'Ivan Asen str', NULL),
(10, 'Alex', 'anekabeach@dps.centrin.net.id', '0897845655', 'Tsar Kaloqn str', NULL),
(11, 'Emil', 'yogya@jayakartahotelsresorts.com', '0887945685', 'Saedinenie str', NULL),
(12, 'Gabriel', 'garudawisatajaya@indo.net.id', '0887944125', 'Pencho Slaveikov str', NULL),
(13, 'Kevin', 'ketut@kbatur.com', '0887945754', 'Jeko Voivoda str', NULL),
(14, 'Dimitar', 'bondps@bonansatours.com', '0887562655', 'Kiril i Metodii str', NULL),
(15, 'Ivan', 'witamgr@dps.centrin.net.id', '0887857655', 'Dragan Tsankov str', NULL),
(16, 'Dani', 'dtedja@indosat.net.id', '0887940145', 'Okolovrustno str', NULL),
(17, 'Mitko', 'info@stpbali.ac.id', '0887944651', 'Tsar Boris III str', NULL),
(18, 'Ivailo', 'baliprestigeho@dps.centrin.net.id', '0887948755', 'Vasil Levski str', NULL),
(19, 'Hristo', 'pamilu@mas - travel.com', '0887949855', 'Hristo Botev str', NULL),
(20, 'Marin', 'amandabl @indosat.net.id', '0887944555', 'Filip Totio str', NULL),
(21, 'Mario', 'marketing@csdwholiday.com', '0887901655', 'Aleksandur Veliki str', NULL),
(22, 'Petq', 'luha89@yahoo.com', '0887945035', 'Peio Yavorov str', NULL),
(23, 'Gabriela', 'indahsuluh2002@yahoo.com.sg', '0887205655', 'Elisaveta Bagrqna str', NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `event_performers`
--

CREATE TABLE `event_performers` (
  `id` int(11) NOT NULL,
  `Performers_id` int(11) DEFAULT NULL,
  `Events_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `event_performers`
--

INSERT INTO `event_performers` (`id`, `Performers_id`, `Events_id`) VALUES
(1, 1, 20),
(2, 2, 19),
(3, 3, 18),
(4, 4, 17),
(5, 5, 16),
(6, 6, 15),
(7, 7, 14),
(8, 8, 13),
(9, 9, 12),
(10, 10, 11),
(11, 11, 10),
(12, 12, 9),
(13, 13, 8),
(14, 14, 7),
(15, 15, 6),
(16, 16, 5),
(17, 17, 4),
(18, 18, 3),
(19, 19, 2),
(20, 20, 1);

-- --------------------------------------------------------

--
-- Структура на таблица `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `places_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `rating` double(150,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `events`
--

INSERT INTO `events` (`id`, `start_time`, `end_time`, `places_id`, `date`, `rating`) VALUES
(1, '08:00:00', '10:00:00', 4, '2017-08-01', 9.0),
(2, '09:00:00', '11:00:00', 6, '2017-08-02', 8.0),
(3, '08:00:00', '12:00:00', 8, '2017-08-03', 7.0),
(4, '08:00:00', '13:00:00', 16, '2017-08-04', 6.0),
(5, '18:00:00', '14:00:00', 1, '2017-08-05', 5.0),
(6, '08:00:00', '15:00:00', 2, '2017-08-06', 3.0),
(7, '08:00:00', '17:00:00', 9, '2017-08-07', 8.0),
(8, '08:00:00', '18:00:00', 10, '2017-08-08', 9.5),
(9, '08:00:00', '19:00:00', 17, '2017-08-09', 9.6),
(10, '18:00:00', '10:00:00', 18, '2017-08-10', 9.4),
(11, '08:00:00', '13:00:00', 12, '2017-08-11', 9.0),
(12, '08:00:00', '10:00:00', 13, '2017-08-12', 9.2),
(13, '08:00:00', '10:00:00', 15, '2017-08-13', 9.0),
(14, '08:00:00', '10:00:00', 13, '2017-08-14', 9.1),
(15, '18:00:00', '16:00:00', 14, '2017-08-15', 9.9),
(16, '08:00:00', '10:00:00', 3, '2017-08-17', 9.5),
(17, '08:00:00', '10:00:00', 7, '2017-08-16', 6.5),
(18, '08:00:00', '10:00:00', 20, '2017-08-18', 5.4),
(19, '18:00:00', '17:00:00', 21, '2017-08-19', 3.4),
(20, '08:00:00', '10:00:00', 19, '2017-08-21', 3.2),
(21, '08:00:00', '18:00:00', 5, '2017-08-20', 2.9),
(22, '18:00:00', '10:00:00', 11, '2017-08-21', 9.4),
(23, '08:00:00', '14:00:00', 22, '2017-08-22', 9.3);

-- --------------------------------------------------------

--
-- Структура на таблица `performers`
--

CREATE TABLE `performers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `performers`
--

INSERT INTO `performers` (`id`, `name`, `type`) VALUES
(1, 'Video Music Brazil', 'house music'),
(2, 'Asia Awards', 'pop'),
(3, 'Australia Awards', 'rock'),
(4, 'Immies', 'house music'),
(5, 'Mandarin Music Awards', 'chinese pop'),
(6, 'Mandarin Music Honors', 'chinese rock'),
(7, 'Pakistan Music Video Awards', 'asia house'),
(8, 'Penghargaan MTV Indonesia', 'pop'),
(9, 'Pilipinas Music Award', 'house music'),
(10, 'Romania Music Awards', 'techno'),
(11, 'Russia Music Awards', 'techno'),
(12, 'Student Voice Awards', 'house party'),
(13, 'TMF Awards', 'pop'),
(14, 'World Music Festival', 'many types'),
(15, 'Alfa Future People Festival', 'kpop'),
(16, 'Dacedence', 'house music'),
(17, 'DreamLand', 'house'),
(18, 'Electric Castle Festival', 'techno'),
(19, 'Electric Paradise', 'techno'),
(20, 'Forestland', 'trap'),
(21, 'EUphoria', 'chill traps'),
(22, 'Electric love', 'techno'),
(23, 'Life in color', 'house music'),
(24, 'Kosmos Festival', 'love trap');

-- --------------------------------------------------------

--
-- Структура на таблица `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `rating` double(150,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `places`
--

INSERT INTO `places` (`id`, `name`, `city`, `capacity`, `Country`, `rating`) VALUES
(1, 'St.George Hall', 'Bradford', 2006, 'UK', 5.0),
(2, 'Ulster Hall', 'London', 12000, 'UK', 7.0),
(3, 'Waterfront Hall', 'Aberdeen', 5666, 'UK', 5.0),
(4, 'Barber Institute', 'Aberdeen', 4582, 'UK', 6.0),
(5, 'Birmingham Town Hall', 'Birmingham', 9874, 'UK', 8.0),
(6, 'CBSO Centre', 'London', 32564, 'UK', 8.0),
(7, 'Colston Hall', 'Colston', 78541, 'UK', 7.5),
(8, 'Usher Hall', 'Manchester', 7894, 'UK', 7.8),
(9, 'The Sage Gateshead', 'Sheffield', 4561, 'UK', 4.0),
(10, 'Glasgow Royal Concert Hall', 'Glasgow', 25568, 'UK', 10.0),
(11, 'Leeds Town Hall', 'Leeds', 4785, 'UK', 4.0),
(12, 'Barbican Centre', 'Barbican', 4568, 'UK', 8.0),
(13, 'London Centre', 'London', 1235, 'UK', 7.8),
(14, 'BlackHeath', 'Aberdeen', 7854, 'UK', 7.2),
(15, 'Cadogan Hall', 'Cadogan', 69854, 'UK', 8.0),
(16, 'Conway Hall', 'Liverpool', 1568, 'UK', 6.0),
(17, 'Fairfield Hall', 'Southampton', 4875, 'UK', 5.5),
(18, 'Kings place', 'London', 4987, 'UK', 7.9),
(19, 'London Coliseum', 'London', 6548, 'UK', 7.5),
(20, 'Royal Academy of Music', 'Oxford', 1254, 'UK', 7.3),
(21, 'Royal College of Music', 'Cambridge', 5987, 'UK', 7.4),
(22, 'Royal Opera House', 'London', 9587, 'UK', 7.6),
(23, 'Victoria Hall', 'Basel', 6245, 'Switzerland', 6.0),
(24, 'Tonhale', 'Zurich', 84755, 'Switzerland', 6.0),
(25, 'Ankara Opera House', 'Ankara', 10254, 'Turkey', 9.0);

-- --------------------------------------------------------

--
-- Структура на таблица `ticket_categories`
--

CREATE TABLE `ticket_categories` (
  `id` int(11) NOT NULL,
  `price` double(200,1) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `Events_id` int(11) DEFAULT NULL,
  `discount` double(25,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `ticket_categories`
--

INSERT INTO `ticket_categories` (`id`, `price`, `capacity`, `zone`, `Events_id`, `discount`) VALUES
(1, 190.0, 2, 'A', 1, 20.0),
(2, 290.0, 2, 'B', 2, 20.0),
(3, 390.0, 2, 'C', 3, 20.0),
(4, 80.0, 3, 'D', 4, 20.0),
(5, 70.0, 3, 'A', 5, 20.0),
(6, 40.0, 4, 'B', 6, 20.0),
(7, 20.0, 5, 'C', 7, 20.0),
(8, 170.0, 6, 'D', 8, 20.0),
(9, 920.0, 7, 'A', 9, 20.0),
(10, 94.0, 4, 'B', 10, 20.0),
(11, 92.0, 3, 'C', 11, 20.0),
(12, 560.0, 2, 'E', 12, 20.0),
(13, 50.0, 1, 'D', 13, 20.0),
(14, 40.0, 9, 'B', 14, 20.0),
(15, 20.0, 10, 'A', 15, 20.0),
(16, 990.0, 4, 'C', 16, 20.0),
(17, 56.0, 6, 'D', 17, 20.0),
(18, 67.0, 7, 'B', 18, 20.0),
(19, 450.0, 3, 'A', 19, 20.0),
(20, 670.0, 2, 'C', 20, 20.0);

-- --------------------------------------------------------

--
-- Структура на таблица `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `price` double(200,1) DEFAULT NULL,
  `Attendance_id` int(11) DEFAULT NULL,
  `Ticket_categories_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `tickets`
--

INSERT INTO `tickets` (`id`, `price`, `Attendance_id`, `Ticket_categories_id`) VALUES
(1, 190.0, 1, 19),
(2, 290.0, 2, 18),
(3, 390.0, 3, 17),
(4, 80.0, 4, 16),
(5, 70.0, 5, 15),
(6, 40.0, 6, 14),
(7, 20.0, 7, 13),
(8, 170.0, 8, 12),
(9, 920.0, 9, 11),
(10, 94.0, 10, 10),
(11, 92.0, 11, 9),
(12, 560.0, 12, 8),
(13, 50.0, 13, 7),
(14, 40.0, 14, 6),
(15, 20.0, 15, 5),
(16, 990.0, 16, 4),
(17, 56.0, 17, 3),
(18, 67.0, 18, 2),
(19, 450.0, 19, 1),
(20, 670.0, 20, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_performers`
--
ALTER TABLE `event_performers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `performers`
--
ALTER TABLE `performers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_categories`
--
ALTER TABLE `ticket_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `event_performers`
--
ALTER TABLE `event_performers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `performers`
--
ALTER TABLE `performers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `ticket_categories`
--
ALTER TABLE `ticket_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;--
-- Database: `students`
--
CREATE DATABASE IF NOT EXISTS `students` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `students`;

-- --------------------------------------------------------

--
-- Структура на таблица `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `egn` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `students`
--

INSERT INTO `students` (`id`, `name`, `egn`, `address`, `phone`, `class`) VALUES
(1, 'Iliyan Ivanov', '9401150045', 'Sofia-Mladost 1', '0893452120', '10'),
(2, 'Ivan Iliev Georgiev', '9510104512', 'Sofia-Liylin', '0894123456', '11'),
(3, 'Elena Petrova Petrova', '9505052154', 'Sofia-Mladost 3', '0897852412', '11'),
(4, 'Ivan Iliev Iliev', '9510104542', 'Sofia-Mladost 3', '0894123457', '11'),
(5, 'Maria Hristova Dimova', '9510104547', 'Sofia-Mladost 4', '0894123442', '11'),
(6, 'Antoaneta Ivanova Georgieva', '9411104547', 'Sofia-Krasno selo', '0874526235', '10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `egn` (`egn`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;--
-- Database: `teamscorch`
--
CREATE DATABASE IF NOT EXISTS `teamscorch` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `teamscorch`;

-- --------------------------------------------------------

--
-- Структура на таблица `posts`
--

CREATE TABLE `posts` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Content` text CHARACTER SET utf8 NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура на таблица `threads`
--

CREATE TABLE `threads` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `PostID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура на таблица `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `users`
--

INSERT INTO `users` (`ID`, `Name`, `Email`, `Password`) VALUES
(1, 'Demo Demov', 'demo@demo123.com', 'demo123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
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
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
