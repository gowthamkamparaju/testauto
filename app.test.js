const request = require("supertest");
const { app, server } = require("./app");

describe("App Routes", () => {
  afterAll(() => {
    server.close();   // ✅ This ensures Jest exits cleanly
  });

  it("should return 200 OK on /", async () => {
    const res = await request(app).get("/");
    expect(res.statusCode).toBe(200);
  });

  it("should return Hello message", async () => {
    const res = await request(app).get("/");
    expect(res.text).toContain("Hello from Jenkins + Docker on AWS!");
  });
});
