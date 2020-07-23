const { users } = require("../models");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

/* 
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
}; */

/* const createUser = async (req, res) => {
  try {
    //record data dari body di frontend
    const params = req.body;

    //insert record ke dalam database
    const resp = await users.create(params);

    return res.status(200).send({
      message: "OK",
      data: resp,
    });
  } catch (err) {
    return res.status(400).send({
      message: err.message,
    });
  }
}; */

const register = async (req, res) => {
  try {
    //record data dari body di frontend
    const params = req.body;

    // cek username, jika exist ditolak
    const duplicated = await users.findOne({
      where: { username: params.username },
    });
    if (duplicated) {
      return res.status(400).send({
        message: "username telah terpakai",
      });
    }

    // ubah password dengan encrypt
    params.password = await bcrypt.hashSync(req.body.password, 10);

    const data = await users.create(params);

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

const login = async (req, res) => {
  try {
    const params = req.body;

    // cari user berdasarkan username, jika tidak di temukan akan di tolak
    const query = {
      where: {
        username: params.username,
      },
      raw: true, // return JSON dari sequelize
    };

    const user = await users.findOne(query);

    if (!user) {
      return res.status(400).send({
        message: "username tidak ditemukan",
      });
    }

    // jika user di temukan, kita compare antara password yang di input dengan database
    // jika tidak sama,, akan di tolak
    const compare_password = bcrypt.compareSync(params.password, user.password);
    if (!compare_password) {
      return res.status(400).send({
        message: "password tidak sama",
      });
    }

    // karena user di temukan dan password sama dengan database
    // process selanjutkan adalah membuat token untuk users
    const sign_token = {
      issuer: "contoh.com",
      subject: "contoh.com",
      algorithm: "HS256", // algoritma encryption
      expiresIn: "1d", // token expired 1 hari
      audience: "http://contoh.com",
    };

    // generate token berdasarkan data user dari database
    const token = jwt.sign(user, process.env.JWT_SECRET, sign_token);

    // return hasil
    return res.status(200).send({
      message: "OK",
      data: {
        user,
        token,
      },
    });
  } catch (err) {
    return res.status(400).send({
      message: err.message,
    });
  }
};

module.exports = {
  register,
  login,
  //getAll,
};
