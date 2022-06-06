--crea bdd
CREATE DATABASE "proyectoF"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

--crea esquema

CREATE SCHEMA proy_concesionaria;

--crear dominios 
--para id
CREATE DOMAIN proy_concesionaria.d_id
    AS integer
    DEFAULT 0
    NOT NULL;

ALTER DOMAIN proy_concesionaria.d_id OWNER TO postgres;

ALTER DOMAIN proy_concesionaria.d_id
    ADD CONSTRAINT d_id_check CHECK (value>=0);

--para nombres
CREATE DOMAIN proy_concesionaria.d_nomb_ape
    AS character varying(30)
    NOT NULL;

ALTER DOMAIN proy_concesionaria.d_nomb_ape OWNER TO postgres;

ALTER DOMAIN proy_concesionaria.d_nomb_ape
    ADD CONSTRAINT d_nomb_ape_check CHECK (VALUE::text !~ '\s'::text);

--para numero de cedula
CREATE DOMAIN proy_concesionaria.d_cedula
    AS character varying(10)
    NOT NULL;

ALTER DOMAIN proy_concesionaria.d_cedula OWNER TO postgres;

ALTER DOMAIN proy_concesionaria.d_cedula
    ADD CONSTRAINT d_cedula_check CHECK (value ~ '[0-9] [0-9] [0-9] [0-9] [0-9] [0-9] [0-9] [0-9] [0-9] [0-9]');

--para direcciones
CREATE DOMAIN proy_concesionaria.d_direccion
    AS character varying(100);

ALTER DOMAIN proy_concesionaria.d_direccion OWNER TO postgres;

--para telefono
CREATE DOMAIN proy_concesionaria.d_telefono
    AS character(10);

ALTER DOMAIN proy_concesionaria.d_telefono OWNER TO postgres;

ALTER DOMAIN proy_concesionaria.d_telefono
    ADD CONSTRAINT d_telefono_check CHECK ((value ~ '^[0-9]{10}$'));

--para fechas
CREATE DOMAIN proy_concesionaria.d_fecha
    AS date
    DEFAULT current_date
    NOT NULL;

ALTER DOMAIN proy_concesionaria.d_fecha OWNER TO postgres;

ALTER DOMAIN proy_concesionaria.d_fecha
    ADD CONSTRAINT d_fecha_check CHECK (value <= current_date);