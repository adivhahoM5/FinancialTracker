import psycopg2
from psycopg2.extras import RealDictCursor
from fastapi import FastAPI
from pydantic import BaseModel
from datetime import date

app = FastAPI()

class User(BaseModel):
    name: str
    email: str
    password_hash: str

class Account(BaseModel):
    user_id : float
    bank_name: str
    account_type:str
    balance: float

class uAccount(BaseModel):
    bank_name: str   

class Transfer(BaseModel):
    account_id:float
    name:str
    amount:float
    
def get_DB():
    return psycopg2.connect(
        host="localhost",
        database="FinanceDB",
        user="postgres",
        password="1974",
        port="5432",
        cursor_factory=RealDictCursor
    )
@app.patch("/transfer/{account_id}")
def transfer_money(account_id:int,a:Account):

    
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

@app.post("/account")
def add_acc(a:Account):
     conn = get_DB()
     cur = conn.cursor()
     cur.execute("INSERT INTO account(user_id,bank_name,account_type,balance) VALUES(%s,%s,%s,%s)",(a.user_id,a.bank_name,a.account_type,a.balance))
     conn.commit()
     cur.close()
     conn.close()
     return {"message": "Account updated successfully"}

@app.get("/account")
def view_acc():
    conn = get_DB()
    cur = conn.cursor()
    cur.execute("SELECT * FROM account")
    rows = cur.fetchall()
    cur.close() 
    conn.close()
    return rows

@app.patch("/account/{user_id}")
def update_acc(user_id:int,a:uAccount):
    conn = get_DB()
    cur = conn.cursor()
    cur.execute("UPDATE account SET bank_name = %s WHERE user_id =%s",(a.bank_name,user_id))
    conn.commit()
    cur.close()
    conn.close()
    return {"message": "Account updated successfully"}

@app.delete("/account/{account_id}")
def delete_acc(account_id:int):
     conn = get_DB()
     cur = conn.cursor()
     cur.execute("DELETE FROM account WHERE account_id =%s",(account_id,))
     conn.commit()
     cur.close()
     conn.close()
     return {"message": "Account deleted successfully"}


#uvicorn main:app --reload

