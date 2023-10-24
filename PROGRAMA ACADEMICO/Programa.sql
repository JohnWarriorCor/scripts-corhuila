--- TABLA CICLOS PROPEDEUTICOS
CREATE TABLE general.ciclo_propedeutico (
    cip_codigo SERIAL PRIMARY KEY,
    cip_nombre varchar(10) NOT NULL,
    cip_estado int DEFAULT 1 NOT NULL
);

INSERT INTO general.ciclo_propedeutico
(cip_nombre)
VALUES('SI');
INSERT INTO general.ciclo_propedeutico
(cip_nombre)
VALUES('NO');

--TABLA NIVEL ACADÉMICO
CREATE TABLE general.nivel_academico (
    nia_codigo SERIAL PRIMARY KEY,
    nia_nombre varchar(100) NOT NULL,
    nia_estado int DEFAULT 1 NOT null
);

INSERT INTO general.nivel_academico
(nia_nombre)
VALUES('PREGRADO');

INSERT INTO general.nivel_academico
(nia_nombre)
VALUES('POSGRADO');

select * from general.nivel_academico na 

--TABLA NIVEL FORMACIÓN
CREATE TABLE general.nivel_formacion (
    nif_codigo SERIAL PRIMARY KEY,
    nia_codigo int not null,
    nif_nombre varchar(150) NOT NULL,
    nif_estado int DEFAULT 1 NOT null,
    CONSTRAINT nivel_formacion_FK_nivel_academico FOREIGN KEY (nia_codigo) REFERENCES general.nivel_academico(nia_codigo)
);

select * from nivel_formacion nf

select * from general.nivel_formacion nf 
inner join nivel_academico na on nf.nia_codigo = na.nia_codigo 
where nf.nia_codigo = 1

--TABLA MODALIDAD
CREATE TABLE general.modalidad (
    mod_codigo SERIAL PRIMARY KEY,
    mod_nombre varchar(100) NOT NULL,
    mod_estado int DEFAULT 1 NOT NULL
);

INSERT INTO general.modalidad
(mod_nombre)
VALUES('PRESENCIAL');

INSERT INTO general.modalidad
(mod_nombre)
VALUES('VIRTUAL');

INSERT INTO general.modalidad
(mod_nombre)
VALUES('A DISTANCIA');

INSERT INTO general.modalidad
(mod_nombre)
VALUES('DUAL');

select * from general.modalidad m 

--TIEMPO DURACION
CREATE TABLE general.tiempo_duracion (
    tid_codigo SERIAL PRIMARY KEY,
    tid_nombre varchar(100) NOT NULL,
    tid_estado int DEFAULT 1 NOT NULL
);

INSERT INTO general.tiempo_duracion
(tid_nombre)
VALUES('AÑO(S)');

INSERT INTO general.tiempo_duracion
(tid_nombre)
VALUES('SEMESTRE(S)');


--TIEMPO ADMISION
CREATE TABLE general.tiempo_admision (
    tia_codigo SERIAL PRIMARY KEY,
    tia_nombre varchar(100) NOT NULL,
    tia_estado int DEFAULT 1 NOT NULL
);

INSERT INTO general.tiempo_admision
(tia_nombre)
VALUES('ANUAL');

INSERT INTO general.tiempo_admision
(tia_nombre)
VALUES('SEMESTRAL');

INSERT INTO general.tiempo_admision
(tia_nombre)
VALUES('BIEMESTRAL');

INSERT INTO general.tiempo_admision
(tia_nombre)
VALUES('TRIMESTRAL');

select * from general.tiempo_admision ta 

--TABLA AREA DEL CONOCIMIENTO
CREATE TABLE general.area_conocimiento (
    arc_codigo SERIAL PRIMARY KEY,
    arc_nombre varchar(150) NOT NULL,
    arc_estado int DEFAULT 1 NOT NULL
);

select * from general.area_conocimiento ac where ac.arc_estado = 1

--TABLA NBC : nucleo basi cono
CREATE TABLE general.nbc (
    nbc_codigo SERIAL PRIMARY KEY,
    arc_codigo int not null,
    nbc_cod int not null,
    nbc_nombre varchar(150) NOT NULL,
    nbc_estado int DEFAULT 1 NOT null,
    CONSTRAINT nbc_FK_area_conocimiento FOREIGN KEY (arc_codigo) REFERENCES general.area_conocimiento(arc_codigo)
);

select * from general.nbc n 
inner join general.area_conocimiento ac on n.arc_codigo = ac.arc_codigo 
where n.arc_codigo = 

select * from general.nbc n 


--TABLA ESTADO SNIES
CREATE TABLE general.estado_snies (
    ess_codigo SERIAL PRIMARY KEY,
    ess_nombre varchar(100) NOT NULL,
    ess_estado int DEFAULT 1 NOT NULL
);

--TABLA PROGRAMA
CREATE TABLE general.programa (
    pro_codigo SERIAL PRIMARY KEY,
    pro_codigo_snies int not null,
    cip_codigo int not null,
    nif_codigo int not null,
    mod_codigo int not null,
    nbc_codigo int not null,
    fac_codigo int not null,
    pro_nombre varchar(150) NOT NULL,
    pro_titulo_otorgado varchar(150) NOT NULL,
    pro_numero_creditos int not null,
    tid_codigo int not null,
    pro_duracion int not null,
    tia_codigo int not null,
    pro_numero_cupos int not null,
    pro_sitio_web varchar(150) NOT NULL,
    nor_codigo int not null,
    pro_convenio int not null,
    cdc_codigo int not null,
    pro_fecha_creacion date not NULL,
    pro_fecha_registro_snies date not NULL,
    pro_estado int DEFAULT 1 NOT null,
    CONSTRAINT programa_FK_ciclo_propedeutico FOREIGN KEY (cip_codigo) REFERENCES general.ciclo_propedeutico(cip_codigo),
    CONSTRAINT programa_FK_nivel_formacion FOREIGN KEY (nif_codigo) REFERENCES general.nivel_formacion(nif_codigo),
    CONSTRAINT programa_FK_modalidad FOREIGN KEY (mod_codigo) REFERENCES general.modalidad(mod_codigo),
    CONSTRAINT programa_FK_nbc FOREIGN KEY (nbc_codigo) REFERENCES general.nbc(nbc_codigo),
    CONSTRAINT programa_FK_facultad FOREIGN KEY (fac_codigo) REFERENCES general.facultad(fac_codigo),
    CONSTRAINT programa_FK_tiempo_duracion FOREIGN KEY (tid_codigo) REFERENCES general.tiempo_duracion(tid_codigo),
    CONSTRAINT programa_FK_tiempo_admision FOREIGN KEY (tia_codigo) REFERENCES general.tiempo_admision(tia_codigo),
    CONSTRAINT programa_FK_norma FOREIGN KEY (nor_codigo) REFERENCES general.norma(nor_codigo),
    CONSTRAINT programa_FK_campo_detallado_cine FOREIGN KEY (cdc_codigo) REFERENCES general.campo_detallado_cine(cdc_codigo)
);


select * from general.programa p 
inner join general.ciclo_propedeutico cp on p.cip_codigo = cp.cip_codigo 
inner join general.nivel_formacion nf on p.nif_codigo = nf.nif_codigo 
inner join general.nivel_academico na on nf.nia_codigo = na.nia_codigo 
inner join general.modalidad m on p.mod_codigo = m.mod_codigo 
inner join general.nbc n on p.nbc_codigo = n.nbc_codigo 
inner join general.area_conocimiento ac on n.arc_codigo = ac.arc_codigo 
inner join general.facultad f on p.fac_codigo = f.fac_codigo 
inner join general.sede s on f.sed_codigo = s.sed_codigo 
inner join general.sede_tipo st on s.set_tipo = st.set_codigo 
inner join general.cabeceras_centros_poblados ccp on s.ccp_divipola = ccp.ccp_divipola 
inner join general.municipio m2 on ccp.mun_divipola = m2.mun_divipola 
inner join general.departamento d on m2.dep_divipola = d.dep_divipola 
inner join general.pais p2 on d.pai_codigo = p2.pai_codigo 
inner join general.tiempo_duracion td on p.tid_codigo = td.tid_codigo 
inner join general.tiempo_admision ta on p.tia_codigo = ta.tia_codigo 
inner join general.norma nr on p.nor_codigo = nr.nor_codigo 
inner join general.campo_detallado_cine cdc on p.cdc_codigo = cdc.cdc_codigo 
where p.pro_estado = 1


select * from general.programa p 
