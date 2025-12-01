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
