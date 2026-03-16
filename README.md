# Rede Social com Neo4j – Sistema de Recomendações

Este repositório contém um protótipo de banco de dados orientado a grafos, desenvolvido com Neo4j e Cypher, que simula uma rede social com usuários, posts, comentários, curtidas, amizades, seguidores e grupos.

O foco do projeto é demonstrar como bancos de dados em grafos podem ser utilizados para gerar recomendações e insights sociais a partir das conexões entre usuários e conteúdos.

---

## Contexto do problema

Uma startup de análise de mídias sociais deseja criar um novo produto capaz de oferecer insights sobre engajamento, conexões entre usuários e popularidade de conteúdo dentro de uma plataforma social.

A solução precisa permitir consultas complexas, como:
- Recomendar conteúdos com base em interações sociais
- Identificar posts populares
- Sugerir novas conexões entre usuários
- Analisar engajamento em posts, comentários e grupos

---

## Desafio

Utilizando os conhecimentos adquiridos ao longo do módulo, o desafio consiste em:

- Projetar o modelo de dados de uma rede social
- Construir um dataset consistente em Neo4j
- Criar consultas Cypher capazes de responder perguntas reais de negócio

Este projeto representa um protótipo funcional, com foco na modelagem correta dos relacionamentos e na exploração do potencial dos grafos.

---

## Tecnologias utilizadas

- Neo4j
- Cypher Query Language
- Modelagem de dados orientada a grafos

---

## Como executar (instalação + carga de dados)

### 1) Preparar o ambiente
- Instale o Neo4j Desktop ou use o Neo4j Sandbox / Aura Free.
- Crie um banco de dados e anote o usuário/senha (por padrão: `neo4j` / `neo4j`).

### 2) Carregar os scripts no Neo4j Browser
1. Abra o Neo4j Browser e conecte-se ao seu banco.
2. Execute os scripts na ordem (1→12) usando copy/paste ou `:source`:
   - `dataset/01_constraints.cypher`
   - `dataset/02_users.cypher`
   - `dataset/03_posts.cypher`
   - `dataset/04_comments.cypher`
   - `dataset/05_follows.cypher`
   - `dataset/06_friends.cypher`
   - `dataset/07_likes_posts.cypher`
   - `dataset/08_likes_comments.cypher`
   - `dataset/09_shares.cypher`
   - `dataset/10_groups.cypher`
   - `dataset/11_group_members.cypher`
   - `dataset/12_group_posts.cypher`

> Nota: No Neo4j Browser você também pode usar `:source <caminho>` (ex: `:source dataset/01_constraints.cypher`) se o diretório estiver acessível.

> Exemplo de ingestão via CSV (pipeline real):
> - `dataset/load_users_from_csv.cypher`
> - `dataset/csv/users.csv`

### 3) Verificar esquema e dados
- Verifique as constraints:
  - `:schema`
- Visualize o grafo (diagrama):
  - `CALL db.schema.visualization();`

Para exportar o diagrama como imagem no Neo4j Browser:
1. Execute `CALL db.schema.visualization();`
2. Clique no botão de opções (três pontos) e escolha **Export as PNG** ou **Export as SVG**.
3. Salve a imagem e adicione ao repositório (por exemplo: `docs/graph-schema.png`).

---

## Troubleshooting / dicas comuns

- Se um script falhar por conta de chaves únicas já existentes, limpe o banco antes de recarregar:
  - `MATCH (n) DETACH DELETE n;`
  - `DROP CONSTRAINT ...` (se necessário)
- Se o `:source` não funcionar, copie/cole o conteúdo do `.cypher` no editor do Browser.
- Para ver o modelo (labels/relacionamentos) use:
  - `MATCH (n) RETURN DISTINCT labels(n), count(*) ORDER BY count(*) DESC LIMIT 20;`
  - `MATCH ()-[r]->() RETURN type(r), count(*) ORDER BY count(*) DESC LIMIT 20;`

---

## Estrutura do dataset

O banco de dados foi construído seguindo as etapas abaixo:

1. Criação de constraints (UNIQUE)
2. Criação de usuários
3. Criação de posts
4. Criação de comentários em posts
5. Criação de relacionamentos de seguidores (FOLLOWS)
6. Criação de relacionamentos de amizade (FRIENDS_WITH – bidirecional)
7. Criação de curtidas em posts
8. Criação de curtidas em comentários
9. Criação de compartilhamentos
10. Criação de grupos
11. Criação de membros dos grupos
12. Criação de postagens dentro de grupos

---

## Modelo conceitual

### Principais nós
- `User`
- `Post`
- `Comment`
- `Group`

### Principais relacionamentos
- `(:User)-[:FOLLOWS]->(:User)`
- `(:User)-[:FRIENDS_WITH]->(:User)`
- `(:User)-[:CREATED]->(:Post | :Comment)`
- `(:User)-[:LIKED]->(:Post | :Comment)`
- `(:User)-[:SHARED]->(:Post)`
- `(:Comment)-[:COMMENTED_ON]->(:Post)`
- `(:User)-[:MEMBER_OF]->(:Group)`
- `(:Post)-[:POSTED_IN]->(:Group)`

---

## Consultas de recomendação

As consultas de negócio completas estão em `queries/`. Use o Neo4j Browser para rodar cada `.cypher` e visualizar o grafo.

### 1. Posts curtidos por usuários que o usuário 1 segue, mas que ele ainda não curtiu
*(Descartando os próprios posts do usuário)*

```cypher
MATCH (u1:User {user_id: 1})
MATCH (u1)-[:FRIENDS_WITH|FOLLOWS]->(user)
MATCH (user)-[:LIKED]->(p:Post)
WHERE NOT (u1)-[:CREATED]->(p)
  AND NOT (u1)-[:LIKED]-(p)
RETURN DISTINCT p.post_id AS postRecommended, p.content;
```

### 2. Pessoas que talvez conheçam (amigo de amigo)
```cypher
MATCH (u1:User {user_id: 1})-[:FRIENDS_WITH]->(f1)-[:FRIENDS_WITH]->(f2)
WHERE f2 <> u1
  AND NOT (u1)-[:FRIENDS_WITH]->(f2)
RETURN f2.user_id, f2.user_name, COUNT(*) AS mutualFriends
ORDER BY mutualFriends DESC;
```

### 3. Posts mais populares da rede
```cypher
MATCH (:User)-[:LIKED]->(p:Post)
RETURN p.post_id, p.content, COUNT(*) AS totalLikes
ORDER BY totalLikes DESC
LIMIT 5;
```

## Outras consultas de negócio (exemplos)
Além das recomendações, o projeto contém outras queries que exploram engajamento e conexões sociais. Você pode encontrá-las em `queries/`.

- `queries/people_you_may_know.cypher` – sugere novos amigos baseado em amigos em comum.
- `queries/popular_posts.cypher` – lista posts mais curtidos.
- `queries/recommendations.cypher` – recomenda posts favoritos de amigos e seguidores.
- `queries/most_commented_posts.cypher` – identifica posts com mais comentários.
- `queries/top_influencers.cypher` – identifica os usuários com mais seguidores.
- `queries/most_active_groups.cypher` – identifica grupos mais ativos por número de posts.
- `queries/activity_trend.cypher` – mostra tendências de criação de posts por mês.

## Objetivos alcançados

- Modelagem de uma rede social usando grafos
- Criação de um dataset consistente e relacional
- Implementação de recomendações baseadas em conexões sociais
- Exploração prática do Neo4j e da linguagem Cypher
- Demonstração de ingestão via CSV (LOAD CSV)
- Consultas de negócio adicionais (influenciadores, grupos ativos, tendências de atividade)

## Aprendizado

Neste projeto, foram fortalecidos os conceitos e práticas de:

- Modelagem de dados em grafos (nós, relacionamentos e propriedades)
- Uso de `MERGE` para garantir idempotência na carga de dados
- Escrita de consultas Cypher para consultas analíticas (recomendações, métricas, tendências)
- Utilização de `LOAD CSV` para ingestão de dados em pipelines reais
- Exportação e análise de esquema com `CALL db.schema.visualization()`

## Observações finais

Este projeto foi desenvolvido com fins educacionais e demonstra como bancos de dados em grafos são especialmente eficientes para cenários envolvendo relacionamentos complexos e recomendações sociais.
