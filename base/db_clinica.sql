CREATE SCHEMA IF NOT EXISTS `db_clinica` DEFAULT CHARACTER SET utf8 ;
USE `db_clinica` ;

-- -----------------------------------------------------
-- Table `db_clinica`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`persona` (
  `idpersona` INT NOT NULL,
  `primerNombre` VARCHAR(25) NOT NULL,
  `segundoNombre` VARCHAR(25) NULL,
  `primerApellido` VARCHAR(25) NOT NULL,
  `segundoApellido` VARCHAR(25) NULL,
  `fechaNacimiento` DATE NOT NULL,
  `correo` VARCHAR(45) NULL,
  `estadoCivil` VARCHAR(25) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `numeroIdentidad` VARCHAR(15) NOT NULL,
  `telefono` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idpersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`paciente` (
  `idpaciente` INT NOT NULL,
  `observaciones` VARCHAR(300) NULL,
  `idpersona` INT NOT NULL,
  PRIMARY KEY (`idpaciente`),
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
  `descripcionCargo` VARCHAR(45) NULL,
  PRIMARY KEY (`idcargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`empleado` (
  `idempleado` INT NOT NULL,
  `idcargo` INT NOT NULL,
  `idpersona` INT NOT NULL,
  `numEmpleado` INT NULL,
  PRIMARY KEY (`idempleado`),
  INDEX `fk_empleado_cargo1_idx` (`idcargo` ASC),
  INDEX `fk_empleado_persona1_idx` (`idpersona` ASC),
  CONSTRAINT `fk_empleado_cargo1`
    FOREIGN KEY (`idcargo`)
    REFERENCES `db_clinica`.`cargo` (`idcargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `db_clinica`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`servicio` (
  `idservicio` INT NOT NULL,
  `tipoServicio` VARCHAR(45) NULL,
  `descripcionServicio` VARCHAR(45) NULL,
  PRIMARY KEY (`idservicio`))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `db_clinica`.`expediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`expediente` (
  `idexpediente` INT NOT NULL,
  `numeroExpediente` INT NOT NULL,
  `observaciones` VARCHAR(300) NULL,
  `tipoSangre` VARCHAR(3) NOT NULL,
  `idpaciente` INT NOT NULL,
  PRIMARY KEY (`idexpediente`),
  INDEX `fk_expediente_paciente1_idx` (`idpaciente` ASC),
  CONSTRAINT `fk_expediente_paciente1`
    FOREIGN KEY (`idpaciente`)
    REFERENCES `db_clinica`.`paciente` (`idpaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`citas` (
  `idcitas` INT NOT NULL,
  `fecha` DATE NULL,
  `horaInicio` DATETIME NULL,
  `horaFinal` DATETIME NULL,
  `observaciones` VARCHAR(45) NULL,
  `idempleado` INT NOT NULL,
  `idservicio` INT NOT NULL,
  `idexpediente` INT NOT NULL,
  `idpaciente` INT NOT NULL,
  PRIMARY KEY (`idcitas`),
  INDEX `fk_citas_empleado1_idx` (`idempleado` ASC),
  INDEX `fk_citas_servicio1_idx` (`idservicio` ASC),
  INDEX `fk_citas_expediente1_idx` (`idexpediente` ASC),
  INDEX `fk_citas_paciente1_idx` (`idpaciente` ASC),
  CONSTRAINT `fk_citas_empleado1`
    FOREIGN KEY (`idempleado`)
    REFERENCES `db_clinica`.`empleado` (`idempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_citas_servicio1`
    FOREIGN KEY (`idservicio`)
    REFERENCES `db_clinica`.`servicio` (`idservicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_citas_expediente1`
    FOREIGN KEY (`idexpediente`)
    REFERENCES `db_clinica`.`expediente` (`idexpediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_citas_paciente1`
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
-- Table `db_clinica`.`medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`medicamento` (
  `idMedicamento` INT NOT NULL,
  `nombreProducto` VARCHAR(45) NULL,
  `precio` VARCHAR(45) NULL,
  `idcategoria` INT NOT NULL,
  `descripcion` VARCHAR(100) NULL,
  `idestado` INT NOT NULL,
  `fechaVencimiento` VARCHAR(45) NULL,
  `cantidad` VARCHAR(45) NULL,
  `unidad` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`idMedicamento`, `idcategoria`),
  INDEX `fk_producto_categoria1_idx` (`idcategoria` ASC),
  CONSTRAINT `fk_producto_categoria1`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `db_clinica`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(100) NULL,
  `contrasenia` VARCHAR(100) NULL,
  `correo` VARCHAR(100) NULL,
  `idempleado` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_empleado1_idx` (`idempleado` ASC),
  CONSTRAINT `fk_usuario_empleado1`
    FOREIGN KEY (`idempleado`)
    REFERENCES `db_clinica`.`empleado` (`idempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`privilegio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`privilegio` (
  `idprivilegio` INT NOT NULL AUTO_INCREMENT,
  `nombrePrivilegio` VARCHAR(50) NULL,
  `descripcionPrivilegio` VARCHAR(100) NULL,
  PRIMARY KEY (`idprivilegio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`inventario` (
  `idinventario` INT NOT NULL AUTO_INCREMENT,
  `fechaIngreso` DATE NULL,
  `cantidad` INT NULL,
  PRIMARY KEY (`idinventario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`usuario_x_privilegio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`usuario_x_privilegio` (
  `idprivilegio` INT NOT NULL,
  `idusuario` INT NOT NULL,
  INDEX `fk_usuario_x_privilegio_privilegio1_idx` (`idprivilegio` ASC),
  INDEX `fk_usuario_x_privilegio_usuario1_idx` (`idusuario` ASC),
  CONSTRAINT `fk_usuario_x_privilegio_privilegio1`
    FOREIGN KEY (`idprivilegio`)
    REFERENCES `db_clinica`.`privilegio` (`idprivilegio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_x_privilegio_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `db_clinica`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`insumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`insumo` (
  `idinsumo` INT NOT NULL AUTO_INCREMENT,
  `nombreInsumo` VARCHAR(45) NULL,
  `cantidad` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idinsumo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`laboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`laboratorio` (
  `idlaboratorio` INT NOT NULL AUTO_INCREMENT,
  `nombreLaboratorio` VARCHAR(45) NULL,
  `ubicacion` VARCHAR(45) NULL,
  PRIMARY KEY (`idlaboratorio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`tipoExamen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`tipoExamen` (
  `idtipoExamen` INT NOT NULL AUTO_INCREMENT,
  `nombreExamen` VARCHAR(45) NULL,
  `descripcionExamen` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipoExamen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`examenesPaciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`examenesPaciente` (
  `idexamenesPaciente` INT NOT NULL,
  `fechaExamen` DATE NOT NULL,
  `resultado` VARCHAR(200) NULL,
  `idlaboratorio` INT NOT NULL,
  `idtipoExamen` INT NOT NULL,
  `idexpediente` INT NOT NULL,
  PRIMARY KEY (`idexamenesPaciente`),
  INDEX `fk_examenesPaciente_laboratorio1_idx` (`idlaboratorio` ASC),
  INDEX `fk_examenesPaciente_tipoExamen1_idx` (`idtipoExamen` ASC),
  INDEX `fk_examenesPaciente_expediente1_idx` (`idexpediente` ASC),
  CONSTRAINT `fk_examenesPaciente_laboratorio1`
    FOREIGN KEY (`idlaboratorio`)
    REFERENCES `db_clinica`.`laboratorio` (`idlaboratorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenesPaciente_tipoExamen1`
    FOREIGN KEY (`idtipoExamen`)
    REFERENCES `db_clinica`.`tipoExamen` (`idtipoExamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenesPaciente_expediente1`
    FOREIGN KEY (`idexpediente`)
    REFERENCES `db_clinica`.`expediente` (`idexpediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`enfermedad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`enfermedad` (
  `idenfermedad` INT NOT NULL AUTO_INCREMENT,
  `nombreEnfermedad` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idenfermedad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`telefono` (
  `idtelefono` INT NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `idpersona` INT NULL,
  `idlaboratorio` INT NULL,
  PRIMARY KEY (`idtelefono`),
  INDEX `fk_telefono_persona1_idx` (`idpersona` ASC),
  INDEX `fk_telefono_laboratorio1_idx` (`idlaboratorio` ASC),
  CONSTRAINT `fk_telefono_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `db_clinica`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_telefono_laboratorio1`
    FOREIGN KEY (`idlaboratorio`)
    REFERENCES `db_clinica`.`laboratorio` (`idlaboratorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`enfermedadPaciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`enfermedadPaciente` (
  `idenfermedad` INT NOT NULL,
  `idexpediente` INT NOT NULL,
  `descripcion` VARCHAR(300) NULL,
  INDEX `fk_enfermedadPaciente_enfermedad1_idx` (`idenfermedad` ASC),
  INDEX `fk_enfermedadPaciente_expediente1_idx` (`idexpediente` ASC),
  CONSTRAINT `fk_enfermedadPaciente_enfermedad1`
    FOREIGN KEY (`idenfermedad`)
    REFERENCES `db_clinica`.`enfermedad` (`idenfermedad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enfermedadPaciente_expediente1`
    FOREIGN KEY (`idexpediente`)
    REFERENCES `db_clinica`.`expediente` (`idexpediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_clinica`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_clinica`.`genero` (
  `idgenero` INT NOT NULL AUTO_INCREMENT,
  `nombreGenero` VARCHAR(45) NULL,
  `idpersona` INT NOT NULL,
  PRIMARY KEY (`idgenero`),
  INDEX `fk_genero_persona1_idx` (`idpersona` ASC),
  CONSTRAINT `fk_genero_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `db_clinica`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
