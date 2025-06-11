CREATE DATABASE  IF NOT EXISTS `loja_redster`
USE `loja_redster`;

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `clientes` WRITE;

INSERT INTO `clientes` VALUES (1,'Caio','Recife'),(2,'João','Rio de Janeiro'),(3,'Maria','João Pessoa'),(4,'Elza','Lisboa'),(5,'Fernanda Lima','São Paulo'),(6,'Ricardo Gomes','Rio de Janeiro'),(7,'Patrícia Souza','Belo Horizonte'),(8,'Bruno Rocha','Curitiba'),(9,'Luciana Almeida','Porto Alegre'),(10,'Eduardo Tavares','Recife'),(11,'Carla Mendes','Fortaleza'),(12,'André Barbosa','Salvador'),(13,'Renata Dias','Brasília'),(14,'Gabriel Costa','Manaus'),(15,'Carlos Eduardo','Belo Horizonte'),(16,'Fernanda Souza','Curitiba'),(17,'Lucas Pereira','Fortaleza'),(18,'Ana Beatriz','Salvador'),(19,'Marcos Vinícius','Recife');

UNLOCK TABLE;


DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `status` enum('cancelado','em andamento','finalizado','entregando','em espera','preparando pedido') DEFAULT 'em espera',
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `pedidos` WRITE;

INSERT INTO `pedidos` VALUES (1,1,1,'finalizado'),(2,2,2,'entregando'),(3,3,3,'preparando pedido'),(4,4,4,'em espera'),(6,6,6,'entregando'),(7,7,7,'preparando pedido'),(8,8,8,'finalizado'),(9,9,9,'em espera'),(10,10,10,'preparando pedido'),(11,11,11,'entregando'),(13,13,13,'preparando pedido'),(14,14,14,'finalizado'),(15,15,10,'em espera'),(16,16,23,'em andamento'),(17,17,24,'entregando'),(18,18,25,'finalizado'),(19,19,26,'cancelado'),(20,15,27,'finalizado'),(21,16,28,'em espera');

UNLOCK TABLES;


DROP TABLE IF EXISTS `produtos`;

CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `preço` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `produtos` WRITE;

INSERT INTO `produtos` VALUES (1,'Camisa',43.20),(2,'Calça',54.70),(3,'Deck',175.60),(4,'Cinto',25.00),(5,'Boné',34.50),(6,'Casaco',203.54),(7,'Camisa Social',120.00),(8,'Calça Jeans',180.00),(9,'Vestido Floral',250.00),(10,'Jaqueta de Couro',690.00),(11,'Blusa de Lã',135.00),(12,'Camiseta Estampada',59.90),(13,'Calça de Moletom',89.00),(14,'Saia Longa',210.00),(15,'Casaco de Inverno',700.00),(16,'Camisa Polo',95.50),(17,'Macacão Feminino',275.00),(18,'Shorts Jeans',65.00),(19,'Camisa Xadrez',110.00),(20,'Regata Básica',50.00),(21,'Blazer Masculino',340.00),(23,'Casaco de Lã',700.00),(24,'Blusa de Frio',550.00),(25,'Sobretudo Elegante',650.00),(26,'Capa de Chuva',520.00),(27,'Calça Jeans Premium',580.00),(28,'Suéter de Algodão',530.00);

UNLOCK TABLES;

