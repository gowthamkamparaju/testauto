const express = require('express');
const app = express();
 
app.get('/', (req, res) => {
  res.send('Hello from GitHubActions + Docker on AWS on aug 21 at 5:43 ');
});
 
app.listen(3000, () => {
  console.log('App running on port 3000');
});
