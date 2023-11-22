class PagoController{

    static list (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('SELECT * FROM pago', (err, rows)=>{
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
module.exports = {PagoController}