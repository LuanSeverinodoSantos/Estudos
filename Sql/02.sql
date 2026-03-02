SELECT
    a.id,
    a.nome AS aluno,
    c.nome AS curso
FROM alunos a
LEFT JOIN matriculas m ON m.aluno_id = a.id
LEFT JOIN cursos c ON c.id = m.curso_id
ORDER BY a.id;

