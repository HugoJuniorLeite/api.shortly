import bcrypt from 'bcrypt';
import { db } from '../config/database.js';
import { signUpSchema } from '../schemas/signUpSchema.js';
import { urlSchema } from '../schemas/urlSchema.js';

export async function signUpValidation(req, res, next) {

    const user = req.body

    const { error } = signUpSchema.validate(user)

    if (error) {
        const errors = error.details.map((detail) => detail.message)
        return res.status(400).send({ errors })
    }

    const dataExist = await db.query(`SELECT * FROM users WHERE email = $1`, [user.email]);

    if (dataExist.rowCount !== 0) {
        return res.sendStatus(409)
    }

    res.locals.user = user

    next()
}

export async function signInValidation(req, res, next) {

    const { email, password } = req.body
    try {
        const user = await db.query(`SELECT * FROM users WHERE email= $1`, [email])
 
        if (user.rowCount === 0) { return res.sendStatus(401) }
 
        const passwordIsOk = bcrypt.compareSync(password, user.rows[0].password)
 
        if (!passwordIsOk) { return res.status(401).send('Não autorizado') }

        res.locals.user = user.rows[0]

    } catch (error) {
        res.status(500).send(error.message)
    }

    next()
}

export async function authRouterValidation(req,res,next){
    const user = req.body
    const { authorization } = req.headers    
    const token = authorization?.replace("Bearer ", "")

    const { error } = urlSchema.validate(user)
    
    if (error) {
        const errors = error.details.map((detail) => detail.message)
        return res.status(422).send({ errors })
    }
    if(!token) {return res.sendStatus(401)}

try {
    const session = await db.query(`SELECT * FROM sessions WHERE token = $1`, [token])
    if(session.rowCount === 0) {return res.sendStatus(401)}    

    res.locals.user = user

} catch (error) {
    res.status(500).send(error.message)    
}
next()
}
