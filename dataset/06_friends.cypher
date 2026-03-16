//Criando amizades (nomes fictícios)
// Alex e Morgan
MATCH (alex:User {user_id: 1}), (morgan:User {user_id: 2})
MERGE (alex)-[:FRIENDS_WITH]->(morgan)
MERGE (morgan)-[:FRIENDS_WITH]->(alex);

// Alex e Jordan
MATCH (alex:User {user_id: 1}), (jordan:User {user_id: 3})
MERGE (alex)-[:FRIENDS_WITH]->(jordan)
MERGE (jordan)-[:FRIENDS_WITH]->(alex);

// Morgan e Sam
MATCH (morgan:User {user_id: 2}), (sam:User {user_id: 7})
MERGE (morgan)-[:FRIENDS_WITH]->(sam)
MERGE (sam)-[:FRIENDS_WITH]->(morgan);

// Casey e Quinn
MATCH (casey:User {user_id: 6}), (quinn:User {user_id: 8})
MERGE (casey)-[:FRIENDS_WITH]->(quinn)
MERGE (quinn)-[:FRIENDS_WITH]->(casey);

// Riley e Charlie
MATCH (riley:User {user_id: 9}), (charlie:User {user_id: 10})
MERGE (riley)-[:FRIENDS_WITH]->(charlie)
MERGE (charlie)-[:FRIENDS_WITH]->(riley);
