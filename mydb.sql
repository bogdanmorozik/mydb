-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Гру 15 2020 р., 00:55
-- Версія сервера: 10.4.17-MariaDB
-- Версія PHP: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `mydb`
--

-- --------------------------------------------------------

--
-- Структура таблиці `магазин`
--

CREATE TABLE `магазин` (
  `idМагазин` int(11) NOT NULL,
  `Назва` varchar(45) NOT NULL,
  `Адреса` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `магазин`
--

INSERT INTO `магазин` (`idМагазин`, `Назва`, `Адреса`) VALUES
(1, 'АТБ', 'луцьк, вул. Гнідавська'),
(2, 'Аврора', 'луцьк, вул. львівська');

-- --------------------------------------------------------

--
-- Структура таблиці `покупець постійний`
--

CREATE TABLE `покупець постійний` (
  `Номер чека` int(11) NOT NULL,
  `Спосіб оплати` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'картка,готівка',
  `Сума чека` int(11) DEFAULT NULL,
  `ПІБ` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `покупець постійний`
--

INSERT INTO `покупець постійний` (`Номер чека`, `Спосіб оплати`, `Сума чека`, `ПІБ`) VALUES
(123, 'готівка', 543, NULL),
(222, 'картка', 345, 'Іванов Іван Іванович');

-- --------------------------------------------------------

--
-- Структура таблиці `посада`
--

CREATE TABLE `посада` (
  `Id працівника` int(11) NOT NULL,
  `Рівень допуску` int(11) NOT NULL,
  `Назва посади` varchar(45) NOT NULL,
  `Зарплата` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `посада`
--

INSERT INTO `посада` (`Id працівника`, `Рівень допуску`, `Назва посади`, `Зарплата`) VALUES
(24, 1, 'касир', 5400),
(25, 2, 'охорона', 5600);

-- --------------------------------------------------------

--
-- Структура таблиці `працівник`
--

CREATE TABLE `працівник` (
  `id` int(11) NOT NULL,
  `Рівень допуску` int(11) NOT NULL,
  `ПІБ` varchar(100) NOT NULL,
  `Адреса роботи` varchar(45) DEFAULT NULL,
  `idмагазину` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `працівник`
--

INSERT INTO `працівник` (`id`, `Рівень допуску`, `ПІБ`, `Адреса роботи`, `idмагазину`) VALUES
(24, 1, 'петров петро петрович', 'луцьк, вул. львівська', 2),
(25, 2, 'сидоров петро іванович', 'луцьк, вул. Гнідавська', 1),
(26, 2, 'kjhgr', 'kjhgfd', 1),
(29, 4, 'іол', 'укен', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `продукт`
--

CREATE TABLE `продукт` (
  `Штрих код` int(11) NOT NULL,
  `Ціна` int(11) NOT NULL,
  `Термін придатності` int(11) NOT NULL,
  `Адреса доставки` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `продукт`
--

INSERT INTO `продукт` (`Штрих код`, `Ціна`, `Термін придатності`, `Адреса доставки`) VALUES
(123, 32, 12, 'вул. Львівська'),
(222, 43, 3, 'вул. гнідавська');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `магазин`
--
ALTER TABLE `магазин`
  ADD PRIMARY KEY (`idМагазин`);

--
-- Індекси таблиці `покупець постійний`
--
ALTER TABLE `покупець постійний`
  ADD PRIMARY KEY (`Номер чека`);

--
-- Індекси таблиці `посада`
--
ALTER TABLE `посада`
  ADD PRIMARY KEY (`Id працівника`,`Рівень допуску`),
  ADD KEY `Рівень допуску` (`Рівень допуску`);

--
-- Індекси таблиці `працівник`
--
ALTER TABLE `працівник`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idмагазину` (`idмагазину`),
  ADD KEY `Рівень допуску` (`Рівень допуску`);

--
-- Індекси таблиці `продукт`
--
ALTER TABLE `продукт`
  ADD PRIMARY KEY (`Штрих код`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `працівник`
--
ALTER TABLE `працівник`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблиці `продукт`
--
ALTER TABLE `продукт`
  MODIFY `Штрих код` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `посада`
--
ALTER TABLE `посада`
  ADD CONSTRAINT `посада_ibfk_1` FOREIGN KEY (`Id працівника`) REFERENCES `працівник` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `посада_ibfk_2` FOREIGN KEY (`Рівень допуску`) REFERENCES `працівник` (`Рівень допуску`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `працівник`
--
ALTER TABLE `працівник`
  ADD CONSTRAINT `працівник_ibfk_1` FOREIGN KEY (`idмагазину`) REFERENCES `магазин` (`idМагазин`);

--
-- Обмеження зовнішнього ключа таблиці `продукт`
--
ALTER TABLE `продукт`
  ADD CONSTRAINT `продукт_ibfk_1` FOREIGN KEY (`Штрих код`) REFERENCES `покупець постійний` (`Номер чека`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
