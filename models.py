from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///finance.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# Base User model
class User(db.Model):
    __tablename__ = 'users'
    user_id = db.Column(db.Integer, primary_key=True)
    password = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    profile_picture = db.Column(db.String(100))
    financial_background = db.Column(db.Text)

    accounts = db.relationship('FinancialAccount', backref='owner', lazy=True)
    statements = db.relationship('Statement', backref='user', lazy=True)
    feedbacks = db.relationship('Feedback', backref='user', lazy=True)

# Advisor model as a subclass of User
class Advisor(User):
    __tablename__ = 'advisors'
    advisor_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), primary_key=True)
    biography = db.Column(db.Text)
    clients = db.relationship('User', secondary='advisor_clients', backref='advisors', lazy=True)

advisor_clients = db.Table('advisor_clients',
    db.Column('advisor_id', db.Integer, db.ForeignKey('advisors.advisor_id')),
    db.Column('user_id', db.Integer, db.ForeignKey('users.user_id'))
)

# Financial Account model
class FinancialAccount(db.Model):
    __tablename__ = 'financial_accounts'
    account_id = db.Column(db.Integer, primary_key=True)
    account_type = db.Column(db.String(50), nullable=False)
    description = db.Column(db.Text)
    transactions = db.relationship('Transaction', backref='account', lazy=True)
    opening_date = db.Column(db.DateTime)
    closing_date = db.Column(db.DateTime)

    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)

# Transaction model and subclasses
class Transaction(db.Model):
    __tablename__ = 'transactions'
    transaction_id = db.Column(db.Integer, primary_key=True)
    status = db.Column(db.String(50))
    amount = db.Column(db.Float, nullable=False)
    date = db.Column(db.DateTime)

    account_id = db.Column(db.Integer, db.ForeignKey('financial_accounts.account_id'), nullable=False)

class Deposit(Transaction):
    __tablename__ = 'deposits'
    deposit_id = db.Column(db.Integer, db.ForeignKey('transactions.transaction_id'), primary_key=True)
    source = db.Column(db.String(100))

class Withdraw(Transaction):
    __tablename__ = 'withdraws'
    withdraw_id = db.Column(db.Integer, db.ForeignKey('transactions.transaction_id'), primary_key=True)
    destination = db.Column(db.String(100))

class Transfer(Transaction):
    __tablename__ = 'transfers'
    transfer_id = db.Column(db.Integer, db.ForeignKey('transactions.transaction_id'), primary_key=True)
    destination = db.Column(db.String(100))

# Statement model
class Statement(db.Model):
    __tablename__ = 'statements'
    statement_id = db.Column(db.Integer, primary_key=True)
    timestamp = db.Column(db.DateTime)

    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    transactions = db.relationship('Transaction', secondary='statement_transactions', backref='statements', lazy=True)

statement_transactions = db.Table('statement_transactions',
    db.Column('statement_id', db.Integer, db.ForeignKey('statements.statement_id')),
    db.Column('transaction_id', db.Integer, db.ForeignKey('transactions.transaction_id'))
)

# Feedback model
class Feedback(db.Model):
    __tablename__ = 'feedbacks'
    feedback_id = db.Column(db.Integer, primary_key=True)
    ratings = db.Column(db.Integer)
    text_comments = db.Column(db.Text)

    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    account_id = db.Column(db.Integer, db.ForeignKey('financial_accounts.account_id'), nullable=False)

# Relationship models for messages and updates
class Message(db.Model):
    __tablename__ = 'messages'
    message_id = db.Column(db.Integer, primary_key=True)
    sender_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    receiver_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    timestamp = db.Column(db.DateTime)
    related_thread = db.Column(db.String(100))

class Update(db.Model):
    __tablename__ = 'updates'
    update_id = db.Column(db.Integer, primary_key=True)
    advisor_id = db.Column(db.Integer, db.ForeignKey('advisors.advisor_id'), nullable=False)
    content = db.Column(db.Text)
    timestamp = db.Column(db.DateTime)
