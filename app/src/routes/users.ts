import express, { Request, Response } from 'express';
import { faker } from '@faker-js/faker';

const router = express.Router();

router.get('/api/users', async (req: Request, res: Response) => {
  const names = Array.from({ length: 10 }).map((i) => faker.name.fullName());

  res.json(names);
});

export { router as usersRouter };
