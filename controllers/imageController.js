import multer from 'multer'

// Configuración de Multer
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/'); // Directorio donde se guardarán las imágenes
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + '-' + file.originalname) // Nombre único para el archivo
  }
})
let upload = multer({ storage: storage })
const newupload = upload.single('image')
// Ruta para subir imágenes

const uploadfile = (req, res) => {

req.getConnection((err, conn)=>{
   if(err) return res.send(err)

       const tipo = req.file.mimetype
       const nombreimg = req.file.filename

       conn.query('INSERT INTO imagen set ?', 
         [{tipo, nombreimg}], (err, rows)=>{
           if(err) {
               return res.status(401).send(err)
           }else{
               let idimag = rows.insertId;
               res.status(200).send('Imagen added, '+idimag)  
              console.log(req.file.filename)
           }
          
       })

})
}


export {newupload, uploadfile}

    

