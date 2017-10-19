--CREAMPOS LA SIG TABLA
create table CARTERA_CLIENTES(id integer primary key, nombre varchar2(40), edad integer, sueldo_base float);

insert into CARTERA_CLIENTES values(1,'JUAN',25,60000);
insert into CARTERA_CLIENTES values(2,'ANA',45,40000);
insert into CARTERA_CLIENTES values(3,'PEDRO',32,40000);
insert into CARTERA_CLIENTES values(4,'IRMA',45,70000);
insert into CARTERA_CLIENTES values(5,'LUIS',55,20000);

SELECT * FROM CARTERA_CLIENTES;

declare
sueldo float;
pago_nomina float;
begin
--declaramos el cursor implicito
select sueldo_base into sueldo from CARTERA_CLIENTES where id=3;
pago_nomina:=sueldo*20;
dbms_output.put_line('EL PAGO ES '||pago_nomina);

end;
/

set SERVEROUTPUT ON;

--CREAMOS TABLA NOMINA, cursor implicito
create table NOMINAS (id_nomina integer primary key, nombre varchar2(60));  --PASO 1: CREAMOS TABLA

create sequence sec_NOMINAS  --PASO 2: GENERAR SECUENCIA
start with 1 
increment by 2
nomaxvalue;

create or replace procedure guardar_NOMINAS(my_id out integer,my_nombre in varchar2)--PASO 3: CREAR UN PROCEDIMIENTO DE ENLACE DE TABLA SECUENCIA
as
begin
select sec_NOMINAS.NEXTVAL into my_id from DUAL;
insert into NOMINAS values(my_id,my_nombre);
end;
/

--FINALMENTE VAMOS A PROBAR EL PROCEDIMIENTO CON UN BLOQUE PL SQL
declare
valor integer;
begin
guardar_NOMINAS(valor,'JUAN');
DBMS_OUTPUT.PUT_LINE('EL PK GENERADO ES '||valor);
end;
/

select * from NOMINAS;