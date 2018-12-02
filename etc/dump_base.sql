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
