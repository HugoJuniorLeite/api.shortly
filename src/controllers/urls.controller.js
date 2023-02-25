import { db } from '../config/database.js'
import { nanoid } from 'nanoid'
//import shorturl from 'shorturl'


export async function createShortUrl(req,res){
const text = res.locals.user

    const shortUrl = nanoid(8)
  
    try {
        await db.query(`INSERT INTO urls ("shortUrl", url) VALUES ($1, $2)`, [shortUrl, text.url])
        
        const isShort = await db.query(`SELECT * FROM urls WHERE "shortUrl" = $1`, [shortUrl])

         res.status(201).send({id:isShort.rows[0].id, shortUrl:isShort.rows[0].shortUrl}) 
        
    } catch (error) {
        res.status(500).send(error.message)
    }
}
