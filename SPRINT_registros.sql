INSERT INTO usuarioReg
	(nombreUsuario,
	usuarioRut,
	usuarioNombreCompleto,
	usuarioApellido,
	usuarioFechaNac)
VALUES
	("andreacjimenez", "9339873-4", "Andrea C.", "Jiménez", "1975-07-28"),
    ("ieganah", "10143318-8", "Ignacio Enrique", "Egaña", "1971-04-30"),
    ("ceciesp", "5195931-6", "Cecilia", "Espinoza", "1952-05-31"),
    ("ukamah", "9165922-0", "René Enrique", "Delgado", "1968-10-16"),
    ("bavestrellof", "17140789-3", "Flavio", "Bavestrello Aranda", "1980-12-31"),
    ("camilaahora", "11456982-k", "Camila", "Osorio Vallejos", "1985-07-20"),
    ("ebanpalacios", "9611477-2", "Esteban", "Palacios Chacon", "1990-10-16"),
    ("fabicardenas", '18345987-2', 'Fabian', 'Cardenas Rosas', "1992-01-01"),
	("emilypm", '22361577-0', 'Emilia', 'Pezoa Millones', "1979-11-09" ),
    ("tomialvarez",'9325741-1', 'Tomas', 'Alvarez Gonzalez', "1973-09-11");
    
    select * from usuarioReg;
    
INSERT INTO cliente
	(rut_cliente, 
    clie_nombres,	
    clie_apellidos,	
    clie_telefono, 
    clie_afp, 
    clie_sistSalud,
	clie_direccion,
	clie_comuna,
	clie_edad,
    idUsuarioReg)
VALUES
	("9339873-4", "Andrea", "Jiménez", 965554730, "Habitat", 2, "Pasaje Esmeralda 11", "Valparaíso", 47, 1),
    ("10143318-8", "Ignacio", "Egaña", 994532489, "Cuprum", 1, "Cirilo Armstrong 247", "Valparaíso", 53, 2),
    ("5195931-6", "Cecilia", "Espinoza", 549368919, "Habitat", 2, "Amapola 1426", "San Rafael", 70, 3),
    ("9165922-0", "René", "Delgado", 992227301, "Cuprum", 1, "Río Bueno 256", "Valparaíso", 53, 4);
  
INSERT INTO accidente
	(accid_fecha,
	 accid_hora,
	 accid_lugar,
	 accid_origen,
	 accid_consec,
	 clie_idCliente)
VALUES
	("2019-04-20", "14:30:00", "Valparaíso", "ingreso", "desconocidas", 1),
    ("2020-03-20", "11:30:00", "Viña del Mar", "trayecto", "desconocidas", 2),
    ("2021-04-28", "16:30:00", "Viña del Mar", "trayecto", "desconocidas", 3),
    ("2021-07-25", "19:00:00", "Valparaíso", "ingreso", "desconocidas", 4);
    
INSERT INTO capacitacion 
	(clie_idCliente,
	capac_dia,
	capac_hora,
	capac_lugar,
	capac_duracion,
	capac_cantAsist)
VALUES
	(1, "2021-03-14", "15:45", "Unab", 150, 5),
    (2, "2021-04-18", "10:50", "Upla", 180, 10),
    (3, "2022-07-13", "17:30", "Valpo", 60, 12);

/*3*/
INSERT INTO asistente
	(asist_nombres,
	asist_edad,
	asist_correo,
	asist_telefono,
	capac_idcapac)
VALUES
	("Ana Lara", 30, "analara@gmail.com", 322393939, 1),
    ("Teresa José", 22, "tereojose@hotmail.com", 999933223, 2),
    ("María Pérez", 45, "maripe@msn.com", 549340012, 3),
    ("Lila Jara", 44, "lilajaja@gmail.com", 322300000, 3);
    
INSERT INTO administrativo 
	(adm_rut, 
    adm_nombre, 
    adm_apellidos, 
    adm_correo, 
    adm_area, 
    idUsuarioReg) 
VALUES
    ('17140789-3', 'Flavio', 'Bavestrello Aranda' , 'f.baves@gmail.com', 'informatica', 5),
    ('11456982-k', 'Camila', 'Osorio Vallejos' , 'camoso@gmail.com', 'Recursos humanos', 6),
    ('9611477-2', 'Esteban', 'Palacios Chacon' , 'palacios.esteban@hotmail.com', 'ventas', 7);
    
INSERT INTO profesional 
	(prof_rut, 
    prof_nombre, 
    prof_apellidos, 
    prof_telefono, 
    prof_titulo, 
    prof_proyecto, 
    idUsuarioReg) 
VALUES
    ('18345987-2', 'Fabian', 'Cardenas Rosas' , 933554499, 'prevencionista de riesgos', 'mision secreta', 8),
	('22361577-0', 'Emilia', 'Pezoa Millones' , 966388095, 'contador auditor', 'mision imposible', 9),
    ('9325741-1', 'Tomas', 'Alvarez Gonzalez', 987456321, 'ingeniero comercial', 'mision papa frita', 10);
    
INSERT INTO actmejora 
	(actMej_nombre, 
	actMej_descrip, 
	plazo_cierre) 
VALUES
	('realizar capacitaciones', 'capacitacion maquinaria pesada a empleados de fabrica', '2023-06-30'),
    ('realizar charlas 5 minutos', 'realizar charlas prevencion de riesgos de 5 minutos comenzando jornada de los dias lunes', '2022-12-30'),
    ('realizar evaluaciones', 'realizar evaluaciones periodicas a empleados para detectar debilidades y/o deficiencias en area de trabajo', '2023-05-15');

INSERT INTO asesoria 
	(fecha_asesoria, 
    motivo_asesoria, 
    profA_cargo, 
    clie_idCliente, 
    act_Mejora) 
VALUES
	('2023-01-12', 'accidente en maquina', 1, 2, 3 ),
	('2022-11-25', 'implementar control interno', 2, 3, 2 ),
	('2023-03-06', 'instruir sobre senaleticas', 3, 1, 1);
    
INSERT INTO regcheck
	(reg_tipCheck, reg_ECheck)
VALUES
	("Revisión", "cumple"),
    ("Cierre", "cumple c/Obs"),
    ("Inicial", "no cumple");
    
INSERT INTO chequeo
	(check_nombre, registro_check)
VALUES
	("Normalización", 1),
    ("Seguimiento", 2),
    ("Certificación", 3);
    
INSERT INTO visita 
	(visi_fecha, 
    visi_hora, 
    visi_lugar, 
    visi_comentarios, 
    clie_idCliente, 
    check_check) 
VALUES
	('2023-02-02', '15:00:00', 'Agua Santa, Vina del Mar', 'coordinar visita previamente con encargada', 1, 1),
    ('2023-01-07', '09:30:00', 'Huerfanos, Santiago', 'no se hallo jefe de local para entregar informe', 2, 2),
    ('2022-08-21', '08:45:00', 'Calle Limache, Vina del Mar', 'visita fallida', 3, 3);

INSERT INTO pago_cliente
	(fecha_pago,
    monto_pago,
    mes_pago,
    año_pago,
    id_cliente)
VALUES
	("2022-01-31", 545000, MONTH("2022-01-31"), YEAR("2022-01-31"), 1),
    ("2022-12-26", 1254340, MONTH("2022-12-26"), YEAR("2022-12-26"), 2),
    ("2023-01-29", 2500000, MONTH("2023-01-29"), YEAR("2023-01-29"), 3);