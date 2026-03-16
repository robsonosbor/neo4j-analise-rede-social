// Grupos mais ativos (com mais posts)

MATCH (g:Group)<-[:POSTED_IN]-(p:Post)
RETURN g.group_id, g.name AS groupName, COUNT(p) AS totalPosts
ORDER BY totalPosts DESC
LIMIT 10;
