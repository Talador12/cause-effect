SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Rule`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Rule` (
  `rID` INT NOT NULL AUTO_INCREMENT ,
  `treeData` VARCHAR(100) NOT NULL ,
  `name` VARCHAR(45) NOT NULL DEFAULT 'Rule' ,
  PRIMARY KEY (`rID`) ,
  UNIQUE INDEX `ruleID_UNIQUE` (`rID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Account`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Account` (
  `accountID` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(30) NOT NULL ,
  `url` VARCHAR(200) NOT NULL ,
  `username` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`accountID`) ,
  UNIQUE INDEX `aID_UNIQUE` (`accountID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cause`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Cause` (
  `causeID` INT NOT NULL AUTO_INCREMENT ,
  `type` VARCHAR(45) NULL ,
  `name` VARCHAR(45) NULL ,
  `description` VARCHAR(200) NULL ,
  `category` VARCHAR(45) NULL ,
  `accountID` VARCHAR(45) NULL ,
  PRIMARY KEY (`causeID`) ,
  UNIQUE INDEX `causeID_UNIQUE` (`causeID` ASC) ,
  INDEX `fk_Cause_Account1_idx` (`accountID` ASC) ,
  CONSTRAINT `fk_Cause_Account1`
    FOREIGN KEY (`accountID` )
    REFERENCES `mydb`.`Account` (`accountID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rCause`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`rCause` (
  `rCauseID` INT NOT NULL AUTO_INCREMENT ,
  `rID` INT NOT NULL ,
  `causeID` INT NOT NULL ,
  `paramaters` VARCHAR(200) NULL ,
  PRIMARY KEY (`rCauseID`) ,
  UNIQUE INDEX `rCauseID_UNIQUE` (`rCauseID` ASC) ,
  INDEX `fk_rCause_Cause_idx` (`causeID` ASC) ,
  INDEX `fk_rCause_Rule1_idx` (`rID` ASC) ,
  CONSTRAINT `fk_rCause_Cause`
    FOREIGN KEY (`causeID` )
    REFERENCES `mydb`.`Cause` (`causeID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rCause_Rule1`
    FOREIGN KEY (`rID` )
    REFERENCES `mydb`.`Rule` (`rID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Effect`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Effect` (
  `effectID` INT NOT NULL AUTO_INCREMENT ,
  `type` VARCHAR(45) NULL ,
  `name` VARCHAR(45) NULL ,
  `description` VARCHAR(200) NULL ,
  `category` VARCHAR(45) NULL ,
  `accountID` VARCHAR(45) NULL ,
  PRIMARY KEY (`effectID`) ,
  UNIQUE INDEX `causeID_UNIQUE` (`effectID` ASC) ,
  INDEX `fk_Effect_Account1_idx` (`accountID` ASC) ,
  CONSTRAINT `fk_Effect_Account1`
    FOREIGN KEY (`accountID` )
    REFERENCES `mydb`.`Account` (`accountID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rEffect`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`rEffect` (
  `rEffectID` INT NOT NULL AUTO_INCREMENT ,
  `rID` INT NOT NULL ,
  `effectID` INT NOT NULL ,
  `paramaters` VARCHAR(200) NULL ,
  PRIMARY KEY (`rEffectID`) ,
  UNIQUE INDEX `rCauseID_UNIQUE` (`rEffectID` ASC) ,
  INDEX `fk_rEffect_Effect1_idx` (`effectID` ASC) ,
  INDEX `fk_rEffect_Rule1_idx` (`rID` ASC) ,
  CONSTRAINT `fk_rEffect_Effect1`
    FOREIGN KEY (`effectID` )
    REFERENCES `mydb`.`Effect` (`effectID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rEffect_Rule1`
    FOREIGN KEY (`rID` )
    REFERENCES `mydb`.`Rule` (`rID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
