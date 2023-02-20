import { Router } from "express";
import { signUp } from "../controllers/auth.controller.js";
//import { signUpValidation } from "../middlewares/authValidation.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { signUpSchema } from "../schemas/signUpSchema.js";




const signUpRouter = Router()

//signUpRouter.use(signUpValidation)
signUpRouter.post("/signup",validateSchema(signUpSchema),signUp)

export default signUpRouter