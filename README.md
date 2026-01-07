# Sistema-academico-db
## Descripción del Problema

Una facultad necesita gestionar la información de sus alumnos, docentes, materias y carreras. El sistema debe permitir:

- Registro de alumnos y docentes con sus datos personales
- Gestión de materias y sus docentes (titular y dictantes)
- Inscripción de alumnos en múltiples carreras
- Registro de cursado y rendición de materias
- Sistema de tutorías entre alumnos
- Asignación de cargos a docentes


### Esquema relacional:

PERSONA(id_persona, dni, nombre, apellido, fecha_nacimiento, lugar_nacimiento)  
ALUMNO(id_persona, nro_legajo)  
DOCENTE(id_persona, id_cargo)  
CARGO(id_cargo, nombre_cargo)  
MATERIA(id_materia, nombre_materia)  
CARRERA(id_carrera, nombre_carrera)  

Relaciones:
CURSA(id_persona, id_materia)
RINDE(id_persona, id_materia, nota_final)
DICTA(id_persona, id_materia, hora_clase)

##  Diagrama Entidad-Relación

![Diagrama ER](diagrams/diagrama-er.png)

##  Estructura del Proyecto

├── diagrams/           # Diagramas ER y relacionales
├── docs/              # Documentación adicional
├── scripts/           # Scripts SQL
│   ├── 01_create_schema.sql
│   ├── 02_insert_data.sql
│   └── 03_queries.sql
└── data/              # Datos de prueba (CSV)


##  Estado del Proyecto

- [x] Diagrama Entidad-Relación
- [ ] Modelo Relacional
- [ ] Scripts de creación de tablas
- [ ] Datos de prueba
- [ ] Consultas SQL de ejemplo

## Tecnologías

- MySQL 
- Modelo Entidad-Relación 

## 👤 Autor

Cecilia Lorenzini
- GitHub: @ceci-lo(https://github.com/ceci-lo)
- LinkedIn: Cecilia Lorenzini (https://www.linkedin.com/in/ceci-lo/)



⭐ Si te gusta este proyecto, dale una estrella!
