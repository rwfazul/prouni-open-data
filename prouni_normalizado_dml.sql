USE prouni2016;

-- INFO_IES
INSERT INTO     info_ies (codigo_emec_ies, nome_ies_bolsa) 
SELECT DISTINCT codigo_emec_ies_bolsa, nome_ies_bolsa 
FROM            bolsa_desnormalizado;

-- CURSO
INSERT INTO     curso (modalidade_ensino, codigo_emec_ies, nome_curso, turno)
SELECT DISTINCT modalidade_ensino_bolsa, codigo_emec_ies_bolsa, nome_curso_bolsa, nome_turno_curso_bolsa
FROM            bolsa_desnormalizado;

-- INFO_UF
INSERT INTO     info_uf (regiao, sigla)
SELECT DISTINCT regiao_beneficiario_bolsa, sigla_uf_beneficiario_bolsa
FROM            bolsa_desnormalizado;

-- MUNICIPIO
INSERT INTO     municipio (nome_municipio, codigo_uf)
SELECT DISTINCT t1.municipio_beneficiario_bolsa, t2.codigo_uf
FROM            bolsa_desnormalizado AS t1
INNER JOIN      info_uf              AS t2 ON t2.sigla = t1.sigla_uf_beneficiario_bolsa;

-- RAÇA
INSERT INTO     `raça` (raca)
SELECT DISTINCT raca_beneficiario_bolsa  
FROM            bolsa_desnormalizado;

-- TIPO_BOLSA
INSERT INTO     tipo_bolsa (tipo_bolsa)
SELECT DISTINCT tipo_bolsa
FROM            bolsa_desnormalizado;

-- BENEFICARIO  **DISTINCT importante (mesmo beneficiario presente em + de um registro)**
INSERT INTO     beneficiario (cpf, sexo, codigo_raca, dt_nascimento, deficiente_fisico, codigo_municipio)
SELECT DISTINCT t1.cpf_beneficiario_bolsa, t1.sexo_beneficiario_bolsa, t2.codigo_raca, t1.dt_nascimento_beneficiario, t1.beneficiario_deficiente_fisico, t3.codigo_municipio
FROM            bolsa_desnormalizado AS t1 
INNER JOIN      `raça`               AS t2 ON t2.raca           = t1.raca_beneficiario_bolsa
INNER JOIN      municipio            AS t3 ON t3.nome_municipio = t1.municipio_beneficiario_bolsa;

-- BOLSA_PROUNI
INSERT INTO     bolsa_prouni(ano_concessao, codigo_tipo, codigo_curso, codigo_beneficiario)
SELECT          t1.ano_concessao_bolsa, t2.codigo_tipo, t3.codigo_curso, t4.codigo_beneficiario
FROM            bolsa_desnormalizado AS t1
INNER JOIN      tipo_bolsa           AS t2 ON t2.tipo_bolsa        = t1.tipo_bolsa
INNER JOIN      curso                AS t3 ON t3.modalidade_ensino = t1.modalidade_ensino_bolsa
AND             t3.nome_curso      = t1.nome_curso_bolsa 
AND             t3.turno           = t1.nome_turno_curso_bolsa
AND             t3.codigo_emec_ies = t1.codigo_emec_ies_bolsa 
INNER JOIN      beneficiario         AS t4 ON t4.cpf               = t1.cpf_beneficiario_bolsa
AND             t4.dt_nascimento   = t1.dt_nascimento_beneficiario;

/* DISTINCT em bolsa_prouni ira afetar 1999 linhas ao inves de 2000 (numero de registros prouni_tabelao)
MOTIVO: Existe um registro duplicado do (cpf: **475191**) no .csv 

TESTE (retorna registros duplicados):
select ano_concessao, codigo_tipo, codigo_curso, codigo_beneficiario, count(*) as soma
from (select * from bolsa_prouni) tab
group by ano_concessao, codigo_tipo, codigo_curso, codigo_beneficiario
having soma > 1; 

select ano_concessao_bolsa, codigo_emec_ies_bolsa, nome_ies_bolsa, tipo_bolsa, modalidade_ensino_bolsa, 
    nome_curso_bolsa, nome_turno_curso_bolsa, cpf_beneficiario_bolsa, sexo_beneficiario_bolsa,    
    raca_beneficiario_bolsa, dt_nascimento_beneficiario, beneficiario_deficiente_fisico, 
    regiao_beneficiario_bolsa, sigla_uf_beneficiario_bolsa, municipio_beneficiario_bolsa, count(*) as soma
from (select * from bolsa_desnormalizado) tab
group by ano_concessao_bolsa, codigo_emec_ies_bolsa, nome_ies_bolsa, tipo_bolsa, modalidade_ensino_bolsa, 
    nome_curso_bolsa, nome_turno_curso_bolsa, cpf_beneficiario_bolsa, sexo_beneficiario_bolsa,    
    raca_beneficiario_bolsa, dt_nascimento_beneficiario, beneficiario_deficiente_fisico, 
    regiao_beneficiario_bolsa, sigla_uf_beneficiario_bolsa, municipio_beneficiario_bolsa
having soma > 1; 

-- SHOW TABLE STATUS LIKE 'bolsa_prouni';
*/