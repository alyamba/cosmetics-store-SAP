const colors = require("colors");

module.exports = (srv) => {
  srv.on("getTotalCostOfOrder", async (req) => {
    const { id } = req.data;

    const db = srv.transaction(req);
    let { Orders, Cosmetics } = srv.entities;

    let orderInfo = await db.read(Orders).where({ ID: id });
    let cosmeticsInfo = await db
      .read(Cosmetics)
      .where({ ID: orderInfo[0].cosmetics_ID });

    if (
      !Number.isInteger(orderInfo[0].quantity) &&
      !Number.isInteger(cosmeticsInfo[0].price)
    ) {
      console.log("Data must be in numeric format!".red);
    }

    return orderInfo[0].quantity * cosmeticsInfo[0].price;
  });

  srv.on("changeStatusType", async (req) => {
    const { orderId, orderStatus } = req.data;

    const db = srv.transaction(req);
    let { Orders } = srv.entities;

    const statusArray = ["Pending", "Processing", "Ready"];

    let results = await db.read(Orders);
    if (!statusArray.includes(orderStatus)) {
      console.log("This status does not exist".yellow);
      return results;
    }

    results = await db
      .update(Orders)
      .set({ status: orderStatus })
      .where({ ID: orderId });

    console.log("order info after updating: ", JSON.stringify(results));
    return results;
  });

  srv.on("getCosmeticsByBrand", async (req) => {
    const { id } = req.data;

    const db = srv.transaction(req);
    let { Cosmetics } = srv.entities;

    const results = await db.read(Cosmetics).where({ brands_ID: id });

    return results;
  });

  srv.on("getCosmeticsByOrder", async (req) => {
    const { id } = req.data;

    const db = srv.transaction(req);
    let { Orders } = srv.entities;

    const results = await db.read(Orders).where({ ID: id });

    return results;
  });

  srv.before("*", (req) => {
    console.log(`Method: ${req.method}`.green.inverse);
    // console.log(`Target: ${req.target.name}`.yellow.inverse);
  });
};
