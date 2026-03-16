// Top influenciadores (usuários com mais seguidores)

MATCH (u:User)<-[:FOLLOWS]-(f:User)
RETURN u.user_id, u.user_name, COUNT(f) AS followers
ORDER BY followers DESC
LIMIT 10;
