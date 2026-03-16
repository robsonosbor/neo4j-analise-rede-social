:// Script helper para carregar o dataset completo no Neo4j Browser.
:// Execute no Neo4j Browser usando `:source dataset/00_load_all.cypher` (ou copie/cole o conteúdo).

// 1) Constraints (garante unicidade)
:source dataset/01_constraints.cypher

// 2) Dados básicos
:source dataset/02_users.cypher
:source dataset/03_posts.cypher
:source dataset/04_comments.cypher

// 3) Relacionamentos sociais
:source dataset/05_follows.cypher
:source dataset/06_friends.cypher

// 4) Interações (likes, shares)
:source dataset/07_likes_posts.cypher
:source dataset/08_likes_comments.cypher
:source dataset/09_shares.cypher

// 5) Grupos / comunidade
:source dataset/10_groups.cypher
:source dataset/11_group_members.cypher
:source dataset/12_group_posts.cypher
