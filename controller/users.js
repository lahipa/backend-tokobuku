const { users } = require("../models");

const getAll = async (req, res) => {
  try {
    const get = await users.findAll();
    return res.status(200).send({
      data: get,
    });
  } catch (err) {
    return res.status(400).send({
      message: err.massage,
    });
  }
};

const createUser = async (req, res) => {
  try {
    // record data dari body di frontend
    const params = req.body;

    // insert record ke dalam database
    const resp = await users.create(params);

    return res.status(200).send({
      data: resp,
    });
  } catch (err) {
    return res.status(400).send({
      message: err.message,
    });
  }
};

module.exports = {
  getAll,
  createUser,
};
