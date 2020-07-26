const express = require("express");
const app = express.Router();

const { usersRole } = require("../controllers");
const auth = require("../config/authMiddleware");

//app.post("/", usersRole.create);
//app.put("/:id", usersRole.update_by_id);
//app.delete("/:id", usersRole.delete_by_id);
app.get("/", usersRole.get_list);
app.get("/:id", usersRole.get_by_id);
app.post("/", auth.userAuth, auth.checkRole, usersRole.create); //only admins can create
app.put("/:id", auth.userAuth, auth.checkRole, usersRole.update_by_id); //only admins can update
app.delete("/:id", auth.userAuth, auth.checkRole, usersRole.delete_by_id); //only admins can delete

module.exports = app;
