export class PagoController{

    static todolist (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('SELECT pg.idpago2, pg.dnipago, cl.nombrecli, cl.apellidocli, date_format(pg.fechapago2, "%d-%m-%Y") as fechapago2, pg.hora, pg.descripcion, pg.monto, pg.agencia, pg.operacion FROM pago2 as pg INNER JOIN cliente as cl on pg.dnipago = cl.dnicliente', (err, rows)=>{
                if(err) return res.send(err)
    
                res.json(rows)
                
            })
        })
    }
    static list (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('SELECT idpago, num_contrato, montopago, date_format(fechapago, "%d-%m-%Y") as fechapago, mespago, anio, mediopago, observacion FROM pago', (err, rows)=>{
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