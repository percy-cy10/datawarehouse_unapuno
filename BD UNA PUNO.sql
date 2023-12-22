-- Tabla de Hechos (Calificaciones)
CREATE TABLE HECHOS_CALIFICACIONES (
    ID_Calificacion INT PRIMARY KEY,
    ID_Facultad INT,
    ID_Escuela_Carrera INT,
    ID_Docente INT,
    ID_Periodo INT,
    ID_Estudiante INT,
    Calificacion DECIMAL(5, 2)
);

-- Dimensiones

-- Facultad
CREATE TABLE DIM_FACULTAD (
    ID_Facultad INT PRIMARY KEY,
    Nombre_Facultad VARCHAR(255)
);

-- Escuela / Carrera
CREATE TABLE DIM_ESCUELA_CARRERA (
    ID_Escuela_Carrera INT PRIMARY KEY,
    ID_Facultad INT,
    Nombre_Escuela_Carrera VARCHAR(255)
);

-- Docente
CREATE TABLE DIM_DOCENTE (
    ID_Docente INT PRIMARY KEY,
    Nombre_Docente VARCHAR(255)
);

-- Periodo
CREATE TABLE DIM_PERIODO (
    ID_Periodo INT PRIMARY KEY,
    Fecha_Inicio DATE,
    Fecha_Fin DATE
);

-- Estudiante
CREATE TABLE DIM_ESTUDIANTE (
    ID_Estudiante INT PRIMARY KEY,
    Nombre_Estudiante VARCHAR(255)
);

-- Claves Foráneas

ALTER TABLE HECHOS_CALIFICACIONES
ADD FOREIGN KEY (ID_Facultad) REFERENCES DIM_FACULTAD(ID_Facultad);

ALTER TABLE HECHOS_CALIFICACIONES
ADD FOREIGN KEY (ID_Escuela_Carrera) REFERENCES DIM_ESCUELA_CARRERA(ID_Escuela_Carrera);

ALTER TABLE HECHOS_CALIFICACIONES
ADD FOREIGN KEY (ID_Docente) REFERENCES DIM_DOCENTE(ID_Docente);

ALTER TABLE HECHOS_CALIFICACIONES
ADD FOREIGN KEY (ID_Periodo) REFERENCES DIM_PERIODO(ID_Periodo);

ALTER TABLE HECHOS_CALIFICACIONES
ADD FOREIGN KEY (ID_Estudiante) REFERENCES DIM_ESTUDIANTE(ID_Estudiante);