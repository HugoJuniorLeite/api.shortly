import { Router } from "express";
import { signUp, signIn } from "../controllers/auth.controller.js";
import { signUpValidation, signInValidation } from "../middlewares/authValidation.js";


const authRouter = Router()


authRouter.post("/signup",signUpValidation, signUp)
authRouter.post("/signin",signInValidation, signIn)

export default authRouter

