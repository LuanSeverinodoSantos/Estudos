/* =========================================================
   BLOCO 0: LIMPEZA DO AMBIENTE (opcional)
   ---------------------------------------------------------
   Serve para apagar as tabelas antigas e recriar tudo do zero.
   Útil quando você está treinando e quer evitar conflito
   com tabelas já existentes.
   ========================================================= */

-- Apaga primeiro a tabela de ligação (matriculas),
-- porque ela depende de alunos e cursos por causa das FKs.
DROP TABLE IF EXISTS matriculas;

-- Depois apaga as tabelas "pai".
DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS cursos;


/* =========================================================
   BLOCO 1: TABELA ALUNOS
   ========================================================= */
CREATE TABLE alunos (
    id INT PRIMARY KEY,          -- Identificador único de cada aluno
    nome VARCHAR(100) NOT NULL   -- Nome do aluno (não pode ser nulo)
);


/* =========================================================
   BLOCO 2: TABELA CURSOS
   ========================================================= */
CREATE TABLE cursos (
    id INT PRIMARY KEY,          -- Identificador único de cada curso
    nome VARCHAR(100) NOT NULL   -- Nome do curso (não pode ser nulo)
);


/* =========================================================
   BLOCO 3: TABELA MATRICULAS (relação N:N)
   ---------------------------------------------------------
   Aqui fica a ligação entre aluno e curso.
   Cada linha = 1 matrícula (um aluno em um curso).
   ========================================================= */
CREATE TABLE matriculas (
    id INT PRIMARY KEY,          -- Identificador único da matrícula
    aluno_id INT NOT NULL,       -- Guarda o id do aluno matriculado
    curso_id INT NOT NULL,       -- Guarda o id do curso da matrícula

    -- FK: obriga aluno_id a existir em alunos(id)
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),

    -- FK: obriga curso_id a existir em cursos(id)
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);


/* =========================================================
   BLOCO 4: DADOS DE EXEMPLO - ALUNOS
   ========================================================= */
INSERT INTO alunos (id, nome) VALUES
(1, 'Ana'),
(2, 'Bruno'),
(3, 'Carla');


/* =========================================================
   BLOCO 5: DADOS DE EXEMPLO - CURSOS
   ========================================================= */
INSERT INTO cursos (id, nome) VALUES
(1, 'Informática'),
(2, 'Enfermagem'),
(3, 'Administração');


/* =========================================================
   BLOCO 6: DADOS DE EXEMPLO - MATRICULAS
   ---------------------------------------------------------
   Cada tupla é (id_da_matricula, aluno_id, curso_id)
   ========================================================= */
INSERT INTO matriculas (id, aluno_id, curso_id) VALUES
(1, 1, 1),  -- Matrícula 1: Ana (id 1) no curso Informática (id 1)
(2, 2, 1),  -- Matrícula 2: Bruno (id 2) no curso Informática (id 1)
(3, 2, 2),  -- Matrícula 3: Bruno (id 2) no curso Enfermagem (id 2)
(4, 3, 3);  -- Matrícula 4: Carla (id 3) no curso Administração (id 3)


/* =========================================================
   BLOCO 7: CONSULTA COM INNER JOIN
   ---------------------------------------------------------
   Objetivo: mostrar o "nome do aluno" e o "nome do curso"
   a partir dos IDs guardados em matriculas.
   ========================================================= */
SELECT
    m.id AS matricula_id,  -- Mostra o id da matrícula
    a.nome AS aluno,       -- Mostra o nome do aluno
    c.nome AS curso        -- Mostra o nome do curso
FROM matriculas m
    -- Junta matriculas com alunos:
    -- m.aluno_id (na matrícula) deve ser igual a a.id (em alunos)
INNER JOIN alunos a ON a.id = m.aluno_id
    -- Junta matriculas com cursos:
    -- m.curso_id (na matrícula) deve ser igual a c.id (em cursos)
INNER JOIN cursos c ON c.id = m.curso_id
ORDER BY m.id;             -- Ordena pelo id da matrícula


/* =========================================================
   RESULTADO ESPERADO DA CONSULTA FINAL
   ---------------------------------------------------------
   matricula_id | aluno | curso
   1            | Ana   | Informática
   2            | Bruno | Informática
   3            | Bruno | Enfermagem
   4            | Carla | Administração
   ========================================================= */
