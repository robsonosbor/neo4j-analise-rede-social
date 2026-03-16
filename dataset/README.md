# Dados do projeto (dataset)

Este diretório contém os scripts Cypher usados para criar o grafo da rede social no Neo4j.

## Ordem de execução recomendada
1. `01_constraints.cypher` – cria constraints de unicidade
2. `02_users.cypher` – cria usuários
3. `03_posts.cypher` – cria posts
4. `04_comments.cypher` – cria comentários
5. `05_follows.cypher` – cria relacionamentos de seguidores
6. `06_friends.cypher` – cria relacionamentos de amizade
7. `07_likes_posts.cypher` – cria curtidas em posts
8. `08_likes_comments.cypher` – cria curtidas em comentários
9. `09_shares.cypher` – cria compartilhamentos
10. `10_groups.cypher` – cria grupos
11. `11_group_members.cypher` – adiciona membros aos grupos
12. `12_group_posts.cypher` – adiciona postagens dentro de grupos

> Use `dataset/00_load_all.cypher` para executar todos os scripts em sequência no Neo4j Browser via `:source`.

## CSV de exemplo (LOAD CSV)

Existe um exemplo de ingestão via CSV para demonstrar um pipeline real.
- Arquivo: `dataset/csv/users.csv`
- Script de ingestão: `dataset/load_users_from_csv.cypher`

Nota: caminhos `file:///` variam conforme instalação do Neo4j (pasta `import`).

## Observações
- Os scripts usam `MERGE` quando adequado para evitar duplicação de nós/relacionamentos.
- Caso queira resetar o banco antes de recarregar, rode:
  ```cypher
  MATCH (n) DETACH DELETE n;
  ```
