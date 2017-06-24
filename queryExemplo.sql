SELECT  * 
FROM    bolsa_desnormalizado 
WHERE   cpf_beneficiario_bolsa LIKE '%882932%';
	
-- Retorna dados completos sobre determinada bolsa a partir de CPF do beneficiario... simula a consulta acima
SELECT        t1.ano_concessao, t2.codigo_emec_ies, t3.nome_ies_bolsa, t4.tipo_bolsa, t2.modalidade_ensino, 
              t2.nome_curso, t2.turno, t5.cpf, t5.sexo, t6.raca, t5.dt_nascimento, t5.deficiente_fisico, 
              t8.regiao, t8.sigla, t7.nome_municipio
FROM          bolsa_prouni t1
NATURAL JOIN  curso        t2  
NATURAL JOIN  info_ies     t3   
NATURAL JOIN  tipo_bolsa   t4  
NATURAL JOIN  beneficiario t5 
NATURAL JOIN  `raça`       t6  
NATURAL JOIN  municipio    t7  
NATURAL JOIN  info_uf      t8 
WHERE         t5.cpf  LIKE '%882932%';

SELECT      t1.ano_concessao, t2.codigo_emec_ies, t3.nome_ies_bolsa, t4.tipo_bolsa, t2.modalidade_ensino, 
            t2.nome_curso, t2.turno, t5.cpf, t5.sexo, t6.raca, t5.dt_nascimento, t5.deficiente_fisico,
            t8.regiao, t8.sigla, t7.nome_municipio
FROM        bolsa_prouni t1
INNER JOIN  curso        t2  USING (codigo_curso)
INNER JOIN  info_ies     t3  USING (codigo_emec_ies)
INNER JOIN  tipo_bolsa   t4  USING (codigo_tipo)
INNER JOIN  beneficiario t5  USING (codigo_beneficiario)
INNER JOIN  `raça`       t6  USING (codigo_raca)
INNER JOIN  municipio    t7  USING (codigo_municipio)
INNER JOIN  info_uf      t8  USING (codigo_uf)
WHERE       t5.cpf  LIKE '%882932%';

SELECT      t1.ano_concessao, t2.codigo_emec_ies, t3.nome_ies_bolsa, t4.tipo_bolsa, t2.modalidade_ensino, 
            t2.nome_curso, t2.turno, t5.cpf, t5.sexo, t6.raca, t5.dt_nascimento, t5.deficiente_fisico,
            t8.regiao, t8.sigla, t7.nome_municipio
FROM        bolsa_prouni t1
INNER JOIN  curso        t2  ON  t2.codigo_curso        = t1.codigo_curso
INNER JOIN  info_ies     t3  ON  t3.codigo_emec_ies     = t2.codigo_emec_ies 
INNER JOIN  tipo_bolsa   t4  ON  t4.codigo_tipo         = t1.codigo_tipo
INNER JOIN  beneficiario t5  ON  t5.codigo_beneficiario = t1.codigo_beneficiario
INNER JOIN  `raça`       t6  ON  t6.codigo_raca         = t5.codigo_raca
INNER JOIN  municipio    t7  ON  t7.codigo_municipio    = t5.codigo_municipio
INNER JOIN  info_uf      t8  ON  t8.codigo_uf           = t7.codigo_uf
WHERE       t5.cpf  LIKE '%882932%';