-- ejemplos de base de datos modelo de datos en


CREATE DATABASE clase_practica
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Chile.1252'
    LC_CTYPE = 'Spanish_Chile.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


-- Clase 3 24/06/2024 Módulo2 primera clase.

-- SGBD.
-- SQL structure query lenguaje, permite hacer consiltas en una BD, universal. Es parte de la definición de COOD.
-- COOD: Consistencia, Orthogonality, Optimización, Data Integrity.
-- DBA.
-- DBMS: Database Management System.
-- DBMS: Oracle, PostgreSQL, MySQL, SQL Server, MongoDB, Cassandra, Redis.
-- SQL: Structured Query Language.
-- DDL: Data Definition Language.
-- DML: Data Manipulation Language.
-- DQL: Data Query Language.
-- TCL: Transaction Control Language.

-- DBA: Database Administrator --> define estructuras, perfiles de seguridad, respaldo, implemntar integridar, definir procedimeintos, monitorear.


-- Clase 4 01/07/2024

--INICIO:
(ID_orden, fecha, id_cliente, nom_cliente, estado, num_art, nom_art, cant, precio)

-- Primera forma formal. 
-- Eliminar grupos o datos repetidos.
-- 0 datos duplicados y datos atomicos.

Ordenes: {ID_orden (pk), fecha, id_cliente, nom_cliente, estado}
Detalle: {ID_detalle (pk), ID_orden(fk), num_art, nom_art, cant, precio}

--Segunda forma normal.
-- Eliminacion de las dependencias parciales. (un valor no puede depender de la PK o parte de ella)
Ordenes: {ID_orden (pk), fecha, id_cliente, nom_cliente, estado}
Detalle: {ID_detalle (pk), ID_orden(fk), num_art, nom_art, cant, precio}
--explicacion: no hay dependencias parciales en ninguna de las tablas.

--Tercera forma normal.
-- Eliminacion de las dependencias transitivas. (cada taributo debe depender solamente de la PK)
Ordenes: {ID_orden (pk), fecha, id_cliente(fk)}
Cliente: {id_cliente(pk), nom_cliente, estado}
Detalle: {ID_detalle (pk), ID_orden(fk), num_art(fk), cant}
Articulos: {num_art(pk), nom_art, precio}

-- Forma normal Boyce Codd.
--Una tabla se considera en esta forma si y solo si cada determinate po atributo es una llave candidata.

--Cuarta forma normal (No tiene campos que se repitan y dependan de otros.)
-- en 3fn y no presenta dependencias multivaluadas no triviales.
-- esta modelo ya está en la cuarta forma normal.

CREATE TABLE cliente(
    id_cliente SERIAL PRIMARY KEY,
    nom_cliente VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

CREATE TABLE ordenes(
    id_orden SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE articulo (
    num_art SERIAL PRIMARY KEY,
    nom_art VARCHAR(50) NOT NULL,
    precio FLOAT NOT NULL
);

CREATE TABLE detalle(
    id_detalle SERIAL PRIMARY KEY,
    id_orden INTEGER NOT NULL,
    cant INTEGER NOT NULL,
    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
    FOREIGN KEY (num_art) REFERENCES articulos(num_art)
);