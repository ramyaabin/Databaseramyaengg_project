-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db-capstone-project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db-capstone-project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db-capstone-project` DEFAULT CHARACTER SET utf8 ;
USE `db-capstone-project` ;

-- -----------------------------------------------------
-- Table `db-capstone-project`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `StaffName` VARCHAR(255) NOT NULL,
  `StaffRole` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Customers` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  `OrderQuantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  PRIMARY KEY (`OrderID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `BookingDate` DATETIME NOT NULL,
  `TableNumber` INT NOT NULL,
  `SaffID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `StaffID_idx` (`SaffID` ASC) VISIBLE,
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `StaffID`
    FOREIGN KEY (`SaffID`)
    REFERENCES `db-capstone-project`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `db-capstone-project`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `db-capstone-project`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`OrderaDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`OrderaDeliveryStatus` (
  `DeliveryDate` DATETIME NOT NULL,
  `OrderStatus` VARCHAR(45) NOT NULL,
  `Orders_OrderID` INT NOT NULL,
  PRIMARY KEY (`Orders_OrderID`),
  CONSTRAINT `fk_OrderaDeliveryStatus_Orders`
    FOREIGN KEY (`Orders_OrderID`)
    REFERENCES `db-capstone-project`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`MenuItems` (
  `MenuItemID` INT NOT NULL,
  `Cuisine` VARCHAR(45) NOT NULL,
  `ItemName` VARCHAR(55) NOT NULL,
  `ItemType` VARCHAR(45) NOT NULL,
  `ItemDescription` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`MenuOrders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`MenuOrders` (
  `MenuOrderID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `MenuItemID` INT NOT NULL,
  PRIMARY KEY (`MenuOrderID`),
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  INDEX `MenuItemID_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `db-capstone-project`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MenuItemID`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `db-capstone-project`.`MenuItems` (`MenuItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
