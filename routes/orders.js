const express = require("express");
const app = express.Router();

const { orders } = require("../controllers");
const auth = require("../config/authMiddleware");

// app.post('/', orders.create);
// app.get('/:id', orders.get_by_id);
// app.get('/', orders.get_list);
app.post("/", auth.userAuth, orders.create); // user must login to order
app.get("/:id", auth.userAuth, orders.get_by_id); // user must login to see transaction by id
app.get("/", auth.userAuth, orders.get_list); // user must login to see transaction list

module.exports = app;
