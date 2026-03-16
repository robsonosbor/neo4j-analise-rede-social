// Posts com mais comentários

MATCH (p:Post)<-[:COMMENTED_ON]-(c:Comment)
RETURN p.post_id, p.content, COUNT(c) AS totalComments
ORDER BY totalComments DESC
LIMIT 5;
