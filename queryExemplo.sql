SELECT * FROM bolsa_desnormalizado WHERE cpf_beneficiario_bolsa LIKE'%882932%';
	
-- Retorna dados completos sobre determinada bolsa a partir de CPF do beneficiario... simula a consulta acima
SELECT 		t1.ano_concessao, t2.codigo_emec_ies, t3.nome_ies_bolsa, t4.nome, t2.modalidade_ensino, t2.nome, 
			t2.turno, t5.cpf, t5.sexo, t5.dt_nascimento, t5.deficiente_fisico, t7.regiao, t7.sigla, t6.nome
FROM		bolsa_prouni t1
INNER JOIN	curso 		 t2	 ON  t2.codigo_curso 	    = t1.codigo_curso
INNER JOIN 	info_ies 	 t3  ON  t3.codigo_emec_ies     = t2.codigo_emec_ies 
INNER JOIN	tipo_bolsa 	 t4  ON  t4.codigo_tipo		    = t1.codigo_tipo
INNER JOIN	beneficiario t5  ON  t5.codigo_beneficiario = t1.codigo_beneficiario
INNER JOIN	municipio 	 t6  ON  t6.codigo_municipio    = t5.codigo_municipio
INNER JOIN	info_uf 	 t7  ON  t7.codigo_uf 	        = t6.codigo_uf
WHERE 		t5.cpf	 LIKE '%882932%';


SELECT 		t1.ano_concessao, t2.codigo_emec_ies, t3.nome_ies_bolsa, t4.nome, t2.modalidade_ensino, t2.nome, 
			t2.turno, t5.cpf, t5.sexo, t5.dt_nascimento, t5.deficiente_fisico, t7.regiao, t7.sigla, t6.nome
FROM		bolsa_prouni t1
INNER JOIN	curso 		 t2	 USING (codigo_curso)
INNER JOIN 	info_ies 	 t3  USING (codigo_emec_ies)
INNER JOIN	tipo_bolsa 	 t4  USING (codigo_tipo)
INNER JOIN	beneficiario t5  USING (codigo_beneficiario)
INNER JOIN	municipio 	 t6  USING (codigo_municipio)
INNER JOIN	info_uf 	 t7  USING (codigo_uf)
WHERE 		t5.cpf	 LIKE '%882932%';
