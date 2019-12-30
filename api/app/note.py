from flask import Blueprint, jsonify
from . import app, db


@app.route("/note")
def note():
    return jsonify({"Note": "This is from note endpoint"})


@app.route("/notes/<int:user_id>")
def notes(user_id):
    return jsonify({"Note": "This is to get all notes"})
