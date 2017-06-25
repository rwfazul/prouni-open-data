-- • agregação
-- Listar quantos cursos ofertaram bolsas e quantas bolsas foram deferidas por instituição de ensino.
SELECT       nome_ies_bolsa, COUNT(DISTINCT codigo_curso) AS cursos_ofertados, 
             COUNT(codigo_bolsa_prouni) AS bolsas_deferidas
FROM         curso
NATURAL JOIN info_ies
NATURAL JOIN bolsa_prouni
GROUP BY     nome_ies_bolsa;

-- • operador de conjunto -> union
/* Listar os codigos dos tipos de bolsas que foram ofertada para o curso de Sistemas de Informação  
    OU os os codigos dos tipos de bolsas que foram ofertada para o curso de Administração: */
( SELECT       codigo_tipo 
  FROM         bolsa_prouni
  NATURAL JOIN curso
  WHERE        nome_curso LIKE 'Sistemas de Informação' )
UNION
( SELECT       codigo_tipo 
  FROM         bolsa_prouni
  NATURAL JOIN curso
  WHERE        nome_curso LIKE 'Administração' ); 

-- • junção externa (outer join)
/* (Como não temos nenhuma tabela que tenha informações que não estejam na tabela principal para realizar 
   outer join foi necessário a criação de uma tabela imaginária com uma condição que faça com que ela não 
   contenha 1 ou mais valores presentes na tabela principal) */
/* Listar as informações das bolsas concedidas e as informações do curso quando o curso pertence à 
   uma instituição de ensino específica. */
SELECT * 
FROM   bolsa_prouni
NATURAL LEFT OUTER JOIN 
(
    SELECT * 
    FROM   curso 
    WHERE  codigo_emec_ies = 349
) AS t_intra;

/* Listar as informações sobre as bolsas ofertadas para o curso de Sistemas de Informação 
   e as informações dos tipos de bolsas. */
SELECT  * 
FROM    tipo_bolsa
NATURAL LEFT OUTER JOIN
(
    SELECT       * 
    FROM         bolsa_prouni 
	NATURAL JOIN curso
	WHERE        nome_curso LIKE 'Sistemas de Informação'
) AS t_intra;

-- • junções entre três ou mais tabelas
--  Listar dados completos sobre determinada bolsa a partir de CPF do beneficiario
-- simula a consulta: SELECT * FROM bolsa_desnormalizado WHERE cpf_beneficiario_bolsa LIKE '%882932%';
SELECT       t1.ano_concessao, t2.codigo_emec_ies, t3.nome_ies_bolsa, t4.tipo_bolsa, t2.modalidade_ensino, 
             t2.nome_curso, t2.turno, t5.cpf, t5.sexo, t6.raca, t5.dt_nascimento, t5.deficiente_fisico, 
             t8.regiao, t8.sigla, t7.nome_municipio
FROM         bolsa_prouni t1
NATURAL JOIN curso        t2  
NATURAL JOIN info_ies     t3   
NATURAL JOIN tipo_bolsa   t4  
NATURAL JOIN beneficiario t5 
NATURAL JOIN `raça`       t6  
NATURAL JOIN municipio    t7  
NATURAL JOIN info_uf      t8 
WHERE        t5.cpf  LIKE '%882932%';

-- Listar quantos beneficiarios de cada raça foram contemplados com cada bolsa
SELECT       t3.raca, t1.integrais, t2.parciais
FROM
(
    SELECT       codigo_raca, COUNT(t2.codigo_raca) AS integrais 
    FROM         bolsa_prouni t1
    NATURAL JOIN beneficiario t2
    NATURAL JOIN tipo_bolsa   t3
    WHERE        t3.tipo_bolsa LIKE 'BOLSA INTEGRAL'
    GROUP BY     codigo_raca
) AS t1
NATURAL JOIN
(   
    SELECT       codigo_raca, COUNT(t2.codigo_raca) AS parciais
    FROM         bolsa_prouni t1
    NATURAL JOIN beneficiario t2
    NATURAL JOIN tipo_bolsa   t3
    WHERE        t3.tipo_bolsa LIKE 'BOLSA PARCIAL 50%'
    GROUP BY     codigo_raca
) AS t2
NATURAL JOIN `raça` t3;

-- • subconsulta
/* Listar a média de alunos de cada sexo que foram contemplados com bolsas nos cursos por universidade
   Exemplo: UFSM-> Curso A: 10 homens, Curso B: 3 homens, Curso C: 6 homens. Média homens UFSM: (10+3+6)/3 */
-- Retorna a media dos 2 sexos na mesma consulta
SELECT       t3.nome_ies_bolsa, t1.media_homens, t2.media_mulheres 
FROM
(
    SELECT       codigo_emec_ies, ROUND( AVG(t_intra.homens) ) media_homens
    FROM 	
    (
        SELECT       codigo_curso, COUNT(sexo) AS homens
        FROM         beneficiario
        NATURAL JOIN bolsa_prouni 
        WHERE        sexo LIKE 'Masculino'
        GROUP BY     codigo_curso
    ) AS t_intra
	NATURAL JOIN curso 
	GROUP BY     codigo_emec_ies
) AS t1
NATURAL RIGHT OUTER JOIN 
(
    SELECT       codigo_emec_ies, ROUND( AVG(t_intra.mulheres) ) media_mulheres
    FROM 	
    (
        SELECT       codigo_curso, COUNT(sexo) AS mulheres
        FROM         beneficiario
        NATURAL JOIN bolsa_prouni 
        WHERE        sexo LIKE 'Feminino'
        GROUP BY     codigo_curso
    ) AS t_intra
	NATURAL JOIN curso 
	GROUP BY     codigo_emec_ies
) AS t2
NATURAL JOIN info_ies t3;

-- Retorna a media de cada sexo em consultas separadas
/* SELECT   t_extra.nome_ies_bolsa, ROUND( AVG(t_intra.homens) ) media_homens
FROM 	
(
    SELECT       codigo_curso, COUNT(sexo) AS homens
    FROM         beneficiario
    NATURAL JOIN bolsa_prouni 
    WHERE        sexo LIKE 'Masculino'
    GROUP BY     codigo_curso
) AS t_intra
NATURAL JOIN curso 
NATURAL JOIN info_ies t_extra
GROUP BY t_extra.nome_ies_bolsa;

SELECT       t_extra.nome_ies_bolsa, ROUND( AVG(t_intra.mulheres) ) media_mulheres
FROM 	
(
    SELECT       codigo_curso, COUNT(sexo) AS mulheres
    FROM         beneficiario
    NATURAL JOIN bolsa_prouni 
    WHERE        sexo LIKE 'Feminino'
    GROUP BY     codigo_curso
) AS t_intra
NATURAL JOIN curso 
NATURAL JOIN info_ies t_extra
GROUP BY     t_extra.nome_ies_bolsa; */





