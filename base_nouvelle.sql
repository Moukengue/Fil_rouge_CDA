-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.6.12-MariaDB-0ubuntu0.22.04.1 - Ubuntu 22.04
-- SE du serveur:                debian-linux-gnu
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour the_twins_shop
CREATE DATABASE IF NOT EXISTS `the_twins_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `the_twins_shop`;

-- Listage de la structure de table the_twins_shop. client
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commercial_id` int(11) DEFAULT NULL,
  `cli_nom` varchar(50) NOT NULL,
  `cli_prenom` varchar(50) DEFAULT NULL,
  `cli_adresse_facturation` varchar(50) DEFAULT NULL,
  `cli_adresse_livraison` varchar(50) DEFAULT NULL,
  `cli_ville` varchar(50) DEFAULT NULL,
  `cli_cp` varchar(11) DEFAULT NULL,
  `cli_ref` varchar(50) NOT NULL,
  `cli_type` int(11) DEFAULT NULL,
  `cli_mail` varchar(255) DEFAULT NULL,
  `cli_fone` varchar(50) DEFAULT NULL,
  `cli_siret` varchar(14) DEFAULT NULL,
  `cli_coef` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C74404557854071C` (`commercial_id`),
  CONSTRAINT `FK_C74404557854071C` FOREIGN KEY (`commercial_id`) REFERENCES `commercial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table the_twins_shop. commercial
CREATE TABLE IF NOT EXISTS `commercial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commercial_nom` varchar(50) DEFAULT NULL,
  `commercial_prenom` varchar(50) DEFAULT NULL,
  `commercial_type` int(11) DEFAULT NULL,
  `commercial_tel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table the_twins_shop. messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
