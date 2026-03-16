// Membros dos grupos (nomes fictícios)
MATCH (jordan:User {user_id: 3}), (g1:Group {group_id: 1})
MERGE (jordan)-[:MEMBER_OF {since: date("2024-06-01")}]->(g1);

MATCH (taylor:User {user_id: 4}), (g2:Group {group_id: 2})
MERGE (taylor)-[:MEMBER_OF {since: date("2025-01-10")}]->(g2);

MATCH (avery:User {user_id: 5}), (g3:Group {group_id: 3})
MERGE (avery)-[:MEMBER_OF {since: date("2023-04-02")}]->(g3);
