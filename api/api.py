import jwt
from app import app
from models import User
from flask import jsonify, request
from functools import wraps


def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = None

        if 'x-token' in request.headers:
            token = request.headers['x-token']

        if not token:
            return jsonify({'error': 'Token is missing..!'}), 400

        try:
            data = jwt.decode(token, app.config['SECRET_KEY'])
            current_user = User.query.filter_by(pid=data['pid']).first()
        except:
            return jsonify({'error': 'Invalid token..!'}), 400

        return f(current_user, *args, **kwargs)

    return decorated