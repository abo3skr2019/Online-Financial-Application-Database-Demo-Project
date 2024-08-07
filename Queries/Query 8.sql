SELECT 
    m.sender_id, 
    sender.email AS sender_email, 
    m.receiver_id, 
    receiver.email AS receiver_email
FROM 
    messages m
JOIN 
    users sender ON m.sender_id = sender.user_id
JOIN 
    users receiver ON m.receiver_id = receiver.user_id;