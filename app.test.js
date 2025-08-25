// app.test.js
const request = require("supertest");
const app = require("./app");  // ensure app.js exports the Express app

test("GET / should return Hello World", async () => {
  const res = await request(app).get("/");
  expect(res.statusCode).toBe(200);
  expect(res.text).toBe("Hello World");
});
