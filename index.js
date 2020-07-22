const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const dotenv = require("dotenv");

const books = require("./controller/books");
const users = require("./controller/users");

dotenv.config();

const app = express();
const port = 4000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());

app.get("/", (req, res) => {
  res.status(200).send({
    env: process.env,
  });
});

app.get("/books", books.getAll);
app.post("/books", books.createBook);
app.get("/books/:id", books.get_detail_by_id);
app.put("/books/:id", books.update_by_id);
app.delete("/books/:id", books.delete_by_id);

app.get("/users", users.getAll);
app.post("/users", users.createUser);

/* app.use((req, res, next) => {
  res.status(404).send("Page Not Found");
}); */

app.listen(port, () => console.log(`listen this port ${port}`));
