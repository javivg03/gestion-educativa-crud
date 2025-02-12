-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-02-2025 a las 13:09:31
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crud_practica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`id`, `nombre`, `descripcion`) VALUES
(25, 'Matemáticas I', 'Fundamentos de álgebra y cálculo para estudiantes de ingeniería.'),
(26, 'Física II', 'Cálculo y análisis de fenómenos físicos y su aplicación a la ingeniería.'),
(27, 'Programación Web', 'Desarrollo de aplicaciones web utilizando tecnologías como HTML, CSS y JavaScript.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criterios_evaluacion`
--

CREATE TABLE `criterios_evaluacion` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `resultado_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `criterios_evaluacion`
--

INSERT INTO `criterios_evaluacion` (`id`, `descripcion`, `resultado_id`) VALUES
(11, 'Aplicar la segunda ley de Newton en problemas de dinámica', 20),
(12, 'Desarrollar una página web completa con interactividad básica', 21),
(15, 'Aplicar la ley de Coulomb para calcular campos eléctricos.', 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados_aprendizaje`
--

CREATE TABLE `resultados_aprendizaje` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `asignatura_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `resultados_aprendizaje`
--

INSERT INTO `resultados_aprendizaje` (`id`, `descripcion`, `asignatura_id`) VALUES
(20, 'Resolver problemas de física utilizando las leyes fundamentales del movimiento y energía', 26),
(21, 'Crear páginas web interactivas utilizando HTML, CSS y JavaScript', 27),
(24, 'Comprender los conceptos fundamentales del cálculo diferencial e integral y aplicar técnicas de derivación e integración a problemas matemáticos.', 25),
(26, 'Analizar y resolver problemas de la electricidad y magnetismo utilizando las leyes de Maxwell.', 26),
(27, 'Comprender y aplicar las leyes de la inducción electromagnética en circuitos eléctricos.', 26),
(28, 'Desarrollar aplicaciones web interactivas utilizando tecnologías como HTML, CSS, y JavaScript.', 27),
(29, 'Implementar diseño responsive y optimización de páginas web para diferentes dispositivos.', 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `rol` enum('admin','profesor','alumno') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol`) VALUES
(1, 'Javier', 'javiervillasenor.23@campuscamara.es', '$2a$10$diYIAAUs.w91n2rX3pzX2.QBwFEO1YXh.IK9hGbCCAPPET/rF4sCm', 'admin'),
(2, 'Martirio', 'martirio@martirio.es', '$2a$10$86WzBC40ot4HbDxiz3jKLuE.ALQexl40nMsA7uJAWGf4sKIdR03xC', 'alumno'),
(3, 'Profesor', 'profesor@prof.es', '$2a$10$aiWSLtHLBLTS9GFexwSq0OrzCHMchIx1EKMBSKWMzdTZk1V/okLKe', 'profesor'),
(4, 'Alvaro', 'alvarito@al.com', '$2a$10$K4BneUE1Yq/cBEn25C87d.ifNqDpFfdyzkbzX9tSJHID3WeQWI8zK', 'profesor'),
(5, 'salva', 'salva@salva.es', '$2a$10$eIZcg/XleyFMSmn6gRTUbOiVQG4djcrfUvb3/zbCFK8B6frTFd5Cm', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `criterios_evaluacion`
--
ALTER TABLE `criterios_evaluacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resultado_id` (`resultado_id`);

--
-- Indices de la tabla `resultados_aprendizaje`
--
ALTER TABLE `resultados_aprendizaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asignatura_id` (`asignatura_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `criterios_evaluacion`
--
ALTER TABLE `criterios_evaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `resultados_aprendizaje`
--
ALTER TABLE `resultados_aprendizaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `criterios_evaluacion`
--
ALTER TABLE `criterios_evaluacion`
  ADD CONSTRAINT `criterios_evaluacion_ibfk_1` FOREIGN KEY (`resultado_id`) REFERENCES `resultados_aprendizaje` (`id`);

--
-- Filtros para la tabla `resultados_aprendizaje`
--
ALTER TABLE `resultados_aprendizaje`
  ADD CONSTRAINT `resultados_aprendizaje_ibfk_1` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
