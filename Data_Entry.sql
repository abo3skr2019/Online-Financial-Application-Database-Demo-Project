-- Insert data into users table
INSERT INTO users (email, password, financial_background) VALUES
('user1@example.com', 'password1', 'Good'),
('user2@example.com', 'password2', 'Average'),
('user3@example.com', 'password3', 'Excellent'),
('user4@example.com', 'password4', 'Poor'),
('user5@example.com', 'password5', 'Good'),
('user6@example.com', 'password6', 'Average');

-- Insert data into advisors table
INSERT INTO advisors (advisor_id, biography) VALUES
(1, 'Experienced financial advisor with over 10 years in the industry.'),
(2, 'Specializes in retirement planning and investment strategies.'),
(3, 'Expert in tax planning and wealth management.'),
(4, 'Focuses on helping young professionals build their financial future.'),
(5, 'Provides comprehensive financial planning services.'),
(6, 'Known for personalized financial advice and client satisfaction.');

-- Insert data into financial_accounts table
INSERT INTO financial_accounts (user_id, account_type, description, opening_date) VALUES
(1, 'Savings', 'Primary savings account', '2022-01-01 10:00:00'),
(2, 'Checking', 'Main checking account', '2022-02-01 11:00:00'),
(3, 'Investment', 'Stock investment account', '2022-03-01 12:00:00'),
(4, 'Retirement', '401k retirement account', '2022-04-01 13:00:00'),
(5, 'Savings', 'Emergency fund savings account', '2022-05-01 14:00:00'),
(6, 'Checking', 'Secondary checking account', '2022-06-01 15:00:00');

-- Insert data into transactions table
INSERT INTO transactions (account_id, transaction_status, transaction_date, transaction_amount) VALUES
(1, 'Completed', '2022-01-10 10:00:00', 100.00),
(2, 'Pending', '2022-02-10 11:00:00', 200.00),
(3, 'Completed', '2022-03-10 12:00:00', 300.00),
(4, 'Failed', '2022-04-10 13:00:00', 400.00),
(5, 'Completed', '2022-05-10 14:00:00', 500.00),
(6, 'Pending', '2022-06-10 15:00:00', 600.00);

-- Insert data into deposits table
INSERT INTO deposits (transaction_id, deposit_amount, source) VALUES
(1, 100.00, 'Salary'),
(2, 200.00, 'Freelance Work'),
(3, 300.00, 'Investment Returns'),
(4, 400.00, 'Gift'),
(5, 500.00, 'Bonus'),
(6, 600.00, 'Sale of Assets');

-- Insert data into withdraws table
INSERT INTO withdraws (transaction_id, withdrawal_amount, destination) VALUES
(1, 50.00, 'ATM Withdrawal'),
(2, 100.00, 'Online Purchase'),
(3, 150.00, 'Bill Payment'),
(4, 200.00, 'Transfer to Savings'),
(5, 250.00, 'Cash Withdrawal'),
(6, 300.00, 'Loan Repayment');

-- Insert data into transfers table
INSERT INTO transfers (transaction_id, transfer_amount, destination) VALUES
(1, 75.00, 'Transfer to Checking'),
(2, 125.00, 'Transfer to Investment'),
(3, 175.00, 'Transfer to Retirement'),
(4, 225.00, 'Transfer to Savings'),
(5, 275.00, 'Transfer to Emergency Fund'),
(6, 325.00, 'Transfer to Secondary Checking');

-- Insert data into statements table
INSERT INTO statements (user_id) VALUES
(1),
(2),
(3),
(4),
(5),
(6);

-- Insert data into statement_transactions table
INSERT INTO statement_transactions (statement_id, transaction_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- Insert data into feedbacks table
INSERT INTO feedbacks (user_id, account_id, text_comments, rating) VALUES
(1, 1, 'Great service!', 5),
(2, 2, 'Satisfied with the account.', 4),
(3, 3, 'Could be better.', 3),
(4, 4, 'Not happy with the service.', 2),
(5, 5, 'Excellent!', 5),
(6, 6, 'Average experience.', 3);

-- Insert data into messages table
INSERT INTO messages (sender_id, receiver_id, related_thread) VALUES
(1, 2, 'Account Inquiry'),
(2, 3, 'Transaction Issue'),
(3, 4, 'Feedback Request'),
(4, 5, 'Service Inquiry'),
(5, 6, 'Account Update'),
(6, 1, 'General Query');

-- Insert data into updates table
INSERT INTO updates (advisor_id, content) VALUES
(1, 'New investment opportunities available.'),
(2, 'Retirement planning tips.'),
(3, 'Tax planning strategies for the year.'),
(4, 'Financial advice for young professionals.'),
(5, 'Comprehensive financial planning services.'),
(6, 'Personalized financial advice.');

-- Insert data into advisor_clients table
INSERT INTO advisor_clients (advisor_id, client_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);