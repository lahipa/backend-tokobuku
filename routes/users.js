const express = require("express");
const app = express.Router();

const { users } = require("../controllers");
const auth = require("../config/authMiddleware");

app.post("/register", users.register);
app.post("/login", users.login);
app.get("/", auth.userAuth, auth.checkRole, users.get_list); //only admins can see list users
app.get("/:id", auth.userAuth, auth.checkRole, users.get_by_id); //only admins can see detail users
app.put("/:id", auth.userAuth, auth.checkRole, users.update_by_id); //only admins can edit users
app.delete("/:id", auth.userAuth, auth.checkRole, users.delete_by_id); //only admins can delete users

module.exports = app;
