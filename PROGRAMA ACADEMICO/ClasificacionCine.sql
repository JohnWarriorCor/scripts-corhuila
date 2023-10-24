--- CAMPO AMPLIO CINE
CREATE TABLE general.campo_amplio_cine (
    cac_codigo SERIAL PRIMARY KEY,
    cac_nombre varchar(150) NOT NULL,
    cac_cine varchar(10) NOT NULL,
    cac_estado int DEFAULT 1 NOT NULL
);

select * from general.campo_amplio_cine cac where cac.cac_estado = 1

INSERT INTO general.campo_amplio_cine
(cac_nombre, cac_cine)
VALUES('', '');


UPDATE general.campo_amplio_cine
SET cac_nombre='', cac_cine='', cac_estado=1
WHERE cac_codigo=;

--- CAMPO ESPECÍFICO CINE
CREATE TABLE general.campo_especifico_cine (
    cec_codigo SERIAL PRIMARY KEY,
    cac_codigo int NOT NULL,
    cec_nombre varchar(50) NOT NULL,
    cec_cine varchar(10) NOT NULL,
    cec_estado int DEFAULT 1 NOT NULL,
    CONSTRAINT campo_especifico_cine_FK_campo_amplio_cine FOREIGN KEY (cac_codigo) REFERENCES general.campo_amplio_cine(cac_codigo)
);

select * from general.campo_especifico_cine cec 
left join general.campo_amplio_cine cac on cec.cac_codigo = cac.cac_codigo 
where cec.cec_estado = 1


INSERT INTO general.campo_especifico_cine
(cac_codigo, cec_nombre, cec_cine)
VALUES(0, '', '');

UPDATE general.campo_especifico_cine
SET cac_codigo=0, cec_nombre='', cec_cine='', cec_estado=1
WHERE cec_codigo=;

--- CAMPO DETALLADO CINE
CREATE TABLE general.campo_detallado_cine (
    cdc_codigo SERIAL PRIMARY KEY,
    cec_codigo int NOT NULL,
    cdc_nombre varchar(50) NOT NULL,
    cdc_cine varchar(10) NOT NULL,
    cdc_estado int DEFAULT 1 NOT NULL,
    CONSTRAINT campo_detallado_cine_FK_campo_especifico_cine FOREIGN KEY (cec_codigo) REFERENCES general.campo_especifico_cine(cec_codigo)
);

select * from general.campo_detallado_cine cdc 
left join general.campo_especifico_cine cec on cdc.cec_codigo = cec.cec_codigo 
left join general.campo_amplio_cine cac on cec.cac_codigo = cac.cac_codigo 
where cdc.cdc_estado = 1


INSERT INTO general.campo_detallado_cine
(cec_codigo, cdc_nombre, cdc_cine)
VALUES(0, '', '');


UPDATE general.campo_detallado_cine
SET cec_codigo=0, cdc_nombre='', cdc_cine='', cdc_estado=1
WHERE cdc_codigo=;