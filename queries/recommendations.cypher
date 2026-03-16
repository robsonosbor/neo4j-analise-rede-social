//Recomenda posts de usuários que o usuário 1 segue ou é amigo curtiram

MATCH (u1:User {user_id: 1})
MATCH (u1)-[:FRIENDS_WITH|FOLLOWS]->(user)
MATCH (user)-[:LIKED]->(p:Post)
WHERE NOT (u1)-[:CREATED]->(p)
  AND NOT (u1)-[:LIKED]->(p)
RETURN DISTINCT p.post_id AS postRecommended, p.content
