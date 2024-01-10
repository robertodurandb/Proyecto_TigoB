use tigo;

select * from cliente;
select * from caja;
select * from estado;
select * from planes;
select * from detallecontrato;
select * from pago;
select num_contrato, num_talonario, planes_idplanes, cliente_dnicliente, caja_idcaja, 
date_format(fecha_contrato, "%d-%m-%Y") as fecha_contrato, dia_pago, estado from detallecontrato;

select num_contrato, montopago, date_format(fechapago, "%d-%m-%Y") as fechapago from pago;

/*Consultas avanzadas*/
select cl.dnicliente, cl.nombrecli, cl.distritocli, dc.fecha_contrato, dc.dia_pago, pl.descplan, cj.idcaja, cj.localizacion 
from detallecontrato as dc
INNER JOIN cliente as cl on dc.cliente_dnicliente=cl.dnicliente
INNER JOIN planes as pl on dc.planes_idplanes=pl.idplanes
INNER JOIN caja as cj on dc.caja_idcaja=cj.idcaja;
/*********************/
select dc.num_contrato, dc.cliente_dnicliente, cl.apellidocli, cl.nombrecli, pl.nombreplan, pg.fechapago, pg.montopago, pg.mespago, pg.anio
from pago as pg
INNER JOIN detallecontrato as dc on dc.num_contrato = pg.num_contrato
INNER JOIN cliente as cl on cl.dnicliente = dc.cliente_dnicliente
INNER JOIN planes as pl on pl.idplanes = dc.planes_idplanes;

describe cliente;
describe caja;
describe detallecontrato;
describe estado;
describe planes;
describe pago;
describe meses;
describe usuario;
describe olt;
describe splittern1;
describe splittern2;

ALTER TABLE caja ADD COLUMN detalle VARCHAR(50);

ALTER TABLE detallecontrato ADD COLUMN estado_idestado INT NOT NULL,
	ADD CONSTRAINT `fk_estado_idestado` FOREIGN KEY (estado_idestado) 
		REFERENCES estado(idestado);
ALTER TABLE pago ADD COLUMN num_contrato INT NOT NULL,
	ADD CONSTRAINT `fk_num_contrato` FOREIGN KEY (num_contrato) 
		REFERENCES detallecontrato(num_contrato);
        
ALTER TABLE splittern2 ADD CONSTRAINT `fk_dependencia_cd` FOREIGN KEY (dependencia_cd) REFERENCES splittern1(id_splittern1);
        
DELETE FROM detallecontrato WHERE iddetallecontrato=4;
DELETE FROM pago WHERE idpago='2';
delete from detallecontrato;

INSERT INTO pago (num_contrato, montopago, fechapago, mespago,anio) VALUES
(1225,100,'2023-11-23',11,2023);

INSERT INTO meses (idmeses, name_meses) VALUES
(1,'Enero'),
(2,'Febrero'),
(3,'Marzo'),
(4,'Abril'),
(5,'Mayo'),
(6,'Junio'),
(7,'Julio'),
(8,'Agosto'),
(9,'Setiembre'),
(10,'Octubre'),
(11,'Noviembre'),
(12,'Diciembre');

INSERT INTO Caja (idcaja, terminal, spliter, detalle) VALUES
('C0104','01','04','Terminal 01 Spliter 04'),
('C0105','01','05','Terminal 01 Spliter 05'),
('C0106','01','06','Terminal 01 Spliter 06'),
('C0107','01','07','Terminal 01 Spliter 07'),
('C0108','01','08','Terminal 01 Spliter 08')