import { Router } from "express";
import { createShortUrl } from "../controllers/urls.controller.js";
import { authRouterValidation } from "../middlewares/authValidation.js";

const short = Router()


short.post("/urls/shorten",authRouterValidation, createShortUrl)

export default short