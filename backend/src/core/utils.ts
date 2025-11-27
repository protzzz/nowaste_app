import dayjs from "dayjs";
import type { User } from "../database/schema";

export function formatUser(user: User) {
  // export function formatUser(user?: User | null)
  if (!user) return null;

  const { password, ...rest } = user;

  return {
    ...rest,
    createdAt: user.createdAt
      ? dayjs(user.createdAt).format("DD-MM-YYYY HH:mm:ss")
      : null,
    updatedAt: user.updatedAt
      ? dayjs(user.updatedAt).format("DD-MM-YYYY HH:mm:ss")
      : null,
  };
}

export function userWithoutPassword(user: User) {
  if (!user) return null;

  const { password, ...rest } = user;

  return rest;
}
