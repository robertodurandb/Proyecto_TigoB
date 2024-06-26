export class DetalleController {

    static todolist (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('select dc.num_contrato, dc.diapago, dc.observacion, date_format(dc.fecha_contrato, "%d-%m-%Y") as fecha_contrato, date_format(dc.fechaprog_instalacion, "%d-%m-%Y") as fechaprog_instalacion, dc.estadodc_instalacion, cl.dnicliente, cl.nombrecli, cl.apellidocli, cl.distritocli, cl.direccioncli, cl.telefonocli, cl.fecha_nacimiento, pl.nombreplan, pl.precioplan, pl.velocidadplan, date_format(it.fechainstalacion, "%d-%m-%Y") as fechainstalacion, it.geolocalizacion, it.imagencasa, it.user_create, it.estado, it.observacion_instalacion from detallecontrato as dc INNER JOIN cliente as cl on dc.cliente_dnicliente=cl.dnicliente INNER JOIN planes as pl on dc.planes_idplanes=pl.idplanes INNER JOIN instalacion as it on dc.instalacion_idinstalacion=it.idinstalacion', (err, rows)=>{
                if(err) return res.send(err)
    
                res.json(rows)
                
            })
        })
    }
    static retrievetodolist (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('SELECT dc.num_contrato, dc.diapago, cl.dnicliente, cl.nombrecli, cl.apellidocli, cl.distritocli, cl.direccioncli, pl.nombreplan from detallecontrato as dc INNER JOIN cliente as cl on dc.cliente_dnicliente=cl.dnicliente INNER JOIN planes as pl on dc.planes_idplanes=pl.idplanes WHERE iddetallecontrato = ?', [req.params.id], (err, rows)=>{
                if(err) return res.send(err)
    
                res.json(rows)
            })
        })
    }

    static list (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('select dc.num_contrato, dc.diapago, dc.planes_idplanes, pl.nombreplan, dc.cliente_dnicliente, date_format(dc.fecha_contrato, "%Y-%m-%d") as fecha_contrato, date_format(dc.fecha_instalacion, "%Y-%m-%d") as fecha_instalacion, dc.observacion from detallecontrato as dc INNER JOIN planes as pl on dc.planes_idplanes=pl.idplanes', (err, rows)=>{
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