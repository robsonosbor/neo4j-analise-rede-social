// Exemplo de ingestão usando LOAD CSV (pipeline real)
// 1) Coloque `dataset/csv/users.csv` em um diretório acessível pelo Neo4j Browser.
// 2) Ajuste o caminho se necessário (ex: file:///c:/ws-vscode/.../dataset/csv/users.csv).

USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///dataset/csv/users.csv" AS row
MERGE (u:User {user_id: toInteger(row.user_id)})
SET u.user_name = row.user_name,
    u.since = date(row.since);
