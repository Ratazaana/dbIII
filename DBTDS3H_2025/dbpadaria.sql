-- apagando banco de dados se existir
drop database dbpadaria;
-- criando banco de dados 
create database dbpadaria;
-- acessar o banco de dados
use dbpadaria;
--criando as tabelas no banco de dados

create table tbClientes(
codCli int NOT NULL AUTO_INCREMENT,
nome varchar(100),
cpf char(14) NOT NULL unique,
email varchar(100) unique,
primary key(codCli)
);



create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(10),
dataNasc datetime,
salario decimal(9,2) default 0 check(salario >= 0),
sexo char(1) default "F" check(sexo in("F","M")),
primary key(codFunc));


create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(12) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc)
);

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(10),
primary key(codForn));

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int,
preco decimal(9,2),
dataVal datetime,
lote char(10),
codForn int not null,
primary key(codProd),
foreign key(codForn)references tbFornecedores(codForn));

create table tbVendas(
codVend int not null auto_increment,
dataVend date, 
horaVend time,
quantidade decimal (9,2) default 0 check(quantidade >=0),
valor decimal (9,2) default 0 check (valor >=0),
codProd int not null, 
codUsu INT NOT NULL,
codCli int NOT NULL,
primary key (codVend),
foreign key (codProd) references tbProdutos(codProd),
foreign key (codUsu) references tbUsuarios(codUsu),
foreign key (codCli) references tbClientes(codCli));

-- visualizando as tabelas
show tables;
-- visualizando a estrutura das tabelas
desc tbFornecedores;
desc tbClientes;
desc tbProdutos;
desc tbVendas;
desc tbFuncionarios;
desc tbUsuarios;

--inserindo registros nas tabelas

insert into tbClientes(nome,cpf,email)
	values('Manuel Ribeiro',
		' 235.344.567-45',
		'manuel123@gmail.com');

	insert into tbClientes(nome,cpf,email)
	values('Átila da Silva', ' 235.384.567-45', 'Átila007@gmail.com');

	insert into tbFornecedores(nome,email,telCel)
	values('Verduras do grau', ' legumeaquinao@gmail.com', '95641-1560');


	insert into tbFuncionarios(nome,email,telCel, dataNasc, salario, sexo)
	values('Laércio Pinto', 'laercio.pinto@gmail.com', '95441-1560', '2000-12-15', 1500.00, 'M');

--visualizando os registros nas tabelas


select * from tbClientes;
select * from tbFornecedores;
select * from tbFuncionarios;