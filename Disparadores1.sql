--TEMA NUEVO DISPARADORES
create table MAYORES (id integer primary key, nombre varchar2 (80), edad integer);

create or replace trigger DISP_MAYORES before insert on MAYORES for each row --each row; es para garantizar que dispare en cada fila, si se ejecuta un cursor
begin
if :NEW.edad<18 then
raise_application_error(-20000, 'EDAD INCORRECTA'); --Esto es una excepcion de ORACLE, error en tiempo de ejecucion
end if;
end;
/

insert into MAYORES values (1, 'JUAN',20);
select * from MAYORES;
insert into MAYORES values (2, 'ANA',16);
select * from MAYORES;

---------
--EJERCICIO 2
create table NOMINA (id integer primary key, sueldo_base float,horas_laboradas integer, deposito float);

insert into NOMINA values (1,20,2000,28000);--NO
insert into NOMINA values (2,16,1000,50000);

delete from NOMINA;

insert into NOMINA values (1,2000,20,28000);
insert into NOMINA values (2,1000,16,50000);

select * from NOMINA;

create or replace trigger DISP_NOMINA before update on NOMINA
for each row
begin
--INICIAMOS LA LOGICA DEL DISPARADOR
:NEW.deposito := :OLD.deposito+:NEW.horas_laboradas * :OLD.sueldo_base;
end;
/

update NOMINA set horas_laboradas=20 where id=1; 
select * from NOMINA;