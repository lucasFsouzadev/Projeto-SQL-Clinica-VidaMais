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
