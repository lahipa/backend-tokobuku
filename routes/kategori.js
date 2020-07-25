const express = require("express");
const app = express.Router();

const { kategori } = require("../controllers");
const usersTokenAuth = require("../config/usersTokenMiddleware");

//app.post("/kategori", kategori.create);
//app.put("/kategori/:id", kategori.update_by_id);
//app.delete("/kategori/:id", kategori.delete_by_id);
app.get("/", kategori.get_list);
app.get("/:id", kategori.get_by_id);
app.post("/", usersTokenAuth, kategori.create); //only admins can create
app.put("/:id", usersTokenAuth, kategori.update_by_id); //only admins can update
app.delete("/:id", usersTokenAuth, kategori.delete_by_id); //only admins can delete

module.exports = app;
