use tigo;

select * from cliente;
select * from caja;
select * from estado;
select * from planes;
select * from detallecontrato;
select * from pago;
select * from instalacion;
select * from usuario;
INSERT INTO instalacion 
select iddetallecontrato, num_contrato, num_talonario, planes_idplanes, cliente_dnicliente, caja_idcaja, 
date_format(fecha_contrato, "%d-%m-%Y") as fecha_contrato, dia_pago, estado from detallecontrato;

/*Consultas avanzadas*/
select cl.dnicliente, cl.nombrecli, cl.distritocli, dc.fecha_contrato, dc.dia_pago, pl.descplan, cj.idcaja, cj.localizacion 
from detallecontrato as dc
INNER JOIN cliente as cl on dc.cliente_dnicliente=cl.dnicliente
INNER JOIN planes as pl on dc.planes_idplanes=pl.idplanes
INNER JOIN caja as cj on dc.caja_idcaja=cj.idcaja;

/**********/
SELECT dc.cliente_dnicliente, cl.apellidocli, cl.nombrecli, pg.fechapago, pg.montopago, pg.mespago, pg.anio 
	FROM pago as pg INNER JOIN detallecontrato as dc on dc.num_contrato = pg.num_contrato 
    INNER JOIN cliente as cl on cl.dnicliente = dc.cliente_dnicliente;



describe cliente;
describe caja;
describe detallecontrato;
describe estado;
describe planes;
describe pago;
describe instalacion;

ALTER TABLE caja ADD COLUMN detalle VARCHAR(50);

ALTER TABLE pago ADD COLUMN detallecontrato_iddetallecontrato INT NOT NULL,
	ADD CONSTRAINT `fk_detallecontrato_iddetallecontrato` FOREIGN KEY (detallecontrato_iddetallecontrato) 
		REFERENCES detallecontrato(iddetallecontrato);
        
ALTER TABLE pago ADD COLUMN contrato INT NOT NULL,
	ADD CONSTRAINT `fk_detallecontrato` FOREIGN KEY (contrato) 
		REFERENCES detallecontrato(num_contrato);
        
ALTER TABLE detallecontrato ADD CONSTRAINT `fk_idinstalacion` FOREIGN KEY (instalacion_idinstalacion) 
		REFERENCES instalacion(idinstalacion);
        
DELETE FROM detallecontrato WHERE iddetallecontrato=4;
DELETE FROM pago WHERE idpago='3';
DELETE FROM instalacion WHERE idinstalacion=7;
delete from detallecontrato;
DELETE FROM cliente;
DELETE FROM pago;

INSERT INTO pago (num_contrato, montopago, fechapago, mespago, anio) VALUES
(1225,130,"2023-11-23",11,2023);

INSERT INTO instalacion (fechainstalacion, numcontrato, geolocalizacion, observacion) VALUES
("2024-06-02",1120,"maps","el cliente me invito pan");

INSERT INTO cliente (dnicliente, apellidocli, nombrecli, direccioncli, distritocli, provinciacli, nacionalidadcli, telefonocli) VALUES
('44330076','Arevalo Sutta','Andres','SIN DIRECCION','San Juan de Lurigancho','Lima','Peruana',0);

INSERT INTO detallecontrato (num_contrato, planes_idplanes, cliente_dnicliente, caja_idcaja, fecha_contrato, instalacion, diapago, fecha_instalacion) VALUES
(2168,3,'42399424','c0102','2021-12-29','Completada',1,'2021-12-29'),
(1499,4,'8695241','c0103','2020-01-10','Completada',1,'2020-01-10'),
(1600,3,'46976776','c0104','2020-06-06','Completada',1,'2020-06-06'),
(2084,6,'41163123','c0105','2021-11-26','Completada',1,'2021-11-26'),
(2177,5,'76542076','c0101','2022-01-08','Completada',1,'2022-01-08'),
(2194,2,'76560131','c0101','2022-02-02','Completada',1,'2022-02-02'),
(2076,1,'75606397','c0102','2021-11-22','Completada',1,'2021-11-22');





