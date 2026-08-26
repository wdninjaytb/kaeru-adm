-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: kaeru-admin
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Alimentos prontos','Alimentos prontos para consumo',1),(2,'Alimentos pré-prontos','<p>Alimentos que necessitam de preparo antes do consumo</p>',1),(3,'Ingredientes','Ingredientes utilizados no preparo de alimentos',1),(4,'Utilitários','Produtos e utensílios para uso doméstico',1),(5,'Doces','Doces, sobremesas e guloseimas',1),(8,'Bebidas','Bebidas Orientais',1),(9,'Molhos','<p>Molhos Orientais</p>',1),(11,'Snacks','Lanches e petiscos orientais prontos para consumo, ideais para qualquer momento do dia.',1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantidade` int(11) NOT NULL DEFAULT 0,
  `produto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estoque_produto` (`produto_id`),
  CONSTRAINT `fk_estoque_produto` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (2,8,3),(6,10,4),(7,20,16),(8,20,35),(9,15,28),(10,10,5),(11,15,6),(12,25,34),(13,15,17),(14,15,32),(15,14,23),(16,20,12),(17,8,37),(18,16,7),(19,12,15),(20,50,8),(21,35,27),(22,20,33),(23,12,13),(24,15,21),(25,12,11),(26,10,26),(27,14,38),(28,10,30),(29,6,29),(30,12,24),(31,12,25),(32,12,25),(33,15,10),(34,20,14),(35,15,31),(36,8,22),(38,6,2),(41,10,9);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (2,1,'Onigiri de Salmão','<p class=\"\"></p><table><tbody><tr><td data-start=\"137\" data-end=\"161\" data-col-size=\"sm\"><strong data-start=\"139\" data-end=\"160\"></strong></td></tr></tbody></table><p></p><table><tbody><tr><td data-start=\"161\" data-end=\"271\" data-col-size=\"lg\"><p class=\"\">Bolinho de arroz japonês envolto em nori e recheado com salmão, ideal para uma refeição rápida e saborosa.<span style=\"font-family: Inter;\">﻿</span></p></td></tr></tbody></table><br>',14.90,'N/A','1_1787241489.jpg'),(3,1,'Onigiri de Atum','Bolinho de arroz japonês envolto em nori e recheado com atum, prático e perfeito para qualquer momento.',14.90,'N/A','1_1787184566.jpg'),(4,1,'Bandeja de Sushi','Seleção de sushis variados preparados com arroz japonês e ingredientes tradicionais da culinária oriental.',0.00,'N/A','1_1787185287.jpg'),(5,1,'Bandeja de Inarisushi','<table><tbody><tr><td data-start=\"536\" data-end=\"564\" data-col-size=\"md\"><strong data-start=\"538\" data-end=\"563\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"564\" data-end=\"671\" data-col-size=\"lg\">Porções de arroz japonês envoltas em tofu frito levemente adocicado, formando o tradicional inarizushi.</td></tr></tbody></table>',19.90,'N/A','1_1787185516.jpg'),(6,1,'Bentou','Refeição japonesa completa servida em compartimentos, combinando arroz e diferentes acompanhamentos.',29.90,'N/A','1_1787185647.jpg'),(7,3,'Gohan','Arroz japonês de grãos curtos, macio e levemente pegajoso, ideal para acompanhar pratos orientais.',44.90,'GUIN','1_1787183114.jpg'),(8,4,'Hashi','<table><tbody><tr><td data-start=\"905\" data-end=\"917\" data-col-size=\"md\"><strong data-start=\"907\" data-end=\"916\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"917\" data-end=\"1006\" data-col-size=\"lg\">Par de palitos utilizado tradicionalmente para consumir pratos da culinária oriental.</td></tr></tbody></table>',19.90,'N/A','1_1787185747.jpg'),(9,2,'Tofu','Alimento à base de soja com textura macia e sabor suave, versátil para diversas receitas.',19.90,'AGRONIPPO','1_1787183414.jpg'),(10,3,'Shoyu','<table><tbody><tr><td data-start=\"1112\" data-end=\"1124\" data-col-size=\"md\"><strong data-start=\"1114\" data-end=\"1123\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"1124\" data-end=\"1235\" data-col-size=\"lg\">Molho de soja tradicional, ideal para temperar pratos, acompanhar sushis e complementar receitas orientais.</td></tr></tbody></table>',24.90,'MITSUWA','1_1787183509.jpg'),(11,3,'Mirin','<table><tbody><tr><td data-start=\"1236\" data-end=\"1248\" data-col-size=\"md\"><strong data-start=\"1238\" data-end=\"1247\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"1248\" data-end=\"1348\" data-col-size=\"lg\">Tempero japonês levemente adocicado utilizado no preparo de molhos, marinadas e diversos pratos.</td></tr></tbody></table>',24.90,'Hinomoto','1_1787183758.jpg'),(12,3,'Farinha Panko','Farinha de rosca japonesa de textura leve e crocante, ideal para empanados.',29.90,'Alfa','1_1787182719.jpg'),(13,5,'Manju','Doce japonês de massa macia com recheio adocicado, tradicionalmente servido como sobremesa ou acompanhamento.',24.90,'Maruya','1_1787183364.jpg'),(14,2,'Takoyaki','<table><tbody><tr><td data-start=\"1575\" data-end=\"1590\" data-col-size=\"md\"><strong data-start=\"1577\" data-end=\"1589\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"1590\" data-end=\"1703\" data-col-size=\"lg\">Bolinhos japoneses macios preparados com massa e pedaços de polvo, servidos com acompanhamentos tradicionais.</td></tr></tbody></table>',39.90,'Taichi','1_1787184322.jpg'),(15,2,'Gyoza','<table><tbody><tr><td data-start=\"1704\" data-end=\"1716\" data-col-size=\"md\"><strong data-start=\"1706\" data-end=\"1715\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"1716\" data-end=\"1817\" data-col-size=\"lg\">Pastéis orientais recheados e preparados na chapa, combinando massa fina com um recheio saboroso.</td></tr></tbody></table>',39.90,'Longway','1_1787183280.jpg'),(16,5,'Sorvete Samanco','<table><tbody><tr><td data-start=\"1818\" data-end=\"1840\" data-col-size=\"md\"><strong data-start=\"1820\" data-end=\"1839\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"1840\" data-end=\"1940\" data-col-size=\"lg\">Sorvete em formato de peixe com recheio cremoso, inspirado no tradicional doce asiático taiyaki.</td></tr></tbody></table>',17.90,'Binggrae','1_1787182614.jpg'),(17,5,'Choco Pie','Bolo macio coberto com chocolate e recheado com uma camada cremosa de marshmallow.',24.90,'LOTTE','1_1787182543.jpg'),(21,5,'Marshmallow Recheado','<p>Marshmallow macio e leve com recheio cremoso, ideal para consumir como doce ou sobremesa.</p>',19.90,'XLZ','1_1787183622.jpg'),(22,4,'Toalha p/ Banho','<table><tbody><tr><td data-start=\"2165\" data-end=\"2187\" data-col-size=\"md\"><strong data-start=\"2167\" data-end=\"2186\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"2187\" data-end=\"2250\" data-col-size=\"lg\">Toalha de banho macia e confortável, ideal para uso diário.</td></tr></tbody></table>',29.90,'Aisen','1_1787185817.jpg'),(23,4,'Esteira de Bambu','<table><tbody><tr><td data-start=\"2251\" data-end=\"2274\" data-col-size=\"md\"><strong data-start=\"2253\" data-end=\"2273\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"2274\" data-end=\"2369\" data-col-size=\"lg\">Esteira de bambu prática para o preparo e enrolamento de sushi e outras receitas orientais.</td></tr></tbody></table>',13.50,'Shiki','1_1787186431.jpg'),(24,4,'Pinça para peixe','<table><tbody><tr><td data-start=\"2370\" data-end=\"2393\" data-col-size=\"md\"><strong data-start=\"2372\" data-end=\"2392\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"2393\" data-end=\"2500\" data-col-size=\"lg\">Pinça culinária desenvolvida para auxiliar na retirada precisa de espinhas durante o preparo de peixes.</td></tr></tbody></table>',14.90,'Tokyo Design Studio','1_1787186386.jpg'),(25,4,'Ralador de Gengibre','<table><tbody><tr><td data-start=\"2501\" data-end=\"2527\" data-col-size=\"md\"><strong data-start=\"2503\" data-end=\"2526\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"2527\" data-end=\"2638\" data-col-size=\"lg\">Utensílio compacto para ralar gengibre e outros ingredientes com praticidade durante o preparo de receitas.</td></tr></tbody></table>',19.90,'N/A','1_1787185970.jpg'),(26,4,'Modelador de Gyoza','<table><tbody><tr><td data-start=\"2639\" data-end=\"2664\" data-col-size=\"md\"><strong data-start=\"2641\" data-end=\"2663\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"2664\" data-end=\"2746\" data-col-size=\"lg\">Utensílio que facilita o fechamento e a modelagem uniforme de gyozas caseiros.</td></tr></tbody></table>',15.90,'N/A','1_1787186245.jpg'),(27,4,'Hashi p/ Fritura','<p>Hashi alongado desenvolvido para manipular alimentos com maior segurança durante frituras e preparos quentes.</p>',7.90,'N/A','1_1787186163.jpg'),(28,4,'Apoio p/ Hashi','<table><tbody><tr><td data-start=\"2884\" data-end=\"2905\" data-col-size=\"md\"><strong data-start=\"2886\" data-end=\"2904\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"2905\" data-end=\"3009\" data-col-size=\"lg\">Pequeno suporte para apoiar o hashi durante as refeições, mantendo-o afastado da superfície da mesa.</td></tr></tbody></table>',10.50,'N/A','1_1787186054.jpg'),(29,4,'Pantufa de palha','<p>Pantufa leve confeccionada em palha, proporcionando conforto e ventilação para uso cotidiano.</p>',49.90,'N/A','1_1787186526.jpg'),(30,11,'Otsumami Sal 20g','<table><tbody><tr><td data-start=\"3131\" data-end=\"3154\" data-col-size=\"md\"><strong data-start=\"3133\" data-end=\"3153\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"3154\" data-end=\"3253\" data-col-size=\"lg\">Snack salgado de inspiração japonesa em embalagem prática de 20 g, ideal para um lanche rápido.</td></tr></tbody></table>',13.50,'Hiroshi','1_1787182845.jpg'),(31,3,'Tempero para Arroz - Furikake','<table><tbody><tr><td data-start=\"3254\" data-end=\"3290\" data-col-size=\"md\"><strong data-start=\"3256\" data-end=\"3289\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"3290\" data-end=\"3380\" data-col-size=\"lg\">Tempero japonês utilizado sobre o arroz, adicionando sabor e textura de forma prática.</td></tr></tbody></table>',21.90,'Urashima','1_1787183832.jpg'),(32,2,'Cup Ramen','<table><tbody><tr><td data-start=\"3381\" data-end=\"3397\" data-col-size=\"md\"><strong data-start=\"3383\" data-end=\"3396\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"3397\" data-end=\"3490\" data-col-size=\"lg\">Macarrão instantâneo em copo de preparo rápido e prático, ideal para refeições e lanches.</td></tr></tbody></table>',24.90,'Nongshim','1_1787182671.jpg'),(33,8,'KOPIKO L.A COFFEE','<p>Café instantâneo em sachê com leite, de sabor suave e cremoso, prático para preparar a qualquer momento.</p>',39.50,'KOPIKO','1_1787182500.jpg'),(34,11,'Chiclete de Uva','<table><tbody><tr><td data-start=\"3617\" data-end=\"3639\" data-col-size=\"md\"><strong data-start=\"3619\" data-end=\"3638\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"3639\" data-end=\"3724\" data-col-size=\"lg\">Chiclete com sabor doce e frutado de uva, ideal para consumir a qualquer momento.</td></tr></tbody></table>',1.80,'Marukawa','1_1787182119.jpg'),(35,3,'Ajinomoto em Frasco 100g - Edição Especial de One Piece','Realçador de sabor Ajinomoto em frasco de 100 g com embalagem especial inspirada em One Piece.',12.90,'Aji-no-moto','1_1787164996.jpg'),(36,3,'Wasabi Bisnaga','<table><tbody><tr><td data-start=\"3886\" data-end=\"3907\" data-col-size=\"md\"><strong data-start=\"3888\" data-end=\"3906\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"3907\" data-end=\"4004\" data-col-size=\"lg\">Pasta de wasabi em bisnaga, prática para acompanhar sushi, sashimi e outros pratos orientais.</td></tr></tbody></table>',17.90,'S&B','1_1787183895.jpg'),(37,3,'Gobo','<table><tbody><tr><td data-start=\"4005\" data-end=\"4016\" data-col-size=\"md\"><strong data-start=\"4007\" data-end=\"4015\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"4016\" data-end=\"4130\" data-col-size=\"lg\">Raiz de bardana muito utilizada na culinária japonesa, conhecida por sua textura firme e sabor característico.</td></tr></tbody></table>',17.90,'N/A','1_1787182905.jpg'),(38,3,'Moyashi','<table><tbody><tr><td data-start=\"4131\" data-end=\"4145\" data-col-size=\"md\"><strong data-start=\"4133\" data-end=\"4144\"></strong></td></tr></tbody></table><table><tbody><tr><td data-start=\"4145\" data-end=\"4254\" data-col-size=\"lg\">Broto de feijão leve e crocante, utilizado em saladas, refogados e diversos pratos da culinária oriental.</td></tr></tbody></table>',14.90,'Teppen','1_1787183033.jpg'),(44,2,'ProdTeste','<p>12414</p>',12.00,'121',NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER produto_preco_positivo
BEFORE UPDATE ON produto
FOR EACH ROW
BEGIN
    IF NEW.preco < 0 THEN
        SET NEW.preco = 0;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Admin','teste@teste.com','1234',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_estoque_detalhado`
--

DROP TABLE IF EXISTS `vw_estoque_detalhado`;
/*!50001 DROP VIEW IF EXISTS `vw_estoque_detalhado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_estoque_detalhado` AS SELECT 
 1 AS `produto_id`,
 1 AS `produto`,
 1 AS `categoria`,
 1 AS `preco`,
 1 AS `quantidade`,
 1 AS `valor_estoque`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_valor_estoque_categoria`
--

DROP TABLE IF EXISTS `vw_valor_estoque_categoria`;
/*!50001 DROP VIEW IF EXISTS `vw_valor_estoque_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_valor_estoque_categoria` AS SELECT 
 1 AS `categoria_id`,
 1 AS `categoria`,
 1 AS `valor_total_estoque`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'kaeru-admin'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_valor_estoque` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_valor_estoque`(preco DECIMAL(10,2),
	quantidade INT

) RETURNS decimal(10,2)
    DETERMINISTIC
begin
	return preco * quantidade;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_produtos_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_produtos_categoria`(in id_categoria INT)
begin
	select
		p.id,
		p.nome,
		p.preco,
		p.marca
	from produto p
	where p.categoria_id = id_categoria
	order by p.nome;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_produtos_dashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_produtos_dashboard`(
    IN id_categoria INT,
    IN termo VARCHAR(150),
    IN limite INT,
    IN deslocamento INT
)
BEGIN
    SELECT
        p.id,
        p.categoria_id,
        p.nome,
        p.descricao,
        p.preco,
        p.marca,
        p.img,
        e.quantidade
    FROM produto p
    LEFT JOIN estoque e
        ON e.produto_id = p.id
    WHERE
        (id_categoria IS NULL OR p.categoria_id = id_categoria)
        AND
        (termo IS NULL OR p.nome LIKE CONCAT('%', termo, '%'))
    ORDER BY p.nome
    LIMIT limite
    OFFSET deslocamento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_estoque_detalhado`
--

/*!50001 DROP VIEW IF EXISTS `vw_estoque_detalhado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_estoque_detalhado` AS select `p`.`id` AS `produto_id`,`p`.`nome` AS `produto`,`c`.`nome` AS `categoria`,`p`.`preco` AS `preco`,`e`.`quantidade` AS `quantidade`,`calcular_valor_estoque`(`p`.`preco`,`e`.`quantidade`) AS `valor_estoque` from ((`produto` `p` join `categoria` `c` on(`p`.`categoria_id` = `c`.`id`)) join `estoque` `e` on(`p`.`id` = `e`.`produto_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_valor_estoque_categoria`
--

/*!50001 DROP VIEW IF EXISTS `vw_valor_estoque_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_valor_estoque_categoria` AS select `c`.`id` AS `categoria_id`,`c`.`nome` AS `categoria`,sum(`calcular_valor_estoque`(`p`.`preco`,`e`.`quantidade`)) AS `valor_total_estoque` from ((`categoria` `c` join `produto` `p` on(`p`.`categoria_id` = `c`.`id`)) join `estoque` `e` on(`e`.`produto_id` = `p`.`id`)) group by `c`.`id`,`c`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-25  9:58:56
