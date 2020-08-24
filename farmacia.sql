-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-08-2020 a las 17:04:27
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `farmacia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `dni` char(8) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`) VALUES
(3, 'Admin', 'Admin', '12345678', '12345678');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo`
--

CREATE TABLE `catalogo` (
  `id_catalogo` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catalogo`
--

INSERT INTO `catalogo` (`id_catalogo`, `nombre`, `descripcion`) VALUES
(1, 'calculo 4', 'asdfssss'),
(3, 'medicina', 'productos para el malestar'),
(4, 'belleza', 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdf'),
(5, 'vitaminas y suplementos', 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `dni` char(8) DEFAULT NULL,
  `telefono` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellido`, `dni`, `telefono`) VALUES
(1, 'cristina', 'dasdasdas', '12345678', '666666666'),
(4, 'nemias', 'ponce', '73546902', '12345678'),
(5, 'nemias', 'nemias', 'nemias', 'nemias'),
(6, 'nemias', 'nemias', '45698', '123456'),
(7, 'cristina', 'rivera', '22222222', '12345678'),
(8, 'hola', 'hola', '789564', '12345678'),
(9, 'go', 'goes', '44444444', '456892'),
(11, 'nemias', 'nemias', '12345689', '12345678'),
(12, 'flor', 'himena', '88956325', '88888569'),
(16, 'sharon', 'sharon', '88888888', '123564');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `dni` char(8) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `apellido`, `dni`, `telefono`) VALUES
(1, 'jordy', 'gomez', '14785236', '91245678'),
(10, 'asdf', 'asdf', '12345678', '123456'),
(11, 'jose', 'alcedo', '66666665', '912456789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_pedido`
--

CREATE TABLE `empleado_pedido` (
  `id_emp_pedido` int(11) NOT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado_pedido`
--

INSERT INTO `empleado_pedido` (`id_emp_pedido`, `id_empleado`, `id_pedido`) VALUES
(1, 1, 1),
(9, 11, 133),
(10, 11, 131),
(11, 11, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `nombre_farmacia` varchar(30) DEFAULT NULL,
  `precio_total` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `farmacia`
--

CREATE TABLE `farmacia` (
  `id_farmacia` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `ubicacion` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(20) DEFAULT NULL,
  `id_admin` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `farmacia`
--

INSERT INTO `farmacia` (`id_farmacia`, `nombre`, `ubicacion`, `telefono`, `correo`, `id_admin`) VALUES
(1, 'farmavida', 'leoncio Prado', '912456789', 'farmavida@hotmail.co', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `fecha`, `fecha_entrega`, `direccion`, `estado`, `id_cliente`) VALUES
(1, '2020-08-06', '2020-08-20', 'fasfasf', 'entregado', 1),
(3, '2020-08-14', '2020-08-15', 'jr asdfasd', 'entregado', 12),
(4, '2020-08-15', '2020-08-16', 'alomilla roblez', 'entregado', 1),
(130, '2020-08-20', '2020-08-25', 'sharon2', 'pendiente', 16),
(131, '2020-08-20', '2020-08-30', 'arcanas', 'entregado', 16),
(132, '2020-08-20', '2020-08-29', 'sharon 2', 'pendiente', 16),
(133, '2020-08-20', '0000-00-00', 'arcanas', 'entregado', 16),
(134, '2020-08-20', '2020-09-11', 'jr aviacion', 'pendiente', 16),
(135, '2020-08-20', '2020-08-30', 'yaaa', 'pendiente', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_producto`
--

CREATE TABLE `pedido_producto` (
  `id_ped_prod` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `id_prod` int(11) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido_producto`
--

INSERT INTO `pedido_producto` (`id_ped_prod`, `cantidad`, `id_prod`, `id_pedido`, `id_producto`) VALUES
(1, 20, 1, 1, 1),
(2, 4, 1, 3, 1),
(3, 2, 5, 3, 5),
(4, 2, 1, 4, 1),
(68, 1, 1, 130, 1),
(69, 1, 18, 131, 18),
(70, 2, 19, 131, 19),
(71, 2, 2, 132, 2),
(72, 1, 4, 132, 4),
(73, 1, 18, 133, 18),
(74, 1, 19, 133, 19),
(75, 2, 18, 134, 18),
(76, 1, 2, 135, 2),
(77, 1, 3, 135, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `caracteristicas` varchar(100) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `id_catalogo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `precio`, `caracteristicas`, `img`, `id_catalogo`) VALUES
(1, 'dust1', 125, 'dust', 'public/img/a.jpg', 1),
(2, 'teemo2', 15, 'cdsfsdfsdfsadfsadfsadfsadfs', 'public/img/Derecho-1-1.jpg', 1),
(3, 'teemo3', 20, 'dfassadfsdfsdfasdfsdafsdfdsfgfdgdfsgasdfsdfasdfsfa', 'public/img/teemo3.jpg', 1),
(4, 'teemo4', 100, 'sdfdsfsadfasdfasdf', 'public/img/teemo4.jpg', 1),
(5, 'wuckong', 500, 'fsdfsadfsafsdafsdfsdafsdfsadfsdfsdfsdfsdfsdfsdfsdfsdfsdafdsfds', 'public/img/wuckong.jpg', 1),
(17, 'asdf', 123, 'asdf', 'public/img/a.jpg', 3),
(18, 'shaker', 114, 'asdfasdf', 'public/img/shaker.png', 3),
(19, 'wks', 125, 'asdfasdf', 'public/img/wk.jpg', 3),
(26, 'ella', 0, 'ellas', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `contrasenia` varchar(72) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `dni` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `contrasenia`, `tipo`, `dni`) VALUES
(29, 'nemias', '$2y$10$0FBvpQSmY5S1/ocILAok5ujIWXeIWtjmAKjT7OQTRkmkDRtjzPgc6', 'cliente', '12345689'),
(33, 'empleado', '$2y$10$JSFSPRS48fAqiLgrVOBfF.d3Xc26tnnQgatx7LF6RVrjbrr0cYZya', 'empleado', '66666665'),
(36, 'cora', '$2y$10$ogZ2Zsib7rQzv5aDCyfi9utLiRux.eQOVFvGbB5luugY7teKylTIy', 'empleado', '45689'),
(39, 'sharon', '$2y$10$PVVXBz4Sx8zjfp849n/L7uuBliV9kTBoTXuLCdEuM4zUmadfAauGa', 'cliente', '88888888'),
(44, 'youtube', '$2y$10$ywPqB9T8JZjixIaEAIlKpeZWlGluiIJ3TQ4NQ17WXIHeD2E9Leb1y', 'administrador', '12345678'),
(45, 'admin', 'admin', 'administrador', '12345678');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  ADD PRIMARY KEY (`id_catalogo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `empleado_pedido`
--
ALTER TABLE `empleado_pedido`
  ADD PRIMARY KEY (`id_emp_pedido`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `farmacia`
--
ALTER TABLE `farmacia`
  ADD PRIMARY KEY (`id_farmacia`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD PRIMARY KEY (`id_ped_prod`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_catalogo` (`id_catalogo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  MODIFY `id_catalogo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `empleado_pedido`
--
ALTER TABLE `empleado_pedido`
  MODIFY `id_emp_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `farmacia`
--
ALTER TABLE `farmacia`
  MODIFY `id_farmacia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  MODIFY `id_ped_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado_pedido`
--
ALTER TABLE `empleado_pedido`
  ADD CONSTRAINT `empleado_pedido_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE CASCADE,
  ADD CONSTRAINT `empleado_pedido_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `farmacia`
--
ALTER TABLE `farmacia`
  ADD CONSTRAINT `farmacia_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrador` (`id_usuario`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD CONSTRAINT `pedido_producto_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_catalogo`) REFERENCES `catalogo` (`id_catalogo`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
