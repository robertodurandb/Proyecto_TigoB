const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

class LoginController {
    static login(req, res) {
        req.getConnection((err, conn) => {
            if (err) return res.send(err)

            let username = req.body.username;
            let password = req.body.password;

            conn.query('SELECT * FROM usuario WHERE dniuser = ? AND estado_user = "Activo"', [username], function(error, results, fields) {
                    
                if (error){
                    res.send({          
                        "code":400,          
                        "failed":"error ocurred",          
                        "error" : error        
                        })        
                }else{
                    if(results.length>0){
                        bcrypt.compare(req.body.password, results[0].password, function(err, result){
                        if(result) {
                            let payload = {
                                // id: results[0].dniuser,
                                username: results[0].dniuser,
                                role: results[0].perfil_user
                            }
                            const token = jwt.sign(payload, process.env.SECRET, {expiresIn: '3600s'});
                            return res.status(200).send({ 
                                token : token,
                                role : results[0].perfil_user,
                                username : results[0].dniuser
                            });
                            
                        }else{
                            return res.status(401).send({ message: "Invalid Password"});
                        }

                        });
                    }else{
                        return res.status(401).send({ message: "Invalid User"});
                    }
                } 
                
            })
        })
    }
}
module.exports = {LoginController}