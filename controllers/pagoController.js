export class PagoController{

    static todolist (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('SELECT dc.cliente_dnicliente, dc.num_contrato, cl.apellidocli, cl.nombrecli, pl.nombreplan, pl.precioplan, pg.idpago, date_format(pg.fechapago, "%Y-%m-%d") as fechapago, pg.montopago, pg.mediopago, pg.mespago, pg.anio FROM pago as pg INNER JOIN detallecontrato as dc on dc.num_contrato = pg.num_contrato INNER JOIN cliente as cl on cl.dnicliente = dc.cliente_dnicliente INNER JOIN planes as pl on pl.idplanes = dc.planes_idplanes', (err, rows)=>{
                if(err) return res.send(err)
    
                res.json(rows)
                
            })
        })
    }
    static list (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('SELECT idpago, num_contrato, montopago, date_format(fechapago, "%Y-%m-%d") as fechapago, mespago, anio, mediopago, observacion FROM pago', (err, rows)=>{
                if(err) return res.send(err)
    
                res.json(rows)
                
            })
        })
    }
    static retrieve (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('SELECT * FROM pago WHERE idpago = ?', [req.params.id], (err, rows)=>{
                if(err) return res.send(err)
    
                res.json(rows)
            })
        })
    }
    static create (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('INSERT INTO pago set ?', [req.body], (err, rows)=>{
                if(err) return res.status(401).send(err)
    
                res.status(200).send('Pago added!')
            })
        })
    }
    static delete (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('DELETE FROM pago WHERE idpago = ?', [req.params.id], (err, rows)=>{
                if(err) return res.send(err)
    
                res.send('Pago deleted!')
            })
        })
    }
    static update (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('UPDATE pago set ? WHERE idpago = ?', [req.body, req.params.id], (err, rows)=>{
                if(err) return res.send(err)
    
                res.send('Pago updated!')
            })
        })
    }
}