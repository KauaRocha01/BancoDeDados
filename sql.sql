	-- DDL
    CREATE TABLE Instituicao (
		idInstituicao int not null auto_increment, 
        nomeInstituicao varchar(50) not null, 
        enderecoInstituicao varchar(100) not null,
        telefoneInstituicao varchar(11) not null,
        primary key(idInstituicao)
        );
        