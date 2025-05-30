-- varchar = uma string com um número limite de caracteres definidos pelo desenvolvedor
-- text = não tem um limite de caracteres
-- integer = um valor numérico
-- unique = vai verificar no banco de dados se o valor digitado na fileira já existe ou não. Se não existir, será o único (valores duplicados são proibidos)
-- not null = utilizar o not null em uma certa fileira quer dizer que aquela fileira precisa ser preenchida
-- date = data no formato YYYY/MM/DD
-- serial primary key = é um único campo ou um grupo de campos ou colunas que podem identificar exclusivamente uma linha em uma tabela
-- foreign key = chaves estrangeiras vinculam dados de uma tabela aos dados de outra tabela

-- Criação da tabela de autores

CREATE TABLE autor (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  nacionalidade VARCHAR(50),
  data_nascimento DATE
);

CREATE TABLE livro (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  ano_publicacao INTEGER NOT NULL,
  paginas INTEGER NOT NULL,
  isbn VARCHAR(20) UNIQUE,
  autor_id INTEGER NOT NULL,
  FOREIGN KEY (autor_id) REFERENCES autor(id)
);

CREATE TABLE categoria (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  descricao TEXT
);

CREATE TABLE livro_categorias (
  livro_id INTEGER NOT NULL,
  categoria_id INTEGER NOT NULL,
  PRIMARY KEY (livro_id, categoria_id),
  FOREIGN KEY (livro_id) REFERENCES livro(id),
  FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);
