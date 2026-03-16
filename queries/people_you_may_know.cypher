//Pessoas que você talvez conheça (amigo de amigo)

MATCH (u1:User {user_id: 1})-[:FRIENDS_WITH]->(f1)-[:FRIENDS_WITH]->(f2)
WHERE f2 <> u1
  AND NOT (u1)-[:FRIENDS_WITH]->(f2)
RETURN f2.user_id, f2.user_name, COUNT(*) AS mutualFriends
ORDER BY mutualFriends DESC;
