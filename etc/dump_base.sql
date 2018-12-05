CREATE DATABASE  IF NOT EXISTS `tpSeguros` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tpSeguros`;
-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: tpSeguros
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Anio_Modelo`
--

DROP TABLE IF EXISTS `Anio_Modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Anio_Modelo` (
  `Modelo_id` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `factor` double DEFAULT NULL,
  PRIMARY KEY (`Modelo_id`,`anio`),
  KEY `fk_Anio_Modelo_Modelo1_idx` (`Modelo_id`),
  CONSTRAINT `fk_Anio_Modelo_Modelo1` FOREIGN KEY (`Modelo_id`) REFERENCES `Modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Anio_Modelo`
--

LOCK TABLES `Anio_Modelo` WRITE;
/*!40000 ALTER TABLE `Anio_Modelo` DISABLE KEYS */;
INSERT INTO `Anio_Modelo` VALUES (1,2010,1.1),(2,2011,1.2),(3,2013,1.1),(4,2012,1.4),(5,2011,1.1),(6,2018,1.2),(7,2017,1.3),(8,2015,1.3),(9,2016,1.4);
/*!40000 ALTER TABLE `Anio_Modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auto`
--

DROP TABLE IF EXISTS `Auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auto` (
  `id` int(11) NOT NULL,
  `Ciudad_id` int(11) NOT NULL,
  `Anio_Modelo_Modelo_id` int(11) NOT NULL,
  `Anio_Modelo_anio` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Auto_Ciudad1_idx` (`Ciudad_id`),
  KEY `fk_Auto_Anio_Modelo1_idx` (`Anio_Modelo_Modelo_id`,`Anio_Modelo_anio`),
  CONSTRAINT `fk_Auto_Anio_Modelo1` FOREIGN KEY (`Anio_Modelo_Modelo_id`, `Anio_Modelo_anio`) REFERENCES `Anio_Modelo` (`Modelo_id`, `anio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Auto_Ciudad1` FOREIGN KEY (`Ciudad_id`) REFERENCES `Ciudad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auto`
--

LOCK TABLES `Auto` WRITE;
/*!40000 ALTER TABLE `Auto` DISABLE KEYS */;
INSERT INTO `Auto` VALUES (1,2,1,2010),(2,3,2,2011),(3,2,3,2013),(4,1,4,2012),(5,5,5,2011),(6,4,6,2018);
/*!40000 ALTER TABLE `Auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ciudad`
--

DROP TABLE IF EXISTS `Ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ciudad` (
  `id` int(11) NOT NULL,
  `factor` double DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ciudad`
--

LOCK TABLES `Ciudad` WRITE;
/*!40000 ALTER TABLE `Ciudad` DISABLE KEYS */;
INSERT INTO `Ciudad` VALUES (1,1.2,'Ciudad de Buenos Aires'),(2,1.1,'San Martín'),(3,1.6,'Tigre'),(4,1.5,'Quilmes'),(5,1,'La Lucila');
/*!40000 ALTER TABLE `Ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Continente`
--

DROP TABLE IF EXISTS `Continente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Continente` (
  `id` int(11) NOT NULL,
  `Tipo_Continente_id` int(11) NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Continente_Tipo_Continente1_idx` (`Tipo_Continente_id`),
  CONSTRAINT `fk_Continente_Tipo_Continente1` FOREIGN KEY (`Tipo_Continente_id`) REFERENCES `Tipo_Continente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Continente`
--

LOCK TABLES `Continente` WRITE;
/*!40000 ALTER TABLE `Continente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Continente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cubre_Riesgo`
--

DROP TABLE IF EXISTS `Cubre_Riesgo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cubre_Riesgo` (
  `Poliza_Hogar_Poliza_id` int(11) NOT NULL,
  `Riesgo_id` int(11) NOT NULL,
  PRIMARY KEY (`Poliza_Hogar_Poliza_id`,`Riesgo_id`),
  KEY `fk_Poliza_Hogar_has_Riesgo_Riesgo1_idx` (`Riesgo_id`),
  KEY `fk_Poliza_Hogar_has_Riesgo_Poliza_Hogar1_idx` (`Poliza_Hogar_Poliza_id`),
  CONSTRAINT `fk_Poliza_Hogar_has_Riesgo_Poliza_Hogar1` FOREIGN KEY (`Poliza_Hogar_Poliza_id`) REFERENCES `Poliza_Hogar` (`Poliza_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Hogar_has_Riesgo_Riesgo1` FOREIGN KEY (`Riesgo_id`) REFERENCES `Riesgo_Hogar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cubre_Riesgo`
--

LOCK TABLES `Cubre_Riesgo` WRITE;
/*!40000 ALTER TABLE `Cubre_Riesgo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cubre_Riesgo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estado`
--

DROP TABLE IF EXISTS `Estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estado` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estado`
--

LOCK TABLES `Estado` WRITE;
/*!40000 ALTER TABLE `Estado` DISABLE KEYS */;
INSERT INTO `Estado` VALUES (1,'Activa'),(2,'Vencida'),(3,'Cancelada');
/*!40000 ALTER TABLE `Estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grupo_Riesgo`
--

DROP TABLE IF EXISTS `Grupo_Riesgo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Grupo_Riesgo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grupo_Riesgo`
--

LOCK TABLES `Grupo_Riesgo` WRITE;
/*!40000 ALTER TABLE `Grupo_Riesgo` DISABLE KEYS */;
INSERT INTO `Grupo_Riesgo` VALUES (1,'Terceros completo',100),(2,'Terceros completo + extras',150),(3,'Todo riesgo',300);
/*!40000 ALTER TABLE `Grupo_Riesgo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marca`
--

DROP TABLE IF EXISTS `Marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Marca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marca`
--

LOCK TABLES `Marca` WRITE;
/*!40000 ALTER TABLE `Marca` DISABLE KEYS */;
INSERT INTO `Marca` VALUES (1,'Ford'),(2,'Renault'),(3,'Chevrolet'),(4,'Citroën'),(5,'Toyota'),(6,'Fiat'),(7,'Volkswagen');
/*!40000 ALTER TABLE `Marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medidas`
--

DROP TABLE IF EXISTS `Medidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medidas` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medidas`
--

LOCK TABLES `Medidas` WRITE;
/*!40000 ALTER TABLE `Medidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Medidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Modelo`
--

DROP TABLE IF EXISTS `Modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Modelo` (
  `id` int(11) NOT NULL,
  `Marca_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Modelo_Marca1_idx` (`Marca_id`),
  CONSTRAINT `fk_Modelo_Marca1` FOREIGN KEY (`Marca_id`) REFERENCES `Marca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Modelo`
--

LOCK TABLES `Modelo` WRITE;
/*!40000 ALTER TABLE `Modelo` DISABLE KEYS */;
INSERT INTO `Modelo` VALUES (1,1,'Ka'),(2,2,'Mondeo'),(3,3,'Corsa'),(4,4,'C3'),(5,5,'Corolla'),(6,6,'Uno'),(7,7,'Gol'),(8,7,'Golf'),(9,2,'Kangoo');
/*!40000 ALTER TABLE `Modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pasa_A`
--

DROP TABLE IF EXISTS `Pasa_A`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pasa_A` (
  `Estado_id_actual` int(11) NOT NULL,
  `Estado_id_siguiente` int(11) NOT NULL,
  PRIMARY KEY (`Estado_id_actual`,`Estado_id_siguiente`),
  KEY `fk_Estado_has_Estado_Estado2_idx` (`Estado_id_siguiente`),
  KEY `fk_Estado_has_Estado_Estado1_idx` (`Estado_id_actual`),
  CONSTRAINT `fk_Estado_has_Estado_Estado1` FOREIGN KEY (`Estado_id_actual`) REFERENCES `Estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estado_has_Estado_Estado2` FOREIGN KEY (`Estado_id_siguiente`) REFERENCES `Estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pasa_A`
--

LOCK TABLES `Pasa_A` WRITE;
/*!40000 ALTER TABLE `Pasa_A` DISABLE KEYS */;
INSERT INTO `Pasa_A` VALUES (1,2),(1,3);
/*!40000 ALTER TABLE `Pasa_A` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Persona`
--

DROP TABLE IF EXISTS `Persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Persona` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Persona`
--

LOCK TABLES `Persona` WRITE;
/*!40000 ALTER TABLE `Persona` DISABLE KEYS */;
INSERT INTO `Persona` VALUES (11111111,'Juan Manuel','Pérez','1985-10-11'),(22222222,'Carlos Alberto','Gutierrez','1980-10-05'),(30123321,'Julieta','Fernández','1990-10-10'),(33333333,'María Susana','Fastín','1963-08-18');
/*!40000 ALTER TABLE `Persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Poliza`
--

DROP TABLE IF EXISTS `Poliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Poliza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Estado_id` int(11) NOT NULL,
  `Productor_legajo` int(11) NOT NULL,
  `Persona_dni` int(11) NOT NULL,
  `prima` varchar(45) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `porcentaje_productor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Poliza_Estado1_idx` (`Estado_id`),
  KEY `fk_Poliza_Productor1_idx` (`Productor_legajo`),
  KEY `fk_Poliza_Persona1_idx` (`Persona_dni`),
  CONSTRAINT `fk_Poliza_Estado1` FOREIGN KEY (`Estado_id`) REFERENCES `Estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Persona1` FOREIGN KEY (`Persona_dni`) REFERENCES `Persona` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Productor1` FOREIGN KEY (`Productor_legajo`) REFERENCES `Productor` (`legajo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Poliza`
--

LOCK TABLES `Poliza` WRITE;
/*!40000 ALTER TABLE `Poliza` DISABLE KEYS */;
/*!40000 ALTER TABLE `Poliza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Poliza_Auto`
--

DROP TABLE IF EXISTS `Poliza_Auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Poliza_Auto` (
  `Poliza_id` int(11) NOT NULL,
  `Auto_id` int(11) NOT NULL,
  `Grupo_Riesgo_id` int(11) NOT NULL,
  `franquicia` double DEFAULT NULL,
  PRIMARY KEY (`Poliza_id`),
  KEY `fk_Poliza_Auto_Auto1_idx` (`Auto_id`),
  KEY `fk_Poliza_Auto_Grupo_Riesgo1_idx` (`Grupo_Riesgo_id`),
  CONSTRAINT `fk_Poliza_Auto_Auto1` FOREIGN KEY (`Auto_id`) REFERENCES `Auto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Auto_Grupo_Riesgo1` FOREIGN KEY (`Grupo_Riesgo_id`) REFERENCES `Grupo_Riesgo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Auto_Poliza1` FOREIGN KEY (`Poliza_id`) REFERENCES `Poliza` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Poliza_Auto`
--

LOCK TABLES `Poliza_Auto` WRITE;
/*!40000 ALTER TABLE `Poliza_Auto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Poliza_Auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Poliza_Hogar`
--

DROP TABLE IF EXISTS `Poliza_Hogar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Poliza_Hogar` (
  `Poliza_id` int(11) NOT NULL,
  `Continente_id` int(11) NOT NULL,
  `monto_asegurado` double DEFAULT NULL,
  PRIMARY KEY (`Poliza_id`),
  KEY `fk_Poliza_Hogar_Continente1_idx` (`Continente_id`),
  CONSTRAINT `fk_Poliza_Hogar_Continente1` FOREIGN KEY (`Continente_id`) REFERENCES `Continente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Hogar_Poliza1` FOREIGN KEY (`Poliza_id`) REFERENCES `Poliza` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Poliza_Hogar`
--

LOCK TABLES `Poliza_Hogar` WRITE;
/*!40000 ALTER TABLE `Poliza_Hogar` DISABLE KEYS */;
/*!40000 ALTER TABLE `Poliza_Hogar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Poliza_Vida`
--

DROP TABLE IF EXISTS `Poliza_Vida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Poliza_Vida` (
  `Poliza_id` int(11) NOT NULL,
  `Profesion_id` int(11) NOT NULL,
  `Persona_dni_asegurado` int(11) NOT NULL,
  `monto_asegurado` double DEFAULT NULL,
  PRIMARY KEY (`Poliza_id`),
  KEY `fk_Poliza_Vida_Profesion1_idx` (`Profesion_id`),
  KEY `fk_Poliza_Vida_Persona1_idx` (`Persona_dni_asegurado`),
  CONSTRAINT `fk_Poliza_Vida_Persona1` FOREIGN KEY (`Persona_dni_asegurado`) REFERENCES `Persona` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Vida_Poliza` FOREIGN KEY (`Poliza_id`) REFERENCES `Poliza` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Vida_Profesion1` FOREIGN KEY (`Profesion_id`) REFERENCES `Profesion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Poliza_Vida`
--

LOCK TABLES `Poliza_Vida` WRITE;
/*!40000 ALTER TABLE `Poliza_Vida` DISABLE KEYS */;
/*!40000 ALTER TABLE `Poliza_Vida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productor`
--

DROP TABLE IF EXISTS `Productor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Productor` (
  `legajo` int(11) NOT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`legajo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productor`
--

LOCK TABLES `Productor` WRITE;
/*!40000 ALTER TABLE `Productor` DISABLE KEYS */;
INSERT INTO `Productor` VALUES (1,'Romiti','Pedro'),(2,'Méndez','Guillermo'),(3,'Pinedo','Manuel'),(4,'Diuorno','Nahuel'),(5,'Espalla','Mailén'),(6,'Mon','Dendi'),(7,'Chan','Kala'),(8,'Hebe','Sara'),(9,'Pozzo','Estefanía'),(10,'Bestilacqua','Amelia');
/*!40000 ALTER TABLE `Productor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profesion`
--

DROP TABLE IF EXISTS `Profesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profesion` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `factor` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profesion`
--

LOCK TABLES `Profesion` WRITE;
/*!40000 ALTER TABLE `Profesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Profesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Riesgo_Auto`
--

DROP TABLE IF EXISTS `Riesgo_Auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Riesgo_Auto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Riesgo_Auto`
--

LOCK TABLES `Riesgo_Auto` WRITE;
/*!40000 ALTER TABLE `Riesgo_Auto` DISABLE KEYS */;
INSERT INTO `Riesgo_Auto` VALUES (1,'Accidente'),(2,'Incendio'),(3,'Robo');
/*!40000 ALTER TABLE `Riesgo_Auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Riesgo_Hogar`
--

DROP TABLE IF EXISTS `Riesgo_Hogar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Riesgo_Hogar` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Riesgo_Hogar`
--

LOCK TABLES `Riesgo_Hogar` WRITE;
/*!40000 ALTER TABLE `Riesgo_Hogar` DISABLE KEYS */;
/*!40000 ALTER TABLE `Riesgo_Hogar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Siniestro`
--

DROP TABLE IF EXISTS `Siniestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Siniestro` (
  `id` int(11) NOT NULL,
  `causa` varchar(45) DEFAULT NULL,
  `Persona_dni` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Siniestros_Persona1_idx` (`Persona_dni`),
  CONSTRAINT `fk_Siniestros_Persona1` FOREIGN KEY (`Persona_dni`) REFERENCES `Persona` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Siniestro`
--

LOCK TABLES `Siniestro` WRITE;
/*!40000 ALTER TABLE `Siniestro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Siniestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tiene_Medidas`
--

DROP TABLE IF EXISTS `Tiene_Medidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tiene_Medidas` (
  `Poliza_Hogar_Poliza_id` int(11) NOT NULL,
  `Medidas_id` int(11) NOT NULL,
  PRIMARY KEY (`Poliza_Hogar_Poliza_id`,`Medidas_id`),
  KEY `fk_Poliza_Hogar_has_Medidas_Medidas1_idx` (`Medidas_id`),
  KEY `fk_Poliza_Hogar_has_Medidas_Poliza_Hogar1_idx` (`Poliza_Hogar_Poliza_id`),
  CONSTRAINT `fk_Poliza_Hogar_has_Medidas_Medidas1` FOREIGN KEY (`Medidas_id`) REFERENCES `Medidas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Hogar_has_Medidas_Poliza_Hogar1` FOREIGN KEY (`Poliza_Hogar_Poliza_id`) REFERENCES `Poliza_Hogar` (`Poliza_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tiene_Medidas`
--

LOCK TABLES `Tiene_Medidas` WRITE;
/*!40000 ALTER TABLE `Tiene_Medidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tiene_Medidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_Continente`
--

DROP TABLE IF EXISTS `Tipo_Continente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipo_Continente` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `factor` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Continente`
--

LOCK TABLES `Tipo_Continente` WRITE;
/*!40000 ALTER TABLE `Tipo_Continente` DISABLE KEYS */;
INSERT INTO `Tipo_Continente` VALUES (1,'Casa',1),(2,'Departamento',1.5),(3,'Galpón',2.5),(4,'Comercio',1),(5,'PH',1.8);
/*!40000 ALTER TABLE `Tipo_Continente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficiario`
--

DROP TABLE IF EXISTS `beneficiario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beneficiario` (
  `Poliza_Vida_Poliza_id` int(11) NOT NULL,
  `Persona_dni` int(11) NOT NULL,
  `lazo` varchar(45) DEFAULT NULL,
  `porcentaje` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Poliza_Vida_Poliza_id`,`Persona_dni`),
  KEY `fk_Poliza_Vida_has_Persona_Persona1_idx` (`Persona_dni`),
  KEY `fk_Poliza_Vida_has_Persona_Poliza_Vida1_idx` (`Poliza_Vida_Poliza_id`),
  CONSTRAINT `fk_Poliza_Vida_has_Persona_Persona1` FOREIGN KEY (`Persona_dni`) REFERENCES `Persona` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Vida_has_Persona_Poliza_Vida1` FOREIGN KEY (`Poliza_Vida_Poliza_id`) REFERENCES `Poliza_Vida` (`Poliza_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiario`
--

LOCK TABLES `beneficiario` WRITE;
/*!40000 ALTER TABLE `beneficiario` DISABLE KEYS */;
/*!40000 ALTER TABLE `beneficiario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cubre`
--

DROP TABLE IF EXISTS `cubre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cubre` (
  `Grupo_Riesgo_id` int(11) NOT NULL,
  `Riesgo_id` int(11) NOT NULL,
  PRIMARY KEY (`Grupo_Riesgo_id`,`Riesgo_id`),
  KEY `fk_Grupo_Riesgo_has_Riesgo_Riesgo1_idx` (`Riesgo_id`),
  KEY `fk_Grupo_Riesgo_has_Riesgo_Grupo_Riesgo1_idx` (`Grupo_Riesgo_id`),
  CONSTRAINT `fk_Grupo_Riesgo_has_Riesgo_Grupo_Riesgo1` FOREIGN KEY (`Grupo_Riesgo_id`) REFERENCES `Grupo_Riesgo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Grupo_Riesgo_has_Riesgo_Riesgo1` FOREIGN KEY (`Riesgo_id`) REFERENCES `Riesgo_Auto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cubre`
--

LOCK TABLES `cubre` WRITE;
/*!40000 ALTER TABLE `cubre` DISABLE KEYS */;
/*!40000 ALTER TABLE `cubre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitigan`
--

DROP TABLE IF EXISTS `mitigan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mitigan` (
  `Medidas_id` int(11) NOT NULL,
  `Riesgo_id` int(11) NOT NULL,
  PRIMARY KEY (`Medidas_id`,`Riesgo_id`),
  KEY `fk_Medidas_has_Riesgo_Riesgo1_idx` (`Riesgo_id`),
  KEY `fk_Medidas_has_Riesgo_Medidas1_idx` (`Medidas_id`),
  CONSTRAINT `fk_Medidas_has_Riesgo_Medidas1` FOREIGN KEY (`Medidas_id`) REFERENCES `Medidas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medidas_has_Riesgo_Riesgo1` FOREIGN KEY (`Riesgo_id`) REFERENCES `Riesgo_Hogar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitigan`
--

LOCK TABLES `mitigan` WRITE;
/*!40000 ALTER TABLE `mitigan` DISABLE KEYS */;
/*!40000 ALTER TABLE `mitigan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-02  1:06:40

INSERT INTO `Profesion` VALUES ('1', 'Actor', '1.1');
INSERT INTO `Profesion` VALUES ('2', 'Mecanico', '1.2');
INSERT INTO `Profesion` VALUES ('3', 'Programador', '1.3');
INSERT INTO `Profesion` VALUES ('4', 'Profesor', '1.4');
INSERT INTO `Profesion` VALUES ('5', 'Vendedor', '1.4');
INSERT INTO `Profesion` VALUES ('6', 'Seguridad', '1.01');
INSERT INTO `Profesion` VALUES ('7', 'Portero', '1.05');


INSERT INTO `Poliza` VALUES ('1', '1', '10', '33333333', '1487', '2018-05-26', '2019-05-26', '35');
INSERT INTO `Poliza` VALUES ('2', '1', '1', '30123321', '4168', '2018-01-09', '2019-01-09', '29');
INSERT INTO `Poliza` VALUES ('3', '1', '6', '33333333', '6549', '2018-06-05', '2019-06-05', '61');
INSERT INTO `Poliza` VALUES ('4', '1', '8', '33333333', '4601', '2018-09-26', '2019-09-26', '67');
INSERT INTO `Poliza` VALUES ('5', '1', '5', '11111111', '5741', '2018-06-03', '2019-06-03', '60');
INSERT INTO `Poliza` VALUES ('6', '1', '7', '33333333', '794', '2018-06-24', '2019-06-24', '25');
INSERT INTO `Poliza` VALUES ('7', '1', '3', '33333333', '5765', '2018-04-06', '2019-04-06', '33');
INSERT INTO `Poliza` VALUES ('8', '1', '3', '22222222', '2289', '2018-03-26', '2019-03-26', '19');
INSERT INTO `Poliza` VALUES ('9', '1', '9', '11111111', '2216', '2018-11-29', '2019-11-29', '19');
INSERT INTO `Poliza` VALUES ('10', '1', '6', '33333333', '9852', '2018-04-04', '2019-04-04', '57');
INSERT INTO `Poliza` VALUES ('11', '1', '5', '22222222', '6199', '2018-04-21', '2019-04-21', '42');
INSERT INTO `Poliza` VALUES ('12', '1', '6', '33333333', '4659', '2018-07-19', '2019-07-19', '58');
INSERT INTO `Poliza` VALUES ('13', '1', '4', '22222222', '4194', '2018-01-06', '2019-01-06', '53');
INSERT INTO `Poliza` VALUES ('14', '1', '7', '22222222', '2955', '2018-12-26', '2019-12-26', '18');
INSERT INTO `Poliza` VALUES ('15', '1', '3', '33333333', '8418', '2018-08-04', '2019-08-04', '26');
INSERT INTO `Poliza` VALUES ('16', '1', '7', '22222222', '7957', '2018-11-30', '2019-11-30', '10');
INSERT INTO `Poliza` VALUES ('17', '1', '10', '22222222', '8890', '2018-10-29', '2019-10-29', '18');
INSERT INTO `Poliza` VALUES ('18', '1', '10', '30123321', '5155', '2017-12-09', '2018-12-09', '19');
INSERT INTO `Poliza` VALUES ('19', '1', '4', '22222222', '5062', '2018-10-12', '2019-10-12', '21');
INSERT INTO `Poliza` VALUES ('20', '1', '7', '33333333', '6734', '2018-10-03', '2019-10-03', '59');
INSERT INTO `Poliza` VALUES ('21', '1', '5', '11111111', '1406', '2017-11-24', '2018-11-24', '70');
INSERT INTO `Poliza` VALUES ('22', '1', '5', '33333333', '8250', '2018-01-23', '2019-01-23', '46');
INSERT INTO `Poliza` VALUES ('23', '1', '10', '22222222', '8334', '2018-10-11', '2019-10-11', '48');
INSERT INTO `Poliza` VALUES ('24', '1', '6', '33333333', '4126', '2017-11-07', '2018-11-07', '16');
INSERT INTO `Poliza` VALUES ('25', '1', '7', '11111111', '9181', '2018-07-30', '2019-07-30', '55');
INSERT INTO `Poliza` VALUES ('26', '1', '9', '11111111', '9116', '2017-12-19', '2018-12-19', '14');
INSERT INTO `Poliza` VALUES ('27', '1', '3', '33333333', '892', '2018-12-13', '2019-12-13', '11');
INSERT INTO `Poliza` VALUES ('28', '1', '10', '22222222', '2344', '2018-01-29', '2019-01-29', '42');
INSERT INTO `Poliza` VALUES ('29', '1', '9', '11111111', '1258', '2018-06-05', '2019-06-05', '31');
INSERT INTO `Poliza` VALUES ('30', '1', '8', '33333333', '9731', '2018-04-03', '2019-04-03', '37');
INSERT INTO `Poliza` VALUES ('31', '1', '7', '22222222', '6057', '2018-02-16', '2019-02-16', '41');
INSERT INTO `Poliza` VALUES ('32', '1', '1', '11111111', '2599', '2018-04-26', '2019-04-26', '42');
INSERT INTO `Poliza` VALUES ('33', '1', '6', '22222222', '7024', '2018-03-20', '2019-03-20', '39');
INSERT INTO `Poliza` VALUES ('34', '1', '1', '11111111', '2500', '2018-05-28', '2019-05-28', '29');
INSERT INTO `Poliza` VALUES ('35', '1', '6', '11111111', '5552', '2018-08-03', '2019-08-03', '52');
INSERT INTO `Poliza` VALUES ('36', '1', '1', '30123321', '3935', '2018-08-23', '2019-08-23', '49');
INSERT INTO `Poliza` VALUES ('37', '1', '8', '11111111', '2335', '2018-01-14', '2019-01-14', '55');
INSERT INTO `Poliza` VALUES ('38', '1', '5', '30123321', '8391', '2018-02-11', '2019-02-11', '41');
INSERT INTO `Poliza` VALUES ('39', '1', '5', '11111111', '4565', '2018-06-23', '2019-06-23', '48');
INSERT INTO `Poliza` VALUES ('40', '1', '10', '22222222', '9591', '2018-02-05', '2019-02-05', '11');
INSERT INTO `Poliza` VALUES ('41', '1', '1', '11111111', '3890', '2018-11-10', '2019-11-10', '57');
INSERT INTO `Poliza` VALUES ('42', '1', '7', '30123321', '3486', '2019-01-04', '2020-01-04', '21');
INSERT INTO `Poliza` VALUES ('43', '1', '3', '22222222', '6512', '2018-06-12', '2019-06-12', '49');
INSERT INTO `Poliza` VALUES ('44', '1', '4', '11111111', '3333', '2018-03-13', '2019-03-13', '56');
INSERT INTO `Poliza` VALUES ('45', '1', '1', '30123321', '3961', '2018-09-29', '2019-09-29', '56');
INSERT INTO `Poliza` VALUES ('46', '1', '9', '30123321', '9428', '2018-06-12', '2019-06-12', '69');
INSERT INTO `Poliza` VALUES ('47', '1', '3', '11111111', '8145', '2018-11-17', '2019-11-17', '22');
INSERT INTO `Poliza` VALUES ('48', '1', '5', '11111111', '3604', '2018-03-04', '2019-03-04', '64');
INSERT INTO `Poliza` VALUES ('49', '1', '3', '33333333', '3973', '2019-01-07', '2020-01-07', '39');
INSERT INTO `Poliza` VALUES ('50', '1', '4', '33333333', '2259', '2018-01-25', '2019-01-25', '43');
INSERT INTO `Poliza` VALUES ('51', '1', '4', '11111111', '2891', '2018-05-18', '2019-05-18', '34');
INSERT INTO `Poliza` VALUES ('52', '1', '3', '33333333', '2989', '2017-11-09', '2018-11-09', '23');
INSERT INTO `Poliza` VALUES ('53', '1', '6', '33333333', '7544', '2018-06-13', '2019-06-13', '41');
INSERT INTO `Poliza` VALUES ('54', '1', '8', '33333333', '6275', '2018-10-08', '2019-10-08', '32');
INSERT INTO `Poliza` VALUES ('55', '1', '7', '33333333', '2784', '2017-11-06', '2018-11-06', '58');
INSERT INTO `Poliza` VALUES ('56', '1', '6', '22222222', '258', '2018-10-28', '2019-10-28', '24');
INSERT INTO `Poliza` VALUES ('57', '1', '7', '33333333', '3692', '2018-03-21', '2019-03-21', '34');
INSERT INTO `Poliza` VALUES ('58', '1', '8', '33333333', '1315', '2018-01-09', '2019-01-09', '59');
INSERT INTO `Poliza` VALUES ('59', '1', '2', '11111111', '5519', '2018-08-06', '2019-08-06', '35');
INSERT INTO `Poliza` VALUES ('60', '1', '3', '30123321', '8073', '2017-12-24', '2018-12-24', '53');
INSERT INTO `Poliza` VALUES ('61', '1', '1', '33333333', '9574', '2018-01-12', '2019-01-12', '62');
INSERT INTO `Poliza` VALUES ('62', '1', '2', '33333333', '6413', '2018-10-08', '2019-10-08', '32');
INSERT INTO `Poliza` VALUES ('63', '1', '7', '22222222', '2919', '2017-12-29', '2018-12-29', '21');
INSERT INTO `Poliza` VALUES ('64', '1', '10', '22222222', '4432', '2018-12-20', '2019-12-20', '25');
INSERT INTO `Poliza` VALUES ('65', '1', '8', '22222222', '1236', '2018-12-28', '2019-12-28', '66');
INSERT INTO `Poliza` VALUES ('66', '1', '7', '33333333', '4658', '2018-01-08', '2019-01-08', '26');
INSERT INTO `Poliza` VALUES ('67', '1', '6', '33333333', '4600', '2018-06-27', '2019-06-27', '20');
INSERT INTO `Poliza` VALUES ('68', '1', '3', '33333333', '8079', '2018-02-13', '2019-02-13', '15');
INSERT INTO `Poliza` VALUES ('69', '1', '8', '22222222', '8356', '2018-09-29', '2019-09-29', '52');
INSERT INTO `Poliza` VALUES ('70', '1', '9', '22222222', '9420', '2018-04-15', '2019-04-15', '57');
INSERT INTO `Poliza` VALUES ('71', '1', '9', '30123321', '5214', '2018-02-05', '2019-02-05', '24');
INSERT INTO `Poliza` VALUES ('72', '1', '7', '11111111', '4641', '2018-07-16', '2019-07-16', '51');
INSERT INTO `Poliza` VALUES ('73', '1', '2', '22222222', '4387', '2018-09-12', '2019-09-12', '30');
INSERT INTO `Poliza` VALUES ('74', '1', '4', '22222222', '7892', '2018-02-20', '2019-02-20', '52');
INSERT INTO `Poliza` VALUES ('75', '1', '2', '33333333', '3400', '2018-03-13', '2019-03-13', '49');
INSERT INTO `Poliza` VALUES ('76', '1', '7', '30123321', '9342', '2018-11-01', '2019-11-01', '55');
INSERT INTO `Poliza` VALUES ('77', '1', '3', '11111111', '7667', '2017-11-21', '2018-11-21', '52');
INSERT INTO `Poliza` VALUES ('78', '1', '10', '11111111', '7958', '2018-12-23', '2019-12-23', '14');
INSERT INTO `Poliza` VALUES ('79', '1', '7', '11111111', '6205', '2017-12-09', '2018-12-09', '34');
INSERT INTO `Poliza` VALUES ('80', '1', '9', '30123321', '7856', '2018-08-25', '2019-08-25', '32');
INSERT INTO `Poliza` VALUES ('81', '1', '2', '11111111', '6260', '2018-01-23', '2019-01-23', '29');
INSERT INTO `Poliza` VALUES ('82', '1', '9', '30123321', '4403', '2018-08-25', '2019-08-25', '30');
INSERT INTO `Poliza` VALUES ('83', '1', '3', '30123321', '8457', '2018-03-20', '2019-03-20', '58');
INSERT INTO `Poliza` VALUES ('84', '1', '10', '22222222', '4861', '2018-01-02', '2019-01-02', '58');
INSERT INTO `Poliza` VALUES ('85', '1', '10', '22222222', '4637', '2017-12-14', '2018-12-14', '68');
INSERT INTO `Poliza` VALUES ('86', '1', '2', '22222222', '5587', '2018-08-13', '2019-08-13', '25');
INSERT INTO `Poliza` VALUES ('87', '1', '6', '30123321', '9681', '2018-04-02', '2019-04-02', '47');
INSERT INTO `Poliza` VALUES ('88', '1', '3', '33333333', '9140', '2018-05-15', '2019-05-15', '65');
INSERT INTO `Poliza` VALUES ('89', '1', '7', '11111111', '9832', '2018-08-15', '2019-08-15', '44');
INSERT INTO `Poliza` VALUES ('90', '1', '5', '22222222', '4414', '2018-02-09', '2019-02-09', '48');
INSERT INTO `Poliza` VALUES ('91', '1', '8', '11111111', '972', '2018-08-12', '2019-08-12', '59');
INSERT INTO `Poliza` VALUES ('92', '1', '10', '22222222', '2250', '2018-04-10', '2019-04-10', '42');
INSERT INTO `Poliza` VALUES ('93', '1', '1', '11111111', '5006', '2018-07-01', '2019-07-01', '45');
INSERT INTO `Poliza` VALUES ('94', '1', '10', '33333333', '3395', '2018-06-12', '2019-06-12', '64');
INSERT INTO `Poliza` VALUES ('95', '1', '7', '30123321', '1891', '2017-11-07', '2018-11-07', '56');
INSERT INTO `Poliza` VALUES ('96', '1', '4', '11111111', '3504', '2018-09-12', '2019-09-12', '14');
INSERT INTO `Poliza` VALUES ('97', '1', '3', '22222222', '6072', '2018-11-08', '2019-11-08', '16');
INSERT INTO `Poliza` VALUES ('98', '1', '9', '22222222', '7539', '2017-12-17', '2018-12-17', '61');
INSERT INTO `Poliza` VALUES ('99', '1', '8', '30123321', '1148', '2017-11-05', '2018-11-05', '50');
INSERT INTO `Poliza` VALUES ('100', '1', '9', '11111111', '8833', '2018-12-16', '2019-12-16', '53');
INSERT INTO `Poliza` VALUES ('101', '1', '4', '30123321', '8330', '2017-12-05', '2018-12-05', '26');
INSERT INTO `Poliza` VALUES ('102', '1', '4', '33333333', '1161', '2018-02-02', '2019-02-02', '46');
INSERT INTO `Poliza` VALUES ('103', '1', '9', '11111111', '9364', '2018-07-19', '2019-07-19', '14');
INSERT INTO `Poliza` VALUES ('104', '1', '4', '30123321', '5252', '2018-03-29', '2019-03-29', '35');
INSERT INTO `Poliza` VALUES ('105', '1', '6', '30123321', '4464', '2018-08-27', '2019-08-27', '62');
INSERT INTO `Poliza` VALUES ('106', '1', '3', '22222222', '5346', '2018-10-02', '2019-10-02', '20');
INSERT INTO `Poliza` VALUES ('107', '1', '4', '22222222', '9628', '2017-12-14', '2018-12-14', '19');
INSERT INTO `Poliza` VALUES ('108', '1', '4', '22222222', '2801', '2018-09-29', '2019-09-29', '50');
INSERT INTO `Poliza` VALUES ('109', '1', '8', '22222222', '4412', '2017-12-30', '2018-12-30', '43');
INSERT INTO `Poliza` VALUES ('110', '1', '10', '22222222', '6832', '2018-11-02', '2019-11-02', '40');
INSERT INTO `Poliza` VALUES ('111', '1', '4', '22222222', '2357', '2018-07-22', '2019-07-22', '41');
INSERT INTO `Poliza` VALUES ('112', '1', '10', '22222222', '8436', '2018-02-02', '2019-02-02', '39');
INSERT INTO `Poliza` VALUES ('113', '1', '9', '30123321', '766', '2017-11-02', '2018-11-02', '63');
INSERT INTO `Poliza` VALUES ('114', '1', '5', '22222222', '8785', '2018-05-22', '2019-05-22', '19');
INSERT INTO `Poliza` VALUES ('115', '1', '9', '11111111', '3494', '2018-06-21', '2019-06-21', '64');
INSERT INTO `Poliza` VALUES ('116', '1', '2', '11111111', '7742', '2018-07-08', '2019-07-08', '61');
INSERT INTO `Poliza` VALUES ('117', '1', '1', '11111111', '7827', '2018-02-03', '2019-02-03', '15');
INSERT INTO `Poliza` VALUES ('118', '1', '2', '33333333', '9104', '2019-01-08', '2020-01-08', '46');
INSERT INTO `Poliza` VALUES ('119', '1', '9', '22222222', '6288', '2018-05-03', '2019-05-03', '12');
INSERT INTO `Poliza` VALUES ('120', '1', '6', '30123321', '417', '2018-08-05', '2019-08-05', '29');
INSERT INTO `Poliza` VALUES ('121', '1', '2', '22222222', '7225', '2018-06-24', '2019-06-24', '38');
INSERT INTO `Poliza` VALUES ('122', '1', '6', '30123321', '5925', '2018-09-12', '2019-09-12', '56');
INSERT INTO `Poliza` VALUES ('123', '1', '10', '11111111', '7384', '2018-02-18', '2019-02-18', '42');
INSERT INTO `Poliza` VALUES ('124', '1', '4', '11111111', '3437', '2018-09-28', '2019-09-28', '61');
INSERT INTO `Poliza` VALUES ('125', '1', '4', '22222222', '1757', '2018-06-30', '2019-06-30', '68');
INSERT INTO `Poliza` VALUES ('126', '1', '5', '30123321', '5356', '2017-12-16', '2018-12-16', '42');
INSERT INTO `Poliza` VALUES ('127', '1', '4', '11111111', '5138', '2018-08-29', '2019-08-29', '56');
INSERT INTO `Poliza` VALUES ('128', '1', '6', '30123321', '5631', '2018-08-26', '2019-08-26', '41');
INSERT INTO `Poliza` VALUES ('129', '1', '9', '22222222', '4269', '2018-06-29', '2019-06-29', '49');
INSERT INTO `Poliza` VALUES ('130', '1', '7', '33333333', '6087', '2018-11-24', '2019-11-24', '59');
INSERT INTO `Poliza` VALUES ('131', '1', '3', '11111111', '7051', '2018-08-18', '2019-08-18', '52');
INSERT INTO `Poliza` VALUES ('132', '1', '5', '33333333', '5392', '2018-09-24', '2019-09-24', '28');
INSERT INTO `Poliza` VALUES ('133', '1', '5', '33333333', '7399', '2018-01-10', '2019-01-10', '63');
INSERT INTO `Poliza` VALUES ('134', '1', '3', '11111111', '9280', '2018-01-13', '2019-01-13', '44');
INSERT INTO `Poliza` VALUES ('135', '1', '4', '30123321', '7622', '2018-08-04', '2019-08-04', '51');
INSERT INTO `Poliza` VALUES ('136', '1', '9', '30123321', '5889', '2018-10-08', '2019-10-08', '44');
INSERT INTO `Poliza` VALUES ('137', '1', '6', '22222222', '2589', '2018-08-09', '2019-08-09', '69');
INSERT INTO `Poliza` VALUES ('138', '1', '8', '22222222', '9213', '2018-03-29', '2019-03-29', '64');
INSERT INTO `Poliza` VALUES ('139', '1', '2', '22222222', '7325', '2018-12-08', '2019-12-08', '68');
INSERT INTO `Poliza` VALUES ('140', '1', '6', '30123321', '9729', '2017-11-10', '2018-11-10', '50');
INSERT INTO `Poliza` VALUES ('141', '1', '6', '30123321', '7022', '2018-05-25', '2019-05-25', '16');
INSERT INTO `Poliza` VALUES ('142', '1', '2', '33333333', '3891', '2018-12-11', '2019-12-11', '44');
INSERT INTO `Poliza` VALUES ('143', '1', '4', '22222222', '5158', '2018-05-18', '2019-05-18', '40');
INSERT INTO `Poliza` VALUES ('144', '1', '5', '11111111', '4688', '2018-12-13', '2019-12-13', '23');
INSERT INTO `Poliza` VALUES ('145', '1', '6', '22222222', '1713', '2018-06-28', '2019-06-28', '10');
INSERT INTO `Poliza` VALUES ('146', '1', '9', '33333333', '1558', '2018-06-10', '2019-06-10', '58');
INSERT INTO `Poliza` VALUES ('147', '1', '8', '33333333', '9139', '2018-01-22', '2019-01-22', '12');
INSERT INTO `Poliza` VALUES ('148', '1', '9', '11111111', '2648', '2018-06-21', '2019-06-21', '12');
INSERT INTO `Poliza` VALUES ('149', '1', '8', '30123321', '7584', '2018-01-17', '2019-01-17', '27');
INSERT INTO `Poliza` VALUES ('150', '1', '3', '22222222', '230', '2018-07-05', '2019-07-05', '16');
INSERT INTO `Poliza` VALUES ('151', '1', '5', '22222222', '4422', '2018-11-27', '2019-11-27', '64');
INSERT INTO `Poliza` VALUES ('152', '1', '7', '22222222', '8049', '2018-10-13', '2019-10-13', '25');
INSERT INTO `Poliza` VALUES ('153', '1', '2', '11111111', '9158', '2018-10-02', '2019-10-02', '68');
INSERT INTO `Poliza` VALUES ('154', '1', '7', '11111111', '8674', '2018-12-28', '2019-12-28', '64');
INSERT INTO `Poliza` VALUES ('155', '1', '6', '33333333', '4118', '2018-07-09', '2019-07-09', '42');
INSERT INTO `Poliza` VALUES ('156', '1', '5', '30123321', '4247', '2018-02-02', '2019-02-02', '31');
INSERT INTO `Poliza` VALUES ('157', '1', '3', '11111111', '5687', '2018-09-03', '2019-09-03', '62');
INSERT INTO `Poliza` VALUES ('158', '1', '6', '22222222', '3246', '2018-12-15', '2019-12-15', '42');
INSERT INTO `Poliza` VALUES ('159', '1', '10', '22222222', '4122', '2018-08-01', '2019-08-01', '15');
INSERT INTO `Poliza` VALUES ('160', '1', '6', '11111111', '3421', '2018-09-13', '2019-09-13', '31');
INSERT INTO `Poliza` VALUES ('161', '1', '3', '11111111', '144', '2018-12-14', '2019-12-14', '31');
INSERT INTO `Poliza` VALUES ('162', '1', '8', '11111111', '4819', '2018-05-02', '2019-05-02', '25');
INSERT INTO `Poliza` VALUES ('163', '1', '10', '33333333', '9516', '2018-03-27', '2019-03-27', '63');
INSERT INTO `Poliza` VALUES ('164', '1', '5', '11111111', '8758', '2017-12-25', '2018-12-25', '56');
INSERT INTO `Poliza` VALUES ('165', '1', '8', '11111111', '2400', '2018-11-09', '2019-11-09', '27');
INSERT INTO `Poliza` VALUES ('166', '1', '1', '11111111', '6278', '2018-01-12', '2019-01-12', '26');
INSERT INTO `Poliza` VALUES ('167', '1', '10', '11111111', '8155', '2018-03-24', '2019-03-24', '42');
INSERT INTO `Poliza` VALUES ('168', '1', '2', '30123321', '773', '2019-01-09', '2020-01-09', '11');
INSERT INTO `Poliza` VALUES ('169', '1', '10', '22222222', '7004', '2018-08-28', '2019-08-28', '28');
INSERT INTO `Poliza` VALUES ('170', '1', '9', '22222222', '1867', '2017-11-26', '2018-11-26', '20');
INSERT INTO `Poliza` VALUES ('171', '1', '2', '33333333', '9299', '2019-01-08', '2020-01-08', '32');
INSERT INTO `Poliza` VALUES ('172', '1', '1', '22222222', '1516', '2019-01-03', '2020-01-03', '15');
INSERT INTO `Poliza` VALUES ('173', '1', '6', '22222222', '2770', '2018-09-06', '2019-09-06', '67');
INSERT INTO `Poliza` VALUES ('174', '1', '10', '30123321', '6186', '2018-03-10', '2019-03-10', '35');
INSERT INTO `Poliza` VALUES ('175', '1', '7', '30123321', '182', '2018-08-08', '2019-08-08', '14');
INSERT INTO `Poliza` VALUES ('176', '1', '9', '22222222', '400', '2018-11-30', '2019-11-30', '30');
INSERT INTO `Poliza` VALUES ('177', '1', '4', '33333333', '9442', '2017-11-17', '2018-11-17', '56');
INSERT INTO `Poliza` VALUES ('178', '1', '7', '22222222', '7352', '2018-01-01', '2019-01-01', '45');
INSERT INTO `Poliza` VALUES ('179', '1', '6', '11111111', '570', '2018-12-24', '2019-12-24', '61');
INSERT INTO `Poliza` VALUES ('180', '1', '8', '33333333', '9899', '2018-01-06', '2019-01-06', '58');
INSERT INTO `Poliza` VALUES ('181', '1', '8', '30123321', '8364', '2018-07-27', '2019-07-27', '22');
INSERT INTO `Poliza` VALUES ('182', '1', '5', '30123321', '811', '2018-04-01', '2019-04-01', '30');
INSERT INTO `Poliza` VALUES ('183', '1', '2', '33333333', '4507', '2018-12-14', '2019-12-14', '45');
INSERT INTO `Poliza` VALUES ('184', '1', '6', '22222222', '836', '2017-11-20', '2018-11-20', '50');
INSERT INTO `Poliza` VALUES ('185', '1', '7', '11111111', '6841', '2017-12-17', '2018-12-17', '36');
INSERT INTO `Poliza` VALUES ('186', '1', '1', '33333333', '4021', '2018-01-09', '2019-01-09', '26');
INSERT INTO `Poliza` VALUES ('187', '1', '8', '11111111', '2755', '2018-03-08', '2019-03-08', '29');
INSERT INTO `Poliza` VALUES ('188', '1', '9', '33333333', '3996', '2018-01-24', '2019-01-24', '65');
INSERT INTO `Poliza` VALUES ('189', '1', '6', '30123321', '3672', '2017-12-04', '2018-12-04', '40');
INSERT INTO `Poliza` VALUES ('190', '1', '10', '33333333', '200', '2018-12-25', '2019-12-25', '67');
INSERT INTO `Poliza` VALUES ('191', '1', '9', '30123321', '5572', '2018-02-13', '2019-02-13', '22');
INSERT INTO `Poliza` VALUES ('192', '1', '9', '33333333', '5819', '2018-05-01', '2019-05-01', '69');
INSERT INTO `Poliza` VALUES ('193', '1', '1', '33333333', '5953', '2018-06-09', '2019-06-09', '50');
INSERT INTO `Poliza` VALUES ('194', '1', '5', '33333333', '7915', '2018-06-17', '2019-06-17', '65');
INSERT INTO `Poliza` VALUES ('195', '1', '8', '33333333', '5423', '2018-02-24', '2019-02-24', '64');
INSERT INTO `Poliza` VALUES ('196', '1', '1', '22222222', '5916', '2018-02-03', '2019-02-03', '48');
INSERT INTO `Poliza` VALUES ('197', '1', '6', '33333333', '7596', '2017-12-21', '2018-12-21', '26');
INSERT INTO `Poliza` VALUES ('198', '1', '8', '22222222', '9238', '2018-11-06', '2019-11-06', '32');
INSERT INTO `Poliza` VALUES ('199', '1', '2', '30123321', '6148', '2018-01-10', '2019-01-10', '34');


INSERT INTO `Poliza_Vida` VALUES ('1', '5', '33333333', '97233');
INSERT INTO `Continente` VALUES ('1', '1', 'dir 1', 'desc 1');
INSERT INTO `Poliza_Hogar` VALUES ('2', '1', '27456');
INSERT INTO `Continente` VALUES ('2', '1', 'dir 2', 'desc 2');
INSERT INTO `Poliza_Hogar` VALUES ('3', '2', '18297');
INSERT INTO `Auto` VALUES ('7', '1', '9', '2016');
INSERT INTO `Poliza_Auto` VALUES ('4', '7', '3', '1050');
INSERT INTO `Auto` VALUES ('8', '3', '4', '2012');
INSERT INTO `Poliza_Auto` VALUES ('5', '8', '1', '33123');
INSERT INTO `Continente` VALUES ('3', '2', 'dir 3', 'desc 3');
INSERT INTO `Poliza_Hogar` VALUES ('6', '3', '90379');
INSERT INTO `Continente` VALUES ('4', '3', 'dir 4', 'desc 4');
INSERT INTO `Poliza_Hogar` VALUES ('7', '4', '60612');
INSERT INTO `Continente` VALUES ('5', '2', 'dir 5', 'desc 5');
INSERT INTO `Poliza_Hogar` VALUES ('8', '5', '33098');
INSERT INTO `Poliza_Vida` VALUES ('9', '4', '22222222', '55829');
INSERT INTO `Continente` VALUES ('6', '2', 'dir 6', 'desc 6');
INSERT INTO `Poliza_Hogar` VALUES ('10', '6', '18283');
INSERT INTO `Auto` VALUES ('9', '5', '5', '2011');
INSERT INTO `Poliza_Auto` VALUES ('11', '9', '1', '13986');
INSERT INTO `Auto` VALUES ('10', '1', '6', '2018');
INSERT INTO `Poliza_Auto` VALUES ('12', '10', '3', '32205');
INSERT INTO `Poliza_Vida` VALUES ('13', '1', '30123321', '94977');
INSERT INTO `Poliza_Vida` VALUES ('14', '6', '11111111', '60069');
INSERT INTO `Poliza_Vida` VALUES ('15', '4', '33333333', '40573');
INSERT INTO `Auto` VALUES ('11', '2', '4', '2012');
INSERT INTO `Poliza_Auto` VALUES ('16', '11', '1', '30748');
INSERT INTO `Poliza_Vida` VALUES ('17', '3', '30123321', '35222');
INSERT INTO `Continente` VALUES ('7', '1', 'dir 7', 'desc 7');
INSERT INTO `Poliza_Hogar` VALUES ('18', '7', '76395');
INSERT INTO `Continente` VALUES ('8', '4', 'dir 8', 'desc 8');
INSERT INTO `Poliza_Hogar` VALUES ('19', '8', '87150');
INSERT INTO `Poliza_Vida` VALUES ('20', '2', '11111111', '66438');
INSERT INTO `Auto` VALUES ('12', '5', '7', '2017');
INSERT INTO `Poliza_Auto` VALUES ('21', '12', '3', '9768');
INSERT INTO `Auto` VALUES ('13', '2', '4', '2012');
INSERT INTO `Poliza_Auto` VALUES ('22', '13', '2', '47716');
INSERT INTO `Poliza_Vida` VALUES ('23', '3', '22222222', '66764');
INSERT INTO `Auto` VALUES ('14', '5', '5', '2011');
INSERT INTO `Poliza_Auto` VALUES ('24', '14', '2', '10583');
INSERT INTO `Auto` VALUES ('15', '1', '9', '2016');
INSERT INTO `Poliza_Auto` VALUES ('25', '15', '2', '40369');
INSERT INTO `Poliza_Vida` VALUES ('26', '5', '22222222', '29203');
INSERT INTO `Poliza_Vida` VALUES ('27', '2', '22222222', '59723');
INSERT INTO `Auto` VALUES ('16', '1', '3', '2013');
INSERT INTO `Poliza_Auto` VALUES ('28', '16', '2', '24445');
INSERT INTO `Continente` VALUES ('9', '1', 'dir 9', 'desc 9');
INSERT INTO `Poliza_Hogar` VALUES ('29', '9', '15413');
INSERT INTO `Poliza_Vida` VALUES ('30', '2', '11111111', '70487');
INSERT INTO `Continente` VALUES ('10', '5', 'dir 10', 'desc 10');
INSERT INTO `Poliza_Hogar` VALUES ('31', '10', '22860');
INSERT INTO `Continente` VALUES ('11', '5', 'dir 11', 'desc 11');
INSERT INTO `Poliza_Hogar` VALUES ('32', '11', '67766');
INSERT INTO `Continente` VALUES ('12', '3', 'dir 12', 'desc 12');
INSERT INTO `Poliza_Hogar` VALUES ('33', '12', '73511');
INSERT INTO `Poliza_Vida` VALUES ('34', '4', '33333333', '22963');
INSERT INTO `Continente` VALUES ('13', '4', 'dir 13', 'desc 13');
INSERT INTO `Poliza_Hogar` VALUES ('35', '13', '69688');
INSERT INTO `Continente` VALUES ('14', '3', 'dir 14', 'desc 14');
INSERT INTO `Poliza_Hogar` VALUES ('36', '14', '26846');
INSERT INTO `Continente` VALUES ('15', '1', 'dir 15', 'desc 15');
INSERT INTO `Poliza_Hogar` VALUES ('37', '15', '90962');
INSERT INTO `Poliza_Vida` VALUES ('38', '2', '22222222', '35363');
INSERT INTO `Poliza_Vida` VALUES ('39', '6', '11111111', '19678');
INSERT INTO `Poliza_Vida` VALUES ('40', '5', '33333333', '22258');
INSERT INTO `Auto` VALUES ('17', '2', '3', '2013');
INSERT INTO `Poliza_Auto` VALUES ('41', '17', '1', '9032');
INSERT INTO `Auto` VALUES ('18', '5', '4', '2012');
INSERT INTO `Poliza_Auto` VALUES ('42', '18', '2', '29797');
INSERT INTO `Auto` VALUES ('19', '4', '1', '2010');
INSERT INTO `Poliza_Auto` VALUES ('43', '19', '3', '31597');
INSERT INTO `Auto` VALUES ('20', '3', '6', '2018');
INSERT INTO `Poliza_Auto` VALUES ('44', '20', '2', '27673');
INSERT INTO `Auto` VALUES ('21', '5', '1', '2010');
INSERT INTO `Poliza_Auto` VALUES ('45', '21', '1', '47831');
INSERT INTO `Poliza_Vida` VALUES ('46', '3', '11111111', '61638');
INSERT INTO `Poliza_Vida` VALUES ('47', '1', '30123321', '94339');
INSERT INTO `Continente` VALUES ('16', '3', 'dir 16', 'desc 16');
INSERT INTO `Poliza_Hogar` VALUES ('48', '16', '53414');
INSERT INTO `Auto` VALUES ('22', '5', '9', '2016');
INSERT INTO `Poliza_Auto` VALUES ('49', '22', '2', '27099');
INSERT INTO `Poliza_Vida` VALUES ('50', '2', '33333333', '83289');
INSERT INTO `Auto` VALUES ('23', '1', '2', '2011');
INSERT INTO `Poliza_Auto` VALUES ('51', '23', '1', '41282');
INSERT INTO `Continente` VALUES ('17', '4', 'dir 17', 'desc 17');
INSERT INTO `Poliza_Hogar` VALUES ('52', '17', '90311');
INSERT INTO `Continente` VALUES ('18', '5', 'dir 18', 'desc 18');
INSERT INTO `Poliza_Hogar` VALUES ('53', '18', '31621');
INSERT INTO `Poliza_Vida` VALUES ('54', '1', '30123321', '21527');
INSERT INTO `Poliza_Vida` VALUES ('55', '1', '33333333', '99106');
INSERT INTO `Poliza_Vida` VALUES ('56', '1', '11111111', '76111');
INSERT INTO `Auto` VALUES ('24', '5', '7', '2017');
INSERT INTO `Poliza_Auto` VALUES ('57', '24', '2', '8385');
INSERT INTO `Auto` VALUES ('25', '5', '3', '2013');
INSERT INTO `Poliza_Auto` VALUES ('58', '25', '3', '15706');
INSERT INTO `Poliza_Vida` VALUES ('59', '5', '30123321', '84005');
INSERT INTO `Continente` VALUES ('19', '4', 'dir 19', 'desc 19');
INSERT INTO `Poliza_Hogar` VALUES ('60', '19', '95756');
INSERT INTO `Auto` VALUES ('26', '5', '9', '2016');
INSERT INTO `Poliza_Auto` VALUES ('61', '26', '2', '28767');
INSERT INTO `Poliza_Vida` VALUES ('62', '3', '11111111', '93249');
INSERT INTO `Continente` VALUES ('20', '3', 'dir 20', 'desc 20');
INSERT INTO `Poliza_Hogar` VALUES ('63', '20', '43838');
INSERT INTO `Auto` VALUES ('27', '4', '4', '2012');
INSERT INTO `Poliza_Auto` VALUES ('64', '27', '1', '37297');
INSERT INTO `Poliza_Vida` VALUES ('65', '7', '11111111', '78164');
INSERT INTO `Continente` VALUES ('21', '3', 'dir 21', 'desc 21');
INSERT INTO `Poliza_Hogar` VALUES ('66', '21', '70940');
INSERT INTO `Auto` VALUES ('28', '3', '8', '2015');
INSERT INTO `Poliza_Auto` VALUES ('67', '28', '1', '35544');
INSERT INTO `Continente` VALUES ('22', '3', 'dir 22', 'desc 22');
INSERT INTO `Poliza_Hogar` VALUES ('68', '22', '31868');
INSERT INTO `Continente` VALUES ('23', '3', 'dir 23', 'desc 23');
INSERT INTO `Poliza_Hogar` VALUES ('69', '23', '34196');
INSERT INTO `Continente` VALUES ('24', '5', 'dir 24', 'desc 24');
INSERT INTO `Poliza_Hogar` VALUES ('70', '24', '23343');
INSERT INTO `Continente` VALUES ('25', '5', 'dir 25', 'desc 25');
INSERT INTO `Poliza_Hogar` VALUES ('71', '25', '20332');
INSERT INTO `Poliza_Vida` VALUES ('72', '4', '30123321', '43171');
INSERT INTO `Continente` VALUES ('26', '1', 'dir 26', 'desc 26');
INSERT INTO `Poliza_Hogar` VALUES ('73', '26', '16777');
INSERT INTO `Auto` VALUES ('29', '4', '2', '2011');
INSERT INTO `Poliza_Auto` VALUES ('74', '29', '2', '49465');
INSERT INTO `Continente` VALUES ('27', '5', 'dir 27', 'desc 27');
INSERT INTO `Poliza_Hogar` VALUES ('75', '27', '63863');
INSERT INTO `Poliza_Vida` VALUES ('76', '2', '11111111', '31735');
INSERT INTO `Poliza_Vida` VALUES ('77', '3', '11111111', '72278');
INSERT INTO `Poliza_Vida` VALUES ('78', '3', '22222222', '45119');
INSERT INTO `Continente` VALUES ('28', '4', 'dir 28', 'desc 28');
INSERT INTO `Poliza_Hogar` VALUES ('79', '28', '20537');
INSERT INTO `Auto` VALUES ('30', '5', '8', '2015');
INSERT INTO `Poliza_Auto` VALUES ('80', '30', '3', '1835');
INSERT INTO `Poliza_Vida` VALUES ('81', '3', '30123321', '34751');
INSERT INTO `Poliza_Vida` VALUES ('82', '2', '22222222', '68227');
INSERT INTO `Auto` VALUES ('31', '4', '6', '2018');
INSERT INTO `Poliza_Auto` VALUES ('83', '31', '1', '27033');
INSERT INTO `Continente` VALUES ('29', '3', 'dir 29', 'desc 29');
INSERT INTO `Poliza_Hogar` VALUES ('84', '29', '67505');
INSERT INTO `Poliza_Vida` VALUES ('85', '1', '33333333', '96986');
INSERT INTO `Poliza_Vida` VALUES ('86', '7', '33333333', '43574');
INSERT INTO `Poliza_Vida` VALUES ('87', '4', '11111111', '18043');
INSERT INTO `Auto` VALUES ('32', '1', '9', '2016');
INSERT INTO `Poliza_Auto` VALUES ('88', '32', '1', '41171');
INSERT INTO `Poliza_Vida` VALUES ('89', '5', '33333333', '20124');
INSERT INTO `Continente` VALUES ('30', '3', 'dir 30', 'desc 30');
INSERT INTO `Poliza_Hogar` VALUES ('90', '30', '18898');
INSERT INTO `Poliza_Vida` VALUES ('91', '5', '30123321', '90833');
INSERT INTO `Auto` VALUES ('33', '2', '4', '2012');
INSERT INTO `Poliza_Auto` VALUES ('92', '33', '2', '24019');
INSERT INTO `Auto` VALUES ('34', '1', '8', '2015');
INSERT INTO `Poliza_Auto` VALUES ('93', '34', '1', '13221');
INSERT INTO `Poliza_Vida` VALUES ('94', '2', '22222222', '61968');
INSERT INTO `Poliza_Vida` VALUES ('95', '4', '22222222', '50359');
INSERT INTO `Poliza_Vida` VALUES ('96', '3', '30123321', '35416');
INSERT INTO `Auto` VALUES ('35', '5', '1', '2010');
INSERT INTO `Poliza_Auto` VALUES ('97', '35', '1', '35021');
INSERT INTO `Poliza_Vida` VALUES ('98', '3', '11111111', '58861');
INSERT INTO `Poliza_Vida` VALUES ('99', '6', '22222222', '77133');
INSERT INTO `Auto` VALUES ('36', '4', '1', '2010');
INSERT INTO `Poliza_Auto` VALUES ('100', '36', '1', '9092');
INSERT INTO `Continente` VALUES ('31', '3', 'dir 31', 'desc 31');
INSERT INTO `Poliza_Hogar` VALUES ('101', '31', '43825');
INSERT INTO `Continente` VALUES ('32', '5', 'dir 32', 'desc 32');
INSERT INTO `Poliza_Hogar` VALUES ('102', '32', '93380');
INSERT INTO `Poliza_Vida` VALUES ('103', '6', '30123321', '83418');
INSERT INTO `Continente` VALUES ('33', '4', 'dir 33', 'desc 33');
INSERT INTO `Poliza_Hogar` VALUES ('104', '33', '17913');
INSERT INTO `Continente` VALUES ('34', '5', 'dir 34', 'desc 34');
INSERT INTO `Poliza_Hogar` VALUES ('105', '34', '44547');
INSERT INTO `Poliza_Vida` VALUES ('106', '7', '22222222', '50664');
INSERT INTO `Continente` VALUES ('35', '2', 'dir 35', 'desc 35');
INSERT INTO `Poliza_Hogar` VALUES ('107', '35', '88065');
INSERT INTO `Auto` VALUES ('37', '3', '6', '2018');
INSERT INTO `Poliza_Auto` VALUES ('108', '37', '1', '49705');
INSERT INTO `Poliza_Vida` VALUES ('109', '2', '30123321', '67886');
INSERT INTO `Auto` VALUES ('38', '1', '5', '2011');
INSERT INTO `Poliza_Auto` VALUES ('110', '38', '3', '24231');
INSERT INTO `Auto` VALUES ('39', '5', '9', '2016');
INSERT INTO `Poliza_Auto` VALUES ('111', '39', '1', '5936');
INSERT INTO `Continente` VALUES ('36', '1', 'dir 36', 'desc 36');
INSERT INTO `Poliza_Hogar` VALUES ('112', '36', '38249');
INSERT INTO `Continente` VALUES ('37', '4', 'dir 37', 'desc 37');
INSERT INTO `Poliza_Hogar` VALUES ('113', '37', '90346');
INSERT INTO `Continente` VALUES ('38', '2', 'dir 38', 'desc 38');
INSERT INTO `Poliza_Hogar` VALUES ('114', '38', '51420');
INSERT INTO `Auto` VALUES ('40', '1', '4', '2012');
INSERT INTO `Poliza_Auto` VALUES ('115', '40', '2', '1686');
INSERT INTO `Continente` VALUES ('39', '4', 'dir 39', 'desc 39');
INSERT INTO `Poliza_Hogar` VALUES ('116', '39', '74333');
INSERT INTO `Auto` VALUES ('41', '2', '9', '2016');
INSERT INTO `Poliza_Auto` VALUES ('117', '41', '3', '13808');
INSERT INTO `Poliza_Vida` VALUES ('118', '5', '11111111', '38933');
INSERT INTO `Auto` VALUES ('42', '5', '8', '2015');
INSERT INTO `Poliza_Auto` VALUES ('119', '42', '3', '25212');
INSERT INTO `Poliza_Vida` VALUES ('120', '2', '22222222', '15347');
INSERT INTO `Auto` VALUES ('43', '4', '3', '2013');
INSERT INTO `Poliza_Auto` VALUES ('121', '43', '1', '29097');
INSERT INTO `Auto` VALUES ('44', '4', '5', '2011');
INSERT INTO `Poliza_Auto` VALUES ('122', '44', '2', '46069');
INSERT INTO `Auto` VALUES ('45', '5', '8', '2015');
INSERT INTO `Poliza_Auto` VALUES ('123', '45', '3', '1555');
INSERT INTO `Poliza_Vida` VALUES ('124', '5', '33333333', '69930');
INSERT INTO `Continente` VALUES ('40', '4', 'dir 40', 'desc 40');
INSERT INTO `Poliza_Hogar` VALUES ('125', '40', '94880');
INSERT INTO `Poliza_Vida` VALUES ('126', '2', '30123321', '77597');
INSERT INTO `Auto` VALUES ('46', '4', '2', '2011');
INSERT INTO `Poliza_Auto` VALUES ('127', '46', '3', '23631');
INSERT INTO `Auto` VALUES ('47', '1', '1', '2010');
INSERT INTO `Poliza_Auto` VALUES ('128', '47', '3', '2983');
INSERT INTO `Poliza_Vida` VALUES ('129', '6', '22222222', '98127');
INSERT INTO `Continente` VALUES ('41', '1', 'dir 41', 'desc 41');
INSERT INTO `Poliza_Hogar` VALUES ('130', '41', '42713');
INSERT INTO `Continente` VALUES ('42', '2', 'dir 42', 'desc 42');
INSERT INTO `Poliza_Hogar` VALUES ('131', '42', '81796');
INSERT INTO `Auto` VALUES ('48', '5', '9', '2016');
INSERT INTO `Poliza_Auto` VALUES ('132', '48', '1', '16419');
INSERT INTO `Poliza_Vida` VALUES ('133', '4', '22222222', '23244');
INSERT INTO `Poliza_Vida` VALUES ('134', '5', '33333333', '89230');
INSERT INTO `Continente` VALUES ('43', '4', 'dir 43', 'desc 43');
INSERT INTO `Poliza_Hogar` VALUES ('135', '43', '73429');
INSERT INTO `Auto` VALUES ('49', '1', '6', '2018');
INSERT INTO `Poliza_Auto` VALUES ('136', '49', '1', '10108');
INSERT INTO `Auto` VALUES ('50', '4', '7', '2017');
INSERT INTO `Poliza_Auto` VALUES ('137', '50', '2', '22134');
INSERT INTO `Continente` VALUES ('44', '5', 'dir 44', 'desc 44');
INSERT INTO `Poliza_Hogar` VALUES ('138', '44', '45890');
INSERT INTO `Continente` VALUES ('45', '5', 'dir 45', 'desc 45');
INSERT INTO `Poliza_Hogar` VALUES ('139', '45', '12437');
INSERT INTO `Poliza_Vida` VALUES ('140', '6', '11111111', '89550');
INSERT INTO `Continente` VALUES ('46', '1', 'dir 46', 'desc 46');
INSERT INTO `Poliza_Hogar` VALUES ('141', '46', '46830');
INSERT INTO `Poliza_Vida` VALUES ('142', '2', '33333333', '60478');
INSERT INTO `Continente` VALUES ('47', '2', 'dir 47', 'desc 47');
INSERT INTO `Poliza_Hogar` VALUES ('143', '47', '79752');
INSERT INTO `Poliza_Vida` VALUES ('144', '2', '22222222', '14761');
INSERT INTO `Continente` VALUES ('48', '1', 'dir 48', 'desc 48');
INSERT INTO `Poliza_Hogar` VALUES ('145', '48', '23873');
INSERT INTO `Auto` VALUES ('51', '2', '8', '2015');
INSERT INTO `Poliza_Auto` VALUES ('146', '51', '2', '4954');
INSERT INTO `Continente` VALUES ('49', '2', 'dir 49', 'desc 49');
INSERT INTO `Poliza_Hogar` VALUES ('147', '49', '80276');
INSERT INTO `Continente` VALUES ('50', '3', 'dir 50', 'desc 50');
INSERT INTO `Poliza_Hogar` VALUES ('148', '50', '96747');
INSERT INTO `Continente` VALUES ('51', '5', 'dir 51', 'desc 51');
INSERT INTO `Poliza_Hogar` VALUES ('149', '51', '14499');
INSERT INTO `Auto` VALUES ('52', '5', '4', '2012');
INSERT INTO `Poliza_Auto` VALUES ('150', '52', '2', '12756');
INSERT INTO `Poliza_Vida` VALUES ('151', '3', '11111111', '29376');
INSERT INTO `Auto` VALUES ('53', '5', '7', '2017');
INSERT INTO `Poliza_Auto` VALUES ('152', '53', '1', '31198');
INSERT INTO `Auto` VALUES ('54', '5', '4', '2012');
INSERT INTO `Poliza_Auto` VALUES ('153', '54', '3', '14634');
INSERT INTO `Auto` VALUES ('55', '4', '7', '2017');
INSERT INTO `Poliza_Auto` VALUES ('154', '55', '3', '10119');
INSERT INTO `Poliza_Vida` VALUES ('155', '5', '30123321', '85655');
INSERT INTO `Poliza_Vida` VALUES ('156', '3', '22222222', '68335');
INSERT INTO `Continente` VALUES ('52', '2', 'dir 52', 'desc 52');
INSERT INTO `Poliza_Hogar` VALUES ('157', '52', '92537');
INSERT INTO `Continente` VALUES ('53', '4', 'dir 53', 'desc 53');
INSERT INTO `Poliza_Hogar` VALUES ('158', '53', '74759');
INSERT INTO `Poliza_Vida` VALUES ('159', '7', '33333333', '53042');
INSERT INTO `Continente` VALUES ('54', '1', 'dir 54', 'desc 54');
INSERT INTO `Poliza_Hogar` VALUES ('160', '54', '39855');
INSERT INTO `Poliza_Vida` VALUES ('161', '3', '22222222', '26893');
INSERT INTO `Auto` VALUES ('56', '3', '2', '2011');
INSERT INTO `Poliza_Auto` VALUES ('162', '56', '2', '21423');
INSERT INTO `Continente` VALUES ('55', '5', 'dir 55', 'desc 55');
INSERT INTO `Poliza_Hogar` VALUES ('163', '55', '59384');
INSERT INTO `Auto` VALUES ('57', '1', '6', '2018');
INSERT INTO `Poliza_Auto` VALUES ('164', '57', '2', '27272');
INSERT INTO `Continente` VALUES ('56', '2', 'dir 56', 'desc 56');
INSERT INTO `Poliza_Hogar` VALUES ('165', '56', '99417');
INSERT INTO `Continente` VALUES ('57', '5', 'dir 57', 'desc 57');
INSERT INTO `Poliza_Hogar` VALUES ('166', '57', '78319');
INSERT INTO `Poliza_Vida` VALUES ('167', '4', '22222222', '27570');
INSERT INTO `Auto` VALUES ('58', '4', '9', '2016');
INSERT INTO `Poliza_Auto` VALUES ('168', '58', '3', '9570');
INSERT INTO `Auto` VALUES ('59', '5', '8', '2015');
INSERT INTO `Poliza_Auto` VALUES ('169', '59', '2', '47540');
INSERT INTO `Continente` VALUES ('58', '3', 'dir 58', 'desc 58');
INSERT INTO `Poliza_Hogar` VALUES ('170', '58', '93763');
INSERT INTO `Poliza_Vida` VALUES ('171', '5', '30123321', '67842');
INSERT INTO `Auto` VALUES ('60', '5', '3', '2013');
INSERT INTO `Poliza_Auto` VALUES ('172', '60', '1', '39204');
INSERT INTO `Auto` VALUES ('61', '1', '4', '2012');
INSERT INTO `Poliza_Auto` VALUES ('173', '61', '1', '19721');
INSERT INTO `Poliza_Vida` VALUES ('174', '3', '11111111', '16265');
INSERT INTO `Continente` VALUES ('59', '4', 'dir 59', 'desc 59');
INSERT INTO `Poliza_Hogar` VALUES ('175', '59', '21112');
INSERT INTO `Auto` VALUES ('62', '5', '2', '2011');
INSERT INTO `Poliza_Auto` VALUES ('176', '62', '1', '34234');
INSERT INTO `Auto` VALUES ('63', '4', '2', '2011');
INSERT INTO `Poliza_Auto` VALUES ('177', '63', '3', '18644');
INSERT INTO `Poliza_Vida` VALUES ('178', '6', '30123321', '36573');
INSERT INTO `Auto` VALUES ('64', '5', '3', '2013');
INSERT INTO `Poliza_Auto` VALUES ('179', '64', '3', '7538');
INSERT INTO `Poliza_Vida` VALUES ('180', '4', '33333333', '42044');
INSERT INTO `Auto` VALUES ('65', '3', '9', '2016');
INSERT INTO `Poliza_Auto` VALUES ('181', '65', '1', '24312');
INSERT INTO `Continente` VALUES ('60', '5', 'dir 60', 'desc 60');
INSERT INTO `Poliza_Hogar` VALUES ('182', '60', '36017');
INSERT INTO `Continente` VALUES ('61', '2', 'dir 61', 'desc 61');
INSERT INTO `Poliza_Hogar` VALUES ('183', '61', '61048');
INSERT INTO `Poliza_Vida` VALUES ('184', '6', '30123321', '15198');
INSERT INTO `Auto` VALUES ('66', '4', '8', '2015');
INSERT INTO `Poliza_Auto` VALUES ('185', '66', '1', '46691');
INSERT INTO `Continente` VALUES ('62', '4', 'dir 62', 'desc 62');
INSERT INTO `Poliza_Hogar` VALUES ('186', '62', '30548');
INSERT INTO `Auto` VALUES ('67', '4', '2', '2011');
INSERT INTO `Poliza_Auto` VALUES ('187', '67', '2', '15386');
INSERT INTO `Auto` VALUES ('68', '3', '2', '2011');
INSERT INTO `Poliza_Auto` VALUES ('188', '68', '1', '21194');
INSERT INTO `Continente` VALUES ('63', '5', 'dir 63', 'desc 63');
INSERT INTO `Poliza_Hogar` VALUES ('189', '63', '60108');
INSERT INTO `Poliza_Vida` VALUES ('190', '6', '22222222', '92870');
INSERT INTO `Continente` VALUES ('64', '4', 'dir 64', 'desc 64');
INSERT INTO `Poliza_Hogar` VALUES ('191', '64', '52622');
INSERT INTO `Auto` VALUES ('69', '3', '9', '2016');
INSERT INTO `Poliza_Auto` VALUES ('192', '69', '3', '26989');
INSERT INTO `Auto` VALUES ('70', '4', '6', '2018');
INSERT INTO `Poliza_Auto` VALUES ('193', '70', '2', '24090');
INSERT INTO `Continente` VALUES ('65', '1', 'dir 65', 'desc 65');
INSERT INTO `Poliza_Hogar` VALUES ('194', '65', '28984');
INSERT INTO `Poliza_Vida` VALUES ('195', '6', '22222222', '10973');
INSERT INTO `Auto` VALUES ('71', '3', '5', '2011');
INSERT INTO `Poliza_Auto` VALUES ('196', '71', '2', '10697');
INSERT INTO `Auto` VALUES ('72', '1', '6', '2018');
INSERT INTO `Poliza_Auto` VALUES ('197', '72', '1', '29618');
INSERT INTO `Poliza_Vida` VALUES ('198', '3', '30123321', '67090');
INSERT INTO `Poliza_Vida` VALUES ('199', '3', '11111111', '50142');