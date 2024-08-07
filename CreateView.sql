CREATE VIEW mess3  

AS SELECT message_id , sender_id , reciever_id      

  FROM messages   

     WHERE timestamp > to_timestamp('2024/01/01 00:00:00', 'dd-mm-yyyy hh24:mi:ss'); 

CREATE VIEW fed1 

AS SELECT feedback_id , user_id , account_id 

      FROM  feedback 

      WHERE rating < 5 AND rating > 1 ; 