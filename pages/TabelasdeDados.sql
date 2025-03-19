-- Beatriz Pina, Davi, Fernanda, Giovanna de Oliveira e Thaís 
-- GRUPO 2

CREATE DATABASE humiSafe;

USE humiSafe;

CREATE TABLE CadastroCliente ( 
	idCliente INT AUTO_INCREMENT PRIMARY KEY, 
	RazãoSocialCliente VARCHAR(100) NOT NULL, 
	NomeFantasiaCliente VARCHAR(40) NOT NULL, 
	CNPJ CHAR(14) NOT NULL, 
	porteCliente VARCHAR(7), 
	ruaCliente VARCHAR(50) NOT NULL, 
	numRuaCliente VARCHAR(6) NOT NULL, 
	cepCliente CHAR(8) NOT NULL, 
	numTelCliente CHAR(12), 
	EmailCliente VARCHAR(50)
);

INSERT INTO CadastroCliente (RazãoSocialCliente, NomeFantasiaCliente, CNPJ, porteCliente, ruaCliente, numRuaCliente, cepCliente, numTelCliente, EmailCliente) VALUES
('Hospital Marmios Nova Vida Loures Nemo', 'Hospital Nova Vida', '66052657000100', 'Grande', 'Rua Tomé Pontes', '5826', '03134050', '112916317358', 'hospitalnovavida@email.com');

SELECT * FROM CadastroCliente;

CREATE TABLE CadastroUsuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nomeUsuario VARCHAR(30) NOT NULL,
    sobrenomeUsuario VARCHAR(50) NOT NULL,
    nomeSocialUsuario VARCHAR(50),
    nivelAcessoUsuario VARCHAR(15),
    deparUsuario VARCHAR(30),
    cargoUsuario VARCHAR(30) NOT NULL,
    emailEmpresarialUsuario VARCHAR(50) NOT NULL UNIQUE,
    numTelUsuario VARCHAR(13),
    CPF CHAR(11) NOT NULL,
    CONSTRAINT chkNivel CHECK (nivelAcessoUsuario IN ('Colaborador' , 'Gestor', 'Administrador'))
);

INSERT INTO CadastroUsuario (nomeUsuario, sobrenomeUsuario, nomeSocialUsuario, nivelAcessoUsuario, deparUsuario, cargoUsuario, emailEmpresarialUsuario, numTelUsuario, CPF) VALUES 
('Cláudia Sebastiana', 'Almada', 'Cláudia', 'Gestor', 'UTI', 'Enfermeira Chefe', 'claudiasebastianaalmada@hospitalnovavida.com.br', '1137639223', '05117985800');

SELECT * FROM CadastroUsuario;

CREATE TABLE dadoSensor (
	idDado INT AUTO_INCREMENT PRIMARY KEY,
    umidadeDado DECIMAL(5,2) NOT NULL,
    dataRegistroDado DATETIME DEFAULT CURRENT_TIMESTAMP,
    localDado VARCHAR(50),
    numSala VARCHAR(4),
    CONSTRAINT chk_tipo CHECK (localDado IN ('UTI', 'Centro Cirurgico', 'Pronto socorro', 'Unidades de queimados', 'NeoNatal', 'Oncologia'))
);

INSERT INTO dadoSensor (umidadeDado, dataRegistroDado, localDado, numSala) VALUES 
('54', '2025-01-01 04:12:21', 'UTI', '8');

SELECT * FROM dadoSensor;

CREATE TABLE loginUsuario (
	idLogin INT AUTO_INCREMENT PRIMARY KEY,
    emailLogin VARCHAR(50),
    senhaLogin VARCHAR(20),
    dataAcessoLogin DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO loginUsuario (emailLogin, senhaLogin, dataAcessoLogin) VALUES 
('claudiasebastianaalmada@hospitalnovavida.com.br', '19274920Clau', '2025-01-01 01:05:11');

SELECT * FROM loginUsuario;

CREATE TABLE departamento (
	idDepartamento INT AUTO_INCREMENT PRIMARY KEY,
    nomeDepartamento VARCHAR(100),
    numDepartamento VARCHAR(4),
    qtdPacientesDepartamento TINYINT,
    qtdFuncionarioDepartamento TINYINT,
    CONSTRAINT chkTipo CHECK (nomeDepartamento IN ('UTI', 'Centro Cirurgico', 'Pronto socorro', 'Unidades de queimados', 'NeoNatal', 'Oncologia'))
);

INSERT INTO departamento (nomeDepartamento, numDepartamento, qtdPacientesDepartamento, qtdFuncionarioDepartamento) VALUES
('UTI', '8', '6', '18');

SELECT * FROM departamento;
