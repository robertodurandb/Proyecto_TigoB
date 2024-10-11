import winston from 'winston';

const logger = winston.createLogger({
    level: 'info',
    format: winston.format.json(),
    defaultMeta: { service: 'user-service' },
    transports: [
        new winston.transports.File({ filename: 'combined.log' })
    ]
})
const getlogs=(req, res) => {
    // Simulación de obtención de logs (reemplazar con tu lógica real)
    const logs = logger.transports.File.log
    res.json(logs);
}

export {logger, getlogs}


