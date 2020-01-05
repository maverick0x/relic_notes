from app import db


# * Id
# * Public id
# * Full Name
# * Email Address
# * Mobile Number
# * Password
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    pid = db.Column(db.String(100), unique=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    mobile = db.Column(db.String(15), unique=True, nullable=False)
    password = db.Column(db.String(100), nullable=False)

    def __repr__(self):
        return 'User name is ' + self.name


# * Title
# * Subtitle
# * Content
# * Date added
# * Time Created
# * Colour
# * Bookmarked
# * User public id
class Note(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    user_pid = db.Column(db.String(100))
    title = db.Column(db.String(50), nullable=False)
    colour = db.Column(db.String(20), nullable=False)
    content = db.Column(db.Text, nullable=False)
    date_added = db.Column(db.String(11), nullable=False)
    time_added = db.Column(db.String(10), nullable=False)
    bookmarked = db.Column(db.Boolean)

    def __repr__(self):
        return self.title + 'is the title of the note'