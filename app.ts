import * as dotenv from 'dotenv';
import express, { Request, Response } from 'express';
import * as bodyParser from 'body-parser';
import { orderRouter } from './src/routes/orderRouter';
import { db } from './db';
import swaggerUi from 'swagger-ui-express';
import * as swaggerDocument from './src/swagger.json';
import cors from 'cors';

const app = express();
dotenv.config();

app.use(cors());
app.use(bodyParser.json());
app.use('/orders', orderRouter);

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

db.connect((err) => {
	if (err) {
		console.log('Database connection error');
	} else {
		console.log('Database Connected');
	}
});

app.use((req: Request, res: Response) => {
	res.status(404).send({ error: 'Not Found', message: 'Welcome! Go to /api-docs for documentation' });
});

app.listen(process.env.PORT, () => {
	console.log('Node server started running');
	console.log(`Go to http://${process.env.HOST}:${process.env.PORT}`);
});