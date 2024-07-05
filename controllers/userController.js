export class UserController {

    static list(req, res) {
        req.getConnection((err, conn) => {
            if (err) return res.send(err)
            conn.query('SELECT * FROM usuario', (err, rows) => {
                if (err) return res.send(err)

                res.json(rows)
            })
        })
    }
    static retrieve(req, res) {
        req.getConnection((err, conn) => {
            if (err) return res.send(err)

            conn.query('SELECT * FROM usuario WHERE dniuser = ?', [req.params.id], (err, rows) => {
                if (err) return res.send(err)

                res.json(rows)
            })
        })
    }
    static create(req, res) {
        req.getConnection((err, conn) => {
            if (err) return res.send(err)
            let data = req.body;

            bcrypt.genSalt(10, (err, salt) => {
                bcrypt.hash(data.password, salt, (err, newPassword) => {
                    data.password = newPassword

                    conn.query('INSERT INTO usuario set ?', [data], (err, rows) => {
                        if (err) return res.send(err)

                        res.send('user added!')
                    })
                })
            })
        })
    }
    static delete(req, res) {
        req.getConnection((err, conn) => {
            if (err) return res.send(err)

            conn.query('DELETE FROM usuario WHERE dniuser = ?', [req.params.id], (err, rows) => {
                if (err) return res.send(err)

                res.send('user deleted!')
            })
        })
    }

    // static update_password(req, res) {
    //     req.getConnection((err, conn) => {
    //         if (err) return res.send(err)
    //         let data = req.body;

    //         bcrypt.genSalt(10, (err, salt) => {
    //             bcrypt.hash(data.password, salt, (err, newPassword) => {
    //                 data.password = newPassword

    //                 conn.query('UPDATE usuario set WHERE dniuser = ?', [data], (err, rows) => {
    //                     if (err) return res.send(err)

    //                     res.send('password modificado con exito!')
    //                 })
    //             })
    //         })
    //     })
    // }

    static update(req, res) {
        req.getConnection((err, conn) => {
            if (err) return res.send(err)
                    conn.query('UPDATE usuario set ? WHERE dniuser = ?', [req.body, req.params.id], (err, rows) => {
                        if (err) return res.send(err)
                        res.send('user updated!')
                    })     
        })
    }
}