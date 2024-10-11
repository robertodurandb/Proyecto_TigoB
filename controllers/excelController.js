import multer from 'multer'
import exceljs from 'exceljs'
import {logger} from '../controllers/logger.js';

// Configuración de Multer
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'excelfile/'); // Directorio donde se guardarán las imágenes
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + '-' + file.originalname) // Nombre único para el archivo
  }
})
let upload = multer({ storage: storage })
const newexcelfile = upload.single('excel')

// Importando datos a mysql
const uploadexcel = (req, res) => {
  req.getConnection((err, conn)=>{
     if(err) return res.send(err)

        // Recibir el archivo Excel
    const file = req.file
  
    // Leer el archivo Excel
    const workbook = new exceljs.Workbook();
    workbook.xlsx.readFile(file.path)
      .then(() => {
        const worksheet = workbook.getWorksheet(1); // Suponiendo que los datos están en la primera hoja
        // Iterar sobre las filas y insertar los datos en la base de datos
        worksheet.eachRow((row, number) => {
          if (number > 5) { // Saltar la cabecera
            let datofecha = row.getCell(1).value
            const partesFecha = datofecha.split('/');
            const newdatofecha = new Date(partesFecha[2], partesFecha[1] - 1, partesFecha[0]).toISOString().slice(0, 10);
            const data = {
              // Mapear los datos de la fila a los campos de la tabla            
              fechapago2: newdatofecha,
              descripcion: row.getCell(3).value,
              dnipago: row.getCell(4).value,
              monto: row.getCell(5).value,
              agencia: row.getCell(7).value,
              operacion: row.getCell(8).value,
              hora: row.getCell(9).value,
              // ...
            };
            
            conn.query('INSERT INTO pago2 SET ?', data, (err, results) => {
              if (err) {
                console.error(err.sqlMessage);
                console.log('Error con el DNI: '+data.dnipago)
                logger.error('Error con el DNI: '+data.dnipago)
                //res.send('Error, '+data.dnipago)
              } else {
                console.log('Registro exitoso DNI: '+data.dnipago);
                logger.info('Registro exitoso DNI: '+data.dnipago);
                //res.send('Data added, '+data.dnipago)
              }
            });
          }
        });

        res.status(200).send("file added");
      })
      .catch(err => {
        logger.error(err);
        res.status(500).send('Error al importar los datos');
      });
  })
  }

export {newexcelfile, uploadexcel}