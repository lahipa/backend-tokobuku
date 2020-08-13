const express = require("express");
const app = express.Router();

const { orders } = require("../controllers");
const auth = require("../config/authMiddleware");

app.get("/", auth.userAuth, orders.get_list); // user must login to see transaction list
app.get("/:id", auth.userAuth, orders.get_by_id); // user must login to see transaction by id
app.post("/", auth.userAuth, orders.create); // user must login to order
app.put("/:id", auth.userAuth, orders.update_by_id); // user must login to order

module.exports = app;
