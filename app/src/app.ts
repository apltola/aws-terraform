import express from 'express';
import { usersRouter } from './routes/users';

const app = express();
app.use(express.json());

app.use(usersRouter);

app.get('/api', (req, res) => {
  res.json({ msg: 'hello', node_env: process.env.NODE_ENV });
});

export default app;
