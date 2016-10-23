-- MySQL Script generated by MySQL Workbench
-- Sun Oct 23 11:41:31 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema default_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema default_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `default_schema` ;
SHOW WARNINGS;
USE `default_schema` ;

-- -----------------------------------------------------
-- Table `resu_day_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_day_option` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `abbr` VARCHAR(3) NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_day_option` (`id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `resu_hour_value`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_hour_value` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_hour_value` (`id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `resu_location_day`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_location_day` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resu_day_option_id` INT(11) UNSIGNED NOT NULL,
  `resu_location_id` INT(10) UNSIGNED NOT NULL,
  `resu_hour_value_id` INT(11) UNSIGNED NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_location_day_resu_location1`
    FOREIGN KEY (`resu_location_id`)
    REFERENCES `resu_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_day_resu_day_option1`
    FOREIGN KEY (`resu_day_option_id`)
    REFERENCES `resu_day_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_day_resu_hour_value1`
    FOREIGN KEY (`resu_hour_value_id`)
    REFERENCES `resu_hour_value` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_location_day` (`id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_resu_location_day_resu_location1_idx` ON `resu_location_day` (`resu_location_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_resu_location_day_resu_day_option1_idx` ON `resu_location_day` (`resu_day_option_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_resu_location_day_resu_hour_value1_idx` ON `resu_location_day` (`resu_hour_value_id` ASC);

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;