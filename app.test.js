const request = require("supertest");
const app = require("./app");

describe("GET /", () => {
  it("should return Hello from GitHubActions", async () => {
    const res = await request(app).get("/");
    expect(res.statusCode).toBe(200);
  });
});
