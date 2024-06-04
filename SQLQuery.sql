-- CREAR BBDD
CREATE DATABASE Prueba;

CREATE DATABASE Prueba2;

USE Prueba;

DROP DATABASE Prueba2;

SELECT * FROM sys.databases;

ALTER DATABASE Prueba MODIFY NAME = NuevoNombre;

USE Prueba;
DROP DATABASE Prueba2;

SELECT * FROM sys.databases;

ALTER DATABASE Prueba MODIFY NAME = NuevoNombre;

-- 5 Tipos de Datos:
char -- ancho fijo
varchar -- ancho variable
text -- datos tipo texto
nchar -- se acomoda si son menos caracteres que los seteados, elimina espacios sobrantes
bit -- 0 y 1
int -- entero
bigint
decimal
numeric -- igual al decimal, pero admite enteros
money
float

-- 6 TABLAS
ALTER DATABASE NuevoNombre MODIFY NAME = Principal;
USE Principal;
CREATE TABLE Empleados(
id_empleado int,
nombre varchar(20),
apellido varchar(30),
edad numeric(2),
telefono numeric(10),
direccion varchar(100),
fecha_nacimiento date,
salario decimal(18,2)
);

-- 7 INSERTAR REGISTROS

EXEC sp_help empleados;

INSERT INTO Empleados 
VALUES (1, 'Jose', 'Salinas', 36, 4345588745, 'MEDINA 796, Gral Ram, ER, Argentina', '1989-05-14', 3000.00, 'SI' );

INSERT INTO Empleados 
VALUES (2, 'Pepe', 'Julian', 36, 4345588545, 'MEDINA 800, Gral Ram, ER, Argentina', '1989-05-14', 3000.02, 'SI' );

SELECT * FROM Empleados;

-- 8 RENOMBRAR Y ELIMINAR TABLAS
SELECT * FROM sys.tables;

SELECT nombre, apellido
FROM Empleados;

EXEC sp_rename 'Empleados', 'Usuarios'; -- CAMBIAR NOMBRE DE TABLA

SELECT nombre, apellido
FROM Usuarios;

EXEC sp_rename 'Usuarios', 'Empleados'; -- CAMBIAR NOMBRE DE TABLA
SELECT nombre, apellido
FROM Empleados;

CREATE DATABASE Prueba2;
USE Prueba2;
CREATE TABLE prueba(campo int);

SELECT * FROM prueba;

DROP TABLE prueba;

-- 9 WHERE
EXEC sp_rename 'Empleados', 'empleados'; -- CAMBIAR NOMBRE DE TABLA

insert into empleados values (1, 'Juan', 'Pérez', 25, 1234567890, 'Calle 123', '1978-06-15', 2500.00, 'SI');
insert into empleados values (2, 'María', 'López', 30, 9876543210, 'Avenida 456', '1980-03-20', 3000.00, 'SI');
insert into empleados values (3, 'Carlos', 'González', 28, 5555555555, 'Calle 789', '1979-11-10', 2800.00, 'SI');
insert into empleados values (4, 'Ana', 'Martínez', 35, 9998887770, 'Avenida 012', '1977-09-05', 3500.00, 'SI');
insert into empleados values (5, 'Pedro', 'Sánchez', 22, 1112223334, 'Calle 567', '1980-01-25', 2000.00, 'SI');
insert into empleados values (6, 'Laura', 'Ramírez', 31, 4444444444, 'Avenida 890', '1978-07-12', 3200.00, 'SI');
insert into empleados values (7, 'Luis', 'Torres', 29, 7777777777, 'Calle 345', '1979-04-18', 2700.00, 'SI');
insert into empleados values (8, 'Carmen', 'Hernández', 27, 6666666666, 'Avenida 678', '1980-02-03', 2600.00, 'SI');
insert into empleados values (9, 'Jorge', 'García', 33, 2223334445, 'Calle 901', '1977-12-27', 3400.00, 'SI');
insert into empleados values (10, 'Silvia', 'Lara', 24, 8889990000, 'Avenida 234', '1980-05-09', 2200.00, 'SI');
insert into empleados values (11, 'Roberto', 'Rojas', 26, 3334445556, 'Calle 567', '1979-02-14', 2400.00, 'SI');
insert into empleados values (12, 'Patricia', 'Cruz', 32, 2223334444, 'Avenida 890', '1978-08-21', 3100.00, 'SI');
insert into empleados values (13, 'Daniel', 'Gómez', 29, 5556667778, 'Calle 123', '1979-06-06', 2800.00, 'SI');
insert into empleados values (14, 'Sara', 'Vargas', 34, 6667778889, 'Avenida 456', '1977-04-01', 3300.00, 'SI');
insert into empleados values (15, 'Hugo', 'Orozco', 23, 9998887776, 'Calle 789', '1980-03-16', 2100.00, 'SI');

SELECT * FROM dbo.empleados;

SELECT * 
FROM empleados
WHERE nombre = 'Jorge';

SELECT * 
FROM empleados
WHERE edad = 29;

SELECT nombre, edad 
FROM empleados
WHERE edad = 29;

-- 10 TRUNCATE TABLE, DELETE FROM
SELECT * FROM dbo.empleados;

TRUNCATE TABLE empleados;-- EELIMINAR LOS REGISTROS SIN ELIMINAR MI TABLA

DELETE FROM empleados
WHERE id_empleado = 7;

SELECT * FROM dbo.Empleados;

DELETE FROM Empleados; -- PRECAUCIÓN!!! NO SE DEBERÍA USAR SIN WHERE
-- Elimina todos los datos de la tabla como si de la instrucción TRUNCATE se tratara
-- pero, además, nos permite trabajar con filtros.

-- 11 ALTER TABLE - ADD - DROP
-- AGREGAR COLUMNA
ALTER TABLE empleados 
ADD sexo char(1); -- Se agrega la columna sexo

SELECT * FROM Empleados;

INSERT INTO empleados 
values (1, 'Juan', 'Pérez', 25, 1234567890, 'Calle 123', '1978-06-15', 2500.00, 'SI','M');

ALTER TABLE empleados 
ADD fecha_contratacion date; -- Se agrega la columna sexo

-- ELIMINAR COLUMNA
ALTER TABLE empleados 
DROP COLUMN fecha_contratacion;

ALTER TABLE empleados 
DROP COLUMN sexo;

-- 12 OPERADORES RELACIONALES
-- =, <> o !=, >, <, >=, <=, 
SELECT * FROM Empleados
WHERE id_empleado = 3;

SELECT * FROM Empleados
WHERE edad >= 25;

SELECT * FROM Empleados
WHERE edad != 25; -- o tambien <>

SELECT * FROM Empleados
WHERE edad <> 25;

-- 13 COMENTARIOS
-- Comentario de una línea
/*
Comentario MULTILINEA
*/

-- 14 CAMBIAR LOS NOMBRES DE LOS CAMPOS DE UNA TABLA
EXEC sp_rename 'Empleados.id_empleado', 'id';

-- 15 CLAUSULA UPDATE, IN
UPDATE Empleados -- PRECAUCIÓN!!! NO UTILIZAR SIN WHERE
SET telefono = 3434599300
WHERE id = 3;

UPDATE Empleados
SET activo ='NO'
WHERE id in(1,2,3,4,5); -- Incluye los id dentro del conjunto

SELECT *
FROM Empleados
WHERE id in(1,2,3,4,5); -- Incluye los id dentro del conjunto

DELETE FROM Empleados
WHERE id in(1,2,3,4,5); -- Incluye los id dentro del conjunto

-- 16 INSERTAR DATOS DESDE OTRA TABLA
CREATE TABLE salarios(
nombre varchar(20),
apellido varchar(30),
salario decimal(18,2)
);

SELECT * FROM salarios;

INSERT INTO salarios(nombre,apellido,salario)
SELECT nombre,apellido,salario FROM Empleados;

SELECT * FROM salarios;

TRUNCATE TABLE salarios;

INSERT INTO salarios(nombre,apellido,salario)
SELECT nombre,apellido,salario FROM Empleados
WHERE salario > 2500;

-- 17 SELECT TOP, SELECT PERCENT

SELECT * FROM Empleados;

SELECT TOP 5 * 
FROM Empleados
ORDER BY Nombre ASC; -- Ordena por la columna 'Nombre' en orden ascendente

SELECT TOP 5 * 
FROM Empleados
ORDER BY Nombre DESC; -- Ordena por la columna 'Nombre' en orden descendente


SELECT TOP 50 PERCENT * 
FROM Empleados
ORDER BY Nombre ASC; -- Ordena por la columna 'Nombre' en orden ascendente

SELECT TOP 50 PERCENT * 
FROM Empleados
ORDER BY Nombre DESC; -- Ordena por la columna 'Nombre' en orden descendente

SELECT TOP 5 * 
FROM Empleados
WHERE activo = 'NO'
ORDER BY Nombre ASC; -- Ordena por la columna 'Nombre' en orden ascendente

-- 18 NULL, IS NOT NULL 
CREATE TABLE clientes(
id_empleado int,
nombre varchar(30),
apellido varchar(30),
direccion varchar(100)
);

insert into clientes values(1,'Juan','Perez','Calle A, Ciudad');
insert into clientes values(2, 'Maria', NULL, 'Calle B Ciudad');
insert into clientes values(3,'Carlos','Lopez', NULL);
insert into clientes values(4, NULL, 'Rodriguez', 'Calle D Ciudad');
insert into clientes values(5,'Pedro', NULL, NULL);
insert into clientes values(6,NULL ,NULL,  'Calle D Ciudad');
insert into clientes values(7,'Luis','Gonzales', 'Calle G Ciudad');
insert into clientes values(8, NULL, 'Díaz', NULL);
insert into clientes values(9,'Jorge', NULL,' Calle I Ciudad');
insert into clientes values(10,NULL, NULL, NULL);
insert into clientes values(11,'Ana', 'Hernandez', 'Calle M Ciudad');
insert into clientes values(12,NULL, NULL, 'Calle M Ciudad'); 
insert into clientes values(13,NULL, 'Sanchez', NULL);
insert into clientes values(14,'Sofía', NULL, 'Calle M Ciudad');
insert into clientes values(15,NULL, NULL,  'Calle P Ciudad');
insert into clientes values(16,'Daniel', 'Garcia', NULL);
insert into clientes values(17,'Martha','Fernandez', NULL);
insert into clientes values(18,NULL, 'Martinez',  'Calle Q Ciudad');
insert into clientes values(19,'Pablo', NULL, NULL);
insert into clientes values(20, NULL, 'Lopez', 'Calle S Ciudad');

SELECT * FROM clientes;

SELECT * FROM clientes
WHERE nombre IS NULL
;

SELECT * FROM clientes
WHERE nombre IS NOT NULL
;

UPDATE clientes 
SET direccion = 'NO TIENE'
WHERE direccion IS NULL
;

-- 19 CREATE TABLE, NULL NOT NULL, INSERT NULL
DROP TABLE clientes;

CREATE TABLE clientes(
id_cliente int NOT NULL,
nombre varchar(30) NOT NULL,
apellido varchar(30),  -- Por defecto es NULL
direccion varchar(100) NOT NULL,
telefono numeric(20) NULL,
email varchar(50) NULL
);

insert into clientes values(2,'MANU', NULL , 'direcion aleatoria 85', 3434551122, NULL);

SELECT * FROM clientes;

-- 20 CONSTRAINTS - PRIMARY KEY 

-- PRIMERA FORMA
DROP TABLE Personas;

CREATE TABLE Personas(
id_persona int PRIMARY KEY NOT NULL ,
nombre varchar(30) NOT NULL,
edad int NOT NULL
);

SELECT * FROM Personas;

INSERT INTO Personas VALUES(1,'Jose',50);
INSERT INTO Personas VALUES(1,'HErnan',30);
INSERT INTO Personas VALUES(3,'Agustin',50);
INSERT INTO Personas VALUES(4,'Carlits',20);

-- SEGUNDA FORMA
DROP TABLE Personas;

CREATE TABLE Personas(
id_persona int NOT NULL ,
nombre varchar(30) NOT NULL,
edad int NOT NULL,
PRIMARY KEY(id_persona)
);

-- TERCERA FORMA
DROP TABLE Personas;

CREATE TABLE Personas(
id_persona int NOT NULL ,
nombre varchar(30) NOT NULL,
edad int NOT NULL,
CONSTRAINT PK_enlace_persona PRIMARY KEY(id_persona) -- EL NOMBRE PERSONALIZADO NOS PERMITE ALTERARLA
);

INSERT INTO Personas VALUES(1,'Jose',50);
INSERT INTO Personas VALUES(1,'HErnan',30);

-- CUARTA FORMA
DROP TABLE Personas;

CREATE TABLE Personas(
id_persona int NOT NULL, -- NO OLVIDAR EL NOT NULL en SQL SERVER
nombre varchar(30) NOT NULL,
edad int NOT NULL
);

ALTER TABLE Personas
ADD CONSTRAINT PK_enlace PRIMARY KEY (id_persona); -- EL NOMBRE PERSONALIZADO NOS PERMITE ALTERARLA

ALTER TABLE Personas
DROP CONSTRAINT PK_enlace;

-- 21 CONSTRAINTS - UNIQUE 
SELECT * FROM Personas;

DROP TABLE Personas;

CREATE TABLE Personas(
id_persona int NOT NULL UNIQUE,
nombre varchar(30) NOT NULL,
edad int NOT NULL
);

CREATE TABLE Personas(
id_persona int NOT NULL,
nombre varchar(30) NOT NULL,
edad int NOT NULL,
CONSTRAINT UQ_idpersona UNIQUE(id_persona)
);

CREATE TABLE Personas(
id_persona int NOT NULL,
clave varchar(10) NOT NULL,
nombre varchar(30) NOT NULL,
edad int NOT NULL,
CONSTRAINT UQ_idpersona UNIQUE(id_persona),
CONSTRAINT UQ_clave UNIQUE(clave)
);

INSERT INTO Personas VALUES(1,'Clave_01','Jose',50);
INSERT INTO Personas VALUES(2,'Clave_02','HErnan',30);
INSERT INTO Personas VALUES(3,'Clave_02','HErnan',30); -- ERROR


DROP TABLE Personas;
CREATE TABLE Personas(
id_persona int,
clave varchar(10) NOT NULL,
nombre varchar(30) NOT NULL,
edad int NOT NULL,
);

ALTER TABLE Personas
ADD CONSTRAINT UQ_idpersona UNIQUE (id_persona); 

INSERT INTO Personas VALUES(1,'Clave_01','Jose',50);
INSERT INTO Personas VALUES(2,'Clave_02','HErnan',30);
INSERT INTO Personas VALUES(NULL,'Clave_02','HErnan',30); 
INSERT INTO Personas VALUES(NULL,'Clave_04','GER',88); 

SELECT * FROM Personas;

ALTER TABLE Personas
DROP CONSTRAINT UQ_idpersona;


-- 22 CONSTRAINTS - CHECK (PAra limitar el rango de valores que se puede permitir en un registro)
DROP TABLE Personas;
CREATE TABLE Personas(
id_persona int NOT NULL,
nombre varchar(30) NOT NULL,
edad int NOT NULL,
CHECK (edad >=18)
);

INSERT INTO Personas VALUES(1,'Jose',50);
INSERT INTO Personas VALUES(2,'HErnan',10); -- ERROR

DROP TABLE Personas;
CREATE TABLE Personas(
id_persona int NOT NULL,
nombre varchar(30) NOT NULL,
edad int NOT NULL CHECK (edad >=18)
);

DROP TABLE Personas;
CREATE TABLE Personas(
id_persona int NOT NULL,
nombre varchar(30) NOT NULL,
edad int,
CONSTRAINT CK_edad CHECK (edad >=18)
);


DROP TABLE Personas;
CREATE TABLE Personas(
id_persona int NOT NULL,
nombre varchar(30) NOT NULL,
edad int,
);

ALTER TABLE Personas
ADD CONSTRAINT CK_edad CHECK (edad >=18);

ALTER TABLE Personas
DROP CONSTRAINT CK_edad;

-- 23 CONSTRAINTS - DEFAULT -------------------------------------------
DROP TABLE Personas;
CREATE TABLE Personas(
id_persona int NOT NULL,
nombre varchar(30) NOT NULL,
edad int NOT NULL,
ciudad varchar(50) DEFAULT 'SIN DATOS'
);

INSERT INTO Personas VALUES(1,'Jose',50, DEFAULT);
INSERT INTO Personas VALUES(2,'HErnan',10, DEFAULT); 

SELECT * FROM Personas;

DROP TABLE Personas;
CREATE TABLE Personas(
id_persona int NOT NULL,
nombre varchar(30) NOT NULL,
edad int NOT NULL,
ciudad varchar(50)
);

ALTER TABLE Personas
ADD CONSTRAINT DF_Ciudad DEFAULT 'SIN DATOS' FOR ciudad;

INSERT INTO Personas VALUES(1,'Jose',50, DEFAULT);
INSERT INTO Personas VALUES(2,'HErnan',10, DEFAULT); 

ALTER TABLE Personas
DROP CONSTRAINT DF_Ciudad;

-- 24 CONSTRAINTS - IDENTITY
-- Crear tabla con columna IDENTITY
CREATE TABLE Productos (
    ProductoID INT IDENTITY(100, 5) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Precio DECIMAL(10, 2)
);

-- Insertar datos sin especificar ProductoID
INSERT INTO Productos (Nombre, Precio)
VALUES ('Laptop', 1500.00),
       ('Smartphone', 800.00),
       ('Tablet', 400.00);

-- Verificar los datos insertados
SELECT * FROM Productos;

-- Habilitar IDENTITY_INSERT para insertar un valor específico
SET IDENTITY_INSERT Productos ON;

-- Insertar un valor específico en ProductoID
INSERT INTO Productos (ProductoID, Nombre, Precio)
VALUES (200, 'Monitor', 300.00);

-- Deshabilitar IDENTITY_INSERT
SET IDENTITY_INSERT Productos OFF;

-- Verificar los datos insertados
SELECT * FROM Productos;

-- EJEMPLOS 
CREATE TABLE libros(
codigo int identity,
titulo varchar(60) NOT NULL,
autor varchar(60) NOT NULL
);

INSERT INTO libros VALUES ('La Rebelión de Atlas','Ayn Rand');
INSERT INTO libros VALUES ('El Manantial','Ayn Rand');
INSERT INTO libros VALUES ('Los que Vivimos','Ayn Rand');


SELECT * FROM libros;

-- Consultar características del IDENTITY
SELECT IDENT_SEED('libros'); -- Valor Inicial
SELECT IDENT_INCR('libros'); -- Valor del paso

-- 25  FOREIGN KEY
DROP TABLE clientes;

CREATE TABLE clientes(
	id_cliente int,
	nombre varchar(20) NOT NULL,
	apellido varchar(20) NOT NULL,
	edad int NOT NULL,
CONSTRAINT PK_clientes PRIMARY KEY(id_cliente)
);

CREATE TABLE ordenes(
	id_orden INT NOT NULL,
	articulo VARCHAR(50) NOT NULL,
	id_cliente INT -- ESTO SERÁ UNA LLAVE FORÁNEA QUE REPLICARÁ LA LLAVE PRIMARIA DEL PADRE, EL HIJO COPIA AL PADRE
CONSTRAINT FK_ordenes_clientes FOREIGN KEY REFERENCES clientes(id_cliente)
);

INSERT INTO clientes VALUES(1,'JUAN','PEREZ',30);
INSERT INTO ordenes VALUES(1,'MARTILLO',1); -- LA FK tiene que coincidir con una PK EXISTENTE!


SELECT * FROM clientes;
SELECT * FROM ordenes;

DELETE FROM clientes WHERE id_cliente = 1; 
-- ERROR PORQUE ESTA REALACIONADO A UNA FK
-- LO QUE HACE EL PADRE AFECTA AL HIJO

DELETE FROM ordenes WHERE id_cliente = 1; -- LA HIJA ES INDEPENDIENTE DEL PADRE PARA UN DELETE

--  CASCADE --
DROP TABLE clientes;

CREATE TABLE clientes(
	id_cliente int,
	nombre varchar(20) NOT NULL,
	apellido varchar(20) NOT NULL,
	edad int NOT NULL,
CONSTRAINT PK_clientes PRIMARY KEY(id_cliente)
);

DROP TABLE ordenes;
CREATE TABLE ordenes(
	id_orden INT NOT NULL,
	articulo VARCHAR(50) NOT NULL,
	id_cliente INT -- ESTO SERÁ UNA LLAVE FORÁNEA QUE REPLICARÁ LA LLAVE PRIMARIA DEL PADRE, EL HIJO COPIA AL PADRE
CONSTRAINT FK_ordenes_clientes FOREIGN KEY REFERENCES clientes(id_cliente)
ON DELETE CASCADE
);

INSERT INTO clientes VALUES(1,'JUAN','PEREZ',30);
INSERT INTO ordenes VALUES(1,'MARTILLO',1); -- LA FK tiene que coincidir con una PK EXISTENTE!

SELECT * FROM clientes;
SELECT * FROM ordenes;

DELETE FROM clientes WHERE id_cliente = 1;  -- SE BORRA TAMBIEN LO RELACIONADO EN ORDENES

-- BORRAR FK --
ALTER TABLE ordenes 
DROP CONSTRAINT FK_ordenes_clientes;


-- MEJOR MANERA DE DECLARAR LA FK
-- Creación de la tabla Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100)
);

-- Creación de la tabla Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- CONSULTAR NOMBRE DE FK
SELECT 
    CONSTRAINT_NAME, 
    TABLE_NAME 
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE 
    CONSTRAINT_TYPE = 'FOREIGN KEY'
    AND TABLE_NAME = 'Orders';

-- 26  VISTAS (VIEWS) --
DROP TABLE clientes;

CREATE TABLE clientes (
    id INT,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    direccion VARCHAR(50),
    edad INT,
    telefono VARCHAR(20),
    fecha_nacimiento DATE
);


--insertar estos registros en la tabla clientes
insert into clientes values(1, 'Juan', 'Perez', 'Calle 123', 25, '555-1234', '2000-01-01');
insert into clientes values(2, 'Maria', 'Lopez', 'Avenida 456', 30, '555-5678', '1995-05-10');
insert into clientes values(3, 'Carlos', 'Gomez', 'Carrera 789', 40, '555-9012', '1983-12-15');
insert into clientes values(4, 'Ana', 'Rodriguez', 'Plaza 789', 32, '555-4321', '1989-08-20');
insert into clientes values(5, 'Pedro', 'Martinez', 'Avenida 987', 45, '555-6789', '1978-03-05');
insert into clientes values(6, 'Laura', 'Sanchez', 'Calle 456', 27, '555-0987', '1996-11-12');
insert into clientes values(7, 'Luis', 'Hernandez', 'Calle 654', 38, '555-3456', '1984-07-25');
insert into clientes values(8, 'Carolina', 'Torres', 'Avenida 321', 29, '555-8765', '1992-09-03');
insert into clientes values(9, 'Diego', 'Gonzalez', 'Carrera 246', 42, '555-6543', '1979-06-18');
insert into clientes values(10, 'Sofia', 'Rojas', 'Plaza 135', 31, '555-2109', '1990-04-14');
insert into clientes values(11, 'Andres', 'Fernandez', 'Calle 789', 37, '555-1092', '1985-02-28');
insert into clientes values(12, 'Valentina', 'Morales', 'Calle 246', 26, '555-5432', '1997-10-23');
insert into clientes values(13, 'Roberto', 'Gutierrez', 'Avenida 753', 43, '555-4321', '1978-12-09');
insert into clientes values(14, 'Daniela', 'Navarro', 'Plaza 159', 33, '555-6789', '1988-06-14');
insert into clientes values(15, 'Jorge', 'Paz', 'Carrera 357', 44, '555-0987', '1977-01-30');
insert into clientes values(16, 'Catalina', 'Silva', 'Calle 852', 28, '555-3456', '1995-11-05');
insert into clientes values(17, 'Gonzalo', 'Luna', 'Avenida 951', 39, '555-8765', '1982-08-12');
insert into clientes values(18, 'Camila', 'Vargas', 'Carrera 753', 30, '555-6543', '1993-03-28');
insert into clientes values(19, 'Felipe', 'Cortes', 'Calle 357', 35, '555-2109', '1986-09-13');
insert into clientes values(20, 'Marcela', 'Ortega', 'Plaza 852', 37, '555-1092', '1985-02-28');

SELECT * FROM clientes;

CREATE VIEW v_Clientes_Nacionales AS
	SELECT * FROM clientes
	WHERE edad > 30;

SELECT * FROM v_Clientes_Nacionales;

CREATE VIEW v_Clientes_Mayores AS
	SELECT * FROM clientes
	WHERE edad > 18;

SELECT * FROM v_Clientes_Mayores;

CREATE VIEW vw_Clientes_Mayores35 AS
	SELECT * FROM clientes
	WHERE edad > 35;

SELECT * FROM vw_Clientes_Mayores35;

-- Modificar vista Creada 
ALTER VIEW v_Clientes_Mayores AS
SELECT nombre, edad, fecha_nacimiento
FROM clientes WHERE edad > 30;

SELECT * FROM v_Clientes_Mayores;

-- BORRAR VISTA
DROP VIEW v_Clientes_Mayores;

-- 27 INDICES, (INDEX) --
SELECT * FROM empleados;

CREATE TABLE empleados(
    id INT,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    direccion VARCHAR(50),
    edad INT,
    telefono VARCHAR(20),
    fecha_nacimiento DATE
);


--insertar estos registros en la tabla clientes
insert into empleados values(1, 'Juan', 'Perez', 'Calle 123', 25, '555-1234', '2000-01-01');
insert into empleados values(2, 'Maria', 'Lopez', 'Avenida 456', 30, '555-5678', '1995-05-10');
insert into empleados values(3, 'Carlos', 'Gomez', 'Carrera 789', 40, '555-9012', '1983-12-15');
insert into empleados values(4, 'Ana', 'Rodriguez', 'Plaza 789', 32, '555-4321', '1989-08-20');
insert into empleados values(5, 'Pedro', 'Martinez', 'Avenida 987', 45, '555-6789', '1978-03-05');
insert into empleados values(6, 'Laura', 'Sanchez', 'Calle 456', 27, '555-0987', '1996-11-12');
insert into empleados values(7, 'Luis', 'Hernandez', 'Calle 654', 38, '555-3456', '1984-07-25');
insert into empleados values(8, 'Carolina', 'Torres', 'Avenida 321', 29, '555-8765', '1992-09-03');
insert into empleados values(9, 'Diego', 'Gonzalez', 'Carrera 246', 42, '555-6543', '1979-06-18');
insert into empleados values(10, 'Sofia', 'Rojas', 'Plaza 135', 31, '555-2109', '1990-04-14');
insert into empleados values(11, 'Andres', 'Fernandez', 'Calle 789', 37, '555-1092', '1985-02-28');
insert into empleados values(12, 'Valentina', 'Morales', 'Calle 246', 26, '555-5432', '1997-10-23');
insert into empleados values(13, 'Roberto', 'Gutierrez', 'Avenida 753', 43, '555-4321', '1978-12-09');
insert into empleados values(14, 'Daniela', 'Navarro', 'Plaza 159', 33, '555-6789', '1988-06-14');
insert into empleados values(15, 'Jorge', 'Paz', 'Carrera 357', 44, '555-0987', '1977-01-30');
insert into empleados values(16, 'Catalina', 'Silva', 'Calle 852', 28, '555-3456', '1995-11-05');
insert into empleados values(17, 'Gonzalo', 'Luna', 'Avenida 951', 39, '555-8765', '1982-08-12');
insert into empleados values(18, 'Camila', 'Vargas', 'Carrera 753', 30, '555-6543', '1993-03-28');
insert into empleados values(19, 'Felipe', 'Cortes', 'Calle 357', 35, '555-2109', '1986-09-13');
insert into empleados values(20, 'Marcela', 'Ortega', 'Plaza 852', 37, '555-1092', '1985-02-28');

-- INDICE PARA LA COLUMNA id de la tabla empleados TIPO CLUSTER
CREATE CLUSTERED INDEX I_idempleado 
ON empleados(id,salario);

-- INDICE PARA LA COLUMNA id de la tabla empleados TIPO NO CLUSTER
CREATE NONCLUSTERED INDEX I_nc_idempleado 
ON empleados(edad);

-- CAMBIAR NOMBRE DE INDICE
EXEC sp_rename 'empleados.I_idempleado','Ic_Id_empleados','INDEX';

--BORRADO 
DROP INDEX Ic_Id_empleados ON empleados;

-- 28 DISTINCT (registros duplicados) --
DROP TABLE clientes;

CREATE TABLE clientes(
id_cliente INT NOT NULL PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
apellido VARCHAR(20) NOT NULL,
pais VARCHAR(50) NOT NULL,
compras INT NULL
);
  
insert into Clientes values(1, 'Juan', 'Pérez', 'Estados Unidos', 1);
insert into Clientes values(2, 'María', 'Gómez', 'Argentina', 2);
insert into Clientes values(3, 'Carlos', 'López', 'Brasil', NULL);
insert into Clientes values(4, 'Laura', 'Martínez', 'Canadá', 4);
insert into Clientes values(5, 'Pedro', 'Hernández', 'China', 5);
insert into Clientes values(6, 'Ana', 'Ruiz', 'Colombia', NULL);
insert into Clientes values(7, 'Luis', 'Torres', 'Egipto', 7);
insert into Clientes values(8, 'Marta', 'Sánchez', 'España', 8);
insert into Clientes values(9, 'Roberto', 'García', 'Francia', 9);
insert into Clientes values(10, 'Sofía', 'López', 'Alemania', 10);
insert into Clientes values(11, 'David', 'Hernández', 'Argentina', NULL);
insert into Clientes values(12, 'Andrea', 'Gómez', 'Brasil', 12);
insert into Clientes values(13, 'Fernando', 'Pérez', 'Canadá', 13);
insert into Clientes values(14, 'Patricia', 'Martínez', 'China', 14);
insert into Clientes values(15, 'Javier', 'López', 'Colombia', 15);
insert into Clientes values(16, 'Carmen', 'Ruiz', 'Egipto', NULL);
insert into Clientes values(17, 'Ricardo', 'Torres', 'España', 17);
insert into Clientes values(18, 'Marina', 'Sánchez', 'Francia', 18);
insert into Clientes values(19, 'Alejandro', 'García', 'Alemania', 19);
insert into Clientes values(20, 'Claudia', 'López', 'Argentina', 20);
insert into Clientes values(21, 'Fernanda', 'Gómez', 'Brasil', 21);
insert into Clientes values(22, 'Rodrigo', 'Pérez', 'Canadá', 22);
insert into Clientes values(23, 'Luisa', 'Martínez', 'China', 23);
insert into Clientes values(24, 'Emilio', 'Hernández', 'Colombia', 24);
insert into Clientes values(25, 'Valeria', 'Ruiz', 'Egipto', 25);
insert into Clientes values(26, 'Rafael', 'Torres', 'España', 26);
insert into Clientes values(27, 'Camila', 'Sánchez', 'Francia', 27);
insert into Clientes values(28, 'Gabriel', 'García', 'Alemania', NULL);
insert into Clientes values(29, 'Isabella', 'López', 'Argentina', NULL);
insert into Clientes values(30, 'Santiago', 'Pérez', 'Brasil', 30);

SELECT * FROM Clientes;

SELECT DISTINCT pais 
from clientes;

SELECT DISTINCT id_cliente, nombre  
from clientes
WHERE pais = 'Argentina'
;

SELECT DISTINCT pais  
FROM clientes
WHERE compras IS NULL
;

-- 29 ALIAS Y CONCATENACION DE REGISTROS --
-- ALIAS ---
SELECT id AS Identificador, nombre, apellido, salario
FROM empleados
WHERE salario < 3000;

-- CONCATENACIÓN --- SOlo SE PUEDE CONTCATENAR TIPOS DE DATOS IGUALES
SELECT nombre +' '+ apellido AS NombreCompleto, salario 
FROM empleados

-- CONVERSION DE TIPO DE DATO
SELECT nombre +' '+ apellido + ' ' + CAST(edad as varchar(2)) 
FROM empleados;

-- CONVERSION DE TIPO DE DATO, ALIAS CON ESPACIO
SELECT nombre +' '+ apellido + ' ' + CAST(edad as varchar(2)) AS " DATOS DE EMPLEADOS"
FROM empleados;

-- 30 OPERADORES MATEMÁTICOS, COLUMNAS CALCULADAS --
SELECT 10 % 3 AS Resultado;

-- Crear tabla Empleados con columnas calculadas
DROP TABLE Empleados;

CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    HorasTrabajadas INT,
    TarifaPorHora DECIMAL(10, 2),
    Bonos DECIMAL(10, 2),
    SalarioBruto AS (HorasTrabajadas * TarifaPorHora + Bonos) PERSISTED,
    Impuestos AS ((HorasTrabajadas * TarifaPorHora + Bonos) * 0.15) PERSISTED,
    SalarioNeto AS ((HorasTrabajadas * TarifaPorHora + Bonos) - ((HorasTrabajadas * TarifaPorHora + Bonos) * 0.15)) PERSISTED
);

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (EmpleadoID, Nombre, HorasTrabajadas, TarifaPorHora, Bonos)
VALUES (1, 'Ana Gomez', 160, 20.00, 200.00),
       (2, 'Luis Fernandez', 150, 22.00, 150.00);

-- Consultar datos de la tabla Empleados
SELECT EmpleadoID, Nombre, HorasTrabajadas, TarifaPorHora, Bonos, SalarioBruto, Impuestos, SalarioNeto
FROM Empleados;


drop table articulos;

CREATE TABLE articulos (
  codigo INT IDENTITY,
  nombre VARCHAR(30),
  descripcion VARCHAR(100),
  precio SMALLMONEY,
  cantidad INT DEFAULT 0,
  vendidos INT DEFAULT 0,
  PRIMARY KEY (codigo)
);

insert into articulos values('Laptop Acer', 'Portátil con procesador i5, 8GB RAM, 256GB SSD', 899.99, 10, 2);
insert into articulos values('Monitor Samsung', 'Monitor LED de 24 pulgadas con resolución Full HD', 179.99, 20, 5);
insert into articulos values('Impresora HP', 'Impresora láser multifuncional con conexión Wi-Fi', 249.99, 15, 3);
insert into articulos values('Teclado Logitech', 'Teclado inalámbrico con retroiluminación y teclas programables', 59.99, 30, 8);
insert into articulos values('Mouse Microsoft', 'Mouse óptico ergonómico con 6 botones programables', 19.99, 40, 12);
insert into articulos values('Disco Duro Externo', 'Almacenamiento portátil de 1TB con conexión USB 3.0', 79.99, 25, 6);
insert into articulos values('Laptop HP', 'Portátil con procesador i7, 16GB RAM, 512GB SSD', 1299.99, 8, 1);
insert into articulos values('Monitor LG', 'Monitor LED de 27 pulgadas con resolución 4K', 299.99, 12, 3);
insert into articulos values('Impresora Epson', 'Impresora de inyección de tinta con escáner incorporado', 159.99, 18, 4);
insert into articulos values('Teclado Razer', 'Teclado mecánico con iluminación personalizable', 99.99, 22, 7);
insert into articulos values('Mouse Logitech', 'Mouse inalámbrico con sensor de alta precisión', 29.99, 35, 10);
insert into articulos values('Disco Duro SSD', 'Unidad de estado sólido de 500GB con velocidad de transferencia rápida', 109.99, 30, 9);
insert into articulos values('Laptop Dell', 'Portátil con procesador i7, 16GB RAM, 1TB HDD', 1199.99, 6, 1);
insert into articulos values('Monitor BenQ', 'Monitor LED de 32 pulgadas con tecnología HDR', 399.99, 9, 2);
insert into articulos values('Impresora Canon', 'Impresora láser en color de alta velocidad', 199.99, 14, 4);
insert into articulos values('Teclado Corsair', 'Teclado mecánico para juegos con retroiluminación RGB', 79.99, 28, 9);
insert into articulos values('Mouse Gaming', 'Mouse para juegos con botones programables y DPI ajustable', 49.99, 42, 15);
insert into articulos values('Disco Duro Externo SSD', 'Almacenamiento portátil de 2TB con conexión USB-C', 159.99, 20, 8);
insert into articulos values('Laptop Lenovo', 'Portátil con procesador Ryzen 7, 12GB RAM, 512GB SSD', 999.99, 10, 2);
insert into articulos values('Monitor ASUS', 'Monitor LED de 29 pulgadas ultrapanorámico', 249.99, 16, 3);
insert into articulos values('Impresora Brother', 'Impresora láser monocromática de alta capacidad', 179.99, 20, 6);

SELECT * FROM articulos;

SELECT nombre, descripcion, precio, precio + (precio * 0.1) AS "Más 10%"
FROM articulos;

SELECT nombre, descripcion, precio, precio - (precio * 0.1) AS "Menos 10%"
FROM articulos;

SELECT nombre, descripcion, precio * vendidos as "Ventas"
FROM articulos;

SELECT nombre, descripcion, cantidad - vendidos as "Stock"
FROM articulos;

-- 31 CREAR ESQUEMAS ------
USE Principal;

CREATE SCHEMA Ventas;

CREATE SCHEMA Cobros;

-- LISTAR ESQUEMAS
-- Usando sys.schemas
SELECT name AS SchemaName
FROM sys.schemas;

-- Usando INFORMATION_SCHEMA.SCHEMATA
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA;

CREATE TABLE cobros.clientes( -- CREAMOS UNA TABLA DENTRO DEL ESQUEMA VENTAS
idclientes int,
nombre int,
direccion varchar(30)
);

SELECT * FROM clientes; -- Utiliza el Esquema dbo (creado por defecto)
SELECT * FROM Ventas.clientes;

DROP TABLE Ventas.clientes;

-- 32 RESTAURAR UNA BASE DE DATOS (Adventureworks 2022)
-- Descargamos: https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2022.bak

USE AdventureWorks2022;

SELECT * FROM HumanResources.Employee;

--33 ORDER BY, ORGANIZAR REGISTROS EN LAS CONSULTAS--
USE Principal;
SELECT * FROM Personas
ORDER BY edad ASC;

-- 34  MAX, MIN - VALORES MÁXIMOS Y MÍNIMOS
SELECT * 
FROM articulos;

SELECT MAX(precio) AS "PRECIO Máx"
FROM articulos;

SELECT MIN(precio) AS "PRECIO MIN"
FROM articulos;

SELECT MAX(precio) AS "PRECIO Máx", MIN(precio) AS "PRECIO MIN"
FROM articulos;


-- 35 FUNCIONES DE AGRUPACION: COUNT, SUM, AVG
DROP TABLE empleados;

create table empleados(
id_empleado int not null primary key,
nombre varchar(30),
apellido varchar(30),
direccion varchar(30),
puesto varchar(50),
sueldo decimal(6,2),
cant_hijos tinyint
);

insert into empleados values(1, 'Juan', 'Pérez', 'Calle A, Ciudad', 'Gerente', 5000.00, 2);
insert into empleados values(2, 'María', 'López', 'Calle B, Ciudad', 'Asistente', 3000.00, 0);
insert into empleados values(3, 'Pedro', 'González', 'Calle C, Ciudad', 'Técnico', 2500.00, 1);
insert into empleados values(4, 'Laura', 'García', 'Calle D, Ciudad', 'Analista', 3500.00, 0);
insert into empleados values(5, 'Carlos', 'Martínez', 'Calle E, Ciudad', 'Desarrollador', 4000.00, 2);
insert into empleados values(6, 'Ana', 'Sánchez', 'Calle F, Ciudad', 'Contadora', 4500.00, 1);
insert into empleados values(7, 'Luis', 'Rodríguez', 'Calle G, Ciudad', 'Asistente', 3000.00, 0);
insert into empleados values(8, 'Patricia', 'Torres', 'Calle H, Ciudad', 'Técnico', 2500.00, 1);
insert into empleados values(9, 'Javier', 'Hernández', 'Calle I, Ciudad', 'Gerente', 5000.00, 3);
insert into empleados values(10, 'Sofía', 'Flores', 'Calle J, Ciudad', 'Analista', 3500.00, 0);
insert into empleados values(11, 'Alejandro', 'Luna', 'Calle K, Ciudad', 'Desarrollador', 4000.00, 1);
insert into empleados values(12, 'Elena', 'Vargas', 'Calle L, Ciudad', 'Contadora', 4500.00, 2);
insert into empleados values(13, 'Diego', 'Rojas', 'Calle M, Ciudad', 'Asistente', 3000.00, 0);
insert into empleados values(14, 'Carmen', 'Navarro', 'Calle N, Ciudad', 'Técnico', 2500.00, 1);
insert into empleados values(15, 'Gabriel', 'Soto', 'Calle O, Ciudad', 'Gerente', 5000.00, 2);
insert into empleados values(16, 'Valeria', 'Gómez', 'Calle P, Ciudad', 'Analista', 3500.00, 0);
insert into empleados values(17, 'Hugo', 'Silva', 'Calle Q, Ciudad', 'Desarrollador', 4000.00, 1);
insert into empleados values(18, 'Mónica', 'Mendoza', 'Calle R, Ciudad', 'Contadora', 4500.00, 3);
insert into empleados values(19, 'Fernando', 'Chávez', 'Calle S, Ciudad', 'Asistente', 3000.00, 0);
insert into empleados values(20, 'Adriana', 'Ortega', 'Calle T, Ciudad', 'Técnico', 2500.00, 1);
insert into empleados values(21, 'Ricardo', 'Castro', 'Calle U, Ciudad', 'Gerente', 5000.00, 2);
insert into empleados values(22, 'Camila', 'Morales', 'Calle V, Ciudad', 'Asistente', 3000.00, 0);
insert into empleados values(23, 'Andrés', 'Ríos', 'Calle W, Ciudad', 'Técnico', 2500.00, 1);
insert into empleados values(24, 'Isabella', 'Vega', 'Calle X, Ciudad', 'Analista', 3500.00, 0);
insert into empleados values(25, 'David', 'Herrera', 'Calle Y, Ciudad', 'Desarrollador', 4000.00, 2);
insert into empleados values(26, 'Carolina', 'Santos', 'Calle Z, Ciudad', 'Contadora', 4500.00, 1);
insert into empleados values(27, 'Raúl', 'Mendoza', 'Calle A1, Ciudad', 'Asistente', 3000.00, 0);
insert into empleados values(28, 'Gabriela', 'Campos', 'Calle B1, Ciudad', 'Técnico', 2500.00, 1);
insert into empleados values(29, 'Óscar', 'Delgado', 'Calle C1, Ciudad', 'Gerente', 5000.00, 3);
insert into empleados values(30, 'Daniela', 'Castillo', 'Calle D1, Ciudad', 'Analista', 3500.00, 0);
insert into empleados values(31, 'Eduardo', 'Fuentes', 'Calle E1, Ciudad', 'Desarrollador', 4000.00, 1);
insert into empleados values(32, 'Gabriela', 'Lara', 'Calle F1, Ciudad', 'Contadora', 4500.00, 2);
insert into empleados values(33, 'Lorenzo', 'Ortiz', 'Calle G1, Ciudad', 'Asistente', 3000.00, 0);
insert into empleados values(34, 'Valentina', 'Guerra', 'Calle H1, Ciudad', 'Técnico', 2500.00, 1);
insert into empleados values(35, 'Héctor', 'Vargas', 'Calle I1, Ciudad', 'Gerente', 5000.00, 2);
insert into empleados values(36, 'Daniela', 'Paredes', 'Calle J1, Ciudad', 'Analista', 3500.00, 0);
insert into empleados values(37, 'Santiago', 'Castañeda', 'Calle K1, Ciudad', 'Desarrollador', 4000.00, 1);
insert into empleados values(38, 'Valeria', 'Cruz', 'Calle L1, Ciudad', 'Contadora', 4500.00, 3);
insert into empleados values(39, 'Gustavo', 'Mejía', 'Calle M1, Ciudad', 'Asistente', 3000.00, 0);
insert into empleados values(40, 'Alejandra', 'Rojas', 'Calle N1, Ciudad', 'Técnico', 2500.00, 1);


SELECT COUNT(*) AS Cant_Emepleados
FROM empleados;

SELECT COUNT(sueldo) AS Asistentes_Con_Sueldos
FROM empleados
WHERE puesto = 'Asistente';

-- SUM
SELECT SUM(sueldo) AS GASTO_TOTAL_EN_SUELDOS
FROM empleados;

-- SUM
SELECT SUM(sueldo) AS GASTO_TOTAL_EN_SUELDOS_DE_ASISTENTES
FROM empleados
WHERE puesto = 'Asistente';

-- AVG
SELECT AVG(sueldo) AS PROMEDIO_SUELDOS_DE_GERENTES
FROM empleados
WHERE puesto = 'Gerente';

SELECT AVG(DISTINCT sueldo)
FROM empleados;

SELECT COUNT(*), AVG(sueldo), SUM(cant_hijos)
FROM empleados;

-- 36 OPERADORES: AND, OR Y NOT
DROP TABLE clientes;

create table clientes(
idcliente int not null primary key,
nombre varchar(20) not null,
apellido varchar(20) not null,
direccion varchar(100) not null,
pais varchar(50) not null,
ciudad varchar(30) not null);

insert into clientes values(1, 'Juan', 'Pérez', 'Calle Principal 123', 'México', 'Ciudad de México');
insert into clientes values(2, 'María', 'Gómez', 'Avenida Central 456', 'España', 'Madrid');
insert into clientes values(3, 'Carlos', 'López', 'Rua Principal 789', 'Brasil', 'Río de Janeiro');
insert into clientes values(4, 'Ana', 'Rodríguez', '123 Main Street', 'Estados Unidos', 'Nueva York');
insert into clientes values(5, 'Luis', 'Fernández', 'Rue Principale 456', 'Francia', 'París');
insert into clientes values(6, 'Laura', 'García', 'Hauptstrasse 789', 'Alemania', 'Berlín');
insert into clientes values(7, 'Pedro', 'Martínez', 'Via Roma 123', 'Italia', 'Roma');
insert into clientes values(8, 'Sofía', 'Hernández', 'Rua Principal 456', 'Portugal', 'Lisboa');
insert into clientes values(9, 'Diego', 'Torres', 'Calle Mayor 789', 'Argentina', 'Buenos Aires');
insert into clientes values(10, 'Valentina', 'Luna', '123 First Street', 'Canadá', 'Toronto');
insert into clientes values(11, 'Andrés', 'Silva', 'Rue Principale 456', 'Suiza', 'Zúrich');
insert into clientes values(12, 'Camila', 'Chavez', 'Hauptstrasse 789', 'Austria', 'Viena');
insert into clientes values(13, 'Miguel', 'Vargas', 'Via Roma 123', 'Italia', 'Roma');
insert into clientes values(14, 'Paula', 'Castillo', 'Rua Principal 456', 'Portugal', 'Lisboa');
insert into clientes values(15, 'Gustavo', 'Mendoza', 'Calle Mayor 789', 'Chile', 'Santiago');
insert into clientes values(16, 'Fernanda', 'Paz', '123 Main Street', 'Australia', 'Sídney');
insert into clientes values(17, 'Roberto', 'Ruíz', 'Rue Principale 456', 'Bélgica', 'Bruselas');
insert into clientes values(18, 'Lucía', 'Sanchez', 'Hauptstrasse 789', 'Holanda', 'Ámsterdam');
insert into clientes values(19, 'Javier', 'Gallardo', 'Via Roma 123', 'Italia', 'Roma');
insert into clientes values(20, 'Isabella', 'Ortega', 'Rua Principal 456', 'Portugal', 'Lisboa');
insert into clientes values(21, 'Manuel', 'Santos', 'Avenida Central 789', 'España', 'Barcelona');
insert into clientes values(22, 'Julia', 'Herrera', 'Rua Principal 123', 'Brasil', 'São Paulo');
insert into clientes values(23, 'Fernando', 'González', '123 Main Street', 'Estados Unidos', 'Los Ángeles');
insert into clientes values(24, 'Carolina', 'Navarro', 'Rue Principale 456', 'Francia', 'Marsella');
insert into clientes values(25, 'Gabriel', 'López', 'Hauptstrasse 789', 'Alemania', 'Hamburgo');
insert into clientes values(26, 'Valeria', 'Rojas', 'Via Roma 123', 'Italia', 'Venecia');
insert into clientes values(27, 'Ricardo', 'Montes', 'Rua Principal 456', 'Portugal', 'Oporto');
insert into clientes values(28, 'Marcela', 'Chávez', 'Calle Mayor 789', 'Argentina', 'Córdoba');
insert into clientes values(29, 'Jorge', 'Figueroa', '123 First Street', 'Canadá', 'Montreal');
insert into clientes values(30, 'Renata', 'Vargas', 'Rue Principale 456', 'Suiza', 'Ginebra');
insert into clientes values(31, 'Mateo', 'Castro', 'Hauptstrasse 789', 'Austria', 'Salzburgo');
insert into clientes values(32, 'Daniela', 'Peña', 'Via Roma 123', 'Italia', 'Florencia');
insert into clientes values(33, 'Sebastián', 'Lara', 'Rua Principal 456', 'Portugal', 'Lisboa');
insert into clientes values(34, 'Valentina', 'Salazar', 'Calle Mayor 789', 'Chile', 'Valparaíso');
insert into clientes values(35, 'Martín', 'Ortiz', '123 Main Street', 'Australia', 'Melbourne');
insert into clientes values(36, 'Catalina', 'Soto', 'Rue Principale 456', 'Bélgica', 'Lieja');
insert into clientes values(37, 'Alejandro', 'Ríos', 'Hauptstrasse 789', 'Holanda', 'Róterdam');
insert into clientes values(38, 'Isabel', 'Silva', 'Via Roma 123', 'Italia', 'Roma');
insert into clientes values(39, 'Leonardo', 'Guerrero', 'Rua Principal 456', 'Portugal', 'Lisboa');
insert into clientes values(40, 'Renata', 'Molina', 'Calle Mayor 789', 'Argentina', 'Rosario');

SELECT * 
FROM clientes
WHERE pais = 'Italia';

-- AND 
SELECT * 
FROM clientes
WHERE 
	pais = 'Italia' AND ciudad = 'Roma' AND nombre = 'Javier';

-- OR (Se puede usar tantas veces como se QUIERA)
SELECT * 
FROM clientes
WHERE 
	pais = 'Italia' AND (ciudad = 'Roma' OR ciudad = 'Venecia');

-- NOT
SELECT * 
FROM clientes
WHERE 
	NOT pais = 'Italia' AND NOT pais = 'Canadá';

-- 37 CLAUSULA BETWEEN
SELECT * 
FROM empleados
WHERE id_empleado in(1,3,4,5,9);

SELECT * 
FROM empleados
WHERE id_empleado BETWEEN 1 AND 7;

SELECT * 
FROM empleados
WHERE 
	id_empleado BETWEEN 1 AND 7 
	OR
	cant_hijos  BETWEEN 1 AND 3
;

	
SELECT * 
FROM empleados
WHERE 
	sueldo BETWEEN 2000 AND 4000
	AND
	puesto  NOT IN('Desarrollador','Técnico')
;

SELECT * 
FROM clientes
WHERE pais BETWEEN 'Alemania' AND 'Canadá' -- Usa el orden alfabético
ORDER BY pais
;

-- 38 CLAUSULA LIKE Y NOT LIKE
SELECT * 
FROM clientes
WHERE nombre LIKE 'A%'
;

SELECT * 
FROM clientes
WHERE nombre LIKE '%an%'
;

SELECT * 
FROM clientes
WHERE nombre LIKE 'an%'
;

SELECT * 
FROM clientes
WHERE nombre LIKE '%an'
;

SELECT * 
FROM clientes
WHERE nombre LIKE '_A%' -- Una a como segundo caracter
;

SELECT * 
FROM clientes
WHERE nombre LIKE 'a%o' -- "Alejandro"
;

SELECT * 
FROM clientes
WHERE nombre NOT LIKE 'a%o' -- "Alejandro"
;

-- 39 INNER JOIN (”Múltiples tablas”)
DROP TABLE clientes;

create table clientes(
idcliente int not null primary key,
nombre varchar(20) not null,
apellido varchar(30) not null,
direccion varchar(100) not null,
ciudad varchar(50) not null,
telefono numeric(10) null,
);

INSERT INTO clientes (idcliente, nombre, apellido, direccion, ciudad, telefono)
VALUES
(1, 'Juan', 'Pérez', 'Calle 123', 'Ciudad A', 1234567890),
(2, 'María', 'González', 'Avenida 456', 'Ciudad B', 2345678901),
(3, 'Pedro', 'López', 'Calle Principal', 'Ciudad C', 3456789012),
(4, 'Laura', 'Martínez', 'Avenida Central', 'Ciudad A', 4567890123),
(5, 'Carlos', 'Hernández', 'Calle 789', 'Ciudad B', 5678901234),
(6, 'Ana', 'Sánchez', 'Avenida Secundaria', 'Ciudad C', 6789012345),
(7, 'Luis', 'Rodríguez', 'Calle 321', 'Ciudad A', 7890123456),
(8, 'Sofía', 'Fernández', 'Avenida 654', 'Ciudad B', 8901234567),
(9, 'Andrés', 'Gómez', 'Calle Secundaria', 'Ciudad C', 9012345678),
(10, 'Marta', 'Torres', 'Avenida Principal', 'Ciudad A', 1234567890),
(11, 'Alejandro', 'Vargas', 'Calle Central', 'Ciudad B', 2345678901),
(12, 'Patricia', 'Ortega', 'Avenida 123', 'Ciudad C', 3456789012),
(13, 'Roberto', 'Jiménez', 'Calle 456', 'Ciudad A', 4567890123),
(14, 'Elena', 'Ruíz', 'Avenida 789', 'Ciudad B', 5678901234),
(15, 'Javier', 'Navarro', 'Calle Secundaria', 'Ciudad C', 6789012345),
(16, 'Carolina', 'Lara', 'Avenida 321', 'Ciudad A', 7890123456),
(17, 'Diego', 'Silva', 'Calle 654', 'Ciudad B', 8901234567),
(18, 'Lucía', 'Romero', 'Avenida Central', 'Ciudad C', 9012345678),
(19, 'Gabriel', 'Flores', 'Calle Principal', 'Ciudad A', 1234567890),
(20, 'Valentina', 'Mendoza', 'Avenida Secundaria', 'Ciudad B', 2345678901),
(21, 'Mario', 'López', 'Calle 789', 'Ciudad A', 3456789012),
(22, 'Camila', 'García', 'Avenida 456', 'Ciudad B', 4567890123),
(23, 'José', 'Hernández', 'Calle Principal', 'Ciudad C', 5678901234),
(24, 'Isabel', 'Rojas', 'Avenida Central', 'Ciudad A', 6789012345),
(25, 'Fernando', 'Gómez', 'Calle 123', 'Ciudad B', 7890123456),
(26, 'Ana', 'Lara', 'Avenida Secundaria', 'Ciudad C', 8901234567),
(27, 'Pedro', 'Fuentes', 'Calle 321', 'Ciudad A', 9012345678),
(28, 'Sara', 'Martínez', 'Avenida 654', 'Ciudad B', 1234567890),
(29, 'Gabriel', 'Sánchez', 'Calle Secundaria', 'Ciudad C', 2345678901),
(30, 'Valeria', 'Ortega', 'Avenida Principal', 'Ciudad A', 3456789012),
(31, 'Luisa', 'Vargas', 'Calle Central', 'Ciudad B', 4567890123),
(32, 'Daniel', 'Silva', 'Avenida 123', 'Ciudad C', 5678901234),
(33, 'Carolina', 'Torres', 'Calle 456', 'Ciudad A', 6789012345),
(34, 'Andrés', 'Guzmán', 'Avenida 789', 'Ciudad B', 7890123456),
(35, 'María', 'Romero', 'Calle Secundaria', 'Ciudad C', 8901234567),
(36, 'Alejandro', 'Mendoza', 'Avenida 321', 'Ciudad A', 9012345678),
(37, 'Valentina', 'Pérez', 'Calle 654', 'Ciudad B', 1234567890),
(38, 'Roberto', 'Fernández', 'Avenida Central', 'Ciudad C', 2345678901),
(39, 'Laura', 'González', 'Calle Principal', 'Ciudad A', 3456789012),
(40, 'Javier', 'Soto', 'Avenida Secundaria', 'Ciudad B', 4567890123);

DROP ordenes;

create table ordenes(
id_orden int not null primary key,
idcliente int foreign key references clientes(idcliente),
fecha_orden date default getdate(),
id_vendedor int not null
);

insert into ordenes values(1, 1, '2020-01-12' ,1);
insert into ordenes values(2, 2, '2021-03-20', 2);
insert into ordenes values(3, 3, '2021-06-10', 3);
insert into ordenes values(4, 4, '2021-09-05', 4);
insert into ordenes values(5, 5, GETDATE(),5);
insert into ordenes values(6, 1, '2022-02-28', 1);
insert into ordenes values(7, 2, '2022-05-14', 2);
insert into ordenes values(8, 3, '2022-07-29', 3);
insert into ordenes values(9, 4, GETDATE(), 4);
insert into ordenes values(10, 5, '2022-12-23', 5);
insert into ordenes values(11, 1, '2023-02-14', 1);
insert into ordenes values(12, 2, '2023-04-30', 2);
insert into ordenes values(13, 3, GETDATE(), 3);
insert into ordenes values(14, 4, '2023-09-28', 4);
insert into ordenes values(15, 5, '2023-11-12', 5);
insert into ordenes values(16, 1, '2023-02-05', 1);
insert into ordenes values(17, 2, '2023-04-12', 2);
insert into ordenes values(18, 3, '2023-07-20', 3);
insert into ordenes values(19, 4, GETDATE(), 4);
insert into ordenes values(20, 5, '2023-12-30', 5);
insert into ordenes values(21, 1, '2021-01-15', 1);
insert into ordenes values(22, 2, '2021-03-20', 2);
insert into ordenes values(23, 3, '2021-06-10', 3);
insert into ordenes values(24, 4, '2021-09-05', 4);
insert into ordenes values(25, 5, GETDATE(), 5);
insert into ordenes values(26, 1, '2022-02-28', 1);
insert into ordenes values(27, 2, '2022-05-14', 2);
insert into ordenes values(28, 3, '2022-07-29', 3);
insert into ordenes values(29, 4, GETDATE(), 4);
insert into ordenes values(30, 5, '2022-12-23', 5);
insert into ordenes values(31, 1, '2023-02-14', 1);
insert into ordenes values(32, 2, '2023-04-30', 2);
insert into ordenes values(33, 3, GETDATE(), 3);
insert into ordenes values(34, 4, '2023-09-28', 4);
insert into ordenes values(35, 5, '2023-11-12', 5);
insert into ordenes values(36, 1, '2023-02-05', 1);
insert into ordenes values(37, 2, '2023-04-12', 2);
insert into ordenes values(38, 3, '2023-07-20', 3);
insert into ordenes values(39, 4, GETDATE(), 4);
insert into ordenes values(40, 5, '2023-12-30', 5);

-- LA TABLA DE LA IZQUIERDA O TABLA 1 ES LA PRIMERA QUE SE COLOCA EN LA CONSULTA

SELECT * FROM clientes;

SELECT * FROM ordenes;

-- Cuántos pedidos tiene cada cliente?
SELECT ordenes.id_orden, clientes.nombre, clientes.telefono, ordenes.fecha_orden
FROM
	ordenes	INNER JOIN clientes  -- LA TABLA DE LA IZQUIERDA O TABLA 1 ES LA PRIMERA QUE SE COLOCA EN LA CONSULTA
	ON ordenes.idcliente = clientes.idcliente -- ENCAJE
;


SELECT ordenes.id_orden, clientes.nombre, clientes.telefono, ordenes.fecha_orden
FROM
	ordenes	INNER JOIN clientes  -- LA TABLA DE LA IZQUIERDA O TABLA 1 ES LA PRIMERA QUE SE COLOCA EN LA CONSULTA
	ON ordenes.idcliente = clientes.idcliente -- ENCAJE
WHERE nombre = 'Juan'
ORDER BY fecha_orden
;

--  40 LEFT JOIN 
SELECT clientes.nombre, clientes.apellido, ordenes.id_orden, ordenes.fecha_orden
FROM
	clientes LEFT JOIN ordenes
	ON clientes.idcliente = ordenes.idcliente
ORDER BY id_orden
;

SELECT cli.nombre, cli.apellido, ord.id_orden, ord.fecha_orden
FROM
	clientes cli LEFT JOIN ordenes ord  -- TABLAS
	ON cli.idcliente = ord.idcliente	-- ENCAJE
ORDER BY id_orden
;


-- 41 FULL JOIN, RIGHT JOIN, DIFERENCIA SIMÉTRICA

-- RIGHT JOIN 
SELECT ordenes.id_orden, clientes.nombre, clientes.apellido
FROM
	clientes RIGHT JOIN ordenes
	ON clientes.idcliente = ordenes.idcliente
;

-- FULL JOIN
SELECT ordenes.id_orden, clientes.nombre, clientes.apellido, ordenes.id_orden
FROM
	clientes FULL JOIN ordenes
	ON clientes.idcliente = ordenes.idcliente
;

-- DIFERENCIA SIMÉTRICA
CREATE TABLE employees_2023 (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE employees_2024 (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO employees_2023 (employee_id, first_name, last_name)
VALUES (1, 'John', 'Doe'), (2, 'Jane', 'Smith'), (3, 'Sam', 'Johnson');

INSERT INTO employees_2024 (employee_id, first_name, last_name)
VALUES (2, 'Jane', 'Smith'), (3, 'Sam', 'Johnson'), (4, 'Alice', 'Brown');

SELECT employee_id, first_name, last_name
FROM employees_2023
EXCEPT
SELECT employee_id, first_name, last_name
FROM employees_2024
UNION
SELECT employee_id, first_name, last_name
FROM employees_2024
EXCEPT
SELECT employee_id, first_name, last_name
FROM employees_2023;

-- 42 CLAUSULA UNION
DROP TABLE ordenes;
DROP TABLE clientes;

CREATE TABLE clientes (
idcliente INT PRIMARY KEY,
nom_cliente VARCHAR(100),
contacto VARCHAR(100),
direccion VARCHAR(100),
ciudad VARCHAR(100),
codigo_postal VARCHAR(10),
pais VARCHAR(50)
);


insert into clientes values(1, 'Juan Perez', 'Juan Perez', 'Calle Falsa 123', 'Ciudad Ficticia', '12345', 'Argentina');
insert into clientes values(2, 'Maria Lopez', 'Maria Lopez', 'Avenida Imaginaria 456', 'Otra Ciudad', '54321', 'México');
insert into clientes values(3, 'Carlos Ramirez', 'Carlos Ramirez', 'Carrera Inexistente 789', 'Ciudad Fantasma', '67890', 'Colombia');
insert into clientes values(4, 'Luisa Fernández', 'Luisa Fernández', 'Calle Sin Nombre 42', 'Ciudad Irreal', '24680', 'Perú');
insert into clientes values(5, 'Roberto Castro', 'Roberto Castro', 'Paseo de los Sueños 789', 'Ciudad de Ensueño', '98765', 'Chile');
insert into clientes values(6, 'Ana Gómez', 'Ana Gómez', 'Avenida de los Sueños 111', 'Ciudad de Ensueño', '12345', 'México');
insert into clientes values(7, 'Pedro Rodríguez', 'Pedro Rodríguez', 'Calle del Sol 222', 'Ciudad del Sol', '54321', 'Argentina');
insert into clientes values(8, 'Laura Silva', 'Laura Silva', 'Carrera Imaginaria 333', 'Ciudad Ficticia', '67890', 'Colombia');
insert into clientes values(9, 'Javier Martínez', 'Javier Martínez', 'Paseo Sin Fin 444', 'Ciudad Irreal', '24680', 'Perú');
insert into clientes values(10, 'María Torres', 'María Torres', 'Avenida del Lago 555', 'Ciudad de Ensueño', '98765', 'Chile');
insert into clientes values(11, 'Roberto González', 'Roberto González', 'Calle del Bosque 666', 'Ciudad del Sol', '13579', 'Argentina');
insert into clientes values(12, 'Carolina Herrera', 'Carolina Herrera', 'Carrera de los Sueños 777', 'Ciudad Ficticia', '86420', 'Colombia');
insert into clientes values(13, 'Daniel Mendoza', 'Daniel Mendoza', 'Paseo del Mar 888', 'Ciudad Irreal', '24680', 'Perú');
insert into clientes values(14, 'Sofía Ramírez', 'Sofía Ramírez', 'Avenida del Viento 999', 'Ciudad de Ensueño', '98765', 'Chile');
insert into clientes values(15, 'Fernando Morales', 'Fernando Morales', 'Calle del Monte 1010', 'Ciudad del Sol', '24680', 'Argentina');
insert into clientes values(16, 'Valeria Peña', 'Valeria Peña', 'Carrera del Río 1111', 'Ciudad Ficticia', '86420', 'Colombia');
insert into clientes values(17, 'Hugo Rojas', 'Hugo Rojas', 'Paseo de la Montaña 1212', 'Ciudad Irreal', '13579', 'Perú');
insert into clientes values(18, 'Gabriela Salinas', 'Gabriela Salinas', 'Avenida del Mar 1313', 'Ciudad de Ensueño', '98765', 'Chile');
insert into clientes values(19, 'Andrés Castro', 'Andrés Castro', 'Calle del Cielo 1414', 'Ciudad del Sol', '86420', 'Argentina');
insert into clientes values(20, 'Luisana Sánchez', 'Luisana Sánchez', 'Carrera del Horizonte 1515', 'Ciudad Ficticia', '13579', 'Colombia');
insert into clientes values(21, 'Martín Vega', 'Martín Vega', 'Paseo del Bosque 1616', 'Ciudad Irreal', '86420', 'Perú');
insert into clientes values(22, 'Carla Medina', 'Carla Medina', 'Avenida de los Ángeles 1717', 'Ciudad de Ensueño', '98765', 'Chile');
insert into clientes values(24, 'Cecilia Ramos', 'Cecilia Ramos', 'Carrera de la Luna 1919', 'Ciudad Ficticia', '13579', 'Argentina');
insert into clientes values(25, 'Alejandro Vargas', 'Alejandro Vargas', 'Paseo del Sol 2020', 'Ciudad Irreal', '86420', 'Colombia');
insert into clientes values(26, 'Daniela Fernández', 'Daniela Fernández', 'Avenida del Cielo 2121', 'Ciudad de Ensueño', '98765', 'Chile');
insert into clientes values(27, 'Manuel Torres', 'Manuel Torres', 'Calle del Mar 2222', 'Ciudad del Sol', '86420', 'Argentina');
insert into clientes values(28, 'Gabriela Mendoza', 'Gabriela Mendoza', 'Carrera de la Montaña 2323', 'Ciudad Ficticia', '13579', 'Colombia');
insert into clientes values(29, 'Sebastián Rojas', 'Sebastián Rojas', 'Paseo del Río 2424', 'Ciudad Irreal', '98765', 'Perú');
insert into clientes values(30, 'Valentina Salazar', 'Valentina Salazar', 'Avenida del Bosque 2525', 'Ciudad de Ensueño', '86420', 'Chile');
insert into clientes values(31, 'Francisco Morales', 'Francisco Morales', 'Calle de la Luna 2626', 'Ciudad del Sol', '13579', 'Argentina');
insert into clientes values(32, 'Marcela Vega', 'Marcela Vega', 'Carrera del Sol 2727', 'Ciudad Ficticia', '98765', 'Colombia');
insert into clientes values(33, 'Andrés Castro', 'Andrés Castro', 'Paseo de los Sueños 2828', 'Ciudad Irreal', '86420', 'Perú');
insert into clientes values(34, 'Daniela Rojas', 'Daniela Rojas', 'Avenida de la Fantasía 2929', 'Ciudad de Ensueño', '13579', 'Chile');
insert into clientes values(35, 'Roberto Salinas', 'Roberto Salinas', 'Calle de los Sueños 3030', 'Ciudad del Sol', '98765', 'Argentina');
insert into clientes values(36, 'Laura Torres', 'Laura Torres', 'Carrera de la Imaginación 3131', 'Ciudad Ficticia', '86420', 'Colombia');
insert into clientes values(37, 'Javier Mendoza', 'Javier Mendoza', 'Paseo de los Sueños 3232', 'Ciudad Irreal', '13579', 'Perú');
insert into clientes values(38, 'Carolina Salazar', 'Carolina Salazar', 'Avenida de los Recuerdos 3333', 'Ciudad de Ensueño', '98765', 'Chile');
insert into clientes values(39, 'Gabriel Medina', 'Gabriel Medina', 'Calle de la Esperanza 3434', 'Ciudad del Sol', '86420', 'Argentina');
insert into clientes values(40, 'Isabella Vargas', 'Isabella Vargas', 'Carrera de los Sueños 3535', 'Ciudad Ficticia', '13579', 'Colombia');
  
DROP TABLE suplidores;
CREATE TABLE suplidores (
idsuplidor INT PRIMARY KEY,
empresa VARCHAR(100),
contacto VARCHAR(100),
direccion VARCHAR(100),
ciudad VARCHAR(100),
codigo_postal VARCHAR(10),
pais VARCHAR(50)
);

insert into suplidores values(6, 'Acme Corporation', 'John Smith', '123 Main Street', 'New York', '10001', 'Argentina');
insert into suplidores values(7, 'Globex Corporation', 'Jane Doe', '456 Elm Street', 'Los Angeles', '90001', 'Perú');
insert into suplidores values(8, 'Wayne Enterprises', 'Bruce Wayne', '789 Park Avenue', 'Gotham City', '12345', 'Colombia');
insert into suplidores values(9, 'Stark Industries', 'Tony Stark', '1 Stark Tower', 'New York', '10001', 'Chile');
insert into suplidores values(10, 'LexCorp', 'Lex Luthor', '555 LexCorp Plaza', 'Metropolis', '54321', 'Argentina');
insert into suplidores values(11, 'Umbrella Corporation', 'Albert Wesker', '777 Raccoon Street', 'Raccoon City', '67890', 'Venezuela');
insert into suplidores values(12, 'Weyland-Yutani Corporation', 'Ellen Ripley', '888 Nostromo Way', 'Hadleys Hope', '24680', 'Rep. Dominicana');
insert into suplidores values(13, 'InGen', 'John Hammond', 'Jurassic Park', 'Isla Nublar', '98765', 'Costa Rica');
insert into suplidores values(14, 'Tyrell Corporation', 'Eldon Tyrell', '123 Tyrell Building', 'Los Angeles', '90001', 'United States');


SELECT contacto, ciudad, pais FROM clientes
UNION
SELECT contacto, ciudad, pais FROM suplidores;


SELECT contacto, ciudad, pais FROM clientes
UNION ALL
SELECT contacto, ciudad, pais FROM suplidores;

-- DIFERENCIAR DE DONDE VIENEN LOS DATOS
SELECT 'Cliente' AS Tipo, contacto, ciudad, pais FROM clientes
UNION
SELECT 'Suplidor' AS Tipo, contacto, ciudad, pais FROM suplidores;

-- 43 GROUP BY
CREATE TABLE ordenes (
idorden INT PRIMARY KEY,
idcliente INT,
idempleado INT,
fecha_orden DATE,
id_vendedor INT
);

insert into ordenes values(1, 1001, 2001, '2023-06-01', 1);
insert into ordenes values(2, 1002, 2002, '2023-06-02', 2);
insert into ordenes values(3, 1003, 2003, '2023-06-03', 3);
insert into ordenes values(4, 1004, 2004, '2023-06-04', 4);
insert into ordenes values(5, 1005, 2005, '2023-06-05', 5);
insert into ordenes values(6, 1006, 2006, '2023-06-06', 6);
insert into ordenes values(7, 1007, 2007, '2023-06-07', 7);
insert into ordenes values(8, 1008, 2008, '2023-06-08', 1);
insert into ordenes values(9, 1009, 2009, '2023-06-09', 2);
insert into ordenes values(10, 1010, 2010, '2023-06-10', 3);
insert into ordenes values(11, 1011, 2011, '2023-06-11', 4);
insert into ordenes values(12, 1012, 2012, '2023-06-12', 5);
insert into ordenes values(13, 1013, 2013, '2023-06-13', 6);
insert into ordenes values(14, 1014, 2014, '2023-06-14', 7);
insert into ordenes values(15, 1015, 2015, '2023-06-15', 1);
insert into ordenes values(16, 1016, 2016, '2023-06-16', 2);
insert into ordenes values(17, 1017, 2017, '2023-06-17', 3);
insert into ordenes values(18, 1018, 2018, '2023-06-18', 4);
insert into ordenes values(19, 1019, 2019, '2023-06-19', 5);
insert into ordenes values(20, 1020, 2020, '2023-06-20', 6);
insert into ordenes values(21, 1021, 2021, '2019-07-15', 1);
insert into ordenes values(22, 1022, 2022, '2020-02-28', 2);
insert into ordenes values(23, 1023, 2023, '2020-11-10', 3);
insert into ordenes values(24, 1024, 2024, '2021-05-07', 4);
insert into ordenes values(25, 1025, 2025, '2021-12-25', 5);
insert into ordenes values(26, 1026, 2026, '2022-08-18', 6);
insert into ordenes values(27, 1027, 2027, '2023-03-01', 7);
insert into ordenes values(28, 1028, 2028, '2019-10-22', 1);
insert into ordenes values(29, 1029, 2029, '2020-07-12', 2);
insert into ordenes values(30, 1030, 2030, '2020-11-30', 3);
insert into ordenes values(31, 1031, 2031, '2021-08-04', 4);
insert into ordenes values(32, 1032, 2032, '2022-01-15', 5);
insert into ordenes values(33, 1033, 2033, '2022-10-05', 6);
insert into ordenes values(34, 1034, 2034, '2023-05-18', 7);
insert into ordenes values(35, 1035, 2035, '2019-12-08', 1);
insert into ordenes values(36, 1036, 2036, '2020-06-25', 2);
insert into ordenes values(37, 1037, 2037, '2020-09-17', 3);
insert into ordenes values(38, 1038, 2038, '2021-04-02', 4);
insert into ordenes values(39, 1039, 2039, '2022-01-05', 5);
insert into ordenes values(40, 1040, 2040, '2022-09-28', 6);


CREATE TABLE vendedor (
id_vendedor INT PRIMARY KEY,
nombre VARCHAR(50),
telefono VARCHAR(20)
);

insert into vendedor values(1, 'Juan Pérez', '1234567890');
insert into vendedor values(2, 'María Gómez', '9876543210');
insert into vendedor values(3, 'Carlos Rodríguez', '5555555555');
insert into vendedor values(4, 'Laura López', '9999999999');
insert into vendedor values(5, 'Pedro Martínez', '1111111111');
insert into vendedor values(6, 'Ana Sánchez', '2222222222');
insert into vendedor values(7, 'José Morales', '3333333333');
	
SELECT pais, COUNT(idcliente) AS Cantidad
FROM clientes
GROUP BY pais
ORDER BY Cantidad DESC
;

SELECT pais, MAX(idcliente) AS id_Cliente_Max
FROM clientes
GROUP BY pais
ORDER BY id_Cliente_Max DESC
;

SELECT vendedor.nombre, COUNT(ordenes.idorden) AS "Cantidad de Órdenes"
FROM
	ordenes LEFT JOIN vendedor
	ON ordenes.id_vendedor = vendedor.id_vendedor
GROUP BY vendedor.nombre
ORDER BY [Cantidad de Órdenes] DESC
;

-- 44 HAVING --
/* En SQL Server, la cláusula HAVING no permite referirse a los alias definidos en el SELECT 
porque HAVING se evalúa antes de que los alias se definan en el SELECT.*/

drop table clientes;

CREATE TABLE clientes (
idcliente INT,
nombre VARCHAR(50),
direccion VARCHAR(100),
ciudad VARCHAR(50),
codigo_postal VARCHAR(10),
pais VARCHAR(50)
);

INSERT INTO clientes (idcliente, nombre, direccion, ciudad, codigo_postal, pais)
VALUES
(1, 'Juan Pérez', 'Calle 123', 'Ciudad de México', '12345', 'México'),
(2, 'María García', 'Avenida Principal 456', 'Monterrey', '67890', 'México'),
(3, 'Carlos López', 'Calle Principal 789', 'Guadalajara', '54321', 'México'),
(4, 'Ana Rodríguez', 'Carrera 10', 'Bogotá', '11111', 'Colombia'),
(5, 'Luisa Martínez', 'Calle 20', 'Medellín', '22222', 'Colombia'),
(6, 'Pedro Gómez', 'Avenida Central', 'Cali', '33333', 'Colombia'),
(7, 'Pablo Fernández', 'Calle Principal 1', 'Madrid', '28001', 'España'),
(8, 'Sofía Torres', 'Avenida Gran Vía', 'Barcelona', '08001', 'España'),
(9, 'Javier Ramírez', 'Calle Diagonal', 'Valencia', '46001', 'España'),
(10, 'Fernanda Silva', 'Avenida 9 de Julio', 'Buenos Aires', '1000', 'Argentina'),
(11, 'Diego López', 'Calle Florida', 'Córdoba', '2000', 'Argentina'),
(12, 'Gabriela González', 'Avenida Libertador', 'Rosario', '3000', 'Argentina'),
(13, 'Mario Huamán', 'Jirón de la Unión', 'Lima', '01', 'Perú'),
(14, 'Rosa Cruz', 'Avenida Arequipa', 'Arequipa', '02', 'Perú'),
(15, 'Andrés Torres', 'Calle Las Nazarenas', 'Cusco', '03', 'Perú'),
(16, 'Camila Soto', 'Avenida Providencia', 'Santiago', '8320000', 'Chile'),
(17, 'Lucas Morales', 'Calle Alonso de Córdova', 'Viña del Mar', '8320000', 'Chile'),
(18, 'Valentina Castro', 'Avenida Apoquindo', 'Valparaíso', '8320000', 'Chile'),
(19, 'Mariano Mendoza', 'Calle Tacna', 'Arica', '1000000', 'Chile'),
(20, 'Laura Torres', 'Avenida Pedro Montt', 'Antofagasta', '1000000', 'Chile'),
(21, 'Isabella Morales', 'Calle Principal 2', 'Ciudad de México', '54321', 'México'),
(22, 'Emilio Vargas', 'Avenida Reforma', 'Ciudad de México', '12345', 'México'),
(23, 'Valeria González', 'Calle Morelos', 'Monterrey', '67890', 'México'),
(24, 'Daniel Silva', 'Avenida Juárez', 'Monterrey', '54321', 'México'),
(25, 'Sara Ramírez', 'Calle Independencia', 'Guadalajara', '11111', 'México'),
(26, 'Javier García', 'Avenida Hidalgo', 'Guadalajara', '22222', 'México'),
(27, 'Camila Torres', 'Calle 20 de Noviembre', 'Bogotá', '33333', 'Colombia'),
(28, 'Diego Castro', 'Avenida de los Andes', 'Bogotá', '67890', 'Colombia'),
(29, 'Valentina Vargas', 'Calle Santander', 'Medellín', '11111', 'Colombia'),
(30, 'Andrés Pérez', 'Avenida Oriental', 'Medellín', '54321', 'Colombia'),
(31, 'Luciana López', 'Calle Mayor', 'Cali', '22222', 'Colombia'),
(32, 'Sebastián Ramírez', 'Avenida 9 de Octubre', 'Cali', '33333', 'Colombia'),
(33, 'Paula Fernández', 'Calle Gran Vía', 'Madrid', '11111', 'España'),
(34, 'Joaquín Torres', 'Avenida Paseo del Prado', 'Madrid', '22222', 'España'),
(35, 'Lucía Herrera', 'Calle Serrano', 'Barcelona', '33333', 'España'),
(36, 'Tomás Martínez', 'Avenida Diagonal', 'Barcelona', '67890', 'España'),
(37, 'Catalina Castro', 'Calle San Martín', 'Valencia', '54321', 'España'),
(38, 'Mateo Morales', 'Avenida Blasco Ibáñez', 'Valencia', '11111', 'España'),
(39, 'Isidora Ramírez', 'Calle Florida', 'Buenos Aires', '22222', 'Argentina'),
(40, 'Benjamín Silva', 'Avenida Corrientes', 'Buenos Aires', '33333', 'Argentina'),
(41, 'Valentín Gómez', 'Calle Hidalgo', 'Córdoba', '67890', 'Argentina'),
(42, 'Renata Torres', 'Avenida Libertador', 'Córdoba', '54321', 'Argentina'),
(43, 'Emilio Soto', 'Calle Santa Fe', 'Rosario', '11111', 'Argentina'),
(44, 'Martina Morales', 'Avenida 27 de Abril', 'Rosario', '22222', 'Argentina'),
(45, 'Felipe González', 'Calle Huallaga', 'Lima', '33333', 'Perú'),
(46, 'Renata Castro', 'Avenida Abancay', 'Lima', '67890', 'Perú'),
(47, 'Sebastián Herrera', 'Calle Mariscal Miller', 'Arequipa', '54321', 'Perú'),
(48, 'Antonella Ramírez', 'Avenida Dolores', 'Arequipa', '11111', 'Perú'),
(49, 'Maximiliano Silva', 'Calle Merced', 'Cusco', '22222', 'Perú'),
(50, 'Valentina Torres', 'Avenida El Sol', 'Cusco', '33333', 'Perú'),
(51, 'Agustín Morales', 'Calle Merced', 'Santiago', '67890', 'Chile'),
(52, 'Renata Castro', 'Avenida Providencia', 'Santiago', '54321', 'Chile'),
(53, 'Matías Herrera', 'Calle Alonso de Córdova', 'Viña del Mar', '11111', 'Chile'),
(54, 'Emilia Ramírez', 'Avenida San Martín', 'Viña del Mar', '22222', 'Chile'),
(55, 'Luciano González', 'Calle San Martín', 'Valparaíso', '33333', 'Chile'),
(56, 'Delfina Silva', 'Avenida Errázuriz', 'Valparaíso', '67890', 'Chile'),
(57, 'Máximo López', 'Calle 21 de Mayo', 'Arica', '54321', 'Chile'),
(58, 'Isidora Morales', 'Avenida Pedro Montt', 'Arica', '11111', 'Chile'),
(59, 'Felipe Castro', 'Calle Rancagua', 'Antofagasta', '22222', 'Chile'),
(60, 'Constanza Torres', 'Avenida Balmaceda', 'Antofagasta', '33333', 'Chile');


--En SQL Server, la cláusula HAVING no permite referirse a los alias definidos en el SELECT porque HAVING se evalúa antes de que los alias se definan en el SELECT.

SELECT * 
FROM clientes;

SELECT COUNT(idcliente), pais
FROM clientes
GROUP BY pais
HAVING COUNT(idcliente) > 5
ORDER BY COUNT(idcliente) DESC
;

SELECT COUNT(idcliente) AS Cantidad_de_Clientes, pais
FROM clientes
GROUP BY pais
HAVING COUNT(idcliente) > 5
ORDER BY Cantidad_de_Clientes DESC;

/* En SQL Server, la cláusula HAVING no permite referirse a los alias definidos en el SELECT 
porque HAVING se evalúa antes de que los alias se definan en el SELECT.*/

SELECT vendedor.nombre, COUNT(ordenes.idorden) AS Cant_de_Ordenes
FROM
	ordenes INNER JOIN vendedor
	ON ordenes.id_vendedor = vendedor.id_vendedor
GROUP BY vendedor.nombre
HAVING COUNT(ordenes.idorden) > 2
;

SELECT vendedor.nombre, COUNT(ordenes.idorden) AS Cant_de_Ordenes
FROM
	ordenes INNER JOIN vendedor
	ON ordenes.id_vendedor = vendedor.id_vendedor
WHERE nombre like '%Ana%' OR nombre LIKE '%Pedro%'
GROUP BY vendedor.nombre
HAVING COUNT(ordenes.idorden) > 2
;

-- 45 SUBCONSULTAS: PARTE 1
/*
** La subconsulta debe ir entre paréntesis
** Se debe especifica solo una columna o expresión
** Usar con IN, ANY, ALL y Exists
** NO pueden contener Between ni LIKE
** NO admite el uso de Order BY
** NO se puede usar Update
** NO se puede usar DELETE
*/

DROP TABLE facturas;
create table facturas(
numero int not null,
fecha datetime,
cliente varchar(30),
primary key(numero)
);

create table detalles(
numerofactura int not null,
numeroitem int not null, 
articulo varchar(30),
precio decimal(5,2),
cantidad int,
primary key(numerofactura,numeroitem),
constraint FK_detalles_numerofactura
foreign key (numerofactura)
references facturas(numero)
on update cascade
on delete cascade
);

go

set dateformat ymd;
INSERT INTO facturas 
(numero, fecha, cliente) 
VALUES
(1, '2023-06-28', 'Juan Pérez'),
(2, '2023-06-28', 'María González'),
(3, '2023-06-28', 'Carlos López'),
(4, '2023-06-28', 'Ana Rodríguez'),
(5, '2023-06-28', 'Luisa Martínez'),
(6, '2023-06-28', 'Pedro Hernández'),
(7, '2023-06-28', 'Laura Gómez'),
(8, '2023-06-28', 'Diego Torres'),
(9, '2023-06-28', 'Valentina Ramírez'),
(10, '2023-06-28', 'Andrés Silva'),
(11, '2023-06-28', 'Camila Vargas'),
(12, '2023-06-28', 'Mateo Castro'),
(13, '2023-06-28', 'Isabella Rios'),
(14, '2023-06-28', 'Santiago Morales'),
(15, '2023-06-28', 'Valeria Rojas'),
(16, '2023-06-28', 'Daniel Acosta'),
(17, '2023-06-28', 'Mariana Duarte'),
(18, '2023-06-28', 'Alejandro Cardona'),
(19, '2023-06-28', 'Fernanda Mendoza'),
(20, '2023-06-28', 'Gabriel Medina');

INSERT INTO detalles (numerofactura, numeroitem, articulo, precio, cantidad) VALUES
(1, 1, 'Lápiz', 1.99, 5),
(1, 2, 'Cuaderno', 3.99, 3),
(1, 3, 'Bolígrafo', 0.99, 10),
(2, 1, 'Goma de borrar', 0.5, 8),
(2, 2, 'Marcadores', 2.49, 4),
(2, 3, 'Pegamento', 1.99, 2),
(3, 1, 'Regla', 1.25, 5),
(3, 2, 'Tijeras', 2.99, 2),
(3, 3, 'Notas adhesivas', 0.75, 6),
(4, 1, 'Lápices de colores', 4.99, 1),
(4, 2, 'Borrador', 0.99, 3),
(4, 3, 'Cinta adhesiva', 1.49, 2),
(5, 1, 'Resaltador', 1.75, 4),
(5, 2, 'Papel de carta', 2.99, 2),
(5, 3, 'Clips', 0.25, 10),
(6, 1, 'Corrector líquido', 1.99, 3),
(6, 2, 'Carpeta', 2.49, 2),
(6, 3, 'Sacapuntas', 0.99, 5),
(7, 1, 'Calculadora', 9.99, 1),
(7, 2, 'Agenda', 4.99, 1),
(8, 1, 'Lápiz', 1.99, 5),
(8, 2, 'Cuaderno', 3.99, 3),
(8, 3, 'Bolígrafo', 0.99, 10),
(9, 1, 'Goma de borrar', 0.5, 8),
(9, 2, 'Marcadores', 2.49, 4),
(9, 3, 'Pegamento', 1.99, 2),
(10, 1, 'Regla', 1.25, 5),
(10, 2, 'Tijeras', 2.99, 2),
(10, 3, 'Notas adhesivas', 0.75, 6),
(11, 1, 'Lápices de colores', 4.99, 1),
(11, 2, 'Borrador', 0.99, 3),
(11, 3, 'Cinta adhesiva', 1.49, 2),
(12, 1, 'Resaltador', 1.75, 4),
(12, 2, 'Papel de carta', 2.99, 2),
(12, 3, 'Clips', 0.25, 10),
(13, 1, 'Corrector líquido', 1.99, 3),
(13, 2, 'Carpeta', 2.49, 2),
(13, 3, 'Sacapuntas', 0.99, 5),
(14, 1, 'Calculadora', 9.99, 1),
(14, 2, 'Agenda', 4.99, 1),
(15, 1, 'Lápiz', 1.99, 5),
(15, 2, 'Cuaderno', 3.99, 3),
(15, 3, 'Bolígrafo', 0.99, 10),
(16, 1, 'Goma de borrar', 0.5, 8),
(16, 2, 'Marcadores', 2.49, 4),
(16, 3, 'Pegamento', 1.99, 2),
(17, 1, 'Regla', 1.25, 5),
(17, 2, 'Tijeras', 2.99, 2),
(17, 3, 'Notas adhesivas', 0.75, 6),
(18, 1, 'Lápices de colores', 4.99, 1),
(18, 2, 'Borrador', 0.99, 3),
(18, 3, 'Cinta adhesiva', 1.49, 2),
(19, 1, 'Resaltador', 1.75, 4),
(19, 2, 'Papel de carta', 2.99, 2),
(19, 3, 'Clips', 0.25, 10),
(20, 1, 'Corrector líquido', 1.99, 3),
(20, 2, 'Carpeta', 2.49, 2),
(20, 3, 'Sacapuntas', 0.99, 5),
(1, 4, 'Calculadora', 9.99, 1),
(1, 5, 'Agenda', 4.99, 1);

/*
💡 **REGLAS:**
**** PRIMERO SE ESCRIBE LA SUBCONSULTA y ponla entre paréntesis**
**** La subconsulta debe ir entre paréntesis
** Se debe especificar solo una columna o expresión
** Usar con IN, ANY, ALL y Exists
** NO pueden contener Between ni LIKE
** NO admite el uso de Order BY
** NO se puede usar Update
** NO se puede usar DELETE**
*/

SELECT * FROM facturas;
SELECT * FROM detalles;
SELECT * FROM empleados;
SELECT * FROM clientes;

-- Cuáles empleados Ganan más que el promedio?
SELECT id_empleado, nombre, apellido, sueldo
FROM empleados
WHERE
	sueldo > 
	(	SELECT AVG(sueldo) 
		FROM empleados	) -- PROMEDIO DE SUELDOS
ORDER BY sueldo DESC;

-- BUscar todos los nombres de clientes de Méjico
SELECT nombre, ciudad
FROM clientes
WHERE idcliente IN 
		(
		SELECT idcliente
		FROM clientes
		WHERE pais = 'México'
		)
ORDER BY idcliente
;

SELECT nombre, ciudad
FROM clientes
WHERE idcliente = ANY
		(
		SELECT idcliente
		FROM clientes
		WHERE pais = 'México'
		)
ORDER BY idcliente
;

-- EXISTS
-- Cuáles clientes han comprado lápices?
SELECT * FROM detalles;
SELECT * FROM facturas;
SELECT * FROM empleados;
SELECT * FROM clientes;

SELECT cliente, numero, fecha
FROM facturas
WHERE EXISTS
			(
			SELECT *
			FROM detalles
			WHERE 
				detalles.numerofactura = facturas.numero
				AND
				detalles.articulo = 'Lápiz'
			)
;



-- CUALES CLIENTES NO HAN COMPRADO LAPICES
SELECT * FROM detalles;
SELECT * FROM facturas;
SELECT cliente, numero, fecha
FROM facturas
WHERE NOT EXISTS
			(
			SELECT *
			FROM detalles
			WHERE 
				detalles.numerofactura = facturas.numero
				AND
				detalles.articulo = 'Lápiz'
			)
;

-- 47 ISNULL, COALESCE 
USE Principal;

DROP TABLE productos;

create TABLE productos(
idproducto INT,
nombre VARCHAR(100),
precio_unidad NUMERIC(6,2),
existencia INT,
vendidos INT
);

INSERT INTO productos (idproducto, nombre, precio_unidad, existencia, vendidos)
VALUES
(1, 'Martillo', 12.50, 100, 50),
(2, 'Destornillador', 6.75, 80, NULL),
(3, 'Taladro', 75.00, 25, 10),
(4, 'Sierra eléctrica', 120.25, 15, NULL),
(5, 'Cinta métrica', 5.20, 200, 100),
(6, 'Llave inglesa', 9.80, 50, NULL),
(7, 'Pala', 15.00, 40, 20),
(8, 'Clavos', 1.50, 500, NULL),
(9, 'Tornillos', 2.00, 300, 150),
(10, 'Alicate', 7.25, 70, NULL),
(11, 'Escalera', 40.00, 10, 5),
(12, 'Cincel', 4.30, 40, NULL),
(13, 'Cepillo', 8.15, 30, 15),
(14, 'Nivel', 10.50, 25, NULL),
(15, 'Brocha', 3.75, 120, 60),
(16, 'Talocha', 6.00, 80, NULL),
(17, 'Llave ajustable', 11.20, 45, 25),
(18, 'Mazo', 9.90, 20, NULL),
(19, 'Formón', 5.80, 35, 15),
(20, 'Serrucho', 8.50, 60, NULL),
(21, 'Taladro inalámbrico', 95.00, 20, 15),
(22, 'Llave de tubo', 13.50, 30, 20),
(23, 'Pintura blanca', 18.75, 50, NULL),
(24, 'Cepillo metálico', 6.25, 40, 30),
(25, 'Escuadra', 2.80, 100, 50),
(26, 'Broca para concreto', 4.50, 75, 40),
(27, 'Gafas de seguridad', 8.90, 60, 45),
(28, 'Cinta adhesiva', 1.25, 200, NULL),
(29, 'Nivel láser', 45.50, 10, 5),
(30, 'Sierra de mano', 7.80, 50, 35),
(31, 'Alicates de corte', 9.25, 30, 20),
(32, 'Tornillos de acero', 2.50, 500, NULL),
(33, 'Destornillador de precisión', 5.50, 40, 30),
(34, 'Martillo de goma', 10.75, 25, 20),
(35, 'Llave hexagonal', 6.60, 50, NULL),
(36, 'Pala plegable', 14.00, 15, 10),
(37, 'Escobilla de alambre', 3.25, 80, 60),
(38, 'Clavos galvanizados', 2.75, 1000, NULL),
(39, 'Cincel de punta', 7.40, 35, 25),
(40, 'Cúter', 2.15, 90, NULL);

SELECT * FROM productos;

-- ISNULL : Se pueden setear valores ENTEROS (INT)
SELECT nombre, precio_unidad, ISNULL(vendidos,0) AS vendidos
FROM productos;

SELECT nombre, ISNULL(precio_unidad * (existencia + vendidos),0)
FROM productos;

-- COALESCE
SELECT nombre, precio_unidad, COALESCE(vendidos,0) AS vendidos
FROM productos;

-- 48 CASE ---------------------------------------------------------------------------------
SELECT *
FROM clientes;

UPDATE CLIENTES
SET ciudad = NULL -- PRECAUCIÓN, NO OLVIDAR EL WHERE
WHERE idcliente in(1,3,9,10,13,11,14,20,23,34,38,40,46)
;

SELECT *
FROM articulos;
-- Ver articulos con existencia normal
-- Ver articulos que necesitan ser pedidos
-- Ver articulos menos vendidos
SELECT nombre, cantidad,
CASE 
	WHEN cantidad > 30 THEN 'Articulo con sobre-existencia'
	WHEN cantidad < 10 THEN 'Se debe realizar pedido'
	ELSE 'Existencia normal'
	END AS Inventario
FROM articulos;


-- Generar un reporte con nombre pais y ciudad de los clientes, organizar por ciudad
-- SI el cliente no tiene ciudad organizar por pais
SELECT nombre, ciudad, pais
FROM clientes
ORDER BY
	(CASE
		WHEN ciudad is null THEN pais
		ELSE ciudad
	END)


-- 49 FUNCIONES MATEMATICAS ---------------------------------------------------------
SELECT pi() AS Pi;

-- Redondeo de cifras
SELECT CEILING(123.45) AS redondeo;
SELECT CEILING($123.45) AS redondeo;
SELECT CEILING(-123.45) AS redondeo; -- en este caso solo elimina los decimales, trunca.

-- Floor
SELECT FLOOR(123.45); -- TRUNCA, quita los decimales

-- ROUND
SELECT ROUND(123.45,1);
SELECT ROUND(123.45,5);
SELECT ROUND(123.45,0);

-- ELEVAR
SELECT POWER(4,3);

-- NUMERO ALEATORIO
SELECT RAND()*(100-1)-- Valores aleatorios entre 100 y 1
SELECT RAND()*(4)

-- SENO COSENO
SELECT SIN(45);
SELECT COS(45);

SELECT SIN(90 * PI() / 180) AS SenoDe90Grados;
SELECT COS(0 * PI() / 180) AS CosenoDe0Grados;

-- RAIZ CUADRADA
SELECT SQRT(81) AS RAIZ;

-- 50 FUNCIONES STRING ---------------------------------------------------------
SELECT CHAR(65) AS LETRA; -- CONSULTA EL MAPA DE CARACTERES

SELECT nombre + CHAR(65)
FROM empleados;

-- CONCAT (UNIR STRINGS)
SELECT CONCAT('Hola ','Cómo ','están ','Hoy')

--LEN (Cuenta también los espacios, el espacio es un caracter)
SELECT LEN('german');

--LOWER UPPER
SELECT LOWER('HOla COMO ESTan');
SELECT UPPER('HOla COMO ESTan');

-- INITCAP (ORACLE) : PRIMERA EN MAYUSCULAS
SELECT CONCAT
	(UPPER(LEFT('hOla COMO ESTan',1)),
	LOWER(RIGHT('hOla COMO ESTan', LEN('hOla COMO ESTan')-1)))
; -- RDO: "Hola como estan"

SELECT UPPER(LEFT('hOla COMO ESTanN',1));

SELECT LOWER(RIGHT('hOla COMO ESTan',LEN('hOla COMO ESTan')-1));

-- TRIM: ELIMINAR ESPACIOS EN BLANCO AL INICIO
SELECT TRIM('     HOla   como ess          '); -- ELIMINA LOS DE LA DERECHA Y LOS DE LA IZQUIERDA
SELECT LTRIM('     HOla   como ess         ');
SELECT RTRIM('     HOla   como ess         ');

-- REPLACE
SELECT REPLACE(' el cocobongo como loco','o','a'); -- Reemplaza la 'o' por la 'a'

--TRANSLATE
SELECT TRANSLATE ('abcde','abc','000')

SELECT TRANSLATE('123.4,72.3','[,]','( )') AS PUNTO; -- CAMBIO DE PRESENTACIÓN

-- REPLICATE
SELECT REPLICATE('0a',10);

-- REVERSE
SELECT REVERSE('PALINDROMO');

SELECT REVERSE(123456789);

-- 51 FUNCIONES DATE ------------------------------------
drop table detalles;

truncate table facturas;

INSERT INTO facturas (numero, fecha, cliente)
VALUES
(1, '2018-01-01', 'Juan Pérez'),
(2, '2018-01-15', 'María González'),
(3, '2018-01-22', 'Pedro Rodríguez'),
(4, '2018-02-10', 'Ana López'),
(5, '2018-02-05', 'Luisa Martínez'),
(6, '2018-03-12', 'Carlos Sánchez'),
(7, '2018-04-20', 'Laura Torres'),
(8, '2018-05-18', 'Javier Herrera'),
(9, '2018-06-27', 'Sofía Ramírez'),
(10, '2018-10-14', 'Diego Castro'),
(11, '2019-01-03', 'Valeria Gómez'),
(12, '2019-02-25', 'Andrés Cruz'),
(13, '2019-03-17', 'Gabriela Vargas'),
(14, '2019-04-08', 'Miguel Flores'),
(15, '2019-05-19', 'Fernanda Mendoza'),
(16, '2019-06-27', 'Roberto Ríos'),
(17, '2019-07-14', 'Paulina Acosta'),
(18, '2019-08-29', 'Emilio Castro'),
(19, '2019-09-11', 'Carolina Mejía'),
(20, '2019-10-05', 'Jorge Mora'),
(21, '2021-01-01', 'Juan Pérez'),
(22, '2021-02-15', 'María González'),
(23, '2021-03-22', 'Pedro Rodríguez'),
(24, '2021-04-10', 'Ana López'),
(25, '2021-05-05', 'Luisa Martínez'),
(26, '2021-06-12', 'Carlos Sánchez'),
(27, '2021-07-20', 'Laura Torres'),
(28, '2021-08-18', 'Javier Herrera'),
(29, '2021-09-27', 'Sofía Ramírez'),
(30, '2021-10-14', 'Diego Castro'),
(31, '2019-01-03', 'Valeria Gómez'),
(32, '2020-02-25', 'Andrés Cruz'),
(33, '2020-03-17', 'Gabriela Vargas'),
(34, '2020-04-08', 'Miguel Flores'),
(35, '2020-05-19', 'Fernanda Mendoza'),
(36, '2020-06-27', 'Roberto Ríos'),
(37, '2020-07-14', 'Paulina Acosta'),
(38, '2020-08-29', 'Emilio Castro'),
(39, '2020-09-11', 'Carolina Mejía'),
(40, '2020-10-05', 'Jorge Mora');

SELECT * FROM facturas;

SELECT GETDATE(); -- Fecha y hora de nuestro sistema 
SELECT DATEADD(day, 1, getdate()); -- Agrego un día, o los que quiera
SELECT DATEADD(day,-5, getdate()); -- Agrego un día, o resto los que quiera

SELECT DATEADD(month, 2, getdate()); -- 
SELECT DATEADD(month,-5, getdate()); -- 

SELECT DATEADD(year,3, getdate()); -- 
SELECT DATEADD(year,-3, getdate()); --

SELECT DATEADD(hour,3, getdate()); -- 
SELECT DATEADD(hour,-3, getdate()); --

SELECT DATEADD(minute,3, getdate()); -- 
SELECT DATEADD(minute,-3, getdate()); --

SELECT * 
FROM facturas
WHERE fecha BETWEEN '2018-01-01' AND DATEADD(year,1,'2018-01-01') -- Periodo de 1 año
;

SELECT * 
FROM facturas
WHERE fecha BETWEEN '2018-01-01' AND '2019-01-01'
;

SELECT * 
FROM facturas
WHERE fecha BETWEEN '2018-01-01' AND DATEADD(month, 0, getdate()) -- 
;

-- DATE NAME
SET LANGUAGE spanish;

SELECT datename(month, getdate()); -- veo el nombre del mes "MAYO"
SELECT datepart(month, getdate()); -- Vel el número del mes "5"

SELECT datename(WEEKDAY, getdate()); -- "Domingo"
SELECT datepart(day, getdate()); -- número del mes

SELECT cliente, fecha, datename(month, fecha) as Mes
FROM facturas
WHERE datename(month,fecha) = datename(month,getdate()); -- todos los datos del mes actual (de todos los años)

-- 52 FUNCIONES LEFT(), RIGHT(), STUFF()
CREATE TABLE e_mails (
nombre VARCHAR(60),
clave VARCHAR(20),
email VARCHAR(80)
); 

INSERT INTO e_mails (nombre, clave, email)
VALUES
('Juan Pérez', 'qwerty123', 'juanperez1985@hotmail.com'),
('María González', 'abcde456', 'mariagonzalez89@yahoo.com'),
('Carlos Rodríguez', 'pass1234', 'carlos.rodriguez@gmail.com'),
('Laura López', 'password1', 'lauralopez_87@hotmail.com'),
('Pedro Sánchez', 'securepass', 'pedro.sanchez@gmail.com'),
('Ana Martínez', 'mypassword', 'ana.martinez93@yahoo.com'),
('Javier Torres', '12345678', 'javier.torres82@hotmail.com'),
('Sara Ramírez', 'p@ssw0rd', 'sara.ramirez88@yahoo.com'),
('Luis Herrera', 'hello123', 'luis.herrera79@gmail.com'),
('Marta Castro', '987654321', 'marta.castro85@hotmail.com'),
('David Jiménez', 'password123', 'david.jimenez94@yahoo.com'),
('Elena Vega', 'testpass', 'elena.vega81@gmail.com'),
('Andrés Morales', 'pass123', 'andres.morales91@hotmail.com'),
('Patricia Rojas', 'password456', 'patricia.rojas87@yahoo.com'),
('Roberto Fernández', 'qwertyuiop', 'roberto.fernandez80@gmail.com'),
('Isabel Silva', 'securepassword', 'isabel.silva86@hotmail.com'),
('Fernando Castro', 'myp@ssw0rd', 'fernando.castro92@yahoo.com'),
('Carmen Navarro', 'abcdefgh', 'carmen.navarro84@gmail.com'),
('Daniel Mendoza', 'test1234', 'daniel.mendoza89@hotmail.com'),
('Raquel Gómez', 'password9876', 'raquel.gomez83@yahoo.com'),
('Mario Morales', 'mysecret', 'mario.morales85@hotmail.com'),
('Silvia Torres', 'passw0rd', 'silvia.torres91@yahoo.com'),
('Ricardo Soto', 'securepass123', 'ricardo.soto82@gmail.com'),
('Marina Gómez', 'hello1234', 'marina.gomez87@hotmail.com'),
('Jorge Vargas', 'testpass123', 'jorge.vargas83@yahoo.com'),
('Natalia Ruiz', '123456789', 'natalia.ruiz88@gmail.com'),
('Héctor Paredes', 'qwerty1234', 'hector.paredes84@hotmail.com'),
('Adriana Morales', 'mypassword123', 'adriana.morales89@yahoo.com'),
('Alejandro Ríos', 'password1234', 'alejandro.rios90@gmail.com'),
('Lucía Castro', 'test123456', 'lucia.castro85@hotmail.com'),
('Julio Hernández', 'passwordabcd', 'julio.hernandez91@yahoo.com'),
('Carolina Sánchez', 'password5678', 'carolina.sanchez86@gmail.com'),
('Diego Peralta', 'testpassabcd', 'diego.peralta92@hotmail.com'),
('Gabriela Ramírez', 'qwertyuiop123', 'gabriela.ramirez87@yahoo.com'),
('Roberto Méndez', 'securepassword123', 'roberto.mendez93@gmail.com'),
('María José Mora', 'myp@ssw0rd123', 'mariajose.mora88@hotmail.com'),
('Fabián Castro', 'abcdefgh123', 'fabian.castro94@yahoo.com'),
('Valentina Navarro', 'test12345678', 'valentina.navarro89@gmail.com'),
('Andrea Mendoza', 'password98765', 'andrea.mendoza90@hotmail.com'),
('Luisa Gutiérrez', 'passwordabcd123', 'luisa.gutierrez91@yahoo.com');


-- LEFT
SELECT left(email,3)
FROM e_mails;

-- RIGHT
SELECT right(email,4)
FROM e_mails;

--STUFF: elimina desde un punto en específico, desde ese punto también reeemplaza.
SELECT ('Hola a todos') AS Saludos;

SELECT stuff('Hola a todos',3,5,'Amigos');

-- 53 TRANSACT-SQL: BULK INSERT ESTATICO --------------------------------------------------
CREATE TABLE autos(
marca varchar(20),
modelo varchar(20),
tipo varchar(20),
color varchar(20)
);

BULK INSERT
autos -- Tabla destino
FROM 'C:\Users\INGENIERO SALINA\Documents\TABLA_AUTOS.txt' -- Ruta del Archivo
WITH ( firstrow = 2 ); --Definimos fila de inicio de inserción

SELECT * FROM autos;

-- 54 TRANSACT-SQL, ROW_NUMBER(), FIRST_VALUE()
CREATE TABLE ventas (
idvendedor INT,
ciudad VARCHAR(50),
pais VARCHAR(50),
cuota_ventas MONEY,
comision MONEY,
ven_ult_anio MONEY,
fecha DATE
);

INSERT INTO ventas (idvendedor, ciudad, pais, cuota_ventas, comision, ven_ult_anio, fecha)
VALUES
(1, 'Buenos Aires', 'Argentina', 2500.00, 150.00, 785432, '2019-05-10'),
(2, 'Rosario', 'Argentina', 3800.00, 230.00, 623591, '2020-07-22'),
(3, 'Córdoba', 'Argentina', 4200.00, 250.00, 752164, '2021-09-14'),
(4, 'Mendoza', 'Argentina', 3100.00, 190.00, 926532, '2022-12-01'),
(5, 'Mar del Plata', 'Argentina', 2700.00, 160.00, 531246, '2023-03-29'),
(6, 'Sao Paulo', 'Brasil', 2900.00, 180.00, 654821, '2018-11-05'),
(7, 'Río de Janeiro', 'Brasil', 4100.00, 240.00, 719638, '2019-10-18'),
(8, 'Belo Horizonte', 'Brasil', 3600.00, 210.00, 897421, '2020-08-27'),
(9, 'Salvador', 'Brasil', 3800.00, 220.00, 613579, '2021-06-02'),
(10, 'Fortaleza', 'Brasil', 3200.00, 190.00, 735214, '2022-04-14'),
(11, 'Ciudad de México', 'México', 2700.00, 160.00, 926485, '2019-01-07'),
(12, 'Guadalajara', 'México', 3500.00, 210.00, 598723, '2020-02-21'),
(13, 'Monterrey', 'México', 3900.00, 230.00, 813579, '2021-03-17'),
(14, 'Puebla', 'México', 3200.00, 190.00, 754921, '2022-06-10'),
(15, 'Tijuana', 'México', 2900.00, 170.00, 629348, '2023-09-03'),
(16, 'Lima', 'Perú', 2800.00, 160.00, 832457, '2018-12-15'),
(17, 'Arequipa', 'Perú', 3300.00, 200.00, 746921, '2019-11-27'),
(18, 'Trujillo', 'Perú', 3600.00, 210.00, 925317, '2020-10-09'),
(19, 'Chiclayo', 'Perú', 3100.00, 180.00, 618493, '2021-08-22'),
(20, 'Cusco', 'Perú', 3000.00, 170.00, 743215, '2022-07-05'),
(21, 'Rosario', 'Argentina', 2900.00, 180.00, 675821, '2019-08-05'),
(22, 'Córdoba', 'Argentina', 3100.00, 190.00, 743216, '2020-09-18'),
(23, 'Mendoza', 'Argentina', 2500.00, 150.00, 562714, '2021-11-02'),
(24, 'Mar del Plata', 'Argentina', 2700.00, 160.00, 891457, '2022-12-30'),
(25, 'Sao Paulo', 'Brasil', 3800.00, 220.00, 725913, '2018-10-10'),
(26, 'Río de Janeiro', 'Brasil', 3600.00, 210.00, 914573, '2019-12-22'),
(27, 'Belo Horizonte', 'Brasil', 3200.00, 190.00, 671942, '2020-08-05'),
(28, 'Salvador', 'Brasil', 3100.00, 180.00, 859613, '2021-05-19'),
(29, 'Fortaleza', 'Brasil', 2800.00, 170.00, 612374, '2022-03-03'),
(30, 'Ciudad de México', 'México', 3900.00, 230.00, 759281, '2019-04-15'),
(31, 'Guadalajara', 'México', 3700.00, 220.00, 923671, '2020-06-29'),
(32, 'Monterrey', 'México', 3300.00, 200.00, 674192, '2021-08-13'),
(33, 'Puebla', 'México', 3000.00, 180.00, 842519, '2022-11-01'),
(34, 'Tijuana', 'México', 2600.00, 160.00, 536192, '2023-02-25'),
(35, 'Lima', 'Perú', 3100.00, 190.00, 753219, '2019-01-12'),
(36, 'Arequipa', 'Perú', 3300.00, 200.00, 924617, '2020-02-24'),
(37, 'Trujillo', 'Perú', 3400.00, 200.00, 691534, '2021-04-08'),
(38, 'Chiclayo', 'Perú', 2900.00, 170.00, 813597, '2022-06-22'),
(39, 'Cusco', 'Perú', 2700.00, 160.00, 576921, '2023-08-06'),
(40, 'Santiago', 'Chile', 3200.00, 190.00, 748315, '2018-09-20');

-- El vendedor con mayor cantidad de ventas del año pasado.
SELECT MAX(ven_ult_anio) FROM ventas;

SELECT idvendedor, ven_ult_anio
FROM ventas
ORDER BY ven_ult_anio DESC;

-- ROW NUMBER
SELECT 
	row_number() over(order by ven_ult_anio DESC) as contador,
	idvendedor, 
	ven_ult_anio
FROM ventas;

SELECT * FROM(
				SELECT 
					row_number() over(order by ven_ult_anio DESC) as contador,
					idvendedor, 
					ven_ult_anio
				FROM ventas) AS Aux -- Ahora la Columna contador es como una columna Física
WHERE AUX.contador = 1; 

SELECT AUX.idvendedor, AUX.ven_ult_anio 
FROM(
	SELECT 
		row_number() over(order by ven_ult_anio DESC) as contador,
		idvendedor, 
		ven_ult_anio
	FROM ventas) AS Aux -- Ahora la Columna contador es como una columna Física
WHERE AUX.contador = 1; 

-- FIRST VALUE
SELECT
	FIRST_VALUE(idvendedor) OVER(ORDER BY ven_ult_anio DESC) AS Contador,
	idvendedor,
	ven_ult_anio
FROM VENTAS;

SELECT *
FROM ventas
WHERE -- Cuando la subconsulta está en el WHERE no es indispensable colocar un ALIAS
	idvendedor =	(SELECT DISTINCT
						FIRST_VALUE(idvendedor) OVER(ORDER BY ven_ult_anio DESC) AS Contador
					FROM VENTAS
					)
;

-- 55 T-SQL(TRANSACT-SQL): BLOQUES, CONTROL DE FLUJO
DECLARE
	-- variables
BEGIN
	-- Codigo 
	if
	else
	return
	waitfor
	while
	for
	do while
	case
	continue
	-- Control de eventualidades
	continue
	break
END;

-- 56 T-SQL(TRANSACT-SQL): IF EXIST() - ELSE -----------------------

IF EXISTS (SELECT * FROM articulos WHERE cantidad = 6)
	(SELECT nombre, precio, cantidad
	FROM articulos
	WHERE cantidad = 15)
ELSE
	SELECT 'NO hay artículos con cantidad 0'
;

CREATE TABLE prueba(
campo1 int,
campo2 int
);

SELECT * FROM sys.objects; -- Listar todos los objetos, y tablas.
SELECT * FROM sys.objects WHERE name  = 'PRUEBA';

IF OBJECT_ID('PRUEBA') is not null
	DROP TABLE prueba;	

-- Crear la tabla Cartelera
CREATE TABLE Cartelera (
    sala VARCHAR(50),
    pelicula VARCHAR(100),
    hora VARCHAR(10),
    capacidad INT,
    entradas INT
);

-- Insertar registros en la tabla Cartelera
INSERT INTO Cartelera (sala, pelicula, hora, capacidad, entradas)
VALUES ('Sala 1', 'Spider-Man: No Way Home', '10:00', 100, 80),
       ('Sala 2', 'Avatar 2', '12:30', 80, 70),
       ('Sala 3', 'The Batman', '15:15', 120, 90),
       ('Sala 4', 'Black Panther: Wakanda Forever', '17:45', 150, 150),
       ('Sala 5', 'Indiana Jones 5', '20:00', 120, 120),
       ('Sala 6', 'Fantastic Beasts: The Secrets of Dumbledore', '10:30', 100, 85),
       ('Sala 1', 'Mission: Impossible 8', '13:00', 90, 70),
       ('Sala 2', 'Fast & Furious 10', '16:15', 80, 60),
       ('Sala 3', 'Guardians of the Galaxy Vol. 3', '19:30', 110, 90),
       ('Sala 4', 'The Flash', '22:00', 100, 95),
       ('Sala 5', 'Thor: Love and Thunder', '10:45', 120, 100),
       ('Sala 6', 'Captain Marvel 2', '14:20', 80, 70),
       ('Sala 1', 'Doctor Strange in the Multiverse of Madness', '17:00', 150, 150),
       ('Sala 2', 'The Expendables 4', '20:30', 100, 80),
       ('Sala 3', 'Aquaman and the Lost Kingdom', '11:15', 120, 100),
       ('Sala 4', 'Sherlock Holmes 3', '13:45', 90, 75),
       ('Sala 5', 'Mortal Kombat 2', '16:30', 80, 80),
       ('Sala 6', 'John Wick: Chapter 4', '19:45', 100, 100),
       ('Sala 1', 'Jungle Cruise', '21:30', 110, 100),
       ('Sala 2', 'The Little Mermaid', '12:15', 80, 70);

-- Ver asientos disponibles en cada SALA, de lo contrario "Entradas agotadas"
IF EXISTS (SELECT * FROM cartelera WHERE capacidad > entradas)	
		SELECT sala, pelicula, hora, (capacidad-entradas) as AsientosDisponibles
		FROM cartelera 
		WHERE capacidad > entradas	
ELSE
		SELECT 'Entradas Agotadas'
;

SELECT * FROM Cartelera;

UPDATE Cartelera
SET entradas = capacidad
WHERE sala = 'Sala 1';

IF (SELECT * FROM cartelera WHERE capacidad > entradas)	
		SELECT sala, pelicula, hora, (capacidad-entradas) as AsientosDisponibles
		FROM cartelera 
		WHERE capacidad > entradas	
ELSE
		SELECT 'Entradas Agotadas'
;

SELECT 
    sala, 
    pelicula, 
    hora, 
    (capacidad - entradas) AS AsientosDisponibles,
    CASE 
        WHEN capacidad > entradas THEN 'Disponible' 
        ELSE 'Entradas Agotadas' 
    END AS Estado
FROM 
    cartelera;

-- 57 TSQL -- VARIABLES DE ENTORNO ---------------------------------------------------------

-- Declaración de variables temporales
DECLARE @server_name NVARCHAR(128);
DECLARE @session_id INT;
DECLARE @current_user NVARCHAR(128);
DECLARE @current_timestamp DATETIME;
DECLARE @language NVARCHAR(128);

-- Obtener valores de variables de entorno
SET @server_name = @@SERVERNAME;
SET @session_id = @@SPID;
SET @current_user = SYSTEM_USER;
SET @current_timestamp = CURRENT_TIMESTAMP;
SET @language = @@LANGUAGE;

-- Mostrar la información obtenida
SELECT
    @server_name AS 'Nombre del Servidor',
    @session_id AS 'ID de Sesión Actual',
    @current_user AS 'Usuario Actual',
    @current_timestamp AS 'Fecha y Hora Actual',
    @language AS 'Idioma Actual';

--@nombredevariable1
DECLARE
	@id_valor int = 20,
	@nombre varchar(20),
	@telefono numeric(10),
	@fecha date,
	@activo bit;
BEGIN
	SET @id_valor = 50;
	SELECT @id_valor;
	SET @nombre = 'SQL SERVER';
	SELECT @nombre;
END;

DECLARE
	@codigo int = 10;
BEGIN
	SELECT * 
	FROM articulos
	WHERE codigo = @codigo;
END;

DECLARE
	@patron varchar(20);
BEGIN
	SET @patron = '%lap%'
	SELECT * FROM articulos	WHERE nombre LIKE @patron;
END;

DECLARE
	@mayorprecio decimal(6,2);
BEGIN
	SELECT @mayorprecio = MAX(precio) FROM articulos
	SELECT * FROM articulos	WHERE precio = @mayorprecio;
END;

-- 58 VARIABLES TIPO TABLA  --------------------------------------------------------
-- La variable se crea al ejecutar la sentencia y se elimina al terminar la ejecución, 
-- no se almacena en disco y vienen optimizadas.
DECLARE
	@tabla1 TABLE(
				id int,
				nombre varchar(20),
				telefono numeric(10)				
				);
BEGIN
	SELECT * FROM @tabla1;
END;

GO
DECLARE
	@tabla1 TABLE(
				id int,
				nombre varchar(20),
				telefono numeric(10)				
				);
	INSERT INTO @tabla1 VALUES(1,'Giulinana',123456789)
	SELECT * FROM @tabla1;



-- 59 T-SQL, PROCEDIMIENTOS ALMACENADOS -------------------------------------
GO
CREATE PROC proc_existencia
AS
	SELECT * FROM articulos
	WHERE cantidad <=20;

GO
CREATE PROC menor_De_20
AS
	SELECT * FROM articulos
	WHERE cantidad < 20;

EXEC proc_existencia; -- EJECUTAR PROCEDIMIENTO


GO
CREATE PROC proc_actualiza_inventario
AS
BEGIN
	IF EXISTS(SELECT * FROM articulos WHERE cantidad = 0)
		UPDATE articulos SET cantidad = 10
		WHERE cantidad = 0
END;

EXEC proc_actualiza_inventario; -- EJECUTAR PROCEDIMIENTO

-- -----------------
SELECT * FROM empleados;
GO

CREATE PROCEDURE proc_bonificacion
AS
BEGIN
	IF EXISTS(SELECT * FROM empleados WHERE cant_hijos > 3)
		BEGIN
			UPDATE empleados
			set sueldo  =  sueldo + sueldo *0.20;
			print 'Se ha aplicado la bonificación!';
		END;
	ELSE
		BEGIN
			print 'NO hay empleados con más de tres Hijos';
		END;
END;

EXEC proc_bonificacion; -- EJECUTAR PROCEDIMIENTO

-- 60 60 T-SQL: PROCEDIMIENTOS ALMACENADOS, BORRAR, ACTUALIZAR ------------------------
-- MODIFICAR PROCEDIMIENTO ALMACENADO YA CREADO
GO
ALTER PROCEDURE proc_bonificacion
AS
BEGIN
	IF EXISTS(SELECT * FROM empleados WHERE cant_hijos > 1)
		BEGIN
			UPDATE empleados
			set sueldo  =  sueldo + sueldo *0.20;
			print 'Se ha aplicado la bonificación!';
		END;
	ELSE
		BEGIN
			print 'NO hay empleados con más de tres Hijos';
		END;
END;

EXEC proc_bonificacion; -- EJECUTAR PROCEDIMIENTO

DROP PROCEDURE proc_bonificacion; -- BORRAR PROCEDIMIENTO (Ver que esté aislado y no enlazado a otras tablas con llaves foráneas por ejemplo)

GO


-- 61 T-SQL: PROCEDIMIENTOS ALMACENADOS, PARÁMETROS DE ENTRADA ----------------------------

CREATE PROCEDURE proc_busca_empleado
	@nombre varchar(30) = 'Carlos'
AS 
	SELECT * FROM empleados
	WHERE nombre = @nombre;

EXEC proc_busca_empleado; -- EJECUTAR PROCEDIMIENTO
GO

CREATE OR ALTER PROCEDURE proc_busca_empleado
	@nombre varchar(30) = 'Juan'
AS 
	SELECT * FROM empleados
	WHERE nombre = @nombre;

EXEC proc_busca_empleado; -- EJECUTAR PROCEDIMIENTO
GO

CREATE OR ALTER PROCEDURE proc_busca_empleado_2
	@nombre varchar(30) = 'Luis',
	@sueldo int = 4320.00,
	@hijos int = 0
AS 
	SELECT * FROM empleados
	WHERE 
		nombre = @nombre AND 
		sueldo = @sueldo AND 
		cant_hijos = @hijos;

EXEC proc_busca_empleado_2; -- EJECUTAR PROCEDIMIENTO
GO

SELECT * FROM empleados;
GO



-- 62 T-SQL: PROCEDIMIENTOS ALMACENADOS, PARÁMETROS DE SALIDA
CREATE OR ALTER PROCEDURE proc_promedio
	@valor1 numeric(6,2),
	@valor2 numeric(6,2),
	@resultado numeric(6,2) OUTPUT -- Parámetro de SALIDA
AS 
	SELECT @resultado = (@valor1 + @valor2)/2;


-- EJECUTAR PROCEDIMIENTO CON PARÁMETROS DE SALIDA
DECLARE	@promedio numeric(6,2) 
EXEC proc_promedio 14.00, 14.00, @promedio output
	SELECT @promedio As promedio;
GO

UPDATE empleados SET sueldo = 950
WHERE id_empleado in (5,17,31,20,15);
GO

CREATE OR ALTER PROCEDURE proc_emplado_sal_promedio
	@puesto varchar(30) ='%', -- va a tomar todo lo que coincida con lo que se reciba como parámetro
	@suma numeric(18,2) OUTPUT,
	@promedio numeric(18,2) OUTPUT
AS 
	SELECT * 
			FROM empleados
			WHERE puesto like @puesto
	SELECT @suma = SUM(sueldo)
			FROM empleados
			WHERE puesto like @puesto
	SELECT @promedio = AVG(sueldo)
			FROM empleados
			WHERE puesto like @puesto

-- Ejecutar procedimiento
DECLARE 
	@sumatoria numeric(18,2),
	@prom numeric(18,2)
EXEC proc_emplado_sal_promedio 
	'Desarrollador', 
	@sumatoria output,
	@prom output
SELECT @sumatoria AS Total, @prom AS Promedio


-- 63 PROCEDIMIENTOS ALMACENADOS ENCRIPTACION --------------------------------------------------------------
SELECT * FROM sysobjects
WHERE name = 'proc_emplado_sal_promedio'

EXEC sp_helptext proc_emplado_sal_promedio;
GO


CREATE OR ALTER PROCEDURE proc_bonificacion
WITH ENCRYPTION
AS
BEGIN
	IF EXISTS(SELECT * FROM empleados WHERE cant_hijos > 1)
		BEGIN
			UPDATE empleados
			set sueldo  =  sueldo + sueldo *0.20;
			print 'Se ha aplicado la bonificación!';
		END;
	ELSE
		BEGIN
			print 'NO hay empleados con más de tres Hijos';
		END;
END;

EXEC sp_helptext proc_bonificacion;
GO;

CREATE OR ALTER PROCEDURE proc_bonificacion
AS
BEGIN
	IF EXISTS(SELECT * FROM empleados WHERE cant_hijos > 1)
		BEGIN
			UPDATE empleados
			set sueldo  =  sueldo + sueldo *0.20;
			print 'Se ha aplicado la bonificación!';
		END;
	ELSE
		BEGIN
			print 'NO hay empleados con más de tres Hijos';
		END;
END;

-- 64 TABLAS TEMPORALES -----------------------------------------------------
-- Eliminando la tabla temporal
DROP TABLE #usuarios;

CREATE TABLE #usuarios (
    id_usuarios int IDENTITY(1,1),
    nombre varchar(10),
    clave varchar(10),
    CONSTRAINT PK_usuarios PRIMARY KEY (id_usuarios)
);

-- Insertando datos de ejemplo
INSERT INTO #usuarios (nombre, clave) VALUES ('usuario1', 'clave1');
INSERT INTO #usuarios (nombre, clave) VALUES ('usuario2', 'clave2');

-- Seleccionando datos
SELECT * FROM #usuarios;


-- 65 T-SQL: FUNCIONES --------------------------------------------------------
-- 1) ESCALARES (RETORNAN UN ESCALAR)
-- 2) DE VARIAS INSTRUCCIONES (RETORNAN UNA TABLA)
-- 3) DE TABLA EN LÍNEA (RETORNAN UNA TABLA)
GO


CREATE OR ALTER FUNCTION f_suma(@valor1 int, @valor2 int)
	RETURNS int
	AS
	BEGIN
		DECLARE @resultado int
		SET @resultado = @valor1 + @valor2
		RETURN @resultado
	END;
GO

SELECT dbo.f_suma(5,11) AS Total;


-- -------------------------------------------------------
SELECT * FROM facturas;

SELECT datename(month, fecha) FROM facturas;

CREATE OR ALTER FUNCTION f_meses(@fecha date)
	RETURNS varchar(30)
	AS
		BEGIN	
			DECLARE @mesEnEspaniol VARCHAR(15)
			-- Obtener el nombre del mes en inglés
			SET @mesEnEspaniol = DATENAME(month, @fecha)

			DECLARE @nombre varchar(30)
			SET @nombre = 
					CASE datename(month,@fecha)
						WHEN 'January' Then 'Enero' 
						WHEN 'February' Then 'Febereo' 
						WHEN 'March' Then 'Marzo' 
						WHEN 'April' Then 'Abril' 
						WHEN 'May' Then 'Mayo' 
						WHEN 'Jun' Then 'JUnio' 
						WHEN 'July' Then 'Julio' 
						WHEN 'August' Then 'Agosto' 
						WHEN 'September' Then 'Septiembre' 
						WHEN 'OCtober' Then 'Octubre' 
						WHEN 'November' Then 'Noviembre' 
						WHEN 'December' Then 'Diciembre' 
						ELSE @mesEnEspaniol
					END -- del case
	RETURN @nombre
	END;

SELECT cliente, dbo.f_meses(fecha) AS 'Mes de ingreso'
FROM facturas; --

-- 66 FUNCIONES DE TIPO TABLA ----------------------------------------------
-- Una sola instrucción SELECT
drop table libros 
CREATE TABLE libros (
    codigo INT IDENTITY(1,1) PRIMARY KEY,
    titulo NVARCHAR(100) NOT NULL,
    autor NVARCHAR(100) NOT NULL,
    editorial NVARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

INSERT INTO libros (titulo, autor, editorial, precio) VALUES
('1984', 'George Orwell', 'Debolsillo', 15.00),
('Cien años de soledad', 'Gabriel García Márquez', 'Editorial Sudamericana', 25.99),
('El principito', 'Antoine de Saint-Exupéry', 'Salvat', 10.50),
('Harry Potter y la piedra filosofal', 'J.K. Rowling', 'Salamandra', 19.95),
('Matar un ruiseñor', 'Harper Lee', 'Vintage Books', 12.75),
('El gran Gatsby', 'F. Scott Fitzgerald', 'Scribner', 18.00),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 'Editorial Planeta', 22.50),
('Orgullo y prejuicio', 'Jane Austen', 'Penguin Classics', 14.99),
('Crimen y castigo', 'Fiodor Dostoievski', 'Alianza Editorial', 16.95),
('Los juegos del hambre', 'Suzanne Collins', 'RBA Molino', 17.25),
('La sombra del viento', 'Carlos Ruiz Zafón', 'Planeta', 21.00),
('El código Da Vinci', 'Dan Brown', 'Umbriel Editores', 23.95),
('To Kill a Mockingbird', 'Harper Lee', 'Harper Perennial Modern Classics', 13.50),
('The Lord of the Rings', 'J.R.R. Tolkien', 'Mariner Books', 30.00),
('Pride and Prejudice', 'Jane Austen', 'Vintage Classics', 12.99),
('The Catcher in the Rye', 'J.D. Salinger', 'Back Bay Books', 16.50),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 18.00),
('The Hunger Games', 'Suzanne Collins', 'Scholastic Press', 14.95),
('The Alchemist', 'Paulo Coelho', 'HarperOne', 13.25),
('Brave New World', 'Aldous Huxley', 'Harper Perennial Modern Classics', 11.99),
('La Catedral del Mar', 'Ildefonso Falcones', 'Grijalbo', 16.99),
('La Sombra de la Serpiente', 'Rick Riordan', 'Montena', 22.50),
('El Hobbit', 'J.R.R. Tolkien', 'Minotauro', 18.95),
('El amor en los tiempos del cólera', 'Gabriel García Márquez', 'Diana', 19.75),
('Cazadores de sombras: Ciudad de hueso', 'Cassandra Clare', 'Destino', 14.50),
('Drácula', 'Bram Stoker', 'Anaya', 15.99),
('It', 'Stephen King', 'Debolsillo', 27.25),
('Los pilares de la Tierra', 'Ken Follett', 'Follett', 20.00),
('El nombre del viento', 'Patrick Rothfuss', 'Plaza & Janés', 23.95),
('Cien años de soledad', 'Gabriel García Márquez', 'Círculo de Lectores', 21.99),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Wordsworth Classics', 10.99),
('1984', 'George Orwell', 'Secker & Warburg', 14.75),
('The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 16.50),
('The Lord of the Rings', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt', 28.00),
('The Hunger Games', 'Suzanne Collins', 'Scholastic Corporation', 14.95),
('Harry Potter and the Sorcerers Stone', 'J.K. Rowling', 'Arthur A. Levine Books', 19.99),
('Matar a un ruisenior', 'Harper Lee', 'Harper Lee', 12.50),
('Pride and Prejudice', 'Jane Austen', 'Penguin Books', 11.99),
('The Alchemist', 'Paulo Coelho', 'HarperOne', 14.25),
('Brave New World', 'Aldous Huxley', 'Harper Brothers', 10.99);

-- Cantidad de libros escritos por Autor pasado por parámetro.
SELECT * FROM libros;

CREATE OR ALTER FUNCTION f_autor(@autor varchar(30))
	RETURNS TABLE -- Acá se pone TABLE
	AS
		RETURN(SELECT * FROM libros WHERE autor like '%'+@autor+'%');

SELECT * FROM f_autor('Har');

-- 67 T-SQL, TRIGGERS (INTRODUCCION) ----------------------------------------------------------------------------
--* No se pueden Invocar directamente
--* No Retorna ni Recibe parámetros
--* Se utilizan para mantener la integridad de los datos
--* TIPOS: AFTER INSERT, AFTER UPDATE, AFTER DELETE, INSTEAD OF.

CREATE TABLE prueba(
id int NULL,
nombre VARCHAR(10),
fecha date,
cantidad numeric(3,2),
);

Drop table control;	
CREATE TABLE control(
usuario varchar(30),
fecha datetime,
accion varchar(50)
);

-- AFTER INSERT
CREATE OR ALTER TRIGGER t_inserta
	ON prueba -- Tabla prueba
	AFTER INSERT -- Controlaremos los INSERTs
	AS
		BEGIN
			DECLARE @usuario varchar(30);
			SET @usuario = suser_name();
			INSERT INTO CONTROL VALUES(@usuario,getdate(),'Insert');
		END;



INSERT INTO prueba VALUES(1,'Jorgelina',getdate(),1.25);

SELECT * FROM control;

-- AFTER UPDATE
CREATE OR ALTER TRIGGER t_update
	ON prueba -- Tabla prueba
	AFTER UPDATE -- Controlaremos los UPDATEs
	AS
		BEGIN
			DECLARE @usuario varchar(30);
			SET @usuario = suser_name();
			INSERT INTO CONTROL VALUES(@usuario,getdate(),'Update');
		END;

UPDATE prueba SET id = 2 WHERE id = 2;

SELECT * FROM control;

SELECT * FROM prueba;

-- AFTER DELETE --------------
CREATE OR ALTER TRIGGER t_delete
	ON prueba -- Tabla prueba
	AFTER DELETE -- Controlaremos los DELETEs
	AS
		BEGIN
			DECLARE @usuario varchar(30);
			SET @usuario = suser_name();
			INSERT INTO CONTROL VALUES(@usuario,getdate(),'Delete');
		END;

DELETE FROM prueba WHERE id = 2;

SELECT * FROM control;

SELECT * FROM prueba;

-- 68 TRIGGERS (INSERT, UPDATE, DELETE) 
-- INSERT, UPDATE, DELETE en UN SOLO TRIGGER

SELECT * FROM empleados;

CREATE TABLE control_emple(
usuario varchar(30),
fecha date,
hora varchar(20),
accion varchar(50)
);

SELECT * FROM control_emple;

CREATE OR ALTER TRIGGER tr_control_emple
	ON empleados
	FOR INSERT, UPDATE, DELETE
	AS
		DECLARE
			@hora varchar(20) = right(getdate(),8);
			IF exists (SELECT 0 FROM inserted) -- Si existen filas afectadas por la operación
				BEGIN
					IF exists (SELECT 0 FROM deleted)
						BEGIN
							INSERT INTO control_emple VALUES (suser_name(),getdate(),@hora,'Actualizó en la tabla empleados');
						END
					ELSE
						BEGIN
							INSERT INTO control_emple VALUES (suser_name(),getdate(),@hora,'Insertó en la tabla empleados');
						END
				END
			ELSE
				BEGIN
					INSERT INTO control_emple VALUES (suser_name(),getdate(),@hora,'Borró en la tabla empleados');
				END 			

SELECT * FROM control_emple;

SELECT * FROM empleados;

INSERT INTO empleados VALUES(41,'Manuel','Gonzales','Direccion cualquiera 3030','Técnico',900.00,1);
UPDATE empleados SET sueldo = 800 WHERE id_empleado = 41;
DELETE FROM empleados WHERE id_empleado = 41;

-- 69 T-SQL, TRIGGERS (INSTEAD OF)----------------------------------------------------------
--* Previenen la Alteración en nuestras tablas

SELECT * FROM control;
SELECT * FROM control_emple;

TRUNCATE TABLE control_emple;

EXEC sp_rename 'control_emple','control_productos';

SELECT * FROM productos;
SELECT * FROM control_productos;

-- INSTEAD OF INSERT
-- Vamos a hacer un trigger que bloquee el insert de datos en la tabla productos

CREATE OR ALTER TRIGGER tr_blockinsert_productos
	ON productos
	INSTEAD OF INSERT -- "en lugar de insertar"
	AS
		BEGIN
			SET nocount on -- bloquear la salida de datos por consola, ahorramos recursos
			INSERT INTO control_productos VALUES(SUSER_SNAME(),GETDATE(),RIGHT(getdate(),8),'Intentó un INSERT');
			print('NO es posible realizar inserciones');
		END;

INSERT INTO productos values(42,'Soldador eléctrico',80.20,4,0); -- NO se inserta

SELECT * FROM productos;
SELECT * FROM control_productos;


-- INSTEAD OF UPDATE -----------------------------------------------------
CREATE OR ALTER TRIGGER tr_blockupdate_productos
	ON productos
	INSTEAD OF UPDATE -- "en lugar de ..."
	AS
		BEGIN
			SET nocount on -- bloquear la salida de datos por consola, ahorramos recursos
			INSERT INTO control_productos VALUES(SUSER_SNAME(),GETDATE(),RIGHT(getdate(),8),'Intentó un UPDATE');
			print('NO es posible realizar UPDATEs');
		END;

UPDATE productos set precio_unidad = 55.12 WHERE idproducto = 40;

SELECT * FROM productos;
SELECT * FROM control_productos;


-- INSTEAD OF DELETE -----------------------------------------------------
CREATE OR ALTER TRIGGER tr_blockdelete_productos
	ON productos
	INSTEAD OF DELETE -- "en lugar de ..."
	AS
		BEGIN
			SET nocount on -- bloquear la salida de datos por consola, ahorramos recursos
			INSERT INTO control_productos VALUES(SUSER_SNAME(),GETDATE(),RIGHT(getdate(),8),'Intentó un DELETE');
			print('NO es posible realizar DELETEs');
		END;

DELETE FROM productos WHERE idproducto = 40;

SELECT * FROM productos;
SELECT * FROM control_productos;


-- 70 T-SQL: TRIGGERS (ENABLE, DISABLE) ----------------------------------------------------------------- 70 T-SQL: TRIGGERS (ENABLE, DISABLE)
--* NO queremos borrarlo, solo deshabilitarlo temporalmente

SELECT * FROM productos;

DELETE FROM productos WHERE idproducto = 1 ;

ALTER TABLE productos 
	DISABLE TRIGGER tr_blockdelete_productos;

DELETE FROM productos WHERE idproducto = 2 ;
SELECT * FROM productos;

ALTER TABLE productos 
	ENABLE TRIGGER tr_blockdelete_productos;

DELETE FROM productos WHERE idproducto = 3 ;

SELECT * FROM productos;

-- 71 T-SQL: TRIGGERS (RAISERROR)----------------------------------------------------------------------------71 T-SQL: TRIGGERS (RAISERROR)
SELECT * FROM empleados;

CREATE or ALTER TRIGGER tr_borra_empleados
	ON empleados
	for DELETE
	AS
		if(SELECT COUNT(*) FROM deleted) > 2
			BEGIN
				RAISERROR('NO SE PUEDE ELIMINAR MAS DE DOS EMPLEADOS',16,1);	
				ROLLBACK TRANSACTION;
			END;

DELETE FROM empleados WHERE id_empleado = 4 ; -- ok

DELETE FROM empleados WHERE id_empleado in (5,4,6,8,9); -- NO se puede

-- --------------------------
CREATE or ALTER TRIGGER tr_actualiza_empleados
	ON empleados
	for UPDATE
	AS
		if UPDATE(sueldo)
			BEGIN
				RAISERROR('NO SE PUEDE MODIFICAR SUELDOS',16,1);	
				ROLLBACK TRANSACTION;
			END;

UPDATE empleados SET sueldo = 20000.00 WHERE id_empleado = 4; -- NOP

--------------------------
CREATE or ALTER TRIGGER tr_inserta_empleados
	ON empleados
	for INSERT
	AS
		if (SELECT puesto from inserted) = 'Gerente'
			BEGIN
				RAISERROR('NO SE PUEDE INSERTEAR ESTE CAMPO',16,1);	
				ROLLBACK TRANSACTION;
			END;

INSERT INTO empleados VALUES(42,'Pedro','Gonzalez','Calle segunda no.22','Gerente',1000.55,1) -- NOP

-- 72 T-SQL: BULK INSERT DINÁMICO

SELECT * FROM tempdb.sys.tables; -- CONSULTAR TABLAS TEMPORALES

IF (SELECT name from tempdb.sys.tables) like '%'+'#basepedidos'+'%'
	DROP TABLE #basepedidos

CREATE TABLE #basepedidos( -- Tabla Temporal
	CodigoPedido varchar(100) NOT NULL,
	DocumentoCliente varchar(100) NOT NULL,
	CodigoCiudad int NULL,
	CodigoProducto	varchar(100) NULL,
	CantidadProducto int,
	FechaPedido	date,
	HoraPedido time
);

BULK INSERT #basepedidos
FROM 'C:\Users\INGENIERO SALINA\Downloads\basepedidos.txt' -- con txt
WITH (firstrow = 2)

SELECT * FROM #basepedidos;



BULK INSERT #basepedidos
FROM 'C:\Users\INGENIERO SALINA\Downloads\basepedidos.xlsx' -- NO func con excel
WITH (firstrow = 2)

SELECT * FROM #basepedidos;

-- 73 @@VARIABLES DE SISTEMA -------------------------------------

print 'Version: ' + @@version; -- Información de nivel de Servicio

print 'Lenguaje: ' + @@language;

print 'Servidor: ' + @@servername; -- Nombre de la PC

print 'Conexiones usuario: ' + str(@@connections); -- programas internos usando la BBDD

print 'Conexiones máximas: ' + str(@@max_connections);-- Cantidad máxima de conecciones que permite nuestra bbdd

print 'Tiempo en Proceso: ' + str(@@cpu_busy) + ' segundos '; --EN ticks?, tiempo de sesión.

print 'Tiempo inactivo: ' + str(@@idle) + ' segundos ';

print 'Transacciones activas: ' + str(@@trancount);

print 'Última filas: ' + str(@@rowcount) + ' filas'; -- Filas afectadas o consultadas en la última operación

print 'Último fetch de un cursor: ' + str(@@fetch_status);

print 'Error última operación: Código de error ' + str(@@error);

print 'Último identity: ' + str(@@identity);

print 'Primer día de la semana: ' + str(@@datefirst);

print 'Bloqueo de sesión en milisegundos: ' + str(@@lock_timeout); -- Si no está configurado aparece un -1


-- 74 LOOPS (BUCLES) ---------------------------------------------- 74 LOOPS (BUCLES)

--WHILE
DECLARE
	@conteo int = 0;
WHILE @conteo < 10
	BEGIN
		print(convert(varchar,@conteo));
		set @conteo = @conteo + 1 ;
	END

--
DECLARE
	@tabla int=2,
	@conteo int = 0;
WHILE @conteo <= 10
	BEGIN
		print(str(@tabla) + ' X ' + str(@conteo) + ' = ' + str(@tabla*@conteo));
		set @conteo = @conteo + 1 ;
	END


-- 75 WHILE - BREAK ---------------------------------------------------------------
DECLARE
	@conteo int = 0;

WHILE @conteo <= 10
	BEGIN
		print('Vuelta Nº: '+str(@conteo));
		set @conteo = @conteo + 1 ;
		if @conteo = 7
			BREAK;
	END

	print('EL VALOR DE LA VUELTA FINAL ES Nº: '+str(@conteo));


-- 76 WHILE - CONTINUE --------------------------------------------------------------WHILE - CONTINUE
DECLARE
	@valor int = 1
WHILE @valor <= 10
	BEGIN
		print 'Contando...' + str(@valor)
		set @valor += 1
		if @valor = 7
			print('El VALOR HA ALCANZADO EL Nº '+str(@valor));
			continue -- OMITE LAS SIGUIENTES INSTRUCCIONES Y RETOMA EL BUCLE, 
			-- salta a la siguiente iteración sin importar lo que sigue:
			print('DEBERÍAMOS IMPRIMIR MÁS MENSAJES')
			set @valor += 1
			set @valor += 1
			set @valor += 1
	END
	print('El objetivo ha sido logrado!')


-- 77 NESTED LOOPS (BUCLES ANIDADOS) -- ----------------------------------------------- 77 NESTED LOOPS (BUCLES ANIDADOS)
DECLARE
	@valor1 int = 1,
	@valor2 int = 1;
	WHILE @valor1 <= 4
		BEGIN
			print concat('loop externo: = ', @valor1)	
			WHILE @valor2 <=8
				BEGIN
					print concat('loop interno: = ', @valor2)
					set @valor2 += 1;
				END
				set @valor2  = 1;
				set @valor1 += 1;
		END
		


-- 78  MANEJO DE REGISTROS CON BUCLE WHILE -------------------------------------------------- MANEJO DE REGISTROS CON BUCLE WHILE
USE Principal;

CREATE or ALTER PROCEDURE pr_ver_productos -- Las aplicaciones de USuario son las que usan los procedimientos
AS
	DECLARE
		@conteo int = (SELECT max(idproducto) FROM productos) -- Si o si van los paréntesis
	WHILE @conteo > 0
		BEGIN
			SELECT * FROM productos WHERE idproducto = @conteo;
			SET @conteo -= 1;
		END

EXEC pr_ver_productos;

-- Procedimiento que actualice los campos de mi tabla
CREATE or ALTER PROCEDURE pr_descuentos -- Las aplicaciones de USuario son las que usan los procedimientos
AS
	DECLARE
		@id int = (SELECT min(idproducto) FROM productos) -- Si o si van los paréntesis
	WHILE @id > 0
		BEGIN
			UPDATE productos 
				SET precio_unidad = precio_unidad * 0.9 
				WHERE idproducto = @id AND vendidos IS NULL
			
			SELECT @id = min(idproducto) -- ACÁ MODIFICAMOS @ID
				FROM productos
				WHERE idproducto > @id AND vendidos IS NULL  -- cuando no encuentras más valores en la tabla termina
		END

EXEC pr_descuentos;

-- 79 CURSORES
--* Recorren filas para traer resultados de forma secuencial
--* Son útiles para procesar filas independientes

SELECT * FROM productos;
-- ---------------------------- CONSULTAMOS UNA SOLA COLUMNA A CONTINUACION
DECLARE
	@descripcion numeric(6,2);

DECLARE
	cur_prod_info cursor for
		SELECT precio_unidad FROM productos -- tarea
		OPEN cur_prod_info -- abrimos el cursor para extraer la info
			fetch next from cur_prod_info into @descripcion
			WHILE @@fetch_status = 0 -- mientras encuentre datos, si todo está bien da 0
				BEGIN
					PRINT @descripcion
					fetch next from cur_prod_info into @descripcion
				END
		CLOSE cur_prod_info -- Cerramos el CURSOR
		DEALLOCATE cur_prod_info -- Liberamos los recursos asociados al cursor
-- ----------------------------

-- 80 CURSORES TIPO TABLA -------------------------------------------------------
DECLARE
	@id int,
	@nombre varchar(50),
	@precio numeric(6,2),
	@existencia int,
	@vendidos int;
DECLARE
	cur_productos cursor local static read_only	for 
	SELECT idproducto, nombre, precio_unidad, existencia, vendidos from productos;
	OPEN cur_productos;
		FETCH next from cur_productos into @id,@nombre,@precio,@existencia,@vendidos
		WHILE @@fetch_status = 0 -- mientras encuentre datos, si todo está bien da 0
				BEGIN
					PRINT str(@id)+@nombre+str(@precio)+str(@existencia)+str(@vendidos)
					fetch next from cur_productos into @id,@nombre,@precio,@existencia,@vendidos
				END
	CLOSE cur_productos;
	DEALLOCATE cur_productos;

-- 81 CURSORES: ACTUALIZAR DATOS ------------------------------------------
drop table empleados;
CREATE TABLE empleados (
    idempleado INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    puesto VARCHAR(50),
    salario DECIMAL(10, 2),
    activo char(2)
);

INSERT INTO empleados (idempleado, nombre, direccion, telefono, puesto, salario, activo)
VALUES
(1, 'Juan Perez', 'Avenida 123', '1234567890', 'Gerente', 750000.00, 'si'),
(2, 'Ana Martinez', 'Calle 456', '2345678901', 'Asistente', 550000.00, 'si'),
(3, 'Carlos Rodriguez', 'Callejon 789', '3456789012', 'Encargado de Operaciones', 600000.00, 'si'),
(4, 'María González', 'Plaza 101', '4567890123', 'Vendedor', 480000.00, 'si'),
(5, 'Luisa Sánchez', 'Paseo 202', '5678901234', 'Soporte Técnico', 520000.00, 'si'),
(6, 'Pedro Ramirez', 'Alameda 303', '6789012345', 'Secretaria', 450000.00, 'si'),
(7, 'Diego Morales', 'Jardín 404', '7890123456', 'Conserje', 400000.00, 'si'),
(8, 'Fernanda Cruz', 'Avenida 555', '8901234567', 'Gerente', 780000.00, 'si'),
(9, 'Sofía López', 'Calle 606', '9012345678', 'Asistente', 580000.00, 'si'),
(10, 'Andrés Herrera', 'Callejon 707', '0123456789', 'Encargado de Operaciones', 620000.00, 'si'),
(11, 'Jorge Fernández', 'Plaza 808', '1234567890', 'Vendedor', 510000.00, 'si'),
(12, 'Mónica Silva', 'Paseo 909', '2345678901', 'Soporte Técnico', 530000.00, 'si'),
(13, 'Roberto Mendoza', 'Alameda 010', '3456789012', 'Secretaria', 460000.00, 'si'),
(14, 'Laura Vargas', 'Jardín 111', '4567890123', 'Conserje', 410000.00, 'si'),
(15, 'Gabriel Reyes', 'Avenida 121', '5678901234', 'Gerente', 800000.00, 'si'),
(16, 'Carmen Navarro', 'Calle 131', '6789012345', 'Asistente', 600000.00, 'si'),
(17, 'Ricardo Paredes', 'Callejon 141', '7890123456', 'Encargado de Operaciones', 640000.00, 'si'),
(18, 'Isabel Ríos', 'Plaza 151', '8901234567', 'Vendedor', 530000.00, 'si'),
(19, 'Daniel Ortiz', 'Paseo 161', '9012345678', 'Soporte Técnico', 550000.00, 'si'),
(20, 'Patricia Castro', 'Alameda 171', '0123456789', 'Secretaria', 480000.00, 'si'),
(21, 'Raúl Medina', 'Avenida 222', '1234567890', 'Vendedor', 500000.00, 'si'),
(22, 'Camila Torres', 'Calle 333', '2345678901', 'Soporte Técnico', 540000.00, 'si'),
(23, 'Javier Gómez', 'Callejon 444', '3456789012', 'Secretaria', 470000.00, 'si'),
(24, 'Lucía Varela', 'Plaza 555', '4567890123', 'Conserje', 420000.00, 'si'),
(25, 'Eduardo Fuentes', 'Paseo 666', '5678901234', 'Gerente', 820000.00, 'si'),
(26, 'Valentina Mendoza', 'Alameda 777', '6789012345', 'Asistente', 610000.00, 'si'),
(27, 'Héctor Soto', 'Jardín 888', '7890123456', 'Encargado de Operaciones', 660000.00, 'si'),
(28, 'Marcela Paredes', 'Avenida 999', '8901234567', 'Vendedor', 520000.00, 'si'),
(29, 'Gustavo Ríos', 'Calle 1010', '9012345678', 'Soporte Técnico', 560000.00, 'si'),
(30, 'Natalia Navarro', 'Callejon 1111', '0123456789', 'Secretaria', 490000.00, 'si'),
(31, 'Roberto Ortega', 'Plaza 1212', '1234567890', 'Conserje', 430000.00, 'si'),
(32, 'María Fernández', 'Paseo 1313', '2345678901', 'Gerente', 840000.00, 'si'),
(33, 'Julián Silva', 'Alameda 1414', '3456789012', 'Asistente', 630000.00, 'si'),
(34, 'Mariana Vargas', 'Jardín 1515', '4567890123', 'Encargado de Operaciones', 680000.00, 'si'),
(35, 'Santiago López', 'Avenida 1616', '5678901234', 'Vendedor', 540000.00, 'si'),
(36, 'Isabella Cruz', 'Calle 1717', '6789012345', 'Soporte Técnico', 580000.00, 'si'),
(37, 'Andrés Mora', 'Callejon 1818', '7890123456', 'Secretaria', 500000.00, 'si'),
(38, 'Valeria Torres', 'Plaza 1919', '8901234567', 'Conserje', 450000.00, 'si'),
(39, 'Fernando García', 'Paseo 2020', '9012345678', 'Gerente', 860000.00, 'si'),
(40, 'Carolina Morales', 'Alameda 2121', '0123456789', 'Asistente', 640000.00, 'si');


-- AUMENTAR EL SUELDO A LAS SECRETARIAS

DECLARE
	@id int,
	@nuevosalario numeric(10,2);
DECLARE
	cur_salarios cursor	for 
	SELECT idempleado, salario from empleados WHERE puesto = 'secretaria';
	OPEN cur_salarios;
		FETCH next from cur_salarios into @id,@nuevosalario;
		WHILE @@fetch_status = 0 -- mientras encuentre datos, si todo está bien da 0
				BEGIN
					SET @nuevosalario = @nuevosalario * 1.1;
					UPDATE empleados SET salario = @nuevosalario WHERE current of cur_salarios; -- fila actual, POSICIÓN actual
					FETCH next from cur_salarios into @id,@nuevosalario;
				END
	CLOSE cur_salarios;
	DEALLOCATE cur_salarios;

SELECT * FROM empleados WHERE puesto = 'secretaria';
GO


-- 82 USARIOS: MODO GRÁFICO -----------------------------------------------------------------USUARIOS
SELECT * FROM sys.schemas; -- Listamos esquemas

CREATE schema prueba_usuario;

CREATE TABLE prueba_De_usuario(
campo1 int not null);

-- 83 USUARIOS: MODO SCRIPT------------------------------------------------------------- USUARIOS
CREATE login Usuario_Tsql
	WITH password = 'tooR',
	check_expiration = off,
	check_policy = off; -- políticas para contraseña

CREATE user Usuario_Tsql for login Usuario_Tsql
	WITH default_schema = prueba_usuario -- puedo poner dbo también

GRANT SELECT ON SCHEMA::dbo to Usuario_Tsql;
GRANT CREATE TABLE To Usuario_Tsql AS dbo;
GRANT INSERT, UPDATE, DELETE on dbo.prueba66 To Usuario_Tsql;

CREATE TABLE dbo.prueba66(id int);
INSERT into prueba66 VALUES(66);
SELECT * FROM prueba66;

-- quitar ROLES
REVOKE INSERT, UPDATE, DELETE 
	ON dbo.prueba66 TO Usuario_Tsql

INSERT into prueba66 VALUES(8);
SELECT * FROM prueba66;
DELETE FROM prueba66 WHERE id = 1;
-- ------------------------------Verificar Permisos Directos
SELECT
    dp.name AS PrincipalName,
    dp.type_desc AS PrincipalType,
    o.name AS ObjectName,
    p.permission_name,
    p.state_desc AS PermissionState
FROM
    sys.database_permissions AS p
JOIN
    sys.database_principals AS dp ON p.grantee_principal_id = dp.principal_id
JOIN
    sys.objects AS o ON p.major_id = o.object_id
WHERE
    o.name = 'prueba66' AND dp.name = 'Usuario_Tsql';
-- -----------------------------------------------------------------------------------


-- -----------------------------------------------------
CREATE login VScodeinge
	WITH password = 'tooR',
	check_expiration = off,
	check_policy = off; -- políticas para contraseña

CREATE user VScodeinge for login VScodeinge
	WITH default_schema = dbo -- puedo poner dbo también

GRANT SELECT ON SCHEMA::dbo to VScodeinge;


SELECT * FROM empleados WHERE puesto = 'secretaria';

-- 84 AUTOMATIZACIÓN DE TAREAS ADMINISTRATIVAS Y MANTENIMIENTO DE NUESTRA BBDD ---------------------------
--* El job es un recurso de la base no del managment studio
--* Copias de seguridad y restauración
--* Reindexación y mantenimiento de índices
--* Ejecutar scripts
--* Generar Informes en horario definido
--* Enviar notificaciones y mails


SELECT * FROM CONTROL

GRANT INSERT ON dbo.control to Usuario_Tsql;

SELECT * FROM CONTROL

INSERT INTO control (usuario, fecha, accion) VALUES (suser_name(), getdate(), 'Soy Un Registro');

-- ------------------------------Verificar Permisos Directos
SELECT
    dp.name AS PrincipalName,
    dp.type_desc AS PrincipalType,
    o.name AS ObjectName,
    p.permission_name,
    p.state_desc AS PermissionState
FROM
    sys.database_permissions AS p
JOIN
    sys.database_principals AS dp ON p.grantee_principal_id = dp.principal_id
JOIN
    sys.objects AS o ON p.major_id = o.object_id
WHERE
    o.name = 'control' AND dp.name = 'Usuario_Tsql';
-- -----------------------------------------------------------------------------------

-- 85  BACKUPS--------------------------------------------------------------------------------------------BACKUPS
BACKUP DATABASE Principal
To disk = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\Principal_Backup.bak'

-- 86 OVER ---------------------------------------------------------------------------------------------------86 OVER
drop table ordenes

CREATE TABLE ordenes (
id_orden INT PRIMARY KEY,
fecha_orden DATE,
monto_total DECIMAL(10, 2),
id_cliente int not null
);

INSERT INTO ordenes (id_orden, fecha_orden, monto_total, id_cliente)
VALUES
(1, '2019-03-10', 150.75, 001),
(2, '2019-06-25', 220.50, 002),
(3, '2019-09-14', 75.20, 003),
(4, '2019-12-03', 310.00, 004),
(5, '2020-02-20', 430.80, 005),
(6, '2020-05-07', 200.00, 006),
(7, '2020-08-18', 120.50, 007),
(8, '2020-11-29', 88.75, 008),
(9, '2021-01-15', 175.60, 009),
(10, '2021-04-22', 290.25, 010),
(11, '2021-07-05', 410.30, 011),
(12, '2021-10-14', 95.00, 012),
(13, '2022-02-01', 210.75, 013),
(14, '2022-05-09', 350.20, 014),
(15, '2022-08-20', 175.00, 015),
(16, '2022-11-30', 82.40, 016),
(17, '2023-03-08', 400.50, 017),
(18, '2023-06-15', 510.25, 018),
(19, '2023-09-25', 125.90, 019),
(20, '2023-12-05', 295.70, 020),
(21, '2024-02-14', 180.00, 021),
(22, '2024-04-30', 320.45, 022),
(23, '2024-07-11', 145.80, 023),
(24, '2024-10-22', 250.60, 024),
(25, '2019-02-18', 410.25, 025),
(26, '2019-05-29', 530.50, 026),
(27, '2019-08-08', 175.20, 027),
(28, '2019-11-17', 90.00, 028),
(29, '2020-03-05', 220.75, 029),
(30, '2020-06-12', 370.20, 030),
(31, '2020-09-21', 195.00, 031),
(32, '2020-12-30', 112.40, 032),
(33, '2021-02-16', 500.50, 033),
(34, '2021-05-25', 620.25, 034),
(35, '2021-09-03', 135.90, 035),
(36, '2021-12-15', 310.70, 036),
(37, '2022-03-24', 220.00, 037),
(38, '2022-06-03', 480.45, 038),
(39, '2022-09-12', 195.80, 039),
(40, '2022-12-22', 390.60, 040),
(41, '2023-02-09', 290.25, 041),
(42, '2023-05-18', 410.50, 042),
(43, '2023-08-29', 225.20, 043),
(44, '2023-11-08', 130.00, 044),
(45, '2024-02-18', 260.75, 045),
(46, '2024-05-27', 390.20, 046),
(47, '2024-08-06', 215.00, 047),
(48, '2024-11-16', 120.40, 048),
(49, '2019-04-23', 480.50, 049),
(50, '2019-07-02', 590.25, 050);


SELECT * FROM ordenes;

SELECT 
	id_orden, 
	fecha_orden, 
	monto_total, 
	id_cliente,
	sum(monto_total) over() AS Total_ventas,
	avg(monto_total) over() AS Prom_total
FROM ordenes;

-- 87 PARTITION BY --------------------------------------------------PARTITION BY
--* Divide el conjunto de resultado en particiones según los valores de una o más columnas
drop table Empleados;

CREATE TABLE empleados (
    idEmpleado INT PRIMARY KEY,
    nombre VARCHAR(100),
    puesto VARCHAR(100),
    idDepartamento INT,
    salario DECIMAL(10, 2)
);
-- Insertar filas en la tabla empleados
INSERT INTO empleados (idEmpleado, nombre, puesto, idDepartamento, salario) VALUES
(1, 'Juan Pérez', 'Gerente', 1, 5000.00),
(2, 'María López', 'Analista', 2, 3500.00),
(3, 'Pedro Martinez', 'Desarrollador', 1, 4000.00),
(4, 'Ana García', 'Diseñador', 3, 3800.00),
(5, 'Carlos Ruiz', 'Contador', 2, 4500.00),
(6, 'Sofía Hernandez', 'Analista', 1, 3800.00),
(7, 'Javier Ramos', 'Gerente de Proyectos', 3, 5500.00),
(8, 'Luisa Medina', 'Desarrollador', 2, 4200.00),
(9, 'Miguel Sánchez', 'Analista', 1, 3800.00),
(10, 'Elena Rodríguez', 'Diseñador', 3, 4000.00),
(11, 'Diego Pérez', 'Contador', 2, 4700.00),
(12, 'Fernanda Torres', 'Gerente de Recursos Humanos', 4, 6000.00),
(13, 'Gabriel García', 'Analista', 1, 3800.00),
(14, 'Adriana Jiménez', 'Desarrollador', 2, 4100.00),
(15, 'Ricardo Gómez', 'Diseñador', 3, 3900.00),
(16, 'Camila Reyes', 'Analista', 1, 3700.00),
(17, 'Roberto Morales', 'Contador', 2, 4800.00),
(18, 'Daniela Cruz', 'Gerente de Marketing', 5, 5800.00),
(19, 'Mario Vargas', 'Analista', 1, 3600.00),
(20, 'Natalia Peralta', 'Desarrollador', 2, 4300.00),
(21, 'Luis González', 'Diseñador', 3, 3800.00),
(22, 'Valeria Ramírez', 'Analista', 1, 3800.00),
(23, 'Arturo Díaz', 'Contador', 2, 4600.00),
(24, 'Paula Castro', 'Gerente de Ventas', 6, 5700.00),
(25, 'Raul Soto', 'Analista', 1, 3800.00),
(26, 'Karla Morales', 'Desarrollador', 2, 4200.00),
(27, 'Diego Ríos', 'Diseñador', 3, 3800.00),
(28, 'Erika Guzmán', 'Analista', 1, 3900.00),
(29, 'Hugo Martínez', 'Contador', 2, 4900.00),
(30, 'Marina Ortiz', 'Gerente de Operaciones', 7, 6000.00),
(31, 'Andrés Gutiérrez', 'Analista', 1, 3800.00),
(32, 'Sara Ramírez', 'Desarrollador', 2, 4400.00),
(33, 'Alexa Díaz', 'Diseñador', 3, 3700.00),
(34, 'Jorge Castro', 'Analista', 1, 3800.00),
(35, 'Ana Belén Ruiz', 'Contador', 2, 5000.00),
(36, 'David López', 'Gerente de Proyectos', 3, 5600.00),
(37, 'Laura Pérez', 'Analista', 1, 3800.00),
(38, 'Julio Hernández', 'Desarrollador', 2, 4300.00),
(39, 'Carolina Martín', 'Diseñador', 3, 3800.00),
(40, 'Francisco Reyes', 'Analista', 1, 3800.00),
(41, 'Gloria Torres', 'Contador', 2, 4700.00),
(42, 'Cristian Sánchez', 'Gerente de Recursos Humanos', 4, 5900.00),
(43, 'Ana Paula González', 'Analista', 1, 3800.00),
(44, 'Martín Jiménez', 'Desarrollador', 2, 4100.00),
(45, 'Verónica García', 'Diseñador', 3, 3900.00),
(46, 'Rosa Méndez', 'Analista', 1, 3700.00),
(47, 'Manuel Gómez', 'Contador', 2, 4800.00),
(48, 'Patricia Flores', 'Gerente de Marketing', 5, 5900.00),
(49, 'José Vásquez', 'Analista', 1, 3600.00),
(50, 'Isabel Mendoza', 'Desarrollador', 2, 4200.00);


-- Vamos a dividir los datos por departamento y luego calcular el promedio dentro de cada grupo
SELECT * FROM empleados;

SELECT 
	idEmpleado, 
	nombre, 
	puesto, 
	idDepartamento, 
	salario,
	avg(salario) over(PARTITION BY idDepartamento) As "Salario Prom por Dep"
	
FROM empleados;

SELECT 
	idEmpleado, 
	nombre, 
	puesto, 
	idDepartamento, 
	salario,
	SUM(salario) over(PARTITION BY puesto) As "Salario TOTAL por PUESTO"
	
FROM empleados;

-- Comparando Salario Individual con el Gasto Total en salario
SELECT 
	idEmpleado, 
	nombre, 
	puesto, 
	idDepartamento, 
	salario,
	ROUND((100*salario) / (sum(salario) over(partition by idDepartamento)),2) As "Porcentaje del Gasto en Salarios"
	
FROM empleados;

-- 88 RANK() ------------------------------------------------------------------------------------------- RANK
--* Asigna un rango para cada fila según los resultados agrupados según una o más columnas específicas.
--* Se utiliza para encontrar las posiciones relativas de un conjunto de datos previamente ordenados.
--* Antes de aplicar la función RANK(), los datos se ordenan según las columnas especificadas en la cláusula ORDER BY.
--* La función RANK asigna un rango a cada fila basándose en el orden de los datos después de la ordenación.

SELECT * FROM empleados;

--  RANKING DE SALARIOS
SELECT 
	idEmpleado,
	nombre,
	puesto,
	idDepartamento,
	salario,
	RANK() OVER(ORDER BY SALARIO DESC) AS Rango
FROM 
	empleados
ORDER BY Rango

-- 89 CLAUSULA WITH ------------------------------------------------------- CLAUSULA WITH
--* CTE: consulta temporal que se define en la parte superior de una sentencia.


SELECT * FROM empleados;

WITH EmpleadoCTE AS 
	(SELECT idEmpleado, nombre, puesto, idDepartamento, salario FROM empleados)
SELECT * 
FROM EmpleadoCTE;
-- LA CTE actua como una tabla temporal que contiene todos los resultados de la consulta definida en el interior del WITH

WITH ranking_empleados As
	(SELECT 
		idEmpleado,
		nombre,
		puesto,
		salario,
		rank() over(order by salario desc) AS Ranking
		From empleados
	)
SELECT * FROM ranking_empleados
WHERE Ranking <= 5
ORDER BY Ranking DESC;

-- 90 CONSULTAS CRUZADAS ---------------------------------------------------CONSULTAS CRUZADAS
DROP TABLE productos;
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    stock INT
);

CREATE TABLE Empaques (
    id_empaque INT PRIMARY KEY,
    tamanio_empaque VARCHAR(50),
    descripcion VARCHAR(100),
    peso INT,
    id_producto INT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO Productos (id_producto, nombre, descripcion, precio, stock)
VALUES 
(1, 'Corn Flakes', 'Cereal de maíz crujiente y delicioso', 3.99, 100),
(2, 'Choco Krispis', 'Cereal de arroz inflado con sabor a chocolate', 4.49, 80),
(3, 'Froot Loops', 'Cereal de maíz con sabor a frutas', 3.79, 120),
(4, 'Lucky Charms', 'Cereal de maíz con malvaviscos de colores', 4.99, 90),
(5, 'Cinnamon Toast Crunch', 'Cereal de trigo y canela', 4.29, 110),
(6, 'Rice Krispies', 'Cereal de arroz inflado', 3.49, 150);


INSERT INTO Empaques 
(id_empaque, tamanio_empaque, descripcion, peso,id_producto)
VALUES 
(1, 'Pequeño', 'Caja de 1 libra', 350, 1),
(2, 'Grande', 'Caja de 3 libras', 750, 1), 
(3, 'Mediano', 'Caja de 2 libras', 550, 2);


SELECT * FROM productos;
SELECT * FROM empaques;

-- Necesitamos el precio del producto con los Distintos empaques incluido
SELECT 
	productos.nombre, 
	Empaques.descripcion,
	productos.precio * empaques.peso AS Precio
FROM productos CROSS JOIN Empaques;

-- 91 BEGIN TRANSACTION, COMMIT ROLLBACK ----------------------------------------------------------
SELECT * FROM empleados;

BEGIN TRANSACTION;
	UPDATE empleados SET salario = salario * 1.5;
	-- Si el promedio de salarios de mi empresa es mayoa a 4k se procede a deshacer la transacción
	IF (SELECT avg(salario) FROM empleados) >= 10000 
		BEGIN
			ROLLBACK TRANSACTION;
			print('Ejecución Cancelada, promedio de salarios excedido')
		END
	ELSE
		BEGIN
			COMMIT TRANSACTION;
			print('Salarios actualizados correctamente') 
		END
