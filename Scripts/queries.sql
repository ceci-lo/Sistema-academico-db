-- CONSULTAS BÁSICAS --

-- Listar todos los docentes 
SELECT d.ID_Persona, p.Nombre as Nombre_Docente, p.Apellido as Apellido_Docente FROM persona p 
JOIN docentes d 
ON  p.ID_Persona= d.ID_Persona   ;

-- Listar todos los alumnos con su número de legajo
SELECT * FROM persona p JOIN alumno a ON p.ID_Persona = a.ID_Persona; 

-- Mostrar todas las carreras con sus fechas de inicio
SELECT * FROM carreras;

--  (Intermedias):
-- Alumnos inscriptos en cada carrera (mostrar nombre alumno y nombre carrera)
SELECT a.Nro_Legajo as "legajo", p.Nombre as "nombre" , p.Apellido "apellido", c.Nombre_Carrera "carrera" 
FROM alumno_inscribe_carreras aip 
INNER JOIN persona p 
on aip.ID_Persona = p.ID_Persona 
INNER JOIN alumno a
on  a.ID_Persona = aip.ID_Persona
INNER JOIN carreras c
on c.ID_Carrera = aip.ID_Carrera;

-- -- Materias que pertenecen a cada carrera
Select m.Nombre_Materia, mpc.Fecha_Inicio as "fecha_inicio", c.Nombre_Carrera as 'carrera'
from materias_pertenece_carreras mpc
INNER JOIN  materias m
ON m.ID_Materia = mpc.ID_Materia
INNER JOIN carreras c
ON c.ID_Carrera = mpc.ID_Carrera
ORDER BY c.Nombre_Carrera, m.Nombre_Materia;

-- Materias que cursa cada alumno en 2024
 Select  m.Nombre_Materia as "materia", p.Nombre as "nombre", p.Apellido as "apellido"
 from alumno_cursa_materias mcc
 INNER JOIN  materias m
 ON m.ID_Materia = mcc.ID_Materia
 INNER JOIN persona p
 ON p.ID_Persona = mcc.ID_Persona
 ORDER BY m.Nombre_Materia ;

-- Notas finales de cada alumno (nombre alumno, materia, nota)
 Select  m.Nombre_Materia as materia, p.Nombre as nombre, p.Apellido as apellido, mrc.Nota_Final as nota
 from alumno_rinde_materias mrc
 INNER JOIN materias m
	ON m.ID_Materia = mrc.ID_Materia
 INNER JOIN persona p
	ON p.ID_Persona = mrc.ID_Persona
ORDER BY p.Apellido, p.Nombre ;
 
-- Promedio de notas de cada alumno
Select   p.Nombre as nombre, p.Apellido as apellido , avg(mrc.Nota_Final) as promedio
 from alumno_rinde_materias mrc
 INNER JOIN persona p
	ON p.ID_Persona = mrc.ID_Persona
GROUP BY  p.Apellido, p.Nombre 
ORDER BY p.Apellido ; 

-- Cantidad de alumnos por carrera
select count( ID_Persona ) as cantidadA, aic.ID_Carrera,c.Nombre_Carrera FROM alumno_inscribe_carreras aic
inner join carreras c
on c.ID_Carrera = aic.ID_Carrera
 group by ID_Carrera ;
 
 -- Cantidad de materias que cursa cada alumno
select count(ID_Materia) as ctd_Materias, acm.ID_Persona, p.Apellido as apellido, p.Nombre as nombre from alumno_cursa_materias acm
inner join persona p
on p.ID_Persona = acm.ID_Persona
group by ID_Persona; 

