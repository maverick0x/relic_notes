from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

app.config['SECRET_KEY'] = 'r0e79lb0i67c2vg8hh83ui74nkhtooygetgvxdvbx'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///db.sqlite3'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

from models import Note, User

from note import note as note_blueprint
from user import user as user_blueprint

app.register_blueprint(note_blueprint, url_prefix='/api')
app.register_blueprint(user_blueprint, url_prefix='/api')

if __name__ == "__main__":
    app.run()