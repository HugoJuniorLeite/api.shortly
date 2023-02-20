//import bcrypt from 'bcrypt';
//import {v4 as uuidv4} from 'uuid';
import { db } from '../config/database.js';

export async function signUpValidation (req, res, next){

const signUp = req.body

try {
    dataExist = await db.query( `SELECT * FROM users WHERE email=$1`, [$1=signUp.email]  )

    if(dataExist.rowcount > 0){
return res.sendStatus(409)
    }

//res.locals.signUp = signUp
next()

} catch (error) {
    res.status(500).send(error)
}

}
