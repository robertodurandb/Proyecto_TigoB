import express from 'express'
import fs from 'node:fs';
import https from 'node:https';
import mysql from 'mysql2'
import myconn from 'express-myconnection'
import Dotenv from 'dotenv'
import cors from 'cors'

import {ClienteController} from './controllers/clienteController.js'
import {PlanController} from './controllers/planController.js'
import {UserController} from './controllers/userController.js'
import {DetalleController} from './controllers/detalleController.js'
import {PagoController} from './controllers/pagoController.js'
import {InstalacionController} from './controllers/instalacionController.js'
import {LoginController} from './controllers/loginController.cjs'
import {verifyToken} from './middlewares/jwt.cjs'
import {onlyAdmin} from './middlewares/rolejwt.cjs'

Dotenv.config();

//Inicializar Express
const app = express()

//Setting
app.set('port', process.env.PORT || 9100)

const dbOptions = {
    host: 'localhost',
    port: 3306,
    password: process.env.PASSWORD,
    user: process.env.USER,
    database: process.env.DATABASE
}

//middlewares
app.use(myconn(mysql, dbOptions, 'single'))
app.use(express.json())
app.use(cors())

// Routes
// app.get('/mitchell', function(req, res) { 
//     res.sendFile(path.join(__dirname, './build/index.html'), function(err) { 
//         if (err) { res.status(500).send(err) } 
//     })
//     })

//rutas backend********************************

app.get('/', (req, res) => {
    res.send('<h3>Gracias por Autorizar</h3> <br>'+
    'Acceder a la siguiente URL: '+
    '<a href=https://clientes.tigo.com.pe>https://clientes.tigo.com.pe</a>')
})
app.get('/ping', async(req, res) => {
    const result = await pool.query('SELECT NOW()')
    return res.json(result.rows[0])
})
app.get('/clientes', ClienteController.list);
app.get('/cliente/:id', ClienteController.retrieve);
app.post('/cliente', [verifyToken, onlyAdmin], ClienteController.create);
app.delete('/cliente/:id', [verifyToken, onlyAdmin], ClienteController.delete);
app.put('/cliente/:id', [verifyToken], ClienteController.update);

// app.get('/cajas', CajaController.list);
// app.get('/caja/:id', CajaController.retrieve);
// app.post('/caja', [jwtMiddleware, jwtOnlyAdmin], CajaController.create);
// app.delete('/caja/:id', [jwtMiddleware, jwtOnlyAdmin], CajaController.delete);
// app.put('/caja/:id', [jwtMiddleware, jwtOnlyAdmin], CajaController.update);

app.get('/planes', PlanController.list);
app.get('/plan/:id', PlanController.retrieve);
app.post('/plan', [verifyToken, onlyAdmin], PlanController.create);
app.delete('/plan/:id', [verifyToken, onlyAdmin], PlanController.delete);
app.put('/plan/:id', [verifyToken, onlyAdmin], PlanController.update);

app.get('/todolist', DetalleController.todolist);
app.get('/todolist/:id', DetalleController.retrievetodolist);
app.get('/detallecontratos', DetalleController.list);
app.get('/detallecontrato/:id', DetalleController.retrieve);
app.post('/detallecontrato', [verifyToken, onlyAdmin], DetalleController.create);
app.delete('/detallecontrato/:id', [verifyToken, onlyAdmin], DetalleController.delete);
app.put('/detallecontrato/:id', [verifyToken], DetalleController.update);

app.get('/pagos2', PagoController.todolist);
app.get('/pagos', PagoController.list);
app.get('/pago/:id', PagoController.retrieve);
app.post('/pago', [verifyToken, onlyAdmin], PagoController.create);
app.delete('/pago/:id', [verifyToken, onlyAdmin], PagoController.delete);
app.put('/pago/:id', [verifyToken, onlyAdmin], PagoController.update);

app.get('/usuarios', [verifyToken], UserController.list);
app.get('/usuario/:id', [verifyToken], UserController.retrieve);
app.post('/usuario', [verifyToken, onlyAdmin], UserController.create);
app.delete('/usuario/:id', [verifyToken, onlyAdmin], UserController.delete);
app.put('/usuario/:id', [verifyToken, onlyAdmin], UserController.update);

app.get('/instalaciones', InstalacionController.list);
app.get('/instalacion/:id', InstalacionController.retrieve);
app.post('/instalacion', [verifyToken],InstalacionController.create);
app.delete('/instalacion/:id', [verifyToken], InstalacionController.delete);
app.put('/instalacion/:id', [verifyToken],InstalacionController.update);

app.post('/login', LoginController.login);


//Con Certificado************************
https.createServer({
    cert: fs.readFileSync('server.cer'),
    key: fs.readFileSync('server.key'),
}, app).listen(app.get('port'), ()=>{
    console.log('server running on port', app.get('port'))
})

//Sin Certificado***********************
//  app.listen(app.get('port'), ()=>{
//     console.log('server running on port', app.get('port'))
//  })