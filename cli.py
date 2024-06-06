import os
from dotenv import load_dotenv
from sqlalchemy import create_engine
from llama_index.core import SQLDatabase, Settings
from llama_index.core.indices.struct_store import NLSQLTableQueryEngine
load_dotenv()

TABLES_TO_SCAN = [
    "Camion", "Campo", "Conductor", "Cosecha", "Cultivo", "Ingenio", "Proceso",
    "Produccion", "Producto", "Transporte",
]

engine = create_engine(os.getenv('DB_URI'))
sql_database = SQLDatabase(engine)
query_engine = NLSQLTableQueryEngine(
    sql_database = sql_database,
    tables = TABLES_TO_SCAN
)
print("Ask something to the database. Press 'q' to quit.\n")
while True:
    choice = input("Your query: ")
    if choice.lower() == 'q':
        print("Goodbye!")
        break
    else:
        response = query_engine.query(choice)
        print(response)
        print('-----------------------------------')
