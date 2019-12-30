from . import db

# Id
# Public id
# Full Name
# Gender
# Email Address
# Mobile Number
# Password
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    pid = db.Column(db.Integer)
	fullname = db.Column(db.String(100))
	gender = db.Column(db.String(1))
	email = db.Column(db.String(100))
	mobile = db.Column(db.String(20))
	password_hash = db.Column(db.String(100))

# User public id
# Title
# Subtitle
# Content
# Date added
# Time Created
# Colour
# Bookmarked
class Note(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	user_pid = db.Column(db.Integer)
	title = db.Column(db.String(100))
	subtitle = db.Column(db.String(100))
	content = db.Column(db.Text)
	