-- COMANDO DE CRIAÇÃO DE TABELA

-- Tarefa (titulo: string, data_criacao: data, feito: booleano, prioridade: inteiro)

CREATE TABLE tarefas (
  id INT,
  titulo TEXT,
  data_criacao DATE,
  feito BOOLEAN,
  prioridade INTEGER
);

CREATE TABLE posts (
  id INTEGER,
  nome_autor TEXT,
  resumo TEXT,
  conteudo TEXT,
  data_criacao DATE,
  likes INTEGER,
  link_imagem TEXT
);

DROP TABLE tarefas;