-- create database breadinhouse;

-- create schema fabrica;
-- create schema pessoal;

-- CREATE TYPE status_forno
-- AS ENUM ('assando','descansando','aquecer','desligado');

-- create type status_cozinha_enum as enum ('ativo', 'manutenção')
-- create type turno_enum as enum ('manhã', 'tarde', 'noite')

CREATE TABLE fabrica.fornos (
  forno_id SERIAL PRIMARY KEY,
  hora_inicio TIME NOT NULL, -- not null
  qtd_paes INT NOT NULL CHECK (qtd_paes > 0), -- > 20 not null
  status_forno status_forno NOT NULL, -- not null
  temperatura FLOAT NOT NULL CHECK (temperatura >= 0), -- > 0 not null
  tipo_pao VARCHAR(100) NOT NULL UNIQUE, -- unique not null
  operador VARCHAR(80) NOT NULL -- not null
);

-- create table fabrica.cozinhas (
--   cozinha_id SERIAL PRIMARY KEY,
--   responsavel VARCHAR(80) NOT NULL,
--   nome_batismo VARCHAR(80),
--   horario_abertura TIME,
--   horario_fechamento TIME,
--   status_cozinha status_cozinha_enum,
--   data_ultima_manutencao TIMESTAMP
-- );

-- create table pessoal.supervisores (
--   supervisor_id SERIAL PRIMARY KEY,
--   nome VARCHAR(80) NOT NULL,
--   cargo VARCHAR(80) DEFAULT 'Supervisor',
--   turno turno_enum
-- );

INSERT INTO fabrica.fornos
(hora_inicio, qtd_paes, status_forno, temperatura, tipo_pao, operador)
VALUES 
('04:00', 100, 'aquecer', 180.6, 'Pão de queijo', 'Vitor'),
('07:30', 500, 'aquecer', 200, 'Massa fina', 'Victor');


--   cozinha_id SERIAL PRIMARY KEY,
--   responsavel VARCHAR(80) NOT NULL,
--   nome_batismo VARCHAR(80),
--   horario_abertura TIME,
--   horario_fechamento TIME,
--   status_cozinha status_cozinha_enum,
--   data_ultima_manutencao TIMESTAMP

-- insert into fabrica.cozinhas
-- (responsavel, nome_batismo, horario_abertura, horario_fechamento, status_cozinha)
-- values
-- ('João da Silva', 'Primavera', '04:00:00', '18:00:00', 'ativo');

-- insert into pessoal.supervisores
-- (nome, turno)
-- VALUES
-- ('Michael', 'manhã'),
-- ('Sabrina', 'tarde'),
-- ('Priscilla', 'manhã'),
-- ('Lucas', 'noite'),
-- ('Vitor Pedra', 'manhã');

alter table pessoal.supervisores
add column nome_cozinha VARCHAR(80);

select * from fabrica.cozinhas;
select * from pessoal.supervisores;

create view nome_batismo_primavera as (SELECT nome_batismo FROM fabrica.cozinhas LIMIT 1);

update pessoal.supervisores
set nome_cozinha = (SELECT * FROM nome_batismo_primavera);