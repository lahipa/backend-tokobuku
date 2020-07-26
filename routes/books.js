const express = require("express");
const app = express.Router();

const { books } = require("../controllers");
const auth = require("../config/authMiddleware");
const multer = require("multer");
const util = require("util");

/* const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, "./public/asset/images");
    },
    filename: function (req, file, cb) {
      cb(null, new Date().toISOString() + "-" + file.originalname);
    },
  });
  
  const imageFilter = (req, file, cb) => {
    if (file.mimetype === "image/jpeg" || file.mimetype === "image/png") {
      cb(null, true);
    } else {
      cb(null, false);
    }
  }; */

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "uploads/");
  },
  filename: function (req, file, cb) {
    var fileObj = {
      "image/png": ".png",
      "image/jpeg": ".jpeg",
      "image/jpg": ".jpg",
    };
    if (fileObj[file.mimetype] == undefined) {
      cb(new Error("file format not valid"));
    } else {
      cb(null, file.fieldname + "-" + Date.now() + fileObj[file.mimetype]);
    }
  },
});

const upload = multer({
  storage: storage,
  limits: {
    fileSize: 1024 * 1024 * 5,
  },
  //fileFilter: imageFilter,
});
const uploadAsync = util.promisify(upload.single("image_url"));

// app.post("/", uploadAsync, books.create);
// app.put("/:id", uploadAsync, books.update_by_id);
// app.delete("/:id", books.delete_by_id);
app.get("/", books.get_list);
app.get("/:id", books.get_by_id);
app.post("/", auth.userAuth, auth.checkRole, uploadAsync, books.create);
app.put("/:id", auth.userAuth, auth.checkRole, uploadAsync, books.update_by_id);
app.delete("/:id", auth.userAuth, auth.checkRole, books.delete_by_id);

module.exports = app;
