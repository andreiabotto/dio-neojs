// --- CONSTRAINT ---
// Garante unicidade no nível do banco de dados (Neo4j 4.x/5.x)
CREATE CONSTRAINT user_id_unique IF NOT EXISTS FOR (u:Usuario) REQUIRE u.id IS UNIQUE;
CREATE CONSTRAINT content_id_unique IF NOT EXISTS FOR (c:Conteudo) REQUIRE c.id IS UNIQUE;

// --- POPULAR DADOS ---

// Criando 10 Usuários
UNWIND [
  {id: "u1", nome: "Alice"}, {id: "u2", nome: "Bruno"}, {id: "u3", nome: "Carla"}, 
  {id: "u4", nome: "Diego"}, {id: "u5", nome: "Elena"}, {id: "u6", nome: "Fabio"}, 
  {id: "u7", nome: "Gabi"}, {id: "u8", nome: "Hugo"}, {id: "u9", nome: "Igor"}, {id: "u10", nome: "Julia"}
] AS user
CREATE (:Usuario {id: user.id, nome: user.nome});

// Criando 10 Filmes/Séries
UNWIND [
  {id: "m1", titulo: "Matrix", tipo: "Filme"}, {id: "m2", titulo: "Dark", tipo: "Série"},
  {id: "m3", titulo: "Inception", tipo: "Filme"}, {id: "m4", titulo: "The Bear", tipo: "Série"},
  {id: "m5", titulo: "Interstellar", tipo: "Filme"}, {id: "m6", titulo: "Severance", tipo: "Série"},
  {id: "m7", titulo: "Gladiador", tipo: "Filme"}, {id: "m8", titulo: "Succession", tipo: "Série"},
  {id: "m9", titulo: "Batman", tipo: "Filme"}, {id: "m10", titulo: "The Crown", tipo: "Série"}
] AS movie
CREATE (:Conteudo {id: movie.id, titulo: movie.titulo, tipo: movie.tipo});

// --- CRIANDO RELACIONAMENTOS ---

// Conectando Usuários a Conteúdos (ASSISTIU)
MATCH (u:Usuario {id: "u1"}), (c:Conteudo {id: "m1"}) CREATE (u)-[:ASSISTIU {nota: 5}]->(c);
MATCH (u:Usuario {id: "u2"}), (c:Conteudo {id: "m2"}) CREATE (u)-[:ASSISTIU {nota: 4}]->(c);
MATCH (u:Usuario {id: "u3"}), (c:Conteudo {id: "m3"}) CREATE (u)-[:ASSISTIU {nota: 5}]->(c);
MATCH (u:Usuario {id: "u4"}), (c:Conteudo {id: "m4"}) CREATE (u)-[:ASSISTIU {nota: 3}]->(c);
MATCH (u:Usuario {id: "u5"}), (c:Conteudo {id: "m5"}) CREATE (u)-[:ASSISTIU {nota: 5}]->(c);
MATCH (u:Usuario {id: "u6"}), (c:Conteudo {id: "m6"}) CREATE (u)-[:ASSISTIU {nota: 4}]->(c);
MATCH (u:Usuario {id: "u7"}), (c:Conteudo {id: "m7"}) CREATE (u)-[:ASSISTIU {nota: 5}]->(c);
MATCH (u:Usuario {id: "u8"}), (c:Conteudo {id: "m8"}) CREATE (u)-[:ASSISTIU {nota: 2}]->(c);
MATCH (u:Usuario {id: "u9"}), (c:Conteudo {id: "m9"}) CREATE (u)-[:ASSISTIU {nota: 4}]->(c);
MATCH (u:Usuario {id: "u10"}), (c:Conteudo {id: "m10"}) CREATE (u)-[:ASSISTIU {nota: 5}]->(c);

// Conectando Usuários entre si (SEGUE)
MATCH (a:Usuario {id: "u1"}), (b:Usuario {id: "u2"}) CREATE (a)-[:SEGUE]->(b);
MATCH (c:Usuario {id: "u3"}), (a:Usuario {id: "u1"}) CREATE (c)-[:SEGUE]->(a);
