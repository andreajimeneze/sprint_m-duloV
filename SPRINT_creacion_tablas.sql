/*SCRIPT COMPLETO BASE DATOS*/
use sprintFinal;

CREATE TABLE usuarioReg (
  idUsuarioReg int NOT NULL AUTO_INCREMENT,
  nombreUsuario varchar(45) NOT NULL,
  usuarioRut varchar(10) NOT NULL,
  usuarioNombreCompleto varchar(45) NOT NULL,
  usuarioApellido varchar(45) NOT NULL,
  usuarioFechaNac varchar(10) NOT NULL,
  PRIMARY KEY (idUsuarioReg)
);

CREATE TABLE cliente (
	id_cliente INT NOT NULL AUTO_INCREMENT,
	rut_cliente varchar(10) NOT NULL,
	clie_nombres varchar(30) NOT NULL,
	clie_apellidos varchar(50) NOT NULL,
	clie_telefono int NOT NULL,
	clie_afp varchar(30) DEFAULT NULL,
	clie_sistSalud int DEFAULT NULL,
	clie_direccion varchar(100) NOT NULL,
	clie_comuna varchar(50) NOT NULL,
	clie_edad varchar(3) NOT NULL,
    idUsuarioReg int NOT NULL,
	PRIMARY KEY (id_cliente),
    CONSTRAINT cliente_usuarioReg_fk FOREIGN KEY (idUsuarioReg) REFERENCES usuarioReg (idUsuarioReg)
);

CREATE TABLE accidente (
  id_accid int NOT NULL AUTO_INCREMENT,
  accid_fecha date NOT NULL,
  accid_hora time NOT NULL,
  accid_lugar varchar(150) NOT NULL,
  accid_origen varchar(100) NOT NULL,
  accid_consec varchar(100) DEFAULT NULL,
  clie_idCliente int NOT NULL,
  PRIMARY KEY (id_accid),
  CONSTRAINT accidente_cliente_fk FOREIGN KEY (clie_idCliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE capacitacion (
	id_capac int NOT NULL AUTO_INCREMENT,
	clie_idCliente int NOT NULL,
	capac_dia date NOT NULL,
	capac_hora time DEFAULT NULL,
	capac_lugar varchar(50) NOT NULL,
	capac_duracion int NOT NULL,
	capac_cantAsist int DEFAULT NULL,
	PRIMARY KEY (id_capac),
    CONSTRAINT capacitacion_cliente_fk FOREIGN KEY (clie_idCliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE asistente (
  id_asist int NOT NULL AUTO_INCREMENT,
  asist_nombres varchar(100) NOT NULL,
  asist_edad int NOT NULL,
  asist_correo varchar(40) DEFAULT NULL,
  asist_telefono int DEFAULT NULL,
  capac_idcapac int NOT NULL,
  PRIMARY KEY (id_asist),
  CONSTRAINT asistente_capacitacion_fk FOREIGN KEY (capac_idcapac) REFERENCES capacitacion (id_capac)
);

CREATE TABLE administrativo (
  id_adm int NOT NULL AUTO_INCREMENT,
  adm_rut varchar(10) NOT NULL,
  adm_nombre varchar(45) DEFAULT NULL,
  adm_apellidos varchar(45) DEFAULT NULL,
  adm_correo varchar(70) DEFAULT NULL,
  adm_area varchar(45) DEFAULT NULL,
  idUsuarioReg int NOT NULL,
  PRIMARY KEY (id_adm),
  CONSTRAINT administrativo_usuarioReg_fk FOREIGN KEY (idUsuarioReg) REFERENCES usuarioReg (idUsuarioReg)
);

CREATE TABLE profesional (
  id_prof int NOT NULL AUTO_INCREMENT,
  prof_rut varchar(10) NOT NULL,
  prof_nombre varchar(45) DEFAULT NULL,
  prof_apellidos varchar(45) DEFAULT NULL,
  prof_telefono int DEFAULT NULL,
  prof_titulo varchar(45) DEFAULT NULL,
  prof_proyecto varchar(45) DEFAULT NULL,
  idUsuarioReg int NOT NULL,
  PRIMARY KEY (id_prof),
  CONSTRAINT profesional_usuarioReg_fk FOREIGN KEY (idUsuarioReg) REFERENCES usuarioReg (idUsuarioReg)
); 

CREATE TABLE actMejora (
		id_mejora int NOT NULL AUTO_INCREMENT,
        actMej_nombre varchar(50) NOT NULL,
        actMej_descrip varchar(250) NOT NULL,
        plazo_cierre DATE,
        PRIMARY KEY (id_mejora)
        );
        
CREATE TABLE asesoria (
	cod_unico int NOT NULL AUTO_INCREMENT,
    fecha_asesoria DATE NOT NULL,
    motivo_asesoria varchar(250) NOT NULL,
    profA_cargo int NOT NULL,
    clie_idCliente int NOT NULL,
    act_Mejora int NOT NULL,
    PRIMARY KEY (cod_unico),
    CONSTRAINT asesoria_actMejora_fk FOREIGN KEY (act_Mejora) REFERENCES actMejora (id_mejora),
    CONSTRAINT asesoria_profesional_fk FOREIGN KEY (profA_cargo) REFERENCES profesional (id_prof),
    CONSTRAINT asesoria_cliente_fk FOREIGN KEY (clie_idCliente) REFERENCES cliente (id_cliente)
    );

  CREATE TABLE regCheck (
  id_regCheck int NOT NULL AUTO_INCREMENT,
  reg_tipCheck varchar(45) NOT NULL,
  reg_ECheck SET("cumple", "cumple c/Obs", "no cumple") DEFAULT NULL,
  PRIMARY KEY (id_regCheck)
);
      
CREATE TABLE chequeo (
  id_check int NOT NULL AUTO_INCREMENT,
  check_nombre varchar(45) NOT NULL,
  registro_check int NOT NULL,
  PRIMARY KEY (id_check),
  CONSTRAINT chequeo_regCheck_fk FOREIGN KEY (registro_check) REFERENCES regCheck (id_regCheck)
);

CREATE TABLE visita (
	id_visita int NOT NULL AUTO_INCREMENT,
	visi_fecha date NOT NULL,
	visi_hora time DEFAULT NULL,
	visi_lugar varchar(50) NOT NULL,
	visi_comentarios varchar(250) NOT NULL,
	clie_idCliente int NOT NULL,
    check_check int NOT NULL,
	PRIMARY KEY (id_visita),
	CONSTRAINT visita_cliente_fk FOREIGN KEY (clie_idCliente) REFERENCES cliente (id_cliente),
    CONSTRAINT visita_chequeo_fk FOREIGN KEY (check_check) REFERENCES chequeo (id_check)
);

CREATE TABLE pago_cliente (
		id_pago int NOT NULL AUTO_INCREMENT,
        fecha_pago DATE NOT NULL,
        monto_pago int NOT NULL,
        mes_pago int NOT NULL,
        año_pago int NOT NULL,
        id_cliente int NOT NULL,
        PRIMARY KEY (id_pago),
        CONSTRAINT pago_cliente_cliente_fk FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
        );
