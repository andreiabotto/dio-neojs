type Usuario {
  id: ID! @unique
  nome: String!
  assistiu: [Conteudo!]! @relationship(type: "ASSISTIU", direction: OUT, properties: "AssistiuProps")
  segue: [Usuario!]! @relationship(type: "SEGUE", direction: OUT)
}

type Conteudo {
  id: ID! @unique
  titulo: String!
  tipo: String! # Filme ou Série
  usuariosQueAssistiram: [Usuario!]! @relationship(type: "ASSISTIU", direction: IN, properties: "AssistiuProps")
}

# Interface para armazenar propriedades do relacionamento (ex: nota)
interface AssistiuProps @relationshipProperties {
  nota: Int
}
