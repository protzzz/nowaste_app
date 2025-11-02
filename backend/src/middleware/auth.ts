import { UUID } from "crypto";
import { NextFunction, Request, Response } from "express";
import jwt from "jsonwebtoken";
import { db } from "../database";
import { users } from "../database/schema";
import { eq } from "drizzle-orm";
import { JWT_SECRET } from "../core/constants";

export interface AuthRequest extends Request {
  user?: UUID;
  token?: string;
}

export const auth = async (
  req: AuthRequest,
  res: Response,
  next: NextFunction
) => {
  try {
    // get the header
    const token = req.header("x-auth-token");
    if (!token) {
      res.status(401).json({ message: "No auth token! Access denied!" });
      return;
    }

    // verify if the token is valid
    let verified;
    try {
      verified = jwt.verify(token, JWT_SECRET);
    } catch {
      return res.status(401).json({ message: "Token verification failed!" });
    }

    // get the user data if the token is valid
    const verifiedToken = verified as { id: UUID };

    const [user] = await db
      .select()
      .from(users)
      .where(eq(users.id, verifiedToken.id));

    // if no user, return false
    if (!user) {
      res.status(401).json({ message: "User not found!" });
      return;
    }

    req.user = verifiedToken.id;
    req.token = token;

    next();
  } catch (error) {
    return res.status(500).json({ error: error });
  }
};
