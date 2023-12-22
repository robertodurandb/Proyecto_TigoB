const express = require('express')
const mysql = require('mysql2')
const myconn = require('express-myconnection')
const Dotenv = require('dotenv')
const cors = require('cors')

const { ClienteController } = require('./controllers/clienteController')
const { CajaController } = require('./controllers/cajaController')
const { PlanController } = require('./controllers/planController')
const { DetalleController } = require('./controllers/detalleController')
const { UserController } = require('./controllers/userController')
const { PagoController } = require('./controllers/pagoController')

const jwtMiddleware = require('./middlewares/jwt')
const jwtOnlyAdmin = require('./middlewares/rolejwt')

Dotenv.config();

const app = express()

app.set('port', process.env.PORT || 9100)

const dbOptions = {
    host: 'localhost',
    port: 3306,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DATABASE
    // host: 'localhost',
    // user: 'tigo_usertigo',
    // password: '(nacqM8npMp;',
    // database: 'tigo_tigodb'
}

//middlewares
app.use(myconn(mysql, dbOptions, 'single'))
app.use(express.json())
app.use(cors())

//rutas********************************

app.get('/', (req, res) => {
    res.send('hello world')
})
app.get('/ping', async(req, res) => {
    const result = await pool.query('SELECT NOW()')
    return res.json(result.rows[0])
})
app.get('/clientes', ClienteController.list);
app.get('/cliente/:id', ClienteController.retrieve);
app.post('/cliente', [jwtMiddleware, jwtOnlyAdmin], ClienteController.create);
app.delete('/cliente/:id', [jwtMiddleware, jwtOnlyAdmin], ClienteController.delete);
app.put('/cliente/:id', [jwtMiddleware, jwtOnlyAdmin], ClienteController.update);

app.get('/cajas', CajaController.list);
app.get('/caja/:id', CajaController.retrieve);
app.post('/caja', [jwtMiddleware, jwtOnlyAdmin], CajaController.create);
app.delete('/caja/:id', [jwtMiddleware, jwtOnlyAdmin], CajaController.delete);
app.put('/caja/:id', [jwtMiddleware, jwtOnlyAdmin], CajaController.update);

app.get('/planes', PlanController.list);
app.get('/plan/:id', PlanController.retrieve);
app.post('/plan', [jwtMiddleware, jwtOnlyAdmin], PlanController.create);
app.delete('/plan/:id', [jwtMiddleware, jwtOnlyAdmin], PlanController.delete);
app.put('/plan/:id', [jwtMiddleware, jwtOnlyAdmin], PlanController.update);

app.get('/todolist', DetalleController.todolist);
app.get('/todolist/:id', DetalleController.retrievetodolist);
app.get('/detallecontratos', DetalleController.list);
app.get('/detallecontrato/:id', DetalleController.retrieve);
app.post('/detallecontrato', [jwtMiddleware, jwtOnlyAdmin], DetalleController.create);
app.delete('/detallecontrato/:id', [jwtMiddleware, jwtOnlyAdmin], DetalleController.delete);
app.put('/detallecontrato/:id', [jwtMiddleware, jwtOnlyAdmin], DetalleController.update);

app.get('/pagos2', PagoController.todolist);
app.get('/pagos', PagoController.list);
app.get('/pago/:id', PagoController.retrieve);
app.post('/pago', [jwtMiddleware, jwtOnlyAdmin], PagoController.create);
app.delete('/pago/:id', [jwtMiddleware, jwtOnlyAdmin], PagoController.delete);
app.put('/pago/:id', [jwtMiddleware, jwtOnlyAdmin], PagoController.update);

app.get('/usuarios', UserController.list);
app.get('/usuario/:id', UserController.retrieve);
app.post('/usuario', UserController.create);
app.delete('/usuario/:id', [jwtMiddleware, jwtOnlyAdmin], UserController.delete);
app.put('/usuario/:id', UserController.update);

app.post('/login', UserController.login);

app.listen(app.get('port'), ()=>{
    console.log('server running on port', app.get('port'))
})