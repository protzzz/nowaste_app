import { Request, Response, Router } from "express";
import { db } from "../database";
import { NewUser, users } from "../database/schema";
import { eq } from "drizzle-orm";
import bcryptjs from "bcryptjs";
import jwt from "jsonwebtoken";
import { JWT_SECRET } from "../core/constants";
import { auth, AuthRequest } from "../middleware/auth";
import { formatUser, userWithoutPassword } from "../core/utils";

const authRouter = Router();

interface SignUpBody {
  name: string;
  surname: string;
  email: string;
  password: string;
}

interface LoginBody {
  email: string;
  password: string;
}

authRouter.post(
  "/signup",
  async (req: Request<{}, {}, SignUpBody>, res: Response) => {
    try {
      // get req body
      const { name, surname, email, password } = req.body;

      // check if the user already exists
      const existingUser = await db
        .select()
        .from(users)
        .where(eq(users.email, email));

      if (existingUser.length) {
        res
          .status(400)
          .json({ error: "User with the same email already exists!" });
        return;
      }

      // hashed password
      const hashedPassword = await bcryptjs.hash(password, 8);

      // create a new user
      const newUser: NewUser = {
        name,
        surname,
        email,
        password: hashedPassword,
      };

      // store new user in db
      const [user] = await db.insert(users).values(newUser).returning();

      if (!user) {
        return res.status(500).json({ error: "Failed to create user" });
      }

      // console.log("SIGN-UP user success");

      // to fix later formatting
      // res.status(201).json(formatUser(user));
      res.status(201).json(userWithoutPassword(user));
    } catch (e) {
      res.status(500).json({ error: e });
    }
  }
);

authRouter.post(
  "/login",
  async (req: Request<{}, {}, LoginBody>, res: Response) => {
    try {
      const { email, password } = req.body;

      const [existingUser] = await db
        .select()
        .from(users)
        .where(eq(users.email, email));

      if (!existingUser) {
        res.status(400).json({ error: "User with this email doesn't exist!" });
        return;
      }

      const isMatch = await bcryptjs.compare(password, existingUser.password);

      if (!isMatch) {
        res.status(400).json({ error: "Incorrect password!" });
        return;
      }

      const token = jwt.sign({ id: existingUser.id }, JWT_SECRET);
      const user = userWithoutPassword(existingUser);

      res.json({ token, ...user });
    } catch (e) {
      res.status(500).json({ error: e });
    }
  }
);

authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json({ valid: false });

    // verify if the token is valid
    let verified;
    try {
      verified = jwt.verify(token, JWT_SECRET);
    } catch {
      return res.json({ valid: false });
    }

    // get the user data if the token is valid
    const verifiedToken = verified as { id: string };

    const [user] = await db
      .select()
      .from(users)
      .where(eq(users.id, verifiedToken.id));

    // if no user, return false
    if (!user) return res.json({ valid: false });

    return res.json({ valid: true });
  } catch (error) {
    return res.status(500).json({ error: error });
  }
});

authRouter.get("/", auth, async (req: AuthRequest, res) => {
  try {
    // console.log(">>> req.user =", req.user);
    // console.log(">>> req.token =", req.token);

    if (!req.user) {
      res.status(401).json({ error: "User not found!" });
      return;
    }

    const [user] = await db.select().from(users).where(eq(users.id, req.user));

    if (!user) {
      res.status(404).json({ error: "User not found in Database!" });
      return;
    }

    // res.json({ token: req.token, user: formatUser(user) });
    // console.log(">>> user =", userWithoutPassword(user));

    res.json({ user: userWithoutPassword(user), token: req.token });
    // res.json({ ...user, token: req.token });
  } catch (error) {
    res.status(500).json({ error: error });
  }
});

authRouter.get("/all-the-users", auth, async (req: AuthRequest, res) => {
  try {
    if (!req.user) {
      res.status(401).json({ error: "Unauthorized" });
      return;
    }

    const usersList = await db.select().from(users);

    if (!usersList || usersList.length === 0) {
      res.status(404).json({ error: "No users found in Database!" });
      return;
    }

    // apply formatting (removes password and formats dates) to each user
    const safeUsers = usersList.map(formatUser);

    // res.json({ token: req.token, users: safeUsers });
    res.json({ token: req.token, users: safeUsers });

    console.log(">>> users count =", usersList.length);
  } catch (error) {
    res.status(500).json({ error: error });
  }
});

export default authRouter;
