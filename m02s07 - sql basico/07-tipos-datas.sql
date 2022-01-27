CREATE TABLE contas_a_pagar (
  vencimento DATE,
  valor NUMERIC(6,2)
);

DROP TABLE contas_a_pagar;

INSERT INTO contas_a_pagar
VALUES (
  '29/01/1991',
  900.99
);

INSERT INTO contas_a_pagar
VALUES (
  '2022-01-24',
  115.01
),(
  'January 28, 2022',
  69.99
);


SELECT * FROM contas_a_pagar;
