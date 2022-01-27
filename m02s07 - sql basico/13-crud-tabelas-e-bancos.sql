-- COMANDOS PARA BANCO DE DADOS ----------------
-- Create
CREATE DATABASE minhabase;
-- Delete
DROP DATABASE minhabase;

-- COMANDOS PARA TABELAS -----------------------
-- Create
CREATE TABLE umatabela (id INT, nome VARCHAR(20), asdrubal BOOLEAN);
-- Read
SELECT * FROM umatabela;
-- Update
alter table umatabela
add column sobrenome VARCHAR(20) NOT NULL;

alter table umatabela
drop column asdrubal;

alter table umatabela
add constraint nome_unico unique (nome);

alter table umatabela
drop constraint nome_unico;

alter table umatabela
alter column nome
set not null;

alter table umatabela
alter column nome
drop not null;

alter table umatabela
alter column nome
set default 'fulaninho';

-- Delete
DROP TABLE umatabela;

-------------------------- :D -------------------------