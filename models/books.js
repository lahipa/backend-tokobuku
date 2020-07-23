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
    kategori_id: Sequelize.INTEGER(11),
    title: Sequelize.STRING(256),
    harga: Sequelize.INTEGER(15),
    author: Sequelize.STRING(150),
    image_url: Sequelize.STRING(150),
    no_isbn: Sequelize.STRING(50),
    berat: Sequelize.INTEGER(15),
    /* book_status: Sequelize.ENUM({
      values: ["FOR_SELL", "NOT_FOR_SELL"],
    }), */
    synopsis: Sequelize.TEXT,
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
    modelName: "buku",
    tableName: "buku",
  }
);

module.exports = Model;
