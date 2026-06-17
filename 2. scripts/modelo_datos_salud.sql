-- 1. Crear la Base de Datos
CREATE DATABASE IF NOT EXISTS SaludChileDB;
USE SaludChileDB;

-- 2. Tabla de Dimensiones (Establecimientos)
CREATE TABLE Dim_Establecimientos (
    Establecimiento_Codigo INT PRIMARY KEY,
    Region_Codigo INT,
    Region_Glosa VARCHAR(100),
    Seremi_Salud_Glosa VARCHAR(150),
    Tipo_Establecimiento_Glosa VARCHAR(100),
    Establecimiento_Glosa VARCHAR(255),
    Comuna VARCHAR(100),
    Tipo_Urgencia VARCHAR(50),
    Tipo_Sistema_Salud VARCHAR(100),
    Nivel_Complejidad VARCHAR(50)
) ENGINE=InnoDB;

-- 3. Tabla de Hechos (REM)
CREATE TABLE Fact_REM (
    ID_Registro INT AUTO_INCREMENT PRIMARY KEY,
    Periodo INT,
    Codigo_Establecimiento INT,
    Establecimiento VARCHAR(255),
    Area_Funcional VARCHAR(150),
    Mes INT,
    Dias_Camas_Ocupadas INT,
    Dias_Camas_Disponibles INT,
    Dias_Estada INT,
    Numero_Egresos INT,
    Egresos_Fallecidos INT,
    Traslados INT,
    Indice_Ocupacional FLOAT,
    Promedio_Camas_Disponibles FLOAT,
    Promedio_Estadia FLOAT,
    Letalidad FLOAT,
    Indice_Rotacion FLOAT,
    CONSTRAINT fk_establecimiento 
        FOREIGN KEY (Codigo_Establecimiento) 
        REFERENCES Dim_Establecimientos(Establecimiento_Codigo)
) ENGINE=InnoDB;

-- 4. Dashboard Salud
DROP VIEW IF EXISTS View_Dashboard_Salud;
CREATE VIEW View_Dashboard_Salud AS
SELECT 
    f.Periodo,
    f.Mes,
    d.Region_Glosa,
    d.Comuna,
    d.Tipo_Establecimiento_Glosa,
    d.Nivel_Complejidad,
    f.Indice_Ocupacional,
    f.Indice_Rotacion,
    f.Promedio_Estadia,
    f.Letalidad,
    (f.Dias_Camas_Disponibles - f.Dias_Camas_Ocupadas) AS Brecha_Camas
FROM Fact_REM f
JOIN Dim_Establecimientos d ON f.Codigo_Establecimiento = d.Establecimiento_Codigo;

-- (PELIGRO) Eliminar base de datos y tablas
DROP DATABASE SaludChileDB;
DROP TABLE Fact_REM;
DROP TABLE Dim_Establecimientos;