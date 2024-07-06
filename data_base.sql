/*database biblioteca API 1*/
CREATE DATABASE biblioteca
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Chile.1252'
    LC_CTYPE = 'Spanish_Chile.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


--API2

-- tabla lectores

CREATE TABLE lectores (
    id_lector SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE  NOT NULL,
    fecha_nacimiento DATE
);


-- tabla libros
CREATE TABLE libros (
    id_libro SERIAL PRIMARY KEY,
    nombre_libro VARCHAR(100) NOT NULL,
    nombre_editorial VARCHAR (100) NOT NULL,
    autor VARCHAR (100) NOT NULL,
    ISBN VARCHAR(30) UNIQUE NOT NULL
);


-- tabla Préstamos

CREATE TABLE prestamos (
    id_prestamo SERIAL PRIMARY KEY,
    id_lector INTEGER,
    id_libro INTEGER,
    fecha_prestamo TIMESTAMP NOT NULL,
    fecha_devolucion TIMESTAMP,
    FOREIGN KEY (id_lector) REFERENCES lectores(id_lector),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);



--inserción de datos en la tabla lectores


INSERT INTO lectores (nombre, apellido, email, fecha_nacimiento) VALUES
('Juan Alberto', 'Cortéz', 'juancortez@gmail.com', '1983-06-20'),
('Antonia', 'De los Ríos', 'antoniarios_23@yahoo.com', '1978-11-24'),
('Nicolás', 'Martin', 'nico_martin23@gmail.com', '1986-07-11'),
('Néstor', 'Casco', 'nestor_casco2331@hotmail.com', '1981-02-11'),
('Lisa', 'Pérez', 'lisperez@hotmail.com', '1964-08-11'),
('Ana Rosa', 'Estagnolli', 'anros@abcdatos.com', '1994-10-15'),
('Milagros', 'Pastoruti', 'mili_2231@gmail.com', '2001-01-22'),
('Pedro', 'Alonso', 'alonso.pedro@impermebilizantesrosario.com', '1983-09-05'),
('Arturo Ezequiel', 'Ramírez', 'artu.rama@outlook.com', '1998-03-29'),
('Juan Ignacio', 'Altarez', 'juanaltarez.223@yahoo.com', '1975-08-24');


--inserción de datos en la tabla lectores

INSERT INTO libros (nombre_libro, nombre_editorial, autor, ISBN) VALUES
('Cementerio de animales', 'Ediciones de Mente', 'Stephen King', 4568874),
('En el nombre de la rosa', 'Editorial España', 'Umberto Eco', 44558877),
('Cien años de soledad', 'Sudamericana', 'Gabriel García Márquez', 7788845),
('El diario de Ellen Rimbauer', 'Editorial Maine', 'Stephen King', 45699874),
('La hojarasca', 'Sudamericana', 'Gabriel García Márquez', 7787898),
('El amor en los tiempos del cólera', 'Sudamericana', 'Gabriel García Márquez', 2564111),
('La casa de los espíritus', 'Ediciones Chile', 'Isabel Allende', 5544781),
('Paula', 'Ediciones Chile', 'Isabel Allende', 22545447),
('La tregua', 'Alfa', 'Mario Benedetti', 2225412),
('Gracias por el fuego', 'Alfa', 'Mario Benedetti', 88541254);

-- Consultas:
SELECT * FROM lectores;
SELECT * FROM libros;
SELECT * from prestamos;



-- API 3
-- Inserción de datos en la tabla préstamos

-- 4 lectores tengan en préstamos 5 libros
INSERT INTO prestamos (id_lector, id_libro, fecha_prestamo) VALUES
(1, 4, CURRENT_DATE),(1, 2, CURRENT_DATE),(1, 5, CURRENT_DATE),(1, 8, CURRENT_DATE),(1, 6, CURRENT_DATE),
(2, 1, CURRENT_DATE),(2, 3, CURRENT_DATE),(2, 6, CURRENT_DATE),(2, 4, CURRENT_DATE),(2, 9, CURRENT_DATE),
(3, 1, CURRENT_DATE),(3, 10, CURRENT_DATE),(3, 3, CURRENT_DATE),(3, 5, CURRENT_DATE),(3, 6, CURRENT_DATE),
(4, 10, CURRENT_DATE),(4, 5, CURRENT_DATE),(4, 6, CURRENT_DATE),(4, 1, CURRENT_DATE),(4, 8, CURRENT_DATE),

-- 3 lectores tengan en préstamo 3 libros
(5, 1, CURRENT_DATE),(5, 6, CURRENT_DATE),(5, 8, CURRENT_DATE),
(7, 10, CURRENT_DATE),(7, 9, CURRENT_DATE),(7, 6, CURRENT_DATE),
(8, 3, CURRENT_DATE),(8, 4, CURRENT_DATE),(8, 5, CURRENT_DATE),

-- 2 lectores en préstamo 1 libro
(9, 1, CURRENT_DATE),
(10, 8, CURRENT_DATE);




