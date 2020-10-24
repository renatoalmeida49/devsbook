-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 24, 2020 at 08:41 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `devsbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `postcomments`
--

DROP TABLE IF EXISTS `postcomments`;
CREATE TABLE IF NOT EXISTS `postcomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `postcomments`
--

INSERT INTO `postcomments` (`id`, `id_post`, `id_user`, `created_at`, `body`) VALUES
(3, 6, 1, '2020-08-11 10:39:40', 'Olá, mozona!'),
(4, 5, 1, '2020-08-11 14:05:58', 'Teste de comentÃ¡rio'),
(5, 5, 1, '2020-08-11 14:08:10', 'ComentÃ¡rio para retorno de json'),
(6, 6, 1, '2020-08-11 18:12:48', 'Amo vocÃª'),
(10, 5, 1, '2020-08-11 18:16:25', 'CorreÃ§Ã£o no script'),
(11, 5, 1, '2020-10-23 21:56:20', 'Teste');

-- --------------------------------------------------------

--
-- Table structure for table `postlikes`
--

DROP TABLE IF EXISTS `postlikes`;
CREATE TABLE IF NOT EXISTS `postlikes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `postlikes`
--

INSERT INTO `postlikes` (`id`, `id_post`, `id_user`, `created_at`) VALUES
(2, 8, 1, '2020-08-11 13:28:09'),
(3, 6, 1, '2020-08-11 13:28:39'),
(4, 7, 1, '2020-10-23 21:56:14');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `id_user`, `type`, `created_at`, `body`) VALUES
(1, 1, 'text', '2020-08-04 18:51:44', 'Hey, mate'),
(2, 1, 'photo', '2020-08-04 18:52:32', '1.jpg'),
(3, 1, 'text', '2020-08-05 12:04:16', 'Fazendo um terceiro post na rede social porque sim.'),
(4, 1, 'text', '2020-08-05 12:25:29', 'Mais uma postagem.\r\nTestando essa rede social que estou desenvolvendo.'),
(5, 1, 'text', '2020-08-05 14:02:44', 'Outra postagem com mÃºltiplas\r\n\r\n\r\nlinhas para\r\n\r\n\r\npoderÂ \r\n\r\n\r\n\r\n\r\ntestar'),
(6, 3, 'text', '2020-08-06 18:44:57', 'Oi, mozau!'),
(7, 1, 'text', '2020-08-10 14:45:58', 'Finalmente tenho uma foto de perfil com uma capa maneira. Realmente me descreve. #ForzaFerrari'),
(8, 3, 'text', '2020-08-11 12:27:29', 'Minha nova foto de perfil juntamente com minha nova capa.');

-- --------------------------------------------------------

--
-- Table structure for table `userrelations`
--

DROP TABLE IF EXISTS `userrelations`;
CREATE TABLE IF NOT EXISTS `userrelations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userrelations`
--

INSERT INTO `userrelations` (`id`, `user_from`, `user_to`) VALUES
(6, 3, 1),
(7, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `name` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `work` varchar(100) DEFAULT NULL,
  `avatar` varchar(100) NOT NULL DEFAULT 'default.jpg',
  `cover` varchar(100) NOT NULL DEFAULT 'cover.jpg',
  `token` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `birthdate`, `city`, `work`, `avatar`, `cover`, `token`) VALUES
(1, 'renato@email.com', '$2y$10$qaU0RETBp8XxLq8EM5T/butaiEQQCiFiyaZiMI74AxWKM6Ck278UK', 'Renato Novaes', '1996-10-25', '', 'Funasa', 'dfe1d31c0e075359dcc7c65c97ba998b.jpg', '1d84df0084aeea95d7e49b045d31aab4.jpg', 'fd3a70703cef26ddbe1e06476a34f05d'),
(2, 'anderson@email.com', '$2y$10$0Z.Z11tJ3wKR41r3rm2Kp.InU01uCDS6nOVgJTd2PQ.uI45c1ESDe', 'Anderson Azevedo', '1914-01-01', NULL, NULL, 'default.jpg', 'cover.jpg', 'd532e16d0105ebeb8b895db214c92ea7'),
(3, 'taciana@email.com', '$2y$10$8IwCBgRVlFbB1YoXuvf1cextDad2Usnklc1WtGDauSkzgSqt5CHGW', 'Taciana Novaes', '1996-02-26', '', '', 'e6db6a11470cf4ad966ef6912f8b6c23.jpg', 'f051915ef3f268570d047c9a4f11df54.jpg', 'fcb96b5931dfa33da85793b0320c6cf3'),
(4, 'beatriz@email.com', '$2y$10$lJdijHtDH0GFX.lWRchkmupSYfROuS74nVtcu7iWGmHcK6LH3Zwma', 'Beatriz Novaes', '2002-07-17', NULL, NULL, 'default.jpg', 'cover.jpg', 'c5c8ffce7ffb1685a4bd8108780e13fa');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
