import { Router } from "express";
import signInRouter from "./signIn.router.js";
import signUpRouter from "./signUp.router.js"


const router = Router()

router.use(signUpRouter, signInRouter)

export default router;