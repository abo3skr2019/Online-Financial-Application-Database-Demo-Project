CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,    
    profile_picture VARCHAR(100) DEFAULT 'https://i.imgur.com/AJ3InNO.png',
    financial_background VARCHAR(100) NOT NULL
);

CREATE TABLE advisors (
    advisor_id INTEGER PRIMARY KEY,
    biography TEXT NOT NULL,
    FOREIGN KEY (advisor_id) REFERENCES users(user_id)
);

CREATE TABLE financial_accounts (
    account_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    account_type VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    opening_date TIMESTAMP NOT NULL,
    closing_date TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
    account_id INTEGER NOT NULL,
    transaction_status VARCHAR(50) NOT NULL,
    transaction_date TIMESTAMP NOT NULL,
    transaction_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (account_id) REFERENCES financial_accounts(account_id)
);

CREATE TABLE deposits (
    transaction_id INTEGER PRIMARY KEY,
    deposit_amount DECIMAL(10,2) NOT NULL,
    source VARCHAR(100) NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);

CREATE TABLE withdraws (
    transaction_id INTEGER PRIMARY KEY,
    withdrawal_amount DECIMAL(10,2) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);

CREATE TABLE transfers (
    transaction_id INTEGER PRIMARY KEY,
    transfer_amount DECIMAL(10,2) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);

CREATE TABLE statements (
    statement_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE feedbacks (
    feedback_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    account_id INTEGER NOT NULL,
    text_comments TEXT NOT NULL,
    rating INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (account_id) REFERENCES financial_accounts(account_id)
);

CREATE TABLE messages (
    message_id INTEGER PRIMARY KEY AUTOINCREMENT,
    sender_id INTEGER NOT NULL,
    receiver_id INTEGER NOT NULL,
    related_thread VARCHAR(100) NOT NULL,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES users(user_id)
);

CREATE TABLE updates (
    update_id INTEGER PRIMARY KEY AUTOINCREMENT,
    advisor_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (advisor_id) REFERENCES advisors(advisor_id)
);

CREATE TABLE advisor_clients (
    advisor_id INTEGER NOT NULL,
    client_id INTEGER NOT NULL,
    PRIMARY KEY (advisor_id, client_id),
    FOREIGN KEY (advisor_id) REFERENCES advisors(advisor_id),
    FOREIGN KEY (client_id) REFERENCES users(user_id)
);