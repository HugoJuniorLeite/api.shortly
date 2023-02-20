import {db} from '../config/database.js';
import bcrypt from 'bcrypt';
import {v4 as uuidv4} from 'uuid';

export async function signUp(req,res){
const {name, email, password} = req.body
    try {

        const passwordHash = bcrypt.hashSync(password, 10);

       await db.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3)`, [name,email, passwordHash]) 
        res.sendStatus(201)
        
    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function signIn(req,res){
    const {email, password} = req.body

    try {
        const user = await db.query (`SELECT * FROM users WHERE email= $1`, [email]) 
        
        if( user && bcrypt.compareSync(password, user.password)){
            const token = uuid()

            await db.query (`INSERT INTO session (token) VALUES ($1)`, [token])
            }

        return res.status(201).send({token:token, name: user.row.name })


    } catch (error) {
        res.status(500).send(error.message)
    }
}