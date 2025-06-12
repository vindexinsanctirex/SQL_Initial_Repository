CREATE DATABASE  IF NOT EXISTS `pizzaria`
USE `pizzaria`;


DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `clientes` WRITE;

INSERT INTO `clientes` VALUES (1,'João Silva','joao.silva@email.com'),(2,'Maria Oliveira','maria.oliveira@email.com'),(3,'Carlos Souza','carlos.souza@email.com'),(4,'Ana Paula','ana.paula@email.com');

UNLOCK TABLES;


DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `pedidos` WRITE;

INSERT INTO `pedidos` VALUES (1,1,59.90,'2025-06-01'),(2,2,79.80,'2025-06-03'),(3,1,39.90,'2025-06-04'),(4,3,99.00,'2025-06-05'),(5,4,49.50,'2025-06-06');

UNLOCK TABLES;


DROP TABLE IF EXISTS `pedidosabores`;

CREATE TABLE `pedidosabores` (
  `pedido_id` int NOT NULL,
  `sabor_id` int NOT NULL,
  PRIMARY KEY (`pedido_id`,`sabor_id`),
  KEY `sabor_id` (`sabor_id`),
  CONSTRAINT `pedidosabores_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `pedidosabores_ibfk_2` FOREIGN KEY (`sabor_id`) REFERENCES `sabores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `pedidosabores` WRITE;

INSERT INTO `pedidosabores` VALUES (1,1),(4,1),(2,2),(4,2),(3,3),(1,4),(5,4),(2,5),(4,5);

UNLOCK TABLES;



DROP TABLE IF EXISTS `sabores`;

CREATE TABLE `sabores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `sabores` WRITE;

INSERT INTO `sabores` VALUES (1,'Calabresa'),(2,'Margherita'),(3,'Frango com Catupiry'),(4,'Portuguesa'),(5,'Quatro Queijos');

UNLOCK TABLES;

