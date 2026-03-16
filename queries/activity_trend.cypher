// Tendência de criação de posts ao longo do tempo (por mês)

MATCH (p:Post)
WITH date.truncate('month', p.created_at) AS month, COUNT(*) AS totalPosts
RETURN month, totalPosts
ORDER BY month;
