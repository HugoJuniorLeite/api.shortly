import pg from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const {Pool} =pg;

const configDatabese = {
    connectionString: process.env.DATABASE_URL,
}

if(process.env.MODE ==="prod") configDatabese.ssl=true;

export const db =new Poll(configDatabese);