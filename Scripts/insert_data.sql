-- INSERT INTO table_name (column1, column2, column3, ...)
-- VALUES (value1, value2, value3, ...);

-- Inserta datos en la tabla persona
INSERT INTO persona (DNI, Apellido, Nombre, Fecha_Nacimiento, Lugar_Nacimiento)
VALUES (1234565, 'Lopez','Ana','2001-04-12','Argentina'),
		(32783653,'García', 'Juan', '1995-11-23', 'Argentina'),
		(4783562,'Martínez', 'Elena', '1988-07-30', 'Argentina'),
		(543357,'Rodríguez', 'Luis', '2005-01-15', 'Argentina');
 
 -- Inserta datos en tabla alumnos    
INSERT INTO alumno (ID_Persona, Nro_Legajo)
Values (1, 1),(2, 2),(3, 3);

 -- Inserta datos en tabla docentes
INSERT INTO docentes (Id_Persona)
Values (4);

 -- Inserta datos en tabla carrera
INSERT INTO carreras (Nombre_Carrera, Fecha_inicio)
Values ('ing. Sistemas', '2026-03-04'),
 ('ing. Electrica', '2026-03-04'),
 ('ing. Civil', '2026-03-04'),
 ('ing. Materiales', '2026-03-04'); -- Materias
INSERT INTO materias (Nombre_Materia)
VALUES 
    ('Algoritmos y Estructuras de Datos'),
    ('Base de Datos'),
    ('Sistemas Operativos'),
    ('Matemática I'),
    ('Física I');

-- Cargos
INSERT INTO cargo (Nombre_Cargo)
VALUES 
    ('Profesor Titular'),
    ('Profesor Adjunto'),
    ('Ayudante de Primera'),
    ('JTP');

-- Asignar cargo al docente
INSERT INTO docentes_cargo (ID_Persona, ID_Cargo, Fecha_Asignacion)
VALUES (4, 1, '2024-03-01');

-- Inscribir alumnos en carreras
INSERT INTO alumno_inscribe_carreras (ID_Persona, ID_Carrera, Fecha_Inscripcion, Estado)
VALUES 
    (1, 1, '2024-03-04', 'Activo'),
    (2, 1, '2024-03-04', 'Activo'),
    (3, 2, '2024-03-04', 'Activo');

-- Relacionar materias con carreras
INSERT INTO materias_pertenece_carreras (ID_Materia, ID_Carrera, Fecha_Inicio)
VALUES 
    (1, 1, '2024-03-04'),
    (2, 1, '2024-03-04'),
    (3, 1, '2024-03-04'),
    (4, 1, '2024-03-04'),
    (5, 2, '2024-03-04');

-- Alumnos cursan materias
INSERT INTO alumno_cursa_materias (ID_Persona, ID_Materia, Anio, Cuatrimestre)
VALUES 
    (1, 1, 2024, 1),
    (1, 2, 2024, 1),
    (2, 1, 2024, 1),
    (2, 4, 2024, 1);

-- Alumnos rinden materias
INSERT INTO alumno_rinde_materias (ID_Persona, ID_Materia, Fecha_Examen, Nota_Final)
VALUES 
    (1, 1, '2024-07-15', 8.50),
    (2, 1, '2024-07-15', 7.00),
    (1, 4, '2024-07-20', 9.00);

-- Docentes dictan materias
INSERT INTO docentes_dicta_materias (ID_Persona, ID_Materia, Hora_Clase)
VALUES 
    (4, 1, 'Lunes 14:00-18:00'),
    (4, 2, 'Miércoles 14:00-18:00');

-- Docente titular de materias
INSERT INTO docentes_titular_materias (ID_Persona, ID_Materia, Fecha_Desde)
VALUES 
    (4, 1, '2024-03-01'),
    (4, 2, '2024-03-01');

-- Tutorías
INSERT INTO tutoria (ID_Tutor, ID_Tutorado, Fecha_Inicio)
VALUES (2, 1, '2024-04-01');




