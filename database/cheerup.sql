-- MySQL Script generated by MySQL Workbench
-- Wed Aug 30 00:10:35 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cheerup
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cheerup
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cheerup` DEFAULT CHARACTER SET utf8 ;
USE `cheerup` ;

-- -----------------------------------------------------
-- Table `cheerup`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cheerup`.`member` (
  `studentID` VARCHAR(45) NOT NULL,
  `id` VARCHAR(45) NOT NULL,
  `nickName` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`studentID`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `studentID_UNIQUE` (`studentID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cheerup`.`review_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cheerup`.`review_info` (
  `pageNumber` INT NOT NULL,
  `content` LONGTEXT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `uploadDate` DATETIME NOT NULL,
  `nickName` VARCHAR(45) NOT NULL,
  `file` MEDIUMBLOB NOT NULL,
  PRIMARY KEY (`pageNumber`),
  INDEX `fk_reviewInfo_member_idx` (`nickName` ASC) VISIBLE,
  CONSTRAINT `fk_reviewInfo_member`
    FOREIGN KEY (`nickName`)
    REFERENCES `cheerup`.`member` (`studentID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cheerup`.`member_widthdraw`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cheerup`.`member_widthdraw` (
  `studentID` VARCHAR(45) NOT NULL,
  `widhdrawDate` VARCHAR(45) NULL,
  `withdrawReason` VARCHAR(45) NULL,
  `member_studentID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`studentID`, `member_studentID`),
  INDEX `fk_member_widthdraw_member1_idx` (`member_studentID` ASC) VISIBLE,
  CONSTRAINT `fk_member_widthdraw_member1`
    FOREIGN KEY (`member_studentID`)
    REFERENCES `cheerup`.`member` (`studentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
