-- MySQL dump 10.13  Distrib 9.0.1, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `BookingDate` date NOT NULL,
  `TableNum` int NOT NULL,
  `CustomerID` int NOT NULL,
  `StaffID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `FK_Customer_ID_idx` (`CustomerID`),
  KEY `FK_Staff_ID_idx` (`StaffID`),
  CONSTRAINT `FK_Customer_ID2` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Staff_ID` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2022-10-10',5,1,3),(2,'2022-11-12',3,3,4),(3,'2022-10-11',2,2,5),(4,'2022-10-13',2,1,2),(5,'2022-10-13',2,3,4),(11,'2022-10-10',7,3,4);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customerbigspend`
--

DROP TABLE IF EXISTS `customerbigspend`;
/*!50001 DROP VIEW IF EXISTS `customerbigspend`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerbigspend` AS SELECT 
 1 AS `CustomerID`,
 1 AS `FullName`,
 1 AS `OrderID`,
 1 AS `Cost`,
 1 AS `MenuName`,
 1 AS `CourseName`,
 1 AS `Starter`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `CustomerFullName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(255) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Laney Fadden','lfadden@fake.com','5720557985'),(2,'Giacopo Bramich','gbramich@fake.com','5653530657'),(3,'Lia Bonar','lbonar@fake.com','5908766799'),(4,'Merrill Baudon','mbaudon@fake.com','5738734827'),(5,'Tasia Fautly','tfautly@fake.com','5809275246'),(6,'Angel Veschambre','aveschambre@fake.com','5771112020'),(7,'Sheilah Maestro','smaestro@fake.com','5103414047'),(8,'Audie Willcocks','awillcocks@fake.com','5838004789'),(9,'Mart Malsher','mmalsher@fake.com','5898964591'),(10,'Magdalen Lacheze','mlacheze@fake.com','5212821343'),(11,'Margarita Mancktelow','mmancktelow@fake.com','5046992162'),(12,'Ashil Brogini','abrogini@fake.com','5720133529'),(13,'Arthur Mathewson','amathewson@fake.com','5096888521'),(14,'Ennis Dungate','edungate@fake.com','5083904691');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `DeliveryID` int NOT NULL AUTO_INCREMENT,
  `DeliveryStatus` varchar(255) NOT NULL,
  `DeliveryDate` date NOT NULL,
  PRIMARY KEY (`DeliveryID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'Delivered','2020-06-21'),(2,'Pending','2020-09-16'),(3,'Transit','2021-09-07'),(4,'Delivered','2021-09-02'),(5,'Pending','2021-01-01'),(6,'Transit','2020-03-09'),(7,'Delivered','2021-10-11'),(8,'Pending','2021-10-15'),(9,'Transit','2022-01-11'),(10,'Delivered','2020-03-10'),(11,'Pending','2019-08-08'),(12,'Transit','2022-07-05'),(13,'Delivered','2020-12-12'),(14,'Pending','2022-04-26'),(15,'Transit','2020-09-02');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `MenuID` int NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(255) NOT NULL,
  `Cuisine` varchar(255) NOT NULL,
  `MenuItemsID` int NOT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `FK_MenuItemsID_idx` (`MenuItemsID`),
  CONSTRAINT `FK_MenuItemsID` FOREIGN KEY (`MenuItemsID`) REFERENCES `menuitems` (`MenuItemsID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Bean soup','Greek',1),(2,'Pizza','Greek',7),(3,'Carbonara','Greek',10),(4,'Kabasa','Greek',12),(5,'Shwarma','Italian',3),(6,'Greek salad','Italian',9),(7,'Olives','Italian',6),(8,'Flatbread','Italian',8),(9,'Minestrone','Turkish',5),(10,'Tomato bread','Turkish',2),(11,'Falafel','Turkish',11),(12,'Tomato','Turkish',4);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitems` (
  `MenuItemsID` int NOT NULL AUTO_INCREMENT,
  `Course` varchar(255) NOT NULL,
  `Starter` varchar(255) NOT NULL,
  `Dessert` varchar(255) NOT NULL,
  `Drink` varchar(255) NOT NULL,
  PRIMARY KEY (`MenuItemsID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
INSERT INTO `menuitems` VALUES (1,'Greek salad','Olives','Greek yoghurt','Athens White wine'),(2,'Bean soup','Flatbread','Ice cream','Corfu Red Wine'),(3,'Pizza','Minestrone','Cheesecake','Italian Coffee'),(4,'Carbonara','Tomato bread','Affogato','Roma Red wine'),(5,'Kabasa','Falafel','Turkish yoghurt','Ankara White Wine'),(6,'Shwarma','Hummus','Baklava','Turkish Coffee'),(7,'Greek salad','Olives','Greek yoghurt','Athens White wine'),(8,'Bean soup','Flatbread','Ice cream','Corfu Red Wine'),(9,'Pizza','Minestrone','Cheesecake','Italian Coffee'),(10,'Carbonara','Tomato bread','Affogato','Roma Red wine'),(11,'Kabasa','Falafel','Turkish yoghurt','Ankara White Wine'),(12,'Shwarma','Hummus','Baklava','Turkish Coffee');
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `MenuID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `DeliveryID` int NOT NULL,
  `OrderDate` date NOT NULL,
  `Quantity` int NOT NULL,
  `TotalCost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_Delivery_ID_idx` (`DeliveryID`),
  KEY `FK_Menu_ID_idx` (`MenuID`),
  KEY `FK_Customer_ID_idx` (`CustomerID`),
  CONSTRAINT `FK_Customer_ID` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Delivery_ID` FOREIGN KEY (`DeliveryID`) REFERENCES `delivery` (`DeliveryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Menu_ID` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,2,1,'2020-06-15',2,187.50),(2,5,12,2,'2020-08-25',1,352.50),(3,7,6,3,'2021-08-17',3,112.50),(4,8,13,4,'2021-08-14',3,330.00),(6,10,14,6,'2020-03-01',1,315.00),(7,9,9,7,'2021-10-04',2,465.00),(8,1,8,8,'2021-10-09',3,337.50),(9,3,4,9,'2021-12-27',2,285.00),(10,3,1,10,'2020-03-05',1,147.00),(11,5,9,11,'2019-07-20',3,252.41),(12,1,9,12,'2022-06-26',3,152.40),(13,7,8,13,'2020-12-03',2,139.70),(14,3,5,14,'2022-04-13',1,66.86),(15,5,8,15,'2020-08-22',1,137.76);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `OrderID`,
 1 AS `Quantity`,
 1 AS `Cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `popularmenus`
--

DROP TABLE IF EXISTS `popularmenus`;
/*!50001 DROP VIEW IF EXISTS `popularmenus`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `popularmenus` AS SELECT 
 1 AS `MenuName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `StaffFullName` varchar(255) NOT NULL,
  `Role` varchar(255) NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Roddie Winterbotham','Manager',80000.00),(2,'Pincas Stearn','Asst Manager',65000.00),(3,'Tony Crabtree','Chef',75000.00),(4,'Tamarah Filasov','Receptionist',25000.00),(5,'Pen Pruce','Server',40000.00),(6,'Boot Burree','Server',35000.00),(7,'Sabra Calbreath','Host',25000.00),(8,'Obidiah Zanicchi','Cook',38000.00),(9,'Anders Stowe','Cook',37000.00),(10,'Locke Janaway','Sous Chef',60000.00),(11,'Kaylyn Colebourne','Server',50000.00);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'littlelemondb'
--

--
-- Dumping routines for database 'littlelemondb'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(IN InBookingID INT, IN InCustomerID INT, IN InBookingDate DATE, IN InTableNum INT, IN InStaffID INT)
BEGIN
    START TRANSACTION;
        INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNum, StaffID)
        VALUES (InBookingID, InCustomerID, InBookingDate, InTableNum, InStaffID);
    COMMIT;
    SELECT 'New Booking Added' AS Confirmation;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddValidBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddValidBooking`(IN InDate DATE, IN InTableNum INT)
BEGIN
    DECLARE msg VARCHAR(255);
    DECLARE state INT;
    SET state = 0;
    IF ((
        SELECT TableNum
        FROM Bookings
        WHERE (BookingDate=InDate AND TableNum=InTableNum)) IS NULL)

        THEN
            SET state = 0;
        ELSE
            SET state = 1;
        END IF;
    START TRANSACTION;

    INSERT INTO Bookings (BookingDate, TableNum, CustomerID, StaffID) VALUES (InDate, InTableNum, 3, 4);

    IF (state = 0)
        THEN
            SET @msg=CONCAT('Table ', InTableNum, ' is now booked on ', InDate);
            COMMIT;
        ELSE
            SET @msg=CONCAT('Table ', InTableNum, ' is already booked');
            ROLLBACK;
        END IF;

    SELECT @msg AS 'Booking Status';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN InBookingID INT )
BEGIN
    DECLARE msg VARCHAR(255);
    DECLARE state INT;
    SET state = 0;
    IF ((
        SELECT TableNum
        FROM Bookings
        WHERE BookingID=InBookingID) IS NULL)

        THEN
            SET state = 0;
        ELSE
            SET state = 1;
        END IF;
    START TRANSACTION;
    IF (state = 1)
        THEN
            DELETE FROM Bookings
            WHERE BookingID=InBookingID;
            SET @msg=CONCAT('Booking ', InBookingID, ' cancelled');
            COMMIT;
        ELSE
            SET @msg=CONCAT('Booking ', InBookingID, ' not found');
            ROLLBACK;
    END IF;
    SELECT @msg AS Confirmation;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelOrder`(IN ParOrderID INT)
BEGIN
    DELETE FROM Orders WHERE OrderID=ParOrderID;
	SET @Msg = CONCAT ('Order ', ParOrderID, ' is cancelled');
	SELECT @Msg AS Confirmation;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckBooking`(IN InDate DATE, IN InTableNum INT)
BEGIN
    DECLARE msg VARCHAR(255);
    
    IF ((
        SELECT TableNum
        FROM Bookings
        WHERE (BookingDate=InDate AND TableNum=InTableNum)) IS NULL)

        THEN
            SET @msg=CONCAT('Table ', InTableNum, ' is available');
        ELSE
            SET @msg=CONCAT('Table ', InTableNum, ' is already booked');
        END IF;

    SELECT @msg AS 'Booking Status';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Deleterecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deleterecord`(IN ParOrderID INT)
BEGIN
    DELETE FROM Orders WHERE OrderID=ParOrderID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMaxQuantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin1`@`%` PROCEDURE `GetMaxQuantity`()
SELECT MAX(Quantity) AS 'Max Quantity in Order' FROM Orders ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageBooking`(IN InDate DATE, IN InTableNum INT)
BEGIN
            DECLARE msg VARCHAR(255);
            DECLARE state INT;
            SET state = 0;
            IF ((
                SELECT TableNum
                FROM Bookings
                WHERE (BookingDate=InDate AND TableNum=InTableNum)) IS NULL)

                THEN
                    SET state = 0;
                ELSE
                    SET state = 1;
                END IF;
            START TRANSACTION;

            INSERT INTO Bookings (BookingDate, TableNum, CustomerID, StaffID) VALUES (InDate, InTableNum, 3, 4);

            IF (state = 0)
                THEN
                    SET @msg=CONCAT('Table ', InTableNum, ' is now booked on ', InDate);
                    COMMIT;
                ELSE
                    SET @msg=CONCAT('Table ', InTableNum, ' is already booked');
                    ROLLBACK;
                END IF;

            SELECT @msg AS 'Booking Status';
        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PrintMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrintMessage`(IN OrderID INT)
BEGIN
    SET @Msg = CONCAT ('Order ',OrderID, ' is cancelled');
	SELECT @Msg AS Confirmation;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(IN InBookingID INT, IN InBookingDate DATE )
BEGIN
    DECLARE msg VARCHAR(255);
    DECLARE state INT;
    SET state = 0;
    IF ((
        SELECT TableNum
        FROM Bookings
        WHERE BookingID=InBookingID) IS NULL)

        THEN
            SET state = 0;
        ELSE
            SET state = 1;
        END IF;
    START TRANSACTION;
    IF (state = 1)
        THEN
            UPDATE Bookings
            SET BookingDate=InBookingDate
            WHERE BookingID=InBookingID;
            SET @msg=CONCAT('Booking ', InBookingID, ' updated');
            COMMIT;
        ELSE
            SET @msg=CONCAT('Booking ', InBookingID, ' not found');
            ROLLBACK;
    END IF;
    SELECT @msg AS Confirmation;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customerbigspend`
--

/*!50001 DROP VIEW IF EXISTS `customerbigspend`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `customerbigspend` AS select `customers`.`CustomerID` AS `CustomerID`,`customers`.`CustomerFullName` AS `FullName`,`orders`.`OrderID` AS `OrderID`,`orders`.`TotalCost` AS `Cost`,`menu`.`MenuName` AS `MenuName`,`menuitems`.`Course` AS `CourseName`,`menuitems`.`Starter` AS `Starter` from (((`customers` join `orders` on((`customers`.`CustomerID` = `orders`.`CustomerID`))) join `menu` on((`orders`.`MenuID` = `menu`.`MenuID`))) join `menuitems` on((`menu`.`MenuItemsID` = `menuitems`.`MenuItemsID`))) where (`orders`.`TotalCost` > 150.00) order by `orders`.`TotalCost` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `orders`.`OrderID` AS `OrderID`,`orders`.`Quantity` AS `Quantity`,`orders`.`TotalCost` AS `Cost` from `orders` where (`orders`.`Quantity` > 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `popularmenus`
--

/*!50001 DROP VIEW IF EXISTS `popularmenus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `popularmenus` AS select `menu`.`MenuName` AS `MenuName` from `menu` where `menu`.`MenuID` in (select `orders`.`MenuID` from `orders` where (`orders`.`Quantity` > 2)) */;
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

-- Dump completed on 2024-12-14 15:45:32
