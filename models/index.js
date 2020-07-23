const users = require("./users");
const kategori = require("./kategori");
const books = require("./books");
const orders = require("./orders");
const ordersDetail = require("./ordersDetail");

// relasi tabel buku dengan kategori
books.belongsTo(kategori, { foreignKey: "kategori_id", as: "kategori" });
kategori.hasMany(books, { foreignKey: "kategori_id", as: "books" });

module.exports = {
  users,
  kategori,
  books,
  orders,
  ordersDetail,
};
