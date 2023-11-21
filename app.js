const express = require('express')
const mysql = require('mysql2')
const myconn = require('express-myconnection')
const Dotenv = require('dotenv')
const cors = require('cors')

const { ClienteController } = require('./controllers/clienteController')
const { CajaController } = require('./controllers/cajaController')
const { EstadoController } = require('./controllers/estadoController')
const { PlanController } = require('./controllers/planController')
const { DetalleController } = require('./controllers/detalleController')
const { UserController } = require('./controllers/userController')

const jwtMiddleware = require('./middlewares/jwt')

Dotenv.config();

const app = express()

app.set('port', process.env.PORT || 9100)

const dbOptions = {
    host: 'localhost',
    port: 3306,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DATABASE
}
//middlewares
app.use(myconn(mysql, dbOptions, 'single'))
app.use(express.json())
app.use(cors())

//rutas********************************

app.get('/', (req, res) => {
    res.send('hello world')
})
app.get('/clientes', ClienteController.list);
app.get('/cliente/:id', ClienteController.retrieve);
app.post('/cliente', jwtMiddleware, ClienteController.create);
app.delete('/cliente/:id', jwtMiddleware, ClienteController.delete);
app.put('/cliente/:id', jwtMiddleware, ClienteController.update);

app.get('/cajas', CajaController.list);
app.get('/caja/:id', CajaController.retrieve);
app.post('/caja', jwtMiddleware, CajaController.create);
app.delete('/caja/:id', jwtMiddleware, CajaController.delete);
app.put('/caja/:id', jwtMiddleware, CajaController.update);

app.get('/estados', EstadoController.list);
app.get('/estado/:id', EstadoController.retrieve);
app.post('/estado', jwtMiddleware, EstadoController.create);
app.delete('/estado/:id', jwtMiddleware, EstadoController.delete);
app.put('/estado/:id', jwtMiddleware, EstadoController.update);

app.get('/planes', PlanController.list);
app.get('/plan/:id', PlanController.retrieve);
app.post('/plan', jwtMiddleware, PlanController.create);
app.delete('/plan/:id', jwtMiddleware, PlanController.delete);
app.put('/plan/:id', jwtMiddleware, PlanController.update);

app.get('/todolist', DetalleController.todolist);
app.get('/todolist/:id', DetalleController.retrievetodolist);
app.get('/detallecontratos', DetalleController.list);
app.get('/detallecontrato/:id', DetalleController.retrieve);
app.post('/detallecontrato', jwtMiddleware, DetalleController.create);
app.delete('/detallecontrato/:id', jwtMiddleware, DetalleController.delete);
app.put('/detallecontrato/:id', jwtMiddleware, DetalleController.update);

app.get('/usuarios', UserController.list);
app.get('/usuario/:id', UserController.retrieve);
app.post('/usuario', UserController.create);
app.delete('/usuario/:id', jwtMiddleware, UserController.delete);
app.put('/usuario/:id', UserController.update);

app.post('/login', UserController.login);

app.listen(app.get('port'), ()=>{
    console.log('server running on port', app.get('port'))
})