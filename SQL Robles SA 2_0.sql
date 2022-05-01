
--drop database [ROBLES S.A 2.0]
create database [ROBLES S.A 2.0]
go

use [ROBLES S.A 2.0]
go

create table tipos_productos
(cod_tipo_producto int identity(1,1)
Constraint pk_tipos_productos primary key (cod_tipo_producto),
tipo_producto varchar(50)
)


create table productos
(cod_producto int identity(1,1)
Constraint pk_productos primary key (cod_producto),
nombre varchar(75),
descripcion varchar(150),
precio decimal(7,2),
stock int,
cod_tipo_producto int
Constraint fk_tipos_productos foreign key (cod_tipo_producto)
references tipos_productos (cod_tipo_producto)
)


create table formas_envio
(cod_forma_envio int identity(1,1)
Constraint pk_formas_envio primary key (cod_forma_envio),
nombre_forma_envio varchar(50)
)


create table formas_pago
(cod_forma_pago int identity(1,1)
Constraint pk_formas_pago primary key (cod_forma_pago),
forma_pago varchar(50)
)


create table tipos_venta
(id_tipo_venta int identity(1,1)
Constraint pk_tipos_venta primary key (id_tipo_venta),
tipo_venta varchar(50),
descuento varchar(3),
)


create table documentos
(id_tipo_doc int identity(1,1)
Constraint pk_documentos primary key (id_tipo_doc),
tipo_doc varchar(50)
)


create table provincias
(id_provincia int identity(1,1)
Constraint pk_provincias primary key (id_provincia),
provincia varchar(100)
)


create table localidades
(id_localidad int identity(1,1)
Constraint pk_localidades primary key (id_localidad),
localidad varchar(100),
id_provincia int
Constraint fk_provincias foreign key (id_provincia)
references provincias (id_provincia)
)


create table barrios
(id_barrio int identity(1,1)
Constraint pk_barrios primary key (id_barrio),
barrio varchar(100),
id_localidad int
Constraint fk_localidades foreign key (id_localidad)
references localidades (id_localidad)
)


create table tipos_contactos
(id_tipo_contacto int identity(1,1)
Constraint pk_tipos_contactos primary key (id_tipo_contacto),
tipo_contacto varchar(50)
)


create table clientes
(id_cliente int identity(1,1)
Constraint pk_clientes primary key (id_cliente),
nombre varchar(75),
apellido varchar(75),
id_tipo_doc int
Constraint fk_cli_documentos foreign key (id_tipo_doc)
references documentos (id_tipo_doc),
nro_doc varchar(7),
id_barrio int
Constraint fk_cli_barrios foreign key (id_barrio)
references barrios (id_barrio), --Left join
nro_calle varchar(6),
calle varchar(50)
)


create table vendedores
(legajo_vendedor int identity(1,1)
Constraint pk_vendedores primary key (legajo_vendedor),
nombre varchar(75),
apellido varchar(75),
id_tipo_doc int
Constraint fk_ven_documentos foreign key (id_tipo_doc)
references documentos (id_tipo_doc),
nro_doc varchar(7),
id_barrio int
Constraint fk_ven_barrios foreign key (id_barrio)
references barrios (id_barrio),
nro_calle varchar(7),
calle varchar(50),
fecha_nac smalldatetime,
fecha_ingreso smalldatetime
)


create table contactos
(id_contacto int identity(1,1)
Constraint pk_contactos primary key (id_contacto),
contacto varchar(50),
id_tipo_contacto int
Constraint fk_con_tipos_contactos foreign key (id_tipo_contacto)
references tipos_contactos (id_tipo_contacto),
legajo_vendedor int
Constraint fk_con_vendedores foreign key (legajo_vendedor)
references vendedores (legajo_vendedor),
id_cliente int
Constraint fk_con_clientes foreign key (id_cliente)
references clientes (id_cliente)
)


create table facturas
(nro_factura int identity(1,1)
Constraint pk_facturas primary key (nro_factura),
fecha smalldatetime,
id_cliente int
Constraint fk_fac_clientes foreign key (id_cliente)
references clientes (id_cliente),
legajo_vendedor int
Constraint fk_fac_vendedores foreign key (legajo_vendedor)
references vendedores (legajo_vendedor),
cod_forma_envio int
Constraint fk_fac_formas_envio foreign key (cod_forma_envio)
references formas_envio (cod_forma_envio),
id_tipo_venta int
Constraint fk_fac_tipos_venta foreign key (id_tipo_venta)
references tipos_venta (id_tipo_venta)
)


create table facturas_forma_pago
(id_fact_forma_pago int identity(1,1)
Constraint pk_facturas_forma_pago primary key (id_fact_forma_pago),
nro_factura int
Constraint fk_facf_facturas foreign key (nro_factura)
references facturas (nro_factura),
cod_forma_pago int,
Constraint fk_facf_formas_pago foreign key (cod_forma_pago)
references formas_pago (cod_forma_pago)
)


create table detalles
(id_detalle int identity(1,1)
Constraint pk_detalles primary key (id_detalle),
nro_factura int
Constraint fk_det_facturas foreign key (nro_factura)
references facturas (nro_factura),
cod_producto int
Constraint fk_det_productos foreign key (cod_producto)
references productos (cod_producto),
precio decimal,
cantidad int
)



-- Consultas para la segunda parte del TP integrador.

-- Consulta que entrega las localidades en sus respectivas provincias que tienen más clientes (En caso de que quiera poner una sucursal, la provincia y localidad con mayor compra será la más viable)

select p.provincia+', '+l.localidad Localidad, COUNT(c.id_barrio) Cantidad
from    provincias p inner join
        localidades l on p.id_provincia = l.id_provincia
        inner join barrios b on l.id_localidad = b.id_localidad
        inner join clientes c on b.id_barrio = c.id_barrio
group by provincia, localidad
order by Localidad desc


-- Consulta que entrega los vendedores que vendieron más (En caso de un puesto de gerente o aumento será tomado en cuenta esto)

select v.legajo_vendedor Legajo, count(f.legajo_vendedor) Cantidad, sum(d.precio*cantidad) as 'Dinero Recaudado'
from    vendedores v
        inner join facturas f on v.legajo_vendedor = f.legajo_vendedor
        inner join detalles d on f.nro_factura = d.nro_factura
        inner join productos p on d.cod_producto = p.cod_producto
group by v.legajo_vendedor
order by [Dinero Recaudado] desc


select v.apellido+', '+v.nombre Vendedor, count(f.legajo_vendedor) Cantidad, sum(d.precio*cantidad) as 'Dinero Recaudado'
from    vendedores v
        inner join facturas f on v.legajo_vendedor = f.legajo_vendedor
        inner join detalles d on f.nro_factura = d.nro_factura
        inner join productos p on d.cod_producto = p.cod_producto
group by v.apellido, v.nombre
order by [Dinero Recaudado] desc




-- Consulta que entrega cantidad de  clientes, nombre y apellido que compraron en el año 2020, ordenados alfabéticamente (en forma descendente) por apellido. Se muestra en dos tablas distintas.. 
 --(en el caso que se desee consultar  los clientes que compraron en el 2020 para realizar encuestas de satisfacción, programas de fidelización, comparativos con años anteriores, etc ) 

select count(c.id_cliente) Cantidad
from    facturas f, clientes c
where    c.id_cliente=f.id_cliente and
        year(f.fecha) = 2020

select c.id_cliente, c.nombre+', '+c.apellido as 'Clientes 2020'
from    facturas f, clientes c
where    c.id_cliente=f.id_cliente and
        year(f.fecha) = 2020
order by apellido asc, nombre




-- Consulta que entrega los tipos de contactos más utilizados por los clientes

select count(tc.id_tipo_contacto) Cantidad, tc.tipo_contacto
from    tipos_contactos tc
        inner join contactos c on tc.id_tipo_contacto = c.id_tipo_contacto
group by tc.tipo_contacto
order by Cantidad desc




-- Consulta que entrega las formas de pago más utilizadas

select count(fp.cod_forma_pago) Cantidad, fp.forma_pago
from    formas_pago fp
        inner join facturas_forma_pago ffp on fp.cod_forma_pago = ffp.cod_forma_pago
group by fp.forma_pago
order by Cantidad desc


-- Consulta que entrega los productos que compraron los clientes con su respectivo precio

select c.nombre+', '+c.apellido 'Nombre Cliente', f.nro_factura, p.descripcion, p.precio
from clientes c
join facturas f on c.id_cliente= f.id_cliente
join detalles d on f.nro_factura = d.nro_factura
join productos p on d.cod_producto = p.cod_producto




-- Consulta que entrega los productos que hay en stock

select descripcion Producto, nombre Estilo, Stock
from productos
where stock is not null or stock > 0
order by Producto, Estilo


-- Consulta que entrega los nombres y apellidos de  clientes que tengan como tipo de contacto e-mail, ordenado alfabéticamente  por Apellido y nombre de manera ascendente     ( esto nos sirve para la digitalización y envío de factura electrónica)

select    cl.nombre+', '+cl.apellido 'Nombre Cliente', tc.tipo_contacto, c.contacto
from    tipos_contactos tc
        inner join contactos c on tc.id_tipo_contacto = c.id_tipo_contacto
        inner join clientes cl on c.id_cliente = cl.id_cliente
where lower(tc.tipo_contacto) = 'e-mail'
order by apellido asc, nombre


--Consulta que entrega un reporte con los datos de la facturación, incluido el nombre del vendedor, sólo de las ventas mayoristas (incluido el importe y su descuento)

select    f.nro_factura, f.fecha, v.nombre+', '+v.apellido Vendedor, df.precio, df.cantidad, p.descripcion,df.cantidad * df.precio Subtotal,(df.cantidad * df.precio)*0.2 Descuento,(df.cantidad * df.precio)*0.8 Total, tv.tipo_venta
from     facturas f join vendedores v on f.legajo_vendedor = v.legajo_vendedor
join detalles df on df.nro_factura = f.nro_factura
join productos p on df.cod_producto = p.cod_producto
join tipos_venta tv on tv.id_tipo_venta = f.id_tipo_venta
where    tv.tipo_venta='Mayorista'


-- Consulta que entrega los contactos de los clientes que hace más de 1 año que no compran productos o aquellos que nunca realizaron una compra. (Esta información es útil para enviarles ofertas de productos)
 
select     c.id_cliente, c.nombre+', '+c.apellido Clientes, f.fecha 'Fecha de última compra', co.contacto
from     clientes c join contactos co on c.id_cliente = co.id_cliente left join facturas f on f.id_cliente = c.id_cliente
where     datediff(year,f.fecha,getdate())>1 or f.nro_factura is null
order by   f.fecha desc

-- Inserto de registros.

-- Visualizacion de las tablas

select * from detalles
select * from clientes
select * from vendedores
select * from facturas
select * from facturas_forma_pago
select * from barrios
select * from provincias
select * from localidades
select * from contactos
select * from tipos_contactos
select * from tipos_productos
select * from tipos_venta
select * from documentos
select * from productos
select * from formas_pago
select * from formas_envio


-- Insert de valores a las tablas en otro query


--PROVINCIAS
INSERT INTO PROVINCIAS (provincia) VALUES('CORDOBA')
INSERT INTO PROVINCIAS (provincia) VALUES('BUENOS AIRES')
INSERT INTO PROVINCIAS (provincia) VALUES('CATAMARCA')
INSERT INTO PROVINCIAS (provincia) VALUES('CHACO')
INSERT INTO PROVINCIAS (provincia) VALUES('CHUBUT')
INSERT INTO PROVINCIAS (provincia) VALUES('JUJUY')
INSERT INTO PROVINCIAS (provincia) VALUES('CORRIENTES')
INSERT INTO PROVINCIAS (provincia) VALUES('ENTRE RIOS')
INSERT INTO PROVINCIAS (provincia) VALUES('FORMOSA')
INSERT INTO PROVINCIAS (provincia) VALUES('LA PAMPA')
INSERT INTO PROVINCIAS (provincia) VALUES('LA RIOJA')
INSERT INTO PROVINCIAS (provincia) VALUES('MENDOZA')
INSERT INTO PROVINCIAS (provincia) VALUES('MISIONES')
INSERT INTO PROVINCIAS (provincia) VALUES('NEUQUEN')
INSERT INTO PROVINCIAS (provincia) VALUES('RIO NEGRO')
INSERT INTO PROVINCIAS (provincia) VALUES('SALTA')
INSERT INTO PROVINCIAS (provincia) VALUES('SAN JUAN')
INSERT INTO PROVINCIAS (provincia) VALUES('SAN LUIS')
INSERT INTO PROVINCIAS (provincia) VALUES('SANTA CRUZ')
INSERT INTO PROVINCIAS (provincia) VALUES('SANTA FE')
INSERT INTO PROVINCIAS (provincia) VALUES('SANTIAGO DEL ESTERO')
INSERT INTO PROVINCIAS (provincia) VALUES('TIERRA DEL FUEGO')
INSERT INTO PROVINCIAS (provincia) VALUES('TUCUMAN')


--LOCALIDADES
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CORDOBA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CARLOS PAZ',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('ADELIA MARIA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('ALTA GRACIA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('AGUA DE ORO',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('AGUA DEL TALA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('AGUA PINTADA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('ALEJANDRO ROCA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('ARIAS',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('ARROYO CABRAL',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('ARROYO LA HIGUERA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('ASCOCHINGA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('BAJO DE FERNANDEZ',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('BAJO DEL CARMEN',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('BAJO GRANDE',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('BAJO HONDO',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('BAJO LINDO',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('BARRIO DEAN FUNES',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('BARRIO LA FERIA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('BO FLORES GUARNICION AEREA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CAJON DEL RIO',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CALASUYA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CAMPO BANDILLO',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CAMPO LOS ZORROS',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CANDELARIA SUR',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CAPILLA DE SITON',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CAPILLA LA ESPERANZA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CASAS VEJAS',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CASEROS ESTE',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CAÑADA DE CUEVAS',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CAÑADA DEL TALA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CAÑADA VERDE',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CERRO PELADO',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CHARACATO',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CHAÑARIACO',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CHIPITIN',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CHUA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('CHURQUI CAÑADA',1)
INSERT INTO LOCALIDADES (localidad, id_provincia) VALUES('COLAZO',1)

Select l.localidad,p.provincia from localidades l, provincias p
where l.id_provincia = p.id_provincia

--BARRIOS
INSERT INTO BARRIOS(barrio, id_localidad) VALUES ('CENTRO',1)
INSERT INTO BARRIOS(barrio, id_localidad) VALUES ('ALTO ALBERDI',1)
INSERT INTO BARRIOS(barrio, id_localidad) VALUES ('OBSERVATORIO',1)
INSERT INTO BARRIOS(barrio, id_localidad) VALUES ('JARDIN',1)
INSERT INTO BARRIOS(barrio, id_localidad) VALUES ('GENERAL PAZ',1)
INSERT INTO BARRIOS(barrio, id_localidad) VALUES ('PUEYRREDON',1)
INSERT INTO BARRIOS(barrio, id_localidad) VALUES ('PARQUE HORIZONTE',1)
INSERT INTO BARRIOS(barrio, id_localidad) VALUES ('SAN MARTIN',1)
INSERT INTO BARRIOS(barrio, id_localidad) VALUES ('SAN VICENTE',1)
INSERT INTO BARRIOS(barrio, id_localidad) VALUES ('JUNIOR',1)
INSERT INTO BARRIOS(barrio, id_localidad) VALUES ('MAIPU',1)
INSERT INTO BARRIOS(barrio, id_localidad) VALUES ('PANAMERICANO',1)


select barrio,localidad,provincia
from barrios b, localidades l, provincias p
where    b.id_localidad = l.id_localidad and
        l.id_provincia = p.id_provincia


--Tipos de productos
INSERT INTO tipos_productos(tipo_producto) values('Mesa')
INSERT INTO tipos_productos(tipo_producto) values('Placard')
INSERT INTO tipos_productos(tipo_producto) values('Silla')
INSERT INTO tipos_productos(tipo_producto) values('Cama')
INSERT INTO tipos_productos(tipo_producto) values('Escritorio')
INSERT INTO tipos_productos(tipo_producto) values('Biblioteca')
INSERT INTO tipos_productos(tipo_producto) values('Futón')
INSERT INTO tipos_productos(tipo_producto) values('Cómoda')
INSERT INTO tipos_productos(tipo_producto) values('Mesa de luz')
INSERT INTO tipos_productos(tipo_producto) values('Vajillero')


--productos
INSERT INTO productos(cod_tipo_producto,descripcion,nombre,precio,stock) values(1,'Mesa Comedor 110x85x80','Milano',83892.50,150)
INSERT INTO productos(cod_tipo_producto,descripcion,nombre,precio,stock) values(1,'Mesa Cocina 60x100','Nórdico',6599.99,170)
INSERT INTO productos(cod_tipo_producto,descripcion,nombre,precio,stock) values(2,'Placard puertas corredizas 1.50','Verona',15980.50,120)
INSERT INTO productos(cod_tipo_producto,descripcion,nombre,precio,stock) values(3,'Silla Comedor Pino','Milano',2513.90,243)
INSERT INTO productos(cod_tipo_producto,descripcion,nombre,precio,stock) values(3,'Silla Comedor Paraiso','Americana',3290.00,230)
INSERT INTO productos(cod_tipo_producto,descripcion,nombre,precio,stock) values(3,'Silla Comedor','Nórdico',6900.00,200)
INSERT INTO productos(cod_tipo_producto,descripcion,nombre,precio,stock) values(4,'Cama 2 plazas Pino','Milano',17186.00,130)
INSERT INTO productos(cod_tipo_producto,descripcion,nombre,precio,stock) values(4,'Cama con Cajonera 2 plazas','Nordico',24500.00,82)
INSERT INTO productos(cod_tipo_producto,descripcion,nombre,precio,stock) values(5,'Escritorio de Melamina y multilaminado Guatambu','Burano',9200.50,300)
INSERT INTO productos(cod_tipo_producto,descripcion,nombre,precio,stock) values(5,'Escritorio estilo vintage','Nórdico',12360.50,260)



--formas envío
INSERT INTO formas_envio(nombre_forma_envio) values('Correo Argentino')
INSERT INTO formas_envio(nombre_forma_envio) values('OCA')
INSERT INTO formas_envio(nombre_forma_envio) values('Andreani')
INSERT INTO formas_envio(nombre_forma_envio) values('Buspack')
INSERT INTO formas_envio(nombre_forma_envio) values('Urbano')
INSERT INTO formas_envio(nombre_forma_envio) values('Flete')
INSERT INTO formas_envio(nombre_forma_envio) values('Mercado envíos')



--Formas pago
INSERT INTO FORMAS_PAGO (forma_pago) VALUES('EFECTIVO')
INSERT INTO FORMAS_PAGO (forma_pago) VALUES('CON CHEQUE')
INSERT INTO FORMAS_PAGO (forma_pago) VALUES('TARJETA CREDITO')
INSERT INTO FORMAS_PAGO (forma_pago) VALUES('TARJETA DEBITO')
INSERT INTO FORMAS_PAGO (forma_pago) VALUES('CUENTA CORRIENTE')
INSERT INTO formas_pago(forma_pago) values('TRANFERENCIA')
INSERT INTO formas_pago(forma_pago) values('PAYPAL')
INSERT INTO formas_pago(forma_pago) values('MONDEDERO ELECTRÓNICO')
INSERT INTO formas_pago(forma_pago) values('MONEDA VIRTUAL')
INSERT INTO formas_pago(forma_pago) values('CoDi')


--tipos venta
INSERT INTO tipos_venta(tipo_venta,descuento) values('Minorista','0%')
INSERT INTO tipos_venta(tipo_venta,descuento) values('Mayorista','20%')



--documento
INSERT INTO documentos(tipo_doc) values('DNI/DU')
INSERT INTO documentos(tipo_doc) values('Cedula Federal')
INSERT INTO documentos(tipo_doc) values('Pasaporte')
INSERT INTO documentos(tipo_doc) values('Pasaporte Extrangero')




--tipos contactos
INSERT INTO tipos_contactos(tipo_contacto) values('Celular')
INSERT INTO tipos_contactos(tipo_contacto) values('E-mail')
INSERT INTO tipos_contactos(tipo_contacto) values('Instagram')
INSERT INTO tipos_contactos(tipo_contacto) values('Twitter')
INSERT INTO tipos_contactos(tipo_contacto) values('Linkedin')
INSERT INTO tipos_contactos(tipo_contacto) values('Facebook')
INSERT INTO tipos_contactos(tipo_contacto) values('Fijo')




--clientes
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('ALONSO','CLAUDIO', 'Sarmiento', 1200, 3, 4433223, 2);
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('ALVAREZ','MARCELO', 'San Juan', 550, 7, 2112122, 1);
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('ALVAREZ','CRISTINA', 'San Roque', 425, 9, 22121112, 3);
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('ALVAREZ','CLAUDIO', 'Roure', 900, 4, 987654, 1);
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('CAMPOS','RAUL', 'San Martin', 850, 7, 3456234, 1);
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('DURAN','CARLA', 'Belgrano', 850,3, 3467834, 1);
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('PEREZ','MARIA', 'Monserrat', 850,6, 148625, 1);
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('ZAMORA','CARLOS LUIS', 'Manantiales', 850,7, 4865565, 1);
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('PEREZ','ANA', 'Avellaneda', 850,1, 8462451, 1);
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('PEREA','LUIS M.', 'Don Bosco', 850,6, 75625855, 1);
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('PONCE','CARMELO', 'Colon', 850,4, 234565432, 2);
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('GALES','JULIA', 'Colon', 850,4, 74565545, 2);
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('SUAREZ','PAOLA', 'Colon', 850,4, 85555455, 3);
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('MARANINI','JOSE', 'Colon', 850,4, 238955432, 2);
INSERT INTO CLIENTES (APELLIDO, NOMBRE, calle,nro_calle,id_barrio, nro_doc,id_tipo_doc) VALUES ('FONCECA','BERTA', 'Alverdi', 850,2, 4785565, 3);

select * from vendedores

--vendedores

set dateformat dmy

INSERT into vendedores (nombre,apellido,calle,nro_calle,id_barrio,fecha_nac,fecha_ingreso,id_tipo_doc,nro_doc) values ('AYELÉN','ALLENDE','25 de Mayo',915,5,'22/11/1989','10/05/2015',1,34587842);
INSERT into vendedores (nombre,apellido,calle,nro_calle,id_barrio,fecha_nac,fecha_ingreso,id_tipo_doc,nro_doc) values ('MARIELA','LUPO','Gral.Alvear',297,1,'15/3/1979','17/11/2016',1,28578412);
INSERT into vendedores (nombre,apellido,calle,nro_calle,id_barrio,fecha_nac,fecha_ingreso,id_tipo_doc,nro_doc) values ('MARTÍN','TORRES','Santa Rosa',153,1,'11/11/1988','01/10/2016',1,33645785);
INSERT into vendedores (nombre,apellido,calle,nro_calle,id_barrio,fecha_nac,fecha_ingreso,id_tipo_doc,nro_doc) values ('FLORENCIA','LUQUE','Ricchieri',3226,4,'05/03/1986','01/06/2013',1,32957187);
INSERT into vendedores (nombre,apellido,calle,nro_calle,id_barrio,fecha_nac,fecha_ingreso,id_tipo_doc,nro_doc) values ('JUAN','RODRIGUEZ','La Rioja',2401,6,'06/3/1975','05/07/2013',1,2784124);
INSERT into vendedores (nombre,apellido,calle,nro_calle,id_barrio,fecha_nac,fecha_ingreso,id_tipo_doc,nro_doc) values ('MARCOS','CARRIZO','Colombres',976,8,'25/01/1979','13/06/2017',1,29304215);
INSERT into vendedores (nombre,apellido,calle,nro_calle,id_barrio,fecha_nac,fecha_ingreso,id_tipo_doc,nro_doc) values ('LETICIA','MIRANDA','Obispo Clara',380,8,'30/07/1983','05/04/2018',1,30547812);
INSERT into vendedores (nombre,apellido,calle,nro_calle,id_barrio,fecha_nac,fecha_ingreso,id_tipo_doc,nro_doc) values ('SILVIA','JUAREZ','Murcia',1884,11,'27/12/1984','10/05/2018',1,30997245);
INSERT into vendedores (nombre,apellido,calle,nro_calle,id_barrio,fecha_nac,fecha_ingreso,id_tipo_doc,nro_doc) values ('ESTEBAN','PEREZ','Málaga',1891,11,'14/08/1985','15/07/2018',1,31547124);
INSERT into vendedores (nombre,apellido,calle,nro_calle,id_barrio,fecha_nac,fecha_ingreso,id_tipo_doc,nro_doc) values ('SEBASTIAN','LEDESMA','Ovidio Lagos',78,5,'09/02/1985','01/06/2017',1,31247847);



--contactos
insert into contactos (contacto,id_tipo_contacto,id_cliente,legajo_vendedor) values('154784247',1,15,null);
insert into contactos (contacto,id_tipo_contacto,id_cliente,legajo_vendedor) values('lupom@gmail.com',2,null,2);
insert into contactos (contacto,id_tipo_contacto,id_cliente,legajo_vendedor) values('@cris.alvarez',3,9,null);
insert into contactos (contacto,id_tipo_contacto,id_cliente,legajo_vendedor) values('@m.alvarez',4,2,null);
insert into contactos (contacto,id_tipo_contacto,id_cliente,legajo_vendedor) values('158479254',1,null,5);
insert into contactos (contacto,id_tipo_contacto,id_cliente,legajo_vendedor) values('j.gales@hotmail.com',2,12,null);
insert into contactos (contacto,id_tipo_contacto,id_cliente,legajo_vendedor) values('4579821',7,null,7);
insert into contactos (contacto,id_tipo_contacto,id_cliente,legajo_vendedor) values('155248475',1,null,3);
insert into contactos (contacto,id_tipo_contacto,id_cliente,legajo_vendedor) values('rcampos@gmail.com',2,5,null);
insert into contactos (contacto,id_tipo_contacto,id_cliente,legajo_vendedor) values('156123421',1,null,8);





--facturas

set dateformat dmy

insert into facturas(fecha,cod_forma_envio,id_tipo_venta,id_cliente,legajo_vendedor) values('16/12/2018',7,1,7,2)
insert into facturas(fecha,cod_forma_envio,id_tipo_venta,id_cliente,legajo_vendedor) values('26/06/2020',6,2,8,3)
insert into facturas(fecha,cod_forma_envio,id_tipo_venta,id_cliente,legajo_vendedor) values('18/02/2021',5,1,9,4)
insert into facturas(fecha,cod_forma_envio,id_tipo_venta,id_cliente,legajo_vendedor) values('13/09/2015',4,2,2,5)
insert into facturas(fecha,cod_forma_envio,id_tipo_venta,id_cliente,legajo_vendedor) values('19/03/2019',3,1,1,6)
insert into facturas(fecha,cod_forma_envio,id_tipo_venta,id_cliente,legajo_vendedor) values('09/10/2020',2,2,2,7)
insert into facturas(fecha,cod_forma_envio,id_tipo_venta,id_cliente,legajo_vendedor) values('03/10/2021',1,1,10,5)
insert into facturas(fecha,cod_forma_envio,id_tipo_venta,id_cliente,legajo_vendedor) values('29/07/2015',4,2,7,2)
insert into facturas(fecha,cod_forma_envio,id_tipo_venta,id_cliente,legajo_vendedor) values('07/08/2016',1,1,1,7)
insert into facturas(fecha,cod_forma_envio,id_tipo_venta,id_cliente,legajo_vendedor) values('31/12/2020',7,2,4,9)

select *
from    facturas f
        inner join formas_envio fe on f.cod_forma_envio = fe.cod_forma_envio
        inner join tipos_venta tv on f.id_tipo_venta = tv.id_tipo_venta
        inner join clientes c on f.id_cliente = c.id_cliente
        inner join vendedores v on f.legajo_vendedor = v.legajo_vendedor


--facturas_forma_pago
insert into facturas_forma_pago(nro_factura,cod_forma_pago) values(1,1)
insert into facturas_forma_pago(nro_factura,cod_forma_pago) values(2,2)
insert into facturas_forma_pago(nro_factura,cod_forma_pago) values(4,3)
insert into facturas_forma_pago(nro_factura,cod_forma_pago) values(5,4)
insert into facturas_forma_pago(nro_factura,cod_forma_pago) values(6,5)
insert into facturas_forma_pago(nro_factura,cod_forma_pago) values(7,6)
insert into facturas_forma_pago(nro_factura,cod_forma_pago) values(8,7)
insert into facturas_forma_pago(nro_factura,cod_forma_pago) values(9,8)
insert into facturas_forma_pago(nro_factura,cod_forma_pago) values(3,9)
insert into facturas_forma_pago(nro_factura,cod_forma_pago) values(10,10)




select *
from    facturas_forma_pago ffp
        inner join facturas f on ffp.nro_factura = f.nro_factura
        inner join formas_pago fp on ffp.cod_forma_pago = fp.cod_forma_pago


--detalles
insert into detalles(nro_factura,cod_producto,precio,cantidad) values(2,1,5480.00,30)
insert into detalles(nro_factura,cod_producto,precio,cantidad) values(3,2,3590.00,23)
insert into detalles(nro_factura,cod_producto,precio,cantidad) values(4,3,10980.00,3)
insert into detalles(nro_factura,cod_producto,precio,cantidad) values(5,4,1580.00,4)
insert into detalles(nro_factura,cod_producto,precio,cantidad) values(6,5,2290.00,45)
insert into detalles(nro_factura,cod_producto,precio,cantidad) values(7,6,4500.00,2)
insert into detalles(nro_factura,cod_producto,precio,cantidad) values(8,7,12570.00,1)
insert into detalles(nro_factura,cod_producto,precio,cantidad) values(9,8,15740.00,22)
insert into detalles(nro_factura,cod_producto,precio,cantidad) values(10,9,7250.00,11)
insert into detalles(nro_factura,cod_producto,precio,cantidad) values(1,10,6780.00,12)




select *
from    detalles d
        inner join productos p on d.cod_producto = p.cod_producto
        inner join facturas f on f.nro_factura = d.nro_factura

