import { Router } from "express";
import authRouter from "./auth.router.js";
import short from "./urls.router.js";
import me from "./users.router.js";

const router = Router();

router.use(authRouter, short, me );

export default router;