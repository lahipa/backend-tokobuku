const express = require("express");
const app = express.Router();

const { orders } = require("../controllers");
const usersTokenAuth = require("../config/usersTokenMiddleware");

// app.post('/', orders.create);
// app.get('/:id', orders.get_by_id);
// app.get('/', orders.get_list);
app.post("/", usersTokenAuth, orders.create); // user must login to order
app.get("/:id", usersTokenAuth, orders.get_by_id); // user must login to see transaction by id
app.get("/", usersTokenAuth, orders.get_list); // user must login to see transaction list

module.exports = app;
