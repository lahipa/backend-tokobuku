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
    nama: Sequelize.STRING(256),
    alamat: Sequelize.STRING(256),
    password: Sequelize.STRING(256),
    email: Sequelize.STRING(256),
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
    modelName: "users",
    tableName: "users",
  }
);

module.exports = Model;
