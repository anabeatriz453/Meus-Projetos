create database oficina;
use oficina;

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    Nome VARCHAR(45),
    Telefone VARCHAR(45),
    Endereco VARCHAR(45)
);

CREATE TABLE Veiculo (
    idVeiculo INT PRIMARY KEY,
    Placa VARCHAR(45),
    Modelo VARCHAR(45),
    Ano INT,
    CodCliente INT,
    Marca VARCHAR(45),
    FOREIGN KEY (CodCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Ordem_de_Servico (
    idOrdem_de_Servico INT PRIMARY KEY,
    NumeroOS INT,
    Data_de_Emissao DATE,
    Valor_Total DECIMAL,
    Status VARCHAR(45),
    Data_de_Conclusao DATE,
    CodVeiculo INT,
    CodCliente INT,
    FOREIGN KEY (CodVeiculo) REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY (CodCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Servico (
    idServico INT PRIMARY KEY,
    Nome VARCHAR(45),
    Descricao TEXT,
    Valor DECIMAL
);

CREATE TABLE OS_Servico (
    CodOS INT,
    CodServico INT,
    PRIMARY KEY (CodOS, CodServico),
    FOREIGN KEY (CodOS) REFERENCES Ordem_de_Servico(idOrdem_de_Servico),
    FOREIGN KEY (CodServico) REFERENCES Servico(idServico)
);

CREATE TABLE Peca (
    idPeca INT PRIMARY KEY,
    Nome VARCHAR(45),
    Descricao TEXT,
    Valor DECIMAL
);

CREATE TABLE OS_Peca (
    CodOS INT,
    CodPeca INT,
    PRIMARY KEY (CodOS, CodPeca),
    FOREIGN KEY (CodOS) REFERENCES Ordem_de_Servico(idOrdem_de_Servico),
    FOREIGN KEY (CodPeca) REFERENCES Peca(idPeca)
);

CREATE TABLE Mecanico (
    idMecanico INT PRIMARY KEY,
    Nome VARCHAR(45),
    Especialidade VARCHAR(45)
);

CREATE TABLE Equipe (
    idEquipe INT PRIMARY KEY,
    Nome VARCHAR(45)
);

CREATE TABLE Mecanico_Equipe (
    CodMecanico INT,
    CodEquipe INT,
    PRIMARY KEY (CodMecanico, CodEquipe),
    FOREIGN KEY (CodMecanico) REFERENCES Mecanico(idMecanico),
    FOREIGN KEY (CodEquipe) REFERENCES Equipe(idEquipe)
);
-- busca e retorna apenas os campos Nome e Telefone de todos os clientes registrados na tabela Cliente.
SELECT Nome, Telefone FROM Cliente; 

-- Recupera todos os dados (*) de veículos na tabela Veiculo cujo ano de fabricação seja maior que 2015
SELECT * FROM Veiculo WHERE Ano > 2015;

-- Busca o nome da peça e cria um novo atributo chamado Valor_Com_Lucro, calculando o valor original (Valor) com um aumento de 20% (multiplicação por 1.2).
SELECT Nome, Valor * 1.2 AS Valor_Com_Lucro FROM Peca;

-- Combina dados de três tabelas (Cliente, Veiculo, e Ordem_de_Servico) para mostrar o nome do cliente, modelo do veículo e o status da ordem de serviço.
SELECT Cliente.Nome AS Cliente, Veiculo.Modelo AS Veiculo, Ordem_de_Servico.Status
FROM Cliente 
JOIN Veiculo ON Cliente.idCliente = Veiculo.CodCliente
JOIN Ordem_de_Servico ON Veiculo.idVeiculo = Ordem_de_Servico.CodVeiculo;

use oficina;
show tables;

-- Tabela Cliente
INSERT INTO Cliente (idCliente, Nome, Telefone, Endereco) VALUES 
(1, 'Ana Silva', '123456789', 'Rua das Flores, 123'),
(2, 'João Pedro', '987654321', 'Avenida Brasil, 456'),
(3, 'Maria Oliveira', '456789123', 'Praça das Águias, 789'),
(4, 'Carlos Souza', '789123456', 'Rua dos Cedros, 321'),
(5, 'Fernanda Costa', '321654987', 'Travessa dos Lírios, 654');

SELECT * FROM Cliente LIMIT 0, 1000;

-- Tabela Veículo
INSERT INTO Veiculo (idVeiculo, Placa, Modelo, Ano, CodCliente, Marca) VALUES 
(1, 'ABC1234', 'Civic', 2018, 1, 'Honda'),
(2, 'XYZ5678', 'Corolla', 2020, 2, 'Toyota'),
(3, 'LMN9101', 'Fiesta', 2015, 3, 'Ford'),
(4, 'JKL2345', 'Onix', 2022, 4, 'Chevrolet'),
(5, 'OPQ6789', 'Gol', 2017, 5, 'Volkswagen');

SELECT * FROM Veiculo LIMIT 0, 1000;

-- Tabela Ordem de Serviço
INSERT INTO Ordem_de_Servico (idOrdem_de_Servico, NumeroOS, Data_de_Emissao, Valor_Total, Status, Data_de_Conclusao, CodVeiculo, CodCliente) VALUES 
(1, 101, '2025-03-01', 150.75, 'Concluída', '2025-03-05', 1, 1),
(2, 102, '2025-03-02', 250.50, 'Em progresso', NULL, 2, 2),
(3, 103, '2025-03-03', 300.00, 'Concluída', '2025-03-06', 3, 3),
(4, 104, '2025-03-04', 120.00, 'Concluída', '2025-03-07', 4, 4),
(5, 105, '2025-03-05', 180.25, 'Cancelada', NULL, 5, 5);

SELECT * FROM Ordem_de_Servico LIMIT 0, 1000;

-- Tabela Serviço
INSERT INTO Servico (idServico, Nome, Descricao, Valor) VALUES 
(1, 'Troca de óleo', 'Substituição de óleo lubrificante', 100.00),
(2, 'Alinhamento', 'Alinhamento de rodas e direção', 80.00),
(3, 'Balanceamento', 'Balanceamento de rodas', 60.00),
(4, 'Troca de pneus', 'Substituição de pneus desgastados', 200.00),
(5, 'Revisão geral', 'Inspeção completa do veículo', 300.00);

SELECT * FROM Servico;

-- Tabela OS_Servico
INSERT INTO OS_Servico (CodOS, CodServico) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

SELECT * FROM OS_Servico;

-- Tabela Peça
INSERT INTO Peca (idPeca, Nome, Descricao, Valor) VALUES 
(1, 'Filtro de óleo', 'Filtro para sistema de óleo', 50.00),
(2, 'Pastilha de freio', 'Pastilhas para sistema de freio', 120.00),
(3, 'Pneu', 'Pneu de alta durabilidade', 300.00),
(4, 'Correia dentada', 'Correia para motor', 200.00),
(5, 'Velas de ignição', 'Velas para sistema de ignição', 80.00);

SELECT * FROM Peca;

-- Tabela OS_Peca
INSERT INTO OS_Peca (CodOS, CodPeca) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

SELECT * FROM OS_Peca;

-- Tabela Mecânico
INSERT INTO Mecanico (idMecanico, Nome, Especialidade) VALUES 
(1, 'Roberto Costa', 'Motores'),
(2, 'Luís Souza', 'Suspensão'),
(3, 'Carla Martins', 'Freios'),
(4, 'Eduardo Lima', 'Transmissão'),
(5, 'Fernanda Alves', 'Elétrica');

SELECT * FROM Mecanico;

-- Tabela Equipe
INSERT INTO Equipe (idEquipe, Nome) VALUES 
(1, 'Equipe A'),
(2, 'Equipe B'),
(3, 'Equipe C'),
(4, 'Equipe D'),
(5, 'Equipe E');

SELECT * FROM Equipe;

-- Tabela Mecânico_Equipe
INSERT INTO Mecanico_Equipe (CodMecanico, CodEquipe) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

SELECT * FROM Mecanico_Equipe;

SELECT * 
FROM Cliente c, Ordem_de_Servico o
WHERE c.idCliente = o.CodCliente;





