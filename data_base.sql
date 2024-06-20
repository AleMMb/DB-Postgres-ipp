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
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE  NOT NULL,
    fecha_nacimeinto DATE
);


// tabla libros
CREATE TABLE libros (
    id_libro SERIAL PRIMARY KEY,
    nombre_libro VARCHAR(100) NOT NULL,
    nombre_editorial VARCHAR (100) NOT NULL,
    autor VARCHAR (100) NOT NULL,
    ISBN VARCHAR(30) UNIQUE NOT NULL
);


//tabla Préstamos

CREATE TABLE prestamos (
    id_prestamo SERIAL PRIMARY KEY,
    id_lector INTEGER,
    id_libro INTEGER,
    fecha_prestamo TIMESTAMP NOT NULL,
    fecha_devolucion TIMESTAMP,
    FOREIGN KEY (id_lector) REFERENCES lectores(id_lector),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

// cambio de nombre del campo fecha de fecha_nacimiento en la tabla lectores
ALTER TABLE lectores RENAME COLUMN fecha_nacimeinto TO fecha_nacimiento;

//insersionde datos en la tabla lectores

INSERT INTO lectores (nombre, apellido, email, fecha_nacimiento) VALUES
("Juan Alberto", "Cortéz","juancortez@gmail.com", "1983-06-20");
("Antonia", "De los Ríos","antoniarios_23@yahoo.com", "1978-11-24");
("Nicolás", "Martin","nico_martin23@gmail.com", "1986-07-11");
("Néstor", "Casco","nestor_casco2331@hotmmail.com", "1981-02-11");
("Lisa", "Pérez","lisperez@hotmail.com", "1964-08-11");
("Ana Rosa", "Estagnolli","anros@abcdatos.com", "1994-10-15");
("Ana Rosa", "Estagnolli","anros@abcdatos.com", "1974-10-15");
("Milagros", "Pastoruti", "mili_2231@gmail.com", "2001-01-22");
("Pedro", "Alonso", "alonso.pedro@impermebilizantesrosario.com", "1983-09-05");
("Arturo Ezequiel", "Ramírez", "artu.rama@outlook.com",  "1998-03-29");
("Juan Ignacio", "Altarez", "juanaltarez.223@yahoo.com", "1975-08-24");


