const colors = require("colors");

module.exports = (srv) => {
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
    console.log(`Method: ${req.method}`.yellow.inverse);
    // console.log(`Target: ${req.target.name}`.yellow.inverse);
  });
};
