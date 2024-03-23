-- --------------------------------------------------------
-- Host:                         161.132.47.59
-- Versión del servidor:         8.0.35-0ubuntu0.20.04.1 - (Ubuntu)
-- SO del servidor:              Linux
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


-- Volcando estructura de base de datos para db_needu
CREATE DATABASE IF NOT EXISTS `db_needu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_needu`;

-- Volcando estructura para tabla db_needu.tbadmin
CREATE TABLE IF NOT EXISTS `tbadmin` (
  `idadmin` int NOT NULL AUTO_INCREMENT COMMENT 'xd',
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'xd',
  `idusuario` int DEFAULT NULL COMMENT 'xd',
  `clave` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idadmin`),
  KEY `FK_tbadmin_tbusuario` (`idusuario`),
  CONSTRAINT `FK_tbadmin_tbusuario` FOREIGN KEY (`idusuario`) REFERENCES `tbusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbadmin: ~2 rows (aproximadamente)
REPLACE INTO `tbadmin` (`idadmin`, `nombre`, `idusuario`, `clave`) VALUES
	(12, 'ALBERT', 14, '1234'),
	(13, 'X', NULL, NULL);

-- Volcando estructura para tabla db_needu.tbcalificacion
CREATE TABLE IF NOT EXISTS `tbcalificacion` (
  `idcalificacion` int NOT NULL AUTO_INCREMENT,
  `idusuariocalificador` int DEFAULT NULL,
  `idusuariocalificado` int DEFAULT NULL,
  `puntuacion` int DEFAULT NULL,
  `comentario` text COLLATE utf8mb4_general_ci,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idcalificacion`),
  KEY `FK_tbcalificacion_tbusuario` (`idusuariocalificador`),
  KEY `FK_tbcalificacion_tbusuario_2` (`idusuariocalificado`),
  CONSTRAINT `FK_tbcalificacion_tbusuario` FOREIGN KEY (`idusuariocalificador`) REFERENCES `tbusuario` (`idusuario`),
  CONSTRAINT `FK_tbcalificacion_tbusuario_2` FOREIGN KEY (`idusuariocalificado`) REFERENCES `tbusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbcalificacion: ~11 rows (aproximadamente)
REPLACE INTO `tbcalificacion` (`idcalificacion`, `idusuariocalificador`, `idusuariocalificado`, `puntuacion`, `comentario`, `fecha`) VALUES
	(14, 12, 13, 5, '¡Buen trabajo!', '2023-12-03'),
	(15, 12, 13, -2, '¡Mejoremos Juntos!', '2023-12-03'),
	(16, 12, 14, 5, '¡Buen trabajo!', '2023-12-03'),
	(17, 12, 14, -2, '¡Mejoremos Juntos!', '2023-12-03'),
	(18, 12, 15, 5, '¡Buen trabajo!', '2023-12-03'),
	(19, 12, 15, 5, '¡Buen trabajo!', '2023-12-03'),
	(20, 12, 15, 5, '¡Buen trabajo!', '2023-12-03'),
	(21, 12, 15, 5, '¡Buen trabajo!', '2023-12-03'),
	(22, 12, 15, 5, '¡Buen trabajo!', '2023-12-03'),
	(23, 12, 15, 5, '¡Buen trabajo!', '2023-12-03'),
	(24, 24, 20, 5, '¡Buen trabajo!', '2023-12-03');

-- Volcando estructura para tabla db_needu.tbcategoria_notificacion
CREATE TABLE IF NOT EXISTS `tbcategoria_notificacion` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbcategoria_notificacion: ~3 rows (aproximadamente)
REPLACE INTO `tbcategoria_notificacion` (`idcategoria`, `nombre`, `descripcion`) VALUES
	(1, 'Mensaje', NULL),
	(2, 'Solicitud', NULL),
	(3, 'Aprobacion', NULL);

-- Volcando estructura para tabla db_needu.tbcausa
CREATE TABLE IF NOT EXISTS `tbcausa` (
  `idcausa` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`idcausa`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbcausa: ~17 rows (aproximadamente)
REPLACE INTO `tbcausa` (`idcausa`, `nombre`, `descripcion`) VALUES
	(1, 'Reconstrucción y Vivienda', 'Participación en proyectos de reconstrucción y mejora de viviendas en comunidades afectadas por desastres naturales o pobreza.'),
	(2, 'Alimentación y Nutrición', 'Ayuda en la distribución de alimentos y en la promoción de prácticas nutricionales saludables.'),
	(3, 'Educación Infantil', 'Apoyo en la educación y desarrollo de habilidades en niños y jóvenes, especialmente en comunidades desfavorecidas.'),
	(4, 'Conservación Ambiental', 'Trabajo en proyectos de reforestación, limpieza de playas, y otras iniciativas de conservación del medio ambiente.'),
	(5, 'Asistencia Médica y Salud', 'Apoyo en campañas de salud, atención médica básica y promoción de hábitos saludables.'),
	(6, 'Apoyo a Personas Mayores', 'Asistencia y compañía a personas mayores, especialmente aquellas que se encuentran en situación de aislamiento o vulnerabilidad.'),
	(7, 'Derechos Humanos y Abogacía', 'Trabajo en iniciativas que promuevan los derechos humanos y la justicia social.'),
	(8, 'Bienestar Animal', 'Voluntariado en refugios de animales, campañas de adopción y concienciación sobre el cuidado de los animales.'),
	(9, 'Arte y Cultura', 'Promoción de actividades culturales y artísticas en comunidades, incluyendo talleres, exposiciones y eventos.'),
	(10, 'Alimentación y Nutrición', 'Ayuda en la distribución de alimentos y en la promoción de prácticas nutricionales saludables.'),
	(11, 'Educación Infantil', 'Apoyo en la educación y desarrollo de habilidades en niños y jóvenes, especialmente en comunidades desfavorecidas.'),
	(12, 'Conservación Ambiental', 'Trabajo en proyectos de reforestación, limpieza de playas, y otras iniciativas de conservación del medio ambiente.'),
	(13, 'Asistencia Médica y Salud', 'Apoyo en campañas de salud, atención médica básica y promoción de hábitos saludables.'),
	(14, 'Apoyo a Personas Mayores', 'Asistencia y compañía a personas mayores, especialmente aquellas que se encuentran en situación de aislamiento o vulnerabilidad.'),
	(15, 'Derechos Humanos y Abogacía', 'Trabajo en iniciativas que promuevan los derechos humanos y la justicia social.'),
	(16, 'Bienestar Animal', 'Voluntariado en refugios de animales, campañas de adopción y concienciación sobre el cuidado de los animales.'),
	(17, 'Arte y Cultura', 'Promoción de actividades culturales y artísticas en comunidades, incluyendo talleres, exposiciones y eventos.');

-- Volcando estructura para tabla db_needu.tbchat
CREATE TABLE IF NOT EXISTS `tbchat` (
  `idchat` int NOT NULL AUTO_INCREMENT,
  `idusuario1` int DEFAULT NULL,
  `idusuario2` int DEFAULT NULL,
  `fechacreacion` date DEFAULT NULL,
  `nombre1` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombre2` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idchat`),
  KEY `FK_tbchat_tbusuario` (`idusuario1`),
  KEY `FK_tbchat_tbusuario_2` (`idusuario2`),
  CONSTRAINT `FK_tbchat_tbusuario` FOREIGN KEY (`idusuario1`) REFERENCES `tbusuario` (`idusuario`),
  CONSTRAINT `FK_tbchat_tbusuario_2` FOREIGN KEY (`idusuario2`) REFERENCES `tbusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbchat: ~14 rows (aproximadamente)
REPLACE INTO `tbchat` (`idchat`, `idusuario1`, `idusuario2`, `fechacreacion`, `nombre1`, `nombre2`) VALUES
	(24, 13, 12, '2023-11-16', 'asd', 'qwe'),
	(25, 13, 12, '2023-11-16', 'asd', 'qwe'),
	(26, 13, 12, '2023-11-16', 'asd', 'qwe'),
	(27, 13, 12, '2023-11-18', 'asd', 'qwe'),
	(28, 13, 12, '2023-11-18', 'asd', 'qwe'),
	(29, 13, 12, '2023-11-18', 'asd', 'qwe'),
	(30, 13, 12, '2023-11-18', 'asd', 'qwe'),
	(31, 17, 16, '2023-11-19', 'Albert kenyi', 'Facebook'),
	(33, 17, 18, '2023-11-19', 'Albert kenyi', 'GORE TACNA'),
	(34, 22, 16, '2023-11-19', 'ALMA ', 'Facebook'),
	(35, 23, 16, '2023-11-21', 'jesus', 'Facebook'),
	(37, 13, 19, NULL, NULL, NULL),
	(38, 23, 18, NULL, NULL, NULL),
	(39, 15, 23, NULL, NULL, NULL),
	(40, 15, 23, NULL, NULL, NULL),
	(41, 15, 23, NULL, NULL, NULL),
	(42, 15, 23, NULL, NULL, NULL),
	(43, 15, 23, NULL, NULL, NULL),
	(44, 15, 23, NULL, NULL, NULL),
	(45, 15, 23, NULL, NULL, NULL);

-- Volcando estructura para tabla db_needu.tbconfiguracion
CREATE TABLE IF NOT EXISTS `tbconfiguracion` (
  `idconfiguracion` int NOT NULL AUTO_INCREMENT,
  `idusuario` int DEFAULT NULL,
  `configuraciones` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`idconfiguracion`),
  KEY `FK_tbconfiguracion_tbusuario` (`idusuario`),
  CONSTRAINT `FK_tbconfiguracion_tbusuario` FOREIGN KEY (`idusuario`) REFERENCES `tbusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbconfiguracion: ~0 rows (aproximadamente)

-- Volcando estructura para tabla db_needu.tbcontrol
CREATE TABLE IF NOT EXISTS `tbcontrol` (
  `idcontrol` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idusuario` int DEFAULT NULL,
  `hora_entrada` datetime DEFAULT NULL,
  `hora_salida` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'No registrado',
  PRIMARY KEY (`idcontrol`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbcontrol: ~191 rows (aproximadamente)
REPLACE INTO `tbcontrol` (`idcontrol`, `usuario`, `idusuario`, `hora_entrada`, `hora_salida`) VALUES
	(4, 'asd', 0, '2023-11-16 14:11:28', '2023-11-16 14:11:28'),
	(5, 'asd', 0, '2023-11-16 14:12:00', '2023-11-16 14:12:00'),
	(6, 'asd', 0, '2023-11-16 14:19:14', '2023-11-16 14:19:27'),
	(7, 'qwe', 12, '2023-11-16 14:20:18', '2023-11-16 14:20:43'),
	(8, 'asd', 13, '2023-11-16 14:20:36', '2023-11-16 14:20:45'),
	(9, 'asd', 13, '2023-11-16 15:20:55', NULL),
	(10, 'asd', 13, '2023-11-16 15:22:32', NULL),
	(11, 'asd', 13, '2023-11-16 15:23:56', NULL),
	(12, 'qwe', 12, '2023-11-16 15:25:59', NULL),
	(13, 'qwe', 12, '2023-11-16 15:29:21', '2023-11-16 15:29:48'),
	(14, 'asd', 13, '2023-11-16 15:29:57', 'No registrado'),
	(15, 'asd', 13, '2023-11-16 15:31:01', 'No registrado'),
	(16, 'asd', 13, '2023-11-18 01:53:16', 'No registrado'),
	(17, 'asd', 13, '2023-11-18 02:08:37', '2023-11-18 02:08:55'),
	(18, 'qwe', 12, '2023-11-18 03:37:56', 'No registrado'),
	(19, 'asd', 13, '2023-11-18 03:38:55', 'No registrado'),
	(20, 'asd', 13, '2023-11-18 03:43:31', 'No registrado'),
	(21, 'asd', 13, '2023-11-18 04:14:31', 'No registrado'),
	(22, 'asd', 13, '2023-11-18 18:18:50', 'No registrado'),
	(23, 'asd', 13, '2023-11-18 18:22:45', '2023-11-18 18:23:07'),
	(24, 'asd', 13, '2023-11-18 12:22:45', 'No registrado'),
	(25, 'asd', 13, '2023-11-18 18:23:25', 'No registrado'),
	(26, 'qwe', 12, '2023-11-18 18:27:19', 'No registrado'),
	(27, 'qwe', 12, '2023-11-18 18:31:21', 'No registrado'),
	(28, 'asd', 13, '2023-11-18 18:31:47', 'No registrado'),
	(29, 'asd', 13, '2023-11-18 18:48:18', 'No registrado'),
	(30, 'qwe', 12, '2023-11-18 18:48:37', 'No registrado'),
	(31, 'asd', 13, '2023-11-18 19:19:43', 'No registrado'),
	(32, 'asd', 13, '2023-11-18 14:07:16', 'No registrado'),
	(33, 'asd', 13, '2023-11-18 14:08:52', '2023-11-18 14:09:56'),
	(34, 'asd', 13, '2023-11-18 14:10:00', '2023-11-18 14:10:39'),
	(35, 'qwe', 12, '2023-11-18 14:10:45', 'No registrado'),
	(36, 'qwe', 12, '2023-11-18 20:13:45', 'No registrado'),
	(37, 'asd', 13, '2023-11-18 20:14:30', 'No registrado'),
	(38, 'asd', 13, '2023-11-18 14:16:35', 'No registrado'),
	(39, 'asd', 13, '2023-11-18 14:16:52', 'No registrado'),
	(40, 'asd', 13, '2023-11-18 14:27:22', 'No registrado'),
	(41, 'asd', 13, '2023-11-18 14:38:47', 'No registrado'),
	(42, 'asd', 13, '2023-11-18 20:41:01', 'No registrado'),
	(43, 'qwe', 12, '2023-11-18 20:41:39', '2023-11-18 21:05:38'),
	(44, 'qwe', 12, '2023-11-18 20:42:45', 'No registrado'),
	(45, 'qwe', 12, '2023-11-18 15:02:08', 'No registrado'),
	(46, 'asd', 13, '2023-11-18 15:08:00', 'No registrado'),
	(47, 'qwe', 12, '2023-11-18 15:09:06', 'No registrado'),
	(48, 'qwe', 12, '2023-11-18 15:15:03', 'No registrado'),
	(49, 'qwe', 12, '2023-11-18 21:16:25', 'No registrado'),
	(50, 'qwe', 12, '2023-11-18 15:17:39', 'No registrado'),
	(51, 'qwe', 12, '2023-11-18 15:23:15', 'No registrado'),
	(52, 'asd', 13, '2023-11-18 15:53:54', 'No registrado'),
	(53, 'asd', 13, '2023-11-18 15:57:28', 'No registrado'),
	(54, 'qwe', 12, '2023-11-18 16:13:15', 'No registrado'),
	(55, 'asd', 13, '2023-11-18 16:14:53', 'No registrado'),
	(56, 'asd', 13, '2023-11-18 16:21:20', 'No registrado'),
	(57, 'asd', 13, '2023-11-18 16:27:09', 'No registrado'),
	(58, 'asd', 13, '2023-11-18 16:30:20', 'No registrado'),
	(59, 'asd', 13, '2023-11-18 16:33:40', 'No registrado'),
	(60, 'asd', 13, '2023-11-18 16:35:49', 'No registrado'),
	(61, 'qwe', 12, '2023-11-18 16:36:35', 'No registrado'),
	(62, 'asd', 13, '2023-11-18 16:37:49', 'No registrado'),
	(63, 'asd', 13, '2023-11-18 16:45:09', 'No registrado'),
	(64, 'asd', 13, '2023-11-18 16:46:09', 'No registrado'),
	(65, 'asd', 13, '2023-11-18 16:48:52', 'No registrado'),
	(66, 'admin', 14, '2023-11-18 16:59:46', 'No registrado'),
	(67, 'asd', 13, '2023-11-18 17:12:55', '2023-11-18 17:15:47'),
	(68, 'asd', 13, '2023-11-18 17:15:53', 'No registrado'),
	(69, 'asd', 13, '2023-11-18 17:18:04', 'No registrado'),
	(70, 'asd', 13, '2023-11-18 17:20:45', 'No registrado'),
	(71, 'asd', 13, '2023-11-18 17:23:31', 'No registrado'),
	(72, 'asd', 13, '2023-11-18 17:24:38', 'No registrado'),
	(73, 'asd', 13, '2023-11-18 17:25:52', 'No registrado'),
	(74, 'asd', 13, '2023-11-18 17:27:53', 'No registrado'),
	(75, 'asd', 13, '2023-11-18 17:31:22', 'No registrado'),
	(76, 'asd', 13, '2023-11-18 17:31:43', '2023-11-18 17:32:03'),
	(77, 'qwe', 12, '2023-11-18 17:32:07', 'No registrado'),
	(78, 'qwe', 12, '2023-11-18 17:32:29', 'No registrado'),
	(79, 'asd', 13, '2023-11-18 17:39:07', '2023-11-18 17:39:13'),
	(80, 'qwe', 12, '2023-11-18 17:39:17', 'No registrado'),
	(81, 'asd', 13, '2023-11-18 17:40:45', 'No registrado'),
	(82, 'qwe', 12, '2023-11-18 17:42:15', 'No registrado'),
	(83, 'qwe', 12, '2023-11-18 17:45:46', '2023-11-18 17:46:18'),
	(84, 'asd', 13, '2023-11-18 17:46:22', 'No registrado'),
	(85, 'asd', 13, '2023-11-18 17:47:55', 'No registrado'),
	(86, 'asd', 13, '2023-11-18 17:52:07', 'No registrado'),
	(87, 'asd', 13, '2023-11-18 17:56:27', 'No registrado'),
	(88, 'asd', 13, '2023-11-18 17:57:45', 'No registrado'),
	(89, 'asd', 13, '2023-11-18 18:02:41', 'No registrado'),
	(90, 'asd', 13, '2023-11-18 18:03:26', 'No registrado'),
	(91, 'asd', 13, '2023-11-18 18:12:21', '2023-11-18 18:12:27'),
	(92, 'asd', 13, '2023-11-18 18:15:00', '2023-11-18 18:15:05'),
	(93, 'asd', 13, '2023-11-18 18:17:19', '2023-11-18 18:17:21'),
	(94, 'qwe', 12, '2023-11-18 18:17:27', 'No registrado'),
	(95, 'qwe', 12, '2023-11-19 00:19:48', 'No registrado'),
	(96, 'qwe', 12, '2023-11-18 18:28:45', '2023-11-18 18:29:13'),
	(97, 'asd', 13, '2023-11-18 18:32:59', 'No registrado'),
	(98, 'qwe', 12, '2023-11-19 00:33:28', 'No registrado'),
	(99, 'asd', 13, '2023-11-18 18:35:47', '2023-11-18 18:36:07'),
	(100, 'qwe', 12, '2023-11-18 18:36:14', '2023-11-18 18:36:43'),
	(101, 'asd', 13, '2023-11-18 18:36:47', '2023-11-18 18:36:59'),
	(102, 'qwe', 12, '2023-11-18 18:37:08', 'No registrado'),
	(103, 'qwe', 12, '2023-11-19 00:41:05', '2023-11-19 00:41:38'),
	(104, 'qwe', 12, '2023-11-19 00:41:52', '2023-11-19 00:43:22'),
	(105, 'admin', 14, '2023-11-19 00:43:41', 'No registrado'),
	(106, 'asd', 13, '2023-11-18 18:46:29', '2023-11-18 18:47:04'),
	(107, 'asd', 13, '2023-11-18 18:47:14', 'No registrado'),
	(108, 'qwe', 12, '2023-11-18 18:49:13', '2023-11-18 18:49:20'),
	(109, 'asd', 13, '2023-11-18 18:49:24', 'No registrado'),
	(110, 'asd', 13, '2023-11-18 18:59:29', 'No registrado'),
	(111, 'asd', 13, '2023-11-18 19:07:51', '2023-11-18 19:08:39'),
	(112, 'asd', 13, '2023-11-18 19:08:45', 'No registrado'),
	(113, 'qwe', 12, '2023-11-19 01:45:49', 'No registrado'),
	(114, 'qwe', 12, '2023-11-19 02:06:09', 'No registrado'),
	(115, 'asd', 13, '2023-11-19 02:09:49', 'No registrado'),
	(116, 'asd', 13, '2023-11-19 03:03:31', '2023-11-19 03:50:53'),
	(117, 'qwe', 12, '2023-11-19 03:03:53', '2023-11-19 03:26:18'),
	(118, 'asd', 13, '2023-11-19 03:08:07', 'No registrado'),
	(119, 'qwe', 12, '2023-11-19 03:14:50', 'No registrado'),
	(120, 'Ricardo', 16, '2023-11-19 03:30:29', '2023-11-19 03:30:54'),
	(121, 'asd', 13, '2023-11-19 03:31:14', 'No registrado'),
	(122, 'qwe', 12, '2023-11-19 03:31:48', '2023-11-19 03:32:16'),
	(123, 'Ricardo', 16, '2023-11-19 03:32:51', 'No registrado'),
	(124, 'Ricardo', 16, '2023-11-19 03:38:31', 'No registrado'),
	(125, 'Albert', 17, '2023-11-19 03:42:53', '2023-11-19 03:45:12'),
	(126, 'Erick', 18, '2023-11-19 03:46:59', 'No registrado'),
	(127, 'Ricardo', 16, '2023-11-19 03:54:57', '2023-11-19 03:57:53'),
	(128, 'Ricardo', 16, '2023-11-19 03:58:40', '2023-11-19 03:58:50'),
	(129, 'Erick', 18, '2023-11-19 04:18:53', 'No registrado'),
	(130, 'Ricardo', 16, '2023-11-19 04:22:47', '2023-11-19 04:22:57'),
	(131, 'Erick', 18, '2023-11-19 04:24:58', 'No registrado'),
	(132, 'Organizador', 20, '2023-11-19 04:39:40', '2023-11-19 04:46:17'),
	(133, 'admin', 14, '2023-11-19 04:46:29', 'No registrado'),
	(134, 'asd', 13, '2023-11-19 04:48:44', 'No registrado'),
	(135, 'admin', 14, '2023-11-18 22:50:25', 'No registrado'),
	(136, 'admin', 14, '2023-11-19 05:00:03', 'No registrado'),
	(137, 'Erick', 18, '2023-11-19 05:04:43', '2023-11-19 05:08:45'),
	(138, 'Albert', 17, '2023-11-19 05:05:53', '2023-11-19 05:08:47'),
	(139, 'Albert', 17, '2023-11-19 05:13:06', '2023-11-19 05:15:43'),
	(140, 'Erick', 18, '2023-11-19 05:13:26', 'No registrado'),
	(141, 'Albert', 17, '2023-11-19 05:16:10', 'No registrado'),
	(142, 'asd', 13, '2023-11-19 05:50:32', '2023-11-19 05:52:27'),
	(143, 'Erick', 18, '2023-11-19 05:52:49', '2023-11-19 05:52:59'),
	(144, 'admin', 14, '2023-11-19 19:27:45', 'No registrado'),
	(145, 'asd', 13, '2023-11-19 20:14:04', 'No registrado'),
	(146, 'admin', 14, '2023-11-19 20:50:16', 'No registrado'),
	(147, 'ARBODX', 22, '2023-11-19 20:53:07', 'No registrado'),
	(148, 'ARBODX', 22, '2023-11-19 20:54:13', '2023-11-19 20:54:26'),
	(149, 'Albert', 17, '2023-11-19 20:54:38', 'No registrado'),
	(150, 'Ricardo', 16, '2023-11-19 20:54:59', 'No registrado'),
	(151, 'admin', 14, '2023-11-19 20:58:00', 'No registrado'),
	(152, 'admin', 14, '2023-11-20 01:07:01', 'No registrado'),
	(153, 'admin', 14, '2023-11-20 01:07:01', 'No registrado'),
	(154, 'admin', 14, '2023-11-20 01:07:01', 'No registrado'),
	(155, 'admin', 14, '2023-11-20 01:07:01', 'No registrado'),
	(156, 'admin', 14, '2023-11-20 01:07:01', 'No registrado'),
	(157, 'Albert', 17, '2023-11-20 01:08:07', 'No registrado'),
	(158, 'asd', 13, '2023-11-20 21:43:56', 'No registrado'),
	(159, 'asd', 13, '2023-11-20 21:44:10', 'No registrado'),
	(160, 'Erick', 18, '2023-11-20 21:46:28', 'No registrado'),
	(161, 'Albert', 17, '2023-11-20 22:50:58', 'No registrado'),
	(162, 'jesus', 23, '2023-11-21 00:25:03', '2023-11-21 00:31:53'),
	(163, 'Erick', 18, '2023-11-21 00:26:14', '2023-11-21 00:26:32'),
	(164, 'Ricardo', 16, '2023-11-21 00:27:16', 'No registrado'),
	(165, 'Ricardo', 16, '2023-11-21 00:27:16', 'No registrado'),
	(166, 'jesus', 23, '2023-11-21 00:32:07', 'No registrado'),
	(167, 'asd', 13, '2023-11-21 01:54:22', 'No registrado'),
	(168, 'asd', 13, '2023-11-21 01:56:51', '2023-11-21 01:56:53'),
	(169, 'admin', 14, '2023-11-21 01:57:00', '2023-11-21 01:57:32'),
	(170, 'asd', 13, '2023-11-21 17:50:24', '2023-11-21 17:52:01'),
	(171, 'asd', 13, '2023-11-21 17:52:30', 'No registrado'),
	(172, 'admin', 14, '2023-11-21 17:55:36', 'No registrado'),
	(173, 'asd', 13, '2023-11-24 21:06:21', 'No registrado'),
	(174, 'Ricardo', 16, '2023-11-26 15:23:53', '2023-11-26 15:24:35'),
	(175, 'Albert', 17, '2023-11-26 15:24:55', 'No registrado'),
	(176, 'Albert', 17, '2023-11-26 23:04:00', 'No registrado'),
	(177, 'Albert', 17, '2023-11-27 00:27:02', 'No registrado'),
	(178, 'Albert', 17, '2023-11-27 17:15:13', 'No registrado'),
	(179, 'Albert', 17, '2023-11-27 20:35:03', 'No registrado'),
	(180, 'Albert', 17, '2023-11-28 13:44:13', 'No registrado'),
	(181, 'Albert', 17, '2023-11-28 14:12:24', 'No registrado'),
	(182, 'Albert', 17, '2023-11-30 15:13:22', 'No registrado'),
	(183, 'qwe', 12, '2023-11-30 23:05:42', 'No registrado'),
	(184, 'asd', 13, '2023-11-30 23:09:21', 'No registrado'),
	(185, 'qwe', 12, '2023-11-30 23:34:24', '2023-11-30 23:38:10'),
	(186, 'Albert', 17, '2023-11-30 23:38:41', '2023-11-30 23:39:07'),
	(187, 'admin', 14, '2023-11-30 23:39:28', 'No registrado'),
	(188, 'qwe', 12, '2023-11-30 23:40:56', '2023-11-30 23:41:07'),
	(189, 'asd', 13, '2023-11-30 23:41:21', '2023-11-30 23:41:28'),
	(190, 'NanoMalo', 15, '2023-11-30 23:41:37', '2023-11-30 23:52:15'),
	(191, 'NanoMalo', 15, '2023-11-30 23:52:32', 'No registrado'),
	(192, 'NanoMalo', 15, '2023-11-30 23:54:08', 'No registrado'),
	(193, 'Albert', 17, '2023-11-30 18:56:38', 'No registrado'),
	(194, 'Albert', 17, '2023-11-30 19:05:50', 'No registrado'),
	(195, 'Albert', 17, '2023-12-01 14:14:01', 'No registrado'),
	(196, 'qwe', 12, '2023-12-02 20:31:44', 'No registrado'),
	(197, 'qwe', 12, '2023-12-03 01:08:19', 'No registrado'),
	(198, 'Albert', 17, '2023-12-03 01:09:32', 'No registrado'),
	(199, 'Albert', 17, '2023-12-02 20:58:56', 'No registrado'),
	(200, 'qwe', 12, '2023-12-03 13:34:59', 'No registrado'),
	(201, 'qwe', 12, '2023-12-03 14:07:35', 'No registrado'),
	(202, 'asd', 13, '2023-12-03 18:29:59', 'No registrado'),
	(203, 'asd', 13, '2023-12-03 21:20:19', '2023-12-03 21:20:24'),
	(204, 'qwe', 12, '2023-12-04 07:37:21', 'No registrado'),
	(205, 'qwe', 12, '2023-12-04 07:40:21', 'No registrado'),
	(206, 'qwe', 12, '2023-12-04 17:12:58', 'No registrado'),
	(207, 'Albert', 17, '2023-12-04 14:58:18', '2023-12-04 15:02:31'),
	(208, 'Albert', 17, '2023-12-04 15:56:42', 'No registrado'),
	(209, 'asd', 13, '2023-12-04 22:19:10', 'No registrado'),
	(210, 'asd', 13, '2023-12-04 22:19:32', 'No registrado'),
	(211, 'Albert', 17, '2023-12-04 16:42:54', 'No registrado'),
	(212, 'qwe', 12, '2023-12-04 16:49:36', 'No registrado'),
	(213, 'Albert', 17, '2023-12-04 17:02:30', 'No registrado'),
	(214, 'Albert', 17, '2023-12-04 17:03:52', 'No registrado'),
	(215, 'Albert', 17, '2023-12-04 17:05:59', 'No registrado'),
	(216, 'Albert', 17, '2023-12-04 17:07:08', '2023-12-04 17:07:46'),
	(217, 'Albert', 17, '2023-12-04 17:28:50', '2023-12-04 17:31:11'),
	(218, 'Ricardo', 16, '2023-12-04 17:31:25', '2023-12-04 17:32:47'),
	(219, 'qwe', 12, '2023-12-04 23:58:29', 'No registrado'),
	(220, 'qwe', 12, '2023-12-05 00:32:01', '2023-12-05 00:51:21'),
	(221, 'qwe', 12, '2023-12-04 18:42:25', '2023-12-04 18:48:07'),
	(222, 'Albert', 17, '2023-12-04 18:48:24', 'No registrado'),
	(223, 'Albert', 17, '2023-12-05 00:51:36', 'No registrado'),
	(224, 'Albert', 17, '2023-12-04 19:00:05', 'No registrado'),
	(225, 'Albert', 17, '2023-12-04 19:14:33', 'No registrado'),
	(226, 'Erick', 18, '2023-12-04 19:14:52', '2023-12-04 19:15:12'),
	(227, 'Erick', 18, '2023-12-04 19:15:42', 'No registrado');

-- Volcando estructura para tabla db_needu.tbdescripcion_oportunidad
CREATE TABLE IF NOT EXISTS `tbdescripcion_oportunidad` (
  `iddescripcion` int NOT NULL AUTO_INCREMENT,
  `logo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `informacion` int DEFAULT NULL,
  `idoportunidad` int DEFAULT NULL,
  PRIMARY KEY (`iddescripcion`),
  KEY `FK_tbdescripcion_oportunidad_tboportunidad` (`idoportunidad`),
  CONSTRAINT `FK_tbdescripcion_oportunidad_tboportunidad` FOREIGN KEY (`idoportunidad`) REFERENCES `tboportunidad` (`idoportunidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbdescripcion_oportunidad: ~0 rows (aproximadamente)

-- Volcando estructura para tabla db_needu.tbdescripcion_organizacion
CREATE TABLE IF NOT EXISTS `tbdescripcion_organizacion` (
  `iddescripcion` int NOT NULL AUTO_INCREMENT,
  `logo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `informacion` text COLLATE utf8mb4_general_ci,
  `idorganizacion` int DEFAULT NULL,
  PRIMARY KEY (`iddescripcion`) USING BTREE,
  KEY `FK_tbdescripcion_organizacion_tborganizacion` (`idorganizacion`),
  CONSTRAINT `FK_tbdescripcion_organizacion_tborganizacion` FOREIGN KEY (`idorganizacion`) REFERENCES `tborganizacion` (`idorganizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbdescripcion_organizacion: ~0 rows (aproximadamente)

-- Volcando estructura para tabla db_needu.tbeliminaciontemporal
CREATE TABLE IF NOT EXISTS `tbeliminaciontemporal` (
  `ideliminacion` int NOT NULL AUTO_INCREMENT,
  `idusuario` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`ideliminacion`),
  KEY `FK_tbeliminaciontemporal_tbusuario` (`idusuario`),
  CONSTRAINT `FK_tbeliminaciontemporal_tbusuario` FOREIGN KEY (`idusuario`) REFERENCES `tbusuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbeliminaciontemporal: ~0 rows (aproximadamente)

-- Volcando estructura para tabla db_needu.tbhabilidad
CREATE TABLE IF NOT EXISTS `tbhabilidad` (
  `idhabilidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`idhabilidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbhabilidad: ~0 rows (aproximadamente)

-- Volcando estructura para tabla db_needu.tbinteres
CREATE TABLE IF NOT EXISTS `tbinteres` (
  `idinteres` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`idinteres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbinteres: ~0 rows (aproximadamente)

-- Volcando estructura para tabla db_needu.tbmensaje
CREATE TABLE IF NOT EXISTS `tbmensaje` (
  `idmensaje` int NOT NULL AUTO_INCREMENT,
  `idchat` int DEFAULT NULL,
  `emisor` int DEFAULT NULL,
  `receptor` int DEFAULT NULL,
  `mensaje` text COLLATE utf8mb4_general_ci,
  `fechahora` datetime DEFAULT NULL,
  `nombre_emisor` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombre_receptor` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idmensaje`),
  KEY `FK_tbmensaje_tbusuario` (`emisor`),
  KEY `FK_tbmensaje_tbusuario_2` (`receptor`),
  KEY `FK_tbmensaje_tbchat` (`idchat`),
  CONSTRAINT `FK_tbmensaje_tbchat` FOREIGN KEY (`idchat`) REFERENCES `tbchat` (`idchat`),
  CONSTRAINT `FK_tbmensaje_tbusuario` FOREIGN KEY (`emisor`) REFERENCES `tbusuario` (`idusuario`),
  CONSTRAINT `FK_tbmensaje_tbusuario_2` FOREIGN KEY (`receptor`) REFERENCES `tbusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbmensaje: ~82 rows (aproximadamente)
REPLACE INTO `tbmensaje` (`idmensaje`, `idchat`, `emisor`, `receptor`, `mensaje`, `fechahora`, `nombre_emisor`, `nombre_receptor`) VALUES
	(40, 24, 13, 12, 'hola', '2023-11-16 10:57:09', NULL, NULL),
	(41, 24, 13, 12, 'que hubo', '2023-11-16 10:57:09', NULL, NULL),
	(42, 24, 12, 13, 'noc q hablas', '2023-11-16 10:57:09', NULL, NULL),
	(43, 24, 12, 13, 'hola', '2023-11-18 03:37:58', NULL, NULL),
	(44, 24, 12, 13, 'holi', '2023-11-18 03:37:58', NULL, NULL),
	(45, 24, 12, 13, 'hola', '2023-11-18 03:37:58', NULL, NULL),
	(46, 24, 13, 12, 'WA', '2023-11-18 03:39:07', NULL, NULL),
	(47, 24, 12, 13, 'q pasa', '2023-11-18 03:37:58', NULL, NULL),
	(48, 24, 13, 12, 'hola wawwawawawawawaw', '2023-11-18 03:39:07', NULL, NULL),
	(49, 24, 12, 13, ':p', '2023-11-18 03:37:58', NULL, NULL),
	(50, 24, 13, 12, 'mensaje de prueba 3:40 am', '2023-11-18 03:39:07', NULL, NULL),
	(51, 24, 12, 13, 'JSP -> Hello Worlddddddd! :d', '2023-11-18 03:37:58', NULL, NULL),
	(52, 24, 12, 13, '3:40 am', '2023-11-18 03:37:58', NULL, NULL),
	(53, 24, 13, 12, 'XD', '2023-11-18 03:39:07', NULL, NULL),
	(54, 24, 13, 12, 'que piola', '2023-11-18 03:39:07', NULL, NULL),
	(55, 24, 13, 12, 'hola', '2023-11-18 18:20:20', NULL, NULL),
	(56, 24, 13, 12, 'noc tu diras', '2023-11-18 12:22:47', NULL, NULL),
	(57, 24, 12, 13, 'Xd', '2023-11-18 18:20:20', NULL, NULL),
	(58, 24, 12, 13, 'CUTIPA ?', '2023-11-18 18:20:20', NULL, NULL),
	(59, 24, 12, 13, 'Estoy wu3 le doy f5', '2023-11-18 18:20:20', NULL, NULL),
	(60, 24, 12, 13, '12.31 pm :v', '2023-11-18 18:20:20', NULL, NULL),
	(61, 24, 12, 13, 'Esa gente sapa en mi chat', '2023-11-18 18:20:20', NULL, NULL),
	(62, 24, 13, 12, 'llegue', '2023-11-18 18:20:20', NULL, NULL),
	(63, 24, 13, 12, 'WA', '2023-11-18 18:20:20', NULL, NULL),
	(64, 24, 12, 13, 'Hola cutipa ?', '2023-11-18 18:20:20', NULL, NULL),
	(65, 24, 13, 12, '12:', '2023-11-18 18:20:20', NULL, NULL),
	(66, 24, 13, 12, '12:32 PM', '2023-11-18 18:20:20', NULL, NULL),
	(67, 24, 12, 13, 'Saluda pues', '2023-11-18 18:20:20', NULL, NULL),
	(68, 24, 13, 12, 'cutipa', '2023-11-18 18:20:20', NULL, NULL),
	(69, 24, 12, 13, 'le meto para hablar por micro, y hacemos un discord', '2023-11-18 18:20:20', NULL, NULL),
	(70, 24, 13, 12, 'DISCORD XD', '2023-11-18 18:20:20', NULL, NULL),
	(71, 24, 13, 12, 'safo', '2023-11-18 18:20:20', NULL, NULL),
	(72, 24, 13, 12, 'gooooood', '2023-11-18 18:47:17', NULL, NULL),
	(73, 24, 13, 12, '14:07', '2023-11-18 14:07:18', NULL, NULL),
	(74, 24, 13, 12, 'hola', '2023-11-18 14:08:54', NULL, NULL),
	(75, 24, 13, 12, 'ni cagandooooooooooo', '2023-11-18 14:10:12', NULL, NULL),
	(76, 24, 12, 13, 'XDDDDD', '2023-11-18 14:10:12', NULL, NULL),
	(77, 26, 13, 12, 'Uwu', '2023-11-18 18:47:17', NULL, NULL),
	(78, 26, 12, 13, 'Hoa', '2023-11-18 18:47:17', NULL, NULL),
	(79, 24, 13, 12, 'holi boli', '2023-11-18 14:38:49', NULL, NULL),
	(80, 24, 12, 13, 'wawawawawawa', '2023-11-18 20:41:02', NULL, NULL),
	(81, 24, 12, 13, 'ð', '2023-11-18 20:41:02', NULL, NULL),
	(82, 24, 12, 13, 'ð', '2023-11-18 20:41:02', NULL, NULL),
	(83, 24, 12, 13, 'ð¤', '2023-11-18 20:41:02', NULL, NULL),
	(84, 24, 13, 12, '<3', '2023-11-18 20:41:02', NULL, NULL),
	(85, 24, 12, 13, ':C', '2023-11-18 20:41:02', NULL, NULL),
	(86, 24, 13, 12, ':)', '2023-11-18 20:41:02', NULL, NULL),
	(87, 24, 12, 13, 'âï¸', '2023-11-18 20:41:02', NULL, NULL),
	(88, 31, 17, 16, 'Buenas me interesa esta oportunidad', '2023-11-19 03:04:08', NULL, NULL),
	(91, 33, 17, 18, 'Hola', '2023-11-19 05:06:19', NULL, NULL),
	(92, 33, 18, 17, 'Hola que tal Albert', '2023-11-19 05:06:19', NULL, NULL),
	(93, 33, 17, 18, 'h', '2023-11-19 05:06:19', NULL, NULL),
	(94, 34, 22, 16, 'ME INTERESA', '2023-11-19 20:55:01', NULL, NULL),
	(95, 34, 16, 22, 'q copsa', '2023-11-19 20:55:01', NULL, NULL),
	(96, 34, 16, 22, 'xd', '2023-11-19 20:55:01', NULL, NULL),
	(97, 34, 22, 16, 'https://www.youtube.com/watch?v=-DOP_WG_2rc', '2023-11-19 20:55:01', NULL, NULL),
	(98, 35, 23, 16, 'pto el lo lea', '2023-11-21 00:25:16', NULL, NULL),
	(99, 35, 16, 23, 'masld', '2023-11-21 00:25:16', NULL, NULL),
	(100, 35, 16, 23, 'masldasd', '2023-11-21 00:25:16', NULL, NULL),
	(101, 35, 16, 23, 'masldasddas', '2023-11-21 00:25:16', NULL, NULL),
	(102, 35, 16, 23, 'masldasddasasd', '2023-11-21 00:25:16', NULL, NULL),
	(103, 35, 16, 23, 'masldasddasasdasd', '2023-11-21 00:25:16', NULL, NULL),
	(104, 35, 16, 23, 'masldasddasasdasdasd', '2023-11-21 00:25:16', NULL, NULL),
	(105, 35, 16, 23, 'masldasddasasdasdasdas', '2023-11-21 00:25:16', NULL, NULL),
	(106, 35, 16, 23, 'masldasddasasdasdasdas', '2023-11-21 00:25:16', NULL, NULL),
	(107, 35, 16, 23, 'Malcriado', '2023-11-21 00:25:16', NULL, NULL),
	(108, 35, 16, 23, 'Malcriado', '2023-11-21 00:25:16', NULL, NULL),
	(109, 35, 16, 23, 'MalcriadoMalcriado', '2023-11-21 00:25:16', NULL, NULL),
	(110, 35, 16, 23, 'Malcriado', '2023-11-21 00:25:16', NULL, NULL),
	(111, 35, 16, 23, 'Malcriado', '2023-11-21 00:25:16', NULL, NULL),
	(112, 35, 16, 23, 'Malcriado', '2023-11-21 00:25:16', NULL, NULL),
	(113, 35, 23, 16, 'foto tta', '2023-11-21 00:25:16', NULL, NULL),
	(114, 35, 23, 16, ':c', '2023-11-21 00:25:16', NULL, NULL),
	(115, 35, 16, 23, 'XDXDDXD', '2023-11-21 00:25:16', NULL, NULL),
	(116, 35, 16, 23, 'Te acuerda a quien segui anoche :V=', '2023-11-21 00:25:16', NULL, NULL),
	(117, 35, 23, 16, 'tu tio xd', '2023-11-21 00:25:16', NULL, NULL),
	(118, 35, 16, 23, 'YAMEJOR , :V', '2023-11-21 00:25:16', NULL, NULL),
	(119, 35, 23, 16, 'hola', '2023-11-21 00:25:16', NULL, NULL),
	(120, 35, 16, 23, 'dx', '2023-11-21 00:25:16', NULL, NULL),
	(121, 35, 23, 16, 'soy homero chino', '2023-11-21 00:25:16', NULL, NULL),
	(122, 35, 23, 16, 'sexo', '2023-11-21 00:25:16', NULL, NULL),
	(123, 35, 23, 16, 'drogas', '2023-11-21 00:25:16', NULL, NULL),
	(124, 35, 23, 16, 'php', '2023-11-21 00:25:16', NULL, NULL),
	(125, 35, 23, 16, 'palver pasa video de como subir a la red un proyecto pls', '2023-11-21 00:25:16', NULL, NULL),
	(126, 35, 16, 23, 'chat gpt sabe', '2023-11-21 00:25:16', NULL, NULL),
	(127, 35, 23, 16, 'para que carlos lo haga esta zzz en mi proyectos xd', '2023-11-21 00:25:16', NULL, NULL),
	(128, 35, 16, 23, '@erick, ', '2023-11-21 00:25:16', NULL, NULL),
	(129, 31, 17, 16, 'hola ', '2023-12-04 14:58:31', NULL, NULL);

-- Volcando estructura para tabla db_needu.tbnotificacion
CREATE TABLE IF NOT EXISTS `tbnotificacion` (
  `idnotificacion` int NOT NULL AUTO_INCREMENT,
  `idusuario` int DEFAULT NULL,
  `mensaje` text COLLATE utf8mb4_general_ci,
  `fecha` date DEFAULT NULL,
  `visto` bit(1) DEFAULT NULL,
  `idcategoria` int DEFAULT NULL,
  PRIMARY KEY (`idnotificacion`),
  KEY `FK_tbnotificacion_tbusuario` (`idusuario`),
  KEY `FK_tbnotificacion_tbcategoria_notificacion` (`idcategoria`),
  CONSTRAINT `FK_tbnotificacion_tbcategoria_notificacion` FOREIGN KEY (`idcategoria`) REFERENCES `tbcategoria_notificacion` (`idcategoria`),
  CONSTRAINT `FK_tbnotificacion_tbusuario` FOREIGN KEY (`idusuario`) REFERENCES `tbusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbnotificacion: ~87 rows (aproximadamente)
REPLACE INTO `tbnotificacion` (`idnotificacion`, `idusuario`, `mensaje`, `fecha`, `visto`, `idcategoria`) VALUES
	(17, 12, 'Mensajes de asd sin leer', '2023-11-16', b'1', 1),
	(18, 12, 'Mensajes de asd sin leer', '2023-11-16', b'1', 1),
	(19, 12, 'Mensajes de asd sin leer', '2023-11-16', b'1', 1),
	(20, 12, 'Mensajes de asd sin leer', '2023-11-16', b'1', 1),
	(21, 12, 'Mensajes de asd sin leer', '2023-11-16', b'1', 1),
	(22, 13, 'Mensajes de qwe sin leer', '2023-11-16', b'1', 1),
	(23, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(24, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(25, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(26, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(27, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(28, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(29, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(30, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(31, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(32, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(33, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(34, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(35, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(36, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(37, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(38, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(39, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(40, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(41, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(42, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(43, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(44, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(45, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(46, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(47, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(48, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(49, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(50, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(51, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(52, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(53, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(54, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(55, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(56, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(57, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(58, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(59, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(60, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(61, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(62, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(63, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(64, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(65, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(66, 12, 'Mensajes de asd sin leer', '2023-11-18', b'1', 1),
	(67, 13, 'Mensajes de qwe sin leer', '2023-11-18', b'1', 1),
	(68, 16, 'Mensajes de Albert kenyi sin leer', '2023-11-19', b'0', 1),
	(69, 18, 'Mensajes de Albert kenyi sin leer', '2023-11-19', b'0', 1),
	(70, 17, 'Mensajes de GORE TACNA sin leer', '2023-11-19', b'0', 1),
	(71, 18, 'Mensajes de Albert kenyi sin leer', '2023-11-19', b'0', 1),
	(72, 17, 'Mensajes de GORE TACNA sin leer', '2023-11-19', b'0', 1),
	(73, 18, 'Mensajes de Albert kenyi sin leer', '2023-11-19', b'0', 1),
	(74, 16, 'Mensajes de ALMA  sin leer', '2023-11-19', b'0', 1),
	(75, 22, 'Mensajes de Facebook sin leer', '2023-11-19', b'0', 1),
	(76, 22, 'Mensajes de Facebook sin leer', '2023-11-19', b'0', 1),
	(77, 16, 'Mensajes de ALMA  sin leer', '2023-11-19', b'0', 1),
	(78, 16, 'Mensajes de jesus sin leer', '2023-11-21', b'0', 1),
	(79, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(80, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(81, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(82, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(83, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(84, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(85, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(86, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(87, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(88, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(89, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(90, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(91, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(92, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(93, 16, 'Mensajes de jesus sin leer', '2023-11-21', b'0', 1),
	(94, 16, 'Mensajes de jesus sin leer', '2023-11-21', b'0', 1),
	(95, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(96, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(97, 16, 'Mensajes de jesus sin leer', '2023-11-21', b'0', 1),
	(98, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(99, 16, 'Mensajes de jesus sin leer', '2023-11-21', b'0', 1),
	(100, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(101, 16, 'Mensajes de jesus sin leer', '2023-11-21', b'0', 1),
	(102, 16, 'Mensajes de jesus sin leer', '2023-11-21', b'0', 1),
	(103, 16, 'Mensajes de jesus sin leer', '2023-11-21', b'0', 1),
	(104, 16, 'Mensajes de jesus sin leer', '2023-11-21', b'0', 1),
	(105, 16, 'Mensajes de jesus sin leer', '2023-11-21', b'0', 1),
	(106, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(107, 16, 'Mensajes de jesus sin leer', '2023-11-21', b'0', 1),
	(108, 23, 'Mensajes de Facebook sin leer', '2023-11-21', b'0', 1),
	(109, 16, 'Mensajes de Albert kenyi sin leer', '2023-12-04', b'0', 1);

-- Volcando estructura para tabla db_needu.tboportunidad
CREATE TABLE IF NOT EXISTS `tboportunidad` (
  `idoportunidad` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `fecha` date DEFAULT NULL,
  `idubicacion` int DEFAULT NULL,
  `idorganizacion` int DEFAULT NULL,
  `idcausa` int DEFAULT NULL,
  `estado` int DEFAULT NULL,
  PRIMARY KEY (`idoportunidad`),
  KEY `FK_tboportunidad_tbubicacion` (`idubicacion`),
  KEY `FK_tboportunidad_tborganizacion` (`idorganizacion`),
  KEY `FK_tboportunidad_tbcausa` (`idcausa`),
  CONSTRAINT `FK_tboportunidad_tbcausa` FOREIGN KEY (`idcausa`) REFERENCES `tbcausa` (`idcausa`),
  CONSTRAINT `FK_tboportunidad_tborganizacion` FOREIGN KEY (`idorganizacion`) REFERENCES `tborganizacion` (`idorganizacion`),
  CONSTRAINT `FK_tboportunidad_tbubicacion` FOREIGN KEY (`idubicacion`) REFERENCES `tbubicacion` (`idubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=623 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tboportunidad: ~8 rows (aproximadamente)
REPLACE INTO `tboportunidad` (`idoportunidad`, `titulo`, `descripcion`, `fecha`, `idubicacion`, `idorganizacion`, `idcausa`, `estado`) VALUES
	(15, 'Ayuda a los perritos!!', 'Muchos perritos en situacion de abandono, no pueden comer día a dia, buscando su alimento de la basura, es por eso que te llamamos a ti, para que nos ayudes cuidando perritos :)', '2023-11-18', 1, 16, 8, 0),
	(16, 'Playas sucias, fiestas ', 'En nuestro departamento de tacna, contamos con lindas playas, sin embargo estas no son cuidadas adecuadamente, y más cuando se acercan fiestas de navidad y año nuevo, se parte de esta gran limpieza de la mano de GORE de Tacna', '2024-01-01', 1, 16, 4, 0),
	(17, 'GORE Tacna Limpieza de casas', 'Ciertas ubicaciones de Tacna están abandonadas, es por ello que se requiere de ayuda de jóvenes mayores de 18 años, que quieran ser participe de esta labor social.\r\nMuchas gracias por su interés ', '2023-11-30', 1, 17, 1, 0),
	(58, 'Ayuda en la Construcción de Viviendas Sostenibles', ' Únete a nosotros en la construcción de viviendas ecológicas y sostenibles. Contribuye a la creación de comunidades más respetuosas con el medio ambiente', '2024-01-01', 5, 18, 12, 1),
	(59, 'Apoyo a la Educación en Zonas Rurales', ' Únete a nosotros para mejorar las condiciones educativas en áreas rurales. Tu ayuda hará posible que más niños tengan acceso a una educación de calidad', '2024-01-01', 10, 17, 5, 0),
	(61, 'Ayuda Médica en Zonas Marginadas', ' Únete a nuestra misión de proporcionar asistencia médica en áreas marginadas. Tu apoyo puede marcar la diferencia en la salud de quienes más lo necesitan', '2024-01-01', 3, 16, 4, 0),
	(62, 'Ayuda en la Reconstrucción de Comunidades', 'Únete a nosotros en la reconstrucción y mejora de viviendas en comunidades afectadas por desastres naturales o pobreza. Tu contribución marca la diferencia en la vida de quienes más lo necesitan', '2024-01-01', 1, 16, 8, 0),
	(343, 'Ayuda en la Reconstrucción de Comunidades', 'Únete a nosotros en la reconstrucción y mejora de viviendas en comunidades afectadas por desastres naturales o pobreza. Tu contribución marca la diferencia en la vida de quienes más lo necesitan', '2024-01-01', 1, 16, 8, 0);

-- Volcando estructura para tabla db_needu.tborganizacion
CREATE TABLE IF NOT EXISTS `tborganizacion` (
  `idorganizacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `correo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idusuario` int DEFAULT NULL,
  `idubicacion` int DEFAULT NULL,
  PRIMARY KEY (`idorganizacion`),
  KEY `FK_tborganizacion_tbusuario` (`idusuario`),
  KEY `FK_tborganizacion_tbubicacion` (`idubicacion`),
  CONSTRAINT `FK_tborganizacion_tbubicacion` FOREIGN KEY (`idubicacion`) REFERENCES `tbubicacion` (`idubicacion`),
  CONSTRAINT `FK_tborganizacion_tbusuario` FOREIGN KEY (`idusuario`) REFERENCES `tbusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tborganizacion: ~5 rows (aproximadamente)
REPLACE INTO `tborganizacion` (`idorganizacion`, `nombre`, `tipo`, `correo`, `idusuario`, `idubicacion`) VALUES
	(15, 'qwe', 'qwe', 'qwe', 12, 12),
	(16, 'Facebook', 'No gubernamental ', 'FACEBOOK@GMAIL.com', 16, 15),
	(17, 'GORE TACNA', 'Gubernamental ', 'Gore@gmail.com', 18, 17),
	(18, 'UPT', 'AcadÃ©mico ', 'Elard@upt.pe', 19, 18),
	(19, 'Ejemplo01', 'Benefica', 'Ejemplo01@gmail.com', 20, 19);

-- Volcando estructura para tabla db_needu.tbparticipante
CREATE TABLE IF NOT EXISTS `tbparticipante` (
  `idoportunidad` int NOT NULL,
  `idvoluntario` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idoportunidad`,`idvoluntario`),
  KEY `FK_tbparticipante_tbvoluntario` (`idvoluntario`),
  CONSTRAINT `FK_tbparticipante_tboportunidad` FOREIGN KEY (`idoportunidad`) REFERENCES `tboportunidad` (`idoportunidad`),
  CONSTRAINT `FK_tbparticipante_tbvoluntario` FOREIGN KEY (`idvoluntario`) REFERENCES `tbvoluntario` (`idvoluntario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbparticipante: ~0 rows (aproximadamente)

-- Volcando estructura para tabla db_needu.tbpublicacion
CREATE TABLE IF NOT EXISTS `tbpublicacion` (
  `idpublicacion` int NOT NULL AUTO_INCREMENT,
  `idorganizacion` int DEFAULT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idoportunidad` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idpublicacion`),
  KEY `FK_tbpublicacion_tborganizacion` (`idorganizacion`),
  KEY `FK_tbpublicacion_tboportunidad` (`idoportunidad`),
  CONSTRAINT `FK_tbpublicacion_tboportunidad` FOREIGN KEY (`idoportunidad`) REFERENCES `tboportunidad` (`idoportunidad`),
  CONSTRAINT `FK_tbpublicacion_tborganizacion` FOREIGN KEY (`idorganizacion`) REFERENCES `tborganizacion` (`idorganizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbpublicacion: ~0 rows (aproximadamente)

-- Volcando estructura para tabla db_needu.tbsolicitud
CREATE TABLE IF NOT EXISTS `tbsolicitud` (
  `idsolicitud` int NOT NULL AUTO_INCREMENT,
  `idoportunidad` int DEFAULT NULL,
  `idvoluntario` int DEFAULT NULL,
  `mensaje` text COLLATE utf8mb4_general_ci,
  `entregado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idsolicitud`),
  KEY `FK_tbsolicitud_tboportunidad` (`idoportunidad`),
  KEY `FK_tbsolicitud_tbvoluntario` (`idvoluntario`),
  CONSTRAINT `FK_tbsolicitud_tboportunidad` FOREIGN KEY (`idoportunidad`) REFERENCES `tboportunidad` (`idoportunidad`),
  CONSTRAINT `FK_tbsolicitud_tbvoluntario` FOREIGN KEY (`idvoluntario`) REFERENCES `tbvoluntario` (`idvoluntario`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbsolicitud: ~0 rows (aproximadamente)
REPLACE INTO `tbsolicitud` (`idsolicitud`, `idoportunidad`, `idvoluntario`, `mensaje`, `entregado`) VALUES
	(20, 16, 5, 'Interesado en la oportunidad', b'0'),
	(21, 15, 5, 'Interesado en la oportunidad', b'0');

-- Volcando estructura para tabla db_needu.tbubicacion
CREATE TABLE IF NOT EXISTS `tbubicacion` (
  `idubicacion` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ciudad` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `direccion` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbubicacion: ~22 rows (aproximadamente)
REPLACE INTO `tbubicacion` (`idubicacion`, `pais`, `ciudad`, `direccion`) VALUES
	(1, 'Peru', 'Tacna', 'av. sin nombre'),
	(2, 'Peru', 'Arequipa', 'av. sin nombre'),
	(3, 'Peru', 'Lima', 'av. sin nombre'),
	(4, 'Peru', 'Cusco', 'av. sin nombre'),
	(5, 'Peru', 'Juliaca', 'av. sin nombre'),
	(6, 'Peru', 'Loreto', 'av. sin nombre'),
	(9, 'qwe', 'qwe', 'qwe'),
	(10, 'asd', 'asd', 'asd'),
	(11, 'orga666', 'orga666', 'orga666'),
	(12, 'Peru', 'Tacna', 'Tacna'),
	(13, 'PerÃº', 'Tacna', 'Augusto B. '),
	(14, 'Peru', 'Tacna', 'Tacna'),
	(15, 'EEUU', 'Tacn', 'Av sapo'),
	(16, 'PERÃ', 'Tacna', 'Av. Tacna'),
	(17, 'PERÃ', 'Tacna', 'Municipalidad de Tacna'),
	(18, 'PerÃº ', 'Tacna', 'Av UPT'),
	(19, 'Peru', 'Tacna', 'Av. Central'),
	(20, 'Peru', 'Tacna', 'Av. Las Flores'),
	(21, 'PERU', 'AREQUIPA', 'URB CERRO COLORADO MNZ A LT1 C.PUNO'),
	(22, 'pisos picados', 'nueva', 'casa'),
	(23, 'Peru', 'Tacna', 'Tacna'),
	(24, 'PerÃ¹', 'TAACNA', 'av sapolio');

-- Volcando estructura para tabla db_needu.tbusuario
CREATE TABLE IF NOT EXISTS `tbusuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usuario` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `clave` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbusuario: ~14 rows (aproximadamente)
REPLACE INTO `tbusuario` (`idusuario`, `rol`, `usuario`, `clave`, `estado`) VALUES
	(12, 'organizacion', 'qwe', 'qwe', b'1'),
	(13, 'voluntario', 'asd', 'asd', b'1'),
	(14, 'admin', 'admin', '123', b'1'),
	(15, 'voluntario', 'NanoMalo', '12345', b'0'),
	(16, 'organizacion', 'Ricardo', '1234', b'1'),
	(17, 'voluntario', 'Albert', '1234', b'1'),
	(18, 'organizacion', 'Erick', '1234', b'1'),
	(19, 'organizacion', 'Elard', '1234', b'1'),
	(20, 'organizacion', 'Organizador', '1234', b'1'),
	(21, 'voluntario', 'Voluntario', '1234', b'1'),
	(22, 'voluntario', 'ARBODX', '1234', b'1'),
	(23, 'voluntario', 'jesus', '123', b'1'),
	(24, 'voluntario', 'user123', '1234', b'1'),
	(25, 'voluntario', 'palbert123', '1234', b'1');

-- Volcando estructura para tabla db_needu.tbvoluntario
CREATE TABLE IF NOT EXISTS `tbvoluntario` (
  `idvoluntario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellido` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `genero` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `correo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecharegistro` date DEFAULT NULL,
  `idusuario` int DEFAULT NULL,
  `idhabilidad` int DEFAULT NULL,
  `idinteres` int DEFAULT NULL,
  `idubicacion` int DEFAULT NULL,
  PRIMARY KEY (`idvoluntario`),
  KEY `FK_tbvoluntario_tbusuario` (`idusuario`),
  KEY `FK_tbvoluntario_tbhabilidad` (`idhabilidad`),
  KEY `FK_tbvoluntario_tbinteres` (`idinteres`),
  KEY `FK_tbvoluntario_tbubicacion` (`idubicacion`),
  CONSTRAINT `FK_tbvoluntario_tbhabilidad` FOREIGN KEY (`idhabilidad`) REFERENCES `tbhabilidad` (`idhabilidad`),
  CONSTRAINT `FK_tbvoluntario_tbinteres` FOREIGN KEY (`idinteres`) REFERENCES `tbinteres` (`idinteres`),
  CONSTRAINT `FK_tbvoluntario_tbubicacion` FOREIGN KEY (`idubicacion`) REFERENCES `tbubicacion` (`idubicacion`),
  CONSTRAINT `FK_tbvoluntario_tbusuario` FOREIGN KEY (`idusuario`) REFERENCES `tbusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_needu.tbvoluntario: ~7 rows (aproximadamente)
REPLACE INTO `tbvoluntario` (`idvoluntario`, `nombre`, `apellido`, `genero`, `edad`, `correo`, `fecharegistro`, `idusuario`, `idhabilidad`, `idinteres`, `idubicacion`) VALUES
	(3, 'asd', 'asd', 'Masculino', 22, 'asd', '2023-11-16', 13, NULL, NULL, 13),
	(4, 'Mauriccio', 'Unaplay', 'Masculino', 32, 'bbcito@gmail.com', '2023-11-19', 15, NULL, NULL, 14),
	(5, 'Albert kenyi', 'Apaza Ccalle ', 'Masculino', 18, 'apazadsa@gmail.com', '2023-11-19', 17, NULL, NULL, 16),
	(6, 'Jose', 'Gutierrez', 'Masculino', 19, 'JoseGu@gmail.com', '2023-11-19', 21, NULL, NULL, 20),
	(7, 'ALMA ', 'MARCELA GOSO', 'Masculino', 20, 'ARBODX@GMAIL.COM', '2023-11-19', 22, NULL, NULL, 21),
	(8, 'jesus', 'huallpa', 'Masculino', 20, 'jh@gmail.com', '2023-11-20', 23, NULL, NULL, 22),
	(9, 'Marucciio', 'Fangostinii', 'Masculino', 25, 'papi@gmail.com', '2023-11-24', 24, NULL, NULL, 23),
	(10, 'Albert', 'Apaza', 'Masculino', 19, 'apaza@upt.pe', '2023-12-04', 25, NULL, NULL, 24);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
