import express from 'express';
import path from 'path';
import app from './app';

console.log('node_env --> ', process.env.NODE_ENV);
if (process.env.NODE_ENV === 'production') {
  const frontendDist = path.resolve(__dirname, '../frontend', 'dist');
  app.use('/', express.static(frontendDist));
  app.get('*', (req, res) => {
    res.sendFile(path.resolve(frontendDist, 'index.html'));
  });
}

const PORT = process.env.PORT || 8000;
app.listen(PORT, () => {
  console.log(`🆙 SERVER LISTENING AT ${PORT}`);
});
