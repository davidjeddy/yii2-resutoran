-- MySQL Script generated by MySQL Workbench
-- Sun Oct 23 11:04:02 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema zeroforksgiven
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema zeroforksgiven
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zeroforksgiven` DEFAULT CHARACTER SET latin1 ;
USE `zeroforksgiven` ;

-- -----------------------------------------------------
-- Table `resu_alcohol_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_alcohol_option` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_alcohol_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_ambiance_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_ambiance_option` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_ambiance_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_boolean_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_boolean_option` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_boolean_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_contact` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `country_code` INT(2) NOT NULL,
  `phone1` INT(11) NOT NULL,
  `phone2` INT(11) NULL DEFAULT NULL,
  `phone3` INT(11) NULL DEFAULT NULL,
  `address1` TEXT NULL DEFAULT NULL,
  `address2` TEXT NULL DEFAULT NULL,
  `address3` TEXT NULL DEFAULT NULL,
  `country` TEXT NULL DEFAULT NULL,
  `city` TEXT NULL DEFAULT NULL,
  `prov` VARCHAR(2) NULL DEFAULT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_contact` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_cuisine_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_cuisine_option` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_cuisine_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_days_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_days_option` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_days_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_decor_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_decor_option` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_decor_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_dress_code_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_dress_code_option` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_dress_code_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_franchise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_franchise` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `idresu_franchise_UNIQUE` ON `resu_franchise` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_hours_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_hours_option` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `open` VARCHAR(5) NOT NULL,
  `close` VARCHAR(5) NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_hours_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_map`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_map` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `provider` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_map` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_price_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_price_option` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` DECIMAL(6,2) NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_price_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_location` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `resu_franchise_id` INT(10) UNSIGNED NOT NULL,
  `resu_contact_id` INT(10) UNSIGNED NOT NULL,
  `resu_price_option_id` INT(10) UNSIGNED NOT NULL,
  `resu_decor_option_id` INT(10) UNSIGNED NOT NULL,
  `resu_ambiance_option_id` INT(10) UNSIGNED NOT NULL,
  `resu_map_id` INT(11) UNSIGNED NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_location_resu_ambiance_option1`
    FOREIGN KEY (`resu_ambiance_option_id`)
    REFERENCES `resu_ambiance_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_resu_contact1`
    FOREIGN KEY (`resu_contact_id`)
    REFERENCES `resu_contact` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_resu_decor_option1`
    FOREIGN KEY (`resu_decor_option_id`)
    REFERENCES `resu_decor_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_resu_franchise`
    FOREIGN KEY (`resu_franchise_id`)
    REFERENCES `resu_franchise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_resu_map1`
    FOREIGN KEY (`resu_map_id`)
    REFERENCES `resu_map` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_resu_price_option1`
    FOREIGN KEY (`resu_price_option_id`)
    REFERENCES `resu_price_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_location` (`id` ASC);

CREATE INDEX `fk_resu_location_resu_franchise_idx` ON `resu_location` (`resu_franchise_id` ASC);

CREATE INDEX `fk_resu_location_resu_contact1_idx` ON `resu_location` (`resu_contact_id` ASC);

CREATE INDEX `fk_resu_location_resu_price_option1_idx` ON `resu_location` (`resu_price_option_id` ASC);

CREATE INDEX `fk_resu_location_resu_decor_option1_idx` ON `resu_location` (`resu_decor_option_id` ASC);

CREATE INDEX `fk_resu_location_resu_ambiance_option1_idx` ON `resu_location` (`resu_ambiance_option_id` ASC);

CREATE INDEX `fk_resu_location_resu_map1_idx` ON `resu_location` (`resu_map_id` ASC);


-- -----------------------------------------------------
-- Table `resu_location_alcohol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_location_alcohol` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resu_location_id` INT(10) UNSIGNED NOT NULL,
  `resu_alcohol_option_id` INT(11) UNSIGNED NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_location_alcohol_resu_alcohol_option1`
    FOREIGN KEY (`resu_alcohol_option_id`)
    REFERENCES `resu_alcohol_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_alcohol_resu_location1`
    FOREIGN KEY (`resu_location_id`)
    REFERENCES `resu_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `fk_resu_location_alcohol_resu_alcohol_option1` ON `resu_location_alcohol` (`resu_alcohol_option_id` ASC);

CREATE INDEX `fk_resu_location_alcohol_resu_location1` ON `resu_location_alcohol` (`resu_location_id` ASC);


-- -----------------------------------------------------
-- Table `resu_location_boolean`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_location_boolean` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resu_location_id` INT(10) UNSIGNED NOT NULL,
  `resu_boolean_option_id` INT(10) UNSIGNED NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_location_boolean_resu_boolean_option1`
    FOREIGN KEY (`resu_boolean_option_id`)
    REFERENCES `resu_boolean_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_boolean_resu_location1`
    FOREIGN KEY (`resu_location_id`)
    REFERENCES `resu_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_location_boolean` (`id` ASC);

CREATE INDEX `fk_resu_location_boolean_resu_location1_idx` ON `resu_location_boolean` (`resu_location_id` ASC);

CREATE INDEX `fk_resu_location_boolean_resu_boolean_option1_idx` ON `resu_location_boolean` (`resu_boolean_option_id` ASC);


-- -----------------------------------------------------
-- Table `resu_location_cuisine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_location_cuisine` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resu_location_id` INT(10) UNSIGNED NOT NULL,
  `resu_cuisine_option_id` INT(10) UNSIGNED NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_location_cuisine_resu_cuisine_option1`
    FOREIGN KEY (`resu_cuisine_option_id`)
    REFERENCES `resu_cuisine_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_cuisine_resu_location1`
    FOREIGN KEY (`resu_location_id`)
    REFERENCES `resu_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_location_cuisine` (`id` ASC);

CREATE INDEX `fk_resu_location_cuisine_resu_location1_idx` ON `resu_location_cuisine` (`resu_location_id` ASC);

CREATE INDEX `fk_resu_location_cuisine_resu_cuisine_option1_idx` ON `resu_location_cuisine` (`resu_cuisine_option_id` ASC);


-- -----------------------------------------------------
-- Table `resu_location_dress_code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_location_dress_code` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resu_location_id` INT(10) UNSIGNED NOT NULL,
  `resu_dress_code_option_id` INT(10) UNSIGNED NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_location_dress_code_resu_dress_code_option1`
    FOREIGN KEY (`resu_dress_code_option_id`)
    REFERENCES `resu_dress_code_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_dress_code_resu_location1`
    FOREIGN KEY (`resu_location_id`)
    REFERENCES `resu_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_location_dress_code` (`id` ASC);

CREATE INDEX `fk_resu_location_dress_code_resu_location1_idx` ON `resu_location_dress_code` (`resu_location_id` ASC);

CREATE INDEX `fk_resu_location_dress_code_resu_dress_code_option1_idx` ON `resu_location_dress_code` (`resu_dress_code_option_id` ASC);


-- -----------------------------------------------------
-- Table `resu_location_hours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_location_hours` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resu_location_id` INT(10) UNSIGNED NOT NULL,
  `resu_hours_option_id` INT(10) UNSIGNED NOT NULL,
  `resu_days_options_id` INT(11) UNSIGNED NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_location_hours_resu_days_options1`
    FOREIGN KEY (`resu_days_options_id`)
    REFERENCES `resu_days_options` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_hours_resu_hours_option1`
    FOREIGN KEY (`resu_hours_option_id`)
    REFERENCES `resu_hours_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_hours_resu_location1`
    FOREIGN KEY (`resu_location_id`)
    REFERENCES `resu_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_location_hours` (`id` ASC);

CREATE INDEX `fk_resu_location_hours_resu_location1_idx` ON `resu_location_hours` (`resu_location_id` ASC);

CREATE INDEX `fk_resu_location_hours_resu_hours_option1_idx` ON `resu_location_hours` (`resu_hours_option_id` ASC);

CREATE INDEX `fk_resu_location_hours_resu_days_options1` ON `resu_location_hours` (`resu_days_options_id` ASC);


-- -----------------------------------------------------
-- Table `resu_media_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_media_option` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(64) NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_media_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_location_media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_location_media` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resu_media_option_id` INT(10) UNSIGNED NOT NULL,
  `resu_location_id` INT(10) UNSIGNED NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_location_media_resu_location1`
    FOREIGN KEY (`resu_location_id`)
    REFERENCES `resu_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_media_resu_media_option1`
    FOREIGN KEY (`resu_media_option_id`)
    REFERENCES `resu_media_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_location_media` (`id` ASC);

CREATE INDEX `fk_resu_location_media_resu_media_option1_idx` ON `resu_location_media` (`resu_media_option_id` ASC);

CREATE INDEX `fk_resu_location_media_resu_location1_idx` ON `resu_location_media` (`resu_location_id` ASC);


-- -----------------------------------------------------
-- Table `resu_menu_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_menu_option` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `high_price` DECIMAL(4,2) NOT NULL,
  `low_price` DECIMAL(4,2) NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_menu_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_location_menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_location_menu` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resu_location_id` INT(10) UNSIGNED NOT NULL,
  `resu_menu_option_id` INT(10) UNSIGNED NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_location_menu_resu_location1`
    FOREIGN KEY (`resu_location_id`)
    REFERENCES `resu_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_menu_resu_menu_option1`
    FOREIGN KEY (`resu_menu_option_id`)
    REFERENCES `resu_menu_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_location_menu` (`id` ASC);

CREATE INDEX `fk_resu_location_menu_resu_location1_idx` ON `resu_location_menu` (`resu_location_id` ASC);

CREATE INDEX `fk_resu_location_menu_resu_menu_option1_idx` ON `resu_location_menu` (`resu_menu_option_id` ASC);


-- -----------------------------------------------------
-- Table `resu_payment_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_payment_option` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_payment_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_location_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_location_payment` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resu_payment_option_id` INT(10) UNSIGNED NOT NULL,
  `resu_location_id` INT(10) UNSIGNED NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_location_payment_resu_location1`
    FOREIGN KEY (`resu_location_id`)
    REFERENCES `resu_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_payment_resu_payment_option1`
    FOREIGN KEY (`resu_payment_option_id`)
    REFERENCES `resu_payment_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_location_payment` (`id` ASC);

CREATE INDEX `fk_resu_location_payment_resu_payment_option1_idx` ON `resu_location_payment` (`resu_payment_option_id` ASC);

CREATE INDEX `fk_resu_location_payment_resu_location1_idx` ON `resu_location_payment` (`resu_location_id` ASC);


-- -----------------------------------------------------
-- Table `resu_reservation_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_reservation_option` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_reservation_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_location_reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_location_reservation` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resu_location_id` INT(10) UNSIGNED NOT NULL,
  `resu_reservation_option_id` INT(10) UNSIGNED NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_location_reservation_resu_location1`
    FOREIGN KEY (`resu_location_id`)
    REFERENCES `resu_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_reservation_resu_reservation_option1`
    FOREIGN KEY (`resu_reservation_option_id`)
    REFERENCES `resu_reservation_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_location_reservation` (`id` ASC);

CREATE INDEX `fk_resu_location_reservation_resu_location1_idx` ON `resu_location_reservation` (`resu_location_id` ASC);

CREATE INDEX `fk_resu_location_reservation_resu_reservation_option1_idx` ON `resu_location_reservation` (`resu_reservation_option_id` ASC);


-- -----------------------------------------------------
-- Table `resu_seating_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_seating_option` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_seating_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_location_seating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_location_seating` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resu_location_id` INT(10) UNSIGNED NOT NULL,
  `resu_seating_option_id` INT(10) UNSIGNED NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_location_seating_resu_location1`
    FOREIGN KEY (`resu_location_id`)
    REFERENCES `resu_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_seating_resu_seating_option1`
    FOREIGN KEY (`resu_seating_option_id`)
    REFERENCES `resu_seating_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_location_seating` (`id` ASC);

CREATE INDEX `fk_resu_location_seating_resu_location1_idx` ON `resu_location_seating` (`resu_location_id` ASC);

CREATE INDEX `fk_resu_location_seating_resu_seating_option1_idx` ON `resu_location_seating` (`resu_seating_option_id` ASC);


-- -----------------------------------------------------
-- Table `resu_service_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_service_option` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_service_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_location_service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_location_service` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resu_location_id` INT(10) UNSIGNED NOT NULL,
  `resu_service_option_id` INT(10) UNSIGNED NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_location_service_resu_location1`
    FOREIGN KEY (`resu_location_id`)
    REFERENCES `resu_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_service_resu_service_option1`
    FOREIGN KEY (`resu_service_option_id`)
    REFERENCES `resu_service_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_location_service` (`id` ASC);

CREATE INDEX `fk_resu_location_service_resu_location1_idx` ON `resu_location_service` (`resu_location_id` ASC);

CREATE INDEX `fk_resu_location_service_resu_services_option1_idx` ON `resu_location_service` (`resu_service_option_id` ASC);


-- -----------------------------------------------------
-- Table `resu_speciality_menu_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_speciality_menu_option` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_speciality_menu_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_location_speciality_menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_location_speciality_menu` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resu_location_id` INT(10) UNSIGNED NOT NULL,
  `resu_speciality_menu_option_id` INT(11) UNSIGNED NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_location_speciality_menu_resu_location1`
    FOREIGN KEY (`resu_location_id`)
    REFERENCES `resu_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_speciality_menu_resu_specialty_menu_option1`
    FOREIGN KEY (`resu_speciality_menu_option_id`)
    REFERENCES `resu_speciality_menu_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_location_speciality_menu` (`id` ASC);

CREATE INDEX `fk_resu_location_speciality_menu_resu_specialty_menu_option_idx` ON `resu_location_speciality_menu` (`resu_speciality_menu_option_id` ASC);

CREATE INDEX `fk_resu_location_speciality_menu_resu_location1_idx` ON `resu_location_speciality_menu` (`resu_location_id` ASC);


-- -----------------------------------------------------
-- Table `resu_days_of_week_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_days_of_week_option` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL COMMENT '	',
  `abbr` VARCHAR(3) NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_days_of_week_option` (`id` ASC);


-- -----------------------------------------------------
-- Table `resu_days_location_hour`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resu_days_location_hour` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resu_location_id` INT(10) UNSIGNED NOT NULL,
  `resu_days_of_week_option_id` INT(11) UNSIGNED NOT NULL,
  `value` VARCHAR(12) NOT NULL,
  `created_at` INT(11) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `updated_at` INT(11) NULL DEFAULT NULL,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `deleted_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_resu_days_location_hour_resu_location1`
    FOREIGN KEY (`resu_location_id`)
    REFERENCES `resu_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_days_location_hour_resu_days_of_week_option1`
    FOREIGN KEY (`resu_days_of_week_option_id`)
    REFERENCES `resu_days_of_week_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `resu_days_location_hour` (`id` ASC);

CREATE INDEX `fk_resu_days_location_hour_resu_location1_idx` ON `resu_days_location_hour` (`resu_location_id` ASC);

CREATE INDEX `fk_resu_days_location_hour_resu_days_of_week_option1_idx` ON `resu_days_location_hour` (`resu_days_of_week_option_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;