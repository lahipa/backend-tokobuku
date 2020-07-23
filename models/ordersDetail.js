const Sequelize = require("sequelize");
const connection = require("../config/sequelize");

class Model extends Sequelize.Model {}

// init model (indexData, option)
Model.init(
  {
    id: {
      type: Sequelize.INTEGER, // init data tipe integer
      primaryKey: true, // init primary key
      autoIncrement: true, // init auto increment
    },
    order_id: Sequelize.INTEGER(11),
    buku_id: Sequelize.INTEGER(11),
    title: Sequelize.STRING(256),
    quantity: Sequelize.INTEGER(20),
    price: Sequelize.INTEGER(20),
    total: Sequelize.INTEGER(20),
    created_at: Sequelize.DATE, // init database DATETIME
    updated_at: Sequelize.DATE,
    deleted_at: Sequelize.DATE,
  },
  {
    createdAt: "created_at", // mapping column di table untuk bisa dibaca oleh sequelize
    updatedAt: "updated_at",
    deletedAt: "deleted_at",
    freezeTableName: true, //mem-freeze table
    timestamp: true, //opsi untuk timestamp
    paranoid: true, // opsi untuk paranoid
    underscored: true,
    sequelize: connection,
    modelName: "orders_detail",
    tableName: "orders_detail",
  }
);

module.exports = Model;
