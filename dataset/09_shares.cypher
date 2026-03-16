//Criando compartilhamentos (nomes fictícios)
// Compartilhamentos da Morgan
MATCH (morgan:User {user_id: 2}), (p101:Post {post_id: 101})
MERGE (morgan)-[:SHARED {at: date("2025-11-24")}]->(p101);

// Compartilhamentos do Casey
MATCH (casey:User {user_id: 6}), (p105:Post {post_id: 105})
MERGE (casey)-[:SHARED {at: date("2024-09-16")}]->(p105);

// Compartilhamentos do Sam
MATCH (sam:User {user_id: 7}), (p102:Post {post_id: 102})
MERGE (sam)-[:SHARED {at: date("2025-09-14")}]->(p102);
