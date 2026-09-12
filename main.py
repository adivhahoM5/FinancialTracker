import psycopg2
from psycopg2.extras import RealDictCursor
from fastapi import FastAPI
from pydantic import BaseModel
from datetime import date

app = FastAPI()

class User(BaseModel): # no user_id, because SERIAL
    name: str
    email: str
    password_hash: str

def get_DB():
    return psycopg2.connect(
        host="localhost",
        database="FinanceDB",
        user="postgres",
        password="1974",
        port="5432",
        cursor_factory=RealDictCursor
    )

@app.post("/user")
def register_acc(u: User):
    try:
        conn = get_DB()
        cur = conn.cursor()
        cur.execute(
            "INSERT INTO users(name,email,password_hash) VALUES (%s,%s,%s)",
            (u.name, u.email, u.password_hash)
        )
        conn.commit()
        cur.close()
        conn.close()
        return {"message": "User added successfully"}
    except Exception as e:
        print(f"ERROR: {e}")
        return {"error": str(e)}
@app.get("/user")
def view_users():
    conn = get_DB()
    cur = conn.cursor()
    cur.execute("SELECT * FROM users")
    rows = cur.fetchall()
    cur.close() 
    conn.close()
    return rows
#uvicorn main:app --reload

