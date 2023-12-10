from app.models import db, Post, environment, SCHEMA
from sqlalchemy.sql import text


def seed_posts():
    new_post = Post(
        user_id=1,
        title="I'm a dog",
        content="I'm a dog",
        image_url="https://i.imgur.com/2ZQ2YtW.jpg"
    )
    another_post = Post(
        user_id=2,
        title="I'm a cat",
        content="I'm a cat",
        image_url="https://i.imgur.com/2ZQ2YtW.jpg"
    )
    one_more_post = Post(
        user_id=3,
        title="I'm a fish",
        content="I'm a fish",
        image_url="https://i.imgur.com/2ZQ2YtW.jpg"
    )
    db.session.add(new_post)
    db.session.add(another_post)
    db.session.add(one_more_post)
    db.session.commit()

def undo_posts():
    if environment == "production":
        db.session.execute(f"TRUNCATE table {SCHEMA}.posts RESTART IDENTITY CASCADE;")
    else:
        db.session.execute(text("DELETE FROM posts"))

    db.session.commit()
