SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `MedicWebApp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `MedicWebApp` ;

-- -----------------------------------------------------
-- Table `MedicWebApp`.`Client`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MedicWebApp`.`Client` (
  `idClient` INT NOT NULL ,
  `firstName` VARCHAR(45) NOT NULL ,
  `lastName` VARCHAR(45) NOT NULL ,
  `birthDate` DATE NOT NULL ,
  `phoneNumber` INT NOT NULL ,
  `email` VARCHAR(250) NOT NULL ,
  `address` VARCHAR(250) NOT NULL ,
  `bloodType` ENUM('O+','O-','A+','A-','B+','B-','AB+','AB-') NOT NULL ,
  `occupation` VARCHAR(45) NULL ,
  `contactID` INT NULL ,
  `height` DECIMAL(10,0) NULL ,
  `sex` ENUM('F','M') NOT NULL ,
  PRIMARY KEY (`idClient`) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicWebApp`.`Allergies`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MedicWebApp`.`Allergies` (
  `ID` INT NOT NULL ,
  `description` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`ID`) ,
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicWebApp`.`Client_has_Allergies`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MedicWebApp`.`Client_has_Allergies` (
  `Client_idClient` INT NOT NULL ,
  `Allergies_ID` INT NOT NULL ,
  PRIMARY KEY (`Client_idClient`, `Allergies_ID`) ,
  INDEX `fk_Client_has_Allergies_Allergies1_idx` (`Allergies_ID` ASC) ,
  INDEX `fk_Client_has_Allergies_Client1_idx` (`Client_idClient` ASC) ,
  CONSTRAINT `fk_Client_has_Allergies_Client1`
    FOREIGN KEY (`Client_idClient` )
    REFERENCES `MedicWebApp`.`Client` (`idClient` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_has_Allergies_Allergies1`
    FOREIGN KEY (`Allergies_ID` )
    REFERENCES `MedicWebApp`.`Allergies` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicWebApp`.`Problem`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MedicWebApp`.`Problem` (
  `idProblem` INT NOT NULL ,
  `problemName` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`idProblem`) ,
  UNIQUE INDEX `idProblem_UNIQUE` (`idProblem` ASC) ,
  UNIQUE INDEX `problemName_UNIQUE` (`problemName` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicWebApp`.`Problem_has_Client`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MedicWebApp`.`Problem_has_Client` (
  `Problem_idProblem` INT NOT NULL ,
  `Client_idClient` INT NOT NULL ,
  PRIMARY KEY (`Problem_idProblem`, `Client_idClient`) ,
  INDEX `fk_Problem_has_Client_Client1_idx` (`Client_idClient` ASC) ,
  INDEX `fk_Problem_has_Client_Problem1_idx` (`Problem_idProblem` ASC) ,
  CONSTRAINT `fk_Problem_has_Client_Problem1`
    FOREIGN KEY (`Problem_idProblem` )
    REFERENCES `MedicWebApp`.`Problem` (`idProblem` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Problem_has_Client_Client1`
    FOREIGN KEY (`Client_idClient` )
    REFERENCES `MedicWebApp`.`Client` (`idClient` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicWebApp`.`Notes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MedicWebApp`.`Notes` (
  `noteID` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `noteTitle` VARCHAR(45) NOT NULL ,
  `noteContent` TEXT NOT NULL ,
  `Client_idClient` INT NOT NULL ,
  PRIMARY KEY (`noteID`) ,
  UNIQUE INDEX `noteID_UNIQUE` (`noteID` ASC) ,
  INDEX `fk_Notes_Client1_idx` (`Client_idClient` ASC) ,
  CONSTRAINT `fk_Notes_Client1`
    FOREIGN KEY (`Client_idClient` )
    REFERENCES `MedicWebApp`.`Client` (`idClient` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicWebApp`.`FacesImgs`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MedicWebApp`.`FacesImgs` (
  `ID` INT NOT NULL ,
  `image` BLOB NOT NULL ,
  `Client_idClient` INT NOT NULL ,
  PRIMARY KEY (`ID`) ,
  INDEX `fk_FacesImgs_Client1_idx` (`Client_idClient` ASC) ,
  CONSTRAINT `fk_FacesImgs_Client1`
    FOREIGN KEY (`Client_idClient` )
    REFERENCES `MedicWebApp`.`Client` (`idClient` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicWebApp`.`Drug`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MedicWebApp`.`Drug` (
  `idDrug` VARCHAR(45) NOT NULL ,
  `drugName` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idDrug`) ,
  UNIQUE INDEX `drugName_UNIQUE` (`drugName` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicWebApp`.`prescription`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MedicWebApp`.`prescription` (
  `Drug_idDrug` VARCHAR(45) NOT NULL ,
  `Client_idClient` INT NOT NULL ,
  `dosage` VARCHAR(45) NOT NULL ,
  `frequency` VARCHAR(45) NOT NULL ,
  `beganOn` DATE NOT NULL ,
  `reason` VARCHAR(45) NOT NULL ,
  `sideEffect` VARCHAR(45) NOT NULL ,
  `Notes_noteID` INT UNSIGNED NULL ,
  PRIMARY KEY (`Drug_idDrug`, `Client_idClient`) ,
  INDEX `fk_Drug_has_Client_Client1_idx` (`Client_idClient` ASC) ,
  INDEX `fk_Drug_has_Client_Drug1_idx` (`Drug_idDrug` ASC) ,
  INDEX `fk_prescription_Notes1_idx` (`Notes_noteID` ASC) ,
  CONSTRAINT `fk_Drug_has_Client_Drug1`
    FOREIGN KEY (`Drug_idDrug` )
    REFERENCES `MedicWebApp`.`Drug` (`idDrug` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Drug_has_Client_Client1`
    FOREIGN KEY (`Client_idClient` )
    REFERENCES `MedicWebApp`.`Client` (`idClient` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prescription_Notes1`
    FOREIGN KEY (`Notes_noteID` )
    REFERENCES `MedicWebApp`.`Notes` (`noteID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicWebApp`.`Institution`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MedicWebApp`.`Institution` (
  `idInstitution` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `address` VARCHAR(45) NOT NULL ,
  `phoneNumber` VARCHAR(45) NULL ,
  `webPage` VARCHAR(45) NULL ,
  PRIMARY KEY (`idInstitution`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicWebApp`.`Medic`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MedicWebApp`.`Medic` (
  `idMedic` INT NOT NULL ,
  `firstName` VARCHAR(45) NOT NULL ,
  `lastName` VARCHAR(45) NOT NULL ,
  `phoneNumber` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `address` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idMedic`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicWebApp`.`Records`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MedicWebApp`.`Records` (
  `idRecords` INT NOT NULL AUTO_INCREMENT,
  `blob` BLOB NOT NULL ,
  `Client_idClient` INT NOT NULL ,
  `Institution_idInstitution` INT NOT NULL ,
  `Medic_idMedic` INT NOT NULL ,
  PRIMARY KEY (`Client_idClient`, `Institution_idInstitution`, `Medic_idMedic`) ,
  INDEX `fk_Records_Client1_idx` (`Client_idClient` ASC) ,
  INDEX `fk_Records_Institution1_idx` (`Institution_idInstitution` ASC) ,
  INDEX `fk_Records_Medic1_idx` (`Medic_idMedic` ASC) ,
  UNIQUE INDEX `idRecords_UNIQUE` (`idRecords` ASC) ,
  CONSTRAINT `fk_Records_Client1`
    FOREIGN KEY (`Client_idClient` )
    REFERENCES `MedicWebApp`.`Client` (`idClient` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Records_Institution1`
    FOREIGN KEY (`Institution_idInstitution` )
    REFERENCES `MedicWebApp`.`Institution` (`idInstitution` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Records_Medic1`
    FOREIGN KEY (`Medic_idMedic` )
    REFERENCES `MedicWebApp`.`Medic` (`idMedic` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicWebApp`.`Institution_has_Client`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MedicWebApp`.`Institution_has_Client` (
  `Institution_idInstitution` INT NOT NULL ,
  `Client_idClient` INT NOT NULL ,
  PRIMARY KEY (`Institution_idInstitution`, `Client_idClient`) ,
  INDEX `fk_Institution_has_Client_Client1_idx` (`Client_idClient` ASC) ,
  INDEX `fk_Institution_has_Client_Institution1_idx` (`Institution_idInstitution` ASC) ,
  CONSTRAINT `fk_Institution_has_Client_Institution1`
    FOREIGN KEY (`Institution_idInstitution` )
    REFERENCES `MedicWebApp`.`Institution` (`idInstitution` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Institution_has_Client_Client1`
    FOREIGN KEY (`Client_idClient` )
    REFERENCES `MedicWebApp`.`Client` (`idClient` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicWebApp`.`Institution_has_Medic`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MedicWebApp`.`Institution_has_Medic` (
  `Institution_idInstitution` INT NOT NULL ,
  `Medic_idMedic` INT NOT NULL ,
  PRIMARY KEY (`Institution_idInstitution`, `Medic_idMedic`) ,
  INDEX `fk_Institution_has_Medic_Medic1_idx` (`Medic_idMedic` ASC) ,
  INDEX `fk_Institution_has_Medic_Institution1_idx` (`Institution_idInstitution` ASC) ,
  CONSTRAINT `fk_Institution_has_Medic_Institution1`
    FOREIGN KEY (`Institution_idInstitution` )
    REFERENCES `MedicWebApp`.`Institution` (`idInstitution` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Institution_has_Medic_Medic1`
    FOREIGN KEY (`Medic_idMedic` )
    REFERENCES `MedicWebApp`.`Medic` (`idMedic` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `MedicWebApp` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
