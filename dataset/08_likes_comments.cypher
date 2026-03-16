//Criando curtidas em comentários (nomes fictícios)
// Alex curte comentários
MATCH (alex:User {user_id: 1}), (c999:Comment {comment_id: 999})
MERGE (alex)-[:LIKED {at: date("2026-01-02")}]->(c999);

MATCH (alex:User {user_id: 1}), (c996:Comment {comment_id: 996})
MERGE (alex)-[:LIKED {at: date("2024-09-15")}]->(c996);


// Morgan curte comentários
MATCH (morgan:User {user_id: 2}), (c998:Comment {comment_id: 998})
MERGE (morgan)-[:LIKED {at: date("2025-11-23")}]->(c998);


// Jordan curte comentários
MATCH (jordan:User {user_id: 3}), (c993:Comment {comment_id: 993})
MERGE (jordan)-[:LIKED {at: date("2025-11-24")}]->(c993);


// Taylor curte comentários
MATCH (taylor:User {user_id: 4}), (c992:Comment {comment_id: 992})
MERGE (taylor)-[:LIKED {at: date("2026-02-06")}]->(c992);


// Sam curte comentário
MATCH (sam:User {user_id: 7}), (c991:Comment {comment_id: 991})
MERGE (sam)-[:LIKED {at: date("2024-09-16")}]->(c991);


// Quinn curte comentário
MATCH (quinn:User {user_id: 8}), (c994:Comment {comment_id: 994})
MERGE (quinn)-[:LIKED {at: date("2026-02-05")}]->(c994);
