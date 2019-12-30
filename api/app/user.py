from flask import Blueprint, jsonify
from . import app, db


@app.route('/user')
def user():
    return jsonify({'User': 'This is from user endpoint'})
