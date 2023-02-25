import { Router } from "express";
import { createShortUrl, openShortUrl, printUrls } from "../controllers/urls.controller.js";
import { authRouterValidation } from "../middlewares/authValidation.js";

const short = Router()


short.post("/urls/shorten",authRouterValidation, createShortUrl)
short.get("/urls/:id", printUrls)
short.get("/urls/open/:shortUrl", openShortUrl )



export default short