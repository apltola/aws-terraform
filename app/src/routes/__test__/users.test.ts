import request from 'supertest';
import app from '../../app';

it('returns users', async () => {
  const res = await request(app).get('/api/users').expect(200);
  expect(res.body.length).toBeGreaterThan(0);
});

it('returns 404 for unknown endpoint', async () => {
  await request(app).get('/api/wefasdfasdf').expect(404);
});
