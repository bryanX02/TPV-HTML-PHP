-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-03-2022 a las 20:57:03
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
(7, 7, 'Bryan', '2022-03-05 16:24:43', 1),
(8, 3, 'Bryan', '2022-03-05 19:42:00', 2),
(9, 7, 'Bryan', '2022-03-05 19:45:02', 1),
(10, 7, 'Bryan', '2022-03-05 19:46:17', 1),
(11, 7, 'Bryan', '2022-03-05 19:49:24', 1),
(12, 13, 'Bryan', '2022-03-05 19:49:41', 2),
(13, 7, 'Bryan', '2022-03-05 19:51:02', 1),
(14, 7, 'Bryan', '2022-03-05 19:51:47', 1),
(15, 7, 'Bryan', '2022-03-05 19:53:06', 1),
(16, 7, 'Bryan', '2022-03-05 19:53:53', 1),
(17, 7, 'Bryan', '2022-03-05 19:54:44', 1),
(18, 7, 'Bryan', '2022-03-05 19:55:33', 1),
(19, 7, 'Bryan', '2022-03-05 19:59:15', 1),
(20, 24, 'Bryan', '2022-03-05 20:01:10', 1),
(21, 26, 'Bryan', '2022-03-05 20:03:34', 2),
(22, 25, 'Bryan', '2022-03-05 20:29:21', 1),
(23, 27, 'Bryan', '2022-03-05 20:47:30', 2),
(24, 28, '02bryanX', '2022-03-05 20:51:44', 1),
(25, 7, '02bryanX', '2022-03-05 20:54:09', 1),
(26, 7, '02bryanX', '2022-03-05 20:54:56', 1),
(27, 32, '02bryanX', '2022-03-05 20:55:51', 1);

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
(113, 7, 'BATATAS', 'COM3', 3.5, 10, 1),
(114, 3, 'COCACOLA', 'REF1', 1.5, 21, 4),
(115, 3, 'COCACOLA ZERO', 'REF2', 1.5, 21, 8),
(116, 3, 'MOUNTAIN DEW', 'REF7', 2, 21, 1),
(117, 3, 'SPRITE', 'REF8', 1.5, 21, 3),
(118, 3, 'SANA HORIA', 'ENS3', 7.5, 10, 1),
(119, 3, 'BACON & CHEESE', 'COM4', 4.3, 10, 4),
(120, 3, 'BATATAS', 'COM3', 3.5, 10, 2),
(121, 3, 'PATATAS FRITAS', 'COM1', 3, 10, 4),
(122, 3, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 1),
(123, 3, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 4),
(124, 3, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 6),
(125, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(126, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(127, 7, 'COCACOLA', 'REF1', 1.5, 21, 7),
(128, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 10),
(129, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 4),
(130, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(131, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(132, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(133, 7, 'SPRITE', 'REF8', 1.5, 21, 9),
(134, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 6),
(135, 7, 'BATATAS', 'COM3', 3.5, 10, 2),
(136, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 5),
(137, 7, 'PATATAS GAJO', 'COM2', 3, 10, 4),
(138, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 4),
(139, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(140, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 1),
(141, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 8),
(142, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(143, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 8),
(144, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 3),
(145, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 5),
(146, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(147, 7, 'FROZEN', 'POS2', 3.5, 10, 4),
(148, 7, 'FROZEN BOMB', 'POS3', 4, 10, 2),
(149, 7, 'ICAKE', 'POS4', 3.5, 10, 2),
(150, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 2),
(151, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(152, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(153, 7, 'COCACOLA', 'REF1', 1.5, 21, 7),
(154, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 10),
(155, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 4),
(156, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(157, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(158, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(159, 7, 'SPRITE', 'REF8', 1.5, 21, 9),
(160, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 6),
(161, 7, 'BATATAS', 'COM3', 3.5, 10, 2),
(162, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 5),
(163, 7, 'PATATAS GAJO', 'COM2', 3, 10, 4),
(164, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 4),
(165, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(166, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 1),
(167, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 8),
(168, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(169, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 8),
(170, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 3),
(171, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 5),
(172, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(173, 7, 'FROZEN', 'POS2', 3.5, 10, 4),
(174, 7, 'FROZEN BOMB', 'POS3', 4, 10, 2),
(175, 7, 'ICAKE', 'POS4', 3.5, 10, 2),
(176, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 2),
(177, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(178, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(179, 7, 'COCACOLA', 'REF1', 1.5, 21, 7),
(180, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 10),
(181, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 4),
(182, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(183, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(184, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(185, 7, 'SPRITE', 'REF8', 1.5, 21, 9),
(186, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 6),
(187, 7, 'BATATAS', 'COM3', 3.5, 10, 2),
(188, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 5),
(189, 7, 'PATATAS GAJO', 'COM2', 3, 10, 4),
(190, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 4),
(191, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(192, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 1),
(193, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 8),
(194, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(195, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 8),
(196, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 3),
(197, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 5),
(198, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(199, 7, 'FROZEN', 'POS2', 3.5, 10, 4),
(200, 7, 'FROZEN BOMB', 'POS3', 4, 10, 2),
(201, 7, 'ICAKE', 'POS4', 3.5, 10, 2),
(202, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 2),
(203, 13, 'CRISPY CHICKEN WINGS', 'ENT1', 5, 10, 1),
(204, 13, 'TEQUES', 'ENT2', 4.5, 10, 1),
(205, 13, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 1),
(206, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(207, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(208, 7, 'COCACOLA', 'REF1', 1.5, 21, 7),
(209, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 10),
(210, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 4),
(211, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(212, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(213, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(214, 7, 'SPRITE', 'REF8', 1.5, 21, 9),
(215, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 6),
(216, 7, 'BATATAS', 'COM3', 3.5, 10, 2),
(217, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 5),
(218, 7, 'PATATAS GAJO', 'COM2', 3, 10, 4),
(219, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 4),
(220, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(221, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 1),
(222, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 8),
(223, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(224, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 8),
(225, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 3),
(226, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 5),
(227, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(228, 7, 'FROZEN', 'POS2', 3.5, 10, 4),
(229, 7, 'FROZEN BOMB', 'POS3', 4, 10, 2),
(230, 7, 'ICAKE', 'POS4', 3.5, 10, 2),
(231, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 2),
(232, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(233, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(234, 7, 'COCACOLA', 'REF1', 1.5, 21, 7),
(235, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 10),
(236, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 4),
(237, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(238, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(239, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(240, 7, 'SPRITE', 'REF8', 1.5, 21, 9),
(241, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 6),
(242, 7, 'BATATAS', 'COM3', 3.5, 10, 2),
(243, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 5),
(244, 7, 'PATATAS GAJO', 'COM2', 3, 10, 4),
(245, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 4),
(246, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(247, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 1),
(248, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 8),
(249, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(250, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 8),
(251, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 3),
(252, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 5),
(253, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(254, 7, 'FROZEN', 'POS2', 3.5, 10, 4),
(255, 7, 'FROZEN BOMB', 'POS3', 4, 10, 2),
(256, 7, 'ICAKE', 'POS4', 3.5, 10, 2),
(257, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 2),
(258, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(259, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(260, 7, 'COCACOLA', 'REF1', 1.5, 21, 7),
(261, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 10),
(262, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 4),
(263, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(264, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(265, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(266, 7, 'SPRITE', 'REF8', 1.5, 21, 9),
(267, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 6),
(268, 7, 'BATATAS', 'COM3', 3.5, 10, 2),
(269, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 5),
(270, 7, 'PATATAS GAJO', 'COM2', 3, 10, 4),
(271, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 4),
(272, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(273, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 1),
(274, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 8),
(275, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(276, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 8),
(277, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 3),
(278, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 5),
(279, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(280, 7, 'FROZEN', 'POS2', 3.5, 10, 4),
(281, 7, 'FROZEN BOMB', 'POS3', 4, 10, 2),
(282, 7, 'ICAKE', 'POS4', 3.5, 10, 2),
(283, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 2),
(284, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(285, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(286, 7, 'COCACOLA', 'REF1', 1.5, 21, 7),
(287, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 10),
(288, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 4),
(289, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(290, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(291, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(292, 7, 'SPRITE', 'REF8', 1.5, 21, 9),
(293, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 6),
(294, 7, 'BATATAS', 'COM3', 3.5, 10, 2),
(295, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 5),
(296, 7, 'PATATAS GAJO', 'COM2', 3, 10, 4),
(297, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 4),
(298, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(299, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 1),
(300, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 8),
(301, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(302, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 8),
(303, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 3),
(304, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 5),
(305, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(306, 7, 'FROZEN', 'POS2', 3.5, 10, 4),
(307, 7, 'FROZEN BOMB', 'POS3', 4, 10, 2),
(308, 7, 'ICAKE', 'POS4', 3.5, 10, 2),
(309, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 2),
(310, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(311, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(312, 7, 'COCACOLA', 'REF1', 1.5, 21, 7),
(313, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 10),
(314, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 4),
(315, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(316, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(317, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(318, 7, 'SPRITE', 'REF8', 1.5, 21, 9),
(319, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 6),
(320, 7, 'BATATAS', 'COM3', 3.5, 10, 2),
(321, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 5),
(322, 7, 'PATATAS GAJO', 'COM2', 3, 10, 4),
(323, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 4),
(324, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(325, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 1),
(326, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 8),
(327, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(328, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 8),
(329, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 3),
(330, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 5),
(331, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(332, 7, 'FROZEN', 'POS2', 3.5, 10, 4),
(333, 7, 'FROZEN BOMB', 'POS3', 4, 10, 2),
(334, 7, 'ICAKE', 'POS4', 3.5, 10, 2),
(335, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 2),
(336, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(337, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(338, 7, 'COCACOLA', 'REF1', 1.5, 21, 7),
(339, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 10),
(340, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 4),
(341, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(342, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(343, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(344, 7, 'SPRITE', 'REF8', 1.5, 21, 9),
(345, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 6),
(346, 7, 'BATATAS', 'COM3', 3.5, 10, 2),
(347, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 5),
(348, 7, 'PATATAS GAJO', 'COM2', 3, 10, 4),
(349, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 4),
(350, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(351, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 1),
(352, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 8),
(353, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(354, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 8),
(355, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 3),
(356, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 5),
(357, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(358, 7, 'FROZEN', 'POS2', 3.5, 10, 4),
(359, 7, 'FROZEN BOMB', 'POS3', 4, 10, 2),
(360, 7, 'ICAKE', 'POS4', 3.5, 10, 2),
(361, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 2),
(362, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(363, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(364, 7, 'COCACOLA', 'REF1', 1.5, 21, 7),
(365, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 10),
(366, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 4),
(367, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(368, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(369, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(370, 7, 'SPRITE', 'REF8', 1.5, 21, 9),
(371, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 6),
(372, 7, 'BATATAS', 'COM3', 3.5, 10, 2),
(373, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 5),
(374, 7, 'PATATAS GAJO', 'COM2', 3, 10, 4),
(375, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 4),
(376, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(377, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 1),
(378, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 8),
(379, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(380, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 8),
(381, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 3),
(382, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 5),
(383, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(384, 7, 'FROZEN', 'POS2', 3.5, 10, 4),
(385, 7, 'FROZEN BOMB', 'POS3', 4, 10, 2),
(386, 7, 'ICAKE', 'POS4', 3.5, 10, 2),
(387, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 2),
(388, 24, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(389, 24, 'COCACOLA', 'REF1', 1.5, 21, 1),
(390, 24, 'COCACOLA ZERO', 'REF2', 1.5, 21, 1),
(391, 24, 'HEINEKEN', 'REF15', 3, 21, 1),
(392, 24, 'MOUNTAIN DEW', 'REF7', 2, 21, 1),
(393, 24, 'SPRITE', 'REF8', 1.5, 21, 1),
(394, 24, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 1),
(395, 24, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 1),
(396, 24, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 1),
(397, 24, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(398, 26, 'COCACOLA', 'REF1', 1.5, 21, 1),
(399, 26, 'COCACOLA ZERO', 'REF2', 1.5, 21, 1),
(400, 26, 'MOUNTAIN DEW', 'REF7', 2, 21, 1),
(401, 26, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(402, 26, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 1),
(403, 26, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 1),
(404, 26, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(405, 25, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 2),
(406, 25, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(407, 25, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 3),
(408, 25, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 1),
(409, 25, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 2),
(410, 25, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 2),
(411, 25, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 1),
(412, 25, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 3),
(413, 25, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(414, 27, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(415, 27, 'COCACOLA', 'REF1', 1.5, 21, 1),
(416, 27, 'COCACOLA ZERO', 'REF2', 1.5, 21, 1),
(417, 27, 'FANTA NARANJA', 'REF4', 1.5, 21, 1),
(418, 27, 'CRISPY CHICKEN WINGS', 'ENT1', 5, 10, 1),
(419, 27, 'TEQUES', 'ENT2', 4.5, 10, 1),
(420, 27, 'BACON & CHEESE', 'COM4', 4.3, 10, 1),
(421, 27, 'PATATAS FRITAS', 'COM1', 3, 10, 3),
(422, 27, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 1),
(423, 27, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 1),
(424, 27, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 1),
(425, 27, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 3),
(426, 28, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(427, 28, 'RED BULL', 'REF17', 2.1, 21, 1),
(428, 28, 'HUMMUS SAPIENS', 'ENT4', 4.2, 10, 2),
(429, 28, 'NACHORREO', 'ENT3', 6, 10, 1),
(430, 28, 'TEQUES', 'ENT2', 4.5, 10, 7),
(431, 28, 'FROZEN', 'POS2', 3.5, 10, 1),
(432, 28, 'ICAKE', 'POS4', 3.5, 10, 1),
(433, 28, 'TARTA DE QUESO', 'POS1', 4, 10, 2),
(434, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(435, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(436, 7, 'COCACOLA', 'REF1', 1.5, 21, 7),
(437, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 10),
(438, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 4),
(439, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(440, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(441, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(442, 7, 'SPRITE', 'REF8', 1.5, 21, 11),
(443, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 6),
(444, 7, 'BATATAS', 'COM3', 3.5, 10, 2),
(445, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 7),
(446, 7, 'PATATAS GAJO', 'COM2', 3, 10, 4),
(447, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 5),
(448, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(449, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 3),
(450, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 8),
(451, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 2),
(452, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 9),
(453, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 3),
(454, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 9),
(455, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(456, 7, 'FROZEN', 'POS2', 3.5, 10, 4),
(457, 7, 'FROZEN BOMB', 'POS3', 4, 10, 2),
(458, 7, 'ICAKE', 'POS4', 3.5, 10, 2),
(459, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 3),
(460, 7, 'AQUARIUS', 'REF16', 1.5, 21, 1),
(461, 7, 'CERVEZA ESTRELLA GALICIA', 'REF14', 1.2, 21, 1),
(462, 7, 'COCACOLA', 'REF1', 1.5, 21, 7),
(463, 7, 'COCACOLA ZERO', 'REF2', 1.5, 21, 10),
(464, 7, 'FANTA NARANJA', 'REF4', 1.5, 21, 4),
(465, 7, 'HEINEKEN', 'REF15', 3, 21, 2),
(466, 7, 'MOUNTAIN DEW', 'REF7', 2, 21, 4),
(467, 7, 'RED BULL', 'REF17', 2.1, 21, 1),
(468, 7, 'SPRITE', 'REF8', 1.5, 21, 11),
(469, 7, 'BACON & CHEESE', 'COM4', 4.3, 10, 6),
(470, 7, 'BATATAS', 'COM3', 3.5, 10, 2),
(471, 7, 'PATATAS FRITAS', 'COM1', 3, 10, 7),
(472, 7, 'PATATAS GAJO', 'COM2', 3, 10, 4),
(473, 7, 'HAMBURGUESA CHIPOTLE', 'HAM4', 9.2, 10, 5),
(474, 7, 'HAMBURGUESA EDAMAMI', 'HAM9', 8, 10, 1),
(475, 7, 'HAMBURGUESA KEVIN CHICK', 'HAM6', 10, 10, 3),
(476, 7, 'HAMBURGUESA LA GRETA', 'HAM1', 9.75, 10, 8),
(477, 7, 'HAMBURGUESA LA KIKI', 'HAM7', 9.2, 10, 2),
(478, 7, 'HAMBURGUESA LA SMOKE', 'HAM2', 8.5, 10, 9),
(479, 7, 'HAMBURGUESA PIGMA', 'HAM3', 9, 10, 3),
(480, 7, 'HAMBURGUESA POLLOTARIANA', 'HAM5', 9, 10, 9),
(481, 7, 'HAMBURGUESA YANKEE', 'HAM8', 8.5, 10, 1),
(482, 7, 'FROZEN', 'POS2', 3.5, 10, 4),
(483, 7, 'FROZEN BOMB', 'POS3', 4, 10, 2),
(484, 7, 'ICAKE', 'POS4', 3.5, 10, 2),
(485, 7, 'TARTA DE QUESO', 'POS1', 4, 10, 3),
(486, 32, 'COCACOLA', 'REF1', 1.5, 21, 1),
(487, 32, 'MOUNTAIN DEW', 'REF7', 2, 21, 1),
(488, 32, 'SPRITE', 'REF8', 1.5, 21, 4);

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
(5, 6, 'REF8', 1, 'SPRITE', '', 1.5, 21, 14),
(6, 6, 'HAM1', 5, 'HAMBURGUESA LA GRETA', '', 9.75, 10, 8),
(7, 6, 'HAM3', 5, 'HAMBURGUESA PIGMA', '', 9, 10, 3),
(8, 7, 'REF4', 1, 'FANTA NARANJA', '', 1.5, 21, 4),
(9, 7, 'HAM5', 5, 'HAMBURGUESA POLLOTARIANA', '', 9, 10, 9),
(10, 7, 'COM4', 4, 'BACON & CHEESE', '', 4.3, 10, 6),
(11, 7, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 7),
(12, 7, 'REF2', 1, 'COCACOLA ZERO', '', 1.5, 21, 10),
(13, 7, 'REF8', 1, 'SPRITE', '', 1.5, 21, 14),
(14, 7, 'REF7', 1, 'MOUNTAIN DEW', '', 2, 21, 4),
(15, 7, 'POS2', 6, 'FROZEN', '', 3.5, 10, 4),
(16, 7, 'REF15', 1, 'HEINEKEN', '', 3, 21, 2),
(17, 7, 'REF14', 1, 'CERVEZA ESTRELLA GALICIA', '', 1.2, 21, 1),
(18, 7, 'REF17', 1, 'RED BULL', '', 2.1, 21, 1),
(19, 7, 'REF16', 1, 'AQUARIUS', '', 1.5, 21, 1),
(20, 7, 'HAM1', 5, 'HAMBURGUESA LA GRETA', '', 9.75, 10, 8),
(21, 7, 'HAM2', 5, 'HAMBURGUESA LA SMOKE', '', 8.5, 10, 9),
(22, 7, 'HAM3', 5, 'HAMBURGUESA PIGMA', '', 9, 10, 3),
(23, 7, 'HAM4', 5, 'HAMBURGUESA CHIPOTLE', '', 9.2, 10, 5),
(24, 7, 'HAM6', 5, 'HAMBURGUESA KEVIN CHICK', '', 10, 10, 3),
(25, 7, 'HAM7', 5, 'HAMBURGUESA LA KIKI', '', 9.2, 10, 2),
(26, 7, 'HAM8', 5, 'HAMBURGUESA YANKEE', '', 8.5, 10, 1),
(27, 7, 'HAM9', 5, 'HAMBURGUESA EDAMAMI', '', 8, 10, 1),
(28, 7, 'POS1', 6, 'TARTA DE QUESO', '', 4, 10, 3),
(29, 7, 'POS3', 6, 'FROZEN BOMB', '', 4, 10, 2),
(30, 7, 'POS4', 6, 'ICAKE', '', 3.5, 10, 2),
(31, 7, 'COM1', 4, 'PATATAS FRITAS', '', 3, 10, 7),
(32, 7, 'COM2', 4, 'PATATAS GAJO', '', 3, 10, 4),
(33, 7, 'COM3', 4, 'BATATAS', '', 3.5, 10, 2),
(34, 9, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 4),
(35, 9, 'ENT1', 2, 'CRISPY CHICKEN WINGS', '', 5, 10, 2),
(36, 12, 'HAM1', 5, 'HAMBURGUESA LA GRETA', '', 9.75, 10, 7),
(37, 12, 'REF4', 1, 'FANTA NARANJA', '', 1.5, 21, 2),
(38, 12, 'REF8', 1, 'SPRITE', '', 1.5, 21, 8),
(39, 12, 'POS3', 6, 'FROZEN BOMB', '', 4, 10, 2),
(40, 12, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 4),
(41, 12, 'POS1', 6, 'TARTA DE QUESO', '', 4, 10, 3),
(42, 12, 'HAM5', 5, 'HAMBURGUESA POLLOTARIANA', '', 9, 10, 8),
(43, 12, 'COM1', 4, 'PATATAS FRITAS', '', 3, 10, 6),
(44, 12, 'COM2', 4, 'PATATAS GAJO', '', 3, 10, 4),
(45, 12, 'HAM4', 5, 'HAMBURGUESA CHIPOTLE', '', 9.2, 10, 3),
(46, 12, 'HAM8', 5, 'HAMBURGUESA YANKEE', '', 8.5, 10, 1),
(47, 12, 'HAM9', 5, 'HAMBURGUESA EDAMAMI', '', 8, 10, 1),
(48, 12, 'REF2', 1, 'COCACOLA ZERO', '', 1.5, 21, 8),
(49, 12, 'REF14', 1, 'CERVEZA ESTRELLA GALICIA', '', 1.2, 21, 1),
(50, 12, 'REF7', 1, 'MOUNTAIN DEW', '', 2, 21, 1),
(51, 12, 'HAM2', 5, 'HAMBURGUESA LA SMOKE', '', 8.5, 10, 7),
(52, 3, 'HAM1', 5, 'HAMBURGUESA LA GRETA', '', 9.75, 10, 4),
(53, 3, 'HAM4', 5, 'HAMBURGUESA CHIPOTLE', '', 9.2, 10, 2),
(54, 3, 'HAM2', 5, 'HAMBURGUESA LA SMOKE', '', 8.5, 10, 7),
(55, 3, 'COM1', 4, 'PATATAS FRITAS', '', 3, 10, 6),
(56, 3, 'COM3', 4, 'BATATAS', '', 3.5, 10, 2),
(57, 3, 'COM4', 4, 'BACON & CHEESE', '', 4.3, 10, 4),
(58, 3, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 4),
(59, 3, 'REF2', 1, 'COCACOLA ZERO', '', 1.5, 21, 8),
(60, 3, 'REF8', 1, 'SPRITE', '', 1.5, 21, 8),
(61, 3, 'REF7', 1, 'MOUNTAIN DEW', '', 2, 21, 1),
(62, 3, 'ENS3', 3, 'SANA HORIA', '', 7.5, 10, 1),
(63, 4, 'ENS1', 3, 'AVE CÉSAR', '', 8, 10, 1),
(64, 4, 'REF2', 1, 'COCACOLA ZERO', '', 1.5, 21, 5),
(65, 4, 'REF8', 1, 'SPRITE', '', 1.5, 21, 7),
(66, 4, 'REF16', 1, 'AQUARIUS', '', 1.5, 21, 1),
(67, 4, 'COM1', 4, 'PATATAS FRITAS', '', 3, 10, 6),
(68, 4, 'COM2', 4, 'PATATAS GAJO', '', 3, 10, 4),
(69, 4, 'COM3', 4, 'BATATAS', '', 3.5, 10, 2),
(70, 4, 'COM4', 4, 'BACON & CHEESE', '', 4.3, 10, 4),
(71, 4, 'HAM2', 5, 'HAMBURGUESA LA SMOKE', '', 8.5, 10, 6),
(72, 4, 'HAM3', 5, 'HAMBURGUESA PIGMA', '', 9, 10, 2),
(73, 4, 'HAM4', 5, 'HAMBURGUESA CHIPOTLE', '', 9.2, 10, 2),
(74, 4, 'HAM1', 5, 'HAMBURGUESA LA GRETA', '', 9.75, 10, 4),
(75, 4, 'HAM5', 5, 'HAMBURGUESA POLLOTARIANA', '', 9, 10, 6),
(76, 4, 'HAM6', 5, 'HAMBURGUESA KEVIN CHICK', '', 10, 10, 3),
(77, 4, 'HAM9', 5, 'HAMBURGUESA EDAMAMI', '', 8, 10, 1),
(78, 4, 'HAM8', 5, 'HAMBURGUESA YANKEE', '', 8.5, 10, 1),
(79, 4, 'HAM7', 5, 'HAMBURGUESA LA KIKI', '', 9.2, 10, 2),
(80, 4, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 1),
(81, 4, 'REF14', 1, 'CERVEZA ESTRELLA GALICIA', '', 1.2, 21, 1),
(82, 4, 'REF7', 1, 'MOUNTAIN DEW', '', 2, 21, 1),
(83, 4, 'REF15', 1, 'HEINEKEN', '', 3, 21, 1),
(84, 4, 'REF17', 1, 'RED BULL', '', 2.1, 21, 1),
(85, 4, 'POS2', 6, 'FROZEN', '', 3.5, 10, 3),
(86, 4, 'POS4', 6, 'ICAKE', '', 3.5, 10, 2),
(87, 4, 'POS1', 6, 'TARTA DE QUESO', '', 4, 10, 3),
(88, 13, 'ENT1', 2, 'CRISPY CHICKEN WINGS', '', 5, 10, 1),
(89, 13, 'ENT2', 2, 'TEQUES', '', 4.5, 10, 7),
(90, 13, 'HAM1', 5, 'HAMBURGUESA LA GRETA', '', 9.75, 10, 1),
(91, 24, 'HAM1', 5, 'HAMBURGUESA LA GRETA', '', 9.75, 10, 1),
(92, 24, 'HAM2', 5, 'HAMBURGUESA LA SMOKE', '', 8.5, 10, 2),
(93, 24, 'HAM4', 5, 'HAMBURGUESA CHIPOTLE', '', 9.2, 10, 2),
(94, 24, 'HAM8', 5, 'HAMBURGUESA YANKEE', '', 8.5, 10, 1),
(95, 24, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 1),
(96, 24, 'REF2', 1, 'COCACOLA ZERO', '', 1.5, 21, 1),
(97, 24, 'REF8', 1, 'SPRITE', '', 1.5, 21, 6),
(98, 24, 'REF7', 1, 'MOUNTAIN DEW', '', 2, 21, 1),
(99, 24, 'REF15', 1, 'HEINEKEN', '', 3, 21, 1),
(100, 24, 'REF16', 1, 'AQUARIUS', '', 1.5, 21, 1),
(101, 26, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 1),
(102, 26, 'REF2', 1, 'COCACOLA ZERO', '', 1.5, 21, 1),
(103, 26, 'REF7', 1, 'MOUNTAIN DEW', '', 2, 21, 1),
(104, 26, 'HAM2', 5, 'HAMBURGUESA LA SMOKE', '', 8.5, 10, 2),
(105, 26, 'HAM5', 5, 'HAMBURGUESA POLLOTARIANA', '', 9, 10, 5),
(106, 26, 'HAM8', 5, 'HAMBURGUESA YANKEE', '', 8.5, 10, 1),
(107, 26, 'HAM7', 5, 'HAMBURGUESA LA KIKI', '', 9.2, 10, 2),
(108, 25, 'HAM2', 5, 'HAMBURGUESA LA SMOKE', '', 8.5, 10, 2),
(109, 25, 'HAM5', 5, 'HAMBURGUESA POLLOTARIANA', '', 9, 10, 5),
(110, 25, 'HAM4', 5, 'HAMBURGUESA CHIPOTLE', '', 9.2, 10, 2),
(111, 25, 'HAM7', 5, 'HAMBURGUESA LA KIKI', '', 9.2, 10, 2),
(112, 25, 'HAM9', 5, 'HAMBURGUESA EDAMAMI', '', 8, 10, 1),
(113, 25, 'HAM6', 5, 'HAMBURGUESA KEVIN CHICK', '', 10, 10, 3),
(114, 25, 'HAM1', 5, 'HAMBURGUESA LA GRETA', '', 9.75, 10, 1),
(115, 25, 'HAM8', 5, 'HAMBURGUESA YANKEE', '', 8.5, 10, 1),
(116, 25, 'HAM3', 5, 'HAMBURGUESA PIGMA', '', 9, 10, 1),
(117, 27, 'HAM1', 5, 'HAMBURGUESA LA GRETA', '', 9.75, 10, 1),
(118, 27, 'HAM4', 5, 'HAMBURGUESA CHIPOTLE', '', 9.2, 10, 1),
(119, 27, 'HAM5', 5, 'HAMBURGUESA POLLOTARIANA', '', 9, 10, 3),
(120, 27, 'HAM7', 5, 'HAMBURGUESA LA KIKI', '', 9.2, 10, 1),
(121, 27, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 1),
(122, 27, 'REF2', 1, 'COCACOLA ZERO', '', 1.5, 21, 1),
(124, 27, 'REF4', 1, 'FANTA NARANJA', '', 1.5, 21, 1),
(125, 27, 'REF14', 1, 'CERVEZA ESTRELLA GALICIA', '', 1.2, 21, 1),
(126, 27, 'COM1', 4, 'PATATAS FRITAS', '', 3, 10, 3),
(127, 27, 'COM4', 4, 'BACON & CHEESE', '', 4.3, 10, 1),
(129, 27, 'ENT1', 2, 'CRISPY CHICKEN WINGS', '', 5, 10, 1),
(130, 27, 'ENT2', 2, 'TEQUES', '', 4.5, 10, 7),
(131, 28, 'ENT2', 2, 'TEQUES', '', 4.5, 10, 7),
(132, 28, 'ENT3', 2, 'NACHORREO', '', 6, 10, 1),
(133, 28, 'ENT4', 2, 'HUMMUS SAPIENS', '', 4.2, 10, 2),
(135, 28, 'REF17', 1, 'RED BULL', '', 2.1, 21, 1),
(136, 28, 'REF14', 1, 'CERVEZA ESTRELLA GALICIA', '', 1.2, 21, 1),
(137, 28, 'POS2', 6, 'FROZEN', '', 3.5, 10, 1),
(138, 28, 'POS4', 6, 'ICAKE', '', 3.5, 10, 1),
(139, 28, 'POS1', 6, 'TARTA DE QUESO', '', 4, 10, 2),
(140, 32, 'REF8', 1, 'SPRITE', '', 1.5, 21, 4),
(141, 32, 'REF1', 1, 'COCACOLA', '', 1.5, 21, 1),
(142, 32, 'REF7', 1, 'MOUNTAIN DEW', '', 2, 21, 1);

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
(3, 2, 0),
(4, 5, 1),
(5, 4, 1),
(6, 1, 0),
(7, 1, 1),
(26, 2, 0),
(27, 2, 0);

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
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `lineasfacturas`
--
ALTER TABLE `lineasfacturas`
  MODIFY `idLineaFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=489;

--
-- AUTO_INCREMENT de la tabla `lineaspedidos`
--
ALTER TABLE `lineaspedidos`
  MODIFY `idLineaPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `idMesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
