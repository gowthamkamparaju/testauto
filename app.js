const express = require("express");
const app = express();

app.get("/", (req, res) => res.send("Hello GutHubActions + Docker on AWS"));
app.get("/health", (req, res) => res.json({ status: "ok" }));

// Export for testing
module.exports = app;

// Only start server if not in test mode
if (require.main === module) {
  const port = process.env.PORT || 3000;
  app.listen(port, () => console.log(`App running on port ${port}`));
}
