const express = require("express");
const app = express.Router();

const { usersRole } = require("../controllers");
const auth = require("../config/authMiddleware");

app.get("/", auth.userAuth, usersRole.get_list);
app.get("/:id", auth.userAuth, usersRole.get_by_id);
app.post("/", auth.userAuth, auth.checkRole, usersRole.create); //only admins can create
app.put("/:id", auth.userAuth, auth.checkRole, usersRole.update_by_id); //only admins can update
app.delete("/:id", auth.userAuth, auth.checkRole, usersRole.delete_by_id); //only admins can delete

module.exports = app;
