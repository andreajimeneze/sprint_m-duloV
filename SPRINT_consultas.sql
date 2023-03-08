/*a*/

SELECT c.id_capac, c.clie_idCliente, a.asist_nombres, a.asist_edad, a.asist_correo FROM capacitacion c
INNER JOIN asistente a
ON a.capac_idcapac = c.id_capac
WHERE clie_idCliente = 3;

/*b*/

SELECT clie.clie_comuna, v.check_check, r.reg_tipCheck, r.reg_ECheck FROM visita v
INNER JOIN regCheck r
ON r.id_regCheck = v.check_check
INNER JOIN cliente clie
ON clie.id_cliente = v.clie_idCliente
WHERE clie_comuna = "Valparaíso";

/*c*/
select * from accidente;
select * from cliente;

SELECT c.clie_nombres, c.clie_apellidos, c.rut_cliente, c.clie_telefono, a.accid_origen FROM cliente c
RIGHT JOIN accidente a
ON a.clie_idCliente  = c.id_cliente;
