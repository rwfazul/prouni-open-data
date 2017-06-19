DROP DATABASE IF EXISTS prouni2016;
CREATE DATABASE IF NOT EXISTS prouni2016 DEFAULT CHARACTER SET = utf8;
USE prouni2016;

CREATE TABLE IF NOT EXISTS bolsa_desnormalizado (
    codigo_registro_bolsa           INT NOT NULL AUTO_INCREMENT,
    ano_concessao_bolsa             INT NOT NULL,
    codigo_emec_ies_bolsa           INT NOT NULL,
    nome_ies_bolsa                  VARCHAR(100) NOT NULL,
    tipo_bolsa                      VARCHAR(30) NOT NULL,
    modalidade_ensino_bolsa         VARCHAR(30) NOT NULL,
    nome_curso_bolsa                VARCHAR(100) NOT NULL,
    nome_turno_curso_bolsa          VARCHAR(20) NOT NULL,
    cpf_beneficiario_bolsa          VARCHAR(20) NOT NULL,
    sexo_beneficiario_bolsa         VARCHAR(15) NOT NULL,
    raca_beneficiario_bolsa         VARCHAR(15) NOT NULL,
    dt_nascimento_beneficiario      DATE NOT NULL,
    beneficiario_deficiente_fisico  VARCHAR(3) NOT NULL,    
    regiao_beneficiario_bolsa       VARCHAR(15) NOT NULL,
    sigla_uf_beneficiario_bolsa     VARCHAR(2) NOT NULL,
    municipio_beneficiario_bolsa    VARCHAR(60) NOT NULL,
    PRIMARY KEY (codigo_registro_bolsa)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;