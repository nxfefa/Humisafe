-- criar banco de dados
CREATE DATABASE projeto;

-- usar banco de dados
USE projeto;

-- tabela 1
CREATE TABLE CadastroFunci (
Nome VARCHAR(50) NOT NULL,
Sobrenome VARCHAR (100),
Funcao VARCHAR(50) NOT NULL,
DtNascimento DATE NOT NULL,
CPF CHAR(11) NOT NULL,
Email VARCHAR(100) NOT NULL,
Senha CHAR(8)
);

-- tabela 2
CREATE TABLE LoginFunci (
Email VARCHAR(100) NOT NULL,
Senha VARCHAR(8)
);

-- tabela 3
CREATE TABLE Monitoramento (
Quarto INT PRIMARY KEY AUTO_INCREMENT,
Andar INT,
Umidade VARCHAR(5), 
QtdPacientes VARCHAR(5), -- dentro do quarto 
UltLimp DATE, -- ultima limpeza que foi feita no quarto
UltMonit DATE, -- ultimo acesso à monitoração
Motivo VARCHAR(50), -- razão do paciente estar ali(pós-operatório, internação, doenças respiratórias)
CONSTRAINT chkMotivo CHECK (Motivo IN ('internação', 'doença respiratória', 'pré-operatório', 'pós-operatório'))
);

-- tabela 4
CREATE TABLE CadastroComprador (
Nome VARCHAR(30),
Sobrenome VARCHAR(50),
CNPJ CHAR(14),
CEP CHAR(8),
Endereco VARCHAR(100),
TelContato VARCHAR(11),
Email VARCHAR(100),
Senha CHAR(8)
);

-- tabela 5
CREATE TABLE LoginComprador (
Email VARCHAR(100),
Senha CHAR(8)
);
