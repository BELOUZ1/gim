-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  Dim 14 mai 2023 à 02:44
-- Version du serveur :  10.1.37-MariaDB
-- Version de PHP :  5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `GIM`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `numero` int(50) NOT NULL,
  `civilite` varchar(5) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `datenaissance` varchar(15) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `fix` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `adresse` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`numero`, `civilite`, `nom`, `prenom`, `datenaissance`, `telephone`, `fix`, `fax`, `adresse`) VALUES
(1, 'M.', 'BELOUZ', 'Tarek', '06/16/1992', '0659077382', '0659077382', '0659077382', '2 rue du centre');

-- --------------------------------------------------------

--
-- Structure de la table `employes`
--

CREATE TABLE `employes` (
  `numero` int(10) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `categorie` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employes`
--

INSERT INTO `employes` (`numero`, `nom`, `prenom`, `categorie`) VALUES
(7, 'BELOUZ', 'Tarek', 'Mecanicien'),
(8, 'DJELID', 'Came', 'Assistant');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `numero` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `pays` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`numero`, `nom`, `pays`) VALUES
(1, 'LAMBORGHINI', 'ITALIE'),
(2, 'AUDI', 'ALLEMAGNE'),
(3, 'ROLLS-ROYCE', 'GRANDE-BRETAGNE'),
(4, 'BMW', 'ALLEMAGNE'),
(5, 'CADILLAC', 'ETATS-UNIS'),
(6, 'CHRYSLER', 'ETATS-UNIS'),
(7, 'FERRARI', 'ITALIE'),
(8, 'HONDA', 'JAPON'),
(9, 'JAGUAR', 'GRANDE-BRETAGNE'),
(10, 'ALFA-ROMEO', 'ITALIE'),
(11, 'LEXUS', 'JAPON'),
(12, 'LOTUS', 'GRANDE-BRETAGNE'),
(13, 'MASERATI', 'ITALIE'),
(14, 'MERCEDES', 'ALLEMAGNE'),
(15, 'PEUGEOT', 'FRANCE'),
(16, 'PORSCHE', 'ALLEMAGNE'),
(17, 'RENAULT', 'FRANCE'),
(18, 'SAAB', 'SUEDE'),
(19, 'TOYOTA', 'JAPON'),
(20, 'VENTURI', 'FRANCE'),
(21, 'VOLVO', 'SUEDE');

-- --------------------------------------------------------

--
-- Structure de la table `MODELE`
--

CREATE TABLE `MODELE` (
  `numero` int(11) NOT NULL,
  `numeromarque` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `MODELE`
--

INSERT INTO `MODELE` (`numero`, `numeromarque`, `nom`) VALUES
(29, 1, 'Diablo'),
(30, 2, 'Série 5'),
(31, 10, 'NSX'),
(32, 14, 'Classe C'),
(33, 17, 'Safrane'),
(34, 20, '400 GT'),
(35, 12, 'Esprit'),
(36, 15, '605'),
(37, 19, 'Prévia'),
(38, 7, '550 Maranello'),
(39, 3, 'Bentley-Continental'),
(40, 10, 'Spider'),
(41, 13, 'Evoluzione'),
(42, 16, 'Carrera'),
(43, 16, 'Boxter'),
(44, 21, 'S 80'),
(45, 6, '300 M'),
(46, 4, 'M 3'),
(47, 9, 'XJ 8');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `numero` int(20) NOT NULL,
  `immatriculation` varchar(20) NOT NULL,
  `modele` varchar(50) NOT NULL,
  `annee` varchar(15) NOT NULL,
  `client` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vehicule`
--

INSERT INTO `vehicule` (`numero`, `immatriculation`, `modele`, `annee`, `client`) VALUES
(1, '123456', 'Diablo - LAMBORGHINI', '2015', '1'),
(4, '1234567', 'SÃ©rie 5 - AUDI', '2020', '1');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`numero`);

--
-- Index pour la table `employes`
--
ALTER TABLE `employes`
  ADD PRIMARY KEY (`numero`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`numero`);

--
-- Index pour la table `MODELE`
--
ALTER TABLE `MODELE`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `numeromarque` (`numeromarque`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`numero`),
  ADD UNIQUE KEY `immatriculation` (`immatriculation`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `numero` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `employes`
--
ALTER TABLE `employes`
  MODIFY `numero` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `MODELE`
--
ALTER TABLE `MODELE`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT pour la table `vehicule`
--
ALTER TABLE `vehicule`
  MODIFY `numero` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `MODELE`
--
ALTER TABLE `MODELE`
  ADD CONSTRAINT `modele_ibfk_1` FOREIGN KEY (`numeromarque`) REFERENCES `marque` (`numero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
