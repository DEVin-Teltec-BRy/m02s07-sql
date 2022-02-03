create table pessoas (
	id serial primary key,
	nome varchar(80),
	modelo_carro varchar(80)
);

INSERT INTO pessoas
(nome, modelo_carro)
values
('Michael', 'Palio'),
('Daniel', 'Mercedez Benz'),
('Sabrina', 'Sandero');

create table carros (
	id serial primary key,
	marca varchar(80),
	modelo varchar(80),
	ano INT
);

INSERT INTO carros
(marca, modelo, ano)
values
('Renault', 'Sandero', 2019),
('Mercedez', 'Mercedez Benz', 2015),
('Renault', 'Sandero', 2019),
('Fiat', 'Palio', 2013);

alter table carros
add unique (modelo);

alter table pessoas
add foreign key (modelo_carro) references carros (modelo);

select * from pessoas p
inner join carros c on c.modelo = p.modelo_carro;

-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
--  One to One
-- -------------------------------------------------------------------- --
;

create table pessoas (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(80) NOT NULL,
	sobrenome VARCHAR(80) NOT NULL,
	endereco_id INT REFERENCES enderecos (id) on delete set null
);

INSERT INTO pessoas
(nome, sobrenome, endereco_id)
VALUES('Mika', 'Nascimento', 1);

create table enderecos (
	id SERIAL PRIMARY KEY,
	rua VARCHAR(255) NOT NULL,
	numero INT,
	complemento VARCHAR(40) NOT NULL,
	bairro VARCHAR(80) NOT NULL,
	cidade VARCHAR(80) NOT null,
	uf CHAR(2) NOT NULL
);

INSERT INTO enderecos
(rua, numero, complemento, bairro, cidade, uf)
VALUES('Rua A', 11, 'N', 'Bairro', 'Florianopolis', 'SC');

select * from pessoas p 
inner join enderecos e on e.id = p.endereco_id;

select * from pessoas p;

-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- One to Many
-- --------------------------------------------------------------------
;

create table "pedidos" (
	"id" SERIAL PRIMARY KEY,
	"data" TIMESTAMP NOT NULL DEFAULT current_timestamp,
	cliente VARCHAR(255) NOT NULL,
	valor_total NUMERIC NOT NULL DEFAULT 0
);

INSERT INTO pedidos
(cliente, valor_total)
VALUES('Michael Nascimento', 150.00);


create table pedido_itens (
	id SERIAL PRIMARY KEY,
	pedido_id INT NOT NULL,
	produto_titulo VARCHAR(80) NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	valor NUMERIC,
	FOREIGN KEY (pedido_id) REFERENCES pedidos (id) on delete cascade
);

INSERT INTO pedido_itens
(pedido_id, produto_titulo, descricao, valor)
VALUES(1, 'Um produto', 'Um produto sem graça', 150);

INSERT INTO pedido_itens
(pedido_id, produto_titulo, descricao, valor)
VALUES(1, 'Um produto gratis', 'Um produto de graça', 0);


select * from pedidos p
inner join pedido_itens pi2 on pi2.pedido_id = p.id;

-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- Many to Many
-- --------------------------------------------------------------------
;

create table produtos (
	id SERIAL PRIMARY KEY,
	produto_titulo VARCHAR(80) NOT NULL,
	descricao VARCHAR(255) NOT NULL
);

INSERT INTO produtos
(produto_titulo, descricao)
values
('Iphone 25', 'Iphone da vigesima quinta geracao'),
('Iphone 24', 'Iphone da vigesima quarta geracao'),
('Mozo XYZ', 'Flagship da motorola no ano 2050'),
('Nokia Tijolo', 'O classico Nokia');

select * from produtos p;

--
create table depositos (
	id SERIAL PRIMARY KEY,
	endereco VARCHAR(255) NOT NULL,
	nome VARCHAR(80)
);

INSERT INTO depositos
(endereco, nome)
values
('R A numero 1', 'Deposito A'),
('R A numero 2', 'Deposito B'),
('R A numero 3', 'Deposito C'),
('R A numero 4', 'Deposito D'),
('R A numero 5', 'Deposito E'),
('R A numero 6', 'Deposito F'),
('R A numero 7', 'Deposito G');

select * from depositos d;

--
create table deposito_produto (
	id SERIAL PRIMARY KEY,
	produto_id INT,
	deposito_id INT REFERENCES depositos(id) ON DELETE CASCADE,
	-- PRIMARY key (produto_id, deposito_id) -- uma outra opção de PK
	FOREIGN KEY (produto_id) REFERENCES produtos (id) ON DELETE CASCADE
);

insert into deposito_produto
(produto_id, deposito_id)
values
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 2),
(4, 1),
(4, 4);
select * from deposito_produto dp;

inner join deposito_produto dp on dp.produto_id  = p.id
inner join depositos d on dp.deposito_id = d.id;
