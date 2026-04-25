-- DQL	
-- SELECT -> superhiperexcelent!
SELECT * FROM ALUNOs;

-- where -> filtragem
SELECT nomeAluno, cursoAluno 
FROM alunos 
where cursoAluno = 'Programacao Backend';

SELECT
cursoAluno, COUNT(*)  as totalAluno
FROM alunos
GROUP BY cursoAluno
ORDER BY totalAlunos desc;

-- os alunos e sua insituicao de ensino!
SELECT
	nomeAluno,
    cursoAluno,
    nomeInstituicao
    FROM alunos
    JOIN instituicao on alunos.instituicaoId = instituicao.idInstituicao;
  
-- Quantos alunos existem dentro de uma instituicao?
SELECT
 i.nomeInstituicao,
count(*) as Total_alunos
FROM instituicao i
JOIN alunos ON i.idInstituicao = alunos.instituicaoId
group by i.nomeInstituicao;

-- exiba quantos alunos existem em um curso x da instituicao y
select
 a.nomeAluno as Aluno,
 a.cursoAluno as Curso,
 i.nomeInstituicao as instituicao
 FROM Alunos a
 JOIN instituicao i on a.instituicaoId = idInstituicao
 where i.idInstituicao	= 2;
 
 select
 i.nomeInstituicao,
 a.cursoAluno,
 count(*) as Total_Alunoo
 FROM instituicao i
 join alunos a on i.idInstituicao = a.instituicaoId
 group by i.nomeiNSTITUICAO, a.cursoAluno
 order by i.nomeInstituicao DESC;
    


describe alunos; -- retorna as caracteristicas da tabela

