import { Router } from "express";
import { printMe } from "../controllers/users.controller.js";


const me = Router()


me.get("/users/me", printMe)

export default me

