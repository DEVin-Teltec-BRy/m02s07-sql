-- como criar um enum??? 

CREATE TYPE status_enum as ENUM ('cheio', 'vazio', 'na_meiuca');

CREATE TABLE copo (
  capacidade FLOAT,
  marca VARCHAR(80),
  situacao status_enum
);

insert into copo 
values (
  1.5,
  'cheio'
),(
  0.25,
  'na_meiuca'
),(
  0.5,
  'vazio'
);

select * from copo;


insert into copo 
values (0.2,'sei la');