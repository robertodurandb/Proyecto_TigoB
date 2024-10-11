import express from 'express'
import mysql from 'mysql2'
import myconn from 'express-myconnection'
import Dotenv from 'dotenv'
import cors from 'cors'

import {ClienteController} from './controllers/clienteController.js';
import {PlanController} from './controllers/planController.js';
import {UserController} from './controllers/userController.js';
import {DetalleController} from './controllers/detalleController.js';
import {PagoController} from './controllers/pagoController.js';
import {InstalacionController} from './controllers/instalacionController.js';
import {LoginController} from './controllers/loginController.cjs';
import {verifyToken} from './middlewares/jwt.cjs';
import {onlyAdmin} from './middlewares/rolejwt.cjs';
import {newupload, uploadfile} from './controllers/imageController.js';
import {newexcelfile, uploadexcel} from './controllers/excelController.js';
import {getlogs} from './controllers/logger.js';

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
app.use(express.static('uploads'));
app.use(cors())

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

//CLIENTES
app.get('/clientes', ClienteController.list);
app.get('/cliente/:id', ClienteController.retrieve);
app.post('/cliente', [verifyToken, onlyAdmin], ClienteController.create);
app.delete('/cliente/:id', [verifyToken, onlyAdmin], ClienteController.delete);
app.put('/cliente/:id', [verifyToken], ClienteController.update);

//PLANES
app.get('/planes', PlanController.list);
app.get('/plan/:id', PlanController.retrieve);
app.post('/plan', [verifyToken, onlyAdmin], PlanController.create);
app.delete('/plan/:id', [verifyToken, onlyAdmin], PlanController.delete);
app.put('/plan/:id', [verifyToken, onlyAdmin], PlanController.update);

//CONTRATOS
app.get('/todoinstacli', DetalleController.todoinstacli);
app.get('/pendinstacli', DetalleController.pendinstacli);
app.get('/todocontratosactiv', DetalleController.todocontratosactiv);
app.get('/todocontratosactiv/:id', DetalleController.retrieve);
app.post('/detallecontrato', [verifyToken, onlyAdmin], DetalleController.create);
//app.delete('/detallecontrato/:id', [verifyToken, onlyAdmin], DetalleController.delete);
app.put('/pendinstacli/:id', [verifyToken], DetalleController.update);

//PAGOS
app.get('/pagos2', PagoController.todolist);
app.get('/pagos', PagoController.list);
app.get('/pago/:id', PagoController.retrieve);
app.post('/pago', [verifyToken, onlyAdmin], PagoController.create);
app.delete('/pago/:id', [verifyToken, onlyAdmin], PagoController.delete);
app.put('/pago/:id', [verifyToken, onlyAdmin], PagoController.update);

//USUARIOS
app.get('/usuarios', [verifyToken], UserController.list);
app.get('/usuario/:id', [verifyToken], UserController.retrieve);
app.post('/usuario', [verifyToken, onlyAdmin], UserController.create);
app.delete('/usuario/:id', [verifyToken, onlyAdmin], UserController.delete);
app.put('/usuario/:id', [verifyToken, onlyAdmin], UserController.update);

//INSTALACIONES
app.get('/instalaciones', InstalacionController.list);
app.get('/instalacion/:id', InstalacionController.retrieve);
app.post('/instalacion', [verifyToken],InstalacionController.create);
app.delete('/instalacion/:id', [verifyToken], InstalacionController.delete);
app.put('/instalacion/:id', [verifyToken],InstalacionController.update);

//IMAGENES
app.get('/:img', function(req, res){
    res.sendFile( `uploads/${img}` );
});
app.post('/imagen', newupload, uploadfile)
app.put('/imagen/:id', newupload)

//CARGA EXCEL
app.post('/importar', newexcelfile, uploadexcel)

// Endpoint para obtener los logs
app.get('/logs', getlogs);

// app.post('/importar', newexcelfile, (req, res) => {
//     // Recibir el archivo Excel
//     const file = req.file
//     console.log(file)
  
//     // Leer el archivo Excel
//     const workbook = new exceljs.Workbook();
//     workbook.xlsx.readFile(file.path)
//       .then(() => {
//         const worksheet = workbook.getWorksheet(1); // Suponiendo que los datos están en la primera hoja
  
//         // Iterar sobre las filas y insertar los datos en la base de datos
//         worksheet.eachRow((row, number) => {
//           if (number > 1) { // Saltar la cabecera
//             const data = {
//               // Mapear los datos de la fila a los campos de la tabla
//               columna1: row.getCell(1).value,
//               columna2: row.getCell(2).value,
//               columna3: row.getCell(3).value,
//               columna4: row.getCell(4).value,
//               columna5: row.getCell(5).value,
//               columna6: row.getCell(6).value,
//               // ...
//             };
  
//             conn.query('INSERT INTO pago2 SET ?', data, (err, results) => {
//               if (err) {
//                 console.error(err);
//               } else {
//                 console.log('Datos insertados correctamente');
//               }
//             });
//           }
//         });
  
//         res.send('Datos importados');
//       })
//       .catch(err => {
//         console.error(err);
//         res.status(500).send('Error al importar los datos');
//       });
//   });
  

//LOGIN
app.post('/login', LoginController.login);


//Con Certificado************************
// https.createServer({
//     cert: fs.readFileSync('server.cer'),
//     key: fs.readFileSync('server.key'),
// }, app).listen(app.get('port'), ()=>{
//     console.log('server running on port', app.get('port'))
// })

//Sin Certificado***********************
 app.listen(app.get('port'), ()=>{
    console.log('server running on port', app.get('port'))
 })