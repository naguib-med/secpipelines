const request = require("supertest");
const app = require("../src/app");

describe("GET /api/health", () => {
  it("should return health status", async () => {
    const res = await request(app).get("/api/health");
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty("ok", true);
    expect(res.body).toHaveProperty("service", "SecPipelines API");
    expect(res.body).toHaveProperty("version", "1.0.0");
  });
});
