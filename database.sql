CREATE DATABASE IF NOT EXISTS laravel_master;
USE laravel_master;

CREATE TABLE IF NOT EXISTS users(

id                  int(255) auto_increment not null,
role                varchar(20),
name                varchar(100),
surname             varchar(200),
nick                varchar(100),
email               varchar(255),
password            varchar(255),
image               varchar(255),
created_at          datetime,
updated_at          datetime,
remember_token      varchar(255),
CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS images(
    id              int(255) auto_increment not null,
    user_id         int(255),
    image_path      varchar(255),
    description     text,
    created_at      datetime,
    updated_at      datetime,
    CONSTRAINT pk_images PRIMARY KEY(id),
    CONSTRAINT fk_images_users FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS comments(
    id          int(255) auto_increment not null,
    user_id     int(255),
    image_id    int(255),
    content     text,
    created_at  datetime,
    updated_at  datetime,
    CONSTRAINT pk_comments PRIMARY KEY(id),
    CONSTRAINT fk_comments_users FOREIGN KEY(user_id) REFERENCES users(id),
    CONSTRAINT fk_comments_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS likes(
    id          int(255) auto_increment not null, 
    user_id     int(255),
    image_id    int(255),
    created_at  datetime,
    updated_at  datetime,
    CONSTRAINT pk_likes PRIMARY KEY(id),
    CONSTRAINT fk_likes_users FOREIGN KEY(user_id) REFERENCES users(id),
    CONSTRAINT fk_likes_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDb;


/* 
inserar usuarios a la tabla usuarios
*/

INSERT INTO users VALUES(NULL, 'user', 'jose luis', 'najar', 'joseluisng17@gmail.com', 'joseluisng17@gmail.com', '1234', null, CURTIME(), CURTIME(), NULL);

/*
insertamos imagenes
*/

INSERT INTO images VALUES(NULL, 1, 'test.jpg','descripción de prueba 1', CURTIME(), CURTIME());

/*
insertamos comentarios
*/

INSERT INTO comments VALUES(NULL, 1, 4,'Buena foto de familia!!',CURTIME(), CURTIME());

/*
insertamos un like
*/

INSERT INTO likes VALUES(NULL, 1, 4,CURTIME(), CURTIME());
