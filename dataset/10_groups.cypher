//Criando grupos
CREATE
(g1:Group {
  group_id: 1,
  name: "Neo4j Brazil",
  description: "Discussions about graphs and Neo4j",
  created_at: date("2024-01-10")
}),

(g2:Group {
  group_id: 2,
  name: "Data & AI",
  description: "Data, AI and engineering",
  created_at: date("2023-08-05")
}),

(g3:Group {
  group_id: 3,
  name: "Life abroad",
  description: "Experiences outside of Brazil",
  created_at: date("2022-03-18")
});
