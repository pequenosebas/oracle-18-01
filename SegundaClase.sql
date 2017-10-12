--creamos la tabla almacen
create table ALMACEN (num_almacen integer, ubic_almacen varchar(80), constraint PK_num_almacen primary key(num_almacen)); 

--Insertamos el primer registro
insert into ALMACEN values (1,'PLYMOUTH');

--hacemos un select simple
select * from ALMACEN

--Generamos la tabla vendedor
create table vendedor (num_vendedor integer, nom_vendedor varchar2(60), area_ventas varchar2(60), constraint pk_nv primary key(num_vendedor));

DESCRIBE ALMACEN;
DESCRIBE vendedor;

--generamos tabla cliente
create table cliente(num_cliente integer, num_almacen integer, nom_cliente varchar(60), constraint pk_nc primary key(num_cliente), constraint fk1_na foreign key(num_almacen) references ALMACEN(num_almacen));

--Generamos tabla ventas
create table ventas(id_ventas integer, 
                    num_cliente integer, 
                    num_vendedor integer, 
                    monto_venta float, 
                    constraint PK_Vv1 primary key (id_ventas), 
                    constraint fk1_nc1 foreign key (num_cliente)
                    references cliente(num_cliente),
                    constraint fk1_nv1 foreign key (num_vendedor)
                    references vendedor(num_vendedor)
                    );

--Mi primer procedimiento almacenado (obj de bdd)
create or replace procedure HOLA(NOMBRE in varchar2) 
as 
begin
dbms_output.put_line('HOLA ' ||NOMBRE);
end;
/
SET SERVEROUTPUT ON;

--INVOCAMOS EL PROCEDIMIENTO
BEGIN
HOLA ('JUAN CARLOS');
END;
/