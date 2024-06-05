#!/bin/bash
sqlite3 ingenio.db < script.sql
flask run --debug
