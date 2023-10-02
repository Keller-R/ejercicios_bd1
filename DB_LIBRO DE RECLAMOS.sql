DROP DATABASE IF EXISTS libroReclamos;
CREATE DATABASE libroReclamos 
DEFAULT CHARACTER SET utf8;

USE libroReclamos;

CREATE TABLE RECLAMOS
(
 id int ,
 fecha_presentacion datetime,
 nombre_demandante varchar(60),
 apellido_demandante varchar(60),
 motivo varchar(300),
 descripcion varchar(350),
 estado varchar(50),
 observaciones varchar(300),
 CONSTRAINT reclamos_pk PRIMARY KEY (id)
);

SHOW COLUMNS IN RECLAMOS;

CREATE TABLE RESPUESTAS
(
id int,
fecha_atencion timestamp,
nombre_respondiente varchar(60),
tipo_respondiente varchar(60),
descripcion_respuesta varchar(300),
reclamos_id int,
CONSTRAINT respuestas_pk PRIMARY KEY (id)
);

SHOW COLUMNS IN RESPUESTAS;

ALTER TABLE RECLAMOS
ADD COLUMN respuestas_id int,
ADD CONSTRAINT fk_reclamos_respuestas
FOREIGN KEY (respuestas_id)
REFERENCES RESPUETAS(id);


SELECT 
i.constraint_name, k.table_name, k.column_name, 
k.referenced_table_name, k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();

