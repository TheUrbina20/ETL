-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-04-2019 a las 23:12:35
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = '+00:00';


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacionmateriales`
--


CREATE SCHEMA IF NOT EXISTS hotel_mysql COLLATE= 'utf8_general_ci';

USE  hotel_mysql;

CREATE TABLE `asignacionmateriales` (
  `idAsignacion` int(10) UNSIGNED NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `idHabitacion` int(10) UNSIGNED NOT NULL,
  `idMaterial` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `asignacionmateriales`
--

INSERT INTO `asignacionmateriales` (`idAsignacion`, `Cantidad`, `idHabitacion`, `idMaterial`) VALUES
(1, 1, 1, 28),
(2, 1, 1, 29),
(3, 1, 1, 30),
(4, 1, 1, 31),
(5, 1, 1, 21),
(6, 1, 2, 19),
(7, 2, 2, 21),
(8, 1, 2, 22),
(9, 1, 2, 24),
(10, 1, 2, 26),
(11, 1, 3, 19),
(12, 2, 3, 21),
(13, 1, 3, 22),
(14, 1, 3, 24),
(15, 1, 3, 26),
(16, 3, 4, 21),
(17, 1, 4, 22),
(18, 1, 4, 24),
(19, 1, 4, 26),
(20, 1, 4, 28),
(21, 1, 4, 29),
(22, 1, 4, 30),
(23, 1, 4, 31),
(24, 3, 5, 21),
(25, 1, 5, 22),
(26, 1, 5, 24),
(27, 1, 5, 26),
(28, 1, 5, 28),
(29, 1, 5, 29),
(30, 1, 5, 30),
(31, 1, 5, 31),
(32, 4, 6, 21),
(33, 1, 6, 20),
(34, 1, 6, 23),
(35, 1, 6, 25),
(36, 1, 6, 27),
(37, 6, 7, 21),
(38, 1, 7, 19),
(39, 1, 7, 22),
(40, 1, 7, 24),
(41, 1, 7, 26),
(42, 1, 7, 20),
(43, 1, 7, 23),
(44, 1, 7, 25),
(45, 1, 7, 27),
(46, 4, 8, 21),
(47, 1, 8, 20),
(48, 1, 8, 23),
(49, 1, 8, 25),
(50, 1, 9, 28),
(51, 1, 9, 29),
(52, 1, 9, 30),
(53, 1, 9, 31),
(54, 1, 9, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(10) UNSIGNED NOT NULL,
  `Nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ApellidoP` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ApellidoM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Correo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EntidadFederativa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `Nombres`, `ApellidoP`, `ApellidoM`, `Correo`, `EntidadFederativa`) VALUES
(1, 'Jose Ramon ', 'Sanchez ', 'Solorzano', '15460020@itcolima.edu.mx', 'Colima'),
(2, 'Socorro', 'Solorzano1', 'Cortes', 'socorro@gmail.com', 'Chiapas'),
(3, 'Veida', 'Vega', 'Solorzano8', 'veida_123@hotmail.com', 'Campeche'),
(4, 'Dora', 'Jimenez', 'Cortes', 'dora@gmail.com', 'Aguascalientes'),
(5, 'Maria', 'Larios', 'Espinoza', 'maria.le@gmail.com', 'Guerrero'),
(6, 'Sile$m', 'Cardenaz', 'Mendoza', 'silem.cm@gmail.com', 'Jalisco'),
(7, 'Marcela', 'Reyes', 'Larios', 'marce@hotmail.com', 'M?xico'),
(8, 'Maria', 'Jimenez', 'Cortes', 'maria.jc@gmail.com', 'Morelos'),
(9, 'Juana', 'Lopez', 'Reyna', 'reina@gmail.com', 'Puebla#'),
(10, 'Diana', 'Cuevas', 'Perez', 'diana.cuevas@hotmail.com', 'Colima'),
(11, 'Petra)', 'Alavarez', 'Cabrera ', 'petra@gmail.com', 'Oaxaca'),
(12, 'America', 'Vega', 'Silva', 'silva.gol@gmail.com', 'Colima'),
(13, 'Francia', 'Flores', 'Flores', 'dos.flores@hotmail.com', 'Sinaloa'),
(14, 'Emilio', 'Renteria ', 'Hernandez', 'verano@gmail.com', 'Colima'),
(15, 'Perla', 'Valencia', 'Olvera#', 'florez@hotmail.com', 'Colima'),
(16, 'Eduardo', 'Vadillo', 'Vadillo', 'primo.traumo@gmail.com', 'Colima'),
(17, 'Pascual', 'Valencia', 'Verduzco', 'pascual@gmail.com', 'Oaxaca'),
(18, 'Cesar', 'Reyes', 'Sanchez', 'cesarin@hotmail.com', 'Colima'),
(19, 'Reyes', 'Sanchez ', 'Reyna', 'sanchez.r@gmail.com', 'Guerrero'),
(20, 'Julio', 'Cortez9', 'Zamano', 'samano@gmail.com', 'Colima'),
(21, 'Pedro', 'Juarez', 'Alvarado', 'pedro.jua@hotmail.com', 'Colima'),
(22, 'Maria', 'Cardenaz', 'Sanchez', 'maria.kasa@gmail.com', 'Colima'),
(23, 'Jose', 'Vega4', 'Vega', 'jose.vv@gmail.com', 'Colima'),
(24, 'Carmen', 'Solano', 'Ramirez', 'carmensolano@gmail.com', 'Colima'),
(25, 'Carla', 'Bautista', 'Vera', 'vera.carla@gmail.com', 'Colima'),
(26, 'Karla3', 'Larios', 'Dias', 'karla233@gmail.com', 'Colima'),
(27, 'Pablo', 'Zamora', 'Cortes', 'pablo123@hotmail.com', 'Colima'),
(28, 'Ernesto', 'Dominguez', 'Dias', 'dias3695@gmail.com', 'Colima'),
(29, 'Andres', 'Moran', 'Duarte', 'andres.199@gmail.com', 'Colima'),
(30, 'David', 'Flores', 'Sanchez', 'david.sanchez@gmail.com', 'Colima3'),
(31, 'Miguel4 ', 'Urbina', 'Perez', 'urbina123@gmail.com', 'Colima'),
(32, 'Braulio', 'Gutierres', 'Rojas', 'braulio.rojas@gmail.com', 'Colima'),
(33, 'Nivaldo', 'Qui?ones', 'Garcia', 'gym.nivitriz@gmail.com', 'Colima'),
(34, 'Hugo', 'Batista', 'Cruz', 'barba89@gmail.com', 'Colima'),
(35, 'Enrike6', 'Ramirez', 'Reyna', 'enrique1236@gmail.com', 'Colima');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefacturas`
--

CREATE TABLE `detallefacturas` (
  `idDetalle` int(10) UNSIGNED NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Total` double NOT NULL,
  `idFactura` int(10) UNSIGNED NOT NULL,
  `idServicioH` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detallefacturas`
--

INSERT INTO `detallefacturas` (`idDetalle`, `Cantidad`, `Total`, `idFactura`, `idServicioH`) VALUES
(1, 1, 20, 1, 1),
(2, 1, 20, 12, 2),
(3, 1, 25, 13, 3),
(4, 1, 25, 14, 4),
(5, 1, 120, 15, 5),
(6, 1, 20, 16, 6),
(7, 1, 20, 17, 7),
(8, 1, 25, 18, 8),
(9, 1, 25, 19, 9),
(10, 1, 120, 20, 10),
(11, 1, 20, 21, 11),
(12, 1, 20, 22, 12),
(13, 1, 25, 23, 13),
(14, 1, 25, 24, 14),
(15, 1, 120, 25, 15),
(16, 1, 20, 26, 16),
(17, 1, 20, 27, 17),
(18, 1, 25, 28, 18),
(19, 1, 25, 29, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dhabitaciones`
--

CREATE TABLE `dhabitaciones` (
  `idTipo` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dhabitaciones`
--

INSERT INTO `dhabitaciones` (`idTipo`, `Nombre`, `Precio`) VALUES
(1, 'Individual', 600),
(2, 'Doble de Uso Indibidual', 700),
(3, 'Doble', 1000),
(4, 'Con Cama Supletoria', 1200),
(5, 'Triple', 1500),
(6, ' Junior Suites', 2000),
(7, 'Suites', 3000),
(8, 'Suite Nupcial', 3500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dmantenimientoequipos`
--

CREATE TABLE `dmantenimientoequipos` (
  `idDetalle` int(10) UNSIGNED NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaTermino` date NOT NULL,
  `idEquipoH` int(10) UNSIGNED NOT NULL,
  `idMantenimientoE` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dmantenimientoequipos`
--

INSERT INTO `dmantenimientoequipos` (`idDetalle`, `FechaInicio`, `FechaTermino`, `idEquipoH`, `idMantenimientoE`, `idEmpleado`) VALUES
(1, '2017-01-01', '2017-01-05', 10, 1, 1),
(2, '2017-01-01', '2017-01-05', 23, 2, 2),
(3, '2017-01-01', '2017-01-05', 24, 1, 4),
(4, '2017-01-01', '2017-01-05', 30, 2, 3),
(5, '2017-01-01', '2017-01-05', 10, 1, 1),
(6, '2017-01-01', '2017-01-05', 23, 2, 2),
(7, '2017-01-01', '2017-01-05', 24, 1, 2),
(8, '2017-01-01', '2017-01-05', 30, 2, 1),
(9, '2017-02-05', '2017-02-07', 1, 1, 4),
(10, '2017-02-05', '2017-02-07', 4, 2, 2),
(11, '2017-02-05', '2017-02-07', 11, 1, 3),
(12, '2017-02-05', '2017-02-07', 12, 2, 1),
(13, '2017-02-05', '2017-02-07', 16, 1, 2),
(14, '2017-02-05', '2017-02-07', 20, 2, 1),
(15, '2017-02-05', '2017-02-07', 25, 1, 4),
(16, '2017-02-05', '2017-02-07', 26, 2, 1),
(17, '2017-02-05', '2017-02-07', 31, 1, 2),
(18, '2017-02-05', '2017-02-07', 32, 2, 1),
(19, '2017-03-01', '2017-03-03', 1, 1, 4),
(20, '2017-03-01', '2017-03-03', 4, 2, 2),
(21, '2017-03-01', '2017-03-03', 11, 1, 1),
(22, '2017-03-01', '2017-03-03', 12, 1, 2),
(23, '2017-03-01', '2017-03-03', 16, 2, 1),
(24, '2017-03-01', '2017-03-03', 20, 1, 2),
(25, '2017-03-01', '2017-03-03', 25, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dmantenimientohabitaciones`
--

CREATE TABLE `dmantenimientohabitaciones` (
  `idDetalle` int(10) UNSIGNED NOT NULL,
  `Descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaTermino` date NOT NULL,
  `idHabitacion` int(10) UNSIGNED NOT NULL,
  `idMatenimientoH` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dmantenimientohabitaciones`
--

INSERT INTO `dmantenimientohabitaciones` (`idDetalle`, `Descripcion`, `FechaInicio`, `FechaTermino`, `idHabitacion`, `idMatenimientoH`, `idEmpleado`) VALUES
(1, 'Remodelacion', '2018-09-01', '2018-09-05', 1, 1, 1),
(2, 'Pintado', '2018-09-05', '2018-09-08', 2, 1, 2),
(3, 'Pintado', '2018-09-05', '2018-09-08', 4, 1, 4),
(4, 'Remodelacion', '2018-09-01', '2018-09-05', 5, 2, 5),
(5, 'Pintado', '2018-09-05', '2018-09-08', 10, 2, 1),
(6, 'Cambio de losetas', '2019-09-10', '2018-09-15', 20, 1, 2),
(7, 'Remodelacion', '2018-09-01', '2018-09-05', 15, 1, 1),
(8, 'Pintado', '2018-09-05', '2018-09-08', 12, 2, 2),
(9, 'Cambio de losetas', '2019-09-10', '2018-09-15', 13, 1, 3),
(10, 'Remodelacion', '2018-09-01', '2018-09-05', 45, 2, 2),
(11, 'Pintado', '2018-09-05', '2018-09-08', 30, 1, 1),
(12, 'Cambio de losetas', '2019-09-10', '2018-09-15', 16, 2, 1),
(13, 'Pintado', '2018-09-05', '2018-09-08', 34, 2, 2),
(14, 'Cambio de losetas', '2019-09-10', '2018-09-15', 13, 1, 1),
(15, 'Remodelacion', '2018-09-01', '2018-09-05', 14, 1, 2),
(16, 'Cambio de losetas', '2019-09-10', '2018-09-15', 21, 2, 2),
(17, 'Cambio de losetas', '2019-09-10', '2018-09-15', 22, 1, 2),
(18, 'Cambio de losetas', '2019-09-10', '2018-09-15', 23, 2, 3),
(19, 'Remodelacion', '2018-09-01', '2018-09-05', 24, 1, 3),
(20, 'Cambio de losetas', '2019-09-10', '2018-09-15', 25, 2, 3),
(21, 'Pintado', '2018-09-05', '2018-09-08', 26, 1, 1),
(22, 'Cambio de losetas', '2019-09-10', '2018-09-15', 27, 2, 2),
(23, 'Remodelacion', '2018-09-01', '2018-09-05', 33, 1, 1),
(24, 'Cambio de losetas', '2019-09-10', '2018-09-15', 42, 2, 2),
(25, 'Remodelacion', '2018-09-01', '2018-09-05', 46, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dordenes`
--

CREATE TABLE `dordenes` (
  `idDetalle` int(10) UNSIGNED NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `idOrden` int(10) UNSIGNED NOT NULL,
  `idMaterial` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dordenes`
--

INSERT INTO `dordenes` (`idDetalle`, `Cantidad`, `idOrden`, `idMaterial`) VALUES
(1, 20, 1, 2),
(2, 2, 1, 7),
(3, 5, 2, 10),
(4, 20, 2, 5),
(5, 50, 3, 1),
(6, 50, 3, 3),
(7, 5, 4, 6),
(8, 5, 4, 8),
(9, 50, 5, 4),
(10, 5, 5, 9),
(11, 5, 6, 10),
(12, 50, 6, 1),
(13, 5, 7, 6),
(14, 3, 7, 7),
(15, 20, 8, 4),
(16, 3, 8, 8),
(17, 10, 9, 5),
(18, 2, 9, 10),
(19, 1, 10, 12),
(20, 10, 10, 2),
(21, 3, 11, 12),
(22, 15, 11, 4),
(23, 2, 12, 8),
(24, 20, 12, 13),
(25, 10, 13, 2),
(26, 20, 13, 3),
(27, 5, 14, 6),
(28, 2, 14, 7),
(29, 3, 15, 9),
(30, 3, 15, 10),
(31, 3, 16, 8),
(32, 10, 16, 5),
(33, 2, 17, 13),
(34, 2, 17, 12),
(35, 10, 18, 4),
(36, 20, 18, 1),
(37, 1, 19, 12),
(38, 1, 19, 13),
(39, 2, 20, 11),
(40, 5, 20, 6),
(41, 2, 21, 7),
(42, 10, 21, 3),
(43, 20, 22, 2),
(44, 10, 22, 4),
(45, 3, 23, 12),
(46, 2, 23, 13),
(47, 3, 24, 15),
(48, 3, 24, 14),
(49, 2, 25, 10),
(50, 2, 25, 9),
(51, 10, 26, 4),
(52, 10, 26, 2),
(53, 2, 27, 12),
(54, 2, 27, 8),
(55, 2, 28, 15),
(56, 1, 28, 11),
(57, 20, 29, 2),
(58, 2, 29, 7),
(59, 5, 30, 10),
(60, 20, 30, 5),
(61, 50, 31, 1),
(62, 50, 31, 3),
(63, 5, 32, 6),
(64, 5, 32, 8),
(65, 50, 33, 4),
(66, 5, 33, 9),
(67, 5, 34, 10),
(68, 50, 34, 1),
(69, 5, 35, 6),
(70, 3, 35, 7),
(71, 20, 36, 4),
(72, 3, 36, 8),
(73, 10, 37, 5),
(74, 2, 37, 10),
(75, 1, 38, 12),
(76, 10, 38, 2),
(77, 3, 39, 12),
(78, 15, 39, 4),
(79, 2, 40, 8),
(80, 20, 40, 13),
(81, 10, 41, 2),
(82, 20, 41, 3),
(83, 5, 42, 6),
(84, 2, 42, 7),
(85, 3, 43, 9),
(86, 3, 43, 10),
(87, 3, 44, 8),
(88, 10, 44, 5),
(89, 2, 45, 13),
(90, 2, 45, 12),
(91, 10, 46, 4),
(92, 20, 46, 1),
(93, 1, 47, 12),
(94, 1, 47, 13),
(95, 2, 48, 11),
(96, 5, 48, 6),
(97, 2, 49, 7),
(98, 10, 49, 3),
(99, 20, 50, 2),
(100, 10, 50, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FechaNa` date NOT NULL,
  `Telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idTipo` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `Nombre`, `FechaNa`, `Telefono`, `idTipo`) VALUES
(1, 'Carlos Omar S?nchez Sol?rzano8', '1980-09-16', '3121698745', 1),
(2, 'Pedro Garcia Guzman', '1991-01-21', '312156987', 1),
(3, 'Karla Vega Vega', '1993-03-03', '3121025487', 1),
(4, 'Cinthya Medrano Maldonado', '1991-06-25', '3121658974', 1),
(5, 'Gabriela Ramirez Rodriguez', '1990-01-15', '3121697841', 1),
(6, 'Romina Lamina Canina0', '1991-10-21', '3121288856', 2),
(7, 'Grecia Torres Altas', '1996-01-01', '3121694585p', 2),
(8, 'Cinthya Maria Larios Flores', '1996-02-02', '3121369785', 2),
(9, 'Vanesa Mesa Santos3', '1996-08-23', '3121239421', 2),
(10, 'Valentina Rosas Ramos', '1991-09-03', '3126987451', 2),
(11, 'Norma Contreras Mesa', '1993-05-16', '312695458', 2),
(12, 'Maria Guadalupe Estrada', '1998-08-16', '3126984526', 2),
(13, 'Ximena Ramos Farias', '1990-12-09', '3123452697', 2),
(14, 'Zoe Cuevaz', '1992-06-06', '3123698796', 2),
(15, 'Zoila del Rincon Ruiz6', '1997-08-23', '3121831551', 2),
(16, 'Alejandra Vega Solorzano', '2000-03-20', '3123691230', 2),
(17, 'Maria Jose Rubio', '1993-03-03', '3125894523', 2),
(18, 'Josefina Sierra Mota', '1996-08-01', '3126541236*', 2),
(19, 'Maria de Jesus Cuevas', '1992-12-12', '3125416983', 2),
(20, 'Maria Camila Remedios$', '1992-08-05', '3126974511', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipohabitaciones`
--

CREATE TABLE `equipohabitaciones` (
  `idEquipoH` int(10) UNSIGNED NOT NULL,
  `idEquipo` int(10) UNSIGNED NOT NULL,
  `idHabitacion` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `equipohabitaciones`
--

INSERT INTO `equipohabitaciones` (`idEquipoH`, `idEquipo`, `idHabitacion`) VALUES
(1, 3, 1),
(2, 2, 1),
(3, 5, 1),
(4, 4, 2),
(5, 2, 2),
(6, 6, 2),
(7, 4, 3),
(8, 2, 3),
(9, 6, 3),
(10, 2, 4),
(11, 3, 4),
(12, 4, 4),
(13, 5, 4),
(14, 6, 4),
(15, 2, 5),
(16, 4, 5),
(17, 3, 5),
(18, 5, 5),
(19, 6, 5),
(20, 3, 6),
(21, 3, 6),
(22, 7, 6),
(23, 1, 6),
(24, 1, 7),
(25, 3, 7),
(26, 3, 7),
(27, 4, 7),
(28, 6, 7),
(29, 7, 7),
(30, 1, 8),
(31, 3, 8),
(32, 3, 8),
(33, 2, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `idEquipo` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`idEquipo`, `Nombre`) VALUES
(1, 'Aire Acondicionado'),
(2, 'Ventilador de techo'),
(3, 'Base individual'),
(4, 'Base matriminial'),
(5, 'Colchon Individual'),
(6, 'Colchon Matrimonial'),
(7, 'Colchon King siza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFactura` int(10) UNSIGNED NOT NULL,
  `Tipopago` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TotalxRenta` double NOT NULL,
  `TotalxServicios` double NOT NULL,
  `Subtotal` double NOT NULL,
  `Total` double NOT NULL,
  `idCliente` int(10) UNSIGNED NOT NULL,
  `idRenta` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFactura`, `Tipopago`, `TotalxRenta`, `TotalxServicios`, `Subtotal`, `Total`, `idCliente`, `idRenta`, `idEmpleado`) VALUES
(1, 'Contado3', 16000, 20, 16020, 18583.2, 1, 1, 1),
(2, 'Contado', 16000, 0, 16000, 18560, 10, 2, 2),
(3, 'Contado', -39000, 0, 39000, 45240, 15, 3, 1),
(4, 'Contado', 6750, 0, 6750, 7830, 20, 4, 3),
(5, 'Contado', 30000, 0, 30000, -34800, 5, 5, 4),
(6, 'Contado', 4950, 0, 4950, 5742, 6, 6, 5),
(7, 'Contado', 23400, 0, 23400, 27144, 7, 7, 1),
(8, 'Contado', 30000, 0, 30000, 34800, 8, 8, 2),
(9, 'Contado', 11700, 0, 11700, 13572, 11, 9, 1),
(10, 'Contado', 12000, 0, 12000, 13920, 12, 10, 2),
(11, 'Contado', -12000, 0, 12000, 13920, 13, 11, 3),
(12, 'Contado', 3000, 20, 3020, 3503.2, 2, 12, 1),
(13, 'Contado', 2800, 25, 2825, 3277, 3, 13, 2),
(14, 'Contado', 4000, 25, 4025, 4669, 4, 14, 3),
(15, 'Contado', 4800, 120, 4920, 5707.2, 5, 15, 4),
(16, 'Contado', 7500, 20, 7520, 8723.2, 6, 16, 1),
(17, 'Contado8', 10000, 20, 10020, 11623.2, 7, 17, 2),
(18, 'Contado', 18000, 25, 18025, 20909, 8, 18, 3),
(19, 'Contado', 21000, 25, 21025, 24389, 9, 19, 4),
(20, 'Contado', 3600, 120, 3720, -4315.2, 10, 20, 1),
(21, 'Contado', 3500, 20, 3520, 4083.2, 20, 21, 2),
(22, 'Contado', 5000, 20, 5020, 5823.2, 19, 22, 3),
(23, 'Credito', 6000, 25, 6025, 6989, 18, 23, 4),
(24, 'Credito', 9000, 25, 9025, 10469, 17, 24, 1),
(25, 'Credito', -12000, 120, 12120, 14059.2, 1, 25, 2),
(26, 'Credito', 18000, 20, 18020, 20903.2, 2, 26, 3),
(27, 'Credito', 21000, 20, 21020, 24383.2, 3, 27, 4),
(28, 'Credito', 3600, 25, 3625, 4205, 4, 28, 1),
(29, 'Credito', 4200, 25, 4225, 4901, 5, 29, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

CREATE TABLE `habitaciones` (
  `idHabitacion` int(10) UNSIGNED NOT NULL,
  `Estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idTipo` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`idHabitacion`, `Estado`, `idTipo`) VALUES
(1, 'Activa', 1),
(2, 'Activa', 2),
(3, 'Activa', 3),
(4, 'Activa', 4),
(5, 'Activa', 5),
(6, 'Activa', 6),
(7, 'Activa', 7),
(8, 'Activa', 8),
(9, 'Activa', 1),
(10, 'Activa', 2),
(11, 'Activa', 3),
(12, 'Activa', 4),
(13, 'Activa', 5),
(14, 'Activa', 6),
(15, 'Activa', 7),
(16, 'Activa', 8),
(17, 'Activa', 1),
(18, 'Activa', 2),
(19, 'Activa', 3),
(20, 'Activa', 4),
(21, 'Activa', 5),
(22, 'Activa', 6),
(23, 'Activa', 7),
(24, 'Activa', 8),
(25, 'Activa', 1),
(26, 'Activa', 2),
(27, 'Activa', 3),
(28, 'Activa', 4),
(29, 'Activa', 5),
(30, 'Activa', 6),
(31, 'Activa', 7),
(32, 'Activa', 8),
(33, 'Activa', 1),
(34, 'Activa', 2),
(35, 'Activa', 3),
(36, 'Activa', 4),
(37, 'Activa', 5),
(38, 'Activa', 6),
(39, 'Activa', 7),
(40, 'Activa', 8),
(41, 'Activa', 1),
(42, 'Activa', 2),
(43, 'Activa', 3),
(44, 'Activa', 4),
(45, 'Activa', 5),
(46, 'Activa', 6),
(47, 'Activa', 7),
(48, 'Activa', 8),
(49, 'Activa', 1),
(50, 'Activa', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacionesrentadas`
--

CREATE TABLE `habitacionesrentadas` (
  `idHabitacionR` int(10) UNSIGNED NOT NULL,
  `idRenta` int(10) UNSIGNED NOT NULL,
  `idHabitacion` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `habitacionesrentadas`
--

INSERT INTO `habitacionesrentadas` (`idHabitacionR`, `idRenta`, `idHabitacion`) VALUES
(1, 1, 8),
(2, 2, 1),
(3, 2, 10),
(4, 2, 11),
(5, 2, 12),
(6, 3, 15),
(7, 3, 16),
(8, 3, 17),
(9, 3, 18),
(10, 3, 20),
(11, 4, 30),
(12, 4, 31),
(13, 4, 32),
(14, 5, 40),
(15, 5, 41),
(16, 5, 42),
(17, 6, 21),
(18, 6, 22),
(19, 6, 23),
(20, 7, 45),
(21, 7, 46),
(22, 7, 47),
(23, 7, 25),
(24, 7, 26),
(25, 8, 1),
(26, 8, 2),
(27, 8, 3),
(28, 9, 4),
(29, 9, 5),
(30, 9, 6),
(31, 10, 7),
(32, 10, 8),
(33, 10, 9),
(34, 11, 10),
(35, 11, 11),
(36, 11, 12),
(37, 12, 1),
(38, 13, 2),
(39, 14, 3),
(40, 15, 4),
(41, 16, 5),
(42, 17, 6),
(43, 18, 7),
(44, 19, 8),
(45, 20, 9),
(46, 21, 10),
(47, 22, 11),
(48, 23, 12),
(49, 24, 13),
(50, 25, 14),
(51, 26, 15),
(52, 27, 16),
(53, 28, 17),
(54, 29, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacionreservada`
--

CREATE TABLE `habitacionreservada` (
  `idHabitacionR` int(10) UNSIGNED NOT NULL,
  `idReservacion` int(10) UNSIGNED NOT NULL,
  `idHabitacion` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `habitacionreservada`
--

INSERT INTO `habitacionreservada` (`idHabitacionR`, `idReservacion`, `idHabitacion`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 2, 8),
(7, 3, 20),
(8, 4, 40),
(9, 4, 41),
(10, 4, 42),
(11, 5, 6),
(12, 5, 7),
(13, 5, 21),
(14, 6, 22),
(15, 6, 23),
(16, 6, 25),
(17, 7, 15),
(18, 8, 30),
(19, 8, 31),
(20, 8, 32),
(21, 9, 43),
(22, 9, 44),
(23, 9, 10),
(24, 10, 11),
(25, 11, 45),
(26, 11, 46),
(27, 11, 47),
(28, 11, 12),
(29, 12, 2),
(30, 13, 1),
(31, 13, 3),
(32, 13, 4),
(33, 14, 5),
(34, 14, 6),
(35, 14, 7),
(36, 15, 8),
(37, 15, 9),
(38, 15, 10),
(39, 16, 11),
(40, 17, 12),
(41, 17, 13),
(42, 17, 14),
(43, 17, 15),
(44, 18, 50),
(45, 18, 16),
(46, 19, 8),
(47, 20, 30),
(48, 20, 31),
(49, 20, 32),
(50, 20, 33),
(51, 21, 8),
(52, 21, 16),
(53, 21, 1),
(54, 22, 2),
(55, 22, 3),
(56, 22, 4),
(57, 23, 5),
(58, 23, 6),
(59, 23, 7),
(60, 24, 10),
(61, 24, 11),
(62, 24, 12),
(63, 25, 8),
(64, 25, 16),
(65, 26, 20),
(66, 27, 1),
(67, 27, 2),
(68, 27, 3),
(69, 28, 5),
(70, 29, 21),
(71, 29, 22),
(72, 30, 23),
(73, 31, 24),
(74, 32, 25),
(75, 33, 26),
(76, 33, 27),
(77, 34, 28),
(78, 35, 29),
(79, 36, 30),
(80, 37, 31),
(81, 38, 32),
(82, 39, 33),
(83, 40, 34),
(84, 41, 35),
(85, 42, 37),
(86, 43, 38),
(87, 44, 39),
(88, 45, 40),
(89, 46, 41),
(90, 47, 42),
(91, 48, 43),
(92, 49, 44),
(93, 50, 45),
(94, 50, 46);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicoservicios`
--

CREATE TABLE `historicoservicios` (
  `idHistorico` int(10) UNSIGNED NOT NULL,
  `Precio` double NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaTermino` date NOT NULL,
  `idServicio` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historicoservicios`
--

INSERT INTO `historicoservicios` (`idHistorico`, `Precio`, `FechaInicio`, `FechaTermino`, `idServicio`) VALUES
(1, 20, '2017-12-30', '0000-00-00', 1),
(2, 25, '2017-12-30', '0000-00-00', 2),
(3, 25, '2017-12-30', '0000-00-00', 3),
(4, 120, '2017-12-30', '0000-00-00', 4),
(5, 20, '2017-12-30', '0000-00-00', 5),
(6, 250, '2017-12-30', '0000-00-00', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicoturnos`
--

CREATE TABLE `historicoturnos` (
  `idHistorico` int(10) UNSIGNED NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaTermino` date DEFAULT NULL,
  `idTurno` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historicoturnos`
--

INSERT INTO `historicoturnos` (`idHistorico`, `FechaInicio`, `FechaTermino`, `idTurno`, `idEmpleado`) VALUES
(1, '2017-01-01', '0000-00-00', 1, 1),
(2, '2017-01-01', '0000-00-00', 2, 2),
(3, '2017-01-01', '0000-00-00', 3, 3),
(4, '2017-01-01', '0000-00-00', 1, 4),
(5, '2017-01-01', '0000-00-00', 2, 5),
(6, '2017-01-01', '0000-00-00', 1, 6),
(7, '2017-01-01', '0000-00-00', 1, 7),
(8, '2017-01-01', '0000-00-00', 1, 8),
(9, '2017-01-01', '0000-00-00', 2, 9),
(10, '2017-01-01', '0000-00-00', 2, 10),
(11, '2017-01-01', '0000-00-00', 3, 11),
(12, '2017-01-01', '0000-00-00', 3, 12),
(13, '2017-01-01', '0000-00-00', 1, 13),
(14, '2017-01-01', '0000-00-00', 1, 14),
(15, '2017-01-01', '0000-00-00', 2, 15),
(16, '2017-01-01', '0000-00-00', 2, 16),
(17, '2017-01-01', '0000-00-00', 3, 17),
(18, '2017-01-01', '0000-00-00', 3, 18),
(19, '2017-01-01', '0000-00-00', 1, 19),
(20, '2017-01-01', '0000-00-00', 1, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimientoequipos`
--

CREATE TABLE `mantenimientoequipos` (
  `idMantenimientoE` int(10) UNSIGNED NOT NULL,
  `Tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mantenimientoequipos`
--

INSERT INTO `mantenimientoequipos` (`idMantenimientoE`, `Tipo`) VALUES
(1, 'Mantenimiento'),
(2, 'Reparacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimientohabitaciones`
--

CREATE TABLE `mantenimientohabitaciones` (
  `idMatenimientoH` int(10) UNSIGNED NOT NULL,
  `Tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mantenimientohabitaciones`
--

INSERT INTO `mantenimientohabitaciones` (`idMatenimientoH`, `Tipo`) VALUES
(1, 'Preventivo'),
(2, 'Correctivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE `materiales` (
  `idMaterial` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Max` int(11) NOT NULL,
  `Min` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `materiales`
--

INSERT INTO `materiales` (`idMaterial`, `Nombre`, `Cantidad`, `Max`, `Min`) VALUES
(1, 'Jabon para Manos', -500, 700, 100),
(2, 'Toalla Chicas', 100, 100, 50),
(3, 'Toallas', -200, 300, 50),
(4, 'Shampoo 100 ML', 100, 100, 50),
(5, 'Dispensadores', 100, 100, 50),
(6, 'Jabon en Polvo 6 KG', 10, -20, 5),
(7, 'Suavizante 20 L', 3, 8, 1),
(8, 'Escoba Angular', 5, 10, 3),
(9, 'Trapeador', 3, 10, 3),
(10, 'Recogedor', 4, 10, 3),
(11, 'Ventilador de techo', 2, 5, -1),
(12, 'Papel Higienico pkt 32 pz', 20, 30, 10),
(13, 'Botella de agua 600 mil pkt 24', 40, 100, 50),
(14, 'Guantes de goma ', 20, 20, 5),
(15, 'Bolsas de basura pkt 100 pz', -10, 10, 5),
(16, 'Color 10 L', 100, 100, 50),
(17, 'Fabuloso 10 L', 100, 100, 50),
(18, 'Pinol 10 L', 100, 100, 50),
(19, 'Sabana matrimonial', 50, 50, 30),
(20, 'Sabana king', 50, 50, 30),
(21, 'Fundas', -100, 100, 50),
(22, 'Pie de cama matrimonial', 50, 50, 30),
(23, 'Pie de cama king', 50, 50, 30),
(24, 'Cobertor matrimonial', 50, 50, -30),
(25, 'Cobertor king', 50, 50, 30),
(26, 'Cubre colchon matrimonial', 50, 50, 30),
(27, 'Cubre colchon king', 50, 50, 30),
(28, 'Sabana individual', -50, 50, 30),
(29, 'Pie de cama individual', 50, 50, 30),
(30, 'Cobertor individual', 50, 50, 30),
(31, 'Cubre colchon individual', 50, 50, -30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materialhabitaciones`
--

CREATE TABLE `materialhabitaciones` (
  `idMaterialH` int(10) UNSIGNED NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `idMaterial` int(10) UNSIGNED NOT NULL,
  `idServicioLH` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `materialhabitaciones`
--

INSERT INTO `materialhabitaciones` (`idMaterialH`, `Cantidad`, `idMaterial`, `idServicioLH`) VALUES
(1, 500, 16, 1),
(2, 500, 17, 1),
(3, 500, 18, 1),
(4, 500, 16, 2),
(5, 500, 7, 2),
(6, 200, 6, 2),
(7, 500, 18, 3),
(8, 500, 16, 3),
(9, 500, 16, 4),
(10, 500, 17, 4),
(11, 500, 18, 4),
(12, 500, 16, 5),
(13, 500, 7, 5),
(14, 200, 6, 5),
(15, 500, 18, 6),
(16, 500, 16, 6),
(17, 500, 16, 7),
(18, 500, 17, 7),
(19, 500, 18, 7),
(20, 500, 16, 8),
(21, 500, 7, 8),
(22, 200, 6, 8),
(23, 500, 18, 9),
(24, 500, 16, 9),
(25, 500, 16, 10),
(26, 500, 17, 10),
(27, 500, 18, 10),
(28, 500, 16, 11),
(29, 500, 7, 11),
(30, 200, 6, 11),
(31, 500, 18, 12),
(32, 500, 16, 12),
(33, 500, 16, 13),
(34, 500, 17, 13),
(35, 500, 18, 13),
(36, 500, 16, 14),
(37, 500, 7, 14),
(38, 200, 6, 14),
(39, 500, 18, 15),
(40, 500, 16, 15),
(41, 500, 16, 16),
(42, 500, 17, 16),
(43, 500, 18, 16),
(44, 500, 16, 17),
(45, 500, 7, 17),
(46, 200, 6, 17),
(47, 500, 18, 18),
(48, 500, 16, 18),
(49, 500, 16, 19),
(50, 500, 17, 19),
(51, 500, 18, 19),
(52, 500, 16, 20),
(53, 500, 7, 20),
(54, 200, 6, 20),
(55, 500, 18, 21),
(56, 500, 16, 21),
(57, 500, 16, 22),
(58, 500, 17, 22),
(59, 500, 18, 22),
(60, 500, 16, 23),
(61, 500, 7, 23),
(62, 200, 6, 23),
(63, 500, 18, 24),
(64, 500, 16, 24),
(65, 500, 16, 25),
(66, 500, 17, 25),
(67, 500, 18, 25),
(68, 500, 16, 26),
(69, 500, 7, 26),
(70, 200, 6, 26),
(71, 500, 18, 27),
(72, 500, 16, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_04_09_205519_create_clientes_table', 1),
(2, '2019_04_09_205941_create_reservaciones_table', 1),
(3, '2019_04_09_210504_create_habitacionreservada_table', 1),
(4, '2019_04_09_210912_create_paquetesvendidosreservaciones_table', 1),
(5, '2019_04_09_211212_create_rentas_table', 1),
(6, '2019_04_09_212009_create_habitacionesrentadas_table', 1),
(7, '2019_04_09_212259_create_paquetesvendidosrentas_table', 1),
(8, '2019_04_09_212503_create_paquetes_table', 1),
(9, '2019_04_09_212746_create_serviciopaquetes_table', 1),
(10, '2019_04_09_213115_create_habitaciones_table', 1),
(11, '2019_04_09_213409_create_mantenimientohabitaciones_table', 1),
(12, '2019_04_09_213513_create_dmantenimientohabitaciones_table', 1),
(13, '2019_04_09_213913_create_dhabitaciones_table', 1),
(14, '2019_04_09_214053_create_equipos_table', 1),
(15, '2019_04_09_214157_create_equipohabitaciones_table', 1),
(16, '2019_04_09_214531_create_mantenimientoequipos_table', 1),
(17, '2019_04_09_214644_create_dmantenimientoequipos_table', 1),
(18, '2019_04_09_214929_create_empleados_table', 1),
(19, '2019_04_09_215326_create_tipoempleados_table', 1),
(20, '2019_04_09_215429_create_historicoturnos_table', 1),
(21, '2019_04_09_215726_create_turnos_table', 1),
(22, '2019_04_09_220051_create_servicios_table', 1),
(23, '2019_04_09_220149_create_historicoservicios_table', 1),
(24, '2019_04_09_220512_create_serviciohabitaciones_table', 1),
(25, '2019_04_09_220908_create_facturas_table', 1),
(26, '2019_04_09_221444_create_detallefacturas_table', 1),
(27, '2019_04_09_221713_create_materiales_table', 1),
(28, '2019_04_09_222007_create_materialhabitaciones_table', 1),
(29, '2019_04_09_222948_create_serviciolhabitaciones_table', 1),
(30, '2019_04_09_223411_create_serviciolimpieza_table', 1),
(31, '2019_04_09_223544_create_reporteperdidarobo_table', 1),
(32, '2019_04_09_224041_create_ordenmateriales_table', 1),
(33, '2019_04_09_224210_create_dordenes_table', 1),
(34, '2019_04_09_224444_create_pedidos_table', 1),
(35, '2019_04_09_224605_create_reciborm_table', 1),
(36, '2019_04_11_010233_create_asignacionmateriales_table', 1),
(37, '2019_04_11_233358_claves', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenmateriales`
--

CREATE TABLE `ordenmateriales` (
  `idOrden` int(10) UNSIGNED NOT NULL,
  `Fecha` date NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ordenmateriales`
--

INSERT INTO `ordenmateriales` (`idOrden`, `Fecha`, `idEmpleado`) VALUES
(1, '2018-02-01', 2),
(2, '2018-02-10', 1),
(3, '2018-03-20', 3),
(4, '2018-03-05', 4),
(5, '2018-03-10', 5),
(6, '2018-04-11', 1),
(7, '2018-04-20', 2),
(8, '2018-05-01', 6),
(9, '2018-05-06', 4),
(10, '2018-06-10', 1),
(11, '2018-06-20', 2),
(12, '2018-07-02', 3),
(13, '2018-07-08', 1),
(14, '2018-07-12', 4),
(15, '2018-07-20', 2),
(16, '2018-07-28', 1),
(17, '2018-08-01', 1),
(18, '2018-08-05', 2),
(19, '2018-08-10', 2),
(20, '2018-08-20', 3),
(21, '2018-08-25', 5),
(22, '2018-08-29', 1),
(23, '2018-09-01', 4),
(24, '2018-09-05', 2),
(25, '2018-09-10', 2),
(26, '2018-09-20', 1),
(27, '2018-09-25', 4),
(28, '2018-09-30', 3),
(29, '2018-10-01', 2),
(30, '2018-10-05', 1),
(31, '2018-10-10', 4),
(32, '2018-10-25', 1),
(33, '2018-10-30', 2),
(34, '2018-11-01', 1),
(35, '2018-11-05', 4),
(36, '2018-11-10', 1),
(37, '2018-11-15', 1),
(38, '2018-11-20', 2),
(39, '2018-11-25', 2),
(40, '2018-11-30', 3),
(41, '2018-12-01', 3),
(42, '2018-12-05', 1),
(43, '2018-12-10', 1),
(44, '2018-12-15', 1),
(45, '2018-12-20', 1),
(46, '2018-12-25', 2),
(47, '2018-12-28', 5),
(48, '2019-01-01', 5),
(49, '2019-01-10', 4),
(50, '2019-01-25', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetes`
--

CREATE TABLE `paquetes` (
  `idPaquete` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PrecioDia` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `paquetes`
--

INSERT INTO `paquetes` (`idPaquete`, `Nombre`, `Descripcion`, `PrecioDia`) VALUES
(1, 'Plan Todo Incluido', 'Hospedaje, Alimentos y Bebidas', 2000),
(2, 'Plan Europe', 'Hospedaje ', 550),
(3, 'Desayuno Buffet', 'Hospedaje y Opciones a elegir para desayunar (Carta)', 800),
(4, 'Desayuno Americano', 'Hospedaje y Desayuno (Jugo, Fruta, Pan, Cafe y Huevos al Gusto)', 780),
(5, 'Desayuno Contiental', 'Hospedaje y Desayuno (jugo, Fruta, Pan y Cafe)', 750);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetesvendidosrentas`
--

CREATE TABLE `paquetesvendidosrentas` (
  `idpvr` int(10) UNSIGNED NOT NULL,
  `idPaquete` int(10) UNSIGNED NOT NULL,
  `idRenta` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `paquetesvendidosrentas`
--

INSERT INTO `paquetesvendidosrentas` (`idpvr`, `idPaquete`, `idRenta`, `idEmpleado`) VALUES
(1, 1, 1, 1),
(2, 3, 2, 2),
(3, 4, 3, 1),
(4, 5, 4, 3),
(5, 1, 5, 4),
(6, 2, 6, 5),
(7, 4, 7, 1),
(8, 1, 8, 2),
(9, 4, 9, 1),
(10, 3, 10, 2),
(11, 3, 11, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetesvendidosreservaciones`
--

CREATE TABLE `paquetesvendidosreservaciones` (
  `idpvr` int(10) UNSIGNED NOT NULL,
  `idPaquete` int(10) UNSIGNED NOT NULL,
  `idReservacion` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `paquetesvendidosreservaciones`
--

INSERT INTO `paquetesvendidosreservaciones` (`idpvr`, `idPaquete`, `idReservacion`, `idEmpleado`) VALUES
(1, 1, 1, 1),
(2, 5, 2, 2),
(3, 1, 3, 3),
(4, 4, 4, 1),
(5, 3, 5, 4),
(6, 1, 6, 1),
(7, 2, 7, 5),
(8, 4, 8, 1),
(9, 1, 9, 3),
(10, 2, 10, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int(10) UNSIGNED NOT NULL,
  `Fecha` date NOT NULL,
  `idOrden` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idPedido`, `Fecha`, `idOrden`) VALUES
(1, '2018-02-01', 1),
(2, '2018-02-10', 2),
(3, '2018-03-20', 3),
(4, '2018-03-05', 4),
(5, '2018-03-10', 5),
(6, '2018-04-11', 6),
(7, '2018-04-20', 7),
(8, '2018-05-01', 8),
(9, '2018-05-06', 9),
(10, '2018-06-10', 10),
(11, '2018-06-20', 11),
(12, '2018-07-02', 12),
(13, '2018-07-08', 13),
(14, '2018-07-12', 14),
(15, '2018-07-20', 15),
(16, '2018-07-28', 16),
(17, '2018-08-01', 17),
(18, '2018-08-05', 18),
(19, '2018-08-10', 19),
(20, '2018-08-20', 20),
(21, '2018-08-25', 21),
(22, '2018-08-29', 22),
(23, '2018-09-01', 23),
(24, '2018-09-05', 24),
(25, '2018-09-10', 25),
(26, '2018-09-20', 26),
(27, '2018-09-25', 27),
(28, '2018-09-30', 28),
(29, '2018-10-01', 29),
(30, '2018-10-05', 30),
(31, '2018-10-10', 31),
(32, '2018-10-25', 32),
(33, '2018-10-30', 33),
(34, '2018-11-01', 34),
(35, '2018-11-05', 35),
(36, '2018-11-10', 36),
(37, '2018-11-15', 37),
(38, '2018-11-20', 38),
(39, '2018-11-25', 39),
(40, '2018-11-30', 40),
(41, '2018-12-01', 41),
(42, '2018-12-05', 42),
(43, '2018-12-10', 43),
(44, '2018-12-15', 44),
(45, '2018-12-20', 45),
(46, '2018-12-25', 46),
(47, '2018-12-28', 47),
(48, '2019-01-01', 48),
(49, '2019-01-10', 49),
(50, '2019-01-25', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reciborm`
--

CREATE TABLE `reciborm` (
  `idRecibo` int(10) UNSIGNED NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `idPedido` int(10) UNSIGNED NOT NULL,
  `idMaterial` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reciborm`
--

INSERT INTO `reciborm` (`idRecibo`, `Cantidad`, `Fecha`, `idPedido`, `idMaterial`) VALUES
(1, 18, '2018-02-03', 1, 2),
(2, 1, '2018-02-03', 1, 7),
(3, 4, '2018-02-12', 2, 10),
(4, 17, '2018-02-12', 2, 5),
(5, 40, '2018-03-21', 3, 1),
(6, 40, '2018-03-21', 3, 3),
(7, 3, '2018-03-06', 4, 6),
(8, 3, '2018-03-06', 4, 8),
(9, 40, '2018-03-12', 5, 4),
(10, 3, '2018-03-12', 5, 9),
(11, 3, '2018-04-12', 6, 10),
(12, 45, '2018-04-12', 6, 1),
(13, 3, '2018-04-22', 7, 6),
(14, 1, '2018-04-22', 7, 7),
(15, 15, '2018-05-03', 8, 4),
(16, 1, '2018-05-03', 8, 8),
(17, 9, '2018-05-08', 9, 5),
(18, 2, '2018-05-08', 9, 10),
(19, 1, '2018-06-11', 10, 12),
(20, 10, '2018-06-11', 10, 2),
(21, 3, '2018-06-21', 11, 12),
(22, 15, '2018-06-21', 11, 4),
(23, 2, '2018-07-04', 12, 8),
(24, 20, '2018-07-04', 12, 13),
(25, 10, '2018-07-10', 13, 2),
(26, 20, '2018-07-10', 13, 3),
(27, 5, '2018-07-13', 14, 6),
(28, 2, '2018-07-13', 14, 7),
(29, 3, '2018-07-21', 15, 9),
(30, 3, '2018-07-21', 15, 10),
(31, 3, '2018-07-30', 16, 8),
(32, 10, '2018-07-30', 16, 5),
(33, 2, '2018-08-02', 17, 13),
(34, 2, '2018-08-02', 17, 12),
(35, 10, '2018-08-06', 18, 4),
(36, 20, '2018-08-06', 18, 1),
(37, 1, '2018-08-11', 19, 12),
(38, 1, '2018-08-11', 19, 13),
(39, 2, '2018-08-22', 20, 11),
(40, 5, '2018-08-22', 20, 6),
(41, 2, '2018-08-28', 21, 7),
(42, 10, '2018-08-28', 21, 3),
(43, 20, '2018-08-30', 22, 2),
(44, 10, '2018-08-30', 22, 4),
(45, 3, '2018-09-02', 23, 12),
(46, 2, '2018-09-02', 23, 13),
(47, 3, '2018-09-08', 24, 15),
(48, 3, '2018-09-08', 24, 14),
(49, 2, '2018-09-11', 25, 10),
(50, 2, '2018-09-11', 25, 9),
(51, 10, '2018-09-21', 26, 4),
(52, 10, '2018-09-21', 26, 2),
(53, 2, '2018-09-26', 27, 12),
(54, 2, '2018-09-26', 27, 8),
(55, 2, '2018-10-01', 28, 15),
(56, 1, '2018-10-01', 28, 11),
(57, 20, '2018-10-02', 29, 2),
(58, 2, '2018-10-02', 29, 7),
(59, 5, '2018-10-06', 30, 10),
(60, 20, '2018-10-06', 30, 5),
(61, 50, '2018-10-11', 31, 1),
(62, 50, '2018-10-11', 31, 3),
(63, 5, '2018-10-26', 32, 6),
(64, 5, '2018-10-26', 32, 8),
(65, 50, '2018-11-01', 33, 4),
(66, 5, '2018-11-01', 33, 9),
(67, 5, '2018-11-02', 34, 10),
(68, 50, '2018-11-02', 34, 1),
(69, 5, '2018-11-06', 35, 6),
(70, 3, '2018-11-06', 35, 7),
(71, 20, '2018-11-11', 36, 4),
(72, 3, '2018-11-11', 36, 8),
(73, 10, '2018-11-16', 37, 5),
(74, 2, '2018-11-16', 37, 10),
(75, 1, '2018-11-21', 38, 12),
(76, 10, '2018-11-21', 38, 2),
(77, 3, '2018-11-26', 39, 12),
(78, 15, '2018-11-26', 39, 4),
(79, 2, '2018-12-01', 40, 8),
(80, 20, '2018-12-01', 40, 13),
(81, 10, '2018-12-02', 41, 2),
(82, 20, '2018-12-02', 41, 3),
(83, 5, '2018-12-06', 42, 6),
(84, 2, '2018-12-06', 42, 7),
(85, 3, '2018-12-11', 43, 9),
(86, 3, '2018-12-11', 43, 10),
(87, 3, '2018-12-16', 44, 8),
(88, 10, '2018-12-16', 44, 5),
(89, 2, '2018-12-21', 45, 13),
(90, 2, '2018-12-21', 45, 12),
(91, 10, '2018-12-26', 46, 4),
(92, 20, '2018-12-26', 46, 1),
(93, 1, '2018-12-29', 47, 12),
(94, 1, '2018-12-29', 47, 13),
(95, 2, '2019-01-02', 48, 11),
(96, 5, '2019-01-02', 48, 6),
(97, 2, '2019-01-11', 49, 7),
(98, 10, '2019-01-11', 49, 3),
(99, 20, '2019-01-26', 50, 2),
(100, 10, '2019-01-26', 50, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rentas`
--

CREATE TABLE `rentas` (
  `idRenta` int(10) UNSIGNED NOT NULL,
  `FechaIn` date NOT NULL,
  `FechaOut` date NOT NULL,
  `idCliente` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL,
  `idReservacion` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rentas`
--

INSERT INTO `rentas` (`idRenta`, `FechaIn`, `FechaOut`, `idCliente`, `idEmpleado`, `idReservacion`) VALUES
(1, '2018-12-24', '2019-01-01', 1, 1, 2),
(2, '2018-01-01', '2018-01-05', 10, 2, NULL),
(3, '2018-01-01', '2018-01-10', 15, 1, NULL),
(4, '2018-01-01', '2018-01-03', 20, 3, NULL),
(5, '2018-01-01', '2018-01-05', 5, 4, NULL),
(6, '2018-01-01', '2018-01-03', 6, 5, NULL),
(7, '2018-01-01', '2018-01-06', 7, 1, NULL),
(8, '2018-01-11', '2018-01-15', 8, 2, NULL),
(9, '2018-01-11', '2018-01-15', 11, 1, NULL),
(10, '2018-01-11', '2018-01-15', 12, 2, NULL),
(11, '2018-01-11', '2018-01-15', 13, 3, NULL),
(12, '2018-02-01', '2018-02-05', 2, 1, NULL),
(13, '2018-02-03', '2018-02-06', 3, 2, NULL),
(14, '2018-02-03', '2018-02-06', 4, 3, NULL),
(15, '2018-02-06', '2018-02-10', 5, 4, NULL),
(16, '2018-03-01', '2018-03-05', 6, 2, NULL),
(17, '2018-03-01', '2018-03-05', 7, 1, NULL),
(18, '2018-08-23', '2018-08-28', 8, 3, NULL),
(19, '2018-10-10', '2018-10-15', 9, 4, NULL),
(20, '2018-12-10', '2018-12-15', 10, 3, NULL),
(21, '2019-01-01', '2019-01-05', 20, 1, NULL),
(22, '2019-01-01', '2019-01-05', 19, 2, NULL),
(23, '2019-01-01', '2019-01-05', 18, 4, NULL),
(24, '2019-01-10', '2019-01-15', 17, 1, NULL),
(25, '2019-01-10', '2019-01-15', 1, 2, NULL),
(26, '2019-01-10', '2019-01-15', 2, 3, NULL),
(27, '2019-01-20', '2019-01-25', 3, 1, NULL),
(28, '2019-01-20', '2019-01-25', 4, 4, NULL),
(29, '2019-01-20', '2019-01-25', 5, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporteperdidarobo`
--

CREATE TABLE `reporteperdidarobo` (
  `idReporte` int(10) UNSIGNED NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `idServicioLH` int(10) UNSIGNED NOT NULL,
  `idHabitacion` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL,
  `idMaterial` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reporteperdidarobo`
--

INSERT INTO `reporteperdidarobo` (`idReporte`, `Cantidad`, `Fecha`, `idServicioLH`, `idHabitacion`, `idEmpleado`, `idMaterial`) VALUES
(1, 1, '2018-02-01', 1, 1, 6, 28),
(2, 1, '2018-02-01', 4, 2, 9, 21),
(3, 1, '2018-05-01', 7, 3, 12, 19),
(4, 1, '2018-05-01', 10, 4, 15, 21),
(5, 1, '2018-06-03', 13, 5, 18, 21),
(6, 1, '2019-05-05', 16, 6, 6, 21),
(7, 1, '2019-05-05', 19, 7, 9, 21),
(8, 1, '2019-10-05', 22, 8, 12, 21),
(9, 1, '2019-10-05', 25, 9, 15, 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--

CREATE TABLE `reservaciones` (
  `idReservacion` int(10) UNSIGNED NOT NULL,
  `FechaIn` date NOT NULL,
  `FechaOut` date NOT NULL,
  `FechaReserv` date NOT NULL,
  `Estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idCliente` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reservaciones`
--

INSERT INTO `reservaciones` (`idReservacion`, `FechaIn`, `FechaOut`, `FechaReserv`, `Estado`, `idCliente`, `idEmpleado`) VALUES
(1, '2019-05-01', '2019-05-10', '2019-04-08', 'Activa8', 1, 1),
(2, '2018-12-24', '2019-01-01', '2018-12-20', 'Activa', 1, 2),
(3, '2019-05-01', '2019-05-05', '2019-04-08', 'Activa', 2, 3),
(4, '2019-05-01', '2019-05-15', '2019-04-08', 'Activa', 3, 1),
(5, '2019-05-01', '2019-05-05', '2019-04-08', 'Activa', 4, 4),
(6, '2019-05-01', '2019-05-03', '2019-04-08', 'Activa', 5, 1),
(7, '2019-04-01', '2019-04-05', '2019-03-28', 'Cancelada0', 6, 5),
(8, '2019-05-01', '2019-05-15', '2019-04-08', 'Activa', 7, 1),
(9, '2019-05-01', '2019-05-04', '2019-04-05', 'Activa', 8, 3),
(10, '2019-05-01', '2019-05-02', '2019-04-08', 'Activa', 9, 2),
(11, '2019-05-01', '2019-05-10', '2019-04-03', 'Activa', 10, 2),
(12, '2019-05-16', '2019-05-17', '2019-05-10', 'Activa', 11, 1),
(13, '2019-05-16', '2019-05-20', '2019-05-11', 'Activa', 12, 2),
(14, '2019-05-16', '2019-05-20', '2019-05-10', 'Activa', 13, 3),
(15, '2019-05-16', '2019-05-18', '2019-05-11', 'Activa', 14, 4),
(16, '2019-05-16', '2019-05-17', '2019-05-12', 'Activa', 15, 5),
(17, '2019-05-16', '2019-05-22', '2019-05-14', 'Activa', 16, 4),
(18, '2018-12-24', '2019-01-01', '2018-12-20', 'Activa3', 3, 2),
(19, '2018-08-23', '2018-08-30', '2018-08-20', 'Cancelada', 16, 1),
(20, '2018-12-24', '2019-01-01', '2018-12-20', 'Activa', 9, 2),
(21, '2019-05-23', '2019-05-30', '2019-04-09', 'Activa', 17, 5),
(22, '2019-05-23', '2019-05-25', '2019-04-09', 'Activa', 18, 3),
(23, '2019-05-23', '2019-05-28', '2019-04-09', 'Activa', 19, 1),
(24, '2019-05-23', '2019-05-28', '2019-04-09', 'Activa', 20, 2),
(25, '2019-06-01', '2019-06-05', '2019-04-11', 'Activa5', 21, 1),
(26, '2019-06-01', '2019-06-10', '2019-04-11', 'Activa', 22, 2),
(27, '2019-06-05', '2019-06-10', '2019-04-11', 'Cancelada', 23, 3),
(28, '2019-06-11', '2019-06-15', '2019-04-11', 'Activa0', 24, 4),
(29, '2019-06-16', '2019-06-20', '2019-04-11', 'Activa', 25, 1),
(30, '2019-06-20', '2019-06-25', '2019-04-11', 'Activa', 26, 2),
(31, '2019-06-01', '2019-06-05', '2019-04-11', 'Activa', 27, 1),
(32, '2019-06-01', '2019-06-10', '2019-04-11', 'Activa', 28, 3),
(33, '2019-06-05', '2019-06-10', '2019-04-11', 'Activa', 29, 5),
(34, '2019-06-11', '2019-06-15', '2019-04-11', 'Activa', 30, 1),
(35, '2019-06-16', '2019-06-20', '2019-04-11', 'Activa', 20, 4),
(36, '2019-06-20', '2019-06-25', '2019-04-11', 'Activa', 21, 2),
(37, '2019-06-01', '2019-06-05', '2019-04-11', 'Activa', 22, 4),
(38, '2019-06-01', '2019-06-10', '2019-04-11', 'Activa', 23, 1),
(39, '2019-06-05', '2019-06-10', '2019-04-11', 'Activa', 24, 2),
(40, '2019-06-11', '2019-06-15', '2019-04-11', 'Activa', 25, 1),
(41, '2019-06-16', '2019-06-20', '2019-04-11', 'Activa', 26, 3),
(42, '2019-06-20', '2019-06-25', '2019-04-11', 'Activa', 27, 1),
(43, '2019-06-01', '2019-06-05', '2019-04-12', 'Activa', 28, 2),
(44, '2019-06-01', '2019-06-10', '2019-04-12', 'Activa3', 29, 1),
(45, '2019-06-05', '2019-06-10', '2019-04-12', 'Cancelada', 30, 1),
(46, '2019-06-11', '2019-06-15', '2019-04-12', 'Activa', 22, 4),
(47, '2019-06-16', '2019-06-20', '2019-04-12', 'Activa', 23, 5),
(48, '2019-06-20', '2019-06-25', '2019-04-12', 'Activa', 24, 2),
(49, '2019-06-16', '2019-06-20', '2019-04-12', 'Cancelada4', 25, 4),
(50, '2019-06-20', '2019-06-25', '2019-04-12', 'Activa', 26, 1),
(51, '2019-06-21', '2019-06-25', '2019-04-13', 'Activa', 27, 1),
(52, '2019-06-21', '2019-06-25', '2019-04-13', 'Activa', 28, 2),
(53, '2019-06-21', '2019-06-25', '2019-04-13', 'Activa', 29, 1),
(54, '2019-06-21', '2019-06-25', '2019-04-13', 'Activa', 30, 2),
(55, '2019-06-21', '2019-06-25', '2019-04-13', 'Activa', 31, 1),
(56, '2019-06-21', '2019-06-25', '2019-04-13', 'Activa', 32, 2),
(57, '2019-06-21', '2019-06-25', '2019-04-13', 'Activa4', 33, 1),
(58, '2019-06-21', '2019-06-25', '2019-04-13', 'Activa', 34, 2),
(59, '2019-06-21', '2019-06-25', '2019-04-13', 'Activa', 35, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serviciohabitaciones`
--

CREATE TABLE `serviciohabitaciones` (
  `idServicioH` int(10) UNSIGNED NOT NULL,
  `idHabitacionR` int(10) UNSIGNED NOT NULL,
  `idRenta` int(10) UNSIGNED NOT NULL,
  `idHistoricoS` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `serviciohabitaciones`
--

INSERT INTO `serviciohabitaciones` (`idServicioH`, `idHabitacionR`, `idRenta`, `idHistoricoS`, `idEmpleado`) VALUES
(1, 1, 1, 1, 6),
(2, 1, 12, 1, 7),
(3, 2, 13, 2, 8),
(4, 3, 14, 3, 9),
(5, 4, 15, 4, 10),
(6, 5, 16, 5, 11),
(7, 6, 17, 1, 12),
(8, 7, 18, 2, 13),
(9, 8, 19, 3, 14),
(10, 9, 20, 4, 15),
(11, 10, 21, 5, 16),
(12, 11, 22, 1, 17),
(13, 12, 23, 2, 18),
(14, 13, 24, 3, 19),
(15, 14, 25, 4, 20),
(16, 15, 26, 5, 6),
(17, 16, 27, 1, 7),
(18, 17, 28, 2, 10),
(19, 18, 29, 3, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serviciolhabitaciones`
--

CREATE TABLE `serviciolhabitaciones` (
  `idServicioLH` int(10) UNSIGNED NOT NULL,
  `Fecha` date NOT NULL,
  `idServicioL` int(10) UNSIGNED NOT NULL,
  `idHabitacion` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `serviciolhabitaciones`
--

INSERT INTO `serviciolhabitaciones` (`idServicioLH`, `Fecha`, `idServicioL`, `idHabitacion`, `idEmpleado`) VALUES
(1, '2018-02-01', 1, 1, 6),
(2, '2018-02-01', 2, 1, 7),
(3, '2018-02-01', 3, 1, 8),
(4, '2018-02-01', 1, 2, 9),
(5, '2018-02-01', 2, 2, 10),
(6, '2018-02-01', 3, 2, 11),
(7, '2018-05-01', 1, 3, 12),
(8, '2018-05-01', 2, 3, 13),
(9, '2018-05-01', 3, 3, 14),
(10, '2018-05-01', 1, 4, 15),
(11, '2018-05-01', 2, 4, 16),
(12, '2018-05-01', 3, 4, 17),
(13, '2018-06-03', 1, 5, 18),
(14, '2018-06-03', 2, 5, 19),
(15, '2018-06-03', 3, 5, 20),
(16, '2019-05-05', 1, 6, 6),
(17, '2019-05-05', 2, 6, 7),
(18, '2019-05-05', 3, 6, 8),
(19, '2019-05-05', 1, 7, 9),
(20, '2019-05-05', 2, 7, 10),
(21, '2019-05-05', 3, 7, 11),
(22, '2019-10-05', 1, 8, 12),
(23, '2019-10-05', 2, 8, 13),
(24, '2019-10-05', 3, 8, 14),
(25, '2019-10-05', 1, 9, 15),
(26, '2019-10-05', 2, 9, 16),
(27, '2019-10-05', 3, 9, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serviciolimpieza`
--

CREATE TABLE `serviciolimpieza` (
  `idServicioL` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `serviciolimpieza`
--

INSERT INTO `serviciolimpieza` (`idServicioL`, `Nombre`) VALUES
(1, 'Limpieza de habitacion'),
(2, 'Cambio de sabanas'),
(3, 'Limpieza de ba?o\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serviciopaquetes`
--

CREATE TABLE `serviciopaquetes` (
  `idServicioP` int(10) UNSIGNED NOT NULL,
  `idHistoricoS` int(10) UNSIGNED NOT NULL,
  `idPaquete` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `serviciopaquetes`
--

INSERT INTO `serviciopaquetes` (`idServicioP`, `idHistoricoS`, `idPaquete`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 6, 1),
(4, 4, 3),
(5, 4, 4),
(6, 4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idServicio` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`idServicio`, `Nombre`) VALUES
(1, 'Telefono'),
(2, 'Internet'),
(3, 'Tintoreria'),
(4, 'Desayuno '),
(5, 'Despertador'),
(6, 'Resraurant-Bar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoempleados`
--

CREATE TABLE `tipoempleados` (
  `idTipo` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipoempleados`
--

INSERT INTO `tipoempleados` (`idTipo`, `Nombre`) VALUES
(1, 'Recepcionista'),
(2, 'Mucama');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `idTurno` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HoraInicio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HoraTermino` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`idTurno`, `Nombre`, `HoraInicio`, `HoraTermino`) VALUES
(1, 'Matutino', '07:00 a. m.', '03:00 p. m.'),
(2, 'Vespertino', '03:00 p. m.', '11:00 p. m.'),
(3, 'Nocturno', '11:00 p. m.', '07:00 a. m.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacionmateriales`
--
ALTER TABLE `asignacionmateriales`
  ADD PRIMARY KEY (`idAsignacion`),
  ADD KEY `asignacionmateriales_idhabitacion_foreign` (`idHabitacion`),
  ADD KEY `asignacionmateriales_idmaterial_foreign` (`idMaterial`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `detallefacturas`
--
ALTER TABLE `detallefacturas`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `detallefacturas_idfactura_foreign` (`idFactura`),
  ADD KEY `detallefacturas_idservicioh_foreign` (`idServicioH`);

--
-- Indices de la tabla `dhabitaciones`
--
ALTER TABLE `dhabitaciones`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `dmantenimientoequipos`
--
ALTER TABLE `dmantenimientoequipos`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `dmantenimientoequipos_idequipoh_foreign` (`idEquipoH`),
  ADD KEY `dmantenimientoequipos_idmantenimientoe_foreign` (`idMantenimientoE`),
  ADD KEY `dmantenimientoequipos_idempleado_foreign` (`idEmpleado`);

--
-- Indices de la tabla `dmantenimientohabitaciones`
--
ALTER TABLE `dmantenimientohabitaciones`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `dmantenimientohabitaciones_idhabitacion_foreign` (`idHabitacion`),
  ADD KEY `dmantenimientohabitaciones_idmatenimientoh_foreign` (`idMatenimientoH`),
  ADD KEY `dmantenimientohabitaciones_idempleado_foreign` (`idEmpleado`);

--
-- Indices de la tabla `dordenes`
--
ALTER TABLE `dordenes`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `dordenes_idorden_foreign` (`idOrden`),
  ADD KEY `dordenes_idmaterial_foreign` (`idMaterial`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `empleados_idtipo_foreign` (`idTipo`);

--
-- Indices de la tabla `equipohabitaciones`
--
ALTER TABLE `equipohabitaciones`
  ADD PRIMARY KEY (`idEquipoH`),
  ADD KEY `equipohabitaciones_idequipo_foreign` (`idEquipo`),
  ADD KEY `equipohabitaciones_idhabitacion_foreign` (`idHabitacion`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`idEquipo`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `facturas_idcliente_foreign` (`idCliente`),
  ADD KEY `facturas_idrenta_foreign` (`idRenta`),
  ADD KEY `facturas_idempleado_foreign` (`idEmpleado`);

--
-- Indices de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`idHabitacion`),
  ADD KEY `habitaciones_idtipo_foreign` (`idTipo`);

--
-- Indices de la tabla `habitacionesrentadas`
--
ALTER TABLE `habitacionesrentadas`
  ADD PRIMARY KEY (`idHabitacionR`),
  ADD KEY `habitacionesrentadas_idrenta_foreign` (`idRenta`),
  ADD KEY `habitacionesrentadas_idhabitacion_foreign` (`idHabitacion`);

--
-- Indices de la tabla `habitacionreservada`
--
ALTER TABLE `habitacionreservada`
  ADD PRIMARY KEY (`idHabitacionR`),
  ADD KEY `habitacionreservada_idreservacion_foreign` (`idReservacion`),
  ADD KEY `habitacionreservada_idhabitacion_foreign` (`idHabitacion`);

--
-- Indices de la tabla `historicoservicios`
--
ALTER TABLE `historicoservicios`
  ADD PRIMARY KEY (`idHistorico`),
  ADD KEY `historicoservicios_idservicio_foreign` (`idServicio`);

--
-- Indices de la tabla `historicoturnos`
--
ALTER TABLE `historicoturnos`
  ADD PRIMARY KEY (`idHistorico`),
  ADD KEY `historicoturnos_idturno_foreign` (`idTurno`),
  ADD KEY `historicoturnos_idempleado_foreign` (`idEmpleado`);

--
-- Indices de la tabla `mantenimientoequipos`
--
ALTER TABLE `mantenimientoequipos`
  ADD PRIMARY KEY (`idMantenimientoE`);

--
-- Indices de la tabla `mantenimientohabitaciones`
--
ALTER TABLE `mantenimientohabitaciones`
  ADD PRIMARY KEY (`idMatenimientoH`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`idMaterial`);

--
-- Indices de la tabla `materialhabitaciones`
--
ALTER TABLE `materialhabitaciones`
  ADD PRIMARY KEY (`idMaterialH`),
  ADD KEY `materialhabitaciones_idmaterial_foreign` (`idMaterial`),
  ADD KEY `materialhabitaciones_idserviciolh_foreign` (`idServicioLH`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenmateriales`
--
ALTER TABLE `ordenmateriales`
  ADD PRIMARY KEY (`idOrden`),
  ADD KEY `ordenmateriales_idempleado_foreign` (`idEmpleado`);

--
-- Indices de la tabla `paquetes`
--
ALTER TABLE `paquetes`
  ADD PRIMARY KEY (`idPaquete`);

--
-- Indices de la tabla `paquetesvendidosrentas`
--
ALTER TABLE `paquetesvendidosrentas`
  ADD PRIMARY KEY (`idpvr`),
  ADD KEY `paquetesvendidosrentas_idpaquete_foreign` (`idPaquete`),
  ADD KEY `paquetesvendidosrentas_idrenta_foreign` (`idRenta`),
  ADD KEY `paquetesvendidosrentas_idempleado_foreign` (`idEmpleado`);

--
-- Indices de la tabla `paquetesvendidosreservaciones`
--
ALTER TABLE `paquetesvendidosreservaciones`
  ADD PRIMARY KEY (`idpvr`),
  ADD KEY `paquetesvendidosreservaciones_idpaquete_foreign` (`idPaquete`),
  ADD KEY `paquetesvendidosreservaciones_idreservacion_foreign` (`idReservacion`),
  ADD KEY `paquetesvendidosreservaciones_idempleado_foreign` (`idEmpleado`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `pedidos_idorden_foreign` (`idOrden`);

--
-- Indices de la tabla `reciborm`
--
ALTER TABLE `reciborm`
  ADD PRIMARY KEY (`idRecibo`),
  ADD KEY `reciborm_idpedido_foreign` (`idPedido`),
  ADD KEY `reciborm_idmaterial_foreign` (`idMaterial`);

--
-- Indices de la tabla `rentas`
--
ALTER TABLE `rentas`
  ADD PRIMARY KEY (`idRenta`),
  ADD KEY `rentas_idcliente_foreign` (`idCliente`),
  ADD KEY `rentas_idempleado_foreign` (`idEmpleado`),
  ADD KEY `rentas_idreservacion_foreign` (`idReservacion`);

--
-- Indices de la tabla `reporteperdidarobo`
--
ALTER TABLE `reporteperdidarobo`
  ADD PRIMARY KEY (`idReporte`),
  ADD KEY `reporteperdidarobo_idserviciolh_foreign` (`idServicioLH`),
  ADD KEY `reporteperdidarobo_idhabitacion_foreign` (`idHabitacion`),
  ADD KEY `reporteperdidarobo_idempleado_foreign` (`idEmpleado`),
  ADD KEY `reporteperdidarobo_idmaterial_foreign` (`idMaterial`);

--
-- Indices de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD PRIMARY KEY (`idReservacion`),
  ADD KEY `reservaciones_idcliente_foreign` (`idCliente`),
  ADD KEY `reservaciones_idempleado_foreign` (`idEmpleado`);

--
-- Indices de la tabla `serviciohabitaciones`
--
ALTER TABLE `serviciohabitaciones`
  ADD PRIMARY KEY (`idServicioH`),
  ADD KEY `serviciohabitaciones_idhabitacionr_foreign` (`idHabitacionR`),
  ADD KEY `serviciohabitaciones_idrenta_foreign` (`idRenta`),
  ADD KEY `serviciohabitaciones_idhistoricos_foreign` (`idHistoricoS`),
  ADD KEY `serviciohabitaciones_idempleado_foreign` (`idEmpleado`);

--
-- Indices de la tabla `serviciolhabitaciones`
--
ALTER TABLE `serviciolhabitaciones`
  ADD PRIMARY KEY (`idServicioLH`),
  ADD KEY `serviciolhabitaciones_idserviciol_foreign` (`idServicioL`),
  ADD KEY `serviciolhabitaciones_idhabitacion_foreign` (`idHabitacion`),
  ADD KEY `serviciolhabitaciones_idempleado_foreign` (`idEmpleado`);

--
-- Indices de la tabla `serviciolimpieza`
--
ALTER TABLE `serviciolimpieza`
  ADD PRIMARY KEY (`idServicioL`);

--
-- Indices de la tabla `serviciopaquetes`
--
ALTER TABLE `serviciopaquetes`
  ADD PRIMARY KEY (`idServicioP`),
  ADD KEY `serviciopaquetes_idhistoricos_foreign` (`idHistoricoS`),
  ADD KEY `serviciopaquetes_idpaquete_foreign` (`idPaquete`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`idServicio`);

--
-- Indices de la tabla `tipoempleados`
--
ALTER TABLE `tipoempleados`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`idTurno`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacionmateriales`
--
ALTER TABLE `asignacionmateriales`
  MODIFY `idAsignacion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `detallefacturas`
--
ALTER TABLE `detallefacturas`
  MODIFY `idDetalle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `dhabitaciones`
--
ALTER TABLE `dhabitaciones`
  MODIFY `idTipo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `dmantenimientoequipos`
--
ALTER TABLE `dmantenimientoequipos`
  MODIFY `idDetalle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `dmantenimientohabitaciones`
--
ALTER TABLE `dmantenimientohabitaciones`
  MODIFY `idDetalle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `dordenes`
--
ALTER TABLE `dordenes`
  MODIFY `idDetalle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `equipohabitaciones`
--
ALTER TABLE `equipohabitaciones`
  MODIFY `idEquipoH` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `idEquipo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFactura` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  MODIFY `idHabitacion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `habitacionesrentadas`
--
ALTER TABLE `habitacionesrentadas`
  MODIFY `idHabitacionR` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `habitacionreservada`
--
ALTER TABLE `habitacionreservada`
  MODIFY `idHabitacionR` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `historicoservicios`
--
ALTER TABLE `historicoservicios`
  MODIFY `idHistorico` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `historicoturnos`
--
ALTER TABLE `historicoturnos`
  MODIFY `idHistorico` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `mantenimientoequipos`
--
ALTER TABLE `mantenimientoequipos`
  MODIFY `idMantenimientoE` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `mantenimientohabitaciones`
--
ALTER TABLE `mantenimientohabitaciones`
  MODIFY `idMatenimientoH` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `materiales`
--
ALTER TABLE `materiales`
  MODIFY `idMaterial` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `materialhabitaciones`
--
ALTER TABLE `materialhabitaciones`
  MODIFY `idMaterialH` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `ordenmateriales`
--
ALTER TABLE `ordenmateriales`
  MODIFY `idOrden` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `paquetes`
--
ALTER TABLE `paquetes`
  MODIFY `idPaquete` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `paquetesvendidosrentas`
--
ALTER TABLE `paquetesvendidosrentas`
  MODIFY `idpvr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `paquetesvendidosreservaciones`
--
ALTER TABLE `paquetesvendidosreservaciones`
  MODIFY `idpvr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedido` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `reciborm`
--
ALTER TABLE `reciborm`
  MODIFY `idRecibo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `rentas`
--
ALTER TABLE `rentas`
  MODIFY `idRenta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `reporteperdidarobo`
--
ALTER TABLE `reporteperdidarobo`
  MODIFY `idReporte` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `idReservacion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `serviciohabitaciones`
--
ALTER TABLE `serviciohabitaciones`
  MODIFY `idServicioH` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `serviciolhabitaciones`
--
ALTER TABLE `serviciolhabitaciones`
  MODIFY `idServicioLH` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `serviciolimpieza`
--
ALTER TABLE `serviciolimpieza`
  MODIFY `idServicioL` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `serviciopaquetes`
--
ALTER TABLE `serviciopaquetes`
  MODIFY `idServicioP` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `idServicio` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipoempleados`
--
ALTER TABLE `tipoempleados`
  MODIFY `idTipo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `idTurno` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacionmateriales`
--
ALTER TABLE `asignacionmateriales`
  ADD CONSTRAINT `asignacionmateriales_idhabitacion_foreign` FOREIGN KEY (`idHabitacion`) REFERENCES `habitaciones` (`idHabitacion`),
  ADD CONSTRAINT `asignacionmateriales_idmaterial_foreign` FOREIGN KEY (`idMaterial`) REFERENCES `materiales` (`idMaterial`);

--
-- Filtros para la tabla `detallefacturas`
--
ALTER TABLE `detallefacturas`
  ADD CONSTRAINT `detallefacturas_idfactura_foreign` FOREIGN KEY (`idFactura`) REFERENCES `facturas` (`idFactura`),
  ADD CONSTRAINT `detallefacturas_idservicioh_foreign` FOREIGN KEY (`idServicioH`) REFERENCES `serviciohabitaciones` (`idServicioH`);

--
-- Filtros para la tabla `dmantenimientoequipos`
--
ALTER TABLE `dmantenimientoequipos`
  ADD CONSTRAINT `dmantenimientoequipos_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`),
  ADD CONSTRAINT `dmantenimientoequipos_idequipoh_foreign` FOREIGN KEY (`idEquipoH`) REFERENCES `equipohabitaciones` (`idEquipoH`),
  ADD CONSTRAINT `dmantenimientoequipos_idmantenimientoe_foreign` FOREIGN KEY (`idMantenimientoE`) REFERENCES `mantenimientoequipos` (`idMantenimientoE`);

--
-- Filtros para la tabla `dmantenimientohabitaciones`
--
ALTER TABLE `dmantenimientohabitaciones`
  ADD CONSTRAINT `dmantenimientohabitaciones_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`),
  ADD CONSTRAINT `dmantenimientohabitaciones_idhabitacion_foreign` FOREIGN KEY (`idHabitacion`) REFERENCES `habitaciones` (`idHabitacion`),
  ADD CONSTRAINT `dmantenimientohabitaciones_idmatenimientoh_foreign` FOREIGN KEY (`idMatenimientoH`) REFERENCES `mantenimientohabitaciones` (`idMatenimientoH`);

--
-- Filtros para la tabla `dordenes`
--
ALTER TABLE `dordenes`
  ADD CONSTRAINT `dordenes_idmaterial_foreign` FOREIGN KEY (`idMaterial`) REFERENCES `materiales` (`idMaterial`),
  ADD CONSTRAINT `dordenes_idorden_foreign` FOREIGN KEY (`idOrden`) REFERENCES `ordenmateriales` (`idOrden`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_idtipo_foreign` FOREIGN KEY (`idTipo`) REFERENCES `tipoempleados` (`idTipo`);

--
-- Filtros para la tabla `equipohabitaciones`
--
ALTER TABLE `equipohabitaciones`
  ADD CONSTRAINT `equipohabitaciones_idequipo_foreign` FOREIGN KEY (`idEquipo`) REFERENCES `equipos` (`idEquipo`),
  ADD CONSTRAINT `equipohabitaciones_idhabitacion_foreign` FOREIGN KEY (`idHabitacion`) REFERENCES `habitaciones` (`idHabitacion`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_idcliente_foreign` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `facturas_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`),
  ADD CONSTRAINT `facturas_idrenta_foreign` FOREIGN KEY (`idRenta`) REFERENCES `rentas` (`idRenta`);

--
-- Filtros para la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD CONSTRAINT `habitaciones_idtipo_foreign` FOREIGN KEY (`idTipo`) REFERENCES `dhabitaciones` (`idTipo`);

--
-- Filtros para la tabla `habitacionesrentadas`
--
ALTER TABLE `habitacionesrentadas`
  ADD CONSTRAINT `habitacionesrentadas_idhabitacion_foreign` FOREIGN KEY (`idHabitacion`) REFERENCES `habitaciones` (`idHabitacion`),
  ADD CONSTRAINT `habitacionesrentadas_idrenta_foreign` FOREIGN KEY (`idRenta`) REFERENCES `rentas` (`idRenta`);

--
-- Filtros para la tabla `habitacionreservada`
--
ALTER TABLE `habitacionreservada`
  ADD CONSTRAINT `habitacionreservada_idhabitacion_foreign` FOREIGN KEY (`idHabitacion`) REFERENCES `habitaciones` (`idHabitacion`),
  ADD CONSTRAINT `habitacionreservada_idreservacion_foreign` FOREIGN KEY (`idReservacion`) REFERENCES `reservaciones` (`idReservacion`);

--
-- Filtros para la tabla `historicoservicios`
--
ALTER TABLE `historicoservicios`
  ADD CONSTRAINT `historicoservicios_idservicio_foreign` FOREIGN KEY (`idServicio`) REFERENCES `servicios` (`idServicio`);

--
-- Filtros para la tabla `historicoturnos`
--
ALTER TABLE `historicoturnos`
  ADD CONSTRAINT `historicoturnos_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`),
  ADD CONSTRAINT `historicoturnos_idturno_foreign` FOREIGN KEY (`idTurno`) REFERENCES `turnos` (`idTurno`);

--
-- Filtros para la tabla `materialhabitaciones`
--
ALTER TABLE `materialhabitaciones`
  ADD CONSTRAINT `materialhabitaciones_idmaterial_foreign` FOREIGN KEY (`idMaterial`) REFERENCES `materiales` (`idMaterial`),
  ADD CONSTRAINT `materialhabitaciones_idserviciolh_foreign` FOREIGN KEY (`idServicioLH`) REFERENCES `serviciolhabitaciones` (`idServicioLH`);

--
-- Filtros para la tabla `ordenmateriales`
--
ALTER TABLE `ordenmateriales`
  ADD CONSTRAINT `ordenmateriales_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`);

--
-- Filtros para la tabla `paquetesvendidosrentas`
--
ALTER TABLE `paquetesvendidosrentas`
  ADD CONSTRAINT `paquetesvendidosrentas_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`),
  ADD CONSTRAINT `paquetesvendidosrentas_idpaquete_foreign` FOREIGN KEY (`idPaquete`) REFERENCES `paquetes` (`idPaquete`),
  ADD CONSTRAINT `paquetesvendidosrentas_idrenta_foreign` FOREIGN KEY (`idRenta`) REFERENCES `rentas` (`idRenta`);

--
-- Filtros para la tabla `paquetesvendidosreservaciones`
--
ALTER TABLE `paquetesvendidosreservaciones`
  ADD CONSTRAINT `paquetesvendidosreservaciones_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`),
  ADD CONSTRAINT `paquetesvendidosreservaciones_idpaquete_foreign` FOREIGN KEY (`idPaquete`) REFERENCES `paquetes` (`idPaquete`),
  ADD CONSTRAINT `paquetesvendidosreservaciones_idreservacion_foreign` FOREIGN KEY (`idReservacion`) REFERENCES `reservaciones` (`idReservacion`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_idorden_foreign` FOREIGN KEY (`idOrden`) REFERENCES `ordenmateriales` (`idOrden`);

--
-- Filtros para la tabla `reciborm`
--
ALTER TABLE `reciborm`
  ADD CONSTRAINT `reciborm_idmaterial_foreign` FOREIGN KEY (`idMaterial`) REFERENCES `materiales` (`idMaterial`),
  ADD CONSTRAINT `reciborm_idpedido_foreign` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`);

--
-- Filtros para la tabla `rentas`
--
ALTER TABLE `rentas`
  ADD CONSTRAINT `rentas_idcliente_foreign` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `rentas_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`),
  ADD CONSTRAINT `rentas_idreservacion_foreign` FOREIGN KEY (`idReservacion`) REFERENCES `reservaciones` (`idReservacion`);

--
-- Filtros para la tabla `reporteperdidarobo`
--
ALTER TABLE `reporteperdidarobo`
  ADD CONSTRAINT `reporteperdidarobo_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`),
  ADD CONSTRAINT `reporteperdidarobo_idhabitacion_foreign` FOREIGN KEY (`idHabitacion`) REFERENCES `habitaciones` (`idHabitacion`),
  ADD CONSTRAINT `reporteperdidarobo_idmaterial_foreign` FOREIGN KEY (`idMaterial`) REFERENCES `materiales` (`idMaterial`),
  ADD CONSTRAINT `reporteperdidarobo_idserviciolh_foreign` FOREIGN KEY (`idServicioLH`) REFERENCES `serviciolhabitaciones` (`idServicioLH`);

--
-- Filtros para la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD CONSTRAINT `reservaciones_idcliente_foreign` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `reservaciones_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`);

--
-- Filtros para la tabla `serviciohabitaciones`
--
ALTER TABLE `serviciohabitaciones`
  ADD CONSTRAINT `serviciohabitaciones_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`),
  ADD CONSTRAINT `serviciohabitaciones_idhabitacionr_foreign` FOREIGN KEY (`idHabitacionR`) REFERENCES `habitacionesrentadas` (`idHabitacionR`),
  ADD CONSTRAINT `serviciohabitaciones_idhistoricos_foreign` FOREIGN KEY (`idHistoricoS`) REFERENCES `historicoservicios` (`idHistorico`),
  ADD CONSTRAINT `serviciohabitaciones_idrenta_foreign` FOREIGN KEY (`idRenta`) REFERENCES `rentas` (`idRenta`);

--
-- Filtros para la tabla `serviciolhabitaciones`
--
ALTER TABLE `serviciolhabitaciones`
  ADD CONSTRAINT `serviciolhabitaciones_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`),
  ADD CONSTRAINT `serviciolhabitaciones_idhabitacion_foreign` FOREIGN KEY (`idHabitacion`) REFERENCES `habitaciones` (`idHabitacion`),
  ADD CONSTRAINT `serviciolhabitaciones_idserviciol_foreign` FOREIGN KEY (`idServicioL`) REFERENCES `serviciolimpieza` (`idServicioL`);

--
-- Filtros para la tabla `serviciopaquetes`
--
ALTER TABLE `serviciopaquetes`
  ADD CONSTRAINT `serviciopaquetes_idhistoricos_foreign` FOREIGN KEY (`idHistoricoS`) REFERENCES `historicoservicios` (`idHistorico`),
  ADD CONSTRAINT `serviciopaquetes_idpaquete_foreign` FOREIGN KEY (`idPaquete`) REFERENCES `paquetes` (`idPaquete`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
