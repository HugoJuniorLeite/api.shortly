import { db } from '../config/database.js'
import { nanoid } from 'nanoid'

export async function createShortUrl(req, res) {
    const text = res.locals.user


    try {
        const shortUrl = nanoid(8)
        await db.query(`INSERT INTO urls (url , "userId") VALUES ($1, $2)`, [text.user.url, text.userId])

        const isUrl = await db.query(`SELECT * FROM urls WHERE "url" = $1`, [text.user.url])

        await db.query(`INSERT INTO "shortUrls" ("urlId", "shortUrl") VALUES ($1, $2)`, [isUrl.rows[0].id, shortUrl])

        const isShort = await db.query(`SELECT * FROM "shortUrls" WHERE "shortUrl" = $1`, [shortUrl])

        res.status(201).send({ id: isShort.rows[0].id, shortUrl: isShort.rows[0].shortUrl })

    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function printUrls(req, res) {
    const id = req.params.id
    // const idUse = +id


    try {
        const isUrl = await db.query(`SELECT * FROM urls WHERE id = $1`, [id])

        if (isUrl.rowCount <= 0) { return res.sendStatus(404) }

        //      const count = await db.query(`SELECT * FROM "shortUrls" WHERE "urlId" = $1`, [isUrl.rows[0].id])


        // const visit = await db.query(`SELECT SUM ("visitCount") FROM "shortUrls" WHERE id=$1`, [isUrl.rows[0].urlId])

        // console.log(visit.rows[0],"teste da soma")
        // await db.query(`UPDATE "shortUrls" SET "visitCount"=$1 WHERE id=$2`, [visit.rows[0].sum   ,isUrl.rows[0].urlId])

        // //console.log(visit.rows[0])`)
        // console.log(visit.rows[0])


        //        const visit = await db.query(`UPDATE "shortUrls" SET "visitCount"="visitCount"+1 WHERE id=$1`, [isUrl.rows[0].urlId])

        //console.log(visit.rows[0])

        res.status(200).send({ id: isUrl.rows[0].id, shortUrl: isUrl.rows[0].shortUrl, url: isUrl.rows[0].url })

    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function openShortUrl(req, res) {
    const reduceUrl = req.params.shortUrl
    console.log(reduceUrl, "red");

    try {
        const isShortUrl = await db.query(`SELECT * FROM "shortUrls" WHERE "shortUrl"= $1`, [reduceUrl])
        if (isShortUrl.rowCount <= 0) { return res.sendStatus(404) }

        const isUrl = await db.query(`SELECT * FROM urls WHERE id= $1`, [isShortUrl.rows[0].urlId])
        //aumenta o visitCount do Link
        const visitQtt = await db.query('SELECT "visitCount" FROM "shortUrls" WHERE "shortUrl" = $1', [reduceUrl]);

        await db.query('UPDATE "shortUrls" SET "visitCount" = $1 WHERE "shortUrl" = $2', [visitQtt.rows[0].visitCount + 1, reduceUrl])

        
        res.redirect(isUrl.rows[0].url)


    } catch (error) {
        return res.status(500).send(error.message)
    }

}

export async function destructionUrl(req, res) {
    const id = req.params.id
    const { authorization } = req.headers;
    const token = authorization?.replace("Bearer ", "")

    try {

        const isUrl = await db.query(`SELECT * FROM urls WHERE id = $1`, [id])

        if (isUrl.rowCount <= 0) { return res.sendStatus(404) }

        const isUser = await db.query(`SELECT * FROM sessions WHERE token = $1`, [token])

        if (isUrl.rows[0].userId !== isUser.rows[0].userId) { return res.sendStatus(401) }


        await db.query(`DELETE FROM "shortUrls" WHERE "urlId"=$1`, [isUrl.rows[0].id])
        await db.query(`DELETE FROM urls WHERE id=$1`, [id])

        return res.sendStatus(204)

    } catch (error) {
        res.status(500).send(error.message)
    }

}

