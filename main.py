import os
from dotenv import load_dotenv
from sqlalchemy import create_engine
from llama_index.core import SQLDatabase, Settings
from llama_index.core.indices.struct_store import NLSQLTableQueryEngine
load_dotenv()

engine = create_engine(os.getenv('DB_URI'))
sql_database = SQLDatabase(engine)
# using https://github.com/dbeaver/dbeaver/blob/devel/plugins/org.jkiss.dbeaver.ext.sample.database/data/Chinook.db for this example
tables_to_scan = [
  "Genre", "Track", "Invoice","InvoiceLine", "Playlist", "PlaylistTrack", "Artist", "Album", "Customer"
]
query_engine = NLSQLTableQueryEngine(sql_database=sql_database,tables=tables_to_scan)
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
