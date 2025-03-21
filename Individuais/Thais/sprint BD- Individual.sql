-- banco de dados HumiSafe

-- 1
CREATE TABLE cadastroFunc ( 
id_cadastro INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(50), 
sobrenome VARCHAR(100), 
email VARCHAR(255) UNIQUE, 
cpf CHAR(11) UNIQUE, 
rg VARCHAR(12), 
dt_nasc DATE, 
genero VARCHAR(10), 
funcao VARCHAR(50),
senha VARCHAR(255)
); 

-- 2
CREATE TABLE cadastroemp (
nome VARCHAR (50),
sobrenome VARCHAR (100),
CNPJ CHAR (20) , 
email VARCHAR(255) ,
dt_nasc DATE,
nomeEmp VARCHAR (100),
senha VARCHAR (20)
);

-- 3
CREATE TABLE login ( 
idUsuario INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(100) NOT NULL, 
email VARCHAR(100) UNIQUE NOT NULL, 
senha VARCHAR(255) NOT NULL, 
CONSTRAINT chkusuario CHECK (usuario IN ('UTI', 'Enfermeira(o)', 'médico', 'Outro')),
dtCriacao DATETIME 
); 

-- 4
CREATE TABLE locais_hospital_qtd ( 
idLocalQtd INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(100) NOT NULL, 
CONSTRAINT chktipo CHECK ( tipo IN ('UTI', 'Enfermaria', 'Centro Cirúrgico', 'Quarto', 'Outro', 'MetroQuadrado','Arcondicionado','Umidificador'))
); 

INSERT INTO locais_hospital_qtd (nome, tipo) VALUES  
('UTI 01', 'UTI'), 
('Centro Cirúrgico A', 'Centro Cirúrgico'), 
('Enfermaria 12', 'Enfermaria'); 

-- 5
CREATE TABLE limpeza ( 
idLimpeza INT PRIMARY KEY AUTO_INCREMENT, 
idLocal INT NOT NULL CHECK (idLocal > 0), -- Garante que idLocal seja sempre um valor positivo 
tipo_limpeza VARCHAR(50) NOT NULL, -- Ex: 'Pesada', 'Leve', 'Ar-condicionado', 'Umidificador' 
data_hora DATETIME NOT NULL, -- Quando a limpeza foi realizada 
responsavel VARCHAR(100) NOT NULL, -- Nome da pessoa ou equipe responsável 
observacoes VARCHAR (255) -- Alguma observação sobre a limpeza (opcional) 
); 

INSERT INTO limpeza (idLocal, tipo_limpeza, data_hora, responsavel, observacoes)  VALUES  
(1, 'Pesada', '2025-02-25 10:30:00', 'Carlos Silva', 'Usado desinfetante hospitalar.'), 
(2, 'Leve', '2025-02-26 15:45:00', 'Ana Souza', 'Apenas retirada de poeira e álcool 70%.'), 
(3, 'Ar-condicionado', '2025-02-27 09:15:00', 'Equipe Técnica', 'Troca de filtro realizada.'), 
(4, 'Umidificador', '2025-02-27 12:00:00', 'Equipe Técnica', 'Verificação e limpeza dos reservatórios.'); 


-- 6
CREATE TABLE MonitoramentoAmbi ( 
idMonitoramento INT PRIMARY KEY AUTO_INCREMENT, 
idLocal INT NOT NULL, 
data_hora DATETIME NOT NULL, 
temperatura DECIMAL(5,2) NOT NULL, 
umidade DECIMAL(5,2) NOT NULL, 
CONSTRAINT chk_tipo CHECK (tipo IN ( 'uti', 'enfermaria', 'centro cirurgico', 'quarto'))
); 

INSERT INTO monitoramento_ambiente (idLocal, data_hora, temperatura, umidade) VALUES  

(1, '2025-03-02 14:30:00', 23.5, 65.0), 
(2, 20.0, 58.3), 
(3, 25.2, 70.5); 

-- 7
CREATE TABLE pacientes ( 
idPaciente INT PRIMARY KEY AUTO_INCREMENT, 
recem_nascido DATE,  -- Data de admissão como recém-nascido 
recem_operado DATE,  -- Data de cirurgia recente 
pos_operado DATE,    -- Data do pós-operatório 
internado_uti DATE,  -- Data de internação na UTI 
internado DATE       -- Data de internação geral 
); 

-- 8
CREATE TABLE entregas ( 
id INT AUTO_INCREMENT PRIMARY KEY, 
codigo_rastreio VARCHAR(50) NOT NULL UNIQUE, 
transportadora VARCHAR(100), 
data_envio DATE, 
data_prevista DATE, 
status VARCHAR(20) NOT NULL, 
CONSTRAINT chk_status CHECK (status IN ('Em transporte', 'Entregue', 'Atrasado', 'Cancelado')) 
); 

INSERT INTO entregas (codigo_rastreio, transportadora, data_envio, data_prevista, status)  
VALUES ('ABC123456BR', 'Correios', '2025-03-02', '2025-03-10', 'Em transporte'); 

 -- atualização da entrega
UPDATE entregas SET status = 'Entregue' WHERE codigo_rastreio = 'ABC123456BR'; 

-- Tabela de Agendamentos de Instalação 

CREATE TABLE agendamentos ( 
id INT AUTO_INCREMENT PRIMARY KEY, 
codigo_rastreio VARCHAR(50) NOT NULL, 
data_instalacao DATE NOT NULL, 
horario TIME NOT NULL, 
tecnico_responsavel VARCHAR(100), 
status VARCHAR(20) NOT NULL, 
CONSTRAINT chk_status CHECK (status IN ('Agendado', 'Concluído', 'Cancelado'))
); 

INSERT INTO agendamentos (codigo_rastreio, data_instalacao, horario, tecnico_responsavel, status) 
VALUES ('ABC123456BR', '2025-03-12', '10:30:00', 'Carlos Silva', 'Agendado'); 

-- atualização agendamento
UPDATE agendamentos SET status = 'Concluído' WHERE codigo_rastreio = 'ABC123456BR'; 



