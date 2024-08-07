export class InstalacionController {

    static list (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('SELECT idinstalacion, date_format(fechainstalacion, "%d-%m-%Y") as fechainstalacion, geolocalizacion, user_create, fecha_create, estado, observacion_instalacion, contratoinstalacion FROM instalacion', (err, rows)=>{
                if(err) return res.send(err)
    
                res.json(rows)
                
            })
        })
    }
    static retrieve (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('SELECT * FROM instalacion WHERE contratoinstalacion = ?', [req.params.id], (err, rows)=>{
                if(err) return res.send(err)
    
                res.json(rows)
            })
        })
    }
    static create (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('INSERT INTO instalacion set ?', [req.body], (err, rows)=>{
                if(err) {
                    return res.status(401).send(err)
                }else{
                    let idinsta = rows.insertId;
                    res.status(200).send('Instalacion added, '+idinsta)
                  
                }
               
            })
        })
    }
    static delete (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('DELETE FROM instalacion WHERE idinstalacion = ?', [req.params.id], (err, rows)=>{
                if(err) return res.send(err)
    
                res.send('instalacion delete!')
            })
        })
    }
    static update (req, res){
        req.getConnection((err, conn)=>{
            if(err) return res.send(err)
    
            conn.query('UPDATE instalacion set ? WHERE idinstalacion = ?', [req.body, req.params.id], (err, rows)=>{
                if(err) return res.send(err)
    
                res.send('instalacion updated!')
            })
        })
    }
}