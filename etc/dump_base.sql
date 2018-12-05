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


INSERT INTO `Poliza` VALUES (NULL, '1', '9', '33333333', '8176', '2018-09-12', '2019-09-12', '50');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '5', '30123321', '98360');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '11111111', '6368', '2018-05-17', '2019-05-17', '61');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '4', '33333333', '43733');
INSERT INTO `Auto` VALUES ('7', '1', '1', '2010');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '33333333', '377', '2018-10-19', '2019-10-19', '49');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '7', '3', '24990');
INSERT INTO `Continente` VALUES ('1', '3', 'dir 1', 'desc 1');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '11111111', '6302', '2018-11-09', '2019-11-09', '43');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '1', '71523');
INSERT INTO `Continente` VALUES ('2', '5', 'dir 2', 'desc 2');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '22222222', '9404', '2018-11-27', '2019-11-27', '13');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '2', '45498');
INSERT INTO `Auto` VALUES ('8', '2', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '1777', '2018-08-30', '2019-08-30', '13');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '8', '2', '43316');
INSERT INTO `Continente` VALUES ('3', '2', 'dir 3', 'desc 3');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '22222222', '1117', '2017-12-04', '2018-12-04', '69');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '3', '81797');
INSERT INTO `Auto` VALUES ('9', '4', '4', '2012');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '22222222', '7554', '2017-12-18', '2018-12-18', '33');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '9', '1', '31253');
INSERT INTO `Auto` VALUES ('10', '2', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '11111111', '4030', '2018-10-13', '2019-10-13', '23');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '10', '3', '1226');
INSERT INTO `Continente` VALUES ('4', '5', 'dir 4', 'desc 4');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '22222222', '8740', '2018-09-26', '2019-09-26', '58');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '4', '57109');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '30123321', '7352', '2017-12-09', '2018-12-09', '67');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '30123321', '50063');
INSERT INTO `Auto` VALUES ('11', '1', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '11111111', '3659', '2018-01-19', '2019-01-19', '50');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '11', '1', '6874');
INSERT INTO `Continente` VALUES ('5', '4', 'dir 5', 'desc 5');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '11111111', '5400', '2018-08-04', '2019-08-04', '58');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '5', '55289');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '22222222', '6690', '2018-10-25', '2019-10-25', '17');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '5', '11111111', '34352');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '11111111', '200', '2018-10-06', '2019-10-06', '12');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '4', '33333333', '30087');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '30123321', '7503', '2018-09-16', '2019-09-16', '24');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '30123321', '40757');
INSERT INTO `Continente` VALUES ('6', '4', 'dir 6', 'desc 6');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '30123321', '527', '2018-02-18', '2019-02-18', '67');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '6', '96577');
INSERT INTO `Continente` VALUES ('7', '2', 'dir 7', 'desc 7');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '30123321', '2064', '2018-11-28', '2019-11-28', '30');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '7', '24888');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '22222222', '7423', '2018-04-02', '2019-04-02', '18');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '22222222', '53254');
INSERT INTO `Auto` VALUES ('12', '2', '4', '2012');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '11111111', '4922', '2018-11-06', '2019-11-06', '51');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '12', '3', '193');
INSERT INTO `Continente` VALUES ('8', '1', 'dir 8', 'desc 8');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '30123321', '4473', '2018-07-03', '2019-07-03', '45');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '8', '61999');
INSERT INTO `Auto` VALUES ('13', '2', '5', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '22222222', '455', '2017-12-23', '2018-12-23', '19');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '13', '2', '20875');
INSERT INTO `Auto` VALUES ('14', '2', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '11111111', '8966', '2018-01-28', '2019-01-28', '59');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '14', '1', '15815');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '30123321', '191', '2017-11-08', '2018-11-08', '46');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '4', '30123321', '20438');
INSERT INTO `Auto` VALUES ('15', '5', '2', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '30123321', '937', '2018-01-26', '2019-01-26', '21');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '15', '3', '15274');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '33333333', '4825', '2018-08-16', '2019-08-16', '42');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '30123321', '27252');
INSERT INTO `Auto` VALUES ('16', '1', '7', '2017');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '22222222', '9667', '2018-09-22', '2019-09-22', '44');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '16', '1', '14578');
INSERT INTO `Continente` VALUES ('9', '1', 'dir 9', 'desc 9');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '22222222', '3841', '2018-12-02', '2019-12-02', '51');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '9', '18476');
INSERT INTO `Continente` VALUES ('10', '4', 'dir 10', 'desc 10');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '11111111', '7774', '2018-09-25', '2019-09-25', '19');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '10', '92196');
INSERT INTO `Auto` VALUES ('17', '3', '1', '2010');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '30123321', '1160', '2018-01-01', '2019-01-01', '45');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '17', '3', '7455');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '30123321', '3784', '2018-03-24', '2019-03-24', '53');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '30123321', '57842');
INSERT INTO `Auto` VALUES ('18', '4', '5', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '22222222', '5026', '2018-05-08', '2019-05-08', '12');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '18', '1', '24140');
INSERT INTO `Auto` VALUES ('19', '5', '2', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '33333333', '4655', '2018-12-06', '2019-12-06', '55');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '19', '3', '5844');
INSERT INTO `Continente` VALUES ('11', '1', 'dir 11', 'desc 11');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '30123321', '9133', '2018-03-21', '2019-03-21', '51');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '11', '17001');
INSERT INTO `Auto` VALUES ('20', '2', '2', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '11111111', '1908', '2017-12-04', '2018-12-04', '60');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '20', '2', '46537');
INSERT INTO `Continente` VALUES ('12', '3', 'dir 12', 'desc 12');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '33333333', '4111', '2018-12-31', '2019-12-31', '42');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '12', '48378');
INSERT INTO `Continente` VALUES ('13', '4', 'dir 13', 'desc 13');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '33333333', '3473', '2018-01-27', '2019-01-27', '24');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '13', '57998');
INSERT INTO `Auto` VALUES ('21', '3', '2', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '4776', '2018-05-23', '2019-05-23', '64');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '21', '3', '11324');
INSERT INTO `Auto` VALUES ('22', '3', '5', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '11111111', '7074', '2018-06-19', '2019-06-19', '43');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '22', '3', '37088');
INSERT INTO `Continente` VALUES ('14', '3', 'dir 14', 'desc 14');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '33333333', '7276', '2017-11-26', '2018-11-26', '32');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '14', '35834');
INSERT INTO `Continente` VALUES ('15', '4', 'dir 15', 'desc 15');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '9377', '2019-01-10', '2020-01-10', '48');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '15', '62304');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '30123321', '4082', '2018-08-17', '2019-08-17', '28');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '1', '11111111', '53154');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '11111111', '3072', '2019-01-01', '2020-01-01', '29');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '4', '33333333', '98009');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '22222222', '4028', '2018-11-30', '2019-11-30', '21');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '7', '33333333', '27441');
INSERT INTO `Continente` VALUES ('16', '2', 'dir 16', 'desc 16');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '30123321', '8010', '2018-06-05', '2019-06-05', '29');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '16', '14490');
INSERT INTO `Continente` VALUES ('17', '1', 'dir 17', 'desc 17');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '11111111', '3508', '2018-06-13', '2019-06-13', '39');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '17', '25656');
INSERT INTO `Continente` VALUES ('18', '1', 'dir 18', 'desc 18');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '33333333', '230', '2018-12-22', '2019-12-22', '43');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '18', '54859');
INSERT INTO `Continente` VALUES ('19', '1', 'dir 19', 'desc 19');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '30123321', '4082', '2018-11-25', '2019-11-25', '48');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '19', '14222');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '22222222', '7922', '2018-04-06', '2019-04-06', '47');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '6', '22222222', '61190');
INSERT INTO `Auto` VALUES ('23', '2', '4', '2012');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '22222222', '5987', '2018-06-08', '2019-06-08', '43');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '23', '3', '21014');
INSERT INTO `Continente` VALUES ('20', '5', 'dir 20', 'desc 20');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '30123321', '1747', '2018-03-29', '2019-03-29', '62');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '20', '51818');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '30123321', '9909', '2018-05-21', '2019-05-21', '20');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '30123321', '12831');
INSERT INTO `Auto` VALUES ('24', '1', '5', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '30123321', '2720', '2018-10-29', '2019-10-29', '65');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '24', '1', '6373');
INSERT INTO `Continente` VALUES ('21', '1', 'dir 21', 'desc 21');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '33333333', '2522', '2019-01-02', '2020-01-02', '21');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '21', '68371');
INSERT INTO `Auto` VALUES ('25', '4', '9', '2016');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '11111111', '6813', '2018-05-10', '2019-05-10', '42');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '25', '2', '20249');
INSERT INTO `Auto` VALUES ('26', '1', '2', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '30123321', '8408', '2018-03-20', '2019-03-20', '46');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '26', '3', '11047');
INSERT INTO `Continente` VALUES ('22', '3', 'dir 22', 'desc 22');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '33333333', '5640', '2018-03-19', '2019-03-19', '54');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '22', '74367');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '33333333', '2763', '2018-06-30', '2019-06-30', '69');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '4', '22222222', '60971');
INSERT INTO `Auto` VALUES ('27', '5', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '33333333', '7592', '2018-10-13', '2019-10-13', '49');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '27', '2', '23487');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '30123321', '3565', '2018-06-24', '2019-06-24', '12');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '33333333', '17978');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '11111111', '6473', '2018-09-09', '2019-09-09', '13');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '7', '22222222', '16552');
INSERT INTO `Auto` VALUES ('28', '4', '2', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '22222222', '6154', '2018-08-25', '2019-08-25', '61');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '28', '1', '43837');
INSERT INTO `Auto` VALUES ('29', '2', '1', '2010');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '33333333', '9920', '2018-04-14', '2019-04-14', '68');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '29', '3', '9046');
INSERT INTO `Continente` VALUES ('23', '5', 'dir 23', 'desc 23');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '33333333', '5062', '2018-01-27', '2019-01-27', '55');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '23', '76570');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '33333333', '9309', '2018-01-28', '2019-01-28', '14');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '7', '22222222', '55031');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '22222222', '2339', '2017-12-20', '2018-12-20', '26');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '6', '22222222', '64571');
INSERT INTO `Auto` VALUES ('30', '5', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '2563', '2018-06-22', '2019-06-22', '25');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '30', '3', '42771');
INSERT INTO `Continente` VALUES ('24', '5', 'dir 24', 'desc 24');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '22222222', '1249', '2018-07-09', '2019-07-09', '17');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '24', '83018');
INSERT INTO `Auto` VALUES ('31', '4', '4', '2012');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '11111111', '5902', '2019-01-09', '2020-01-09', '61');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '31', '2', '1671');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '7711', '2019-01-04', '2020-01-04', '24');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '30123321', '56169');
INSERT INTO `Continente` VALUES ('25', '5', 'dir 25', 'desc 25');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '22222222', '2180', '2018-07-27', '2019-07-27', '47');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '25', '66585');
INSERT INTO `Auto` VALUES ('32', '4', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '30123321', '8238', '2019-01-08', '2020-01-08', '16');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '32', '3', '39956');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '22222222', '5530', '2018-02-22', '2019-02-22', '11');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '30123321', '22322');
INSERT INTO `Continente` VALUES ('26', '5', 'dir 26', 'desc 26');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '22222222', '1829', '2018-02-04', '2019-02-04', '65');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '26', '71454');
INSERT INTO `Auto` VALUES ('33', '1', '7', '2017');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '30123321', '4525', '2018-03-02', '2019-03-02', '28');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '33', '1', '24589');
INSERT INTO `Continente` VALUES ('27', '3', 'dir 27', 'desc 27');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '22222222', '4069', '2018-06-15', '2019-06-15', '19');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '27', '65935');
INSERT INTO `Auto` VALUES ('34', '5', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '22222222', '8717', '2018-06-24', '2019-06-24', '12');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '34', '1', '20193');
INSERT INTO `Continente` VALUES ('28', '2', 'dir 28', 'desc 28');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '30123321', '4357', '2018-06-16', '2019-06-16', '67');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '28', '37438');
INSERT INTO `Auto` VALUES ('35', '5', '5', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '11111111', '9623', '2019-01-07', '2020-01-07', '11');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '35', '2', '14257');
INSERT INTO `Auto` VALUES ('36', '2', '1', '2010');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '30123321', '6151', '2018-03-12', '2019-03-12', '65');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '36', '2', '47863');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '22222222', '7450', '2018-02-05', '2019-02-05', '42');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '22222222', '48619');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '33333333', '8935', '2018-03-01', '2019-03-01', '16');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '1', '22222222', '95958');
INSERT INTO `Auto` VALUES ('37', '2', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '30123321', '8769', '2018-03-08', '2019-03-08', '41');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '37', '2', '48494');
INSERT INTO `Continente` VALUES ('29', '1', 'dir 29', 'desc 29');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '30123321', '8397', '2018-09-17', '2019-09-17', '27');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '29', '76781');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '33333333', '570', '2018-04-08', '2019-04-08', '48');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '4', '30123321', '71786');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '33333333', '572', '2018-07-05', '2019-07-05', '33');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '5', '11111111', '90312');
INSERT INTO `Auto` VALUES ('38', '4', '1', '2010');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '11111111', '6041', '2018-03-14', '2019-03-14', '45');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '38', '3', '11007');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '33333333', '5093', '2018-08-04', '2019-08-04', '67');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '1', '22222222', '75213');
INSERT INTO `Continente` VALUES ('30', '5', 'dir 30', 'desc 30');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '22222222', '4974', '2018-08-20', '2019-08-20', '37');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '30', '59215');
INSERT INTO `Auto` VALUES ('39', '2', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '22222222', '2390', '2018-07-15', '2019-07-15', '53');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '39', '3', '4301');
INSERT INTO `Continente` VALUES ('31', '4', 'dir 31', 'desc 31');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '33333333', '6747', '2018-04-12', '2019-04-12', '15');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '31', '85849');
INSERT INTO `Continente` VALUES ('32', '5', 'dir 32', 'desc 32');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '2217', '2018-03-25', '2019-03-25', '53');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '32', '84249');
INSERT INTO `Continente` VALUES ('33', '5', 'dir 33', 'desc 33');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '30123321', '6714', '2018-01-03', '2019-01-03', '29');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '33', '12904');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '33333333', '1839', '2018-02-24', '2019-02-24', '69');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '5', '33333333', '97883');
INSERT INTO `Auto` VALUES ('40', '1', '9', '2016');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '22222222', '2391', '2018-08-28', '2019-08-28', '16');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '40', '2', '9979');
INSERT INTO `Continente` VALUES ('34', '4', 'dir 34', 'desc 34');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '11111111', '1469', '2018-07-28', '2019-07-28', '27');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '34', '34135');
INSERT INTO `Auto` VALUES ('41', '4', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '22222222', '211', '2018-12-19', '2019-12-19', '61');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '41', '3', '33152');
INSERT INTO `Continente` VALUES ('35', '2', 'dir 35', 'desc 35');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '11111111', '2376', '2018-12-31', '2019-12-31', '58');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '35', '73335');
INSERT INTO `Auto` VALUES ('42', '1', '9', '2016');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '22222222', '4788', '2018-04-11', '2019-04-11', '22');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '42', '2', '18907');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '33333333', '1081', '2018-11-06', '2019-11-06', '17');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '5', '33333333', '31177');
INSERT INTO `Continente` VALUES ('36', '4', 'dir 36', 'desc 36');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '30123321', '4030', '2018-12-19', '2019-12-19', '70');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '36', '71927');
INSERT INTO `Continente` VALUES ('37', '5', 'dir 37', 'desc 37');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '33333333', '2512', '2018-05-08', '2019-05-08', '27');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '37', '94190');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '22222222', '9128', '2019-01-09', '2020-01-09', '46');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '30123321', '77963');
INSERT INTO `Auto` VALUES ('43', '2', '2', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '33333333', '8920', '2018-01-21', '2019-01-21', '30');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '43', '1', '16950');
INSERT INTO `Auto` VALUES ('44', '3', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '30123321', '9137', '2017-12-26', '2018-12-26', '31');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '44', '3', '1757');
INSERT INTO `Auto` VALUES ('45', '3', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '30123321', '5617', '2018-02-01', '2019-02-01', '32');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '45', '1', '21334');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '33333333', '3202', '2018-10-04', '2019-10-04', '55');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '11111111', '22040');
INSERT INTO `Auto` VALUES ('46', '3', '9', '2016');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '11111111', '8369', '2018-04-08', '2019-04-08', '10');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '46', '1', '36468');
INSERT INTO `Auto` VALUES ('47', '4', '2', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '30123321', '574', '2018-05-18', '2019-05-18', '10');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '47', '1', '28603');
INSERT INTO `Continente` VALUES ('38', '4', 'dir 38', 'desc 38');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '30123321', '2690', '2017-12-31', '2018-12-31', '28');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '38', '49052');
INSERT INTO `Continente` VALUES ('39', '2', 'dir 39', 'desc 39');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '22222222', '9166', '2018-01-31', '2019-01-31', '12');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '39', '72350');
INSERT INTO `Auto` VALUES ('48', '5', '5', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '33333333', '8193', '2018-04-07', '2019-04-07', '43');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '48', '1', '10507');
INSERT INTO `Auto` VALUES ('49', '3', '9', '2016');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '11111111', '4686', '2018-12-19', '2019-12-19', '53');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '49', '3', '12887');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '30123321', '9779', '2018-01-08', '2019-01-08', '56');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '5', '22222222', '34200');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '11111111', '4374', '2018-07-03', '2019-07-03', '63');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '6', '33333333', '41606');
INSERT INTO `Continente` VALUES ('40', '1', 'dir 40', 'desc 40');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '33333333', '4871', '2018-07-17', '2019-07-17', '18');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '40', '90651');
INSERT INTO `Auto` VALUES ('50', '1', '1', '2010');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '22222222', '9962', '2018-08-14', '2019-08-14', '56');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '50', '1', '22038');
INSERT INTO `Continente` VALUES ('41', '5', 'dir 41', 'desc 41');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '22222222', '1045', '2018-07-13', '2019-07-13', '32');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '41', '49472');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '11111111', '8058', '2018-04-07', '2019-04-07', '28');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '30123321', '45023');
INSERT INTO `Auto` VALUES ('51', '4', '5', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '30123321', '548', '2018-06-11', '2019-06-11', '48');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '51', '1', '2861');
INSERT INTO `Continente` VALUES ('42', '1', 'dir 42', 'desc 42');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '22222222', '8297', '2018-10-14', '2019-10-14', '62');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '42', '32706');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '22222222', '1332', '2018-10-06', '2019-10-06', '50');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '30123321', '58392');
INSERT INTO `Auto` VALUES ('52', '5', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '22222222', '2910', '2018-05-27', '2019-05-27', '47');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '52', '2', '13789');
INSERT INTO `Auto` VALUES ('53', '4', '7', '2017');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '33333333', '7540', '2017-12-12', '2018-12-12', '16');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '53', '3', '23650');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '11111111', '5826', '2018-04-05', '2019-04-05', '36');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '6', '11111111', '37478');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '11111111', '5803', '2018-08-07', '2019-08-07', '61');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '22222222', '43028');
INSERT INTO `Auto` VALUES ('54', '1', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '11111111', '1515', '2018-01-13', '2019-01-13', '24');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '54', '3', '23751');
INSERT INTO `Continente` VALUES ('43', '3', 'dir 43', 'desc 43');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '33333333', '4645', '2017-12-25', '2018-12-25', '17');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '43', '63228');
INSERT INTO `Auto` VALUES ('55', '3', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '22222222', '1521', '2017-12-12', '2018-12-12', '64');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '55', '2', '7626');
INSERT INTO `Continente` VALUES ('44', '2', 'dir 44', 'desc 44');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '33333333', '9377', '2018-09-19', '2019-09-19', '46');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '44', '29796');
INSERT INTO `Auto` VALUES ('56', '4', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '22222222', '8419', '2018-11-24', '2019-11-24', '36');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '56', '3', '9176');
INSERT INTO `Auto` VALUES ('57', '5', '4', '2012');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '22222222', '5749', '2018-07-28', '2019-07-28', '41');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '57', '3', '26891');
INSERT INTO `Continente` VALUES ('45', '1', 'dir 45', 'desc 45');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '22222222', '8775', '2018-02-11', '2019-02-11', '29');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '45', '44389');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '11111111', '5706', '2018-01-10', '2019-01-10', '55');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '1', '22222222', '56407');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '22222222', '1706', '2018-01-07', '2019-01-07', '61');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '4', '22222222', '69793');
INSERT INTO `Auto` VALUES ('58', '4', '7', '2017');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '33333333', '6903', '2018-12-27', '2019-12-27', '60');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '58', '1', '40906');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '33333333', '3336', '2018-06-13', '2019-06-13', '32');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '7', '11111111', '72669');
INSERT INTO `Auto` VALUES ('59', '2', '1', '2010');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '33333333', '6301', '2018-01-26', '2019-01-26', '16');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '59', '3', '44559');
INSERT INTO `Continente` VALUES ('46', '3', 'dir 46', 'desc 46');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '30123321', '6030', '2018-03-03', '2019-03-03', '38');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '46', '73334');
INSERT INTO `Auto` VALUES ('60', '1', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '30123321', '7303', '2018-09-29', '2019-09-29', '27');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '60', '3', '46135');
INSERT INTO `Auto` VALUES ('61', '5', '9', '2016');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '22222222', '4964', '2018-07-04', '2019-07-04', '34');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '61', '3', '1327');
INSERT INTO `Continente` VALUES ('47', '5', 'dir 47', 'desc 47');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '33333333', '2161', '2018-10-09', '2019-10-09', '59');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '47', '82810');
INSERT INTO `Continente` VALUES ('48', '5', 'dir 48', 'desc 48');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '11111111', '1688', '2018-10-01', '2019-10-01', '21');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '48', '36021');
INSERT INTO `Continente` VALUES ('49', '4', 'dir 49', 'desc 49');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '22222222', '9622', '2018-12-25', '2019-12-25', '17');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '49', '23907');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '5819', '2018-08-17', '2019-08-17', '47');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '5', '22222222', '95430');
INSERT INTO `Auto` VALUES ('62', '1', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '11111111', '4732', '2018-06-07', '2019-06-07', '32');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '62', '3', '11717');
INSERT INTO `Auto` VALUES ('63', '1', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '30123321', '4713', '2018-09-03', '2019-09-03', '13');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '63', '2', '11481');
INSERT INTO `Auto` VALUES ('64', '1', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '30123321', '8499', '2018-07-03', '2019-07-03', '15');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '64', '2', '11065');
INSERT INTO `Auto` VALUES ('65', '2', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '30123321', '2613', '2018-09-11', '2019-09-11', '64');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '65', '3', '38024');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '22222222', '6584', '2018-06-26', '2019-06-26', '32');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '4', '33333333', '79813');
INSERT INTO `Continente` VALUES ('50', '4', 'dir 50', 'desc 50');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '22222222', '9051', '2018-05-25', '2019-05-25', '52');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '50', '11858');
INSERT INTO `Continente` VALUES ('51', '1', 'dir 51', 'desc 51');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '33333333', '1514', '2018-06-11', '2019-06-11', '54');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '51', '35235');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '22222222', '3271', '2018-11-05', '2019-11-05', '38');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '11111111', '72951');
INSERT INTO `Auto` VALUES ('66', '5', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '11111111', '1743', '2018-05-20', '2019-05-20', '33');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '66', '3', '30825');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '33333333', '2511', '2018-02-26', '2019-02-26', '52');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '22222222', '98116');
INSERT INTO `Continente` VALUES ('52', '2', 'dir 52', 'desc 52');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '22222222', '6929', '2018-07-15', '2019-07-15', '68');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '52', '30207');
INSERT INTO `Auto` VALUES ('67', '1', '4', '2012');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '11111111', '2334', '2018-11-25', '2019-11-25', '65');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '67', '2', '18314');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '11111111', '463', '2018-05-09', '2019-05-09', '39');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '6', '22222222', '37647');
INSERT INTO `Continente` VALUES ('53', '3', 'dir 53', 'desc 53');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '30123321', '6636', '2017-12-21', '2018-12-21', '68');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '53', '59022');
INSERT INTO `Auto` VALUES ('68', '4', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '22222222', '9617', '2018-06-09', '2019-06-09', '38');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '68', '3', '30513');
INSERT INTO `Continente` VALUES ('54', '2', 'dir 54', 'desc 54');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '33333333', '3464', '2017-12-21', '2018-12-21', '61');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '54', '13141');
INSERT INTO `Auto` VALUES ('69', '5', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '22222222', '8574', '2018-02-20', '2019-02-20', '44');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '69', '2', '8299');
INSERT INTO `Continente` VALUES ('55', '4', 'dir 55', 'desc 55');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '11111111', '7802', '2018-12-17', '2019-12-17', '52');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '55', '53453');
INSERT INTO `Continente` VALUES ('56', '2', 'dir 56', 'desc 56');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '11111111', '2488', '2018-07-28', '2019-07-28', '33');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '56', '71041');
INSERT INTO `Auto` VALUES ('70', '2', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '11111111', '6475', '2018-03-22', '2019-03-22', '49');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '70', '3', '36963');
INSERT INTO `Continente` VALUES ('57', '4', 'dir 57', 'desc 57');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '30123321', '3763', '2017-12-01', '2018-12-01', '52');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '57', '29729');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '33333333', '7217', '2018-11-02', '2019-11-02', '15');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '33333333', '75050');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '30123321', '7545', '2018-09-30', '2019-09-30', '42');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '30123321', '72089');
INSERT INTO `Continente` VALUES ('58', '4', 'dir 58', 'desc 58');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '11111111', '2870', '2017-11-20', '2018-11-20', '14');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '58', '96736');
INSERT INTO `Auto` VALUES ('71', '4', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '22222222', '3133', '2018-09-27', '2019-09-27', '24');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '71', '2', '18060');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '33333333', '5129', '2017-11-29', '2018-11-29', '28');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '7', '33333333', '64362');
INSERT INTO `Continente` VALUES ('59', '4', 'dir 59', 'desc 59');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '22222222', '8519', '2018-03-25', '2019-03-25', '55');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '59', '56627');
INSERT INTO `Continente` VALUES ('60', '5', 'dir 60', 'desc 60');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '33333333', '5460', '2018-05-16', '2019-05-16', '63');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '60', '39879');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '11111111', '1361', '2018-08-23', '2019-08-23', '68');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '6', '30123321', '45256');
INSERT INTO `Auto` VALUES ('72', '5', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '30123321', '250', '2017-11-23', '2018-11-23', '49');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '72', '2', '14410');
INSERT INTO `Auto` VALUES ('73', '2', '4', '2012');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '33333333', '3274', '2019-01-01', '2020-01-01', '64');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '73', '1', '12271');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '33333333', '4228', '2017-11-28', '2018-11-28', '44');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '30123321', '12123');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '3338', '2018-09-10', '2019-09-10', '65');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '30123321', '26233');
INSERT INTO `Auto` VALUES ('74', '5', '4', '2012');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '11111111', '2775', '2018-08-30', '2019-08-30', '26');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '74', '2', '26990');
INSERT INTO `Continente` VALUES ('61', '5', 'dir 61', 'desc 61');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '22222222', '7159', '2018-04-28', '2019-04-28', '20');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '61', '92102');
INSERT INTO `Auto` VALUES ('75', '2', '5', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '33333333', '1286', '2018-09-02', '2019-09-02', '29');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '75', '1', '41499');
INSERT INTO `Continente` VALUES ('62', '3', 'dir 62', 'desc 62');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '30123321', '4412', '2018-04-27', '2019-04-27', '23');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '62', '66511');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '22222222', '1259', '2018-03-14', '2019-03-14', '69');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '5', '30123321', '35341');
INSERT INTO `Continente` VALUES ('63', '2', 'dir 63', 'desc 63');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '11111111', '9318', '2018-10-10', '2019-10-10', '26');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '63', '69437');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '30123321', '5195', '2019-01-03', '2020-01-03', '17');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '22222222', '29426');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '30123321', '1475', '2018-10-02', '2019-10-02', '66');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '1', '11111111', '62957');
INSERT INTO `Continente` VALUES ('64', '4', 'dir 64', 'desc 64');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '11111111', '4426', '2018-04-18', '2019-04-18', '20');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '64', '95226');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '6669', '2018-06-01', '2019-06-01', '52');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '1', '33333333', '39541');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '33333333', '804', '2018-12-26', '2019-12-26', '25');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '33333333', '34468');
INSERT INTO `Continente` VALUES ('65', '4', 'dir 65', 'desc 65');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '30123321', '383', '2018-06-11', '2019-06-11', '21');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '65', '10356');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '22222222', '3367', '2018-05-13', '2019-05-13', '25');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '6', '22222222', '64601');
INSERT INTO `Auto` VALUES ('76', '5', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '30123321', '2377', '2018-07-25', '2019-07-25', '33');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '76', '3', '41243');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '22222222', '6175', '2018-04-11', '2019-04-11', '52');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '1', '33333333', '69033');
INSERT INTO `Continente` VALUES ('66', '2', 'dir 66', 'desc 66');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '11111111', '4800', '2018-05-02', '2019-05-02', '17');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '66', '93962');
INSERT INTO `Continente` VALUES ('67', '1', 'dir 67', 'desc 67');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '1717', '2018-09-14', '2019-09-14', '43');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '67', '43627');
INSERT INTO `Auto` VALUES ('77', '1', '9', '2016');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '11111111', '7918', '2018-06-06', '2019-06-06', '49');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '77', '1', '25373');
INSERT INTO `Continente` VALUES ('68', '3', 'dir 68', 'desc 68');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '22222222', '5758', '2018-01-06', '2019-01-06', '63');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '68', '40227');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '33333333', '3087', '2018-06-12', '2019-06-12', '20');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '4', '33333333', '20955');
INSERT INTO `Auto` VALUES ('78', '4', '5', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '22222222', '8653', '2018-05-04', '2019-05-04', '36');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '78', '1', '23393');
INSERT INTO `Auto` VALUES ('79', '1', '5', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '33333333', '8368', '2018-09-25', '2019-09-25', '40');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '79', '2', '40216');
INSERT INTO `Auto` VALUES ('80', '3', '4', '2012');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '22222222', '4097', '2017-12-24', '2018-12-24', '68');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '80', '1', '1546');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '33333333', '6543', '2018-03-15', '2019-03-15', '62');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '7', '22222222', '42123');
INSERT INTO `Auto` VALUES ('81', '4', '1', '2010');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '30123321', '6542', '2018-01-13', '2019-01-13', '51');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '81', '3', '48076');
INSERT INTO `Continente` VALUES ('69', '3', 'dir 69', 'desc 69');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '33333333', '7259', '2018-11-24', '2019-11-24', '67');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '69', '86503');
INSERT INTO `Auto` VALUES ('82', '3', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '33333333', '1264', '2018-02-12', '2019-02-12', '17');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '82', '3', '4369');
INSERT INTO `Auto` VALUES ('83', '5', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '33333333', '7541', '2018-12-31', '2019-12-31', '46');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '83', '3', '31798');
INSERT INTO `Continente` VALUES ('70', '1', 'dir 70', 'desc 70');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '22222222', '5132', '2018-04-12', '2019-04-12', '67');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '70', '40718');
INSERT INTO `Continente` VALUES ('71', '1', 'dir 71', 'desc 71');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '33333333', '424', '2018-04-05', '2019-04-05', '49');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '71', '61614');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '33333333', '4179', '2018-03-11', '2019-03-11', '69');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '7', '30123321', '64776');
INSERT INTO `Auto` VALUES ('84', '3', '4', '2012');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '33333333', '3490', '2018-06-12', '2019-06-12', '53');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '84', '1', '49053');
INSERT INTO `Continente` VALUES ('72', '3', 'dir 72', 'desc 72');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '22222222', '8682', '2018-11-25', '2019-11-25', '51');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '72', '87870');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '30123321', '3979', '2018-01-31', '2019-01-31', '37');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '33333333', '44787');
INSERT INTO `Auto` VALUES ('85', '4', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '30123321', '1237', '2018-11-17', '2019-11-17', '40');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '85', '1', '11597');
INSERT INTO `Auto` VALUES ('86', '3', '1', '2010');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '22222222', '6952', '2018-11-11', '2019-11-11', '14');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '86', '2', '24638');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '22222222', '9003', '2018-09-12', '2019-09-12', '66');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '33333333', '82475');
INSERT INTO `Auto` VALUES ('87', '5', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '22222222', '9198', '2018-11-02', '2019-11-02', '57');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '87', '3', '3965');
INSERT INTO `Auto` VALUES ('88', '5', '7', '2017');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '30123321', '2845', '2019-01-08', '2020-01-08', '49');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '88', '2', '28943');
INSERT INTO `Continente` VALUES ('73', '5', 'dir 73', 'desc 73');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '11111111', '4781', '2019-01-13', '2020-01-13', '15');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '73', '29370');
INSERT INTO `Auto` VALUES ('89', '3', '4', '2012');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '33333333', '5541', '2018-05-21', '2019-05-21', '12');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '89', '2', '21451');
INSERT INTO `Auto` VALUES ('90', '1', '1', '2010');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '33333333', '8336', '2018-11-22', '2019-11-22', '47');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '90', '1', '7472');
INSERT INTO `Continente` VALUES ('74', '4', 'dir 74', 'desc 74');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '33333333', '3235', '2018-02-28', '2019-02-28', '55');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '74', '49911');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '33333333', '9332', '2018-02-20', '2019-02-20', '54');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '1', '22222222', '15422');
INSERT INTO `Auto` VALUES ('91', '2', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '33333333', '3807', '2018-06-08', '2019-06-08', '20');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '91', '2', '30106');
INSERT INTO `Auto` VALUES ('92', '5', '7', '2017');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '33333333', '4721', '2018-04-10', '2019-04-10', '31');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '92', '3', '38867');
INSERT INTO `Continente` VALUES ('75', '3', 'dir 75', 'desc 75');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '30123321', '7924', '2018-09-06', '2019-09-06', '27');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '75', '72952');
INSERT INTO `Continente` VALUES ('76', '2', 'dir 76', 'desc 76');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '22222222', '2892', '2018-12-03', '2019-12-03', '42');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '76', '80246');
INSERT INTO `Auto` VALUES ('93', '2', '9', '2016');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '22222222', '598', '2018-11-19', '2019-11-19', '33');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '93', '1', '25597');
INSERT INTO `Auto` VALUES ('94', '4', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '11111111', '1093', '2018-08-05', '2019-08-05', '66');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '94', '3', '45939');
INSERT INTO `Continente` VALUES ('77', '1', 'dir 77', 'desc 77');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '11111111', '3920', '2018-09-11', '2019-09-11', '17');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '77', '87025');
INSERT INTO `Auto` VALUES ('95', '5', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '33333333', '2686', '2018-04-09', '2019-04-09', '51');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '95', '3', '27348');
INSERT INTO `Auto` VALUES ('96', '4', '5', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '30123321', '8983', '2017-12-13', '2018-12-13', '39');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '96', '1', '990');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '22222222', '3828', '2018-12-22', '2019-12-22', '68');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '6', '22222222', '80989');
INSERT INTO `Auto` VALUES ('97', '3', '2', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '30123321', '7418', '2018-10-18', '2019-10-18', '22');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '97', '1', '22505');
INSERT INTO `Continente` VALUES ('78', '3', 'dir 78', 'desc 78');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '30123321', '532', '2018-04-12', '2019-04-12', '39');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '78', '84236');
INSERT INTO `Continente` VALUES ('79', '3', 'dir 79', 'desc 79');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '30123321', '6430', '2018-02-04', '2019-02-04', '49');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '79', '20463');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '3836', '2018-01-14', '2019-01-14', '31');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '4', '30123321', '71688');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '22222222', '6870', '2018-01-26', '2019-01-26', '30');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '5', '33333333', '94241');
INSERT INTO `Auto` VALUES ('98', '2', '5', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '30123321', '846', '2018-04-19', '2019-04-19', '20');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '98', '1', '34534');
INSERT INTO `Auto` VALUES ('99', '5', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '33333333', '4762', '2018-07-16', '2019-07-16', '11');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '99', '2', '47490');
INSERT INTO `Continente` VALUES ('80', '2', 'dir 80', 'desc 80');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '11111111', '9243', '2019-01-05', '2020-01-05', '59');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '80', '72193');
INSERT INTO `Auto` VALUES ('100', '5', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '30123321', '9281', '2017-11-28', '2018-11-28', '69');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '100', '3', '3817');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '22222222', '620', '2018-02-23', '2019-02-23', '54');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '11111111', '53007');
INSERT INTO `Continente` VALUES ('81', '1', 'dir 81', 'desc 81');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '22222222', '856', '2017-11-15', '2018-11-15', '70');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '81', '54387');
INSERT INTO `Continente` VALUES ('82', '3', 'dir 82', 'desc 82');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '22222222', '2328', '2018-05-11', '2019-05-11', '26');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '82', '62045');
INSERT INTO `Auto` VALUES ('101', '2', '4', '2012');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '11111111', '1076', '2018-08-09', '2019-08-09', '30');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '101', '3', '3408');
INSERT INTO `Auto` VALUES ('102', '5', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '11111111', '7954', '2018-04-03', '2019-04-03', '47');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '102', '1', '16348');
INSERT INTO `Auto` VALUES ('103', '3', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '30123321', '491', '2018-05-13', '2019-05-13', '22');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '103', '3', '15132');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '33333333', '4221', '2018-08-06', '2019-08-06', '38');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '5', '22222222', '94759');
INSERT INTO `Auto` VALUES ('104', '1', '7', '2017');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '4690', '2018-06-26', '2019-06-26', '23');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '104', '2', '49205');
INSERT INTO `Continente` VALUES ('83', '2', 'dir 83', 'desc 83');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '30123321', '5598', '2018-11-21', '2019-11-21', '53');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '83', '81417');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '22222222', '402', '2018-05-03', '2019-05-03', '45');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '1', '33333333', '53438');
INSERT INTO `Auto` VALUES ('105', '1', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '30123321', '7294', '2018-08-31', '2019-08-31', '26');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '105', '1', '15717');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '33333333', '9421', '2018-02-06', '2019-02-06', '46');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '1', '22222222', '81425');
INSERT INTO `Continente` VALUES ('84', '4', 'dir 84', 'desc 84');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '30123321', '518', '2018-10-20', '2019-10-20', '46');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '84', '51482');
INSERT INTO `Auto` VALUES ('106', '1', '2', '2011');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '30123321', '4886', '2017-11-13', '2018-11-13', '43');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '106', '1', '7297');
INSERT INTO `Continente` VALUES ('85', '1', 'dir 85', 'desc 85');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '6847', '2018-02-23', '2019-02-23', '23');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '85', '50543');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '11111111', '1805', '2017-11-13', '2018-11-13', '68');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '5', '22222222', '89876');
INSERT INTO `Continente` VALUES ('86', '5', 'dir 86', 'desc 86');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '11111111', '6730', '2018-02-06', '2019-02-06', '38');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '86', '39746');
INSERT INTO `Auto` VALUES ('107', '2', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '30123321', '3695', '2018-10-15', '2019-10-15', '68');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '107', '2', '22629');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '11111111', '3954', '2018-05-13', '2019-05-13', '63');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '6', '22222222', '33086');
INSERT INTO `Continente` VALUES ('87', '1', 'dir 87', 'desc 87');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '30123321', '1104', '2017-11-09', '2018-11-09', '39');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '87', '79720');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '33333333', '7086', '2018-01-14', '2019-01-14', '26');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '6', '30123321', '20985');
INSERT INTO `Auto` VALUES ('108', '2', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '22222222', '3856', '2018-12-10', '2019-12-10', '39');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '108', '3', '43344');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '11111111', '3231', '2018-07-20', '2019-07-20', '66');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '30123321', '95010');
INSERT INTO `Auto` VALUES ('109', '2', '9', '2016');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '30123321', '2710', '2018-03-24', '2019-03-24', '33');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '109', '3', '1275');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '33333333', '969', '2018-02-17', '2019-02-17', '24');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '1', '30123321', '81882');
INSERT INTO `Auto` VALUES ('110', '5', '1', '2010');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '30123321', '9523', '2018-05-13', '2019-05-13', '48');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '110', '1', '7658');
INSERT INTO `Continente` VALUES ('88', '2', 'dir 88', 'desc 88');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '22222222', '5933', '2018-12-10', '2019-12-10', '19');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '88', '24495');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '11111111', '224', '2018-04-23', '2019-04-23', '27');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '33333333', '99106');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '30123321', '7372', '2018-01-30', '2019-01-30', '30');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '7', '33333333', '38114');
INSERT INTO `Continente` VALUES ('89', '2', 'dir 89', 'desc 89');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '30123321', '349', '2018-07-14', '2019-07-14', '46');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '89', '41863');
INSERT INTO `Continente` VALUES ('90', '5', 'dir 90', 'desc 90');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '33333333', '3403', '2018-08-27', '2019-08-27', '32');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '90', '99611');
INSERT INTO `Continente` VALUES ('91', '4', 'dir 91', 'desc 91');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '30123321', '8150', '2018-02-28', '2019-02-28', '18');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '91', '39530');
INSERT INTO `Continente` VALUES ('92', '4', 'dir 92', 'desc 92');
INSERT INTO `Poliza` VALUES (NULL, '1', '1', '11111111', '9699', '2018-03-11', '2019-03-11', '26');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '92', '22853');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '11111111', '2940', '2018-07-27', '2019-07-27', '27');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '3', '11111111', '56990');
INSERT INTO `Continente` VALUES ('93', '2', 'dir 93', 'desc 93');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '4108', '2018-06-06', '2019-06-06', '50');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '93', '89112');
INSERT INTO `Continente` VALUES ('94', '2', 'dir 94', 'desc 94');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '22222222', '5274', '2018-12-27', '2019-12-27', '19');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '94', '67347');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '11111111', '3156', '2018-02-04', '2019-02-04', '20');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '4', '11111111', '74267');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '30123321', '1102', '2018-02-10', '2019-02-10', '43');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '6', '11111111', '22939');
INSERT INTO `Continente` VALUES ('95', '4', 'dir 95', 'desc 95');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '33333333', '2601', '2018-12-11', '2019-12-11', '27');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '95', '67818');
INSERT INTO `Continente` VALUES ('96', '2', 'dir 96', 'desc 96');
INSERT INTO `Poliza` VALUES (NULL, '1', '4', '30123321', '6155', '2018-07-16', '2019-07-16', '25');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '96', '13907');
INSERT INTO `Auto` VALUES ('111', '1', '3', '2013');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '7402', '2018-03-14', '2019-03-14', '69');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '111', '2', '33882');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '30123321', '3621', '2017-11-27', '2018-11-27', '23');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '4', '33333333', '78411');
INSERT INTO `Continente` VALUES ('97', '5', 'dir 97', 'desc 97');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '30123321', '9780', '2018-05-22', '2019-05-22', '49');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '97', '96600');
INSERT INTO `Continente` VALUES ('98', '1', 'dir 98', 'desc 98');
INSERT INTO `Poliza` VALUES (NULL, '1', '6', '22222222', '7853', '2018-05-14', '2019-05-14', '16');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '98', '28811');
INSERT INTO `Poliza` VALUES (NULL, '1', '7', '30123321', '5711', '2018-07-20', '2019-07-20', '28');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '7', '30123321', '85657');
INSERT INTO `Continente` VALUES ('99', '2', 'dir 99', 'desc 99');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '33333333', '4368', '2017-12-31', '2018-12-31', '61');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '99', '19881');
INSERT INTO `Continente` VALUES ('100', '5', 'dir 100', 'desc 100');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '22222222', '6255', '2018-02-01', '2019-02-01', '43');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '100', '24133');
INSERT INTO `Continente` VALUES ('101', '1', 'dir 101', 'desc 101');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '5244', '2018-09-07', '2019-09-07', '62');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '101', '34838');
INSERT INTO `Auto` VALUES ('112', '5', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '9', '33333333', '5370', '2018-05-31', '2019-05-31', '34');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '112', '3', '16582');
INSERT INTO `Continente` VALUES ('102', '5', 'dir 102', 'desc 102');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '33333333', '145', '2018-06-08', '2019-06-08', '22');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '102', '54588');
INSERT INTO `Poliza` VALUES (NULL, '1', '8', '22222222', '2144', '2018-01-29', '2019-01-29', '27');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '4', '11111111', '34975');
INSERT INTO `Auto` VALUES ('113', '5', '8', '2015');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '22222222', '4174', '2018-08-23', '2019-08-23', '39');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '113', '1', '18426');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '22222222', '3282', '2018-02-21', '2019-02-21', '58');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '1', '30123321', '75299');
INSERT INTO `Auto` VALUES ('114', '2', '6', '2018');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '30123321', '2754', '2018-07-02', '2019-07-02', '56');
INSERT INTO `Poliza_Auto` VALUES (LAST_INSERT_ID(), '114', '1', '33208');
INSERT INTO `Poliza` VALUES (NULL, '1', '10', '30123321', '1508', '2018-07-19', '2019-07-19', '44');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '2', '22222222', '79966');
INSERT INTO `Poliza` VALUES (NULL, '1', '5', '22222222', '7563', '2018-03-31', '2019-03-31', '36');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '6', '30123321', '50972');
INSERT INTO `Continente` VALUES ('103', '4', 'dir 103', 'desc 103');
INSERT INTO `Poliza` VALUES (NULL, '1', '3', '22222222', '5891', '2018-07-19', '2019-07-19', '59');
INSERT INTO `Poliza_Hogar` VALUES (LAST_INSERT_ID(), '103', '22031');
INSERT INTO `Poliza` VALUES (NULL, '1', '2', '30123321', '7524', '2018-10-07', '2019-10-07', '26');
INSERT INTO `Poliza_Vida` VALUES (LAST_INSERT_ID(), '1', '22222222', '30968');