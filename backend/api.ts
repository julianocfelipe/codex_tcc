// backend/api.ts
import express from 'express';

const app = express();
const port = 3000;

app.use(express.json());

app.get('/', (req, res) => {
  res.send('API com CommonJS e TypeScript!');
});

app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
