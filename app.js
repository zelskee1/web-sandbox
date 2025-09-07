const express = require('express');
const path = require('path');
const app = express();

app.use(express.static('public'));

let n = 0;

// HOMEPAGE
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/index.html'));
    console.log('Route / was consulted');
});

// AUTRE PAGE
app.get('/autrepage', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/autrepage.html'));
    console.log('Route /autrepage was consulted');
});

// COMPTEUR DE CONSULTATIONS
app.get('/consult', (req, res) => {
    console.log(`Route /consult was consulted ` + ++n + ` times`);
    res.send('Bonjour ! cette page a été consulté ' + n + ' fois !');
});

// DEMARRAGE SERVEUR
app.listen(3000, () => {
  console.log('Serveur démarré sur http://localhost:3000');
});