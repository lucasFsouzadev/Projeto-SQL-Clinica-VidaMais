# Projeto-SQL-Clinica-VidaMais
Projeto acadêmico de banco de dados – Clínica VidaMais (SQL, DDL, DML, SELECT, UPDATE, DELETE)

📘 Projeto SQL – Clínica VidaMais

Repositório contendo a implementação completa do banco de dados relacional da Clínica VidaMais, incluindo DDL, DML, consultas, manipulação de dados e documentação.

📌 1. Objetivo do Projeto

Este projeto implementa o banco de dados da clínica médica VidaMais, desenvolvido como parte da disciplina de Banco de Dados.
Aqui são aplicados conceitos de:

Modelagem lógica

Normalização

Integridade referencial

Criação de tabelas

Manipulação de dados com SQL

Consultas com JOIN, WHERE, ORDER BY

Versionamento com Git e GitHub

📌 2. Estrutura do Repositório
/Projeto-SQL-Clinica-VidaMais
│
├── README.md               # Documentação principal
│
├── /sql
│   ├── 01_ddl_create_tables.sql       # Criação das tabelas
│   ├── 02_insert_data.sql             # Inserts
│   ├── 03_select_queries.sql          # Consultas SELECT
│   ├── 04_update.sql                  # Atualizações
│   ├── 05_delete.sql                  # Exclusões
│
└── /docs
    └── Modelo_Lógico_DER.txt          # Diagrama ASCII

📌 3. Tecnologias Utilizadas

MySQL Workbench (recomendado)
ou

PGAdmin (PostgreSQL)

📌 4. Como Executar
1️⃣ Criar o banco de dados

No MySQL Workbench:

CREATE DATABASE clinica_vidamais;
USE clinica_vidamais;

2️⃣ Executar o script DDL

Arquivo:

/sql/01_ddl_create_tables.sql

3️⃣ Povoar com INSERTS

Arquivo:

/sql/02_insert_data.sql

4️⃣ Testar as consultas SELECT

Arquivo:

/sql/03_select_queries.sql

5️⃣ Executar UPDATE

Arquivo:

/sql/04_update.sql

6️⃣ Executar DELETE

Arquivo:

/sql/05_delete.sql

📌 5. Modelo Lógico (DER)

Arquivo recomendado:
/docs/Modelo_Lógico_DER.txt

Conteúdo:

[Especialidade]
[PK especialidade_id]
nome
descricao
     |
     |1
     |
     N
[Medico]
[PK medico_id]
crm
nome
(FK especialidade_id)

[Paciente] 1 ----- N [Consulta] 1 ---- N [Exame]
[PK paciente_id]     [PK consulta_id]     [PK exame_id]
cpf                  (FK paciente_id)     (FK consulta_id)
nome                 (FK medico_id)
                     (FK recepcionista_id)

                     1
                     |
                     0..1
                     v
                 [Prontuario]
                 [PK prontuario_id]
                 (FK consulta_id UNIQUE)
                 diagnostico
                 prescricao
                 evolucao

📌 6. Scripts SQL (Arquivos do Repositório)

A seguir está o conteúdo de cada arquivo .sql.

/sql/01_ddl_create_tables.sql
CREATE TABLE Especialidade (
    especialidade_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);

CREATE TABLE Medico (
    medico_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    crm VARCHAR(30) NOT NULL UNIQUE,
    especialidade_id INT NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    FOREIGN KEY (especialidade_id) REFERENCES Especialidade(especialidade_id)
);

CREATE TABLE Paciente (
    paciente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE,
    sexo CHAR(1),
    telefone VARCHAR(20),
    endereco VARCHAR(255)
);

CREATE TABLE Recepcionista (
    recepcionista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    matricula VARCHAR(50) NOT NULL UNIQUE,
    telefone VARCHAR(20)
);

CREATE TABLE Consulta (
    consulta_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT NOT NULL,
    medico_id INT NOT NULL,
    recepcionista_id INT,
    data_hora DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    motivo VARCHAR(255),
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id),
    FOREIGN KEY (medico_id) REFERENCES Medico(medico_id),
    FOREIGN KEY (recepcionista_id) REFERENCES Recepcionista(recepcionista_id)
);

CREATE TABLE Prontuario (
    prontuario_id INT PRIMARY KEY AUTO_INCREMENT,
    consulta_id INT NOT NULL UNIQUE,
    diagnostico TEXT,
    prescricao TEXT,
    evolucao TEXT,
    data_registro DATE NOT NULL,
    FOREIGN KEY (consulta_id) REFERENCES Consulta(consulta_id)
);

CREATE TABLE Exame (
    exame_id INT PRIMARY KEY AUTO_INCREMENT,
    consulta_id INT NOT NULL,
    tipo VARCHAR(100),
    resultado TEXT,
    arquivo VARCHAR(255),
    data_exame DATE,
    FOREIGN KEY (consulta_id) REFERENCES Consulta(consulta_id)
);

/sql/02_insert_data.sql
INSERT INTO Especialidade (nome, descricao) VALUES
('Cardiologia', 'Especialidade do coração'),
('Clínico Geral', 'Atendimento geral'),
('Pediatria', 'Atendimento infantil');

INSERT INTO Medico (nome, crm, especialidade_id, telefone, email) VALUES
('Dr. João Silva', '12345', 1, '11988887777', 'joao@vidamais.com'),
('Dra. Ana Santos', '67890', 2, '11977776666', 'ana@vidamais.com');

INSERT INTO Paciente (nome, cpf, data_nascimento, sexo, telefone, endereco) VALUES
('Carlos Pereira', '12345678900', '1990-02-10', 'M', '11955554444', 'Rua A, 100'),
('Maria Costa', '98765432100', '1985-07-22', 'F', '11944443333', 'Rua B, 200');

INSERT INTO Recepcionista (nome, matricula, telefone) VALUES
('Juliana Alves', 'REC001', '11933332222'),
('Ricardo Lima', 'REC002', '11922221111');

INSERT INTO Consulta (paciente_id, medico_id, recepcionista_id, data_hora, status, motivo) VALUES
(1, 1, 1, '2025-01-10 09:00:00', 'Realizada', 'Dor no peito'),
(2, 2, 2, '2025-01-11 10:30:00', 'Agendada', 'Check-up');

INSERT INTO Prontuario (consulta_id, diagnostico, prescricao, evolucao, data_registro) VALUES
(1, 'Arritmia cardíaca', 'Betabloqueador', 'Paciente estável', '2025-01-10');

INSERT INTO Exame (consulta_id, tipo, resultado, arquivo, data_exame) VALUES
(1, 'Eletrocardiograma', 'Traçado irregular', 'ecg_001.png', '2025-01-10');

/sql/03_select_queries.sql
SELECT nome, cpf FROM Paciente ORDER BY nome;

SELECT c.consulta_id, p.nome AS paciente, m.nome AS medico
FROM Consulta c
JOIN Paciente p ON c.paciente_id = p.paciente_id
JOIN Medico m ON c.medico_id = m.medico_id;

SELECT * FROM Consulta WHERE status = 'Agendada';

SELECT nome, crm FROM Medico WHERE especialidade_id = 1;

SELECT * FROM Exame LIMIT 5;

/sql/04_update.sql
UPDATE Paciente SET telefone = '11999998888' WHERE paciente_id = 1;

UPDATE Medico SET email = 'dr.joao@vidamais.com' WHERE medico_id = 1;

UPDATE Consulta SET status = 'Cancelada' WHERE consulta_id = 2;

/sql/05_delete.sql
DELETE FROM Exame WHERE exame_id = 1;

DELETE FROM Consulta WHERE consulta_id = 2;

DELETE FROM Paciente WHERE paciente_id = 2;

📌 7. Autor

Projeto desenvolvido por:

Lucas Ferreira Souza
