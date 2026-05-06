-- DDL
-- Sistema Escolar

CREATE SCHEMA sistema_escolar;
use sistema_escolar;


SELECT @@global.time_zone, @@session.time_zone;
select now();

set global time_zone = 'America/Sao_Paulo';
set session time_zone = 'America/Sao_Paulo';

-- 1. Instituição
create table instituicao ( 
	idInstituicao int auto_increment primary key,
    nome varchar(200) not null,
    cnpj varchar(18) not null unique,
    cidade varchar(100) not null,
    estado varchar (2) not null,
    email varchar(150) not null,
    telefone varchar(20),
    criado_em datetime not null default current_timestamp
    );

-- 2. Professor
create table professor (
	idProfessor int auto_increment primary key,
    instituicaoId int not null,
    nome varchar(150) not null,
    cpf varchar(14) not null unique,
    email varchar(150) not null unique,
    titulacao enum('GRADUACAO', 'ESPECIALIZACAO', 'MESTRADO', 'DOUTORADO') default 'GRADUACAO',
    criado_em datetime not null default current_timestamp,
    
    constraint fk_prof_inst foreign key (instituicaoId)
		references instituicao(IdInstituicao)
        -- Constraint = RESTRIÇÃO DE BANCO DE DADOS - UTILIZANDO PARA GARANTIR A INTEGRIDADE E CONFIABILIDADE
        -- DOS DADOS, IMPEDINDO A INSERÇÃO DE INFORMAÇÕES INVÁLIDAS 
	);
-- --------------------------------------------------------------------------------------------------------    
	CREATE TABLE aluno ( 
		idAluno 		INT 		AUTO_INCREMENT PRIMARY KEY,
        nome			VARCHAR(150) NOT NULL,
        cpf				VARCHAR(14) UNIQUE,
        email 			VARCHAR(50) NOT NULL UNIQUE,
        data_nascimento date		NOT NULL,
        telefone		VARCHAR(20),
        criado_em		DATETIME 	NOT NULL DEFAULT current_timestamp
        
    );        
    

-- -----------------------------------------------------------------------------------

CREATE TABLE turma (
    idturma int auto_increment primary key,
    instituicao_id int not null,      -- CORRIGIDO
    professor_id int not null,
    nome VARCHAR(80) not null,
    ano_letivo YEAR not null,
    turno ENUM('MATUTINO', 'VESPERTINO', 'NOTURNO') NOT NULL,
    vagas smallint not null default 40,
    criado_em datetime not null default current_timestamp,

    constraint fk_turma_inst foreign key (instituicao_id)
        references instituicao(idInstituicao),
    constraint fk_turma_prof foreign key (professor_id)
        references professor(idProfessor)
);


create table matricula(	
	idmatricula 	int		auto_increment primary key,
    aluno_id		int		not null,
    turma_id		int		not null,
    data_matricula	date    not null default(current_date),
    situacao		enum('ATIVA', 'TRANCADA', 'CANCELADA', 'CONCLUIDA') not null default 'ATIVA',
    
    unique key uq_aluno_turma(aluno_id, turma_id),

    constraint fk_mat_aliuno foreign key (aluno_id)
		references aluno(idAluno),
	constraint fk_mat_aluno foreign key (turma_id)
		references turma(idTurma)
);






    