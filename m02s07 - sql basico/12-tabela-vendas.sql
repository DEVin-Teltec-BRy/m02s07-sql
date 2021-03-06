-- drop table vendas;

-- create table vendas (
--   numero_pedido INT NOT NULL UNIQUE,
--   cliente VARCHAR(80) NOT NULL,
--   data_pedido TIMESTAMP NOT NULL,
--   valor_total NUMERIC NOT NULL CHECK(valor_total > 0),
--   qtd_itens INT NOT NULL CHECK(qtd_itens > 0),
--   pago BOOLEAN DEFAULT false,
--   data_pagamento TIMESTAMP,
--   entregue BOOLEAN DEFAULT false,
--   data_entrega TIMESTAMP,
--   cupom_desconto VARCHAR(10)
-- );

-- create table vendas_resumo (
--   pedido SERIAL PRIMARY KEY,
--   cliente VARCHAR(80) NOT NULL,
--   data_pedido TIMESTAMP NOT NULL,
--   valor_total NUMERIC NOT NULL CHECK(valor_total > 0),
--   data_pagamento TIMESTAMP,
--   data_entrega TIMESTAMP
-- );

create table vendas_atualizadas (
  pedido SERIAL PRIMARY KEY,
  numero_pedido INT,
  cliente VARCHAR(80) NOT NULL,
  data_pedido TIMESTAMP NOT NULL,
  valor_total NUMERIC NOT NULL CHECK(valor_total > 0),
  qtd_itens INT NOT NULL CHECK(qtd_itens > 0),
  pago BOOLEAN DEFAULT false,
  data_pagamento TIMESTAMP,
  entregue BOOLEAN DEFAULT false,
  data_entrega TIMESTAMP,
  cupom_desconto VARCHAR(10)
);

insert into vendas_resumo
(cliente, data_pedido, data_pagamento, data_entrega, valor_total)
select distinct v.cliente, v.data_pedido, v.data_pagamento, v.data_entrega, v.valor_total from vendas as v;

insert into vendas_atualizadas
(numero_pedido, cliente, data_pedido,valor_total,qtd_itens,pago,data_pagamento,entregue,data_entrega,cupom_desconto)
(select distinct * from vendas);


alter table vendas_atualizadas
drop column numero_pedido;

select * from vendas_atualizadas
where pago = '0';


select * from vendas order by numero_pedido asc;

insert into vendas
(numero_pedido, cliente, data_pedido, valor_total, qtd_itens)
values
(88, 'Michael', '2022-01-26 12:00:00', 15.00, 1),
(89, 'Fulano', '2022-01-24 17:15:00', 155.99, 8 ),
(90, 'Beltrano', '2022-01-04 19:00:00', 14.30, 2 );

-- DANIEL
INSERT INTO vendas 
(numero_pedido, cliente, data_pedido, valor_total, qtd_itens)
VALUES (250, 'João da silva', '2021-12-24 17:30:00', 254.30, 10),
(251, 'Maria da silva', '2021-12-23 15:30:00', 135.25, 25),
(252, 'Mario da silva', '2021-12-22 16:30:00', 149.60, 5);

-- Bruno
INSERT INTO vendas (
    numero_pedido, cliente, data_pedido, valor_total, qtd_itens, data_pagamento)
VALUES
(120, 'Juca', '2022-01-26 11:00:00', 50.00, 2, '2022-01-26 11:05:00'),
(121, 'Bruno', '2022-01-25 17:30:00', 20.00, 1, '2022-01-25 17:35:00'),
(122, 'Joana', '2022-01-22 15:15:00', 60.00, 3, '2022-01-22 15:20:00');

-- MATHEUS
INSERT INTO vendas 
(numero_pedido, cliente, data_pedido, valor_total, qtd_itens)
VALUES
( 517, 'Matheus', '2022-02-17 13:37:48', 12.99, 3),
( 776, 'Matheus', '2022-04-26 03:00:12', 1.00, 100),
( 1154, 'Matheus', '2023-05-22 21:17:55', 9983.03, 1);

-- VITOR
insert into vendas
(numero_pedido, cliente, data_pedido, valor_total, qtd_itens)
values
(555, 'Jubileu', '2022-01-26 12:00:00', 1.00, 1),
(666, 'Schwarzenegger', '1984-01-24 03:15:00', 0.01, 8 ),
(777, 'Chandler', '2022-01-04 19:00:00', 19.50, 2 );

-- Icaro
insert into vendas
(numero_pedido, cliente, data_pedido, valor_total, qtd_itens)
values
(87, 'Frederico','2022-01-15 15:30:00', 97, 1),
(86,'mariazinha','2022-01-17 17:55:33', 50, 1),
(55,'joaquim','2022-01-05 18:35:33', 597, 5);

-- Priscilla
INSERT INTO vendas (numero_pedido, cliente, data_pedido, valor_total, qtd_itens)
VALUES 
(191, 'Piscilla', '2022-01-28 16:00:00', 120.00, 1),
(188, 'Joyce', '2022-01-26 12:00:00', 15.00, 1),
(189, 'Daiane', '2022-01-24 17:15:00', 155.99, 8 ),
(190, 'Jonas', '2022-01-04 19:00:00', 14.30, 2 );

-- Sabrina
insert into vendas VALUES
(1, 'Joao Souza', '26-01-2022 11:00:00', 100, 2, true, '26-01-2022 14:00:00', false, '27-01-2022', NULL),
(2, 'Pedro Silva', '28-01-2022 08:00:00', 250, 5, false, '28-01-2022 16:00:00', false, '30-01-2022', 'DESC10%'),
(3, 'Ana Hering', '25-01-2022 10:00:00', 400, 7, true, '26-01-2022 10:00:00', false, '29-01-2022', NULL);


-- Guilherme
INSERT INTO vendas 
(numero_pedido, cliente, data_pedido, valor_total, qtd_itens)
VALUES
( 159, 'Mario Bros', '2022-05-20 19:40:48', 950.00, 3),
( 146, 'Sonic Hedgehog', '2022-04-01 07:00:00', 263.50, 4),
( 197, 'Solid Snake', '2023-01-22 20:30:00', 741.05, 6);




-- SELECT * FROM vendas;

-- create table vendas (
--   numero_pedido SERIAL NOT NULL UNIQUE,
--   cliente VARCHAR(80) NOT NULL,
--   data_pedido TIMESTAMP NOT NULL,
--   valor_total NUMERIC NOT NULL CHECK(valor_total > 0),
--   qtd_itens INT NOT NULL CHECK(qtd_itens > 0),
--   pago BOOLEAN DEFAULT false,
--   data_pagamento TIMESTAMP,
--   entregue BOOLEAN DEFAULT false,
--   data_entrega TIMESTAMP,
--   cupom_desconto VARCHAR(10)
-- );

-- alter table vendas
-- ADD CONSTRAINT vendaspk PRIMARY KEY (numero_pedido);

-- insert into vendas 
-- (cliente, data_pedido, valor_total, qtd_itens)
-- values
-- ('Michael', '2022-01-26 12:00:00', 15.00, 1),
-- ('Fulano', '2022-01-24 17:15:00', 155.99, 8 ),
-- ('Beltrano', '2022-01-04 19:00:00', 14.30, 2 ),
--  -- DANIEL
-- ('João da silva', '2021-12-24 17:30:00', 254.30, 10),
-- ('Maria da silva', '2021-12-23 15:30:00', 135.25, 25),
-- ('Mario da silva', '2021-12-22 16:30:00', 149.60, 5),
--  -- Bruno
-- ('Juca', '2022-01-26 11:00:00', 50.00, 2),
-- ('Bruno', '2022-01-25 17:30:00', 20.00, 1),
-- ('Joana', '2022-01-22 15:15:00', 60.00, 3),
--  -- MATHEUS
-- ('Matheus', '2022-02-17 13:37:48', 12.99, 3),
-- ('Matheus', '2022-04-26 03:00:12', 1.00, 100),
-- ( 'Matheus', '2023-05-22 21:17:55', 9983.03, 1),
--  -- VITOR
-- ('Jubileu', '2022-01-26 12:00:00', 1.00, 1),
-- ('Schwarzenegger', '1984-01-24 03:15:00', 0.01, 8 ),
-- ('Chandler', '2022-01-04 19:00:00', 19.50, 2 ),
--  -- Icaro
-- ( 'Frederico','2022-01-15 15:30:00', 97, 1),
-- ('mariazinha','2022-01-17 17:55:33', 50, 1),
-- ('joaquim','2022-01-05 18:35:33', 597, 5),
--  -- Priscilla
-- ('Piscilla', '2022-01-28 16:00:00', 120.00, 1),
-- ('Joyce', '2022-01-26 12:00:00', 15.00, 1),
-- ('Daiane', '2022-01-24 17:15:00', 155.99, 8 ),
-- ('Jonas', '2022-01-04 19:00:00', 14.30, 2 ),
--  -- Sabrina
-- ('Joao Souza', '26-01-2022 11:00:00', 100, 2),
-- ('Pedro Silva', '28-01-2022 08:00:00', 250, 5),
-- ('Ana Hering', '25-01-2022 10:00:00', 400, 7),
--  -- Guilherme
-- ('Mario Bros', '2022-05-20 19:40:48', 950.00, 3),
-- ('Sonic Hedgehog', '2022-04-01 07:00:00', 263.50, 4),
-- ('Solid Snake', '2023-01-22 20:30:00', 741.05, 6);

-- select numero_pedido pedido, cliente, valor_total total from vendas;

-- select DISTINCT numero_pedido, entregue, data_entrega from vendas;

-- select * 
-- from vendas WHERE valor_total > 200;

-- select cliente, numero_pedido, qtd_itens 
-- from vendas 
-- WHERE qtd_itens < 5;

-- select cliente, numero_pedido, data_pedido 
-- from vendas 
-- WHERE data_pedido >= '2022-01-15';

-- select cliente, numero_pedido, data_pedido 
-- from vendas 
-- WHERE data_pedido < '2022-01-15';

-- select cliente, numero_pedido, data_pedido from vendas where cliente = 'Matheus';

-- select numero_pedido,
--        cliente,
--        valor_total 
-- from vendas 
-- where pago is true;

-- select * from vendas;

-- SELECT * FROM vendas
--  -- WHERE data_pedido >= '2021-12-01' AND data_pedido <= '2021-12-31'
--  -- WHERE data_pedido < '2021-12-01' OR data_pedido > '2021-12-31'
-- WHERE data_pedido BETWEEN '2021-12-01' AND '2021-12-31'
-- ORDER BY data_pedido ASC, valor_total DESC;


-- SELECT * FROM vendas
-- WHERE data_pedido < '2022-01-01'
-- ORDER BY data_pedido ASC, valor_total DESC;

-- SELECT * FROM vendas
-- WHERE qtd_itens BETWEEN 5 AND 10
-- ORDER BY qtd_itens ASC;


-- select * from vendas
-- where qtd_itens > 2
-- order by qtd_itens asc
-- limit 5 offset 13;

-- select * from vendas
-- where cliente = 'Arnold Schwarzenegger';

-- update vendas
-- set cliente = 'Arnold 2 Schwarzenegger'
-- where cliente = 'Arnold Schwarzenegger'

-- select * from vendas;

-- UPDATE vendas
-- SET data_pagamento = null;

-- UPDATE vendas
-- SET entregue = true, data_entrega = '2022-01-27'
-- WHERE numero_pedido BETWEEN 20 and 100;

-- UPDATE vendas
-- SET data_pagamento = data_entrega
-- WHERE data_entrega is not null
-- AND
-- pago is true;

-- DELETE FROM vendas
-- WHERE data_pagamento is null 
--       and pago is false 
--       and data_entrega is not null;

-- select cliente, pago, data_pagamento, entregue, data_entrega from vendas;
