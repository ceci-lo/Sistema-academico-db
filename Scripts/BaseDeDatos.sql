-- =============================================
-- Eliminar BD si existe
-- =============================================
DROP DATABASE IF EXISTS SistemaAcademico;
CREATE DATABASE SistemaAcademico;
USE SistemaAcademico;

-- =============================================
-- TABLA: Persona
-- =============================================
CREATE TABLE Persona (
  ID_Persona INT NOT NULL AUTO_INCREMENT,
  DNI INT NOT NULL,
  Apellido VARCHAR(100) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Fecha_Nacimiento DATE NOT NULL,
  Lugar_Nacimiento VARCHAR(200) NULL,
  PRIMARY KEY (ID_Persona),
  UNIQUE KEY UK_DNI (DNI)
) ENGINE=InnoDB;

-- =============================================
-- TABLA: Alumno
-- =============================================
CREATE TABLE Alumno (
  ID_Persona INT NOT NULL,
  Nro_Legajo VARCHAR(20) NOT NULL,
  PRIMARY KEY (ID_Persona),
  UNIQUE KEY UK_Nro_Legajo (Nro_Legajo),
  CONSTRAINT FK_Alumno_Persona 
    FOREIGN KEY (ID_Persona) 
    REFERENCES Persona(ID_Persona)
    ON DELETE CASCADE 
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =============================================
-- TABLA: Docentes
-- =============================================
CREATE TABLE Docentes (
  ID_Persona INT NOT NULL,
  PRIMARY KEY (ID_Persona),
  CONSTRAINT FK_Docentes_Persona 
    FOREIGN KEY (ID_Persona)
    REFERENCES Persona(ID_Persona)
	ON DELETE CASCADE 
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =============================================
-- TABLA: Cargo
-- =============================================
CREATE TABLE Cargo (
  ID_Cargo INT NOT NULL AUTO_INCREMENT,
  Nombre_Cargo VARCHAR(100) NOT NULL,
  PRIMARY KEY (ID_Cargo),
  UNIQUE KEY UK_Nombre_Cargo (Nombre_Cargo)
) ENGINE=InnoDB;

-- =============================================
-- TABLA: Carreras
-- =============================================
CREATE TABLE Carreras (
  ID_Carrera INT NOT NULL AUTO_INCREMENT,
  Nombre_Carrera VARCHAR(200) NOT NULL,
  Fecha_Inicio DATE NULL,
  PRIMARY KEY (ID_Carrera)
) ENGINE=InnoDB;

-- =============================================
-- TABLA: Materias
-- =============================================
CREATE TABLE Materias (
  ID_Materia INT NOT NULL AUTO_INCREMENT,
  Nombre_Materia VARCHAR(200) NOT NULL,
  PRIMARY KEY (ID_Materia)
) ENGINE=InnoDB;

-- =============================================
-- RELACIÓN: Docentes_Cargo (1:N)
-- =============================================
CREATE TABLE Docentes_Cargo (
  ID_Persona INT NOT NULL,
  ID_Cargo INT NOT NULL,
  Fecha_Asignacion DATE NULL,
  PRIMARY KEY (ID_Persona, ID_Cargo),
  KEY FK_Cargo (ID_Cargo),
  CONSTRAINT FK_DocentesCargo_Docentes 
    FOREIGN KEY (ID_Persona) 
    REFERENCES Docentes(ID_Persona)
    ON DELETE CASCADE,
  CONSTRAINT FK_DocentesCargo_Cargo 
    FOREIGN KEY (ID_Cargo) 
    REFERENCES Cargo(ID_Cargo)
    ON DELETE RESTRICT
) ENGINE=InnoDB;

-- =============================================
-- RELACIÓN: Alumno_Cursa_Materias (N:M)
-- =============================================
CREATE TABLE Alumno_Cursa_Materias (
  ID_Persona INT NOT NULL,
  ID_Materia INT NOT NULL,
  Anio INT NOT NULL,
  Cuatrimestre INT NOT NULL,
  PRIMARY KEY (ID_Persona, ID_Materia, Anio, Cuatrimestre),
  KEY FK_Cursa_Materia (ID_Materia),
  CONSTRAINT FK_Cursa_Alumno 
    FOREIGN KEY (ID_Persona) 
    REFERENCES Alumno(ID_Persona)
    ON DELETE CASCADE,
  CONSTRAINT FK_Cursa_Materias 
    FOREIGN KEY (ID_Materia) 
    REFERENCES Materias(ID_Materia)
    ON DELETE RESTRICT
) ENGINE=InnoDB;

-- =============================================
-- RELACIÓN: Alumno_Rinde_Materias (N:M)
-- =============================================
CREATE TABLE Alumno_Rinde_Materias (
  ID_Examen INT NOT NULL AUTO_INCREMENT,
  ID_Persona INT NOT NULL,
  ID_Materia INT NOT NULL,
  Fecha_Examen DATE NOT NULL,
  Nota_Final DECIMAL(4,2) NULL,
  PRIMARY KEY (ID_Examen),
  KEY FK_Rinde_Alumno (ID_Persona),
  KEY FK_Rinde_Materia (ID_Materia),
  CONSTRAINT FK_Rinde_Alumno 
    FOREIGN KEY (ID_Persona) 
    REFERENCES Alumno(ID_Persona)
    ON DELETE CASCADE,
  CONSTRAINT FK_Rinde_Materias 
    FOREIGN KEY (ID_Materia) 
    REFERENCES Materias(ID_Materia)
    ON DELETE RESTRICT
) ENGINE=InnoDB;

-- =============================================
-- RELACIÓN: Docentes_Dicta_Materias (N:M)
-- =============================================
CREATE TABLE Docentes_Dicta_Materias (
  ID_Persona INT NOT NULL,
  ID_Materia INT NOT NULL,
  Hora_Clase VARCHAR(50) NULL,
  PRIMARY KEY (ID_Persona, ID_Materia),
  KEY FK_Dicta_Materia (ID_Materia),
  CONSTRAINT FK_Dicta_Docentes 
    FOREIGN KEY (ID_Persona) 
    REFERENCES Docentes(ID_Persona)
    ON DELETE CASCADE,
  CONSTRAINT FK_Dicta_Materias 
    FOREIGN KEY (ID_Materia) 
    REFERENCES Materias(ID_Materia)
    ON DELETE CASCADE
) ENGINE=InnoDB;

-- =============================================
-- RELACIÓN: Docentes_Titular_Materias (1:1)
-- =============================================
CREATE TABLE Docentes_Titular_Materias (
  ID_Persona INT NOT NULL,
  ID_Materia INT NOT NULL,
  Fecha_Desde DATE NULL,
  PRIMARY KEY (ID_Persona, ID_Materia),
  UNIQUE KEY UK_Materia_Titular (ID_Materia),
  CONSTRAINT FK_Titular_Docentes 
    FOREIGN KEY (ID_Persona) 
    REFERENCES Docentes(ID_Persona)
    ON DELETE RESTRICT,
  CONSTRAINT FK_Titular_Materias 
    FOREIGN KEY (ID_Materia) 
    REFERENCES Materias(ID_Materia)
    ON DELETE CASCADE
) ENGINE=InnoDB;

-- =============================================
-- RELACIÓN: Alumno_Inscribe_Carreras (N:M)
-- =============================================
CREATE TABLE Alumno_Inscribe_Carreras (
  ID_Persona INT NOT NULL,
  ID_Carrera INT NOT NULL,
  Fecha_Inscripcion DATE NULL,
  Estado ENUM('Activo','Inactivo','Graduado') DEFAULT 'Activo',
  PRIMARY KEY (ID_Persona, ID_Carrera),
  KEY FK_Inscribe_Carrera (ID_Carrera),
  CONSTRAINT FK_Inscribe_Alumno 
    FOREIGN KEY (ID_Persona) 
    REFERENCES Alumno(ID_Persona)
    ON DELETE CASCADE,
  CONSTRAINT FK_Inscribe_Carreras 
    FOREIGN KEY (ID_Carrera) 
    REFERENCES Carreras(ID_Carrera)
    ON DELETE RESTRICT
) ENGINE=InnoDB;

-- =============================================
-- RELACIÓN: Materias_Pertenece_Carreras (N:M)
-- =============================================
CREATE TABLE Materias_Pertenece_Carreras (
  ID_Materia INT NOT NULL,
  ID_Carrera INT NOT NULL,
  Fecha_Inicio DATE NULL,
  Fecha_Fin DATE NULL,
  PRIMARY KEY (ID_Materia, ID_Carrera),
  KEY FK_Pertenece_Carrera (ID_Carrera),
  CONSTRAINT FK_Pertenece_Materias 
    FOREIGN KEY (ID_Materia) 
    REFERENCES Materias(ID_Materia)
    ON DELETE CASCADE,
  CONSTRAINT FK_Pertenece_Carreras 
    FOREIGN KEY (ID_Carrera) 
    REFERENCES Carreras(ID_Carrera)
    ON DELETE CASCADE
) ENGINE=InnoDB;

-- =============================================
-- RELACIÓN: Tutoria (Auto-relación 1:1)
-- =============================================
CREATE TABLE Tutoria (
  ID_Tutor INT NOT NULL,
  ID_Tutorado INT NOT NULL,
  Fecha_Inicio DATE NULL,
  PRIMARY KEY (ID_Tutor, ID_Tutorado),
  UNIQUE KEY UK_Tutorado (ID_Tutorado),
  KEY FK_Tutoria_Tutorado (ID_Tutorado),
  CONSTRAINT FK_Tutoria_Tutor 
    FOREIGN KEY (ID_Tutor) 
    REFERENCES Alumno(ID_Persona)
    ON DELETE CASCADE,
  CONSTRAINT FK_Tutoria_Tutorado 
    FOREIGN KEY (ID_Tutorado) 
    REFERENCES Alumno(ID_Persona)
    ON DELETE CASCADE
) ENGINE=InnoDB;

-- =============================================
-- Verificación
-- =============================================
SELECT 'Base de datos creada exitosamente!' AS Resultado;
SHOW TABLES;

-- INSERT INTO table_name (column1, column2, column3, ...)
-- VALUES (value1, value2, value3, ...);

