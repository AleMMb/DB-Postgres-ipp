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
    id_lector SERIAL PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    apellido VARCHAR (50) NOT NULL,
    email VARCHAR (80) UNIQUE  NOT NULL,
    fecha_nacimeinto DATE
);


// tabla libros
CREATE TABLE libros (
    id_libro SERIAL PRIMARY KEY,
    nombre_libro VARCHAR NOT NULL (150),
    nombre_editorial VARCHAR NOT NULL (150),
    autor VARCHAR NOT NULL (150),
    ISBN VARCHAR(30) UNIQUE NOT NULL
);


//tabla Préstamos

CREATE TABLE prestamos (
    id_prestamo SERIAL PRIMARY KEY,
    id_lector INTEGER,
    id_libro INTEGER,
    fecha_prestamo NOT NULL DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (id_lector) REFERENCES lectores(id_lector),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);