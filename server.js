'use strict';

const express = require('express');
const path = require('path');
const rateLimit = require('express-rate-limit');

const app = express();
const PORT = process.env.PORT || 3000;

// Apply rate limiting to all requests (100 requests per 15 minutes per IP)
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
  standardHeaders: true,
  legacyHeaders: false,
});
app.use(limiter);

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, 'public')));

// Explicit routes so the paths are always reachable
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.get('/privacy', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'privacy.html'));
});

app.listen(PORT, () => {
  console.log(`n8n-AI landing server running on port ${PORT}`);
});
