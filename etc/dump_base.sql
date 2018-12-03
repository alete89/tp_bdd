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
  `id` int(11) NOT NULL,
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


INSERT INTO `poliza` VALUES ('1', '1', '10', '33333333', '1487', '2018-05-26', '2019-05-26', '35');
INSERT INTO `poliza` VALUES ('2', '1', '1', '30123321', '4168', '2018-01-09', '2019-01-09', '29');
INSERT INTO `poliza` VALUES ('3', '1', '6', '33333333', '6549', '2018-06-05', '2019-06-05', '61');
INSERT INTO `poliza` VALUES ('4', '1', '8', '33333333', '4601', '2018-09-26', '2019-09-26', '67');
INSERT INTO `poliza` VALUES ('5', '1', '5', '11111111', '5741', '2018-06-03', '2019-06-03', '60');
INSERT INTO `poliza` VALUES ('6', '1', '7', '33333333', '794', '2018-06-24', '2019-06-24', '25');
INSERT INTO `poliza` VALUES ('7', '1', '3', '33333333', '5765', '2018-04-06', '2019-04-06', '33');
INSERT INTO `poliza` VALUES ('8', '1', '3', '22222222', '2289', '2018-03-26', '2019-03-26', '19');
INSERT INTO `poliza` VALUES ('9', '1', '9', '11111111', '2216', '2018-11-29', '2019-11-29', '19');
INSERT INTO `poliza` VALUES ('10', '1', '6', '33333333', '9852', '2018-04-04', '2019-04-04', '57');
INSERT INTO `poliza` VALUES ('11', '1', '5', '22222222', '6199', '2018-04-21', '2019-04-21', '42');
INSERT INTO `poliza` VALUES ('12', '1', '6', '33333333', '4659', '2018-07-19', '2019-07-19', '58');
INSERT INTO `poliza` VALUES ('13', '1', '4', '22222222', '4194', '2018-01-06', '2019-01-06', '53');
INSERT INTO `poliza` VALUES ('14', '1', '7', '22222222', '2955', '2018-12-26', '2019-12-26', '18');
INSERT INTO `poliza` VALUES ('15', '1', '3', '33333333', '8418', '2018-08-04', '2019-08-04', '26');
INSERT INTO `poliza` VALUES ('16', '1', '7', '22222222', '7957', '2018-11-30', '2019-11-30', '10');
INSERT INTO `poliza` VALUES ('17', '1', '10', '22222222', '8890', '2018-10-29', '2019-10-29', '18');
INSERT INTO `poliza` VALUES ('18', '1', '10', '30123321', '5155', '2017-12-09', '2018-12-09', '19');
INSERT INTO `poliza` VALUES ('19', '1', '4', '22222222', '5062', '2018-10-12', '2019-10-12', '21');
INSERT INTO `poliza` VALUES ('20', '1', '7', '33333333', '6734', '2018-10-03', '2019-10-03', '59');
INSERT INTO `poliza` VALUES ('21', '1', '5', '11111111', '1406', '2017-11-24', '2018-11-24', '70');
INSERT INTO `poliza` VALUES ('22', '1', '5', '33333333', '8250', '2018-01-23', '2019-01-23', '46');
INSERT INTO `poliza` VALUES ('23', '1', '10', '22222222', '8334', '2018-10-11', '2019-10-11', '48');
INSERT INTO `poliza` VALUES ('24', '1', '6', '33333333', '4126', '2017-11-07', '2018-11-07', '16');
INSERT INTO `poliza` VALUES ('25', '1', '7', '11111111', '9181', '2018-07-30', '2019-07-30', '55');
INSERT INTO `poliza` VALUES ('26', '1', '9', '11111111', '9116', '2017-12-19', '2018-12-19', '14');
INSERT INTO `poliza` VALUES ('27', '1', '3', '33333333', '892', '2018-12-13', '2019-12-13', '11');
INSERT INTO `poliza` VALUES ('28', '1', '10', '22222222', '2344', '2018-01-29', '2019-01-29', '42');
INSERT INTO `poliza` VALUES ('29', '1', '9', '11111111', '1258', '2018-06-05', '2019-06-05', '31');
INSERT INTO `poliza` VALUES ('30', '1', '8', '33333333', '9731', '2018-04-03', '2019-04-03', '37');
INSERT INTO `poliza` VALUES ('31', '1', '7', '22222222', '6057', '2018-02-16', '2019-02-16', '41');
INSERT INTO `poliza` VALUES ('32', '1', '1', '11111111', '2599', '2018-04-26', '2019-04-26', '42');
INSERT INTO `poliza` VALUES ('33', '1', '6', '22222222', '7024', '2018-03-20', '2019-03-20', '39');
INSERT INTO `poliza` VALUES ('34', '1', '1', '11111111', '2500', '2018-05-28', '2019-05-28', '29');
INSERT INTO `poliza` VALUES ('35', '1', '6', '11111111', '5552', '2018-08-03', '2019-08-03', '52');
INSERT INTO `poliza` VALUES ('36', '1', '1', '30123321', '3935', '2018-08-23', '2019-08-23', '49');
INSERT INTO `poliza` VALUES ('37', '1', '8', '11111111', '2335', '2018-01-14', '2019-01-14', '55');
INSERT INTO `poliza` VALUES ('38', '1', '5', '30123321', '8391', '2018-02-11', '2019-02-11', '41');
INSERT INTO `poliza` VALUES ('39', '1', '5', '11111111', '4565', '2018-06-23', '2019-06-23', '48');
INSERT INTO `poliza` VALUES ('40', '1', '10', '22222222', '9591', '2018-02-05', '2019-02-05', '11');
INSERT INTO `poliza` VALUES ('41', '1', '1', '11111111', '3890', '2018-11-10', '2019-11-10', '57');
INSERT INTO `poliza` VALUES ('42', '1', '7', '30123321', '3486', '2019-01-04', '2020-01-04', '21');
INSERT INTO `poliza` VALUES ('43', '1', '3', '22222222', '6512', '2018-06-12', '2019-06-12', '49');
INSERT INTO `poliza` VALUES ('44', '1', '4', '11111111', '3333', '2018-03-13', '2019-03-13', '56');
INSERT INTO `poliza` VALUES ('45', '1', '1', '30123321', '3961', '2018-09-29', '2019-09-29', '56');
INSERT INTO `poliza` VALUES ('46', '1', '9', '30123321', '9428', '2018-06-12', '2019-06-12', '69');
INSERT INTO `poliza` VALUES ('47', '1', '3', '11111111', '8145', '2018-11-17', '2019-11-17', '22');
INSERT INTO `poliza` VALUES ('48', '1', '5', '11111111', '3604', '2018-03-04', '2019-03-04', '64');
INSERT INTO `poliza` VALUES ('49', '1', '3', '33333333', '3973', '2019-01-07', '2020-01-07', '39');
INSERT INTO `poliza` VALUES ('50', '1', '4', '33333333', '2259', '2018-01-25', '2019-01-25', '43');
INSERT INTO `poliza` VALUES ('51', '1', '4', '11111111', '2891', '2018-05-18', '2019-05-18', '34');
INSERT INTO `poliza` VALUES ('52', '1', '3', '33333333', '2989', '2017-11-09', '2018-11-09', '23');
INSERT INTO `poliza` VALUES ('53', '1', '6', '33333333', '7544', '2018-06-13', '2019-06-13', '41');
INSERT INTO `poliza` VALUES ('54', '1', '8', '33333333', '6275', '2018-10-08', '2019-10-08', '32');
INSERT INTO `poliza` VALUES ('55', '1', '7', '33333333', '2784', '2017-11-06', '2018-11-06', '58');
INSERT INTO `poliza` VALUES ('56', '1', '6', '22222222', '258', '2018-10-28', '2019-10-28', '24');
INSERT INTO `poliza` VALUES ('57', '1', '7', '33333333', '3692', '2018-03-21', '2019-03-21', '34');
INSERT INTO `poliza` VALUES ('58', '1', '8', '33333333', '1315', '2018-01-09', '2019-01-09', '59');
INSERT INTO `poliza` VALUES ('59', '1', '2', '11111111', '5519', '2018-08-06', '2019-08-06', '35');
INSERT INTO `poliza` VALUES ('60', '1', '3', '30123321', '8073', '2017-12-24', '2018-12-24', '53');
INSERT INTO `poliza` VALUES ('61', '1', '1', '33333333', '9574', '2018-01-12', '2019-01-12', '62');
INSERT INTO `poliza` VALUES ('62', '1', '2', '33333333', '6413', '2018-10-08', '2019-10-08', '32');
INSERT INTO `poliza` VALUES ('63', '1', '7', '22222222', '2919', '2017-12-29', '2018-12-29', '21');
INSERT INTO `poliza` VALUES ('64', '1', '10', '22222222', '4432', '2018-12-20', '2019-12-20', '25');
INSERT INTO `poliza` VALUES ('65', '1', '8', '22222222', '1236', '2018-12-28', '2019-12-28', '66');
INSERT INTO `poliza` VALUES ('66', '1', '7', '33333333', '4658', '2018-01-08', '2019-01-08', '26');
INSERT INTO `poliza` VALUES ('67', '1', '6', '33333333', '4600', '2018-06-27', '2019-06-27', '20');
INSERT INTO `poliza` VALUES ('68', '1', '3', '33333333', '8079', '2018-02-13', '2019-02-13', '15');
INSERT INTO `poliza` VALUES ('69', '1', '8', '22222222', '8356', '2018-09-29', '2019-09-29', '52');
INSERT INTO `poliza` VALUES ('70', '1', '9', '22222222', '9420', '2018-04-15', '2019-04-15', '57');
INSERT INTO `poliza` VALUES ('71', '1', '9', '30123321', '5214', '2018-02-05', '2019-02-05', '24');
INSERT INTO `poliza` VALUES ('72', '1', '7', '11111111', '4641', '2018-07-16', '2019-07-16', '51');
INSERT INTO `poliza` VALUES ('73', '1', '2', '22222222', '4387', '2018-09-12', '2019-09-12', '30');
INSERT INTO `poliza` VALUES ('74', '1', '4', '22222222', '7892', '2018-02-20', '2019-02-20', '52');
INSERT INTO `poliza` VALUES ('75', '1', '2', '33333333', '3400', '2018-03-13', '2019-03-13', '49');
INSERT INTO `poliza` VALUES ('76', '1', '7', '30123321', '9342', '2018-11-01', '2019-11-01', '55');
INSERT INTO `poliza` VALUES ('77', '1', '3', '11111111', '7667', '2017-11-21', '2018-11-21', '52');
INSERT INTO `poliza` VALUES ('78', '1', '10', '11111111', '7958', '2018-12-23', '2019-12-23', '14');
INSERT INTO `poliza` VALUES ('79', '1', '7', '11111111', '6205', '2017-12-09', '2018-12-09', '34');
INSERT INTO `poliza` VALUES ('80', '1', '9', '30123321', '7856', '2018-08-25', '2019-08-25', '32');
INSERT INTO `poliza` VALUES ('81', '1', '2', '11111111', '6260', '2018-01-23', '2019-01-23', '29');
INSERT INTO `poliza` VALUES ('82', '1', '9', '30123321', '4403', '2018-08-25', '2019-08-25', '30');
INSERT INTO `poliza` VALUES ('83', '1', '3', '30123321', '8457', '2018-03-20', '2019-03-20', '58');
INSERT INTO `poliza` VALUES ('84', '1', '10', '22222222', '4861', '2018-01-02', '2019-01-02', '58');
INSERT INTO `poliza` VALUES ('85', '1', '10', '22222222', '4637', '2017-12-14', '2018-12-14', '68');
INSERT INTO `poliza` VALUES ('86', '1', '2', '22222222', '5587', '2018-08-13', '2019-08-13', '25');
INSERT INTO `poliza` VALUES ('87', '1', '6', '30123321', '9681', '2018-04-02', '2019-04-02', '47');
INSERT INTO `poliza` VALUES ('88', '1', '3', '33333333', '9140', '2018-05-15', '2019-05-15', '65');
INSERT INTO `poliza` VALUES ('89', '1', '7', '11111111', '9832', '2018-08-15', '2019-08-15', '44');
INSERT INTO `poliza` VALUES ('90', '1', '5', '22222222', '4414', '2018-02-09', '2019-02-09', '48');
INSERT INTO `poliza` VALUES ('91', '1', '8', '11111111', '972', '2018-08-12', '2019-08-12', '59');
INSERT INTO `poliza` VALUES ('92', '1', '10', '22222222', '2250', '2018-04-10', '2019-04-10', '42');
INSERT INTO `poliza` VALUES ('93', '1', '1', '11111111', '5006', '2018-07-01', '2019-07-01', '45');
INSERT INTO `poliza` VALUES ('94', '1', '10', '33333333', '3395', '2018-06-12', '2019-06-12', '64');
INSERT INTO `poliza` VALUES ('95', '1', '7', '30123321', '1891', '2017-11-07', '2018-11-07', '56');
INSERT INTO `poliza` VALUES ('96', '1', '4', '11111111', '3504', '2018-09-12', '2019-09-12', '14');
INSERT INTO `poliza` VALUES ('97', '1', '3', '22222222', '6072', '2018-11-08', '2019-11-08', '16');
INSERT INTO `poliza` VALUES ('98', '1', '9', '22222222', '7539', '2017-12-17', '2018-12-17', '61');
INSERT INTO `poliza` VALUES ('99', '1', '8', '30123321', '1148', '2017-11-05', '2018-11-05', '50');
INSERT INTO `poliza` VALUES ('100', '1', '9', '11111111', '8833', '2018-12-16', '2019-12-16', '53');
INSERT INTO `poliza` VALUES ('101', '1', '4', '30123321', '8330', '2017-12-05', '2018-12-05', '26');
INSERT INTO `poliza` VALUES ('102', '1', '4', '33333333', '1161', '2018-02-02', '2019-02-02', '46');
INSERT INTO `poliza` VALUES ('103', '1', '9', '11111111', '9364', '2018-07-19', '2019-07-19', '14');
INSERT INTO `poliza` VALUES ('104', '1', '4', '30123321', '5252', '2018-03-29', '2019-03-29', '35');
INSERT INTO `poliza` VALUES ('105', '1', '6', '30123321', '4464', '2018-08-27', '2019-08-27', '62');
INSERT INTO `poliza` VALUES ('106', '1', '3', '22222222', '5346', '2018-10-02', '2019-10-02', '20');
INSERT INTO `poliza` VALUES ('107', '1', '4', '22222222', '9628', '2017-12-14', '2018-12-14', '19');
INSERT INTO `poliza` VALUES ('108', '1', '4', '22222222', '2801', '2018-09-29', '2019-09-29', '50');
INSERT INTO `poliza` VALUES ('109', '1', '8', '22222222', '4412', '2017-12-30', '2018-12-30', '43');
INSERT INTO `poliza` VALUES ('110', '1', '10', '22222222', '6832', '2018-11-02', '2019-11-02', '40');
INSERT INTO `poliza` VALUES ('111', '1', '4', '22222222', '2357', '2018-07-22', '2019-07-22', '41');
INSERT INTO `poliza` VALUES ('112', '1', '10', '22222222', '8436', '2018-02-02', '2019-02-02', '39');
INSERT INTO `poliza` VALUES ('113', '1', '9', '30123321', '766', '2017-11-02', '2018-11-02', '63');
INSERT INTO `poliza` VALUES ('114', '1', '5', '22222222', '8785', '2018-05-22', '2019-05-22', '19');
INSERT INTO `poliza` VALUES ('115', '1', '9', '11111111', '3494', '2018-06-21', '2019-06-21', '64');
INSERT INTO `poliza` VALUES ('116', '1', '2', '11111111', '7742', '2018-07-08', '2019-07-08', '61');
INSERT INTO `poliza` VALUES ('117', '1', '1', '11111111', '7827', '2018-02-03', '2019-02-03', '15');
INSERT INTO `poliza` VALUES ('118', '1', '2', '33333333', '9104', '2019-01-08', '2020-01-08', '46');
INSERT INTO `poliza` VALUES ('119', '1', '9', '22222222', '6288', '2018-05-03', '2019-05-03', '12');
INSERT INTO `poliza` VALUES ('120', '1', '6', '30123321', '417', '2018-08-05', '2019-08-05', '29');
INSERT INTO `poliza` VALUES ('121', '1', '2', '22222222', '7225', '2018-06-24', '2019-06-24', '38');
INSERT INTO `poliza` VALUES ('122', '1', '6', '30123321', '5925', '2018-09-12', '2019-09-12', '56');
INSERT INTO `poliza` VALUES ('123', '1', '10', '11111111', '7384', '2018-02-18', '2019-02-18', '42');
INSERT INTO `poliza` VALUES ('124', '1', '4', '11111111', '3437', '2018-09-28', '2019-09-28', '61');
INSERT INTO `poliza` VALUES ('125', '1', '4', '22222222', '1757', '2018-06-30', '2019-06-30', '68');
INSERT INTO `poliza` VALUES ('126', '1', '5', '30123321', '5356', '2017-12-16', '2018-12-16', '42');
INSERT INTO `poliza` VALUES ('127', '1', '4', '11111111', '5138', '2018-08-29', '2019-08-29', '56');
INSERT INTO `poliza` VALUES ('128', '1', '6', '30123321', '5631', '2018-08-26', '2019-08-26', '41');
INSERT INTO `poliza` VALUES ('129', '1', '9', '22222222', '4269', '2018-06-29', '2019-06-29', '49');
INSERT INTO `poliza` VALUES ('130', '1', '7', '33333333', '6087', '2018-11-24', '2019-11-24', '59');
INSERT INTO `poliza` VALUES ('131', '1', '3', '11111111', '7051', '2018-08-18', '2019-08-18', '52');
INSERT INTO `poliza` VALUES ('132', '1', '5', '33333333', '5392', '2018-09-24', '2019-09-24', '28');
INSERT INTO `poliza` VALUES ('133', '1', '5', '33333333', '7399', '2018-01-10', '2019-01-10', '63');
INSERT INTO `poliza` VALUES ('134', '1', '3', '11111111', '9280', '2018-01-13', '2019-01-13', '44');
INSERT INTO `poliza` VALUES ('135', '1', '4', '30123321', '7622', '2018-08-04', '2019-08-04', '51');
INSERT INTO `poliza` VALUES ('136', '1', '9', '30123321', '5889', '2018-10-08', '2019-10-08', '44');
INSERT INTO `poliza` VALUES ('137', '1', '6', '22222222', '2589', '2018-08-09', '2019-08-09', '69');
INSERT INTO `poliza` VALUES ('138', '1', '8', '22222222', '9213', '2018-03-29', '2019-03-29', '64');
INSERT INTO `poliza` VALUES ('139', '1', '2', '22222222', '7325', '2018-12-08', '2019-12-08', '68');
INSERT INTO `poliza` VALUES ('140', '1', '6', '30123321', '9729', '2017-11-10', '2018-11-10', '50');
INSERT INTO `poliza` VALUES ('141', '1', '6', '30123321', '7022', '2018-05-25', '2019-05-25', '16');
INSERT INTO `poliza` VALUES ('142', '1', '2', '33333333', '3891', '2018-12-11', '2019-12-11', '44');
INSERT INTO `poliza` VALUES ('143', '1', '4', '22222222', '5158', '2018-05-18', '2019-05-18', '40');
INSERT INTO `poliza` VALUES ('144', '1', '5', '11111111', '4688', '2018-12-13', '2019-12-13', '23');
INSERT INTO `poliza` VALUES ('145', '1', '6', '22222222', '1713', '2018-06-28', '2019-06-28', '10');
INSERT INTO `poliza` VALUES ('146', '1', '9', '33333333', '1558', '2018-06-10', '2019-06-10', '58');
INSERT INTO `poliza` VALUES ('147', '1', '8', '33333333', '9139', '2018-01-22', '2019-01-22', '12');
INSERT INTO `poliza` VALUES ('148', '1', '9', '11111111', '2648', '2018-06-21', '2019-06-21', '12');
INSERT INTO `poliza` VALUES ('149', '1', '8', '30123321', '7584', '2018-01-17', '2019-01-17', '27');
INSERT INTO `poliza` VALUES ('150', '1', '3', '22222222', '230', '2018-07-05', '2019-07-05', '16');
INSERT INTO `poliza` VALUES ('151', '1', '5', '22222222', '4422', '2018-11-27', '2019-11-27', '64');
INSERT INTO `poliza` VALUES ('152', '1', '7', '22222222', '8049', '2018-10-13', '2019-10-13', '25');
INSERT INTO `poliza` VALUES ('153', '1', '2', '11111111', '9158', '2018-10-02', '2019-10-02', '68');
INSERT INTO `poliza` VALUES ('154', '1', '7', '11111111', '8674', '2018-12-28', '2019-12-28', '64');
INSERT INTO `poliza` VALUES ('155', '1', '6', '33333333', '4118', '2018-07-09', '2019-07-09', '42');
INSERT INTO `poliza` VALUES ('156', '1', '5', '30123321', '4247', '2018-02-02', '2019-02-02', '31');
INSERT INTO `poliza` VALUES ('157', '1', '3', '11111111', '5687', '2018-09-03', '2019-09-03', '62');
INSERT INTO `poliza` VALUES ('158', '1', '6', '22222222', '3246', '2018-12-15', '2019-12-15', '42');
INSERT INTO `poliza` VALUES ('159', '1', '10', '22222222', '4122', '2018-08-01', '2019-08-01', '15');
INSERT INTO `poliza` VALUES ('160', '1', '6', '11111111', '3421', '2018-09-13', '2019-09-13', '31');
INSERT INTO `poliza` VALUES ('161', '1', '3', '11111111', '144', '2018-12-14', '2019-12-14', '31');
INSERT INTO `poliza` VALUES ('162', '1', '8', '11111111', '4819', '2018-05-02', '2019-05-02', '25');
INSERT INTO `poliza` VALUES ('163', '1', '10', '33333333', '9516', '2018-03-27', '2019-03-27', '63');
INSERT INTO `poliza` VALUES ('164', '1', '5', '11111111', '8758', '2017-12-25', '2018-12-25', '56');
INSERT INTO `poliza` VALUES ('165', '1', '8', '11111111', '2400', '2018-11-09', '2019-11-09', '27');
INSERT INTO `poliza` VALUES ('166', '1', '1', '11111111', '6278', '2018-01-12', '2019-01-12', '26');
INSERT INTO `poliza` VALUES ('167', '1', '10', '11111111', '8155', '2018-03-24', '2019-03-24', '42');
INSERT INTO `poliza` VALUES ('168', '1', '2', '30123321', '773', '2019-01-09', '2020-01-09', '11');
INSERT INTO `poliza` VALUES ('169', '1', '10', '22222222', '7004', '2018-08-28', '2019-08-28', '28');
INSERT INTO `poliza` VALUES ('170', '1', '9', '22222222', '1867', '2017-11-26', '2018-11-26', '20');
INSERT INTO `poliza` VALUES ('171', '1', '2', '33333333', '9299', '2019-01-08', '2020-01-08', '32');
INSERT INTO `poliza` VALUES ('172', '1', '1', '22222222', '1516', '2019-01-03', '2020-01-03', '15');
INSERT INTO `poliza` VALUES ('173', '1', '6', '22222222', '2770', '2018-09-06', '2019-09-06', '67');
INSERT INTO `poliza` VALUES ('174', '1', '10', '30123321', '6186', '2018-03-10', '2019-03-10', '35');
INSERT INTO `poliza` VALUES ('175', '1', '7', '30123321', '182', '2018-08-08', '2019-08-08', '14');
INSERT INTO `poliza` VALUES ('176', '1', '9', '22222222', '400', '2018-11-30', '2019-11-30', '30');
INSERT INTO `poliza` VALUES ('177', '1', '4', '33333333', '9442', '2017-11-17', '2018-11-17', '56');
INSERT INTO `poliza` VALUES ('178', '1', '7', '22222222', '7352', '2018-01-01', '2019-01-01', '45');
INSERT INTO `poliza` VALUES ('179', '1', '6', '11111111', '570', '2018-12-24', '2019-12-24', '61');
INSERT INTO `poliza` VALUES ('180', '1', '8', '33333333', '9899', '2018-01-06', '2019-01-06', '58');
INSERT INTO `poliza` VALUES ('181', '1', '8', '30123321', '8364', '2018-07-27', '2019-07-27', '22');
INSERT INTO `poliza` VALUES ('182', '1', '5', '30123321', '811', '2018-04-01', '2019-04-01', '30');
INSERT INTO `poliza` VALUES ('183', '1', '2', '33333333', '4507', '2018-12-14', '2019-12-14', '45');
INSERT INTO `poliza` VALUES ('184', '1', '6', '22222222', '836', '2017-11-20', '2018-11-20', '50');
INSERT INTO `poliza` VALUES ('185', '1', '7', '11111111', '6841', '2017-12-17', '2018-12-17', '36');
INSERT INTO `poliza` VALUES ('186', '1', '1', '33333333', '4021', '2018-01-09', '2019-01-09', '26');
INSERT INTO `poliza` VALUES ('187', '1', '8', '11111111', '2755', '2018-03-08', '2019-03-08', '29');
INSERT INTO `poliza` VALUES ('188', '1', '9', '33333333', '3996', '2018-01-24', '2019-01-24', '65');
INSERT INTO `poliza` VALUES ('189', '1', '6', '30123321', '3672', '2017-12-04', '2018-12-04', '40');
INSERT INTO `poliza` VALUES ('190', '1', '10', '33333333', '200', '2018-12-25', '2019-12-25', '67');
INSERT INTO `poliza` VALUES ('191', '1', '9', '30123321', '5572', '2018-02-13', '2019-02-13', '22');
INSERT INTO `poliza` VALUES ('192', '1', '9', '33333333', '5819', '2018-05-01', '2019-05-01', '69');
INSERT INTO `poliza` VALUES ('193', '1', '1', '33333333', '5953', '2018-06-09', '2019-06-09', '50');
INSERT INTO `poliza` VALUES ('194', '1', '5', '33333333', '7915', '2018-06-17', '2019-06-17', '65');
INSERT INTO `poliza` VALUES ('195', '1', '8', '33333333', '5423', '2018-02-24', '2019-02-24', '64');
INSERT INTO `poliza` VALUES ('196', '1', '1', '22222222', '5916', '2018-02-03', '2019-02-03', '48');
INSERT INTO `poliza` VALUES ('197', '1', '6', '33333333', '7596', '2017-12-21', '2018-12-21', '26');
INSERT INTO `poliza` VALUES ('198', '1', '8', '22222222', '9238', '2018-11-06', '2019-11-06', '32');
INSERT INTO `poliza` VALUES ('199', '1', '2', '30123321', '6148', '2018-01-10', '2019-01-10', '34');