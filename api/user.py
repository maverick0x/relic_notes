import jwt
import uuid
from app import app, db
from api import token_required
from models import User
from flask import Blueprint, jsonify, request
from werkzeug.security import check_password_hash, generate_password_hash

user = Blueprint('user', __name__)


# * To get all users in the database
@user.route('/users', methods=['GET'])
def get_users():
    users_data = User.query.all()

    users = []

    for user in users_data:
        user_data = {}
        user_data['name'] = user.name
        user_data['email'] = user.email
        user_data['mobile'] = user.mobile
        users.append(user_data)

    return jsonify(users), 200


# * To get a single user in the database
@user.route('/user', methods=['GET'])
@token_required
def get_user(current_user):
    if not current_user:
        return jsonify({'error': 'User does not exist..!'}), 400

    user_data = {}
    user_data['name'] = current_user.name
    user_data['email'] = current_user.email
    user_data['mobile'] = current_user.mobile

    return jsonify(user_data), 200


# * To create new user in the database
@user.route('/user/signup', methods=['POST'])
def create_user():
    data = request.get_json()

    pid = str(uuid.uuid4())
    name = data['name']
    email = data['email']
    mobile = data['mobile']
    password = generate_password_hash(data['password'], method='sha256')

    if User.query.filter_by(email=email).first():
        return jsonify({'error': 'Email used already..!'}), 400

    if User.query.filter_by(mobile=mobile).first():
        return jsonify({'error': 'Mobile used already..!'}), 400

    new_user = User(pid=pid,
                    name=name,
                    email=email,
                    mobile=mobile,
                    password=password)

    db.session.add(new_user)
    db.session.commit()

    return jsonify({'success': 'User created..!'}), 200


# * To edit a specific user in the database
@user.route('/user/edit', methods=['PUT'])
@token_required
def edit_user(current_user):
    if not current_user:
        return jsonify({'error': 'User does not exist..!'}), 400

    data = request.get_json()

    if data['name']:
        current_user.name = data['name']

    db.session.commit()

    return jsonify({'success': 'User edited..!'}), 200


# * To remove a specific user from the database
@user.route('/user/delete', methods=['DELETE'])
@token_required
def delete_user(current_user):
    if not current_user:
        return jsonify({'error': 'User does not exist..!'}), 400

    db.session.delete(current_user)
    db.session.commit()

    return jsonify({'message': 'User has been deleted..!'}), 200


# * To log in to the app and generate token
@user.route('/user/login', methods=['POST'])
def login():
    data = request.get_json()

    if not data or not data['email'] or not data['password']:
        return jsonify({'error': 'Check login details..!'}), 400

    user = User.query.filter_by(email=data['email']).first()

    if not user:
        return jsonify({'error': 'User does not exist..!'}), 400

    if not check_password_hash(user.password, data['password']):
        return jsonify({'error': 'Incorrect password..!'}), 400

    token = jwt.encode({'pid': user.pid}, app.config['SECRET_KEY'])

    return jsonify({
        'success': user.name + ' logged in..!',
        'token': token.decode('UTF-8'),
    }), 200