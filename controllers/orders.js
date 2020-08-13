//const { orders, ordersDetail, users } = require("../models");
const { users, orders, ordersDetail } = require("../models");
const { Op } = require("sequelize");
// const model = require("../models");

const create = async (req, res) => {
  try {
    const params = req.body;
    const data = await orders.create(params, {
      include: [
        {
          model: ordersDetail,
          as: "orders_detail",
        },
      ],
    });

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
    const params = req.body;
    const data = await orders.findByPk(req.params.id);

    if (!data) {
      return res.status(400).send({
        message: "ID tidak ditemukan",
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

const get_by_id = async (req, res) => {
  try {
    const data = await orders.findByPk(req.params.id, {
      include: [
        {
          model: users,
          as: "customers_detail",
        },
        {
          model: ordersDetail,
          as: "orders_detail",
        },
      ],
    });

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

const get_list = async (req, res) => {
  try {
    const params = req.query;
    const query = {
      order: [["id", "DESC"]],
      where: {},
      limit: 10,
      offset: 0,
      attributes: this.attributes,
      distinct: true,
      include: [
        {
          model: users,
          as: "customers_detail",
        },
        {
          model: ordersDetail,
          as: "orders_detail",
        },
      ],
    };

    if (params.uid) {
      query.where.user_id = {
        [Op.like]: `%${params.uid}%`,
      };
    }

    if (params.proceed) {
      query.where.proceed = {
        [Op.like]: `%${params.proceed}`,
      };
    }

    // Sorting
    if (params.sort_by && params.sort_type) {
      query.order = [[params.sort_by, params.sort_type]];
    }

    // Pagination
    if (params.limit) {
      query.limit = Number(params.limit);
    }
    if (params.page) {
      query.offset =
        Number(query.limit) * ((Number(params.page || 1) || 1) - 1);
    }

    const data = await orders.findAndCountAll(query);
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
  update_by_id,
  get_by_id,
  get_list,
};
