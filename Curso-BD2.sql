--Clase del Sabado 7 de Oct
create table ALMACEN (num_almacen integer, ubic_almacen varchar2(80), constraint PK_numero_almacen primary key (num_almacen));--para determinar la PK

--vamos a crear un procedimiento almacenado para guardar una entidad o registro de tipo almacen
create or replace procedure guardar_almacen(mi_id in integer, mi_ubicacion in varchar2)
as
begin
--Aqui la logiaca del procedimiento
insert into ALMACEN values (mi_id,mi_ubicacion);
end;
/

--Vamos a probar que finciona nuestro pocedimiento
begin
guardar_almacen(1,'PLYMOUTH'); --BLoque plsql
end;
/

SELECT * FROM ALMACEN;