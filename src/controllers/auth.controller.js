import { db } from '../config/database.js';
import bcrypt from 'bcrypt';
import { v4 as uuidv4 } from 'uuid';

export async function signUp(req, res) {
    const { name, email, password } = res.locals.user
    const passwordHash = bcrypt.hashSync(password, 10);
    try {

        await db.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3)`, [name, email, passwordHash])
        res.sendStatus(201)

    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function signIn(req, res) {

    const { id, name } = res.locals.user
    const token = uuidv4()

    try {
        await db.query(`INSERT INTO sessions ("userId", token) VALUES ($1, $2)`, [id, token])
        return res.status(201).send({ token })
    } catch (error) {
        res.status(500).send(error.message)
    }
}

