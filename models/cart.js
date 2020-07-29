const Sequelize = require("sequelize");
const connection = require("../config/sequelize");

class Model extends Sequelize.Model {}

Model.init(
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    user_id: Sequelize.INTEGER(11),
    buku_id: Sequelize.INTEGER(11),
    qty: Sequelize.INTEGER(11),
    created_at: Sequelize.DATE,
    updated_at: Sequelize.DATE,
    deleted_at: Sequelize.DATE,
  },
  {
    createdAt: "created_at",
    updatedAt: "updated_at",
    deletedAt: "deleted_at",
    freezeTableName: true,
    timestamp: true,
    paranoid: false,
    underscored: true,
    sequelize: connection,
    modelName: "cart",
    tableName: "cart",
  }
);

module.exports = Model;
