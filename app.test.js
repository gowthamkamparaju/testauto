const request = require("supertest");
const app = require("./app"); // Import the app

describe("App Routes", () => {
  test("GET / should return Hello GitHubActions", async () => {
    const response = await request(app).get("/");
    expect(response.status).toBe(200);
    expect(response.text).toBe("Hello GitHubActions");
  });

  test("GET /health should return status ok", async () => {
    const response = await request(app).get("/health");
    expect(response.status).toBe(200);
    expect(response.body).toEqual({ status: "ok" });
  });

  test("GET /unknown should return 404", async () => {
    const response = await request(app).get("/unknown");
    expect(response.status).toBe(404);
  });
});
