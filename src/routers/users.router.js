import { Router } from "express";
import { printMe, ranking } from "../controllers/users.controller.js";


const me = Router()

me.get("/users/me", printMe)
me.get("/ranking", ranking)


export default me

