import express from 'express';
import { usersRouter } from './routes/users';

const app = express();
app.use(express.json());

app.use(usersRouter);

app.get('/', (req, res) => {
  res.json('hello from api');
});

app.all('*', (req, res) => {
  res.status(404).json('Not found');
});

export default app;
