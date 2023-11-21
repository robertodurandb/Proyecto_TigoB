use tigo;

select * from cliente;
select * from caja;
select * from estado;
select * from planes;
select * from detallecontrato;
select iddetallecontrato, num_contrato, num_talonario, planes_idplanes, cliente_dnicliente, caja_idcaja, 
date_format(fecha_contrato, "%d-%m-%Y") as fecha_contrato, dia_pago, estado from detallecontrato;

/*Consultas avanzadas*/
select cl.dnicliente, cl.nombrecli, cl.distritocli, dc.fecha_contrato, dc.dia_pago, pl.descplan, cj.idcaja, cj.localizacion 
from detallecontrato as dc
INNER JOIN cliente as cl on dc.cliente_dnicliente=cl.dnicliente
INNER JOIN planes as pl on dc.planes_idplanes=pl.idplanes
INNER JOIN caja as cj on dc.caja_idcaja=cj.idcaja;


describe cliente;
describe caja;
describe detallecontrato;
describe estado;
describe planes;

ALTER TABLE caja ADD COLUMN detalle VARCHAR(50);

ALTER TABLE detallecontrato ADD COLUMN estado_idestado INT NOT NULL,
	ADD CONSTRAINT `fk_estado_idestado` FOREIGN KEY (estado_idestado) 
		REFERENCES estado(idestado);
        
DELETE FROM detallecontrato WHERE iddetallecontrato=4;
DELETE FROM caja WHERE idcaja='c0103';
delete from caja;

INSERT INTO Caja (idcaja, terminal, spliter, detalle) VALUES
('C0104','01','04','Terminal 01 Spliter 04'),
('C0105','01','05','Terminal 01 Spliter 05'),
('C0106','01','06','Terminal 01 Spliter 06'),
('C0107','01','07','Terminal 01 Spliter 07'),
('C0108','01','08','Terminal 01 Spliter 08')
