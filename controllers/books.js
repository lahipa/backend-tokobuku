const { books, kategori } = require("../models");
const { Op } = require("sequelize");
const { restore } = require("../models/books");

const create = async (req, res) => {
  try {
    //const params = req.body;
    const params = { ...req.body, ...{ image_url: req.file.path } };
    const data = await books.create(params);

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

const get_by_id = async (req, res) => {
  try {
    const data = await books.findByPk(req.params.id, {
      include: [
        {
          model: kategori,
          as: "kategori",
        },
      ],
    });

    if (!data) {
      return res.status(400).send({
        message: "Data id tidak ditemukan",
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
    const data = await books.findByPk(req.params.id);

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
    const data = await books.findByPk(req.params.id);

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
          model: kategori,
          as: "kategori",
        },
      ],
    };

    if (params.title) {
      query.where.title = {
        [Op.like]: `%${params.title}%`,
      };
    }

    if (params.author) {
      query.where.author = {
        [Op.like]: `%${params.author}%`,
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

    const data = await books.findAndCountAll(query);
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
  create,
  get_by_id,
  update_by_id,
  delete_by_id,
  get_list,
};
