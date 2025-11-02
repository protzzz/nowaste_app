import dayjs from "dayjs";
import type { User } from "../database/schema";

export function formatUser(user: User) {
  // export function formatUser(user?: User | null)
  if (!user) return null;

  return {
    id: user.id,
    name: user.name,
    surname: user.surname,
    email: user.email,
    created_at: user.created_at
      ? dayjs(user.created_at).format("DD-MM-YYYY HH:mm:ss")
      : null,
    updated_at: user.updated_at
      ? dayjs(user.updated_at).format("DD-MM-YYYY HH:mm:ss")
      : null,
  };
}
