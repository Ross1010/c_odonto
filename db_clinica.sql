
-- -----------------------------------------------------
-- Table `db_clinica`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`persona` (
  `idpersona` INT NOT NULL,
  `primerNombre` VARCHAR(45) NULL,
  `segundoNombre` VARCHAR(45) NULL,
  `primerApellido` VARCHAR(45) NULL,
  `segundoApellido` VARCHAR(45) NULL,
  `fechaNacimiento` DATE NULL,
  `correo` VARCHAR(45) NULL,
  `estadoCivil` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `numeroIdentidad` VARCHAR(45) NULL,
  PRIMARY KEY (`idpersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`telefono` (
  `idtelefono` INT NOT NULL,
  `numeroTelefono` INT NULL,
  `idpersona` INT NOT NULL,
  PRIMARY KEY (`idtelefono`, `idpersona`),
  INDEX `fk_telefono_persona_idx` (`idpersona` ASC),
  CONSTRAINT `fk_telefono_persona`
    FOREIGN KEY (`idpersona`)
    REFERENCES `db_clinica`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`paciente` (
  `idpaciente` INT NOT NULL,
  `observaciones` VARCHAR(45) NULL,
  `idpersona` INT NOT NULL,
  PRIMARY KEY (`idpaciente`, `idpersona`),
  INDEX `fk_paciente_persona1_idx` (`idpersona` ASC),
  CONSTRAINT `fk_paciente_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `db_clinica`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`cargo` (
  `idcargo` INT NOT NULL,
  `tipoCargo` VARCHAR(45) NULL,
  PRIMARY KEY (`idcargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`empleado` (
  `idempleado` INT NOT NULL,
  `usuario` VARCHAR(45) NULL,
  `contrasena` VARCHAR(45) NULL,
  `idpersona` INT NOT NULL,
  `idcargo` INT NOT NULL,
  PRIMARY KEY (`idempleado`, `idpersona`, `idcargo`),
  INDEX `fk_empleado_persona1_idx` (`idpersona` ASC),
  INDEX `fk_empleado_cargo1_idx` (`idcargo` ASC),
  CONSTRAINT `fk_empleado_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `db_clinica`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado_cargo1`
    FOREIGN KEY (`idcargo`)
    REFERENCES `db_clinica`.`cargo` (`idcargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`servicio` (
  `idservicio` INT NOT NULL,
  `tipoServicio` VARCHAR(45) NULL,
  PRIMARY KEY (`idservicio`))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `db_clinica`.`citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`citas` (
  `idcitas` INT NOT NULL,
  `fecha` DATE NULL,
  `hora` INT NULL,
  `observaciones` VARCHAR(45) NULL,
  `idpaciente` INT NOT NULL,
  `idservicio` INT NOT NULL,
  `idempleado` INT NOT NULL,
  PRIMARY KEY (`idcitas`, `idpaciente`, `idservicio`, `idempleado`),
  INDEX `fk_citas_paciente1_idx` (`idpaciente` ASC),
  INDEX `fk_citas_servicio1_idx` (`idservicio` ASC),
  INDEX `fk_citas_empleado1_idx` (`idempleado` ASC),
  CONSTRAINT `fk_citas_paciente1`
    FOREIGN KEY (`idpaciente`)
    REFERENCES `db_clinica`.`paciente` (`idpaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_citas_servicio1`
    FOREIGN KEY (`idservicio`)
    REFERENCES `db_clinica`.`servicio` (`idservicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_citas_empleado1`
    FOREIGN KEY (`idempleado`)
    REFERENCES `db_clinica`.`empleado` (`idempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`expediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`expediente` (
  `idexpediente` INT NOT NULL,
  `idpaciente` INT NOT NULL,
  `numeroExpediente` VARCHAR(45) NULL,
  `observaciones` VARCHAR(45) NULL,
  `radiografias` VARCHAR(45) NULL,
  `examenes` VARCHAR(45) NULL,
  `tipoSangre` VARCHAR(45) NULL,
  `enfermedadesPadecientes` VARCHAR(45) NULL,
  `odontograma` VARCHAR(45) NULL,
  PRIMARY KEY (`idexpediente`, `idpaciente`),
  INDEX `fk_expediente_paciente1_idx` (`idpaciente` ASC),
  CONSTRAINT `fk_expediente_paciente1`
    FOREIGN KEY (`idpaciente`)
    REFERENCES `db_clinica`.`paciente` (`idpaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`categoria` (
  `idcategoria` INT NOT NULL,
  `tipoProducto` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`producto` (
  `idproducto` INT NOT NULL,
  `nombreProducto` VARCHAR(45) NULL,
  `precio` VARCHAR(45) NULL,
  `idcategoria` INT NOT NULL,
  PRIMARY KEY (`idproducto`, `idcategoria`),
  INDEX `fk_producto_categoria1_idx` (`idcategoria` ASC),
  CONSTRAINT `fk_producto_categoria1`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `db_clinica`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

