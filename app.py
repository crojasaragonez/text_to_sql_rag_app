import os
from dotenv import load_dotenv
from sqlalchemy import create_engine
from llama_index.core import SQLDatabase, Settings
from llama_index.core.indices.struct_store import NLSQLTableQueryEngine
from flask import Flask, render_template, request
load_dotenv()

TABLES_TO_SCAN = [
    "Campo", "Cultivo", "Cosecha", "Camion", "Conductor", "Transporte",
    "Ingenio", "Proceso", "Producto",
]

app = Flask(__name__)
@app.get('/')
def index():
    return render_template('index.html')

@app.post('/prompt')
def prompt():
    return {
        "response": "moscabado, azúcar blanco corriente, azúcar blanco especial, azúcar refinado, azúcar micro pulverizado, energía, alcohol carburante, kompostar y nutri-humic."
    }
    engine = create_engine(os.getenv('DB_URI'))
    sql_database = SQLDatabase(engine)
    query_engine = NLSQLTableQueryEngine(
        sql_database = sql_database,
        tables = TABLES_TO_SCAN
    )
    data = request.get_json()
    query = data.get('query')
    response = query_engine.query(query)
    return response.response
