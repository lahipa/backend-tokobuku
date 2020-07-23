const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const dotenv = require("dotenv");
const app = express();
const port = 4000;

const { users, kategori, books } = require("./controllers");

dotenv.config();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());

app.get("/", (req, res) => {
  res.status(200).send({
    env: process.env,
  });
});

app.post("/register", users.register);
app.post("/login", users.login);

// app.post("/books", middleware, books.create);
// app.put("/books/:id", middleware, books.update_by_id);
// app.delete("/books/:id", middleware, books.delete_by_id);
app.get("/books", books.get_list);
app.post("/books", books.create);
app.get("/books/:id", books.get_by_id);
app.put("/books/:id", books.update_by_id);
app.delete("/books/:id", books.delete_by_id);

//app.post("/kategori", middleware, kategori.create); //only admins can create
//app.put("/kategori/:id", middleware, kategori.update_by_id); //only admins can update
//app.delete("/kategori/:id", middleware, kategori.delete_by_id); //only admins can delete
app.post("/kategori", kategori.create);
app.get("/kategori", kategori.get_list);
app.get("/kategori/:id", kategori.get_by_id);
app.put("/kategori/:id", kategori.update_by_id);
app.delete("/kategori/:id", kategori.delete_by_id);

/* app.use((req, res, next) => {
  res.status(404).send("Page Not Found");
}); */

app.listen(port, () => console.log(`listening at http://localhost:${port}`));
