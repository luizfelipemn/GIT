create database petshop;
use petshop;

create table cliente (
id_cliente int primary key auto_increment,
nome_cliente varchar(50),
telefone_fixo int,
celular int,
rua varchar(40),
bairro varchar(40),
estado char(2));
select* from cliente;

create table raça (
id_raça int primary key auto_increment,
nome_raça varchar(40),
valor_medio decimal(7,2),
check (valor_medio > 0),
tamanho char(1),
check (tamanho = 'p' or tamanho = 'm' or tamanho = 'g'))
auto_increment = 101;
select* from raça;


create table pet(
id_pet int primary key auto_increment,
nome_pet varchar(30) not null,
chip int unique,
dtNasc date,
fk_raça int,
foreign key (fk_raça) references raça (id_raça))
auto_increment = 201;

alter table pet add column fk_cliente int;
alter table pet add foreign key (fk_cliente) references cliente (id_cliente); 


select* from pet;

insert into cliente values
(null, 'jefferson', '49382717', 989898989, 'Rua joao gomes', 'flores', 'sp'),
(null, 'ana', '49582617', 989897989, 'Rua 38 de janeiro', 'casa grande', 'sp'),
(null, 'davi', '41332717', 989698289, 'Rua masques felipe', 'cajama', 'sp'),
(null, 'manuel', '49384719', 989823989, 'Rua gamuru', 'tabuas', 'sp');
select* from cliente;

insert into raça values 
(null, 'Pastor alemão', 5000, 'G'),
(null, 'Dachshund', 1200, 'M'),
(null, 'pinscher', 260.8, 'P'),
(null, 'beagle', 2000, 'M');
select* from raça;
select* from pet;
select* from cliente;
insert into pet values 
(null, 'simba', 1001, '2019-02-18', 101, 3),
(null, 'maike', 7032,'2010-12-16', 103,  2),
(null, 'muca', 9813, '2022-01-29', 102,1),
(null, 'teobaldo', 3366, '2013-06-03',null,null);


select* from pet as p join cliente as c on p.fk_cliente = c.id_cliente;

select* from pet as p left join cliente as c on p.fk_cliente = c.id_cliente;
select* from pet as p left join cliente as c on fk_cliente = id_cliente;

select* from pet as p right join cliente as c on fk_cliente = id_cliente where fk_cliente is null;

select* from pet as p right join raça as r on fk_raça = id_raça;

select* from pet as p left join raça as r on fk_raça = id_raça;








