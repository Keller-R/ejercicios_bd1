/* Crear base de datos dbGamarraMarket */
DROP DATABASE IF EXISTS dbGamarraMarketMejorado;
CREATE DATABASE dbGamarraMarketmejorado
DEFAULT CHARACTER SET utf8;

/* Poner en uso la base de datos dbGamarraMarket1 */
USE dbGamarraMarketMejorado;

/* Crear la tabla CLIENTE */
CREATE TABLE CLIENTE
(
id int AUTO_INCREMENT,
tipo_documento char(3),
numero_documento char(9),
nombres varchar(60),
apellidos varchar(90),
email varchar(80),
celular char(9),
fecha_nacimiento date,
activo bool DEFAULT 1,
CONSTRAINT cliente_pk PRIMARY KEY (id)
);

/* Listar estructura de tabla CLIENTE */
SHOW COLUMNS IN CLIENTE;

/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;

CREATE TABLE VENDEDOR
(
id int AUTO_INCREMENT,
tipo_documento char(3),
numero_documento char(9),
nombres varchar(60),
apellidos varchar(90),
email varchar(80),
celular char(9),
salario decimal(8,2),
activo bool DEFAULT 1,
CONSTRAINT vendedor_pk PRIMARY KEY (id)
);
SHOW TABLES;



CREATE TABLE VENTA
(
id int AUTO_INCREMENT,
fecha_hora datetime DEFAULT NOW(),
activo bool DEFAULT 1,
CONSTRAINT venta_pk PRIMARY KEY (id) 
);

SHOW TABLES;

CREATE TABLE PRENDA
(
id int AUTO_INCREMENT,
descripcion varchar (90),
marca varchar (60),
cantidad int,
talla varchar(10),
precio decimal (8,2),
activo bool DEFAULT 1,
CONSTRAINT prenda_pk PRIMARY KEY (id)
);

SHOW TABLES;

CREATE TABLE VENTA_DETALLE
(
id int AUTO_INCREMENT,
cantidad int,
CONSTRAINT venta_detalle_pk PRIMARY KEY (id)
);
SHOW COLUMNS IN VENTA_DETALLE;
SHOW TABLES;
/* Crear relación VENTA_CLIENTE */
ALTER TABLE VENTA_DETALLE
ADD COLUMN prenda_id int,
ADD CONSTRAINT fk_venta_detalle_prenda
FOREIGN KEY (prenda_id)
REFERENCES PRENDA(id);

ALTER TABLE VENTA
ADD COLUMN cliente_id int,
ADD CONSTRAINT fk_venta_cliente
FOREIGN KEY (cliente_id)
REFERENCES CLIENTE(id);

ALTER TABLE VENTA
ADD COLUMN vendedor_id int,
ADD CONSTRAINT fk_venta_vendedor
FOREIGN KEY (vendedor_id)
REFERENCES VENDEDOR(id);

ALTER TABLE VENTA_DETALLE
ADD COLUMN venta_id int,
ADD CONSTRAINT fk_venta_detale_venta
FOREIGN KEY (venta_id)
REFERENCES VENTA(id);



/* Listar relaciones de tablas de la base de datos activa */
SELECT 
 i.constraint_name, k.table_name, k.column_name, 
 k.referenced_table_name, k.referenced_column_name
FROM 
 information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();


/* IMPLEMENTACIO DE MEJORAS EN COMPARACION A LA BASE DE DATOS ANTERIOR:
ID CON INCREMENTO POR DEFECTO
HORA Y FECHA POR DEFECTO
ACTIVO SE DEFINE 1 COMO ACTIVO Y 0 COMO INACTIVO EL CUAL SE PUEDE CAMBIAR DE ACUERDO A LO QUE SE SOLICITE
