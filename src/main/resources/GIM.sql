-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  jeu. 18 mai 2023 à 21:22
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
(1, 'Mme', 'MAHBOUBA', 'Cherifa', '1957-08-08', '0561381813', '0562458714', ' ', 'CITE 1013 LOGTS BT 61 Alger'),
(2, 'Mme', 'TAHMI', 'Lamia', '1955-12-31', '0562467849', '0561392487', ' ', 'CITE BACHEDJARAH BATIMENT 38 -Bach Djerrah-Alger'),
(3, 'Mle', 'DIAF AMROUNI', 'Ghania', '1955-12-31', '0523894562', '0619430945', '0562784254', '43, RUE ABDERRAHMANE SBAA BELLE VUE-EL HARRACH-ALGER'),
(4, 'Mle', 'MELEK', 'Chahinaz', '1955-06-27', '0634613493', '0562529463', ' ', 'HLM AISSAT IDIR CAGE 9 3EME ETAGE-EL HARRACH ALGER'),
(5, 'Mme', 'TECHTACHE', 'Noura', '1949-03-22', '0562757834', '0562757843', ' ', '16, ROUTE EL DJAMILA-AIN BENIAN-ALGER'),
(6, 'Mme', 'TOUATI', 'Widad', '1965-08-14', '0561243967', '0561401836', ' ', '14 RUE DES FRERES AOUDIA-EL MOURADIA-ALGER'),
(7, 'Mle', 'ABLOUL', 'Faiza', '1967-10-28', '0562935427', '0561486203', ' ', 'CITE DIPLOMATIQUE BT BLEU 14B N 3 DERGANA- ALGER'),
(8, 'Mme', 'HORRA', 'Assia', '1963-12-08', '0561038500', '0562466733', ' ', '32 RUE AHMED OUAKED-DELY BRAHIM-ALGER'),
(9, 'Mle', 'MESBAH', 'Souad', '1972-08-30', '0561024358', ' ', ' ', 'RESIDENCE CHABANI-HYDRAALGER');

-- --------------------------------------------------------

--
-- Structure de la table `employes`
--

CREATE TABLE `employes` (
  `numero` int(10) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `categorie` varchar(10) NOT NULL,
  `salaire` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employes`
--

INSERT INTO `employes` (`numero`, `nom`, `prenom`, `categorie`, `salaire`) VALUES
(53, 'LACHEMI', 'Bouzid', 'Mécanicien', 25000),
(54, 'BOUCHEMLA', 'Elias', 'Assistant', 10000),
(55, 'HADJ', 'Zouhir', 'Assistant', 12000),
(56, 'OUSSEDIK', 'Hakim', 'Mécanicien', 20000),
(57, 'ABAD', 'Abdelhamid', 'Assistant', 13000),
(58, 'BABACI', 'Tayeb', 'Mécanicien', 21300),
(59, 'BELHAMIDI', 'Mourad', 'Mécanicien', 19500),
(60, 'IGOUDJIL', 'Redouane', 'Assistant', 15000),
(61, 'KOULA', 'Bahim', 'Mécanicien', 23100),
(62, 'RAHALI', 'Ahcene', 'Mécanicien', 24000),
(63, 'CHAOUI', 'Ismail', 'Assistant', 13000),
(64, 'BADI', 'Hatem', 'Assistant', 14000),
(65, 'MOHAMMEDI', 'Mustapha', 'Mécanicien', 24000),
(66, 'FEKAR', 'Abdelaziz', 'Assistant', 13500),
(67, 'SAIDOUNI', 'Wahid', 'Mécanicien', 25000),
(68, 'BOULARAS', 'Farid', 'Assistant', 14000),
(69, 'CHAKER', 'Nassim', 'Mécanicien', 26000),
(71, 'TERKI', 'Yacine', 'Mécanicien', 23000),
(72, 'TEBIBEL', 'Ahmed', 'Assistant', 17000),
(80, 'LARDJOUNE', 'Karim', '', 25000);

-- --------------------------------------------------------

--
-- Structure de la table `intervenants`
--

CREATE TABLE `intervenants` (
  `numero` int(15) NOT NULL,
  `numero_intervention` int(15) NOT NULL,
  `numero_employe` int(15) NOT NULL,
  `numero_vehicule` int(15) NOT NULL,
  `date_debut` varchar(15) NOT NULL,
  `date_fin` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `interventions`
--

CREATE TABLE `interventions` (
  `numero` int(15) NOT NULL,
  `numero_employe` int(10) NOT NULL,
  `numero_vehicule` int(15) NOT NULL,
  `date_debut` varchar(15) NOT NULL,
  `date_fin` varchar(15) NOT NULL,
  `cout` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `interventions`
--

INSERT INTO `interventions` (`numero`, `numero_employe`, `numero_vehicule`, `date_debut`, `date_fin`, `cout`) VALUES
(1, 53, 1, '05/04/2023', '05/24/2023', 122),
(2, 53, 1, '05/09/2023', '05/08/2023', 3),
(3, 58, 4, '05/11/2023', '05/18/2023', 122);

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
-- Index pour la table `intervenants`
--
ALTER TABLE `intervenants`
  ADD PRIMARY KEY (`numero`);

--
-- Index pour la table `interventions`
--
ALTER TABLE `interventions`
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
  MODIFY `numero` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `employes`
--
ALTER TABLE `employes`
  MODIFY `numero` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `intervenants`
--
ALTER TABLE `intervenants`
  MODIFY `numero` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `interventions`
--
ALTER TABLE `interventions`
  MODIFY `numero` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
