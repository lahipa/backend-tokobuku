const express = require("express");
const app = express.Router();

const { kategori } = require("../controllers");
const auth = require("../config/authMiddleware");

app.get("/", kategori.get_list);
app.get("/:id", kategori.get_by_id);
app.post("/", auth.userAuth, auth.checkRole, kategori.create); //only admins can create
app.put("/:id", auth.userAuth, auth.checkRole, kategori.update_by_id); //only admins can update
app.delete("/:id", auth.userAuth, auth.checkRole, kategori.delete_by_id); //only admins can delete

module.exports = app;
