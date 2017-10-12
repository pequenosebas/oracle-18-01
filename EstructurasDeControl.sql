--Crear tabla menores edad

create table MENORES_EDAD(id_menores integer primary key,
                          nombre varchar2(60),
                          edad integer);
                          
create or replace procedure generar_mil
as begin
--generamos los mil
for i in 1..1000 loop
insert into MENORES_EDAD values(i,'La Kova',15);
end loop;
end;
/

--Vamos a ejecutar el procedimiento
begin
generar_mil();
end;
/
select * from MENORES_EDAD;

--contar los valores
select count(*) from MENORES_EDAD;

--Solucion Problema2
create or replace procedure ACTUALIZAR_EDAD (age in integer, id in integer) as
begin
if age <18 then 
raise_application_error (-2000,'NO ACEPTO EDADES MENORES A 18');
else
update MENORES_EDAD set edad=age where id_menores=id;
end if;
end;
/
