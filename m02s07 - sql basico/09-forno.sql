CREATE TYPE status_forno
AS ENUM (
  'assando',
  'descansando',
  'aquecer',
  'desligado'
  );

DROP table fornos;

-- CREATE TABLE fornos (
--   hora_inicio TIME, -- not null
--   qtd_paes INT, -- > 20 not null
--   status_forno status_forno, -- not null
--   temperatura FLOAT, -- > 0 not null
--   tipo_pao VARCHAR(100), -- unique not null
--   operador VARCHAR(80) -- not null
-- );

CREATE TABLE fornos (
  hora_inicio TIME NOT NULL, -- not null
  qtd_paes INT NOT NULL CHECK (qtd_paes > 20), -- > 20 not null
  status_forno status_forno NOT NULL, -- not null
  temperatura FLOAT NOT NULL CHECK (temperatura >= 0), -- > 0 not null
  tipo_pao VARCHAR(100) NOT NULL UNIQUE, -- unique not null
  operador VARCHAR(80) NOT NULL -- not null
);


alter table fornos
ALTER COLUMN hora_inicio SET NOT NULL;

alter table fornos
ALTER COLUMN qtd_paes SET NOT NULL;

alter table fornos
ALTER COLUMN status_forno SET NOT NULL;

alter table fornos
ALTER COLUMN temperatura SET NOT NULL;

alter table fornos
ALTER COLUMN tipo_pao SET NOT NULL;

alter table fornos
ALTER COLUMN operador SET NOT NULL;

alter table fornos
ADD UNIQUE (tipo_pao);
-- ADD CONSTRAINT nome_constraint UNIQUE (tipo_pao);


alter table fornos
ADD CHECK (qtd_paes > 20);

alter table fornos
ADD CHECK (temperatura > 0);



select * from fornos;


INSERT INTO fornos
VALUES (
  null,
  500,
  'aquecer',
  200,
  'Massa fina',
  'Victor'
);




INSERT INTO fornos
VALUES (
  '04:00',
  100,
  'aquecer',
  180.6,
  'Massa fina',
  'Victor'
), (
  '15:00',
  500,
  'assando',
  200.1,
  'Pão de queijo',
  'Github Copilot'
);

-- select * from fornos;

-- insert into fornos 
-- (tipo_pao, operador, status_forno)
-- VALUES (
--           'Pão do subway',
--           'Ícaro',
--           'desligado'
--         );

-- Prato ( titulo: string, descricao: string, preco: número decimal preciso, categoria: string, url_foto: string)
