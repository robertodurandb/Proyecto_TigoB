class DetalleController {

    static todolist (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('select dc.num_contrato, dc.diapago, cl.dnicliente, cl.nombrecli, cl.apellidocli, cl.distritocli, cl.direccioncli, cl.telefonocli, date_format(dc.fecha_contrato, "%d-%m-%Y") as fecha_contrato, date_format(dc.fecha_instalacion, "%d-%m-%Y") as fecha_instalacion, pl.nombreplan, pl.precioplan, pl.velocidadplan, cj.nombrecaja, cj.localizacion from detallecontrato as dc INNER JOIN cliente as cl on dc.cliente_dnicliente=cl.dnicliente INNER JOIN planes as pl on dc.planes_idplanes=pl.idplanes INNER JOIN caja as cj on dc.caja_idcaja=cj.idcaja', (err, rows)=>{
                if(err) return res.send(err)
    
                res.json(rows)
                
            })
        })
    }
    static retrievetodolist (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('SELECT dc.num_contrato, dc.diapago, cl.dnicliente, cl.nombrecli, cl.apellidocli, cl.distritocli, cl.direccioncli, pl.nombreplan, cj.nombrecaja, cj.localizacion from detallecontrato as dc INNER JOIN cliente as cl on dc.cliente_dnicliente=cl.dnicliente INNER JOIN planes as pl on dc.planes_idplanes=pl.idplanes INNER JOIN caja as cj on dc.caja_idcaja=cj.idcaja WHERE iddetallecontrato = ?', [req.params.id], (err, rows)=>{
                if(err) return res.send(err)
    
                res.json(rows)
            })
        })
    }

    static list (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('select dc.num_contrato, dc.diapago, dc.planes_idplanes, pl.nombreplan, dc.cliente_dnicliente, dc.caja_idcaja, cj.nombrecaja, date_format(dc.fecha_contrato, "%Y-%m-%d") as fecha_contrato, date_format(dc.fecha_instalacion, "%Y-%m-%d") as fecha_instalacion, dc.instalacion from detallecontrato as dc INNER JOIN planes as pl on dc.planes_idplanes=pl.idplanes INNER JOIN caja as cj on dc.caja_idcaja=cj.idcaja', (err, rows)=>{
                if(err) return res.send(err)
    
                res.json(rows)
                
            })
        })
    }
    static retrieve (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('SELECT * FROM detallecontrato WHERE num_contrato = ?', [req.params.id], (err, rows)=>{
                if(err) return res.send(err)
    
                res.json(rows)
            })
        })
    }
    static create (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('INSERT INTO detallecontrato set ?', [req.body], (err, rows)=>{
                if(err) return res.status(401).send(err)
    
                res.status(200).send('detallecontrato added!')
            })
        })
    }
    static delete (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('DELETE FROM detallecontrato WHERE num_contrato = ?', [req.params.id], (err, rows)=>{
                if(err) return res.send(err)
    
                res.send('detallecontrato delete!')
            })
        })
    }
    static update (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('UPDATE detallecontrato set ? WHERE num_contrato = ?', [req.body, req.params.id], (err, rows)=>{
                if(err) return res.send(err)
    
                res.send('detallecontrato updated!')
            })
        })
    }
}
module.exports = {DetalleController}