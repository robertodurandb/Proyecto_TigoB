const jwt = require("jsonwebtoken")
const express = require('express')
// import jwt from 'jsonwebtoken'
// const {verifyToken} = jwt;
//const { sign, verify } = jwt;

 function verifyToken(req, res, next){
    const headerAuth = req.headers['authorization']
    if(headerAuth==null){
        res.status(401).send("Token requerido")
    }
    let token = headerAuth.split(' ')[1]

    jwt.verify(token, process.env.SECRET, (err, decoded)=>{
        if(err){
            res.status(401).send("Token invalido")
        }

        // req.userId = decoded.id
        req.username = decoded.username
        req.role = decoded.role

        next()
    })

}

module.exports = {verifyToken}