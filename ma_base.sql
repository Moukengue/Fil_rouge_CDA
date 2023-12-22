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


-- Listage de la structure de la base pour the_twins_meches
CREATE DATABASE IF NOT EXISTS `the_twins_meches` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `the_twins_meches`;

-- Listage de la structure de table the_twins_meches. Client
CREATE TABLE IF NOT EXISTS `Client` (
  `cli_id` int(11) NOT NULL AUTO_INCREMENT,
  `Cli_nom` varchar(50) NOT NULL,
  `Cli_prénom` varchar(50) DEFAULT NULL,
  `Cli_adresse_facturation` varchar(50) DEFAULT NULL,
  `Cli_adresse_livraison` varchar(50) DEFAULT NULL,
  `Cli_ville` varchar(50) DEFAULT NULL,
  `Cli_cp` int(11) DEFAULT NULL,
  `Cli_ref` varchar(50) NOT NULL,
  `cli_type` int(11) DEFAULT NULL,
  `Cli_mail` varchar(50) DEFAULT NULL,
  `cli_fone` varchar(50) DEFAULT NULL,
  `Clien_Siret` varchar(50) DEFAULT NULL,
  `Cli_Coef` varchar(50) DEFAULT NULL,
  `Id_Commercial` int(11) NOT NULL,
  PRIMARY KEY (`cli_id`),
  KEY `Id_Commercial` (`Id_Commercial`),
  CONSTRAINT `Client_ibfk_1` FOREIGN KEY (`Id_Commercial`) REFERENCES `Commercial` (`Id_Commercial`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table the_twins_meches.Client : ~2 rows (environ)
INSERT INTO `Client` (`cli_id`, `Cli_nom`, `Cli_prénom`, `Cli_adresse_facturation`, `Cli_adresse_livraison`, `Cli_ville`, `Cli_cp`, `Cli_ref`, `cli_type`, `Cli_mail`, `cli_fone`, `Clien_Siret`, `Cli_Coef`, `Id_Commercial`) VALUES
	(1, 'Doe', 'John', '123 Main St', '456 Delivery St', 'Cityville', 12345, 'ClientRef1', 1, 'john.doe@example.com', '123-456-7890', '123456789', '1.2', 2),
	(2, 'Dupont', 'Alice', '789 Billing St', '101 Shipping St', 'Townsville', 54321, 'ClientRef2', 2, 'alice.dupont@example.com', '987-654-3210', '987654321', '1.5', 1);

-- Listage de la structure de table the_twins_meches. Commande
CREATE TABLE IF NOT EXISTS `Commande` (
  `Id_Commande` int(11) NOT NULL AUTO_INCREMENT,
  `commande_date` date DEFAULT NULL,
  `commande_numeros` varchar(50) DEFAULT NULL,
  `Commande_reduc` decimal(4,2) DEFAULT NULL,
  `Commande_date_facturation` date DEFAULT NULL,
  `Commande_Prix_tot` decimal(6,2) DEFAULT NULL,
  `Commande_date_reglem` varchar(50) DEFAULT NULL,
  `Commande_Adresse` varchar(50) DEFAULT NULL,
  `fa_id` int(11) NOT NULL,
  `cli_id` int(11) NOT NULL,
  PRIMARY KEY (`Id_Commande`),
  UNIQUE KEY `fa_id` (`fa_id`),
  KEY `cli_id` (`cli_id`),
  CONSTRAINT `Commande_ibfk_1` FOREIGN KEY (`fa_id`) REFERENCES `Facture` (`fa_id`),
  CONSTRAINT `Commande_ibfk_2` FOREIGN KEY (`cli_id`) REFERENCES `Client` (`cli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table the_twins_meches.Commande : ~2 rows (environ)
INSERT INTO `Commande` (`Id_Commande`, `commande_date`, `commande_numeros`, `Commande_reduc`, `Commande_date_facturation`, `Commande_Prix_tot`, `Commande_date_reglem`, `Commande_Adresse`, `fa_id`, `cli_id`) VALUES
	(2, '2023-03-15', 'CMD123', 0.10, '2023-01-20', 500.00, '2023-01-25', '123 Main St', 3, 1),
	(5, '2023-01-20', 'CMD789', 0.05, '2023-04-05', 700.00, '2023-04-10', '789 Billing St', 4, 2);

-- Listage de la structure de table the_twins_meches. Commercial
CREATE TABLE IF NOT EXISTS `Commercial` (
  `Id_Commercial` int(11) NOT NULL AUTO_INCREMENT,
  `commercial_nom` varchar(50) DEFAULT NULL,
  `commercial_prenom` varchar(50) DEFAULT NULL,
  `commercial_type` int(11) DEFAULT NULL,
  `commercial_tel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_Commercial`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table the_twins_meches.Commercial : ~2 rows (environ)
INSERT INTO `Commercial` (`Id_Commercial`, `commercial_nom`, `commercial_prenom`, `commercial_type`, `commercial_tel`) VALUES
	(1, 'Moukengue', 'Aline', 2, '1-800-656-2387'),
	(2, 'Barros', 'Sandra', 1, '1-863-278-5573');

-- Listage de la structure de table the_twins_meches. Contient
CREATE TABLE IF NOT EXISTS `Contient` (
  `Id_Produit` int(11) NOT NULL,
  `Id_Livraison` int(11) NOT NULL,
  `qte_livree` int(11) DEFAULT NULL,
  `numero_bon_livraison` varchar(50) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  PRIMARY KEY (`Id_Produit`,`Id_Livraison`),
  UNIQUE KEY `numero_bon_livraison` (`numero_bon_livraison`),
  KEY `Id_Livraison` (`Id_Livraison`),
  CONSTRAINT `Contient_ibfk_1` FOREIGN KEY (`Id_Produit`) REFERENCES `Produit` (`Id_Produit`),
  CONSTRAINT `Contient_ibfk_2` FOREIGN KEY (`Id_Livraison`) REFERENCES `Livraison` (`Id_Livraison`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table the_twins_meches.Contient : ~2 rows (environ)
INSERT INTO `Contient` (`Id_Produit`, `Id_Livraison`, `qte_livree`, `numero_bon_livraison`, `date_livraison`) VALUES
	(1, 6, 5, 'BON123', '2023-01-15'),
	(3, 4, 3, 'BON456', '2023-01-15');

-- Listage de la structure de table the_twins_meches. Facture
CREATE TABLE IF NOT EXISTS `Facture` (
  `fa_id` int(11) NOT NULL AUTO_INCREMENT,
  `fa_adresse` varchar(50) DEFAULT NULL,
  `fa_mode_paiement` varchar(50) DEFAULT NULL,
  `fa_date_emission` date DEFAULT NULL,
  `fa_tva` int(11) DEFAULT NULL,
  `fa_montant_TTC` decimal(9,2) DEFAULT NULL,
  `fa_reglement` tinyint(1) DEFAULT NULL,
  `fa_date_limite_paiement` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table the_twins_meches.Facture : ~10 rows (environ)
INSERT INTO `Facture` (`fa_id`, `fa_adresse`, `fa_mode_paiement`, `fa_date_emission`, `fa_tva`, `fa_montant_TTC`, `fa_reglement`, `fa_date_limite_paiement`) VALUES
	(1, '123 Main St', 'Credit Card', '2023-01-20', 20, 600.00, 0, '2023-02-10'),
	(2, '456 Delivery St', NULL, NULL, NULL, 300.00, 1, NULL),
	(3, '789 Billing St', 'Bank Transfer', '2023-03-15', 15, 450.00, 0, '2023-04-05'),
	(4, '101 Payment St', 'Cash', '2023-04-01', 10, 800.00, 1, NULL),
	(5, '123 Main St', 'Credit Card', '2023-01-20', 20, 600.00, 0, '2023-02-10'),
	(6, '456 Delivery St', NULL, NULL, NULL, 300.00, 1, NULL),
	(7, '789 Billing St', 'Bank Transfer', '2023-03-15', 15, 450.00, 0, '2023-04-05'),
	(8, '101 Payment St', 'Cash', '2023-04-01', 10, 800.00, 1, NULL),
	(9, '123 Main St', 'Credit Card', '2023-01-20', 20, 600.00, 0, '2023-02-10'),
	(10, '456 Delivery St', NULL, NULL, NULL, 300.00, 1, NULL);

-- Listage de la structure de table the_twins_meches. Fournisseur
CREATE TABLE IF NOT EXISTS `Fournisseur` (
  `Id_Fournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `fou_nom` varchar(50) NOT NULL,
  `fou_adresse` varchar(50) NOT NULL,
  `fou_cp` int(11) DEFAULT NULL,
  `fou_ville` varchar(50) DEFAULT NULL,
  `fou_tel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table the_twins_meches.Fournisseur : ~3 rows (environ)
INSERT INTO `Fournisseur` (`Id_Fournisseur`, `fou_nom`, `fou_adresse`, `fou_cp`, `fou_ville`, `fou_tel`) VALUES
	(1, 'Macosso', '4 Rue de condé', 80000, 'Amiens', '00330659874532'),
	(2, 'Biville', '3 Rue de Colver', 80000, 'Paris', '00330736548129'),
	(3, 'Domingas', '4 Rue Avril', 80090, 'Anges', '003307569321454');

-- Listage de la structure de table the_twins_meches. Ligne_commande
CREATE TABLE IF NOT EXISTS `Ligne_commande` (
  `Id_Commande` int(11) NOT NULL,
  `Id_Produit` int(11) NOT NULL,
  `quantite_commande` int(11) NOT NULL,
  `prix_vente` decimal(7,2) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Commande`,`Id_Produit`),
  UNIQUE KEY `id` (`id`),
  KEY `Id_Produit` (`Id_Produit`),
  CONSTRAINT `Ligne_commande_ibfk_1` FOREIGN KEY (`Id_Commande`) REFERENCES `Commande` (`Id_Commande`),
  CONSTRAINT `Ligne_commande_ibfk_2` FOREIGN KEY (`Id_Produit`) REFERENCES `Produit` (`Id_Produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table the_twins_meches.Ligne_commande : ~2 rows (environ)
INSERT INTO `Ligne_commande` (`Id_Commande`, `Id_Produit`, `quantite_commande`, `prix_vente`, `id`) VALUES
	(2, 1, 5, 129.99, NULL),
	(5, 2, 4, 79.99, NULL);

-- Listage de la structure de table the_twins_meches. Livraison
CREATE TABLE IF NOT EXISTS `Livraison` (
  `Id_Livraison` int(11) NOT NULL AUTO_INCREMENT,
  `li_num_bon` varchar(50) DEFAULT NULL,
  `li_adresse` varchar(50) DEFAULT NULL,
  `Id_Commande` int(11) NOT NULL,
  PRIMARY KEY (`Id_Livraison`),
  KEY `Id_Commande` (`Id_Commande`),
  CONSTRAINT `Livraison_ibfk_1` FOREIGN KEY (`Id_Commande`) REFERENCES `Commande` (`Id_Commande`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table the_twins_meches.Livraison : ~6 rows (environ)
INSERT INTO `Livraison` (`Id_Livraison`, `li_num_bon`, `li_adresse`, `Id_Commande`) VALUES
	(1, 'BON123', '123 Main St', 5),
	(2, 'BON456', '456 Delivery St', 2),
	(3, 'BON123', '123 Main St', 5),
	(4, 'BON456', '456 Delivery St', 2),
	(5, 'BON123', '123 Main St', 5),
	(6, 'BON456', '456 Delivery St', 2);

-- Listage de la structure de table the_twins_meches. Livrer
CREATE TABLE IF NOT EXISTS `Livrer` (
  `Id_Fournisseur` int(11) NOT NULL,
  `Id_Produit` int(11) NOT NULL,
  PRIMARY KEY (`Id_Fournisseur`,`Id_Produit`),
  KEY `Id_Produit` (`Id_Produit`),
  CONSTRAINT `Livrer_ibfk_1` FOREIGN KEY (`Id_Fournisseur`) REFERENCES `Fournisseur` (`Id_Fournisseur`),
  CONSTRAINT `Livrer_ibfk_2` FOREIGN KEY (`Id_Produit`) REFERENCES `Produit` (`Id_Produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table the_twins_meches.Livrer : ~6 rows (environ)
INSERT INTO `Livrer` (`Id_Fournisseur`, `Id_Produit`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 3),
	(3, 1),
	(3, 2);

-- Listage de la structure de table the_twins_meches. Produit
CREATE TABLE IF NOT EXISTS `Produit` (
  `Id_Produit` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_description` varchar(150) DEFAULT NULL,
  `Pro_libelle` varchar(30) DEFAULT NULL,
  `Pro_photo` varchar(50) DEFAULT NULL,
  `Pro_prix` decimal(9,2) DEFAULT NULL,
  `Pro_Prix_ht` decimal(15,2) DEFAULT NULL,
  `Id_Sous_Rubrique` int(11) NOT NULL,
  PRIMARY KEY (`Id_Produit`),
  KEY `Id_Sous_Rubrique` (`Id_Sous_Rubrique`),
  CONSTRAINT `Produit_ibfk_1` FOREIGN KEY (`Id_Sous_Rubrique`) REFERENCES `SousRubrique` (`Id_Sous_Rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table the_twins_meches.Produit : ~3 rows (environ)
INSERT INTO `Produit` (`Id_Produit`, `Pro_description`, `Pro_libelle`, `Pro_photo`, `Pro_prix`, `Pro_Prix_ht`, `Id_Sous_Rubrique`) VALUES
	(1, 'Tissage Brésilien Lisse de qualité supérieure,longueur de 10 à 34 pouces,pour tout les gouts!', 'Tissage Bresilien Lisse', 'tissage_bresilien_lisse.jpg', 79.99, 65.00, 1),
	(2, 'Perruque  de qualité supérieure à poter tout les jours', 'Perruque Courte Bouclée', 'perruque.jpg', 129.99, 110.00, 2),
	(3, 'Lace Frontal ondulé composé totalment de cheveux 100% naturels', 'Lace Frontal Ondulé', 'lace_frontal.jpg', 49.99, 40.00, 3);

-- Listage de la structure de table the_twins_meches. Rubrique
CREATE TABLE IF NOT EXISTS `Rubrique` (
  `Id_Rubrique` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table the_twins_meches.Rubrique : ~3 rows (environ)
INSERT INTO `Rubrique` (`Id_Rubrique`, `Nom`) VALUES
	(1, 'Méches'),
	(2, 'Perruque'),
	(3, 'Lace front');

-- Listage de la structure de table the_twins_meches. SousRubrique
CREATE TABLE IF NOT EXISTS `SousRubrique` (
  `Id_Sous_Rubrique` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `Id_Rubrique` int(11) NOT NULL,
  PRIMARY KEY (`Id_Sous_Rubrique`),
  KEY `Id_Rubrique` (`Id_Rubrique`),
  CONSTRAINT `SousRubrique_ibfk_1` FOREIGN KEY (`Id_Rubrique`) REFERENCES `Rubrique` (`Id_Rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table the_twins_meches.SousRubrique : ~3 rows (environ)
INSERT INTO `SousRubrique` (`Id_Sous_Rubrique`, `Nom`, `Id_Rubrique`) VALUES
	(1, 'Lisse', 1),
	(2, 'Perruque boucle et lisse', 2),
	(3, 'lace frontal lisse et boucles', 3);

-- Listage de la structure de table the_twins_meches. utilisateur
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `user_id` varchar(50) NOT NULL,
  `rôles` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  `Id_Commercial` int(11) NOT NULL,
  `cli_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `Id_Commercial` (`Id_Commercial`),
  UNIQUE KEY `cli_id` (`cli_id`),
  CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`Id_Commercial`) REFERENCES `Commercial` (`Id_Commercial`),
  CONSTRAINT `utilisateur_ibfk_2` FOREIGN KEY (`cli_id`) REFERENCES `Client` (`cli_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table the_twins_meches.utilisateur : ~2 rows (environ)
INSERT INTO `utilisateur` (`user_id`, `rôles`, `email`, `user_password`, `Id_Commercial`, `cli_id`) VALUES
	('user1', 'commercial', 'user1@example.com', 'password123', 1, 2),
	('user2', 'client', 'user2@example.com', 'securepass', 2, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
