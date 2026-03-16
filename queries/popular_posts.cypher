//Posts populares da rede

MATCH (:User)-[:LIKED]->(p:Post)
RETURN p.post_id, p.content, COUNT(*) AS totalLikes
ORDER BY totalLikes DESC
LIMIT 5;
