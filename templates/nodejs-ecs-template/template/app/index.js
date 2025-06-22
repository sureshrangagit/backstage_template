const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('Hello from ECS Node.js!'));
app.listen(3001);
