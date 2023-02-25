import { db } from '../config/database.js'
import { nanoid } from 'nanoid'

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

export async function printUrls(req,res){
    const id = req.params.id

    try {
    const isUrl = await db.query(`SELECT * FROM urls WHERE id = $1`, [id])
       
        if(isUrl.rowCount <=0) {return res.sendStatus(404)}

res.status(200).send({id:isUrl.rows[0].id, shortUrl: isUrl.rows[0].shortUrl, url: isUrl.rows[0].url})

    } catch (error) {
        res.status(500).send(error.message)
    }
        
}


export async function openShortUrl(req,res){
    const shortUrl = req.params.shortUrl

        console.log(shortUrl)
    
try {
    const isShortUrl = await db.query(`SELECT * FROM urls WHERE "shortUrl" = $1`, [shortUrl])
       
        if(shortUrl.rowCount <=0) {return res.sendStatus(404)}

res.redirect(isShortUrl.rows[0].url)

    
} catch (error) {
    return res.status(500).send(error.message)
}

}