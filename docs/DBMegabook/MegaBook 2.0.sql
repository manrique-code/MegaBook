-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: megabook
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `idAutor` int NOT NULL AUTO_INCREMENT,
  `nombreAutor` varchar(45) NOT NULL,
  `apellidoAutor` varchar(45) NOT NULL,
  `genero` char(3) NOT NULL,
  PRIMARY KEY (`idAutor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Stephen ','King','MAS');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `idcarrito` int NOT NULL AUTO_INCREMENT,
  `idlibro` varchar(64) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`idcarrito`),
  KEY `libros_carrito_idx` (`idlibro`),
  CONSTRAINT `libros_carrito` FOREIGN KEY (`idlibro`) REFERENCES `libros` (`idlibros`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (7,'35CC157C-030D-41B0-8221-B4A861EBD873',1);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `idCategorias` int NOT NULL AUTO_INCREMENT,
  `categoriaDes` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Terror'),(2,'Ciencia Ficcion'),(3,'Romance');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones`
--

DROP TABLE IF EXISTS `funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(45) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL,
  PRIMARY KEY (`fncod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones`
--

LOCK TABLES `funciones` WRITE;
/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` VALUES ('Controllers\\Admin\\Admin','Controllers\\Admin\\Admin','ACT','CTR'),('Controllers\\Mnt\\Autor','Controllers\\Mnt\\Autor','ACT','CTR'),('Controllers\\Mnt\\Autores','Controllers\\Mnt\\Autores','ACT','CTR'),('Controllers\\Mnt\\Autores\\Delete','Controllers\\Mnt\\Autores\\Delete','ACT','CTR'),('Controllers\\Mnt\\Autores\\Edit','Controllers\\Mnt\\Autores\\Edit','ACT','CTR'),('Controllers\\Mnt\\Autores\\New','Controllers\\Mnt\\Autores\\New','ACT','CTR'),('Controllers\\Mnt\\Categorias','Controllers\\Mnt\\Categorias','ACT','CTR'),('Controllers\\Mnt\\Categorias\\Delete','Controllers\\Mnt\\Categorias\\Delete','ACT','CTR'),('Controllers\\Mnt\\Categorias\\Edit','Controllers\\Mnt\\Categorias\\Edit','ACT','CTR'),('Controllers\\Mnt\\Categorias\\New','Controllers\\Mnt\\Categorias\\New','ACT','CTR'),('Controllers\\Mnt\\Funciones','Controllers\\Mnt\\Funciones','ACT','CTR'),('Controllers\\Mnt\\Libro','Controllers\\Mnt\\Libro','ACT','CTR'),('Controllers\\Mnt\\LibroAutores','Controllers\\Mnt\\LibroAutores','ACT','CTR'),('Controllers\\Mnt\\LibroCategorias','Controllers\\Mnt\\LibroCategorias','ACT','CTR'),('Controllers\\Mnt\\LibroDetalle','Controllers\\Mnt\\LibroDetalle','ACT','CTR'),('Controllers\\Mnt\\Libros','Controllers\\Mnt\\Libros','ACT','CTR'),('Controllers\\Mnt\\Libros\\Delete','Controllers\\Mnt\\Libros\\Delete','ACT','CTR'),('Controllers\\Mnt\\Libros\\Edit','Controllers\\Mnt\\Libros\\Edit','ACT','CTR'),('Controllers\\Mnt\\Libros\\New','Controllers\\Mnt\\Libros\\New','ACT','CTR'),('Controllers\\Mnt\\Usuario','Controllers\\Mnt\\Usuario','ACT','CTR'),('Controllers\\Mnt\\Usuarios','Controllers\\Mnt\\Usuarios','ACT','CTR'),('Controllers\\Mnt\\Usuarios\\Delete','Controllers\\Mnt\\Usuarios\\Delete','ACT','CTR'),('Controllers\\Mnt\\Usuarios\\Edit','Controllers\\Mnt\\Usuarios\\Edit','ACT','CTR'),('Controllers\\Mnt\\Usuarios\\New','Controllers\\Mnt\\Usuarios\\New','ACT','CTR'),('MntUsuarios','MntUsuarios','ACT','CTR');
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones_roles`
--

DROP TABLE IF EXISTS `funciones_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funciones_roles` (
  `rolescod` varchar(15) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL,
  PRIMARY KEY (`rolescod`,`fncod`),
  KEY `rol_funcion_key_idx` (`fncod`),
  CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`),
  CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones_roles`
--

LOCK TABLES `funciones_roles` WRITE;
/*!40000 ALTER TABLE `funciones_roles` DISABLE KEYS */;
INSERT INTO `funciones_roles` VALUES ('SUPERADMIN','Controllers\\Mnt\\Autores','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\Categorias','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\Categorias\\Delete','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\Categorias\\Edit','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\Categorias\\New','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\Libro','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\LibroAutores','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\LibroCategorias','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\LibroDetalle','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\Libros','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\Libros\\Delete','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\Libros\\Edit','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\Libros\\New','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\Usuarios','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\Usuarios\\Delete','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\Usuarios\\Edit','ACT','2031-11-27 15:26:09'),('SUPERADMIN','Controllers\\Mnt\\Usuarios\\New','ACT','2031-11-27 15:26:09');
/*!40000 ALTER TABLE `funciones_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_detalle`
--

DROP TABLE IF EXISTS `libro_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro_detalle` (
  `idlibrodetalle` int NOT NULL AUTO_INCREMENT,
  `idlibro` varchar(64) NOT NULL,
  `stock` int NOT NULL,
  `desc` int NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `descexp` datetime DEFAULT NULL,
  `estaenoferta` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idlibrodetalle`),
  KEY `detallelib_idx` (`idlibro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_detalle`
--

LOCK TABLES `libro_detalle` WRITE;
/*!40000 ALTER TABLE `libro_detalle` DISABLE KEYS */;
INSERT INTO `libro_detalle` VALUES (1,'35CC157C-030D-41B0-8221-B4A861EBD873',50,15,500,'2021-12-09 20:14:53',1),(2,'68EF0410-0AE8-40C0-A640-8C27D72BB694',50,15,750,'2021-12-09 20:14:53',1),(3,'90EE71F0-08D4-4797-B6FF-4A943D2D36C5',122,12,12,'2021-12-09 20:14:53',1),(4,'63EF21BB-4A32-420C-B04B-A2489F11E060',5,10,15,'2021-12-08 21:43:44',1);
/*!40000 ALTER TABLE `libro_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `idlibros` varchar(64) NOT NULL,
  `nombreLibro` varchar(45) NOT NULL,
  `descripcion` text NOT NULL,
  `coverart` text,
  PRIMARY KEY (`idlibros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Path de la portada del libro.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES ('35CC157C-030D-41B0-8221-B4A861EBD873','Ojos de Fuego','Ojos de fuego es la historia de Andy y Charlene \"Charlie\" McGee, una pareja de padre e hija que huyen de una agencia gubernamental conocida como The Shop, ubicada en el suburbio ficticio de Longmont, Virginia. Durante sus años universitarios, Andy participó en un experimento de The Shop con el \"Lote Seis\", una droga con efectos alucinógenos similares al LSD. La droga le dio a su futura esposa, Victoria Tomlinson, habilidades menores de telepatía, y a él la habilidad de dominar a las personas con la hipnosis, a la que él se refiere como El Empuje. Los poderes de Victoria y de él son limitados psicológicamente; en su caso, el uso excesivo le da migrañas y hemorragias cerebrales de un minuto, pero su hija Charlie desarrolló la piroquinesis.','public/imgs/coverarts/Ojos_de_fuego-677323803-large.jpg'),('63E2DDA7-60B7-4A7E-A9A1-E835A3C7BFF6','Blaze','Con la ayuda de un muerto, Blaze ha logrado perpetrar el crimen del siglo. Clay Blaisdell, llamado Blaze por todos, mide dos metros y pesa ciento treinta y seis kilos. Es un verdadero gigante. Sin embargo, hasta conocer a George Rackley nunca había hecho nada grande. George le enseñó cien maneras de estafar a la gente e ideó para él un plan ambicioso: secuestrar a un niño rico. La familia Gerard es multimillonaria y el nuevo retoño del clan valdrá muchos de estos millones. Solo hay un problema: cuando llega el momento de ponerlo todo en marcha, George, el cerebro de la operación (y de todo lo que hacen), muere. O quizá no. Por eso Blaze se encuentra huyendo desesperado de una tormenta y de la policía. Ha conseguido raptar al bebé, pero el secuestro se ha convertido en una carrera contrarreloj a través de los bosques infernales de Maine..','public/imgs/coverarts/Ojos_de_fuego-677323803-large.jpg'),('63EF21BB-4A32-420C-B04B-A2489F11E060','charlie y la fabrica de chocolates','FDGDFSGSDFGSDTGHSDTH','public/imgs/coverarts/Ojos_de_fuego-677323803-large.jpg'),('68EF0410-0AE8-40C0-A640-8C27D72BB694','Ojos de Fuego2','hola mundo','public/imgs/coverarts/Ojos_de_fuego-677323803-large.jpg'),('90EE71F0-08D4-4797-B6FF-4A943D2D36C5','las aventuras de tintin','hola mundo','public/imgs/coverarts/Ojos_de_fuego-677323803-large.jpg');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros_autores`
--

DROP TABLE IF EXISTS `libros_autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros_autores` (
  `idlibros` varchar(64) NOT NULL,
  `idAutor` int NOT NULL,
  PRIMARY KEY (`idlibros`,`idAutor`),
  KEY `autores_idx` (`idAutor`),
  KEY `libros_idx` (`idlibros`),
  CONSTRAINT `autores` FOREIGN KEY (`idAutor`) REFERENCES `autores` (`idAutor`),
  CONSTRAINT `libros_autores_fk` FOREIGN KEY (`idlibros`) REFERENCES `libros` (`idlibros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros_autores`
--

LOCK TABLES `libros_autores` WRITE;
/*!40000 ALTER TABLE `libros_autores` DISABLE KEYS */;
INSERT INTO `libros_autores` VALUES ('35CC157C-030D-41B0-8221-B4A861EBD873',1),('63E2DDA7-60B7-4A7E-A9A1-E835A3C7BFF6',1),('63EF21BB-4A32-420C-B04B-A2489F11E060',1),('68EF0410-0AE8-40C0-A640-8C27D72BB694',1),('90EE71F0-08D4-4797-B6FF-4A943D2D36C5',1);
/*!40000 ALTER TABLE `libros_autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros_categorias`
--

DROP TABLE IF EXISTS `libros_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros_categorias` (
  `idCategoria` int NOT NULL,
  `idlibros` varchar(64) NOT NULL,
  PRIMARY KEY (`idCategoria`,`idlibros`),
  KEY `calibros_idx` (`idlibros`),
  CONSTRAINT `libros_categorias_categorias_idCategorias_fk` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategorias`),
  CONSTRAINT `libros_categorias_fk` FOREIGN KEY (`idlibros`) REFERENCES `libros` (`idlibros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros_categorias`
--

LOCK TABLES `libros_categorias` WRITE;
/*!40000 ALTER TABLE `libros_categorias` DISABLE KEYS */;
INSERT INTO `libros_categorias` VALUES (1,'63E2DDA7-60B7-4A7E-A9A1-E835A3C7BFF6'),(2,'63E2DDA7-60B7-4A7E-A9A1-E835A3C7BFF6'),(3,'63E2DDA7-60B7-4A7E-A9A1-E835A3C7BFF6'),(2,'63EF21BB-4A32-420C-B04B-A2489F11E060'),(3,'63EF21BB-4A32-420C-B04B-A2489F11E060'),(2,'90EE71F0-08D4-4797-B6FF-4A943D2D36C5'),(3,'90EE71F0-08D4-4797-B6FF-4A943D2D36C5');
/*!40000 ALTER TABLE `libros_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rolescod` varchar(15) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL,
  PRIMARY KEY (`rolescod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('SUPERADMIN','Super administrador','ACT');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_usuarios` (
  `usercod` bigint NOT NULL,
  `rolescod` varchar(15) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL,
  PRIMARY KEY (`usercod`,`rolescod`),
  KEY `rol_usuario_key_idx` (`rolescod`),
  CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`),
  CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_usuarios`
--

LOCK TABLES `roles_usuarios` WRITE;
/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
INSERT INTO `roles_usuarios` VALUES (1,'SUPERADMIN','ACT','2021-11-27 16:25:32','2021-11-27 16:25:32'),(2,'SUPERADMIN','ACT','2021-11-27 16:26:39','2021-11-27 16:26:39');
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usercod` bigint NOT NULL AUTO_INCREMENT,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  PRIMARY KEY (`usercod`),
  UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'sergio.mnrq1@gmail.com','Manrique','$2y$10$gDur.ev3bngjQMzzE4jxheDhU3gvuJ3KuXn/3TwMuJdpZ8pyVmoIS','2021-11-23 11:46:08','ACT','2022-02-21 00:00:00','ACT','c5ecc7c1b529ddbbd01acaa21531426ddf28af822ead9ca275e001bcae6f7ced','2021-11-23 11:46:08','PBL'),(2,'sersaml17@gmail.com','Sergio Morel','$2y$10$/xzWk365FHXp74/eS0YZuu2aW3gNSRtaj0VQ5FdNrNHEGIPdBluZq','2021-11-27 15:23:50','ACT','2022-02-25 00:00:00','ACT','368f06db1f29ffbf07eaa24b574fa71066f7f75cfe6dd1a7cdca2f0cd0c6ef14','2021-11-27 15:23:50','PBL'),(3,'sersaml170@gmail.com','sermalo12','$2y$10$fsGiabAAMvUVJ/.Whl2A4e90XAAg9KNKlBXVJhAUyKw3iiXHo31Li','2021-11-04 00:00:00','ACT','2021-11-06 00:00:00','ACT','act','act','ACT'),(4,'sersaml27@gmail.com','John Doe','$2y$10$maJ8NZjA.2/juIR8w7DkUOqrKmoJcvcJWrWSyXUYHx2AA41xJKWCC','2021-11-27 17:15:50','ACT','2022-02-25 00:00:00','ACT','7d838d99ba34ab65d19b0a954412392d2718198f1902cfa6a73370465a394af7','2021-11-27 17:15:50','PBL'),(5,'sersaml1900@gmail.com','John Doe','$2y$10$bM0gwYs5v8C0ruuBfC0beeVu4dgerfR7zC7arC5rffneHwEOlMUsS','2021-11-30 20:29:56','ACT','2022-02-28 00:00:00','ACT','e05306119a3744f526d6ea8ead04b78cc890b9125a4974a28d77b545ea738cbe','2021-11-30 20:29:56','PBL');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07 22:20:12
