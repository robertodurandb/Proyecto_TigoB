// import {jwt} from 'jsonwebtoken'
const jwt = require("jsonwebtoken")

function onlyAdmin(req, res, next){
    if (req.role == "Admin") {
        next()
    } else {
        res.status(401).send("No autorizado")
    }
}

module.exports = {onlyAdmin}