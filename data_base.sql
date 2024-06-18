CREATE DATABASE biblioteca
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Chile.1252'
    LC_CTYPE = 'Spanish_Chile.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

    /*database biblioteca API 1*/


    /*API 2 */

    //tabla lectores

CREATE TABLE lectores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR (50),
    apellido VARCHAR (50),
    email VARCHAR (80) PRIMARY KEY,
    fecha_nacimeinto DATE
);


// tabla libros
CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    nombre_libro VARCHAR (150),
    nombre_editorial VARCHAR (150),
    autor VARCHAR (150),
    ISBN VARCHAR(30) 
);
