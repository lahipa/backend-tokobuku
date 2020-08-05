const express = require("express");
const app = express.Router();

const { cart } = require("../controllers");
const auth = require("../config/authMiddleware");

app.get("/", auth.userAuth, cart.get_cart_list); //get cart data (member only!)
app.post("/", auth.userAuth, cart.add_to_cart); //add to cart (member only!)
app.put("/:id", auth.userAuth, cart.subtract_from_cart); //only member can update
app.delete("/:id", auth.userAuth, cart.delete_cart_list); //only member can delete

module.exports = app;
