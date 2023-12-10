from app.models import db, Like, environment, SCHEMA
from sqlalchemy.sql import text

# class Like(db.Model):
#     __tablename__ = 'likes'

#     if environment == "production":
#         __table_args__ = {'schema': SCHEMA}

#     id = db.Column(db.Integer, primary_key=True)
#     user_id = db.Column(db.Integer, db.ForeignKey("users.id"), nullable=False)
#     post_id = db.Column(db.Integer, db.ForeignKey("posts.id"), nullable=False)

def seed_likes():
    new_like = Like(
        user_id=1,
        post_id=1
    )
    another_like = Like(
        user_id=1,
        post_id=2
    )
    one_more_like = Like(
        user_id=1,
        post_id=3
    )
    db.session.add(new_like)
    db.session.add(another_like)
    db.session.add(one_more_like)
    db.session.commit()

def undo_likes():
    if environment == "production":
        db.session.execute(f"TRUNCATE table {SCHEMA}.likes RESTART IDENTITY CASCADE;")
    else:
        db.session.execute(text("DELETE FROM likes"))

    db.session.commit()
