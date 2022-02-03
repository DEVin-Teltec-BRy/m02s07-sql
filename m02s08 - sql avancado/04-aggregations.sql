create table contas_a_pagar (
	id serial primary key,
	data_vcto date not null default current_date,
	valor numeric not null check(valor > 0),
	descricao varchar(50) not null
);

INSERT INTO contas_a_pagar
(data_vcto, valor, descricao)
values
(CURRENT_DATE, 18.90, 'Tx de lixo'),
('18-02-2022', 30.55, 'IPTU'),
('15-02-2022', 90.00, 'Seguro vida'),
(CURRENT_DATE, 351.88, 'Conta de luz'),
('05-02-2022', 36.01, 'Agua'),
('05-02-2022', 930.00, 'Aluguel'),
('10-02-2022', 480.55, 'Seguro do carro'),
(CURRENT_DATE, 78.90, 'Plano telefone'),
(CURRENT_DATE, 1150.00, 'A comida que não pode faltar'),
('03-02-2022', 150.00, 'Playstation Pass');

insert into contas_a_pagar 
(data_vcto, valor, descricao)
values 
('02-02-2022', 240.00, 'Internet');

select count(*) from contas_a_pagar;
select max(valor) from contas_a_pagar;
select max(data_vcto) from contas_a_pagar;
select min(valor) from contas_a_pagar;
select min(data_vcto) from contas_a_pagar;
select sum(valor) from contas_a_pagar;
select avg(valor) from contas_a_pagar;

select count(*) from contas_a_pagar cap
where data_vcto = current_date

select sum(*) from contas_a_pagar cap
where data_vcto = current_date

select sum(*) from contas_a_pagar cap
where data_vcto between current_date and current_date + 3

select * from contas_a_pagar cap
where valor = (select max(cap2.valor) from contas_a_pagar cap2);
