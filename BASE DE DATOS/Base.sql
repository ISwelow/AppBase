create database OXXO;

use OXXO;

drop database OXXO;

create table user_profiles (
    id tinyint not null auto_increment,
    profile_name varchar(20) not null unique,
    description varchar(100),
    status boolean default true,
    created_at datetime,
    updated_at datetime null,
    deleted_at datetime null,
    primary key(id)
);


create table users (
    id int not null auto_increment,
    username varchar(50) unique,
    password varchar(150),
    status boolean,
    profile_id tinyint not null,
    created_at datetime,
    updated_at datetime null,
    deleted_at datetime null,
    foreign key (profile_id) references user_profiles(id),
    primary key(id)
);


create table user_info (
    id int not null,
    first_name varchar(50),
    last_name varchar(80),
    birthday date null,
    gender char(1),
    age int not null,
    phone int(15) null,
    photo blob,
    status boolean default true,
    created_at datetime,
    updated_at datetime null,
    deleted_at datetime null,
    foreign key (id) references users(id),
    primary key(id)
);


create table products (
    id int not null auto_increment,
    idCategory int not null,
    image blob,
    products_name varchar(100),
    description text,
    price decimal(10, 2),
    stock int,
    created_at datetime,
    updated_at datetime null,
    deleted_at datetime null,
    foreign key (idCategory) references products_categories(id),
    primary key(id)
);

select * from products;

create table products_comments (
    id int not null auto_increment,
    user_id int not null,
    products_id int not null,
    comment_text text,
    created_at datetime,
    updated_at datetime null,
    deleted_at datetime null,
    primary key(id),
    foreign key (user_id) references users(id),
    foreign key (products_id) references products(id)
);

create table products_categories (
    id int not null auto_increment,
    name varchar(50) not null unique,
    description varchar(100),
    status boolean default true,
    created_at datetime,
    updated_at datetime null,
    deleted_at datetime null,
    primary key(id)
);


create table devolution (
	id int not null auto_increment,
	idCategory int not null,
	illustration blob,
	name varchar(30),
	description varchar(50),
	quantity int not null,
	tipe varchar(20),
	category varchar(30),
	price float not null,
	created_at datetime,
    updated_at datetime null,
    deleted_at datetime null,
	primary key (id)
);

drop table devolution ;

create table transactions (
    id int not null auto_increment,
    user_id int not null,
    products_id int not null,
    quantity int not null,
    total_amount decimal(8, 2) not null,
    transaction_date datetime not null,
    created_at datetime null,
    updated_at datetime null,
    deleted_at datetime null,
    foreign key (user_id) references users(id),
    foreign key (products_id) references products(id),
    primary key(id)
);





INSERT INTO user_profiles (id, profile_name, description,status , created_at)
values
    (1,'Administrador', 'Perfil de administrador del sistema',1,'2020/07/17'),
    (2,'Usuario', 'Perfil de usuario', 1,'2020/07/17');
   
   
INSERT INTO users (username, password, status, profile_id, created_at)
values
    ('Juanito', 'iguana23', 1, 1, '2020/07/17'),
    ('Mary', 'rosapastel', 1, 2, '2020/07/21'),
    ('Kike', 'chinodo', 0, 2, '2022/04/09'),
    ('Laura', 'coqui', 0, 2, '2021/03/13'),
    ('Pedro', 'pedrito23', 1, 2, '2020/11/12'),
    ('Anita', 'karolg', 0, 2, '2021/04/26'),
    ('Lalo', 'fuchalic', 1, 2, '2023/09/16'),
    ('Belle', 'carlos55', 1, 2, '2020/12/21'),
    ('Javy', 'menalu', 0, 2, '2021/03/17'),
    ('Sarita', 'tikkipla', 0, 2, '2022/03/02');


INSERT INTO user_info (id, first_name, last_name, birthday, gender, age, phone, photo, status, created_at)
values
    (1, 'Juan', 'Pérez', '1990-05-15', 'M', 33, 1234567890, 'https://img.freepik.com/fotos-premium/cierrese-encima-retrato-cara-feliz-sonriente-hombre-joven-caucasico-cerdas-fondo-gris-claro-aislado-estudio_8087-5198.jpg', 1, '2020/08/25'),
    (2, 'María', 'López', '1985-12-10', 'F', 38, 254587974, 'https://inmofotos.es/wp-content/uploads/2021/10/imagen-1_Mesa-de-trabajo-1.jpg', 1, '2021/06/01'),
    (3, 'Carlos', 'García', '1998-08-20', 'M', 25, 9876543210, 'https://img.freepik.com/foto-gratis/disparo-cabeza-hombre-atractivo-sonriendo-complacido-mirando-intrigado-pie-sobre-fondo-azul_1258-65468.jpg', 1, '2022/01/31'),
    (4, 'Laura', 'Martínez', '2000-03-25', 'F', 23, 5555555555, 'https://static.vecteezy.com/system/resources/thumbnails/030/340/951/small_2x/woman-watching-sunset-in-the-mountains-photo.jpg', 0, '2023/05/15'),
    (5, 'Pedro', 'Ramírez', '1995-11-05', 'M', 28, 459751687, 'https://img.freepik.com/foto-gratis/hombre-joven-guapo-nuevo-corte-pelo-estilo_176420-19637.jpg', 0, '2021/07/17'),
    (6, 'Ana', 'Sánchez', '1992-09-08', 'F', 31, 7777777777, 'https://img.freepik.com/foto-gratis/mujer-joven-guinando-ojo-sacando-lengua-tomando-selfie-contra-fondo-verde_23-2148178147.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699228800&semt=ais', 1, '2020/12/13'),
    (7, 'Eduardo', 'Hernández', '1988-06-30', 'M', 35, 9999999999, 'https://pixnio.com/free-images/2019/01/13/2019-01-13-09-51-02.jpg', 0, '2021/03/24'),
    (8, 'Isabel', 'Gómez', '2002-04-12', 'F', 21, 3333333333, 'https://www.cibanco.com/work/models/cibanco/Resource/1983/1/images/bnr-landing-personas-mob.jpg', 0, '2022/11/28'),
    (9, 'Javier', 'Torres', '1993-07-18', 'M', 30, 8888888888, 'https://img.freepik.com/foto-gratis/retrato-hombre-blanco-aislado_53876-40306.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699401600&semt=ais', 1, '2020/02/22'),
    (10, 'Sara', 'Fernández', '1997-02-03', 'F', 26, 4444444444, 'https://cdn.forbes.com.mx/2019/04/blackrrock-invertir-1-640x360.jpg', 1, '2023/06/21');

   

    INSERT INTO products (id, idCategory, image, products_name, description, price, stock, created_at)
values
    (1, 1, 'https://m.media-amazon.com/images/I/716KLGbqGjL._AC_SL1500_.jpg', 'Refresco Coca-Cola', 'Lata de 355ml', 12.50, 100, '2023-01-01'),
    (2, 2, 'https://m.media-amazon.com/images/I/41CD8RpcxcL._AC_.jpg', 'Papas Sabritas', 'Bolsa de 150g', 8.99, 150, '2023-01-02'),
    (3, 4, 'https://m.media-amazon.com/images/I/712J6P8xnFL._AC_SL1000_.jpg', 'Pañuelos Kleenex', 'Caja de 100 unidades', 5.75, 200, '2023-01-03'),
    (4, 7, 'https://m.media-amazon.com/images/I/612wYfDwnDL._AC_SL1080_.jpg', 'Cartas', 'Pokémon', 15.99, 50, '2023-01-04'),
    (5, 10, 'https://m.media-amazon.com/images/I/810RcnJ5KVL._AC_SL1500_.jpg', 'Arroz Blanco', 'Paquete de 1kg', 2.99, 100, '2023-02-17'),
    (6, 10, 'https://m.media-amazon.com/images/I/71GdxmewyOL._AC_SL1000_.jpg', 'Frijoles Negros', 'Bolsa de 900g', 1.99, 120, '2023-02-18'),
    (7, 10, 'https://m.media-amazon.com/images/I/71sCLTFsfuL._AC_SL1500_.jpg', 'Salsa de Tomate', 'Frascos de 500ml', 3.49, 80, '2023-02-19'),
    (8, 10, 'https://m.media-amazon.com/images/I/41BMj51VCdL._AC_SL1000_.jpg', 'Aceite de Oliva', 'Botella de 250ml', 5.75, 90, '2023-02-20'),
    (9, 10, 'https://m.media-amazon.com/images/I/51Kmr6hI+dL._AC_SL1000_.jpg', 'Azúcar Blanca', 'Paquete de 1kg', 3.99, 80, '2023-02-22'),
    (10, 10, 'https://m.media-amazon.com/images/I/61dRFYoefML._AC_SL1500_.jpg', 'Pasta Espagueti', 'Paquete de 500g', 1.25, 150, '2023-02-21');

select * from products ;
   
 
INSERT INTO products_comments (id, user_id, products_id, comment_text, created_at)
values
    (1, 1, 1, 'Me encanta este refresco, siempre fresco en OXXO.', '2023-03-01 08:15:00'),
    (2, 2, 3, 'El papel higiénico de OXXO es de buena calidad.', '2023-03-02 09:30:00'),
    (3, 3, 7, 'Las joyas en OXXO son hermosas y asequibles.', '2023-03-03 10:45:00'),
    (4, 4, 6, 'La linterna LED es muy útil para acampar. Gracias, OXXO.', '2023-03-04 12:00:00'),
    (5, 5, 8, 'El café instantáneo de OXXO es mi favorito, excelente sabor.', '2023-03-05 13:15:00'),
    (6, 1, 5, 'Siempre encuentro cuadernos de calidad en OXXO.', '2023-03-06 14:30:00'),
    (7, 2, 2, 'Las papas Sabritas son mi snack favorito, ¡gracias OXXO!', '2023-03-07 15:45:00'),
    (8, 3, 9, 'Las gafas futuristas son geniales, ¡las recomiendo!', '2023-03-08 17:00:00'),
    (9, 4, 10, 'La máscara de vaca es muy divertida, ¡gracias OXXO!', '2023-03-09 18:15:00'),
    (10, 5, 4, 'El juguete de peluche es perfecto para regalar.', '2023-03-10 19:30:00');
select * from products_comments ;
    

   
INSERT INTO products_categories (id, name, description, created_at)
VALUES
    (1, 'Bebidas', 'Refrescos, aguas y bebidas energéticas', '2023-04-01'),
    (2, 'Snacks', 'Chips, galletas y aperitivos', '2023-04-02'),
    (3, 'Productos de Baño', 'Papel higiénico, jabones y productos de aseo', '2023-04-03'),
    (4, 'Juguetes', 'Peluches, juguetes para niños', '2023-04-04'),
    (5, 'Artículos de Oficina', 'Cuadernos, lápices y material de oficina', '2023-04-05'),
    (6, 'Artículos de Camping', 'Linternas, tiendas de campaña', '2023-04-06'),
    (7, 'Juegos', 'Cartas personalizadas de Pokemon', '2023-04-07'),
    (8, 'Productos de Desayuno', 'Café, cereales y galletas', '2023-04-08'),
    (9, 'Electrónicos', 'Relojes, lentes de sol y dispositivos electrónicos pequeños', '2023-04-09'),
    (10, 'Artículos de casa', 'Consumibles para el hogar', '2023-04-10');
select * from products_categories ;
   delete from products_categories;


	INSERT INTO devolution (id, idCategory, illustration, name, description, quantity, tipe, category, price, created_at) 
VALUES 
	(1, 1, 'https://m.media-amazon.com/images/I/716KLGbqGjL._AC_SL1500_.jpg', 'Refresco Coca-Cola', 'Lata de 355ml', 50, 'Bebidas', 'Bebidas', 12.5, '2020/04/01'),
	(2, 2, 'https://m.media-amazon.com/images/I/41CD8RpcxcL._AC_.jpg', 'Paquete de Papas', 'Bolsa de 150g', 100, 'Snacks', 'Alimentos', 8.99, '2020/04/02'),
	(3, 3, 'https://m.media-amazon.com/images/I/712J6P8xnFL._AC_SL1000_.jpg', 'Paquete de Pañuelos', 'Caja de 100 unidades', 30, 'Higiene', 'Higiene', 5.75, '2020/04/03'),
	(4, 4, 'https://m.media-amazon.com/images/I/91YpOJ3xs4L._AC_SL1500_.jpg', 'Juguete de Peluche', 'Lucario chiquito', 20, 'Juguetes', 'Juguetes', 15.99, '2020/04/04'),
	(5, 5, 'https://m.media-amazon.com/images/I/61OHHQ6Z8hL._AC_SL1200_.jpg', 'Libreta Escolar', '80 hojas, cuadriculada', 40, 'Material Escolar', 'Oficina', 4.5, '2020/04/05'),
	(6, 6, 'https://m.media-amazon.com/images/I/61wgqBghnFL._AC_SL1000_.jpg', 'Linterna LED', 'Recargable, 800 lúmenes', 15, 'Herramientas', 'Electrónicos', 29.99, '2020/04/06'),
	(7, 7, 'https://m.media-amazon.com/images/I/619wte3P71S._AC_SL1242_.jpg', 'Pringles', 'Para botanear', 25, 'Snack', 'Alimentos', 18.75, '2020/04/07'),
	(8, 8, 'https://m.media-amazon.com/images/I/619wte3P71S._AC_SL1242_.jpg', 'Café Instantáneo', 'Frasco de 200g', 35, 'Alimentos', 'Bebidas', 42.0, '2020/04/08'),
	(9, 9, 'https://m.media-amazon.com/images/I/619wte3P71S._AC_SL1242_.jpg', 'Reloj', 'Diseño moderno', 50, 'Decoración', 'Hogar', 22.5, '2020/04/09'),
	(10, 10, 'https://m.media-amazon.com/images/I/619wte3P71S._AC_SL1242_.jpg', 'Yogurt', 'Bebida deslactosada', 10, 'Bebida', 'Bebida', 35.75, '2020/04/10');

select * from devolution;

INSERT INTO transactions (user_id, products_id, quantity, total_amount, transaction_date) 
VALUES 
(1, 3, 2, 49.98, '2021/05/17'),
(2, 7, 1, 39.99, '2023/05/17'),
(3, 1, 3, 38.97, '2020/05/17'),
(4, 5, 1, 15.99, '2021/05/17'),
(5, 10, 2, 11.98, '2022/05/17'),
(6, 2, 1, 19.99, '2023/06/17'),
(7, 4, 4, 35.96, '2021/06/17'),
(8, 8, 1, 16.99, '2022/07/17'),
(9, 6, 3, 89.97, '2023/08/17'),
(10, 9, 2, 19.98, '2021/10/17');



