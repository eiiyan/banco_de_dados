drop database if exists pizzaria;

create database if not exists pizzaria;

use pizzaria;

CREATE TABLE Clientes (
	id INt not null AUTO_INCREMENT primary key,
	telefone VARCHAR(14),
	nome VARCHAR(30),
	logradouro VARCHAR(30),
	numero DECIMAL(5,0),
	complemento VARCHAR(30),
	bairro VARCHAR(30),
	referencia VARCHAR(30)
 );

 CREATE TABLE pizzas (
    id INTEGER not null AUTO_INCREMENT primary key,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(15 , 2 )
 );
 
 CREATE TABLE pedidos (
    id INTEGER AUTO_INCREMENT primary key,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(15 , 2 )
 );
 
 alter table pedidos add FOREIGN KEY (cliente_id) REFERENCES Clientes (id);
 
 
 CREATE TABLE itens_pedido (
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade int,
    valor DECIMAL(15 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES Pizzas (id),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedidos (id)
 );
 


INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c 

INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15),
('Provolone', 17),
('4 Queijos', 20),
('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');


alter table pizzas modify valor decimal(15,2) default 99;

INSERT INTO pizzas (nome) VALUES ('Moda da Casa');

INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);


INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);

select 10 + 3, 10 -3, 10 / 3, 10 * 3;
select 10 + 3 as Soma, 10 - 3 as Subtração, 10 / 3 as 'Divisão', 10 * 3 as 'Multiplicação';

select id, nome, valor, valor as '+10%' from pizzas;
select *, ((valor * 10)/100) + valor as '+10%' from pizzas;


-- Aula de 25/09/2024 

/*
select (distinct) <coluna>
from <tabelas>
[where condição]
[group by <coluna>]
[having <condição>]
[order by <coluna> asc (crescente) desc (decrescente)
limit
*/


-- adicionar coluna 
alter table pizzas add column custo decimal(15,2); 

-- atualizar e colocar o valor de forma automática 
update pizzas set custo = valor * 0.60;

-- maior que valor 17
select * from pizzas where valor > 17;

-- maior ou igual valor que 17
select * from pizzas where valor >= 17;

-- menor que valor 17 
select * from pizzas where valor < 17;

-- menor ou igual que valor 17 
select * from pizzas where valor <= 17;

-- igual que valor 17 
select * from pizzas where valor = 17;

-- valor difente de 17 
select * from pizzas where valor != 17;
select * from pizzas where valor <> 17;

-- pizzas com valor nulo 
select * from pizzas where valor is null;
select * from pizzas where valor <=> null;


-- Para criar uma expressão lógica,utiliza-se os operadores lógicos
-- E (AND(os dois valores) ou &&), OU (OR(um dos dois) ou ||) e NÃO (NOT ou !)

-- pizzas na faixa de 15 a 20 
select * from pizzas where valor > 15 and valor < 20;
select * from pizzas where valor between 16 and 19;
 
 -- pizzas com valores menores ou maiores do que 17
 select * from pizzas where valor < 17 or valor > 17;
 
  -- nem maior e nem menor do que 17
 select * from pizzas where not (valor < 17 or valor > 17);
 
 
 -- fora da faixa entre 17 a 20 
 select * from pizzas where valor not between 17 and 20;
 select * from pizzas where valor < 17 or valor > 20;
 
 -- valores iguais a 15 e 20 
 select * from pizzas where valor = 15 or valor = 20;
 select * from pizzas where valor in (15,20,99);
 
 -- valores diferentes de 15 e 20
 select * from pizzas where valor != 15 and valor != 20;
 select * from pizzas where valor  not in (15,20);
 
 -- pizzas valores não nulo 
 select * from pizzas where valor is not null;
 select * from pizzas where valor > 0;
 
 -- pizzas qe começam com a letra E
 select * from pizzas where nome like 'E%';
 
 -- pizzas qe terminam com a letra A
 select * from pizzas where nome like '%A';
 select * from pizzas where nome like '%esa%';
 
 -- colunas da tabelas pizza em ordem alfabética
 select * from pizzas order by nome asc;
 select * from pizzas order by nome desc;
 
-- decrescente no valor e crescente no nome
select * from pizzas order by valor desc, nome asc;

-- restringir o numero de linhas
select * from pizzas order by valor desc limit 2;

 -- valores distintos
 select distinct valor from pizzas order by valor;
 
 
 
 
 
 
 
 
 
 
 
 












