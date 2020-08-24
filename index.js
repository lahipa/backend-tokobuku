const express = require("express");
const helmet = require("helmet");
const dotenv = require("dotenv");
const bodyParser = require("body-parser");
const cors = require("cors");
const routes = require("./routes");
const app = express();
const port = 80;

// helmet is to enhance your API's security
app.use(helmet());

dotenv.config();

// bodyParser is to parse JSON bodies into JS objects
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// enambling cors with option setting on all route
let whitelist = ["http://localhost:3000", "http://localhost:3001"];
let corsOpt = {
  origin: function (origin, callback) {
    if (whitelist.indexOf(origin) !== -1 || !origin) {
      callback(null, true);
    } else {
      callback(new Error("Not allowed by CORS!"));
    }
  },
  methods: "GET,PUT,POST,DELETE",
  preflightContinue: false,
  optionsSuccessStatus: 204,
};

app.use(cors(corsOpt));

app.get("/", (req, res) => {
  res.status(200).send({
    message: "Server runing...",
  });
});

app.use("/uploads", express.static("uploads")); // static access (asset file like css, javascript, img)
app.use("/users", routes.users);
app.use("/users-role", routes.usersRole);
app.use("/books", routes.books);
app.use("/kategori", routes.kategori);
app.use("/cart", routes.cart);
app.use("/orders", routes.orders);

app.listen(port, () => console.log(`listening at port:${port}`));
