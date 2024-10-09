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
 
 select * from pizzas;
 
 /* Funções de agregação
 * Conhecidas como funções estatística, as funções de agregações obtêm:
 * informação sobre conjuntos de linhas específicas
 * AVG(coluna) Média dos valores da coluna
 * COUNT Número de linhas
 * MAX(coluna) Maior valor da coluna 
 * MIN(coluna) Menor valor da coluna
 * SUM(coluna) Soma dos valores da coluna
 */
 
 -- Exemplos Count
 
select count(*) from pizzas;

-- contar quantas pizzas estão cadastradas
select count(nome) from pizzas;
select count(valor) from pizzas;

-- Exemplos AVG, MAX, MIN e SUM

-- Média de preço das pizzas
select avg(valor) as media from pizzas;
select avg(valor) as media from pizzas where nome like "%esa";
 
 -- Qual é o valor da pizza mais cara do cardápio da pizzaria?
 select max(valor) as "maior valor" from pizzas;
 
 -- Qual é o valor da pizza mais barata do cardápio da pizzaria?
 select min(valor) as "menor valor" from pizzas;
 
 -- Qual é o valor total do pedido número 7?
 select sum(valor) as "valor total" from itens_pedido where pedido_id = 7;
 
 select * from itens_pedido;
 
 -- group by para agrupar pois só soma o valor de tal pedido 
 select pedido_id as pedido, sum(valor) as "valor pedido" from itens_pedido group by pedido_id;
 
 
 select pedido_id as pedido, sum(valor) as "valor pedido", 
 sum(quantidade) as "quant pizzas",
 avg(valor) as media,
sum(valor) / sum(quantidade) as "valor médio"
from itens_pedido
group by pedido_id; 
 
 select * from itens_pedido;
 
 -- INNER JOIN: Retorna registros quando há pelo menos uam correspondência em amabas as tabelas
 select * from clientes as c
 inner join pedidos as p on p.cliente_id = c.id;
 
 
 -- LEFT JOIN: Retorna todos os registros da tabela da esquerda
 -- (primeira tabela mencionada) e os registros correspondentesda tabela dadireita
 -- (segunda tabela mencionada) 
select clientes.id as id_cliente, nome, telefone,pedidos.id as pedido, valor
from clientes
left join pedidos on pedidos.cliente_id = clientes.id;

select clientes.id as id_cliente, nome, telefone,pedidos.id as pedido, valor
from clientes
right join pedidos on pedidos.cliente_id = clientes.id;

insert into pedidos(id,data, valor) values (9, '2024-10-02', 0); 

-- EXERCICIOS:

-- Quantidade de pedido(s) realizado(s) por cliente,exibir nome do cliente e quantidade de pedidos
select nome, telefone, count(pedidos.id) from clientes
left join pedidos on clientes.id = pedidos.cliente_id
group by nome, telefone;

select * from pedidos;

-- Quantos pedidos foram feitos no total?
select count(id) as "total pedidos" from pedidos;

-- Quantos pedidos foram feitos pelo cliente com o nome "Alexandre Santos"?
select count(id) as "total pedidos" from pedidos where cliente_id = 1;

-- Qual o valor total de todos os pedidos feitos até agora?
select sum(valor) as "total" from pedidos;



-- Exercicios 09/10/2024

-- Questão 1
select clientes.nome, pedidos.id as pedido from pedidos
inner join clientes on pedidos.cliente_id = clientes.id;


 -- Questão 2
 select count(id) as total_pedidos from pedidos;
 
 -- Questão 3
 select pedidos.id as pedido, pedidos.data, clientes.nome from pedidos
 inner join clientes on pedidos.cliente_id = clientes.id
 where data > "2016-12-15";
 
 -- Questão 4
select nome,count(pedidos.id) as "total pedidos" from pedidos 
left join clientes on clientes.id = pedidos.cliente_id
where nome = "Alexandre Santos";

-- Questão 5
select nome, pedidos.id from clientes 
inner join pedidos on clientes.id = pedidos.cliente_id
group by nome, pedidos.id;

-- Questão 6
select sum(valor) as valor_total from pedidos;

-- Questão 7
select nome, sum(valor) as "valor total" from pedidos
inner join clientes on clientes.id = pedidos.cliente_id
 group by nome;

-- Questão 8
select clientes.nome, pedidos.id as pedido, pedidos.data, pedidos.valor from  clientes
inner join pedidos on pedidos.cliente_id = clientes.id
where pedidos.data between  '2016-12-01' and '2016-12-31 23:29:59';

 -- Questão 9
 select avg(valor) as valor_médio from pizzas;
 
 -- Questão 10
 select clientes.id, clientes.nome, sum(pedidos.valor) as valor_total,
 count(pedidos.id) as total_pedidos from pedidos
 left join clientes on clientes.id = pedidos.cliente_id
 group by clientes.id, clientes.nome;
 
 -- Questão 11
 select max(valor) as "pedido mais caro" from pedidos;
 
 -- Questão 12
 select min(valor) as "pedido mais barato" from pedidos;
 
 -- Questão 13
 select nome, count(pedidos.id) as pedidos from clientes
 inner join pedidos on pedidos.cliente_id = clientes.id
group by nome;
 
 -- Questão 14
select nome, max(valor) as "pedido mais caro" from clientes
inner join pedidos on pedidos.cliente_id = clientes.id
order by valor desc limit 1;

 -- Questão 15
 select count(distinct pedido_id) as total_pedidos, avg(quantidade) as media_pizzas from itens_pedido;
 
 -- Questão 16
 select nome, sum(quantidade) as total_pizzas, count(pedidos.id) as total_pedido from itens_pedido 
 inner join pedidos on itens_pedido.pedido_id = pedidos.id
 inner join clientes on pedidos.cliente_id = clientes.id
 where clientes.nome = "Bruna Dantas";
 
 -- Questão 17
 select nome, max(valor) as "pedido mais caro", min(valor) from pedidos 
 inner join clientes on pedidos.cliente_id = clientes.id
 where clientes.nome = "Laura Madureira";
 
 -- Questão 18
 select nome, count(quantidade) as total_pizzas from itens_pedido
 inner join pedidos on itens_pedido.pedido_id = pedidos.id
 inner join clientes on pedidos.cliente_id = clientes.id
 group by nome;
 
 -- Questão 19
 select nome, min(valor) as "pedido mais barato" from clientes
inner join pedidos on pedidos.cliente_id = clientes.id
 order by valor desc limit 1;
 
 -- Questão 20
 select clientes.nome as cliente, pedidos.id as pedido from pedidos
 left join clientes on clientes.id = pedidos.cliente_id 
 group by nome;
 
 -- Questão 21
 select clientes.nome as cliente, valor as valor from pedidos
 left join clientes on clientes.id = pedidos.cliente_id
 group by nome;

 -- Questão 22
 select nome, sum(pedidos.valor) as "valor_total" from pedidos 
 inner join clientes on clientes.id = pedidos.cliente_id 
 group by nome order by valor_total desc limit 3;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


 
 
 
 
 
 
 












