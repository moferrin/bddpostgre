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

