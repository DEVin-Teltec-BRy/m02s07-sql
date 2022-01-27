create type turno_enum as enum ('manhã', 'tarde', 'noite')

create table supervisores (
  id INT UNIQUE NOT NULL,
  nome VARCHAR(80) NOT NULL,
  cargo VARCHAR(80) DEFAULT 'Supervisor',
  turno turno_enum
);

insert into supervisores
(nome, turno, id)
VALUES
('Michael', 'manhã', 1),
('Sabrina', 'tarde', 2),
('Priscilla', 'manhã', 3),
('Lucas', 'noite', 4),
('Vitor Pedra', 'manhã', 5);

insert into supervisores
(nome, turno, cargo, id)
VALUES
('Daniel', 'manhã', 'Gerente', 6);


insert into supervisores
(nome, turno, cargo, id)
VALUES
('Fulano', 'manhã', null, 7);

select * from supervisores;