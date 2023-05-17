//Package import
const express = require("express");
const mongoose = require("mongoose");

//File import
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

//App initializer
const app = express();
const PORT = 3000;
const DB = "mongodb+srv://devinanugrah:papalangi270502@cluster0.qv1bmg7.mongodb.net/?retryWrites=true&w=majority";

//Middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//Connection
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connected to database");
  })
  .catch((err) => {
    console.log(err);
  });
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at port: ${PORT}`);
});
