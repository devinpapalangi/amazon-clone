const jwt = require("jsonwebtoken");
const User = require("../models/user");

const admin = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");

    if (!token) {
      return res.status(401).json({ message: "No authentication token, authorization denied" });
    }

    const verified = jwt.verify(token, "passwordKey");
    if (!verified) {
      return res.json(401).json({ message: "Token verification failed, authorization denied" });
    }

    const user = await User.findById(verified.id);
    if (user.type == "user" || user.type == "seller") {
      return res.status(401).json({ message: "Admin resources access denied" });
    }
    req.user = verified.id;
    req.token = token;
    next();
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
};

module.exports = admin;
