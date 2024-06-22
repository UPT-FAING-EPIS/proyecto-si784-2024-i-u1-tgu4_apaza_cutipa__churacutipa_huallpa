-- --------------------------------------------------------
-- Host:                         161.132.38.229
-- Versión del servidor:         10.5.23-MariaDB-0+deb11u1 - Debian 11
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para DBSOSA
CREATE DATABASE IF NOT EXISTS `DBSOSA` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `DBSOSA`;

-- Volcando estructura para tabla DBSOSA.tbadmin
CREATE TABLE IF NOT EXISTS `tbadmin` (
  `idadmin` int(11) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla DBSOSA.tbadmin: ~0 rows (aproximadamente)
INSERT INTO `tbadmin` (`idadmin`, `usuario`, `password`) VALUES
	(1, 'jesus', '123');

-- Volcando estructura para tabla DBSOSA.tbcargo
CREATE TABLE IF NOT EXISTS `tbcargo` (
  `idcargo` int(11) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla DBSOSA.tbcargo: ~0 rows (aproximadamente)

-- Volcando estructura para tabla DBSOSA.tbcliente
CREATE TABLE IF NOT EXISTS `tbcliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `iddocumento` int(11) DEFAULT NULL,
  `documento` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `valido` varchar(50) DEFAULT NULL,
  `horaregistro` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`idcliente`),
  KEY `FK_tbcliente_tbdocumento` (`iddocumento`),
  CONSTRAINT `FK_tbcliente_tbdocumento` FOREIGN KEY (`iddocumento`) REFERENCES `tbdocumento` (`iddocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla DBSOSA.tbcliente: ~223 rows (aproximadamente)
INSERT INTO `tbcliente` (`idcliente`, `nombre`, `apellido`, `correo`, `iddocumento`, `documento`, `telefono`, `valido`, `horaregistro`) VALUES
	(1, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-01 19:31:29'),
	(2, 'kenyi', 'apaza', 'aa@aq', 1, '71480052', '1234567897', 'si', '2024-06-01 20:03:26'),
	(3, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-01 20:04:40'),
	(4, 'este', 'este', 'este@sa', 1, '71480052', '999999999', 'si', '2024-06-01 20:09:35'),
	(5, 'este', 'este', 'este@sa', 1, '71480052', '999999999', 'si', '2024-06-01 20:27:54'),
	(6, 'este', 'este', 'este@sa', 1, '71480052', '999999999', 'si', '2024-06-01 20:34:45'),
	(7, 'zzzzz', 'zzzzz', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-01 20:39:27'),
	(8, 'puer', 'puer', 'puer@puer', 2, '10714800529', '12121212', 'si', '2024-06-01 20:41:32'),
	(9, 'puer', 'puer', 'puer@puer', 2, '10714800529', '12121212', 'si', '2024-06-01 20:44:48'),
	(10, 'REAL', 'REAL', 'REAL@AS', 2, '10714800529', '999999999', 'si', '2024-06-01 21:11:21'),
	(11, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-01 21:12:27'),
	(12, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-01 21:13:49'),
	(13, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-01 21:15:20'),
	(14, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-01 21:15:55'),
	(15, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-01 21:18:27'),
	(16, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-01 21:19:42'),
	(17, 'REAL', 'REAL', 'REAL@AS', 1, '71480052', '999999999', 'si', '2024-06-01 21:19:59'),
	(18, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-01 21:21:11'),
	(19, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-01 21:27:02'),
	(20, 'REAL', 'REAL', 'REAL@AS', 1, '71480052', '999999999', 'si', '2024-06-01 21:30:58'),
	(21, 'REAL', 'REAL', 'REAL@AS', 1, '71480052', '999999999', 'si', '2024-06-01 21:35:03'),
	(22, 'zzzzz', 'zzzzz', 'zzz@zzzz', 1, '71480052', '999999999', 'si', '2024-06-01 21:47:40'),
	(23, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-01 21:50:40'),
	(24, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-01 21:50:40'),
	(25, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-01 21:58:34'),
	(26, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-01 22:07:18'),
	(27, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-01 22:11:34'),
	(28, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-01 23:10:35'),
	(29, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 00:25:04'),
	(30, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 00:28:45'),
	(31, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 00:33:22'),
	(32, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 00:43:18'),
	(33, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 00:43:56'),
	(34, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 00:44:19'),
	(35, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 00:44:39'),
	(36, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 00:45:35'),
	(37, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 00:46:27'),
	(38, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '12312321', '999999999', 'no', '2024-06-02 00:46:55'),
	(39, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 00:47:04'),
	(40, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 00:57:49'),
	(41, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 00:59:43'),
	(42, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 01:05:33'),
	(43, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 01:06:41'),
	(44, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 01:09:56'),
	(45, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 01:12:44'),
	(46, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 01:15:03'),
	(47, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 01:15:42'),
	(48, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 12:26:29'),
	(49, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 12:28:12'),
	(50, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 12:28:44'),
	(51, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 12:29:34'),
	(52, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 12:30:56'),
	(53, 'zzzzz', 'zzzzz', 'albapaza@upt.pe', 1, '10714800', '999999999', 'si', '2024-06-02 12:33:48'),
	(54, 'zzzzz', 'zzzzz', 'albapaza@upt.pe', 2, '12312321313', '999999999', 'no', '2024-06-02 12:34:12'),
	(55, 'zzzzz', 'zzzzz', 'albapaza@upt.pe', 1, '10714800', '999999999', 'si', '2024-06-02 12:39:18'),
	(56, 'zzzzz', 'zzzzz', 'albapaza@upt.pe', 1, '10714800', 'SDFSDF', 'si', '2024-06-02 12:39:25'),
	(57, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 12:43:22'),
	(58, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 12:44:11'),
	(59, 'ricardo', 'cutipa', 'cutipa@ggs', 1, '71480052', '999999999', 'si', '2024-06-02 12:44:52'),
	(60, 'REAL', 'REAL', 'REAL@AS', 2, '10714800529', '999999999', 'si', '2024-06-02 12:46:56'),
	(61, 'xd', 'xd', 'xd@gq', 1, '71480052', '123123', 'si', '2024-06-02 12:47:44'),
	(62, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 12:51:29'),
	(63, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 12:52:02'),
	(64, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '71480052222', '999999999', 'no', '2024-06-02 12:53:40'),
	(65, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 12:53:51'),
	(66, 'este', 'este', 'este@sa', 1, '71480052', '999999999', 'si', '2024-06-02 12:55:07'),
	(67, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 12:55:37'),
	(68, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 12:58:14'),
	(69, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 12:58:50'),
	(70, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 12:59:14'),
	(71, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 13:01:48'),
	(72, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 2, '10714800529', '999999999', 'si', '2024-06-02 13:02:02'),
	(73, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 13:02:31'),
	(74, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 13:03:02'),
	(75, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 13:04:58'),
	(76, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 13:05:25'),
	(77, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 13:09:09'),
	(78, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 13:37:54'),
	(79, 'REAL', 'REAL', 'REAL@AS', 1, '71480052', '999999999', 'si', '2024-06-02 14:09:42'),
	(80, 'para gmail', 'albertito', 'aa2021071075@virtual.upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 14:18:01'),
	(81, 'para gmail', 'albertito', 'aa2021071075@virtual.upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 14:18:25'),
	(82, 'para gmail', 'albertito', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 14:25:51'),
	(83, 'para gmail', 'albertito', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 14:29:13'),
	(84, 'para gmail 2', 'albertito 2', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 14:30:07'),
	(85, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 14:31:00'),
	(86, 'ALBERT', 'CCALLE', 'aa201071075@virtual.upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 14:33:55'),
	(87, 'ALBERT', 'CCALLE', 'apazaalbertsa5s@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 14:34:28'),
	(88, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 14:45:58'),
	(89, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 15:07:20'),
	(90, 'ALBERT', 'CCALLE', 'apazaalbertsa5s@gmail.com', 2, '10714800529', '999999999', 'si', '2024-06-02 15:41:51'),
	(91, 'ALBERT', 'CCALLE', 'apazaalbertsa5s@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 15:42:53'),
	(92, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '12312321', '999999999', 'no', '2024-06-02 15:44:01'),
	(93, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '12312321', '999999999', 'no', '2024-06-02 15:49:59'),
	(94, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '999999999', 'si', '2024-06-02 15:50:14'),
	(95, 'para gmail', 'albertito', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 15:56:49'),
	(96, 'para gmail', 'albertito', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 15:57:17'),
	(97, 'ALBERT', 'CCALLE', 'apazaalbertsa5s@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 15:59:35'),
	(98, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 16:17:55'),
	(99, 'ALBERT', 'CCALLE', 'apazaalbertsa5s@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 16:22:08'),
	(100, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 16:33:28'),
	(101, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 16:39:18'),
	(102, 'ALBERT', 'CCALLE', 'QWEQWEQ@QWEQE', 1, '71480052', '999999999', 'si', '2024-06-02 16:41:24'),
	(103, 'ALBERT', 'CCALLE', 'apzadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 16:53:29'),
	(104, 'albert', '123123', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 16:57:34'),
	(105, 'albert', '123123', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 16:58:11'),
	(106, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 17:13:42'),
	(107, 'ALBERT', 'APAZA', 'apazadsa@gmail.com', 1, '82822828', '960298992', 'no', '2024-06-02 17:17:10'),
	(108, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '12312321', '999999999', 'no', '2024-06-02 17:20:24'),
	(109, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '12312321', '999999999', 'no', '2024-06-02 17:20:50'),
	(110, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '12312321', '999999999', 'no', '2024-06-02 17:21:05'),
	(111, 'REAL', 'REAL', 'REAL@AS', 2, '12312312313', '999999999', 'no', '2024-06-02 17:21:30'),
	(112, 'masiel', 'vildoso', 'masil@gmail.com', 1, '12312312', '123123123123123123123123', 'no', '2024-06-02 17:23:29'),
	(113, 'masiel', 'vildoso', 'masil@gmail.com', 1, '12312312', '123123123123123123123123', 'no', '2024-06-02 17:24:09'),
	(114, 'masiel', 'vildoso', 'masil@gmail.com', 1, '12312312', '123123123123123123123123', 'no', '2024-06-02 17:24:31'),
	(115, 'masiel', 'vildoso', 'masil@gmail.com', 1, '12312312', '123123123123123123123123', 'no', '2024-06-02 17:24:46'),
	(116, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '12312312', '999999999', 'no', '2024-06-02 17:26:13'),
	(117, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '12312312', '999999999', 'no', '2024-06-02 17:29:46'),
	(118, '123', '123', '123@gmail.com', 1, '12321312', '123123', 'no', '2024-06-02 17:30:21'),
	(119, 'ALBERT', 'CCALLE', 'albapaza@upt.pe', 1, '71480052', '123123123', 'si', '2024-06-02 17:34:09'),
	(120, 'masiel', 'vildoso', 'masei@gmail.com', 1, '12312312', '999999999', 'no', '2024-06-02 17:37:30'),
	(121, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '12312312', '999999999', 'no', '2024-06-02 17:41:54'),
	(122, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 17:42:07'),
	(123, 'Albertito', 'Xjejwk', 'apazadsa@gmail.com', 1, '71480052', '960298992', 'si', '2024-06-02 17:49:21'),
	(124, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '12312312', '999999999', 'no', '2024-06-02 17:51:07'),
	(125, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 17:51:20'),
	(126, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 17:52:37'),
	(127, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 17:52:50'),
	(128, 'ALBERT', 'APAZA', 'apazadsa@gmail.com', 1, '0', '960298992', 'no', '2024-06-02 18:03:42'),
	(129, 'ALBERT', 'APAZA', 'apazadsa@gmail.com', 1, '0', '960298992', 'no', '2024-06-02 18:03:43'),
	(130, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '12312312', '999999999', 'no', '2024-06-02 18:07:00'),
	(131, 'jesus antonio', 'huallpa maron', 'tz@upt.pe', 1, '71205395', '952603934', 'si', '2024-06-02 18:07:05'),
	(132, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 18:07:24'),
	(133, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '12312331', '999999999', 'no', '2024-06-02 18:09:55'),
	(134, 'l', 'l', 'dsfsdfsdf1@gmail.com', 1, '10714800', '999999999', 'si', '2024-06-02 18:10:44'),
	(135, 'l', 'l', 'dsfsdfsdf1@gmail.com', 1, '11111111', '999999999', 'no', '2024-06-02 18:11:43'),
	(136, 'l', 'l', 'dsfsdfsdf1@gmail.com', 1, '14785296', '999999999', 'no', '2024-06-02 18:12:26'),
	(137, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '12312331', '999999999', 'no', '2024-06-02 18:12:52'),
	(138, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '11111111', '999999999', 'si', '2024-06-02 18:12:54'),
	(139, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '22222222', '999999999', 'si', '2024-06-02 18:12:59'),
	(140, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '21221222', '999999999', 'no', '2024-06-02 18:13:07'),
	(141, 'hgh', 'hgh', 'hgh@gmail.com', 1, '0', '999999999', 'si', '2024-06-02 18:13:07'),
	(142, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '33333333', '999999999', 'si', '2024-06-02 18:13:16'),
	(143, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '44444444', '999999999', 'si', '2024-06-02 18:13:20'),
	(144, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '55555555', '999999999', 'si', '2024-06-02 18:13:25'),
	(145, 'hgh', 'hgh', 'hgh@gmail.com', 1, '22222222', '999999999', 'si', '2024-06-02 18:13:38'),
	(146, 'hgh', 'hgh', 'hgh@gmail.com', 1, '77777777', '999999999', 'si', '2024-06-02 18:13:51'),
	(147, 'hgh', 'hgh', 'hgh@gmail.com', 1, '12222222', '999999999', 'no', '2024-06-02 18:14:07'),
	(148, 'hgh', 'asas', 'dsfsdfsdf1@gmail.com', 1, '99999999', '999999999', 'si', '2024-06-02 18:14:37'),
	(149, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '55555555', '999999999', 'si', '2024-06-02 18:15:18'),
	(150, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '55555555', '999999999', 'si', '2024-06-02 18:15:32'),
	(151, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '12222222', '999999999', 'no', '2024-06-02 18:16:21'),
	(152, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '11111111', '999999999', 'si', '2024-06-02 18:19:07'),
	(153, 'Massiel', 'Vildoso', 'vildosomassiel@gmail.com', 1, '70599988', '995988871', 'si', '2024-06-02 18:22:04'),
	(154, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '11111111', '999999999', 'no', '2024-06-02 18:22:09'),
	(155, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '22222222', '999999999', 'no', '2024-06-02 18:22:22'),
	(156, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '22222222', '999999999', 'no', '2024-06-02 18:28:29'),
	(157, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '44444444', '999999999', 'no', '2024-06-02 18:28:32'),
	(158, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-02 18:28:38'),
	(159, 'ALBERT', 'CCALLE', 'apazadsa@gmail.com', 1, '11111111', '999999999', 'no', '2024-06-02 18:35:47'),
	(160, 'fiorella', 'apaza', 'fiorellaestrella2017@gmail.com', 1, '60586312', '974485380', 'no', '2024-06-02 20:24:04'),
	(161, 'fiorella', 'apaza', 'fiorellaestrella2017@gmail.com', 1, '60586312', '974485380', 'no', '2024-06-02 20:24:07'),
	(162, 'xdxdxdxd', 'xdxdxdd', 'apazadsa@gmail.com', 1, '12312323', '994985214', 'no', '2024-06-03 02:05:24'),
	(163, 'xdxdxdxd', 'xdxdxdd', 'apazadsa@gmail.com', 1, '11111111', '994985214', 'no', '2024-06-03 02:05:36'),
	(164, 'xdxdxdxd', 'xdxdxdd', 'apazadsa@gmail.com', 2, '11111111111', '994985214', 'no', '2024-06-03 02:05:41'),
	(165, 'xdxdxdxd', 'xdxdxdd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'si', '2024-06-03 02:05:52'),
	(166, 'xdxdxdxd', 'xdxdxdd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'si', '2024-06-03 08:56:48'),
	(167, 'hgh', 'asas', 'dsfsdfsdf1@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-03 13:44:15'),
	(168, 'Ricardo', 'Cutipa', 'apazadsa@gmail.com', 1, '11111111', '961256178', 'no', '2024-06-03 16:14:33'),
	(169, 'Ricardo', 'Cutipa', 'apzadsa@gmail.com', 1, '71480052', '961256178', 'si', '2024-06-03 16:15:30'),
	(170, 'albert', 'apaza', 'apazadsa@gmail.com', 1, '71480052', '123123213', 'si', '2024-06-03 16:17:49'),
	(171, 'albert', 'apaza', 'apazadsa@gmail.com', 1, '71480052', '123123213', 'si', '2024-06-03 16:17:49'),
	(172, 'wqewqe', 'wqeqwe', 'apazadsa@gmail.com', 1, '71480052', '123123123', 'si', '2024-06-03 16:55:40'),
	(173, 'MARIEL', 'aguilar concori', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'si', '2024-06-04 21:41:55'),
	(174, 'xd', 'xd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'si', '2024-06-06 15:52:56'),
	(175, 'xd', 'xd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'si', '2024-06-06 15:54:47'),
	(176, 'xd', 'xd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'si', '2024-06-06 15:55:38'),
	(177, 'hgh', 'asas', 'dsfsdfsdf1@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-08 14:36:47'),
	(178, 'Ricardo', 'Cutipa', 'cutipadaniel11@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-08 14:43:06'),
	(179, 'xd', 'xd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'no', '2024-06-09 13:25:42'),
	(180, 'xd', 'xd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'no', '2024-06-09 13:25:51'),
	(181, 'xd', 'xd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'no', '2024-06-09 13:26:06'),
	(182, 'xd', 'xd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'no', '2024-06-09 13:26:07'),
	(183, 'xd', 'xd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'no', '2024-06-09 13:26:08'),
	(184, 'xd', 'xd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'no', '2024-06-09 13:26:08'),
	(185, 'xd', 'xd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'no', '2024-06-09 13:26:08'),
	(186, 'xdxdxdxd', 'xdxdxdd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'no', '2024-06-09 13:26:31'),
	(187, 'xdxdxdxd', 'xdxdxdd', 'apazadsa@gmail.com', 2, '10714800529', '994985214', 'si', '2024-06-09 13:26:53'),
	(188, 'xdxdxdxd', 'xdxdxdd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'no', '2024-06-09 13:27:03'),
	(189, 'xdxdxdxd', 'xdxdxdd', 'apazadsa@gmail.com', 1, '29708812', '994985214', 'no', '2024-06-09 13:27:13'),
	(190, 'xdxdxdxd', 'xdxdxdd', 'apazadsa@gmail.com', 1, '11111111', '994985214', 'no', '2024-06-09 13:28:06'),
	(191, 'xdxdxdxd', 'xdxdxdd', 'apazadsa@gmail.com', 1, '12323312', '994985214', 'no', '2024-06-09 13:28:10'),
	(192, 'xdxdxdxd', 'xdxdxdd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'no', '2024-06-09 13:28:19'),
	(193, 'xd', 'xd', 'apazadsa@gmail.com', 1, '71480052', '994985214', 'no', '2024-06-09 13:29:33'),
	(194, 'xd', 'xd', 'apazadsa@gmail.com', 2, '20131312955', '994985214', 'si', '2024-06-09 13:33:18'),
	(195, 'qw', 'q', 'qw@gmail.com', 1, '71480052', '999999999', 'no', '2024-06-10 18:07:56'),
	(196, 'ALBERT', 'APAZA', 'apazadsa@gmail.com', 2, '10714800529', '960298992', 'si', '2024-06-11 15:55:05'),
	(197, 'ALBERT', 'APAZA', 'apazadsa@gmail.com', 2, '10714800529', '960298992', 'si', '2024-06-11 15:55:12'),
	(198, 'ALBERT', 'APAZA', 'apazadsa@gmail.com', 2, '10714800529', '960298992', 'si', '2024-06-11 15:55:47'),
	(199, 'ALBERT', 'APAZA', 'apazadsa@gmail.com', 1, '71480052', '960298992', 'no', '2024-06-11 16:14:14'),
	(200, 'ALBERT', 'APAZA', 'apazadsa@gmail.com', 2, '10714800529', '960298992', 'si', '2024-06-11 16:14:23'),
	(201, '123', '123', 'qwe@gmail.com', 2, '11231231312', '123123123', 'no', '2024-06-11 16:25:01'),
	(202, '123', '123', 'qwe@gmail.com', 2, '10714800529', '123123123', 'si', '2024-06-11 16:25:20'),
	(203, 'apa', 'aaa', 'as@gmail.com', 2, '10714800529', '213123123', 'si', '2024-06-11 16:29:35'),
	(204, '123', '12', '123@gmail.com', 1, '12313213', '123123123', 'no', '2024-06-11 16:32:33'),
	(205, '123', '12', '123@gmail.com', 2, '10714800529', '123123123', 'si', '2024-06-11 16:32:42'),
	(206, '12312', '123213', '123qq@gmail.com', 2, '10714800529', '123123', 'si', '2024-06-11 16:35:02'),
	(207, '123', '123', '1@gmail.com', 2, '10714800529', '12312', 'si', '2024-06-11 16:35:38'),
	(208, 'zzzz', 'zzzzz', 'zz@gmail.com', 2, '10714800529', '912837192', 'si', '2024-06-11 16:37:53'),
	(209, 'zzzz', 'zzzzz', 'zz@gmail.com', 2, '10714800529', '912837192', 'si', '2024-06-11 16:38:15'),
	(210, '123123', 'qweqwe', 'qwe@gmail.com', 2, '10714800529', '123131231', 'si', '2024-06-11 16:38:38'),
	(211, 'carlos', 'ro', 'apazadsa@gmail.com', 2, '10714800529', '999999999', 'si', '2024-06-11 16:45:39'),
	(212, 'carlos', 'ro', 'apazadsa@gmail.com', 2, '23112321312', '999999999', 'no', '2024-06-11 16:45:47'),
	(213, 'carlos', 'ro', 'apazadsa@gmail.com', 2, '10712312489', '999999999', 'si', '2024-06-11 16:46:03'),
	(214, '132', '123', '123@gmail.com', 2, '10714800529', '123123123', 'si', '2024-06-11 16:46:42'),
	(215, '123123', '123123', '123@gmail.com', 2, '10714800529', '879879879', 'si', '2024-06-11 16:47:50'),
	(216, '123', '123', 'apazadsa@gmail.com', 2, '10714800529', '999999999', 'si', '2024-06-11 16:48:42'),
	(217, 'erick', 'chura', 'apazadsa@gmail.com', 2, '10714800529', '999999999', 'si', '2024-06-11 16:51:23'),
	(218, 'ALBERT', 'APAZA', 'apazadsa@gmail.com', 2, '10714800529', '999999999', 'si', '2024-06-11 17:22:54'),
	(219, 'ricardo', 'cut', 'apazadsa@gmail.com', 1, '43242343', '123123123', 'no', '2024-06-11 17:31:34'),
	(220, 'ricardo', 'cut', 'apazadsa@gmail.com', 1, '43242343', '123123123', 'no', '2024-06-11 17:31:34'),
	(221, 'ricardo', 'cut', 'apazadsa@gmail.com', 2, '10714800529', '123123123', 'si', '2024-06-11 17:31:50'),
	(222, 'jesus antonio', 'huallpa maron', 'jesusantoniohuallpa@gmail.com', 1, '71205395', '952603934', 'si', '2024-06-12 00:09:52'),
	(223, 'albert', 'apaza2', 'apazadsa@gmail.com', 1, '71480052', '999999999', 'si', '2024-06-12 15:57:36');

-- Volcando estructura para tabla DBSOSA.tbcontrato
CREATE TABLE IF NOT EXISTS `tbcontrato` (
  `idcontrato` int(11) NOT NULL AUTO_INCREMENT,
  `idreserva` int(11) DEFAULT NULL,
  `idcotizacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcontrato`),
  KEY `FK_tbcontrato_tbreserva` (`idreserva`),
  KEY `idcotizacion` (`idcotizacion`),
  CONSTRAINT `FK_tbcontrato_tbcotizacion` FOREIGN KEY (`idcotizacion`) REFERENCES `tbcotizacion` (`idcotizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbcontrato_tbreserva` FOREIGN KEY (`idreserva`) REFERENCES `tbreserva` (`idreserva`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla DBSOSA.tbcontrato: ~1 rows (aproximadamente)
INSERT INTO `tbcontrato` (`idcontrato`, `idreserva`, `idcotizacion`) VALUES
	(1, 7, 1);

-- Volcando estructura para tabla DBSOSA.tbcotizacion
CREATE TABLE IF NOT EXISTS `tbcotizacion` (
  `idcotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) DEFAULT NULL,
  `idmaquinaria` int(11) DEFAULT NULL,
  `idlugar` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcotizacion`),
  KEY `FK_tbcotizacion_tbcliente` (`idcliente`),
  KEY `FK_tbcotizacion_tbmaquinaria` (`idmaquinaria`),
  KEY `FK_tbcotizacion_tblugar` (`idlugar`),
  CONSTRAINT `FK_tbcotizacion_tbcliente` FOREIGN KEY (`idcliente`) REFERENCES `tbcliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbcotizacion_tblugar` FOREIGN KEY (`idlugar`) REFERENCES `tblugar` (`idlugar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbcotizacion_tbmaquinaria` FOREIGN KEY (`idmaquinaria`) REFERENCES `tbmaquinaria` (`idmaquinaria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla DBSOSA.tbcotizacion: ~157 rows (aproximadamente)
INSERT INTO `tbcotizacion` (`idcotizacion`, `idcliente`, `idmaquinaria`, `idlugar`, `total`, `tiempo`) VALUES
	(1, 1, 568, 2, 2002, 1001),
	(2, 2, 567, 2, 1001, 1001),
	(3, 3, 567, 1, 0, 0),
	(4, 4, 567, 1, 0, 0),
	(5, 5, 567, 1, 100, 100),
	(6, 6, 569, 4, 33333333, 11111111),
	(7, 7, 567, 3, 123123, 123123),
	(8, 8, 570, 3, 492492, 123123),
	(9, 9, 567, 1, 123123, 123123),
	(10, 10, 567, 1, 123123, 123123),
	(11, 11, NULL, NULL, NULL, NULL),
	(12, 12, 567, 1, 0, 0),
	(13, 13, 567, 1, 0, 0),
	(14, 14, 570, 3, 492492, 123123),
	(15, 15, 567, 1, 0, 0),
	(16, 16, 569, 2, 369369, 123123),
	(17, 17, 569, 3, 639369, 213123),
	(18, 18, 567, 1, 739278, 123213),
	(19, 19, 570, 1, 4004, 1001),
	(20, 20, 570, 4, 492492, 123123),
	(21, 21, 570, 2, 4004, 1001),
	(22, 22, 570, 3, 492492, 123123),
	(23, 24, 567, 1, 861861, 123123),
	(24, 24, NULL, NULL, NULL, NULL),
	(25, 25, 569, 1, 369369, 123123),
	(26, 26, 571, 2, 0, 0),
	(27, 27, 567, 1, 861861, 123123),
	(28, 28, 567, 1, 700, 100),
	(30, 30, 567, 1, 861861, 123123),
	(31, 31, 567, 1, 700, 100),
	(32, 32, 567, 1, 0, 0),
	(33, 33, 567, 1, 0, 0),
	(34, 34, 567, 1, 0, 0),
	(35, 35, 567, 1, 0, 0),
	(36, 36, 567, 1, 0, 0),
	(37, 37, 567, 1, 0, 0),
	(38, 39, 567, 1, 0, 0),
	(39, 40, 567, 1, 700, 100),
	(40, 41, 567, 1, 861861, 123123),
	(41, 42, 569, 2, 369369, 123123),
	(42, 43, 570, 1, 4004, 1001),
	(43, 44, 567, 1, 0, 0),
	(44, 45, 567, 1, 1491861, 213123),
	(45, 46, 567, 1, 700, 100),
	(46, 47, 567, 1, 700, 100),
	(47, 48, 571, 3, 615615, 123123),
	(49, 50, 570, 3, 492492, 123123),
	(50, 51, 569, 3, 300, 100),
	(51, 52, 567, 1, 0, 0),
	(52, 53, NULL, NULL, NULL, NULL),
	(53, 55, 567, 1, 0, 0),
	(54, 56, 567, 1, 0, 0),
	(55, 57, 567, 1, 0, 0),
	(56, 58, 569, 2, 3003, 1001),
	(57, 59, 567, 1, 0, 0),
	(58, 60, 567, 1, 0, 0),
	(59, 61, 567, 1, 0, 0),
	(60, 62, 567, 1, 0, 0),
	(61, 63, 567, 1, 700, 100),
	(62, 65, 567, 1, 0, 0),
	(63, 66, 567, 1, 0, 0),
	(64, 67, 567, 1, 7007, 1001),
	(65, 68, 567, 1, 85554, 12222),
	(66, 69, 567, 1, 0, 0),
	(67, 70, 567, 1, 0, 0),
	(68, 71, 567, 1, 0, 0),
	(69, 72, 567, 1, 0, 0),
	(70, 73, 567, 1, 700, 100),
	(71, 74, 569, 1, 300, 100),
	(72, 75, 567, 1, 0, 0),
	(73, 76, 567, 1, 0, 0),
	(74, 77, 567, 1, 0, 0),
	(75, 78, NULL, NULL, NULL, NULL),
	(76, 79, 567, 1, 0, 0),
	(77, 80, 568, 2, 24624626, 12312313),
	(78, 81, 567, 1, 1491, 213),
	(80, 83, 567, 1, 700, 100),
	(81, 84, 570, 1, 400, 100),
	(82, 85, 567, 1, 0, 0),
	(83, 86, 567, 1, 0, 0),
	(84, 87, 567, 1, 700, 100),
	(85, 88, 571, 1, 500, 100),
	(86, 89, 567, 1, 0, 0),
	(87, 90, NULL, NULL, NULL, NULL),
	(88, 91, 570, 1, 492492, 123123),
	(89, 94, 570, 1, 492492, 123123),
	(90, 95, NULL, NULL, NULL, NULL),
	(91, 96, 567, 1, 0, 0),
	(92, 97, 567, 1, 861861, 123123),
	(93, 98, 567, 1, 0, 0),
	(94, 99, 567, 1, 0, 0),
	(95, 100, 567, 1, 700, 100),
	(96, 101, 567, 1, 700, 100),
	(97, 102, 567, 1, 0, 0),
	(98, 103, 567, 1, 0, 0),
	(99, 104, 567, 1, 0, 0),
	(100, 105, 567, 1, 0, 0),
	(101, 106, NULL, NULL, NULL, NULL),
	(102, 119, 570, 3, 4004, 1001),
	(103, 122, 567, 1, 0, 0),
	(104, 123, 567, 1, 466662, 66666),
	(105, 125, NULL, NULL, NULL, NULL),
	(106, 126, NULL, NULL, NULL, NULL),
	(107, 127, 567, 1, 861, 123),
	(109, 132, 567, 1, 7, 1),
	(110, 134, NULL, NULL, NULL, NULL),
	(111, 135, NULL, NULL, NULL, NULL),
	(112, 138, NULL, NULL, NULL, NULL),
	(113, 139, NULL, NULL, NULL, NULL),
	(114, 141, NULL, NULL, NULL, NULL),
	(115, 142, NULL, NULL, NULL, NULL),
	(116, 143, NULL, NULL, NULL, NULL),
	(117, 144, NULL, NULL, NULL, NULL),
	(118, 145, NULL, NULL, NULL, NULL),
	(119, 146, NULL, NULL, NULL, NULL),
	(120, 148, NULL, NULL, NULL, NULL),
	(121, 149, NULL, NULL, NULL, NULL),
	(122, 150, NULL, NULL, NULL, NULL),
	(123, 152, NULL, NULL, NULL, NULL),
	(124, 153, 567, 1, 28, 4),
	(125, 158, NULL, NULL, NULL, NULL),
	(126, 165, 570, 1, 492, 123),
	(127, 166, 570, 1, 8, 2),
	(128, 167, 567, 1, 280, 40),
	(129, 169, NULL, NULL, NULL, NULL),
	(130, 170, NULL, NULL, NULL, NULL),
	(131, 171, NULL, NULL, NULL, NULL),
	(132, 172, NULL, NULL, NULL, NULL),
	(133, 173, NULL, NULL, NULL, NULL),
	(134, 174, NULL, NULL, NULL, NULL),
	(135, 175, NULL, NULL, NULL, NULL),
	(136, 176, 567, 1, 110.5, 1),
	(137, 177, NULL, NULL, NULL, NULL),
	(138, 178, 569, 1, 1409, 10),
	(139, 187, NULL, NULL, NULL, NULL),
	(140, 194, NULL, NULL, NULL, NULL),
	(141, 196, NULL, NULL, NULL, NULL),
	(142, 197, NULL, NULL, NULL, NULL),
	(143, 198, NULL, NULL, NULL, NULL),
	(144, 200, NULL, NULL, NULL, NULL),
	(145, 202, NULL, NULL, NULL, NULL),
	(146, 203, NULL, NULL, NULL, NULL),
	(147, 205, NULL, NULL, NULL, NULL),
	(148, 206, NULL, NULL, NULL, NULL),
	(149, 207, NULL, NULL, NULL, NULL),
	(150, 208, NULL, NULL, NULL, NULL),
	(151, 209, NULL, NULL, NULL, NULL),
	(152, 210, NULL, NULL, NULL, NULL),
	(153, 211, NULL, NULL, NULL, NULL),
	(154, 213, NULL, NULL, NULL, NULL),
	(155, 214, 567, 1, 13605105091.5, 123123123),
	(156, 215, 570, 1, 14799384.6, 123123),
	(158, 217, 570, 1, 1442.4, 12),
	(159, 218, 570, 1, 120.2, 1),
	(160, 221, 570, 4, 480.8, 4),
	(161, 222, NULL, NULL, NULL, NULL),
	(162, 223, NULL, NULL, NULL, NULL);

-- Volcando estructura para tabla DBSOSA.tbdetallemaquinaria
CREATE TABLE IF NOT EXISTS `tbdetallemaquinaria` (
  `iddetalle` int(11) NOT NULL,
  `idmaquinaria` int(11) DEFAULT NULL,
  `imagen1` varchar(80) DEFAULT NULL,
  `imagen2` varchar(80) DEFAULT NULL,
  `imagen3` varchar(80) DEFAULT NULL,
  `modelo3d` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`iddetalle`),
  KEY `FK_tbdetallemaquinaria_tbmaquinaria` (`idmaquinaria`),
  CONSTRAINT `FK_tbdetallemaquinaria_tbmaquinaria` FOREIGN KEY (`idmaquinaria`) REFERENCES `tbmaquinaria` (`idmaquinaria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla DBSOSA.tbdetallemaquinaria: ~6 rows (aproximadamente)
INSERT INTO `tbdetallemaquinaria` (`iddetalle`, `idmaquinaria`, `imagen1`, `imagen2`, `imagen3`, `modelo3d`, `descripcion`) VALUES
	(567, 567, NULL, NULL, NULL, NULL, 'La excavadora hidráulica Caterpillar 320D es una máquina versátil diseñada para una variedad de aplicaciones de excavación. Con un motor potente y un sistema hidráulico eficiente, esta excavadora ofrece un rendimiento excepcional en cualquier sitio de trabajo. Su diseño duradero y su cabina cómoda hacen que sea una opción popular entre los operadores de maquinaria pesada.'),
	(568, 568, NULL, NULL, NULL, NULL, 'El bulldozer Komatsu D65EX-17 es una máquina robusta diseñada para tareas de nivelación y movimiento de tierras en proyectos de construcción y minería. Con su potente motor y su cuchilla frontal resistente, este bulldozer ofrece un rendimiento excepcional en terrenos difíciles. Su cabina espaciosa y ergonómica proporciona comodidad y seguridad para el operador durante largas jornadas de trabajo.'),
	(569, 569, 'imagen1.jpg', 'imagen2.png', 'imagen3.png', NULL, 'La grúa móvil Liebherr LTM 1200-5.1 es una máquina potente y versátil diseñada para la elevación de cargas pesadas en proyectos de construcción y montaje industrial. Con su brazo telescópico y su sistema de contrapeso ajustable, esta grúa ofrece una gran capacidad de elevación y un alcance impresionante. Su cabina confortable y su avanzado sistema de control hacen que sea fácil de operar incluso en condiciones exigentes.'),
	(570, 570, NULL, NULL, NULL, NULL, 'La motoniveladora Volvo G930 es una máquina especializada en la nivelación de terrenos en proyectos de construcción de carreteras, pistas de aterrizaje y sitios industriales. Equipada con una cuchilla frontal ajustable y un potente motor, esta motoniveladora ofrece un rendimiento excepcional en la creación de superficies planas y uniformes. Su diseño ergonómico y su sistema de control preciso hacen que sea fácil de operar y mantener.'),
	(571, 571, NULL, NULL, NULL, NULL, 'El camión volquete Mercedes-Benz Actros 4141K es una herramienta indispensable en la industria de la construcción y la minería para el transporte de materiales a granel. Con una robusta estructura y un potente motor, este camión ofrece una gran capacidad de carga y un rendimiento confiable en terrenos difíciles. Su cabina espaciosa y su sistema de suspensión avanzado garantizan comodidad y seguridad para el conductor en largas jornadas de trabajo.'),
	(572, 572, NULL, NULL, NULL, NULL, 'La retroexcavadora JCB 3CX es una máquina versátil diseñada para una variedad de aplicaciones en construcción, excavación y trabajos de mantenimiento. Equipada con un brazo extensible y una cuchara frontal, esta retroexcavadora ofrece una excelente capacidad de excavación y carga. Su diseño compacto y su sistema de tracción en las cuatro ruedas la hacen ideal para trabajar en espacios reducidos y terrenos accidentados.');

-- Volcando estructura para tabla DBSOSA.tbdocumento
CREATE TABLE IF NOT EXISTS `tbdocumento` (
  `iddocumento` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`iddocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla DBSOSA.tbdocumento: ~2 rows (aproximadamente)
INSERT INTO `tbdocumento` (`iddocumento`, `documento`) VALUES
	(1, 'DNI'),
	(2, 'RUC');

-- Volcando estructura para tabla DBSOSA.tbempleado
CREATE TABLE IF NOT EXISTS `tbempleado` (
  `idempleado` int(11) NOT NULL AUTO_INCREMENT,
  `idcargo` int(11) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `apellido` int(11) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  PRIMARY KEY (`idempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla DBSOSA.tbempleado: ~1 rows (aproximadamente)
INSERT INTO `tbempleado` (`idempleado`, `idcargo`, `nombre`, `apellido`, `dni`) VALUES
	(1, 1, 1, 1, 1);

-- Volcando estructura para tabla DBSOSA.tblugar
CREATE TABLE IF NOT EXISTS `tblugar` (
  `idlugar` int(11) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idlugar`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla DBSOSA.tblugar: ~4 rows (aproximadamente)
INSERT INTO `tblugar` (`idlugar`, `ciudad`) VALUES
	(1, 'Tacna'),
	(2, 'Arequipa'),
	(3, 'Moquegua'),
	(4, 'Puno');

-- Volcando estructura para tabla DBSOSA.tbmantenimiento
CREATE TABLE IF NOT EXISTS `tbmantenimiento` (
  `idmantenimiento` int(11) NOT NULL AUTO_INCREMENT,
  `idmaquinaria` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `costopro` double DEFAULT NULL,
  `idempleado` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmantenimiento`),
  KEY `idmaquinaria` (`idmaquinaria`),
  KEY `idempleado` (`idempleado`),
  KEY `estado` (`estado`),
  KEY `tipo` (`tipo`),
  CONSTRAINT `FK_tbmantenimiento_tbempleado` FOREIGN KEY (`idempleado`) REFERENCES `tbempleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbmantenimiento_tbmaquinaria` FOREIGN KEY (`idmaquinaria`) REFERENCES `tbmaquinaria` (`idmaquinaria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla DBSOSA.tbmantenimiento: ~1 rows (aproximadamente)
INSERT INTO `tbmantenimiento` (`idmantenimiento`, `idmaquinaria`, `fecha`, `descripcion`, `costopro`, `idempleado`, `estado`, `tipo`) VALUES
	(10, 567, '2024-06-21', 'adfw', 1, 1, 1, 1);

-- Volcando estructura para tabla DBSOSA.tbmaquinaria
CREATE TABLE IF NOT EXISTS `tbmaquinaria` (
  `idmaquinaria` int(11) NOT NULL AUTO_INCREMENT,
  `numserie` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `costoh` double DEFAULT NULL,
  `imagenprincipal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idmaquinaria`),
  UNIQUE KEY `numserie` (`numserie`)
) ENGINE=InnoDB AUTO_INCREMENT=638 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla DBSOSA.tbmaquinaria: ~6 rows (aproximadamente)
INSERT INTO `tbmaquinaria` (`idmaquinaria`, `numserie`, `nombre`, `marca`, `modelo`, `costoh`, `imagenprincipal`) VALUES
	(567, 'CAT0320DPABC12345', 'Excavadora hidráulica', 'Caterpillar', '320D', 110.5, 'excavadora.png'),
	(568, 'KMTD65EX17XYZ67890', 'Bulldozer', 'Komatsu', 'D65EX-17', 120.2, 'excavadora.png'),
	(569, 'LIEB120051DEF23456', 'Grúa móvil', 'Liebherr', 'LTM 1200-5.1', 140.9, 'excavadora.png'),
	(570, 'VOLG930MNO78901', 'Motoniveladora', 'Volvo', 'G930', 120.2, 'excavadora.png'),
	(571, 'MBACT4141KJKL34567', 'Camión volquete', 'Mercedes-Benz', 'Actros 4141K', 110.5, 'excavadora.png'),
	(572, 'JCB3CXQRS45678', 'Retroexcavadora', 'JCB', '3CX', 140.9, 'excavadora.png');

-- Volcando estructura para tabla DBSOSA.tbreserva
CREATE TABLE IF NOT EXISTS `tbreserva` (
  `idreserva` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) DEFAULT NULL,
  `idmaquinaria` int(11) DEFAULT NULL,
  `idcotize` int(11) DEFAULT NULL,
  `idempleado` int(11) DEFAULT NULL,
  `fechareserva` datetime DEFAULT NULL,
  `fechainicio` datetime DEFAULT NULL,
  `fechafin` datetime DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idreserva`),
  KEY `idcliente` (`idcliente`),
  KEY `idmaquinaria` (`idmaquinaria`),
  KEY `idcotize` (`idcotize`),
  KEY `idempleado` (`idempleado`),
  CONSTRAINT `FK_tbreserva_tbcliente` FOREIGN KEY (`idcliente`) REFERENCES `tbcliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbreserva_tbcotizacion` FOREIGN KEY (`idcotize`) REFERENCES `tbcotizacion` (`idcotizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbreserva_tbempleado` FOREIGN KEY (`idempleado`) REFERENCES `tbempleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbreserva_tbmaquinaria` FOREIGN KEY (`idmaquinaria`) REFERENCES `tbmaquinaria` (`idmaquinaria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla DBSOSA.tbreserva: ~1 rows (aproximadamente)
INSERT INTO `tbreserva` (`idreserva`, `idcliente`, `idmaquinaria`, `idcotize`, `idempleado`, `fechareserva`, `fechainicio`, `fechafin`, `estado`) VALUES
	(7, 1, 567, 1, 1, '2024-06-12 15:36:13', '2024-06-13 10:36:00', '2024-06-20 10:36:00', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
