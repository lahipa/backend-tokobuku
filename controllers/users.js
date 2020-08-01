const { users, usersRole } = require("../models");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

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

    // cari user berdasarkan username
    const query = {
      where: {
        username: params.username,
      },
      include: [
        {
          model: usersRole,
          as: "role",
        },
      ],
      raw: true, // return JSON dari sequelize
    };

    const user = await users.findOne(query);

    if (!user) {
      return res.status(400).send({
        message: "username tidak ditemukan",
      });
    }

    // compare username dengan password
    const compare_password = bcrypt.compareSync(params.password, user.password);
    if (!compare_password) {
      return res.status(400).send({
        message: "password tidak sama",
      });
    }

    // token option untuk digenerate
    const sign_token = {
      issuer: "contoh.com",
      subject: "contoh.com",
      algorithm: "HS256", // algoritma encryption
      expiresIn: "1d", // token expired 1 hari
      audience: "http://contoh.com",
    };

    // generate token berdasarkan data user dari database
    const token = jwt.sign(user, process.env.JWT_SECRET, sign_token);

    return res.status(200).send({
      message: "login berhasil",
      data: {
        user: {
          name: user.name,
          email: user.email,
          role: user["role.name"],
        },
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
