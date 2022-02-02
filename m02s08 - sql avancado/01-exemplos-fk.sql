create schema aula06;

create table aula06.municipios (
	id serial primary key,
	nome varchar(80) not null,
	sigla_uf char(2) not null,
	estado varchar(80) not null
);

INSERT INTO aula06.municipios
(nome, sigla_uf, estado)
VALUES('Joinville', 'SC', 'Santa Catarina');

create table aula06.enderecos (
	id SERIAL PRIMARY KEY,
	rua VARCHAR(255) NOT NULL,
	numero INT,
	complemento VARCHAR(40) NOT NULL,
	bairro VARCHAR(80) NOT NULL,
	municipio_id INT not NULL REFERENCES municipios (id)
);

select * from aula06.municipios m 

INSERT INTO aula06.enderecos
(rua, numero, complemento, bairro, municipio_id)
VALUES('Rua 1234', 5, 'n/a', 'Jd Seila', 1);

select * from aula06.enderecos e;

create table aula06.pessoas (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(80) NOT NULL,
	sobrenome VARCHAR(80) NOT NULL,
	endereco_id INT REFERENCES enderecos (id)
--	cargo_id INT REFERENCES cargos (id)
);

create table aula06.cargos (
	id serial primary key,
	nome varchar(80) not null
);

alter table aula06.pessoas 
add column cargo_id INT;

alter table aula06.pessoas
add foreign key (cargo_id) references cargos (id);

insert into aula06.cargos 
(nome)
values ('Mentor educacional');

select * from aula06.pessoas;
select * from aula06.enderecos e;
select * from aula06.cargos c;


INSERT INTO aula06.pessoas
(nome, sobrenome, endereco_id, cargo_id)
VALUES('Mika', 'Nascimento', 2, 1);

select 
	p.id as pessoa_id,
	p.nome,
	p.sobrenome,
	e.rua,
	e.numero,
	e.complemento,
	e.bairro,
	m.nome as cidade,
	m.estado,
	m.sigla_uf as uf
from aula06.pessoas p
inner join aula06.cargos c on p.cargo_id = c.id
inner join aula06.enderecos e on p.endereco_id = e.id
inner join aula06.municipios m on e.municipio_id = m.id;
