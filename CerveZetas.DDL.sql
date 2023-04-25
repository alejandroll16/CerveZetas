/*CERVEZETAS*/




create table CerveZetas_Marca(
    codigo number(5) primary key,
    nombre varchar2(20)
);

create table CerveZetas_Usuario(
    email varchar2(20) primary key,
    nombre varchar(30),
    apellidos varchar(30),
    contrasena varchar2(20),
    telefono number(9),
    ultima_conexion date,
    fecha_nacimiento date,
    foto varchar2(200),
    tipo_usuarios varchar2(20) not null,
    metodo_pago varchar2(20),

    CHECK (tipo_usuarios in('Cliente', 'Admin', 'Visitante')),
    CHECK (metodo_pago in ('PayPal', 'Tarjeta', 'Moneda Virtual'))


);


create table CerveZetas_Producto(
    cod_producto number(20) primary key,
    stock number(4),
    descripcion varchar2(250),
    admin_crea varchar2(20),
    admin_modifica varchar2(20),
    fecha_mod date,
    fecha_creacion date,
    Categoria varchar2(20) not null,
    precio number(5,2) not null,
    TipoProducto varchar2(20) not null,

    CHECK (TipoProducto in('Pack_Eventual', 'Pack_Especial', 'Cubos', 'Cervezas')),
    CHECK (Categoria in('Rubia', 'Malta', 'Tostada')),

    constraint fk_Admin_crea foreign key (admin_crea) references CerveZetas_Usuario,
    constraint fk_Admin_mod foreign key (admin_modifica) references CerveZetas_Usuario

);




create table CerveZetas_Direccion(
    codigo_direccion number(10),
    email_usuario varchar2(20),
    numero number(3),
    Municipio varchar(20),
    CodigoPostal number(5),
    provincia varchar(20),
    tipoVia varchar2(30) not null,
    tipoDireccion varchar2(20) not null,
    nombre varchar2(30) not null,

    CHECK (tipoVia in('Calle', 'Avenida', 'Plaza')),
    CHECK (tipoDireccion in('Casa', 'Trabajo', 'Campo', 'Chalet')),
    

    constraint pk_cod_Direccion primary key (codigo_direccion, email_usuario),
    constraint fk_cliente_email foreign key (email_usuario) references CerveZetas_Usuario
    

);



create table CerveZetas_Pedido_Factura(
    cod_pedido number(10),
    num_factura number(10),
    fecha_factura date,
    direccion number(3) not null,
    email_cliente varchar2(20) not null,
    cliente varchar2(20) not null,
    precio_total number(7,2),
    

    constraint pk_pedido_factura primary key (cod_pedido, num_factura),
    constraint fk_CZ_facturas foreign key (direccion, email_cliente) references CerveZetas_Direccion,
    constraint fk_cliente_pedido foreign key (cliente) references CerveZetas_Usuario
);


create table CerveZetas_Pedido_Producto(
    cod_pedido number(10),
    num_factura number(10),
    producto number(20),
    precio number(7,2),
    cantidad number(3),

    constraint pk_pedido_producto primary key (cod_pedido, num_factura, producto),
    constraint fk_CZ_pedido foreign key (cod_pedido, num_factura) references CerveZetas_Pedido_factura,
    constraint fk_CZ_producto foreign key (producto) references CerveZetas_producto
);




alter table CerveZetas_Usuario add(
    constraint fecha_nac CHECK(fecha_nacimiento > TO_DATE('01/01/1900', 'DD/MM/YYYY'))
);

alter table CerveZetas_producto add (marca number(5));

alter table CerveZetas_producto add(
    constraint fk_CZ_marca foreign key (marca) references CerveZetas_Marca
);

drop table CerveZetas_Pedido_Producto;
drop table CerveZetas_Pedido_Factura;
drop table CerveZetas_Direccion;
drop table CerveZetas_Producto;
drop table CerveZetas_Marca;
drop table CerveZetas_Usuario;


