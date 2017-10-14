create table USUARIO (id integer primary key,
                      nombre varchar(40),
                      edad integer);
                      
insert into USUARIO values (1,'JUAN',40);
insert into USUARIO values (2,'ANA',32);
insert into USUARIO values (3,'PEDRO',27);
insert into USUARIO values (4,'MARIA',30);

select * from USUARIO;

set SERVEROUTPUT on;  --imrimir lo sucedido en la salida

--EXPLICITO ej1
declare
cursor cur_1 is select * from USUARIO;
begin
--Aqui viene la logica del cursor
for FILA in cur_1 loop
DBMS_OUTPUT.PUT_LINE('El nombre actual es '||FILA.nombre);   --DBMS: Se va a tener una salida en consola
end loop;
end;
/

--ej2
declare
cursor cur_2 is select * from USUARIO;
sueldo_base integer;
begin
--inicializamos sueldo_base
for FILA in cur_2 loop
sueldo_base:=6000;
if FILA.edad >30 then
sueldo_base:=sueldo_base*1.5;
end if;
DBMS_OUTPUT.PUT_LINE('El sueldo es '||sueldo_base || 'Edad: ' ||  FILA.edad);
end loop;
end;
/