import { Router } from "express";
import authRouter from "./auth.router.js";
import short from "./urls.router.js";


const router = Router();

router.use(authRouter, short);

export default router;