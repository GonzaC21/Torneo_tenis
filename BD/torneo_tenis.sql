-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 25-09-2024 a las 23:44:30
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `torneo_tenis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) COLLATE utf8mb3_spanish_ci NOT NULL,
  `edad_min` int NOT NULL,
  `edad_max` int NOT NULL,
  `sexo` varchar(15) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `edad_min`, `edad_max`, `sexo`) VALUES
(1, 'Damas A', 18, 34, 'Femenino'),
(2, 'Damas B', 35, 45, 'Femenino'),
(3, 'Damas C', 46, 100, 'Femenino'),
(4, 'Caballeros A', 18, 34, 'Masculino'),
(5, 'Caballeros B', 35, 50, 'Masculino'),
(6, 'Caballeros C', 51, 100, 'Masculino'),
(7, 'Juveniles Varones', 13, 17, 'Masculino'),
(8, 'Juveniles Mujeres', 13, 17, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
CREATE TABLE IF NOT EXISTS `inscripciones` (
  `num_inscripcion` int NOT NULL AUTO_INCREMENT,
  `fecha_inscripcion` date NOT NULL,
  `abono_insc` tinyint(1) NOT NULL,
  `fk_categoria` int NOT NULL,
  `fk_participante` int NOT NULL,
  PRIMARY KEY (`num_inscripcion`),
  KEY `fk_categoria` (`fk_categoria`),
  KEY `fk_participante` (`fk_participante`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`num_inscripcion`, `fecha_inscripcion`, `abono_insc`, `fk_categoria`, `fk_participante`) VALUES
(1, '2024-09-01', 1, 1, 1),
(2, '2024-09-02', 0, 2, 2),
(3, '2024-09-03', 1, 2, 3),
(4, '2024-09-04', 1, 1, 4),
(5, '2024-09-05', 0, 1, 5),
(6, '2024-09-06', 1, 2, 6),
(7, '2024-09-07', 1, 1, 7),
(8, '2024-09-08', 0, 4, 8),
(9, '2024-09-09', 1, 5, 9),
(10, '2024-09-10', 1, 4, 10),
(11, '2024-09-11', 0, 4, 11),
(12, '2024-09-12', 1, 5, 12),
(13, '2024-09-13', 1, 6, 13),
(14, '2024-09-14', 1, 4, 14),
(15, '2024-09-15', 0, 5, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

DROP TABLE IF EXISTS `participantes`;
CREATE TABLE IF NOT EXISTS `participantes` (
  `id_participante` int NOT NULL AUTO_INCREMENT,
  `dni_participante` varchar(12) COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellido` varchar(25) COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `edad` int NOT NULL,
  `telefono` int NOT NULL,
  `sexo` varchar(15) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id_participante`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `participantes`
--

INSERT INTO `participantes` (`id_participante`, `dni_participante`, `apellido`, `nombre`, `direccion`, `edad`, `telefono`, `sexo`) VALUES
(1, '35987654', 'Pérez', 'Lucía', 'Calle Falsa 123', 25, 2147483647, 'Femenino'),
(2, '32765432', 'González', 'María', 'Av. Libertad 456', 30, 1156789123, 'Femenino'),
(3, '29543218', 'Rodríguez', 'Sofía', 'Calle Los Pinos 789', 42, 1167891234, 'Femenino'),
(4, '40876543', 'Martínez', 'Carla', 'Boulevard Mitre 321', 19, 2147483647, 'Femenino'),
(5, '41987654', 'Fernández', 'Elena', 'Pasaje San Martín 654', 34, 1167894321, 'Femenino'),
(6, '28432109', 'López', 'Gabriela', 'Calle 14 987', 38, 1156789345, 'Femenino'),
(7, '41765432', 'Ramírez', 'Ana', 'Calle Corrientes 321', 27, 2147483647, 'Femenino'),
(8, '37654321', 'Sánchez', 'Ignacio', 'Av. Independencia 432', 32, 2147483647, 'Masculino'),
(9, '34567890', 'Herrera', 'Joaquín', 'Calle Belgrano 876', 45, 1167890123, 'Masculino'),
(10, '39432187', 'Gómez', 'Santiago', 'Av. Rivadavia 654', 28, 2147483647, 'Masculino'),
(11, '31567892', 'Torres', 'Mateo', 'Calle Alsina 987', 21, 1156789432, 'Masculino'),
(12, '35678901', 'Silva', 'Lucas', 'Calle Mendoza 543', 40, 2147483647, 'Masculino'),
(13, '40678923', 'Moreno', 'Tomás', 'Av. San Juan 123', 50, 2147483647, 'Masculino'),
(14, '42567890', 'Castro', 'Francisco', 'Calle Moreno 456', 18, 1167890345, 'Masculino'),
(15, '32789012', 'Álvarez', 'Nicolás', 'Calle Entre Ríos 789', 35, 1156789432, 'Masculino');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`fk_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`fk_participante`) REFERENCES `participantes` (`id_participante`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
