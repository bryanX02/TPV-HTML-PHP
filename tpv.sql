-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-03-2022 a las 17:37:43
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpv`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `user` varchar(20) NOT NULL,
  `pass` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `nombre`, `user`, `pass`) VALUES
(1, 'Bryan', '02bryanX', '81dc9bdb52d04dc20036dbd8313ed055'),
(2, 'Chema', 'chema', '81dc9bdb52d04dc20036dbd8313ed055'),
(3, 'Belem', 'belem', '81dc9bdb52d04dc20036dbd8313ed055'),
(4, 'Sergio', 'sergio', '81dc9bdb52d04dc20036dbd8313ed055'),
(5, 'Lazaro', 'lazaro', '631f570cae53805efcf0987d6aa02c6b');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFactura` int(11) NOT NULL,
  `numeroFactura` int(11) NOT NULL,
  `empleado` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  `numeroMesa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFactura`, `numeroFactura`, `empleado`, `fecha`, `numeroMesa`) VALUES
(1, 2, 'Bryan', '2022-03-05 00:00:00', 1),
(2, 6, 'Bryan', '2022-03-05 00:00:00', 1),
(3, 7, 'Bryan', '2022-03-05 00:00:00', 1),
(4, 7, 'Bryan', '2022-03-05 00:00:00', 1),
(5, 9, 'Bryan', '2022-03-05 00:00:00', 1),
(6, 7, 'Bryan', '2022-03-05 16:18:14', 1),
(7, 7, 'Bryan', '2022-03-05 16:24:43', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineasfacturas`
--

CREATE TABLE `lineasfacturas` (
  `idLineaFactura` int(11) NOT NULL,
  `fnumeroFactura` int(11) NOT NULL,
  `nombreProducto` varchar(50) NOT NULL,
  `referenciaProducto` varchar(10) NOT NULL,
  `precioProducto` float NOT NULL,
  `ivaProducto` int(11) NOT NULL,
  `cantidadProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lineasfacturas`
--

INSERT INTO `lineasfacturas` (`idLineaFactura`, `fnumeroFactura`, `nombreProducto`, `referenciaProducto`, `precioProducto`, `ivaProducto`, `cantidadProducto`) VALUES
(1, 2, 'COCACOLA', 'REF1', 1.5, 21, 3),
(2, 2, 'NACHORREP', 'ENT3', 6, 21, 2),
(3, 6, 'COCACOLA', 'REF1', 1.5, 21, 7),
(4, 6, 'COCACOLA ZERO', 'REF2', 1.5, 21, 1),
(5, 6, 'SPRITE', 'REF8', 1.5, 21, 1),
(6, 6, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 1),
(7, 6, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 1),
(8, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 3),
(9, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 2),
(10, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 3),
(11, 7, 'COCACOLA', 'REF1', 1.5, 21, 4),
(12, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 3),
(13, 7, 'SPRITE', 'REF8', 1.5, 21, 7),
(14, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(15, 7, 'FROZEN', 'POS2', 3.5, 10, 2),
(16, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(17, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(18, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(19, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(20, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 1),
(21, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 1),
(22, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 1),
(23, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 1),
(24, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 1),
(25, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(26, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(27, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(28, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 1),
(29, 7, 'FROZEN BOMB', 'POS3', 4, 10, 1),
(30, 7, 'ICAKE', 'POS4', 3.5, 10, 1),
(31, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 2),
(32, 7, 'PATATAS GAJO', 'COM2', 3, 10, 1),
(33, 7, 'BATATAS', 'COM3', 3.5, 10, 1),
(34, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 3),
(35, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 2),
(36, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 3),
(37, 7, 'COCACOLA', 'REF1', 1.5, 21, 4),
(38, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 3),
(39, 7, 'SPRITE', 'REF8', 1.5, 21, 7),
(40, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(41, 7, 'FROZEN', 'POS2', 3.5, 10, 2),
(42, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(43, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(44, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(45, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(46, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 1),
(47, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 1),
(48, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 1),
(49, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 1),
(50, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 1),
(51, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(52, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(53, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(54, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 1),
(55, 7, 'FROZEN BOMB', 'POS3', 4, 10, 1),
(56, 7, 'ICAKE', 'POS4', 3.5, 10, 1),
(57, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 2),
(58, 7, 'PATATAS GAJO', 'COM2', 3, 10, 1),
(59, 7, 'BATATAS', 'COM3', 3.5, 10, 1),
(60, 9, 'COCACOLA', 'REF1', 1.5, 21, 1),
(61, 9, 'CRISPY CHICKEN WINGS', 'ENT1', 5, 10, 1),
(62, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 3),
(63, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 2),
(64, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 3),
(65, 7, 'COCACOLA', 'REF1', 1.5, 21, 4),
(66, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 3),
(67, 7, 'SPRITE', 'REF8', 1.5, 21, 7),
(68, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(69, 7, 'FROZEN', 'POS2', 3.5, 10, 2),
(70, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(71, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(72, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(73, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(74, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 1),
(75, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 1),
(76, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 1),
(77, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 1),
(78, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 1),
(79, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(80, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(81, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(82, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 1),
(83, 7, 'FROZEN BOMB', 'POS3', 4, 10, 1),
(84, 7, 'ICAKE', 'POS4', 3.5, 10, 1),
(85, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 2),
(86, 7, 'PATATAS GAJO', 'COM2', 3, 10, 1),
(87, 7, 'BATATAS', 'COM3', 3.5, 10, 1),
(88, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 3),
(89, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 2),
(90, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 3),
(91, 7, 'COCACOLA', 'REF1', 1.5, 21, 4),
(92, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 3),
(93, 7, 'SPRITE', 'REF8', 1.5, 21, 7),
(94, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(95, 7, 'FROZEN', 'POS2', 3.5, 10, 2),
(96, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(97, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(98, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(99, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(100, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 2),
(101, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 3),
(102, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 2),
(103, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 2),
(104, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 1),
(105, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(106, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(107, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(108, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 1),
(109, 7, 'FROZEN BOMB', 'POS3', 4, 10, 1),
(110, 7, 'ICAKE', 'POS4', 3.5, 10, 1),
(111, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 2),
(112, 7, 'PATATAS GAJO', 'COM2', 3, 10, 1),
(113, 7, 'BATATAS', 'COM3', 3.5, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineaspedidos`
--

CREATE TABLE `lineaspedidos` (
  `idLineaPedido` int(11) NOT NULL,
  `fidMesa` int(11) NOT NULL,
  `freferenciaProducto` varchar(10) NOT NULL,
  `tipoProducto` int(11) NOT NULL,
  `nombreProducto` varchar(50) NOT NULL,
  `descripcionProducto` varchar(100) NOT NULL,
  `precioProducto` float NOT NULL,
  `ivaProducto` int(11) NOT NULL,
  `cantidadProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lineaspedidos`
--

INSERT INTO `lineaspedidos` (`idLineaPedido`, `fidMesa`, `freferenciaProducto`, `tipoProducto`, `nombreProducto`, `descripcionProducto`, `precioProducto`, `ivaProducto`, `cantidadProducto`) VALUES
(1, 2, 'REF1', 1, 'COCACOLA', 'COCACOLA', 1.5, 21, 15),
(2, 2, 'ENT3', 2, 'NACHORREP', 'MACARRONES', 6, 21, 2),
(3, 6, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 13),
(4, 6, 'REF2', 1, 'COCACOLA ZERO', '', 1.5, 21, 10),
(5, 6, 'REF8', 1, 'SPRITE', '', 1.5, 21, 9),
(6, 6, 'HAM1', 5, 'HAMBURGUESA LA GRETA', '', 9.75, 10, 8),
(7, 6, 'HAM3', 5, 'HAMBURGUESA PIGMA', '', 9, 10, 3),
(8, 7, 'REF4', 1, 'FANTA NARANJA', '', 1.5, 21, 4),
(9, 7, 'HAM5', 5, 'HAMBURGUESA POLLOTARIANA', '', 9, 10, 5),
(10, 7, 'COM4', 4, 'BACON & CHEESE', '', 4.3, 10, 6),
(11, 7, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 7),
(12, 7, 'REF2', 1, 'COCACOLA ZERO', '', 1.5, 21, 10),
(13, 7, 'REF8', 1, 'SPRITE', '', 1.5, 21, 9),
(14, 7, 'REF7', 1, 'MOUNTAIN DEW', '', 2, 21, 4),
(15, 7, 'POS2', 6, 'FROZEN', '', 3.5, 10, 4),
(16, 7, 'REF15', 1, 'HEINEKEN', '', 3, 21, 2),
(17, 7, 'REF14', 1, 'CERVEZA ESTRELLA GALICIA', '', 1.2, 21, 1),
(18, 7, 'REF17', 1, 'RED BULL', '', 2.1, 21, 1),
(19, 7, 'REF16', 1, 'AQUARIUS', '', 1.5, 21, 1),
(20, 7, 'HAM1', 5, 'HAMBURGUESA LA GRETA', '', 9.75, 10, 8),
(21, 7, 'HAM2', 5, 'HAMBURGUESA LA SMOKE', '', 8.5, 10, 8),
(22, 7, 'HAM3', 5, 'HAMBURGUESA PIGMA', '', 9, 10, 3),
(23, 7, 'HAM4', 5, 'HAMBURGUESA CHIPOTLE', '', 9.2, 10, 4),
(24, 7, 'HAM6', 5, 'HAMBURGUESA KEVIN CHICK', '', 10, 10, 1),
(25, 7, 'HAM7', 5, 'HAMBURGUESA LA KIKI', '', 9.2, 10, 1),
(26, 7, 'HAM8', 5, 'HAMBURGUESA YANKEE', '', 8.5, 10, 1),
(27, 7, 'HAM9', 5, 'HAMBURGUESA EDAMAMI', '', 8, 10, 1),
(28, 7, 'POS1', 6, 'TARTA DE QUESO', '', 4, 10, 2),
(29, 7, 'POS3', 6, 'FROZEN BOMB', '', 4, 10, 2),
(30, 7, 'POS4', 6, 'ICAKE', '', 3.5, 10, 2),
(31, 7, 'COM1', 4, 'PATATAS FRITAS', '', 3, 10, 4),
(32, 7, 'COM2', 4, 'PATATAS GAJO', '', 3, 10, 3),
(33, 7, 'COM3', 4, 'BATATAS', '', 3.5, 10, 2),
(34, 9, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 4),
(35, 9, 'ENT1', 2, 'CRISPY CHICKEN WINGS', '', 5, 10, 2),
(36, 12, 'HAM1', 5, 'HAMBURGUESA LA GRETA', '', 9.75, 10, 7),
(37, 12, 'REF4', 1, 'FANTA NARANJA', '', 1.5, 21, 2),
(38, 12, 'REF8', 1, 'SPRITE', '', 1.5, 21, 3),
(39, 12, 'POS3', 6, 'FROZEN BOMB', '', 4, 10, 2),
(40, 12, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 4),
(41, 12, 'POS1', 6, 'TARTA DE QUESO', '', 4, 10, 2),
(42, 12, 'HAM5', 5, 'HAMBURGUESA POLLOTARIANA', '', 9, 10, 4),
(43, 12, 'COM1', 4, 'PATATAS FRITAS', '', 3, 10, 3),
(44, 12, 'COM2', 4, 'PATATAS GAJO', '', 3, 10, 3),
(45, 12, 'HAM4', 5, 'HAMBURGUESA CHIPOTLE', '', 9.2, 10, 2),
(46, 12, 'HAM8', 5, 'HAMBURGUESA YANKEE', '', 8.5, 10, 1),
(47, 12, 'HAM9', 5, 'HAMBURGUESA EDAMAMI', '', 8, 10, 1),
(48, 12, 'REF2', 1, 'COCACOLA ZERO', '', 1.5, 21, 8),
(49, 12, 'REF14', 1, 'CERVEZA ESTRELLA GALICIA', '', 1.2, 21, 1),
(50, 12, 'REF7', 1, 'MOUNTAIN DEW', '', 2, 21, 1),
(51, 12, 'HAM2', 5, 'HAMBURGUESA LA SMOKE', '', 8.5, 10, 6),
(52, 3, 'HAM1', 5, 'HAMBURGUESA LA GRETA', '', 9.75, 10, 4),
(53, 3, 'HAM4', 5, 'HAMBURGUESA CHIPOTLE', '', 9.2, 10, 1),
(54, 3, 'HAM2', 5, 'HAMBURGUESA LA SMOKE', '', 8.5, 10, 6),
(55, 3, 'COM1', 4, 'PATATAS FRITAS', '', 3, 10, 3),
(56, 3, 'COM3', 4, 'BATATAS', '', 3.5, 10, 2),
(57, 3, 'COM4', 4, 'BACON & CHEESE', '', 4.3, 10, 4),
(58, 3, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 4),
(59, 3, 'REF2', 1, 'COCACOLA ZERO', '', 1.5, 21, 8),
(60, 3, 'REF8', 1, 'SPRITE', '', 1.5, 21, 3),
(61, 3, 'REF7', 1, 'MOUNTAIN DEW', '', 2, 21, 1),
(62, 3, 'ENS3', 3, 'SANA HORIA', '', 7.5, 10, 1),
(63, 4, 'ENS1', 3, 'AVE CÉSAR', '', 8, 10, 1),
(64, 4, 'REF2', 1, 'COCACOLA ZERO', '', 1.5, 21, 5),
(65, 4, 'REF8', 1, 'SPRITE', '', 1.5, 21, 2),
(66, 4, 'REF16', 1, 'AQUARIUS', '', 1.5, 21, 1),
(67, 4, 'COM1', 4, 'PATATAS FRITAS', '', 3, 10, 3),
(68, 4, 'COM2', 4, 'PATATAS GAJO', '', 3, 10, 3),
(69, 4, 'COM3', 4, 'BATATAS', '', 3.5, 10, 2),
(70, 4, 'COM4', 4, 'BACON & CHEESE', '', 4.3, 10, 4),
(71, 4, 'HAM2', 5, 'HAMBURGUESA LA SMOKE', '', 8.5, 10, 5),
(72, 4, 'HAM3', 5, 'HAMBURGUESA PIGMA', '', 9, 10, 2),
(73, 4, 'HAM4', 5, 'HAMBURGUESA CHIPOTLE', '', 9.2, 10, 1),
(74, 4, 'HAM1', 5, 'HAMBURGUESA LA GRETA', '', 9.75, 10, 4),
(75, 4, 'HAM5', 5, 'HAMBURGUESA POLLOTARIANA', '', 9, 10, 2),
(76, 4, 'HAM6', 5, 'HAMBURGUESA KEVIN CHICK', '', 10, 10, 1),
(77, 4, 'HAM9', 5, 'HAMBURGUESA EDAMAMI', '', 8, 10, 1),
(78, 4, 'HAM8', 5, 'HAMBURGUESA YANKEE', '', 8.5, 10, 1),
(79, 4, 'HAM7', 5, 'HAMBURGUESA LA KIKI', '', 9.2, 10, 1),
(80, 4, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 1),
(81, 4, 'REF14', 1, 'CERVEZA ESTRELLA GALICIA', '', 1.2, 21, 1),
(82, 4, 'REF7', 1, 'MOUNTAIN DEW', '', 2, 21, 1),
(83, 4, 'REF15', 1, 'HEINEKEN', '', 3, 21, 1),
(84, 4, 'REF17', 1, 'RED BULL', '', 2.1, 21, 1),
(85, 4, 'POS2', 6, 'FROZEN', '', 3.5, 10, 3),
(86, 4, 'POS4', 6, 'ICAKE', '', 3.5, 10, 2),
(87, 4, 'POS1', 6, 'TARTA DE QUESO', '', 4, 10, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `idMesa` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`idMesa`, `numero`, `estado`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 2, 1),
(4, 5, 1),
(5, 4, 1),
(6, 1, 0),
(7, 1, 0),
(12, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `referencia` varchar(10) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` float NOT NULL,
  `iva` int(11) NOT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `tipo`, `nombre`, `referencia`, `descripcion`, `stock`, `precio`, `iva`, `imagen`) VALUES
(1, 1, 'COCACOLA', 'REF1', '', 19, 1.5, 21, 'refrescos/cocacola.jpg'),
(2, 1, 'COCACOLA ZERO', 'REF2', '', 20, 1.5, 21, 'refrescos/cocacolazero.png'),
(4, 1, 'FANTA NARANJA', 'REF4', '', 20, 1.5, 21, 'refrescos/fanta.png'),
(7, 1, 'MOUNTAIN DEW', 'REF7', '', 20, 2, 21, 'refrescos/mountaindew.png'),
(8, 1, 'SPRITE', 'REF8', '', 20, 1.5, 21, 'refrescos/sprite.jpg'),
(14, 1, 'CERVEZA ESTRELLA GALICIA', 'REF14', '', 20, 1.2, 21, 'refrescos/estrellagalicia.jpg'),
(15, 1, 'HEINEKEN', 'REF15', '', 20, 3, 21, 'refrescos/heineken.png'),
(17, 2, 'CRISPY CHICKEN WINGS', 'ENT1', '', 20, 5, 10, 'entrantes/crispy.png'),
(18, 2, 'TEQUES', 'ENT2', '', 20, 4.5, 10, 'entrantes/teques.png'),
(19, 2, 'NACHORREO', 'ENT3', '', 20, 6, 10, 'entrantes/nachos.png'),
(20, 2, 'HUMMUS SAPIENS', 'ENT4', '', 20, 4.2, 10, 'entrantes/hummus.png'),
(21, 3, 'AVE CÉSAR', 'ENS1', '', 20, 8, 10, 'ensaladas/cesar.PNG'),
(22, 3, 'THAI CHICKEN', 'ENS2', '', 20, 9, 10, 'ensaladas/thai.PNG'),
(23, 3, 'SANA HORIA', 'ENS3', '', 20, 7.5, 10, 'ensaladas/sanahoria.PNG'),
(24, 4, 'PATATAS FRITAS', 'COM1', '', 20, 3, 10, 'complementos/patatas.png'),
(25, 4, 'PATATAS GAJO', 'COM2', '', 20, 3, 10, 'complementos/gajos.png'),
(26, 4, 'BATATAS', 'COM3', '', 20, 3.5, 10, 'complementos/batata.png'),
(27, 4, 'BACON & CHEESE', 'COM4', '', 20, 4.3, 10, 'complementos/baconcheese.png'),
(28, 5, 'HAMBURGUESA LA GRETA', 'HAM1', '', 20, 9.75, 10, 'hamburguesas/greta.PNG'),
(29, 5, 'HAMBURGUESA LA SMOKE', 'HAM2', '', 20, 8.5, 10, 'hamburguesas/smoke.PNG'),
(30, 5, 'HAMBURGUESA PIGMA', 'HAM3', '', 20, 9, 10, 'hamburguesas/pigma.PNG'),
(31, 5, 'HAMBURGUESA CHIPOTLE', 'HAM4', '', 20, 9.2, 10, 'hamburguesas/chipotle.PNG'),
(32, 5, 'HAMBURGUESA POLLOTARIANA', 'HAM5', '', 20, 9, 10, 'hamburguesas/pollotariana.PNG'),
(33, 5, 'HAMBURGUESA KEVIN CHICK', 'HAM6', '', 20, 10, 10, 'hamburguesas/kevin.PNG'),
(34, 5, 'HAMBURGUESA LA KIKI', 'HAM7', '', 20, 9.2, 10, 'hamburguesas/kiki.PNG'),
(35, 5, 'HAMBURGUESA YANKEE', 'HAM8', '', 20, 8.5, 10, 'hamburguesas/yankee.PNG'),
(36, 5, 'HAMBURGUESA EDAMAMI', 'HAM9', '', 20, 8, 10, 'hamburguesas/edamami.PNG'),
(37, 6, 'TARTA DE QUESO', 'POS1', '', 20, 4, 10, 'postres/queso.png'),
(38, 6, 'FROZEN', 'POS2', '', 20, 3.5, 10, 'postres/frozen.png'),
(39, 6, 'FROZEN BOMB', 'POS3', '', 20, 4, 10, 'postres/bomb.PNG'),
(40, 6, 'ICAKE', 'POS4', '', 20, 3.5, 10, 'postres/icake.PNG'),
(41, 1, 'AQUARIUS', 'REF16', '', 20, 1.5, 21, 'refrescos/aquarius.jpg'),
(42, 1, 'RED BULL', 'REF17', '', 20, 2.1, 21, 'refrescos/redbull.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFactura`);

--
-- Indices de la tabla `lineasfacturas`
--
ALTER TABLE `lineasfacturas`
  ADD PRIMARY KEY (`idLineaFactura`);

--
-- Indices de la tabla `lineaspedidos`
--
ALTER TABLE `lineaspedidos`
  ADD PRIMARY KEY (`idLineaPedido`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`idMesa`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `lineasfacturas`
--
ALTER TABLE `lineasfacturas`
  MODIFY `idLineaFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de la tabla `lineaspedidos`
--
ALTER TABLE `lineaspedidos`
  MODIFY `idLineaPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `idMesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
