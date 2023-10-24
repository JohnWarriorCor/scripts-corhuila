---------------------------
--------TABLA NORMA GRUPO--------
---------------------------
CREATE TABLE general.norma_grupo (
    nog_codigo SERIAL PRIMARY KEY,
    nog_nombre varchar(100) NOT NULL,
    nog_estado int DEFAULT 1 NOT NULL
);
--Grupos clasificación

INSERT INTO general.norma_grupo
(nog_nombre)
VALUES('GRUPO UNO');

INSERT INTO general.norma_grupo
(nog_nombre)
VALUES('GRUPO DOS');

INSERT INTO general.norma_grupo
(nog_nombre)
VALUES('GRUPO TRES');

select * from general.norma_grupo
--------------------------------
--------TABLA NORMA CLASIFICADA-------
--------------------------------
CREATE TABLE general.norma_clasificada (
    noc_codigo SERIAL PRIMARY KEY,
    nor_codigo int NOT NULL,
    nog_codigo int NOT NULL,
    noc_estado int DEFAULT 1 NOT null,
    CONSTRAINT norma_clasificada_FK_norma FOREIGN KEY (nor_codigo) REFERENCES general.norma(nor_codigo),
    CONSTRAINT norma_clasificada_FK_norma_grupo FOREIGN KEY (nog_codigo) REFERENCES general.norma_grupo(nog_codigo)
);
--RELACION NORMA GRUPO CLASIFICACIÓN


select * from general.norma_clasificada

INSERT INTO general.norma_clasificada
(nor_codigo, nog_codigo)
VALUES(0, 0);


UPDATE general.norma_clasificada
SET noc_estado=
WHERE noc_codigo=;

SELECT * FROM general.norma n  
inner join general.norma_entidad ne on n.noe_codigo = ne.noe_codigo 
inner join general.norma_tipo nt on n.not_codigo = nt.not_codigo 
inner join general.norma_medio nm on n.nom_codigo = nm.nom_codigo 
left join general.cuerpos_colegiados cc on n.cuc_codigo = cc.cuc_codigo 
left join general.entidad_externa ee on n.ene_codigo = ee.ene_codigo
WHERE NOT EXISTS ( SELECT * FROM general.norma_clasificada nc WHERE n.nor_codigo = nc.nor_codigo and nc.noc_estado = 1 and nc.nog_codigo = 4);

select * from norma_grupo ng 
select * from norma_clasificada nc 

select * from general.norma_clasificada nc 
inner join general.norma n on nc.nor_codigo = n.nor_codigo 
inner join general.norma_grupo ng on nc.nog_codigo = ng.nog_codigo 
inner join general.norma_tipo nt on n.not_codigo = nt.not_codigo 
inner join general.norma_medio nm on n.nom_codigo = nm.nom_codigo 
left join general.cuerpos_colegiados cc on n.cuc_codigo = cc.cuc_codigo 
left join general.entidad_externa ee on n.ene_codigo = ee.ene_codigo
where nc.nog_codigo = 1 and nc.noc_estado = 1


select * from norma_clasificada nc 

select cc.cuc_codigo, cc.cuc_nombre, cc.cuc_cantidad_miembros, count(icc.icc_estado) as asignados from general.cuerpos_colegiados cc
left join general.integrante_cuerpo_colegiado icc on cc.cuc_codigo = icc.cuc_codigo and icc.icc_estado = 1
where cc.cuc_estado = 1
group by cc.cuc_nombre, cc.cuc_cantidad_miembros,cc.cuc_codigo
having COUNT(icc.icc_estado) < 6

select ng.nog_codigo, ng.nog_nombre, count(nc.nor_codigo) as nog_cantidad from general.norma_grupo ng 
left join general.norma_clasificada nc on ng.nog_codigo = nc.nog_codigo and nc.noc_estado = 1
where ng.nog_estado = 1
group by ng.nog_codigo ,ng.nog_nombre 


select * from general.norma_grupo ng where ng.nog_estado = 1 order by ng.nog_codigo 



INSERT INTO general.norma_grupo
(nog_nombre)
VALUES('');

UPDATE general.norma_grupo
SET nog_nombre=, nog_estado=
WHERE nog_codigo=;