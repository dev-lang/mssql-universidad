USE Universidad

select TOP 4 nombres, apellidos, Fecha_Nacimiento, genero from Alumnos where genero = 'Femenino' AND EstadoCivil = 'Soltero' ORDER BY Fecha_Nacimiento ASC;
--and idalumno < 10;
--or identidadalumno valor

select nombres AS nombre, apellidos as apellido, genero AS Sexo from Profesores AS Prof order by Nombres;


-- USAR SELECT DISTINCT para limitar registros repetidos segun criterio
-- group by
-- por ejemplo

select top 5 nombres from profesores GROUP BY genero;
