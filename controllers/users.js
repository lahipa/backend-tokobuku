const { users, usersRole } = require("../models");
const { Op } = require("sequelize");
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
        isLogin: false,
        message: "username tidak ditemukan",
      });
    }

    // compare username dengan password
    const compare_password = bcrypt.compareSync(params.password, user.password);
    if (!compare_password) {
      return res.status(400).send({
        isLogin: false,
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
      isLogin: true,
      role: user["role.name"],
      data: {
        user: {
          name: user.name,
          email: user.email,
          uid: user.id,
          role: user["role.name"],
        },
        token,
      },
    });
  } catch (err) {
    return res.status(400).send({
      isLogin: false,
      message: err.message,
    });
  }
};

const get_by_id = async (req, res) => {
  try {
    const data = await users.findByPk(req.params.id);

    if (!data) {
      return res.status(400).send({
        message: "ID tidak ditemukan",
      });
    }

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

const update_by_id = async (req, res) => {
  try {
    //const params = req.body;
    const params = { ...req.body };
    if (req.file && req.file.path) params.image_url = req.file.path;
    const data = await users.findByPk(req.params.id);

    if (!data) {
      return res.status(400).send({
        message: "Data id tidak ditemukan",
      });
    }

    data.set(params);
    data.save();
    data.get();

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

const delete_by_id = async (req, res) => {
  try {
    const params = req.body;
    const data = await users.findByPk(req.params.id);

    if (!data) {
      return res.status(400).send({
        message: "Data id tidak ditemukan",
      });
    }

    data.destroy();
    data.save();

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

const get_list = async (req, res) => {
  try {
    const params = req.query;

    const query = {
      order: [["id", "DESC"]],
      where: {},
      limit: 10,
      offset: 0,
      attributes: this.attributes,
      include: [
        {
          model: usersRole,
          as: "role",
        },
      ],
    };

    if (params.role) {
      query.where.role_id = {
        [Op.like]: `%${params.role}%`,
      };
    }

    if (params.name) {
      query.where.name = {
        [Op.like]: `%${params.name}%`,
      };
    }

    // sorting
    if (params.sort_by && params.sort_type) {
      query.order = [[params.sort_by, params.sort_type]];
    }

    // pagination
    if (params.limit) {
      query.limit = Number(params.limit);
    }
    if (params.page) {
      query.offset =
        Number(query.limit) * ((Number(params.page || 1) || 1) - 1);
    }

    const data = await users.findAndCountAll(query);
    data.limit = query.limit;
    data.offset = query.offset;
    data.page = query.offset / query.limit + 1;

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

module.exports = {
  register,
  login,
  get_by_id,
  update_by_id,
  delete_by_id,
  get_list,
};
