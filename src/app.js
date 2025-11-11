const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

app.get("/api/health", (_req, res) => {
  res.json({ ok: true, service: "SecPipelines API", version: "1.0.0" });
});

if (require.main === module) {
  app.listen(PORT, () =>
    console.log(`Server running on http://localhost:${PORT}`)
  );
}

module.exports = app;
