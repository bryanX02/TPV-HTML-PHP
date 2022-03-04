-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-03-2022 a las 11:16:18
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
  `fecha` date NOT NULL,
  `numeroMesa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 2, '', 0, 'COCACOLA', '', 0, 0, 3),
(2, 2, '', 0, 'MACARRONES', '', 0, 0, 2);

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
(2, 1, 1),
(3, 2, 1);

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
(1, 1, 'COCACOLA', 'REF1', '', 19, 1.5, 21, 'refrescos/coca.png'),
(2, 1, 'COCACOLA ZERO', 'REF2', '', 20, 1.5, 21, 'refrescos/coca0.png'),
(3, 1, 'COCACOLA PLUS COFFEE', 'REF3', '', 20, 1.8, 21, 'refrescos/coffee.png'),
(4, 1, 'FANTA NARANJA', 'REF4', '', 20, 1.5, 21, 'refrescos/naranja.png'),
(5, 1, 'FANTA LIMÓN', 'REF5', '', 20, 1.5, 21, 'refrescos/limon.png'),
(6, 1, 'NESTEA', 'REF6', '', 20, 1.6, 21, 'refrescos/nestea.png'),
(7, 1, 'MOUNTAIN DEW', 'REF7', '', 20, 2, 21, 'refrescos/mountainDew.png'),
(8, 1, 'SPRITE', 'REF8', '', 20, 1.5, 21, 'refrescos/sprite.png'),
(9, 1, 'TINTO VERANO', 'REF9', '', 20, 2, 21, 'refrescos/tinto.png'),
(10, 1, 'VINO TINTO', 'REF10', '', 20, 7, 21, 'refrescos/vino.png'),
(11, 1, 'AGUA CON GAS', 'REF11', '', 20, 1.8, 10, 'refrescos/vichycatalan.png'),
(12, 1, 'AGUA', 'REF12', '', 20, 1, 10, 'refrescos/agua.png'),
(13, 1, 'CERVEZA GARGANZUELA', 'REF13', '', 20, 2.5, 21, 'refrescos/cerveza.png'),
(14, 1, 'CERVEZA ESTRELLA LEVANTE', 'REF14', '', 20, 1.2, 21, 'refrescos/estrella.png'),
(15, 1, 'HEINEKEN', 'REF15', '', 20, 3, 21, 'refrescos/heineken.png'),
(16, 1, 'CERVEZA AMSTEL', 'REF16', '', 20, 1.2, 21, 'refrescos/amster.png'),
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
(27, 4, 'BACON & CHEESE', 'COM4', '', 20, 4.3, 10, 'complementos/bachoncheese.png'),
(28, 5, 'HAMBURGUESA \'LA GRETA\'', 'HAM1', '', 20, 9.75, 10, 'hamburguesas/greta.PNG'),
(29, 5, 'HAMBURGUESA \'LA SMOKE\'', 'HAM2', '', 20, 8.5, 10, 'hamburguesas/smoke.PNG'),
(30, 5, 'HAMBURGUESA \'PIGMA\'', 'HAM3', '', 20, 9, 10, 'hamburguesas/pigma.PNG'),
(31, 5, 'HAMBURGUESA \'CHIPOTLE\'', 'HAM4', '', 20, 9.2, 10, 'hamburguesas/chipotle.PNG'),
(32, 5, 'HAMBURGUESA \'POLLOTARIANA\'', 'HAM5', '', 20, 9, 10, 'hamburguesas/pollotariana.PNG'),
(33, 5, 'HAMBURGUESA \'KEVIN CHICK\'', 'HAM6', '', 20, 10, 10, 'hamburguesas/kevin.PNG'),
(34, 5, 'HAMBURGUESA \'LA KIKI\'', 'HAM7', '', 20, 9.2, 10, 'hamburguesas/kiki.PNG'),
(35, 5, 'HAMBURGUESA \'YANKEE\'', 'HAM8', '', 20, 8.5, 10, 'hamburguesas/yankee.PNG'),
(36, 5, 'HAMBURGUESA \'EDAMAMI\'', 'HAM9', '', 20, 8, 10, 'hamburguesas/edamami.PNG'),
(37, 6, 'TARTA DE QUESO', 'POS1', '', 20, 4, 10, 'postres/queso.png'),
(38, 6, 'FROZEN', 'POS2', '', 20, 3.5, 10, 'postres/frozen.png'),
(39, 6, 'FROZEN BOMB', 'POS3', '', 20, 4, 10, 'postres/bombPNG.PNG'),
(40, 6, 'ICAKE', 'POS4', '', 20, 3.5, 10, 'postres/icake.PNG');

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
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lineasfacturas`
--
ALTER TABLE `lineasfacturas`
  MODIFY `idLineaFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lineaspedidos`
--
ALTER TABLE `lineaspedidos`
  MODIFY `idLineaPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `idMesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
