from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite///api.db'

db = SQLAlchemy(app)


@app.route('/')
def index():
    return jsonify({'message': 'Hello World!'})
