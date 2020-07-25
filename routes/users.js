const express = require("express");
const app = express.Router();

const { users } = require("../controllers");

app.post("/register", users.register);
app.post("/login", users.login);

module.exports = app;
