create database sprint1;
use sprint1;

-- tabela cliente - empresa
-- tabela dadosSensor 
-- tabela login

-- usuario - quem vai acessar
-- locais - locais dentro da empresa
-- coisas sobre hospital

create table cliente (
	idCliente int auto_increment primary key,
    nomeCliente Varchar (20) not null,
    cnpj char (14) not null unique,
    tamanhoCliente varchar(7),
    ruaCliente varchar (20) not null,
    numeroRuaCliente varchar(6) not null,
    cepCliente char(8) not null,
    numeroTelefoneCliente char (12),
    numeroCelularCliente char(13),
    constraint chkTamanho check (tamanhoCliente in('Pequeno', 'Medio', 'Grande'))
);

create table usuario (
	idusuario int auto_increment primary key,
	nomeUsuario varchar(30) not null,
    sobrenomeUsuario varchar(50) not null,
    nivelAcessoUsuario varchar (15),
    setorUsuario varchar (30),
    dtNascimentoUsuario date,
    cargoUsuario varchar(30) not null,
    emailUsuario varchar(30) not null unique,
    numeroCelularUsuario varchar(13),
    cpf char(11) not null unique,
    rg char(9) unique,
    nomeRuaUsuario varchar(30),
    numeroRuaUsuario varchar(6),
    generoUsuario varchar(15)
);

create table dadoSensor (
	idDado int Auto_increment primary key,
    valorMedioUmidade decimal (4,2) not null,
    valorMedioTemperatura decimal (4,2),
    dataRegistroDado datetime
);

create table login (
	idLogin int primary key auto_increment,
    emailLogin varchar(40),
    senhaLogin varchar (20),
    dataCadastroLogin datetime default current_timestamp
);

create table setor (
	idSetor int primary key auto_increment,
    nomeSetor varchar (30),
    qtdPacientesSetor tinyint,
    qtdFuncionarioSetor tinyint,
    qtdArCondicionadoSetor tinyint,
    qtdJanelaSetor tinyInt,
    constraint chkClimatizacao check (climatizacaoSetor in('Ar-Condicionado', 'Ventilador'))
    
);

create table paciente (
idPaciente int primary key auto_increment,
nomePaciente varchar (20),
sobrenomePaciente varchar(50) not null,
situacaoPaciente varchar(100),
setorPaciente varchar(50),
dtNascimentoPaciente date,
numeroCelularPaciente varchar(13),
cpfPaciente char(11) not null unique,
rgPaciente char(9) unique,
generoPaciente varchar(15)
);



