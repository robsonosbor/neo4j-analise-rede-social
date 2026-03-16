//Criando comentários (nomes fictícios)
MATCH (casey:User {user_id: 6})
MATCH (post:Post {post_id: 103})
MERGE (casey)-[:CREATED {at: date("2026-01-01")}]->(c:Comment {
        comment_id: 999,
        text: "Happy new year for you too!",
        created_at: date("2026-01-01")
})
MERGE (c)-[:COMMENTED_ON]->(post);

MATCH (casey:User {user_id: 6})
MATCH (post:Post {post_id: 101})
MERGE (casey)-[:CREATED {at: date("2025-11-22")}]->(c:Comment {
        comment_id: 998,
        text: "Congratulations!",
        created_at: date("2025-11-22")
})
MERGE (c)-[:COMMENTED_ON]->(post);

MATCH (sam:User {user_id: 7})
MATCH (post:Post {post_id: 102})
MERGE (sam)-[:CREATED {at: date("2025-09-13")}]->(c:Comment {
        comment_id: 997,
        text: "Have fun! You deserve it!",
        created_at: date("2025-09-13")
})
MERGE (c)-[:COMMENTED_ON]->(post);

MATCH (quinn:User {user_id: 8})
MATCH (post:Post {post_id: 105})
MERGE (quinn)-[:CREATED {at: date("2024-09-14")}]->(c:Comment {
        comment_id: 996,
        text: "Let me go with you!",
        created_at: date("2024-09-14")
})
MERGE (c)-[:COMMENTED_ON]->(post);

MATCH (quinn:User {user_id: 8})
MATCH (post:Post {post_id: 105})
MERGE (quinn)-[:CREATED {at: date("2024-09-14")}]->(c:Comment {
        comment_id: 995,
        text: "I'm just kidding. Take care, friend! Hope everything is going ok.",
        created_at: date("2024-09-14")
})
MERGE (c)-[:COMMENTED_ON]->(post);

MATCH (riley:User {user_id: 9})
MATCH (post:Post {post_id: 104})
MERGE (riley)-[:CREATED {at: date("2026-02-04")}]->(c:Comment {
        comment_id: 994,
        text: "Congrats!!!",
        created_at: date("2026-02-04")
})
MERGE (c)-[:COMMENTED_ON]->(post);

MATCH (morgan:User {user_id: 2})
MATCH (post:Post {post_id: 101})
MERGE (morgan)-[:CREATED {at: date("2025-11-23")}]->(c:Comment {
    comment_id: 993,
    text: "Wishing health and happiness to your family",
    created_at: date("2025-11-23")
})
MERGE (c)-[:COMMENTED_ON]->(post);

MATCH (charlie:User {user_id: 10})
MATCH (post:Post {post_id: 104})
MERGE (charlie)-[:CREATED {at: date("2026-02-05")}]->(c:Comment {
    comment_id: 992,
    text: "This is just the beginning. Keep going!",
    created_at: date("2026-02-05")
})
MERGE (c)-[:COMMENTED_ON]->(post);

MATCH (jordan:User {user_id: 3})
MATCH (post:Post {post_id: 105})
MERGE (jordan)-[:CREATED {at: date("2024-09-15")}]->(c:Comment {
    comment_id: 991,
    text: "Big changes are scary, but also exciting. Good luck!",
    created_at: date("2024-09-15")
})
MERGE (c)-[:COMMENTED_ON]->(post);
