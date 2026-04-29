
CREATE TABLE lugares (
                id_lugar INT NOT NULL,
                nombre VARCHAR(200) NOT NULL,
                descripcion VARCHAR(500) NOT NULL,
                municipio VARCHAR(100) NOT NULL,
                provincia VARCHAR(100) NOT NULL,
                departamento VARCHAR(100) NOT NULL,
                ubicacion VARCHAR(300) NOT NULL,
                latitud DECIMAL(50) NOT NULL,
                url VARCHAR(300) NOT NULL,
                longitud DECIMAL(50) NOT NULL,
                PRIMARY KEY (id_lugar)
);


CREATE TABLE horarios (
                id_horario INT NOT NULL,
                id_lugar INT NOT NULL,
                dia VARCHAR(50) NOT NULL,
                inicio TIME NOT NULL,
                fin TIME NOT NULL,
                PRIMARY KEY (id_horario)
);


CREATE TABLE funcionalidades (
                id_funcionalidad INT NOT NULL,
                nombre VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_funcionalidad)
);


CREATE TABLE roles (
                id_rol INT NOT NULL,
                nombre VARCHAR(100),
                PRIMARY KEY (id_rol)
);


CREATE TABLE privilegios (
                id_funcionalidad INT NOT NULL,
                id_rol INT NOT NULL,
                PRIMARY KEY (id_funcionalidad, id_rol)
);


CREATE TABLE personas (
                id_persona INT AUTO_INCREMENT NOT NULL,
                nombres VARCHAR(100) NOT NULL,
                primer_apellido VARCHAR(100) NOT NULL,
                segundo_apellido VARCHAR(100),
                CI INT NOT NULL,
                complemento VARCHAR(2),
                fecha_nacimiento DATE NOT NULL,
                genero VARCHAR(50) NOT NULL,
                direccion VARCHAR(200) NOT NULL,
                telefono_fijo INT,
                celular INT,
                email VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_persona)
);


CREATE TABLE usuarios (
                id_persona INT NOT NULL,
                usuario VARCHAR(50) NOT NULL,
                contrasena VARCHAR(300) NOT NULL,
                PRIMARY KEY (id_persona)
);


CREATE UNIQUE INDEX usuarios_idx
 ON usuarios
 ( usuario );

CREATE TABLE favoritos (
                id_persona INT NOT NULL,
                id_lugar INT NOT NULL,
                PRIMARY KEY (id_persona, id_lugar)
);


CREATE TABLE comentarios (
                id_comentario INT NOT NULL,
                id_lugar INT NOT NULL,
                id_persona INT NOT NULL,
                comentario VARCHAR(500) NOT NULL,
                calificacion INT NOT NULL,
                fecha DATE NOT NULL,
                id_recomentar INT NOT NULL,
                PRIMARY KEY (id_comentario)
);


CREATE TABLE fotos (
                id_foto INT NOT NULL,
                id_comentario INT NOT NULL,
                id_lugar INT NOT NULL,
                descripciion VARCHAR(300) NOT NULL,
                url VARCHAR(300) NOT NULL,
                PRIMARY KEY (id_foto)
);


CREATE TABLE cuentas (
                id_persona INT NOT NULL,
                id_rol INT NOT NULL,
                PRIMARY KEY (id_persona, id_rol)
);


ALTER TABLE fotos ADD CONSTRAINT lugares_fotos_fk
FOREIGN KEY (id_lugar)
REFERENCES lugares (id_lugar)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE horarios ADD CONSTRAINT lugares_horarios_fk
FOREIGN KEY (id_lugar)
REFERENCES lugares (id_lugar)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT lugares_comentarios_fk
FOREIGN KEY (id_lugar)
REFERENCES lugares (id_lugar)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE favoritos ADD CONSTRAINT lugares_favoritos_fk
FOREIGN KEY (id_lugar)
REFERENCES lugares (id_lugar)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE privilegios ADD CONSTRAINT funcionalidades_privilegios_fk
FOREIGN KEY (id_funcionalidad)
REFERENCES funcionalidades (id_funcionalidad)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cuentas ADD CONSTRAINT roles_cuentas_fk
FOREIGN KEY (id_rol)
REFERENCES roles (id_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE privilegios ADD CONSTRAINT roles_privilegios_fk
FOREIGN KEY (id_rol)
REFERENCES roles (id_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE usuarios ADD CONSTRAINT personas_usuarios_fk
FOREIGN KEY (id_persona)
REFERENCES personas (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cuentas ADD CONSTRAINT usuarios_cuentas_fk
FOREIGN KEY (id_persona)
REFERENCES usuarios (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT usuarios_comentarios_fk
FOREIGN KEY (id_persona)
REFERENCES usuarios (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE favoritos ADD CONSTRAINT usuarios_favoritos_fk
FOREIGN KEY (id_persona)
REFERENCES usuarios (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE fotos ADD CONSTRAINT comentarios_fotos_fk
FOREIGN KEY (id_comentario)
REFERENCES comentarios (id_comentario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT comentarios_comentarios_fk
FOREIGN KEY (id_recomentar)
REFERENCES comentarios (id_comentario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
