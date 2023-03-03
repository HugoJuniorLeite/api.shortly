import { db } from '../config/database.js'


export async function printMe(req,res){
    const { authorization } = req.headers;
    const token = authorization?.replace("Bearer ", "")

try {
const isSession = await db.query(`SELECT * FROM sessions WHERE token = $1`, [token])
if(isSession.rowCount <= 0){return res.sendStatus(401)}

const userUrls = await db.query(
    `SELECT  users.id, users.name, users."visitCount" ,json_agg((urls.id, urls."shortUrl" , urls.url, urls."visitCount"  )) AS "shortenedUrls" FROM urls 
    JOIN users ON users.id =
    urls."userId" 
    JOIN sessions ON sessions."userId" = 
    users.id WHERE sessions.token = $1
GrOUP BY users.id    
    `,
    [token]
  );

  if (userUrls.rows[0] === undefined) {
    const userToken = await db.query(`SELECT * FROM sessions WHERE token = $1`, [token]);
    const isUrl = await db.query(`SELECT id, name ,"visitCount" FROM users WHERE id = $1
  
    `,
    [userToken.rows[0].userId]
  );

    return res.send({ ...isUrl.rows[0], shortenedUrls: [] });
    
  }

  const result = userUrls.rows[0]?.shortenedUrls.map((d) => {
    return {
      id: d.f1,
      ShortUrl: d.f2,
      url: d.f3,
      visitCount: d.f4,
    };
  });

  return res.send({ ...userUrls.rows[0], shortenedUrls: result });

} catch (error) { return res.status(500).send(error.message) }
}


export async function ranking (req, res){

  try {
    
    const ranking = await db.query(`SELECT id, name, "linksCount", "visitCount" FROM users GROUP BY id ORDER BY "visitCount" desc limit 10 `)
    
    res.status(200).send(ranking.rows)

  } catch (error) {
    return error.message
  }
}