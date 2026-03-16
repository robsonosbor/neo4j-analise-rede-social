//Criando posts (nomes fictícios)
MATCH (alex: User {user_id: 1})
CREATE (alex)-[:CREATED {at: date("2025-11-22")}]->(:Post {
        post_id: 101,
        content: "Looking back at 2025: so many memories.",
        created_at: date("2025-11-22")
});

MATCH (morgan: User {user_id: 2})
CREATE (morgan)-[:CREATED {at: date("2025-09-13")}]->(:Post {
        post_id: 102,
        content: "Celebrating a new milestone today!",
        created_at: date("2025-09-13")
});

MATCH (jordan: User {user_id: 3})
CREATE (jordan)-[:CREATED {at: date("2026-01-01")}]->(:Post {
        post_id: 103,
        content: "Happy new year! Ready for new challenges.",
        created_at: date("2026-01-01")
});

MATCH (taylor: User {user_id: 4})
CREATE (taylor)-[:CREATED {at: date("2026-02-04")}]->(:Post {
        post_id: 104,
        content: "First day at the new job — feeling excited.",
        created_at: date("2026-02-04")
});

MATCH (avery: User {user_id: 5})
CREATE (avery)-[:CREATED {at: date("2024-09-14")}]->(:Post {
        post_id: 105,
        content: "Planning my next big adventure abroad.",
        created_at: date("2024-09-14")
});
