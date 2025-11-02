import express from "express";
import dotenv from "dotenv";
import authRouter from "./routes/auth";

dotenv.config();

const app = express();

app.use(express.json());
app.use("/auth", authRouter);

app.listen(process.env.PORT, () => {
  console.log(`Server started on port ${process.env.PORT}!`);
});
