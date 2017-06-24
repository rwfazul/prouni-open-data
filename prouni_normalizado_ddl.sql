CREATE DATABASE IF NOT EXISTS prouni2016 DEFAULT CHARACTER SET = utf8;
USE prouni2016;

DROP TABLE IF EXISTS bolsa_prouni;
DROP TABLE IF EXISTS beneficiario;
DROP TABLE IF EXISTS tipo_bolsa;
DROP TABLE IF EXISTS `raça`;
DROP TABLE IF EXISTS municipio;
DROP TABLE IF EXISTS info_uf;
DROP TABLE IF EXISTS curso;
DROP TABLE IF EXISTS info_ies;

CREATE TABLE IF NOT EXISTS info_ies (
    codigo_emec_ies     INT          NOT NULL,
    nome_ies_bolsa      VARCHAR(100) NOT NULL,
    PRIMARY KEY (codigo_emec_ies)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS curso (
    codigo_curso        INT          NOT NULL AUTO_INCREMENT,
    codigo_emec_ies     INT          NOT NULL,
    modalidade_ensino   VARCHAR(30)  NOT NULL,
    nome_curso          VARCHAR(100) NOT NULL,
    turno               VARCHAR(20)  NOT NULL,
    PRIMARY KEY (codigo_curso, codigo_emec_ies),
    FOREIGN KEY (codigo_emec_ies) REFERENCES info_ies(codigo_emec_ies)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS info_uf (
    codigo_uf   INT         NOT NULL AUTO_INCREMENT,
    regiao      VARCHAR(15) NOT NULL,
    sigla       VARCHAR(2)  NOT NULL,
    PRIMARY KEY (codigo_uf)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS municipio (
    codigo_municipio    INT         NOT NULL AUTO_INCREMENT,
    nome_municipio      VARCHAR(60) NOT NULL,
    codigo_uf           INT         NOT NULL,
    PRIMARY KEY (codigo_municipio),
    FOREIGN KEY (codigo_uf) REFERENCES info_uf (codigo_uf)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `raça` (
    codigo_raca     INT         NOT NULL AUTO_INCREMENT,
    raca            VARCHAR(15) NOT NULL,
    PRIMARY KEY (codigo_raca)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS tipo_bolsa (
    codigo_tipo      INT         NOT NULL AUTO_INCREMENT,	
    tipo_bolsa       VARCHAR(30) NOT NULL,
    PRIMARY KEY (codigo_tipo)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS beneficiario (
    codigo_beneficiario	INT         NOT NULL AUTO_INCREMENT,
    cpf                 VARCHAR(20) NOT NULL,
    sexo                VARCHAR(15) NOT NULL,
    codigo_raca         INT         NOT NULL,
    dt_nascimento       DATE        NOT NULL,
    deficiente_fisico   VARCHAR(3)  NOT NULL,
    codigo_municipio    INT         NOT NULL,
    PRIMARY KEY (codigo_beneficiario),
    FOREIGN KEY (codigo_raca)      REFERENCES `raça`    (codigo_raca),
    FOREIGN KEY (codigo_municipio) REFERENCES municipio (codigo_municipio)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS bolsa_prouni (
    codigo_bolsa_prouni     INT NOT NULL AUTO_INCREMENT,
    ano_concessao           INT NOT NULL,
    codigo_tipo             INT NOT NULL,
    codigo_curso            INT NOT NULL,
    codigo_beneficiario     INT NOT NULL,
    PRIMARY KEY (codigo_bolsa_prouni),
    FOREIGN KEY (codigo_tipo)         REFERENCES tipo_bolsa   (codigo_tipo),
    FOREIGN KEY (codigo_curso)        REFERENCES curso        (codigo_curso),
    FOREIGN KEY (codigo_beneficiario) REFERENCES beneficiario (codigo_beneficiario)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;