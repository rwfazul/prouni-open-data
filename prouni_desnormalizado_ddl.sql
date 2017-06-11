DROP DATABASE IF EXISTS prouni2016;
CREATE DATABASE IF NOT EXISTS prouni2016;
USE prouni2016;

CREATE TABLE IF NOT EXISTS prouniTabelao (
    ano_concessao_bolsa             INT,
    codigo_emec_ies_bolsa           INT,
    nome_ies_bolsa                  VARCHAR(100),
    tipo_bolsa                      VARCHAR(30),
    modalidade_ensino_bolsa         VARCHAR(30),
    nome_curso_bolsa                VARCHAR(60),
    nome_turno_curso_bolsa          VARCHAR(20),
    cpf_beneficiario_bolsa          VARCHAR(20),
    sexo_beneficiario_bolsa         VARCHAR(15),
    raca_beneficiario_bolsa         VARCHAR(15),
    dt_nascimento_beneficiario      DATE,
    beneficiario_deficiente_fisico  VARCHAR(5),
    regiao_beneficiario_bolsa       VARCHAR(15),
    sigla_uf_beneficiario_bolsa     VARCHAR(2),
    municipio_beneficiario_bolsa    VARCHAR(60)
);

