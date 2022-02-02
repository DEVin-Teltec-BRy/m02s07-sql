create schema lojinha;

--drop table lojinha.pedidos cascade;
create table lojinha.pedidos (
	id SERIAL PRIMARY KEY,
	data TIMESTAMP NOT NULL DEFAULT current_timestamp,
	cliente VARCHAR(255) NOT NULL,
	valor_total NUMERIC NOT NULL DEFAULT 0
);

--drop table lojinha.pedido_itens ;
create table lojinha.pedido_itens (
	id SERIAL PRIMARY KEY,
	pedido_id INT REFERENCES pedidos (id) on delete cascade,
	produto_id INT REFERENCES produtos (id) on delete restrict;
);

create table lojinha.produtos (
	id serial primary key 
	titulo VARCHAR(80) NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	valor NUMERIC
);


select * from lojinha.pedido_itens pi2;
select * from lojinha.pedidos p ;


INSERT INTO lojinha.pedidos
(cliente, valor_total)
VALUES('Michael Nascimento', 99.99);

INSERT INTO lojinha.pedido_itens
(produto_titulo, descricao, valor, pedido_id)
VALUES('Motorola Moto C', 'Um celular legalzinho', 99.99, 1);

select * from lojinha.pedidos p 
inner join lojinha.pedido_itens pi2 on pi2.pedido_id = p.id;

delete from lojinha.pedidos where id = 1;
