const { cart, users, books } = require("../models");

const add_to_cart = async (req, res) => {
  try {
    const params = req.body;

    const query = {
      where: {
        buku_id: params.buku_id,
        user_id: params.user_id,
      },
    };

    // cek data, jika exist update qty
    const data = await cart.findOne(query);

    if (data) {
      const updateRow = {
        qty: data.qty + params.qty,
      };
      //console.log(updateRow, "cek data");

      data.set(updateRow);
      data.save();

      return res.status(200).send({
        message: "OK",
        data,
      });
    } else {
      const data = await cart.create(params);

      return res.status(200).send({
        message: "OK",
        data,
      });
    }
  } catch (err) {
    return res.status(400).send({
      message: err.message,
    });
  }
};

const subtract_from_cart = async (req, res) => {
  try {
    const params = req.body;
    const data = await cart.findByPk(req.params.id);

    if (!data) {
      return res.status(400).send({
        message: "Data tidak ditemukan",
      });
    }

    if (data.qty === params.qty) {
      data.destroy();
      data.save();

      return res.status(200).send({
        message: "OK",
        data,
      });
    } else {
      const updateRow = {
        qty: data.qty - params.qty,
      };

      data.set(updateRow);
      data.save();

      return res.status(200).send({
        message: "OK",
        data,
      });
    }
  } catch (err) {
    return res.status(400).send({
      message: err.message,
    });
  }
};

const delete_cart_list = async (req, res) => {
  try {
    const params = req.body;
    const data = await cart.findByPk(req.params.id);

    if (!data) {
      return res.status(400).send({
        message: "Data tidak ditemukan",
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

const get_cart_list = async (req, res) => {
  try {
    const params = req.query;

    const query = {
      where: {
        user_id: params.uid,
      },
      include: [
        {
          model: users,
          as: "customers_detail",
        },
        {
          model: books,
          as: "books",
        },
      ],
    };

    const data = await cart.findAll(query);

    if (!data) {
      return res.status(400).send({
        message: "Data tidak ditemukan",
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
  get_cart_list,
  add_to_cart,
  subtract_from_cart,
  delete_cart_list,
};
