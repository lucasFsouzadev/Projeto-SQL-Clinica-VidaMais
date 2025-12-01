SELECT nome, cpf FROM Paciente ORDER BY nome;

SELECT c.consulta_id, p.nome AS paciente, m.nome AS medico
FROM Consulta c
JOIN Paciente p ON c.paciente_id = p.paciente_id
JOIN Medico m ON c.medico_id = m.medico_id;

SELECT * FROM Consulta WHERE status = 'Agendada';

SELECT nome, crm FROM Medico WHERE especialidade_id = 1;

SELECT * FROM Exame LIMIT 5;
