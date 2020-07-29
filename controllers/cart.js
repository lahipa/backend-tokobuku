const { cart, users, books } = require("../models");
const { Op } = require("sequelize");

const create = async (req, res) => {
  try {
    const params = req.body;
    const data = await cart.create(params);

    return res.status(200).send({
      message: "OK",
      data,
    });
  } catch (err) {
    return res.status(400).send({
      message: err.message,
    });
  }
};

/* const get_list = async(req, res) => {
    try {
        const params = req.query

        const query = {
            
        }
    } catch (err) {
        return res.status(400).send({
            message: err.message
        })
    }
} */

module.exports = {
  create,
};
