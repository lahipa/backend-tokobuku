const users = require("./users");
const usersRole = require("./users_role");
const kategori = require("./kategori");
const books = require("./books");
const orders = require("./orders");
const ordersDetail = require("./ordersDetail");

// relasi tabel users dengan role
users.belongsTo(usersRole, { foreignKey: "role_id", as: "role" });
usersRole.hasMany(users, { foreignKey: "role_id", as: "users" });

// relasi tabel buku dengan kategori
books.belongsTo(kategori, { foreignKey: "kategori_id", as: "kategori" });
kategori.hasMany(books, { foreignKey: "kategori_id", as: "books" });

// relasi tabel orders dengan users
orders.belongsTo(users, { foreignKey: "user_id", as: "customers_detail" });
users.hasMany(orders, { foreignKey: "user_id", as: "orders" });

// relasi tabel orders dengan books
// orders.belongsTo(books, { foreignKey: "buku_id", as: "buku" });
// books.hasMany(orders, { foreignKey: "buku_id", as: "orders" });

// relasi tabel orders_detail dengan detail
ordersDetail.belongsTo(orders, { foreignKey: "order_id", as: "orders" });
orders.hasMany(ordersDetail, { foreignKey: "order_id", as: "orders_detail" });

// relasi tabel order_detail dengan books
ordersDetail.belongsTo(books, { foreignKey: "buku_id", as: "books" });
books.hasMany(ordersDetail, { foreignKey: "buku_id", as: "orders_detail" });

module.exports = {
  usersRole,
  users,
  kategori,
  books,
  orders,
  ordersDetail,
};
