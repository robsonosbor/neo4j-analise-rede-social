// Criando seguidores (nomes fictícios)
// Alex segue Morgan, Jordan, Taylor
MATCH (alex:User {user_id: 1})
MATCH (morgan:User {user_id: 2})
MATCH (jordan:User {user_id: 3})
MATCH (taylor:User {user_id: 4})
MERGE (alex)-[:FOLLOWS]->(morgan)
MERGE (alex)-[:FOLLOWS]->(jordan)
MERGE (alex)-[:FOLLOWS]->(taylor);

// Morgan segue Avery e Quinn
MATCH (morgan:User {user_id: 2})
MATCH (avery:User {user_id: 5})
MATCH (quinn:User {user_id: 8})
MERGE (morgan)-[:FOLLOWS]->(avery)
MERGE (morgan)-[:FOLLOWS]->(quinn);

// Jordan segue Alex e Casey
MATCH (jordan:User {user_id: 3})
MATCH (alex:User {user_id: 1})
MATCH (casey:User {user_id: 6})
MERGE (jordan)-[:FOLLOWS]->(alex)
MERGE (jordan)-[:FOLLOWS]->(casey);
