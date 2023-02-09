-- Retorna a menor renda 
create view menor_renda_mensal as SELECT cod_inscricao, n_membros, mensal FROM renda ORDER BY mensal asc LIMIT 1;

-- Retorna as inscrições do semestre 1
create view cod_insc_sem as select cod_inscricao, semestre from proc_seletivo where semestre = 1;

-- Retorna os estudantes com renda maior que 1000
create view renda_estudante as select estudante.cod_inscricao from estudante inner join renda on renda.cod_inscricao = estudante.cod_inscricao where mensal > 1000;

-- Retorna a quantidade de inscritos que já foram professores em escola pública
create view cont_professor as select count(*) from estudante where prof_rede_publica = 'NÃO';

-- Retorna a quantidade de inscrições com nota maior que 500 em matemática
create view nota_math as select count(*) from enem where matematica > 500;