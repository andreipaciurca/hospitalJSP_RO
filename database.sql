-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Gazda: localhost
-- Timp de generare: 22 May 2020 la 11:16
-- Versiune server: 5.6.12-log
-- Versiune PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Bază de date: `spital`
--
CREATE DATABASE IF NOT EXISTS `spital` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `spital`;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `diagnostice`
--

CREATE TABLE IF NOT EXISTS `diagnostice` (
  `ID_Diagnostic` int(11) NOT NULL AUTO_INCREMENT,
  `NUME_DIAGNOSTIC` text,
  `ID_SECTIE` int(11) NOT NULL,
  `ID_SPECIALIZARE` int(11) NOT NULL,
  PRIMARY KEY (`ID_Diagnostic`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Salvarea datelor din tabel `diagnostice`
--

INSERT INTO `diagnostice` (`ID_Diagnostic`, `NUME_DIAGNOSTIC`, `ID_SECTIE`, `ID_SPECIALIZARE`) VALUES
(1, 'Varicela', 1, 1),
(2, 'Depresie', 2, 2),
(3, 'Diabet', 3, 3),
(4, 'Leucemie', 4, 4),
(5, 'Anemie', 3, 3),
(6, 'Cancer pulmonar', 4, 4);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `fise_observatii`
--

CREATE TABLE IF NOT EXISTS `fise_observatii` (
  `ID_FISA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PACIENT` int(11) NOT NULL,
  `ID_DIAGNOSTIC` int(11) NOT NULL,
  `ID_MEDIC` int(11) NOT NULL,
  `ID_SECTIE` int(11) NOT NULL,
  `DATA_INTERNARE` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DATA_EXTERNARE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_FISA`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Salvarea datelor din tabel `fise_observatii`
--

INSERT INTO `fise_observatii` (`ID_FISA`, `ID_PACIENT`, `ID_DIAGNOSTIC`, `ID_MEDIC`, `ID_SECTIE`, `DATA_INTERNARE`, `DATA_EXTERNARE`) VALUES
(1, 1, 2, 2, 2, '2020-05-20 08:09:08', '2020-05-23 14:12:08'),
(2, 2, 1, 1, 1, '2020-05-22 14:13:40', '2020-05-22 14:13:40'),
(3, 3, 1, 1, 1, '2020-05-22 14:14:18', '2020-05-22 14:14:18'),
(4, 3, 1, 1, 1, '2020-05-22 14:14:31', '2020-05-22 14:14:31');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `medici`
--

CREATE TABLE IF NOT EXISTS `medici` (
  `ID_MEDIC` int(11) NOT NULL AUTO_INCREMENT,
  `NUME` text NOT NULL,
  `PRENUME` text NOT NULL,
  `ID_SPECIALIZARE` int(11) NOT NULL,
  `ID_SECTIE` int(11) NOT NULL,
  PRIMARY KEY (`ID_MEDIC`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Salvarea datelor din tabel `medici`
--

INSERT INTO `medici` (`ID_MEDIC`, `NUME`, `PRENUME`, `ID_SPECIALIZARE`, `ID_SECTIE`) VALUES
(1, 'Miron', 'Ioan', 1, 1),
(2, 'Maizel', 'Alexandru', 2, 2),
(3, 'Trifan', 'Radu-Constantin', 4, 4),
(4, 'Codreanu', 'Paula-Irina', 3, 3);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `pacienti`
--

CREATE TABLE IF NOT EXISTS `pacienti` (
  `ID_PACIENT` int(11) NOT NULL AUTO_INCREMENT,
  `NUME` text NOT NULL,
  `PRENUME` text NOT NULL,
  `ID_DIAGNOSTIC` int(11) NOT NULL,
  `ID_SECTIE` int(11) NOT NULL,
  PRIMARY KEY (`ID_PACIENT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Salvarea datelor din tabel `pacienti`
--

INSERT INTO `pacienti` (`ID_PACIENT`, `NUME`, `PRENUME`, `ID_DIAGNOSTIC`, `ID_SECTIE`) VALUES
(1, 'Paciurca', 'Andrei-Alexandru', 2, 2),
(2, 'Iacinshi', 'Vlad', 1, 1),
(3, 'Arama', 'Andra', 1, 1),
(4, 'Dinga', 'Malina', 1, 1),
(5, 'Turcu', 'Andreea', 3, 3),
(6, 'Mihaila', 'Octavian-Dumitru', 2, 2);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `sectii`
--

CREATE TABLE IF NOT EXISTS `sectii` (
  `ID_SECTIE` int(11) NOT NULL AUTO_INCREMENT,
  `NUME` text NOT NULL,
  `NR_PATURI` int(11) NOT NULL,
  `ID_SPECIALIZARE` int(11) NOT NULL,
  PRIMARY KEY (`ID_SECTIE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Salvarea datelor din tabel `sectii`
--

INSERT INTO `sectii` (`ID_SECTIE`, `NUME`, `NR_PATURI`, `ID_SPECIALIZARE`) VALUES
(1, 'Dermatologie', 16, 1),
(2, 'Neuro-Psihiatrie', 32, 2),
(3, 'Diabet & Boli de nutrie', 8, 3),
(4, 'Oncologie', 32, 4);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID_USER` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` text NOT NULL,
  `PASSWORD` text NOT NULL,
  `TIP_USER` text NOT NULL,
  PRIMARY KEY (`ID_USER`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Salvarea datelor din tabel `users`
--

INSERT INTO `users` (`ID_USER`, `USERNAME`, `PASSWORD`, `TIP_USER`) VALUES
(1, 'admin', 'admin', 'Administrator'),
(2, 'registratura', 'registratura', 'Registratura'),
(3, '           medic', '           medic', '          Medic');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
