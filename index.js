const express = require("express");
const helmet = require("helmet");
const dotenv = require("dotenv");
const bodyParser = require("body-parser");
const cors = require("cors");
const routes = require("./routes");
const app = express();
const port = 4000;

app.use(helmet());

dotenv.config();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());

app.get("/", (req, res) => {
  res.status(200).send({
    message: "Server runing...",
  });
});

app.use("/uploads", express.static("uploads"));
app.use("/users", routes.users);
app.use("/users-role", routes.usersRole);
app.use("/books", routes.books);
app.use("/kategori", routes.kategori);
app.use("/cart", routes.cart);
app.use("/orders", routes.orders);

app.listen(port, () => console.log(`listening at http://localhost:${port}`));
