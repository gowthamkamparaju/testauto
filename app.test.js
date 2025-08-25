const request = require("supertest");
const app = require("./app");

describe("App Routes", () => {
  it("should return 200 OK on /", async () => {
    const res = await request(app).get("/");
    expect(res.statusCode).toBe(200);
  });

  it("should return Hello message", async () => {
    const res = await request(app).get("/");
    expect(res.text).toContain("Hello from Jenkins + Docker on AWS!");
  });
});
