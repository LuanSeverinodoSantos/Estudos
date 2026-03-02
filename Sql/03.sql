
SELECT
    c.nome AS curso,
    COUNT(m.aluno_id) AS quantidade_alunos
FROM cursos c
LEFT JOIN matriculas m ON m.curso_id = c.id
GROUP BY c.nome
ORDER BY quantidade_alunos DESC;

