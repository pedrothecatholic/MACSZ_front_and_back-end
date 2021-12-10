-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: db_macsz
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbladmin`
--

DROP TABLE IF EXISTS `tbladmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbladmin` (
  `idAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `usuario` varchar(254) NOT NULL,
  `senha` varchar(254) NOT NULL,
  PRIMARY KEY (`idAdmin`),
  UNIQUE KEY `idAdmin_UNIQUE` (`idAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladmin`
--

LOCK TABLES `tbladmin` WRITE;
/*!40000 ALTER TABLE `tbladmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbladmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcategoria`
--

DROP TABLE IF EXISTS `tblcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblcategoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE KEY `idCategoria_UNIQUE` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcategoria`
--

LOCK TABLES `tblcategoria` WRITE;
/*!40000 ALTER TABLE `tblcategoria` DISABLE KEYS */;
INSERT INTO `tblcategoria` VALUES (1,'Perfumes'),(2,'Hidratantes'),(3,'Sabonetes');
/*!40000 ALTER TABLE `tblcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcliente`
--

DROP TABLE IF EXISTS `tblcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblcliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `dataNasc` date NOT NULL,
  `dataCadastro` date NOT NULL,
  `email` varchar(254) NOT NULL,
  `senha` varchar(254) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `idCliente_UNIQUE` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcliente`
--

LOCK TABLES `tblcliente` WRITE;
/*!40000 ALTER TABLE `tblcliente` DISABLE KEYS */;
INSERT INTO `tblcliente` VALUES (1,'Artur Duarte','782.191.440-17','2005-01-18','2021-11-24','arturduarte@gmail.com','123'),(2,'Pedro Sousa','456.827.448-90','2004-01-20','2020-04-02','pedrosousa@gmail.com','123'),(5,'Cauã Menezes','928.295.130-88','2004-04-10','2021-10-17','cauamenezes@gmail.com','123');
/*!40000 ALTER TABLE `tblcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontato`
--

DROP TABLE IF EXISTS `tblcontato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblcontato` (
  `idContato` int(11) NOT NULL AUTO_INCREMENT,
  `contato` varchar(254) NOT NULL,
  `idTipoContato` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idContato`),
  UNIQUE KEY `idContato_UNIQUE` (`idContato`),
  KEY `fk_tblContato_tblTipoContato_idx` (`idTipoContato`),
  KEY `fk_tblContato_tblCliente1_idx` (`idCliente`),
  CONSTRAINT `fk_tblContato_tblCliente1` FOREIGN KEY (`idCliente`) REFERENCES `tblcliente` (`idcliente`),
  CONSTRAINT `fk_tblContato_tblTipoContato` FOREIGN KEY (`idTipoContato`) REFERENCES `tbltipocontato` (`idtipocontato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontato`
--

LOCK TABLES `tblcontato` WRITE;
/*!40000 ALTER TABLE `tblcontato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcontato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblendereco`
--

DROP TABLE IF EXISTS `tblendereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblendereco` (
  `idEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `cep` varchar(10) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` text,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idEndereco`),
  UNIQUE KEY `idEndereco_UNIQUE` (`idEndereco`),
  KEY `fk_tblEndereco_tblCliente1_idx` (`idCliente`),
  CONSTRAINT `fk_tblEndereco_tblCliente1` FOREIGN KEY (`idCliente`) REFERENCES `tblcliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblendereco`
--

LOCK TABLES `tblendereco` WRITE;
/*!40000 ALTER TABLE `tblendereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblendereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblingrediente`
--

DROP TABLE IF EXISTS `tblingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblingrediente` (
  `idIngrediente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  PRIMARY KEY (`idIngrediente`),
  UNIQUE KEY `idIngredientes_UNIQUE` (`idIngrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblingrediente`
--

LOCK TABLES `tblingrediente` WRITE;
/*!40000 ALTER TABLE `tblingrediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpedido`
--

DROP TABLE IF EXISTS `tblpedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblpedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  UNIQUE KEY `idClienteProduto_UNIQUE` (`idPedido`),
  KEY `fk_tblClienteProduto_tblCliente1_idx` (`idCliente`),
  CONSTRAINT `fk_tblClienteProduto_tblCliente1` FOREIGN KEY (`idCliente`) REFERENCES `tblcliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpedido`
--

LOCK TABLES `tblpedido` WRITE;
/*!40000 ALTER TABLE `tblpedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpedidoproduto`
--

DROP TABLE IF EXISTS `tblpedidoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblpedidoproduto` (
  `idPedidoProduto` int(11) NOT NULL AUTO_INCREMENT,
  `tblPedido` int(11) NOT NULL,
  `tblProduto` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`idPedidoProduto`),
  UNIQUE KEY `idPedidoProduto_UNIQUE` (`idPedidoProduto`),
  KEY `fk_tblPedidoProduto_tblPedido1_idx` (`tblPedido`),
  KEY `fk_tblPedidoProduto_tblProduto1_idx` (`tblProduto`),
  CONSTRAINT `fk_tblPedidoProduto_tblPedido1` FOREIGN KEY (`tblPedido`) REFERENCES `tblpedido` (`idpedido`),
  CONSTRAINT `fk_tblPedidoProduto_tblProduto1` FOREIGN KEY (`tblProduto`) REFERENCES `tblproduto` (`idproduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpedidoproduto`
--

LOCK TABLES `tblpedidoproduto` WRITE;
/*!40000 ALTER TABLE `tblpedidoproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpedidoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproduto`
--

DROP TABLE IF EXISTS `tblproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblproduto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `preco` varchar(15) NOT NULL,
  `descricao` text NOT NULL,
  `qntde` int(11) NOT NULL,
  `desconto` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE KEY `ididProduto_UNIQUE` (`idProduto`),
  KEY `fk_tblProduto_tblCategoria1_idx` (`idCategoria`),
  CONSTRAINT `fk_tblProduto_tblCategoria1` FOREIGN KEY (`idCategoria`) REFERENCES `tblcategoria` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproduto`
--

LOCK TABLES `tblproduto` WRITE;
/*!40000 ALTER TABLE `tblproduto` DISABLE KEYS */;
INSERT INTO `tblproduto` VALUES (1,'Perfume','Foto do Perfume','R$ 30,00','Cupcake ipsum dolor sit amet. Candy bear claw liquorice jelly beans lemon drops topping gummies cotton candy. Fruitcake cake cupcake pie gingerbread. Jelly-o apple pie marzipan dragée I love lollipop wafer cookie. I love jelly-o lollipop cookie I love dessert jelly-o candy. Sweet icing chocolate bar I love lemon drops marshmallow chocolate. Topping I love croissant soufflé liquorice. Chocolate cake chocolate sugar plum cake chocolate bar liquorice toffee oat cake. Gummies liquorice icing wafer brownie biscuit biscuit jelly-o. Sweet roll bonbon ice cream candy canes pie macaroon. Toffee lollipop pudding sweet sweet roll candy. Sugar plum lollipop muffin chocolate bar icing I love apple pie.',5,0,1),(2,'Hidratante','Foto do Hidratante','R$ 16,50','Cupcake ipsum dolor sit amet. Candy bear claw liquorice jelly beans lemon drops topping gummies cotton candy. Fruitcake cake cupcake pie gingerbread. Jelly-o apple pie marzipan dragée I love lollipop wafer cookie. I love jelly-o lollipop cookie I love dessert jelly-o candy. Sweet icing chocolate bar I love lemon drops marshmallow chocolate. Topping I love croissant soufflé liquorice. Chocolate cake chocolate sugar plum cake chocolate bar liquorice toffee oat cake. Gummies liquorice icing wafer brownie biscuit biscuit jelly-o. Sweet roll bonbon ice cream candy canes pie macaroon. Toffee lollipop pudding sweet sweet roll candy. Sugar plum lollipop muffin chocolate bar icing I love apple pie.',8,0,2),(3,'Sabonete','edbdc58ee9c981d1e70d8ef0f5032b20.','R$ 3,50','Lorem Ipsum',20,0,3),(4,'Sabonete','5a9182a880900bd78cb237335654b046.','R$ 3,50','Lorem Ipsum',20,0,3);
/*!40000 ALTER TABLE `tblproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblprodutoingrediente`
--

DROP TABLE IF EXISTS `tblprodutoingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblprodutoingrediente` (
  `idProdutoIngrediente` int(11) NOT NULL AUTO_INCREMENT,
  `idIngrediente` int(11) NOT NULL,
  `idProduto` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`idProdutoIngrediente`),
  UNIQUE KEY `idProdutoIngrediente_UNIQUE` (`idProdutoIngrediente`),
  KEY `fk_tblProdutoIngrediente_tblIngrediente1_idx` (`idIngrediente`),
  KEY `fk_tblProdutoIngrediente_tblProduto1_idx` (`idProduto`),
  CONSTRAINT `fk_tblProdutoIngrediente_tblIngrediente1` FOREIGN KEY (`idIngrediente`) REFERENCES `tblingrediente` (`idingrediente`),
  CONSTRAINT `fk_tblProdutoIngrediente_tblProduto1` FOREIGN KEY (`idProduto`) REFERENCES `tblproduto` (`idproduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblprodutoingrediente`
--

LOCK TABLES `tblprodutoingrediente` WRITE;
/*!40000 ALTER TABLE `tblprodutoingrediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblprodutoingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltipocontato`
--

DROP TABLE IF EXISTS `tbltipocontato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbltipocontato` (
  `idTipoContato` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(15) NOT NULL,
  PRIMARY KEY (`idTipoContato`),
  UNIQUE KEY `idTipoContato_UNIQUE` (`idTipoContato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltipocontato`
--

LOCK TABLES `tbltipocontato` WRITE;
/*!40000 ALTER TABLE `tbltipocontato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltipocontato` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-09  8:28:32
