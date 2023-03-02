import { db } from '../config/database.js'


export async function printMe(req,res){
    const { authorization } = req.headers;
    const token = authorization?.replace("Bearer ", "")

try {
const isSession = await db.query(`SELECT * FROM sessions WHERE token = $1`, [token])
if(isSession.rowCount <= 0){return res.sendStatus(401)}

const isUrl = await db.query(`SELECT * FROM urls WHERE "userId" = $1`, [isSession.rows[0].userId])
const isShortUrl = await db.query(`SELECT * FROM "shortUrls" WHERE "urlId" = $1`, [isUrl.rows[0].id])
const isUser = await db.query(`SELECT * FROM users WHERE "id" = $1`, [isSession.rows[0].userId])

const rentals = await db.query(`SELECT "urls" .*                   
,json_build_object(
   'id', "userId",
   'name', name ) AS users
   FROM urls
   JOIN users
   ON  urls."userId" = users."id" 
`)

console.log(isUser.rows[0], "usuario")

console.log(isSession.rows[0], "sessions")

console.log(isUrl.rows[0], "url")

console.log(isShortUrl.rows[0], "shortUrl")

return res.status(200).send( rentals.rows[0])

} catch (error) { return res.status(500).send(error.message) }
}