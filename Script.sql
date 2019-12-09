use DB_Software
go
create table TblLogin(
PKUsuario varchar(11) primary key,
Contraseña varchar(20) not null,
FKId_TblCargo int not null,
FKId_TblEstado int not null,
FKDocumento_TblEmpleado varchar(11) not null
);

create table TblEstado(
PKId int identity(1,1) primary key,
Descripcion varchar(50) not null
)

create table TblCargo(
PKId int identity(1,1) primary key,
Descripcion varchar(50) not null
)

create table TblEmpleado(
PKDocumento varchar(11) primary key,
Nombre varchar(100),
Apellido varchar(100),
Telefono varchar(15),
Correo varchar(150),
FKId_TblEstado int not null
)

create table TblInventario(
PKId int identity(1,1) primary key,
FKCodigo_TblArticulo int not null,
Cantidad_Total int not null,
Fecha_Ingreso date
)

create table TblArticulo(
PKCodigo int identity(1,1) primary key,
Nombre_Articulo varchar(100) not null,
Num_ExistenciasMinimas int not null,
Ubicacion varchar(20) not null,
Referencia varchar(80) not null,
FKId_TblMarca int not null
)

create table TblMarca(
PKId int identity(1,1) primary key,
Descripcion varchar(50) not null
)

create table TblHistorialInventario(
PKId int identity(1,1)  primary key,
FKId_TblInventario int not null,
Cantidad_Ingreso int not null,
Cantidad_Salida int not null,
Fecha date,
Hora time,
FKUsuario_TblLogin varchar(11) not null
)

create table TblRegistroProductos(
Num_Factura varchar(30)  primary key,
Fecha_Factura date ,
FKCodigo_TblProveedor varchar(50) not null,
iva varchar(7) not null,
Flete varchar(7) not null,
Descuento varchar(7) not null,
FKCodigo_TblFormaDePago_Factura int not null,
FKCodigo_TblFormaDePago_Flete int not null,
FechaVencimientoFactura date
)

Create Table TblDet_TblRegistroProductos(
PKCodigo int identity(1,1) primary key,
FKNum_Factura_TblRegistroProductos varchar(30) not null,
FKCodigo_TblArticulo int not null,
Cantidad int not null,
Valor_unitario money not null,
Valor_Total money not null,
Precio_Publico money not null,
Utilidad varchar(7) not null
)

create table TblFormaDePago(
PKId int identity(1,1) primary key,
Descripcion varchar(50) not null
)

create table TblProveedor(
PKCodigo varchar(50) primary key,
Nombre varchar(100),
Telefono varchar(15),
Correo varchar(150),
Direccion varchar(60),
Ciudad varchar(50)
)

--RELACIONES--

--Log in
alter table TblLogin
add constraint FKId_TblCargo
foreign key (FKId_TblCargo) references TblCargo

alter table TblLogin
add constraint FKId_TblEstado
foreign key (FKId_TblEstado) references TblEstado

alter table TblLogin
add constraint FKDocumento_TblEmpleado
foreign key (FKDocumento_TblEmpleado) references TblEmpleado

--Empleado
alter table TblEmpleado
add constraint FKId_TblEstado1
foreign key (FKId_TblEstado) references TblEstado

--Inventario
alter table TblInventario
add constraint FKCodigo_TblArticulo
foreign key (FKCodigo_TblArticulo) references TblArticulo

--Articulo
alter table TblArticulo
add constraint FKId_TblMarca
foreign key (FKId_TblMarca) references TblMarca

--Historial del Inventario
alter table TblHistorialInventario
add constraint FKId_TblInventario
foreign key (FKId_TblInventario) references TblInventario

alter table TblHistorialInventario
add constraint FKUsuario_TblLogin
foreign key (FKUsuario_TblLogin) references TblLogin

--Registro de productos
alter table TblRegistroProductos
add constraint FKCodigo_TblProveedor
foreign key (FKCodigo_TblProveedor) references TblProveedor

alter table TblRegistroProductos
add constraint FKCodigo_TblFormaDePago_Factura
foreign key (FKCodigo_TblFormaDePago_Factura) references TblFormaDePago

alter table TblRegistroProductos
add constraint FKCodigo_TblFormaDePago_Flete
foreign key (FKCodigo_TblFormaDePago_Flete) references TblFormaDePago

--Detalle de registro de productos
alter table TblDet_TblRegistroProductos
add constraint FKNum_Factura_TblRegistroProductos
foreign key (FKNum_Factura_TblRegistroProductos) references TblRegistroProductos

alter table TblDet_TblRegistroProductos
add constraint FKCodigo_TblArticulo1
foreign key (FKCodigo_TblArticulo) references TblArticulo


--INSERCIÓN DE ALGUNAS TABLAS DEBILES--
insert into TblEstado(Descripcion) values('Activo'),('Inactivo');
insert into TblCargo(Descripcion) values('Administrador'),('Estandar');
insert into  TblFormaDePago(Descripcion) values ('Contado'),('Credito');
insert into TblMarca(Descripcion) values('Yamaha'),('Honda'),('Suzuki');

