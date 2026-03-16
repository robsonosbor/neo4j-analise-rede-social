//Criando curtidas em posts (nomes fictícios)
// Curtidas do Alex
MATCH (alex:User {user_id: 1}), (p102:Post {post_id: 102}), (p105:Post {post_id: 105})
MERGE (alex)-[:LIKED {at: date("2025-09-14")}]->(p102)
MERGE (alex)-[:LIKED {at: date("2024-09-15")}]->(p105);

// Curtidas da Morgan
MATCH (morgan:User {user_id: 2}), (p101:Post {post_id: 101}), (p104:Post {post_id: 104})
MERGE (morgan)-[:LIKED {at: date("2025-11-23")}]->(p101)
MERGE (morgan)-[:LIKED {at: date("2026-02-05")}]->(p104);

// Curtidas do Jordan
MATCH (jordan:User {user_id: 3}), (p105:Post {post_id: 105})
MERGE (jordan)-[:LIKED {at: date("2024-09-16")}]->(p105);

// Curtidas da Quinn
MATCH (quinn:User {user_id: 8}), (p103:Post {post_id: 103})
MERGE (quinn)-[:LIKED {at: date("2026-01-02")}]->(p103);
