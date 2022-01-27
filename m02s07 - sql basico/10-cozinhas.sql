create type status_cozinha_enum as enum ('ativo', 'manutenção')



create table cozinhas (
  id INT NOT NULL UNIQUE,
  responsavel VARCHAR(80) NOT NULL,
  nome_batismo VARCHAR(80),
  horario_abertura TIME,
  horario_fechamento TIME,
  status_cozinha status_cozinha_enum,
  data_ultima_manutencao TIMESTAMP
);

SELECT * from cozinhas;

insert into cozinhas
values (1, 'João da Silva', 'Primavera',
        '04:00:00', '18:00:00', 'ativo', null);