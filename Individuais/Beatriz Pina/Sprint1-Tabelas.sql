-- criar banco Humidsafe
CREATE DATABASE HUMIDSAFE;
-- Usar banco HumidSafe
USE HUMISAFE;

-- Criar tabela cadCliente, controle interno dos criadores do sistema, tabela cadastro do cliente, onde ficam armazenados os dados do mesmo
CREATE TABLE cadCliente(
idcliente INT PRIMARY KEY  auto_increment,
razaoSocial VARCHAR (100),
nomeFantasia VARCHAR (100),
cnpj CHAR (14),
logradouro VARCHAR (50),
bairro VARCHAR (50),
numeroEndereço VARCHAR (5),
emailcontato VARCHAR (90),
numerocontato VARCHAR (11),
porteJuridico VARCHAR (5),
constraint chkPorte
check(porteJuridico in ( 'Ltda', 'SLU', 'S/A', 'EPP'))
);

-- Inserção de dados na tabela
INSERT INTO cadCliente VALUES
(default,'Hospital Marolanio SLU', 'Marcolanio Saude', '12345678902512', 'Rua Menezes Silva', 'Centro', '159', 'marcolaniosaude@saude.com', '12345678902', 'SLU'),
(default,'Hospital Saúde Total Ltda', 'Saúde Total', '12345678000190', 'Rua das Flores', 'Centro', '123', 'contato@saudetotal.com', '11987654321', 'Ltda'),
(default,'Instituto Médico Vida Plena S/A', 'Vida Plena', '98765432000112', 'Avenida Brasil', 'Comercial', '456', 'info@vidaplena.com', '21998765432', 'S/A'),
(default,'Clínica Bem Estar EPP', 'Bem Estar', '56789012000134', 'Rua dos Pinheiros', 'Residencial', '789', 'contato@bemestar.com', '31976543210', 'EPP');

SELECT * FROM cadCliente;

SELECT numeroEndereço AS 'Endereço do Cliente'
FROM cadCliente;

-- Criar tabela de cadastro de usuario, cadastro realizado pela empresa dentro do sistema HUMI
CREATE TABLE usuario(
idusuario INT PRIMARY KEY auto_increment,
nome VARCHAR (30),
sobrenome VARCHAR (70), 
emailEmpresa VARCHAR (90),
cpf CHAR (11),
dtcadastro datetime default current_timestamp,
cargo VARCHAR (35),
departamento VARCHAR (30),
nivelAcesso VARCHAR (15),
constraint chknivel
check(nivelAcesso in ('colaborador', 'gestor', 'administrador'))
);

ALTER table usuario modify COLUMN cargo VARCHAR (60);

INSERT INTO usuario VALUES
(default, 'Ricardo', 'Almeida', 'ricardo.almeida@marcolaniosaude.com', '45678912301', '2025-06-25','Técnico de Manutenção', 'Equipe de Manutenção', 'colaborador'),
(default, 'Fernanda', 'Oliveira', 'fernanda.oliveira@marcolaniosaude.com', '78912345602','2024-07-20', 'Coordenadora de Facilities', 'Equipe de Facilities', 'gestor'),
(default, 'Gustavo', 'Pereira', 'gustavo.pereira@saudetotal.com', '12378945603','2023-02-25', 'Gerente Predial', 'Equipe de Gestão Predial', 'gestor'),
(default, 'Patrícia', 'Santos', 'patricia.santos@saudetotal.com', '98745612304', '2022-11-19','Auxiliar de Manutenção', 'Equipe de Manutenção', 'colaborador');

SELECT * FROM usuario;


-- Criar tabela dadosdosensor, tabela onde vão ficar armazenadas os dados enviados pelo sensor e quem estava responsavel pelo monitoramento
CREATE TABLE dadosSensor(
iddado INT PRIMARY KEY auto_increment,
dtDado datetime default current_timestamp,
umidade DECIMAL (5,2),
nomeSupervisor VARCHAR (30),
sobrenomeSupervisor VARCHAR (70)
);

INSERT INTO dadosSensor VALUES
(default,'2024-10-27 10:30:00', 65.50, 'Ricardo', 'Almeida'),
(default,'2024-10-27 11:15:00', 72.30, 'Fernanda', 'Oliveira'),
(default,'2024-10-27 12:00:00', 68.75, 'Gustavo', 'Pereira'),
(default,'2024-10-27 13:45:00', 70.20, 'Patrícia', 'Santos');

SELECT * FROM dadosSensor;

UPDATE dadosSensor SET nomeSupervisor = 'Beatriz' 
where iddado = 2;

-- Criar tabela de administrador, no caso os funcionarios da Humidsafe
CREATE TABLE funcionarioHumid(
idfuncionario INT PRIMARY KEY auto_increment,
nome VARCHAR (30),
sobrenome VARCHAR (70),
cpf CHAR (11),
cargo VARCHAR (35),
departamento VARCHAR (30)
);

ALTER table funcionarioHumid modify COLUMN cargo VARCHAR (70);
ALTER table funcionarioHumid modify COLUMN cargo VARCHAR (80);

INSERT INTO funcionarioHumid VALUES
(default,'Ana', 'Silva', '12345678901', 'Analista de Sistemas', 'Equipe de Tecnologia'),
(default,'Bruno', 'Santos', '98765432109', 'Desenvolvedor Sênior', 'Equipe de Tecnologia'),
(default,'Carla', 'Oliveira', '11223344556', 'Engenheira de Software', 'Equipe de Tecnologia'),
(default,'Daniel', 'Souza', '66554433221', 'Analista de Dados', 'Equipe de Tecnologia');

select * from funcionarioHumid;


