from app import db
from api import token_required
from models import Note
from flask import Blueprint, jsonify, request

note = Blueprint('note', __name__)


# * To get all notes a user have
@note.route('/note')
@token_required
def get_notes(current_user):
    if not current_user:
        return jsonify({'error': 'User does not exist..!'}), 400

    notes_data = Note.query.filter_by(user_pid=current_user.pid)

    notes = []

    for note in notes_data:
        note_data = {}
        note_data['id'] = note.id
        note_data['title'] = note.title
        note_data['colour'] = note.colour
        note_data['content'] = note.content
        note_data['date_added'] = note.date_added
        note_data['time_added'] = note.time_added
        note_data['bookmarked'] = note.bookmarked
        notes.append(note_data)

    return jsonify(notes)


# * To create a new note
@note.route('/note', methods=['POST'])
@token_required
def create_note(current_user):
    if not current_user:
        return jsonify({'error': 'User does not exist..!'}), 400

    data = request.get_json()

    if not data:
        return jsonify({'error': 'No data supplied..!'}), 400

    title = data['title']
    colour = data['colour']
    content = data['content']
    date_added = data['date_added']
    time_added = data['time_added']

    note = Note(user_pid=current_user.pid,
                title=title,
                colour=colour,
                content=content,
                date_added=date_added,
                time_added=time_added,
                bookmarked=False)

    db.session.add(note)
    db.session.commit()

    return jsonify({'success': 'Note created..!'})


# * To edit a saved note
@note.route('/note/<int:nid>', methods=['PUT'])
@token_required
def edit_note(current_user, nid):
    if not current_user:
        return jsonify({'error': 'User does not exist..!'}), 400

    note = Note.query.filter_by(user_pid=current_user.pid, id=nid).first()
    if not note:
        return jsonify({'error': 'Note does not exist..!'}), 400

    data = request.get_json()
    if not data:
        return jsonify({'error': 'No data supplied..!'}), 400

    if 'title' in data:
        note.title = data['title']

    if 'content' in data:
        note.content = data['content']

    if 'colour' in data:
        note.colour = data['colour']

    if 'bookmarked' in data:
        note.bookmarked = data['bookmarked']

    db.session.commit()

    return jsonify({'success': 'Note edited..!'}), 200


# * To delete a note
@note.route('/note/<int:nid>', methods=['DELETE'])
@token_required
def delete_notes(current_user, nid):
    if not current_user:
        return jsonify({'error': 'User does not exist..!'}), 400

    note = Note.query.filter_by(user_pid=current_user.pid, id=nid).first()
    if not note:
        return jsonify({'error': 'Note does not exist..!'}), 400

    db.session.delete(note)
    db.session.commit()

    return jsonify({'success': 'Note has been deleted..!'})