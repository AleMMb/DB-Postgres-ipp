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