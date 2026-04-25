create table Funcionario  (
ID_Funcionario int  primary key auto_increment,
Nome varchar(100) not null,
Cargo varchar(50) not null,
Salario decimal(8,2) not null,
Data_admissao date not null
);

create table Cliente (
ID_Cliente int primary key auto_increment,
nome varchar(100) not null,
telefone varchar(20) not null,
email varchar(100) not null, 
endereco varchar(50) not null,
Data_cadastro date not null
);

create table Pedido (
Id_Pedido int primary key auto_increment,
Data_Pedido datetime default current_timestamp,
Status varchar(20)  not null,
Tipo_Entrega varchar(20) not null,
Total decimal(8,2),




);