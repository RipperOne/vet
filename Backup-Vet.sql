PGDMP         '                y           vet    12.4    12.4               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25611    vet    DATABASE     ?   CREATE DATABASE vet WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Chile.1252' LC_CTYPE = 'Spanish_Chile.1252';
    DROP DATABASE vet;
                postgres    false                        3079    25612    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false                       0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2            ?            1259    26770    account_emailaddress    TABLE     ?   CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);
 (   DROP TABLE public.account_emailaddress;
       public         heap    postgres    false            ?            1259    26768    account_emailaddress_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.account_emailaddress_id_seq;
       public          postgres    false    225            	           0    0    account_emailaddress_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;
          public          postgres    false    224            ?            1259    26780    account_emailconfirmation    TABLE     ?   CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);
 -   DROP TABLE public.account_emailconfirmation;
       public         heap    postgres    false            ?            1259    26778     account_emailconfirmation_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.account_emailconfirmation_id_seq;
       public          postgres    false    227            
           0    0     account_emailconfirmation_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;
          public          postgres    false    226            ?            1259    26665 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            ?            1259    26663    auth_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    215                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    214            ?            1259    26675    auth_group_permissions    TABLE     ?   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            ?            1259    26673    auth_group_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    217                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    216            ?            1259    26657    auth_permission    TABLE     ?   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            ?            1259    26655    auth_permission_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    213                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    212            ?            1259    26807    django_admin_log    TABLE     ?  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            ?            1259    26805    django_admin_log_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    229                       0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    228            ?            1259    26647    django_content_type    TABLE     ?   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            ?            1259    26645    django_content_type_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    211                       0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    210            ?            1259    26636    django_migrations    TABLE     ?   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            ?            1259    26634    django_migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    209                       0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    208            ?            1259    26829    django_session    TABLE     ?   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            ?            1259    26841    django_site    TABLE     ?   CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.django_site;
       public         heap    postgres    false            ?            1259    26839    django_site_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.django_site_id_seq;
       public          postgres    false    232                       0    0    django_site_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;
          public          postgres    false    231                       1259    51682    main_adopcion    TABLE     ?  CREATE TABLE public.main_adopcion (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    email character varying(254),
    telefono character varying(9),
    direccion character varying(300) NOT NULL,
    mensaje text NOT NULL,
    estado boolean NOT NULL,
    mascota_id integer,
    adoptante_id integer,
    aprobado boolean NOT NULL
);
 !   DROP TABLE public.main_adopcion;
       public         heap    postgres    false                       1259    51680    main_adopcion_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_adopcion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.main_adopcion_id_seq;
       public          postgres    false    262                       0    0    main_adopcion_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.main_adopcion_id_seq OWNED BY public.main_adopcion.id;
          public          postgres    false    261            ?            1259    30165    main_animal    TABLE     n  CREATE TABLE public.main_animal (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    fecha_nac date NOT NULL,
    sexo character varying(50) NOT NULL,
    tamanho character varying(50) NOT NULL,
    peso numeric(10,2),
    descripcion text NOT NULL,
    foto_perfil character varying(100),
    esterilizado character varying(50) NOT NULL,
    fecha_lleg date NOT NULL,
    estado boolean NOT NULL,
    especie_id integer,
    estado_animal character varying(50) NOT NULL,
    adoptante_id integer
);
    DROP TABLE public.main_animal;
       public         heap    postgres    false            ?            1259    30163    main_animal_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_animal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.main_animal_id_seq;
       public          postgres    false    254                       0    0    main_animal_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.main_animal_id_seq OWNED BY public.main_animal.id;
          public          postgres    false    253                        1259    30176    main_animal_tratamiento    TABLE     ?   CREATE TABLE public.main_animal_tratamiento (
    id integer NOT NULL,
    animal_id integer NOT NULL,
    tratamiento_id integer NOT NULL
);
 +   DROP TABLE public.main_animal_tratamiento;
       public         heap    postgres    false            ?            1259    30174    main_animal_tratamiento_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_animal_tratamiento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.main_animal_tratamiento_id_seq;
       public          postgres    false    256                       0    0    main_animal_tratamiento_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.main_animal_tratamiento_id_seq OWNED BY public.main_animal_tratamiento.id;
          public          postgres    false    255            ?            1259    30066    main_comuna    TABLE     ?   CREATE TABLE public.main_comuna (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    estado boolean NOT NULL
);
    DROP TABLE public.main_comuna;
       public         heap    postgres    false            ?            1259    30064    main_comuna_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_comuna_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.main_comuna_id_seq;
       public          postgres    false    234                       0    0    main_comuna_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.main_comuna_id_seq OWNED BY public.main_comuna.id;
          public          postgres    false    233                       1259    51671    main_cuidados    TABLE       CREATE TABLE public.main_cuidados (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text NOT NULL,
    estado boolean NOT NULL
);
 !   DROP TABLE public.main_cuidados;
       public         heap    postgres    false                       1259    51669    main_cuidados_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_cuidados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.main_cuidados_id_seq;
       public          postgres    false    260                       0    0    main_cuidados_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.main_cuidados_id_seq OWNED BY public.main_cuidados.id;
          public          postgres    false    259            ?            1259    30074    main_especie    TABLE     ?   CREATE TABLE public.main_especie (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    estado boolean NOT NULL
);
     DROP TABLE public.main_especie;
       public         heap    postgres    false            ?            1259    30072    main_especie_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_especie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.main_especie_id_seq;
       public          postgres    false    236                       0    0    main_especie_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.main_especie_id_seq OWNED BY public.main_especie.id;
          public          postgres    false    235                       1259    68072    main_galeria    TABLE     ?   CREATE TABLE public.main_galeria (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    imagen character varying(100),
    estado boolean NOT NULL
);
     DROP TABLE public.main_galeria;
       public         heap    postgres    false                       1259    68070    main_galeria_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_galeria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.main_galeria_id_seq;
       public          postgres    false    264                       0    0    main_galeria_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.main_galeria_id_seq OWNED BY public.main_galeria.id;
          public          postgres    false    263            ?            1259    30084    main_provincia    TABLE     ?   CREATE TABLE public.main_provincia (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    estado boolean NOT NULL
);
 "   DROP TABLE public.main_provincia;
       public         heap    postgres    false            ?            1259    30092    main_provincia_comunas    TABLE     ?   CREATE TABLE public.main_provincia_comunas (
    id integer NOT NULL,
    provincia_id integer NOT NULL,
    comuna_id integer NOT NULL
);
 *   DROP TABLE public.main_provincia_comunas;
       public         heap    postgres    false            ?            1259    30090    main_provincia_comunas_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_provincia_comunas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.main_provincia_comunas_id_seq;
       public          postgres    false    240                       0    0    main_provincia_comunas_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.main_provincia_comunas_id_seq OWNED BY public.main_provincia_comunas.id;
          public          postgres    false    239            ?            1259    30082    main_provincia_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_provincia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.main_provincia_id_seq;
       public          postgres    false    238                       0    0    main_provincia_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.main_provincia_id_seq OWNED BY public.main_provincia.id;
          public          postgres    false    237                       1259    42013    main_publicacion    TABLE     ?  CREATE TABLE public.main_publicacion (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    email character varying(254),
    telefono character varying(9),
    direccion character varying(300) NOT NULL,
    fecha date,
    nombre_mascota character varying(255) NOT NULL,
    tamanho character varying(50) NOT NULL,
    sexo character varying(50) NOT NULL,
    microchip character varying(15),
    servicio character varying(50) NOT NULL,
    fotografia character varying(100),
    mensaje text NOT NULL,
    estado boolean NOT NULL,
    especie_id integer,
    aprobado boolean NOT NULL
);
 $   DROP TABLE public.main_publicacion;
       public         heap    postgres    false                       1259    42011    main_publicacion_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_publicacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.main_publicacion_id_seq;
       public          postgres    false    258                       0    0    main_publicacion_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.main_publicacion_id_seq OWNED BY public.main_publicacion.id;
          public          postgres    false    257            ?            1259    30149    main_region    TABLE     ?   CREATE TABLE public.main_region (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    estado boolean NOT NULL
);
    DROP TABLE public.main_region;
       public         heap    postgres    false            ?            1259    30147    main_region_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.main_region_id_seq;
       public          postgres    false    250                       0    0    main_region_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.main_region_id_seq OWNED BY public.main_region.id;
          public          postgres    false    249            ?            1259    30157    main_region_provincias    TABLE     ?   CREATE TABLE public.main_region_provincias (
    id integer NOT NULL,
    region_id integer NOT NULL,
    provincia_id integer NOT NULL
);
 *   DROP TABLE public.main_region_provincias;
       public         heap    postgres    false            ?            1259    30155    main_region_provincias_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_region_provincias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.main_region_provincias_id_seq;
       public          postgres    false    252                       0    0    main_region_provincias_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.main_region_provincias_id_seq OWNED BY public.main_region_provincias.id;
          public          postgres    false    251            ?            1259    30100    main_servicio    TABLE       CREATE TABLE public.main_servicio (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text NOT NULL,
    estado boolean NOT NULL
);
 !   DROP TABLE public.main_servicio;
       public         heap    postgres    false            ?            1259    30098    main_servicio_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_servicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.main_servicio_id_seq;
       public          postgres    false    242                       0    0    main_servicio_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.main_servicio_id_seq OWNED BY public.main_servicio.id;
          public          postgres    false    241            ?            1259    30111    main_tratamiento    TABLE       CREATE TABLE public.main_tratamiento (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text NOT NULL,
    estado boolean NOT NULL
);
 $   DROP TABLE public.main_tratamiento;
       public         heap    postgres    false            ?            1259    30109    main_tratamiento_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_tratamiento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.main_tratamiento_id_seq;
       public          postgres    false    244                       0    0    main_tratamiento_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.main_tratamiento_id_seq OWNED BY public.main_tratamiento.id;
          public          postgres    false    243            ?            1259    30122    main_veterinaria    TABLE     ?  CREATE TABLE public.main_veterinaria (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    direccion character varying(300) NOT NULL,
    geom public.geometry(Point,32718),
    estado boolean NOT NULL,
    comuna_id integer,
    telefono character varying(9),
    imagen character varying(100)
);
 $   DROP TABLE public.main_veterinaria;
       public         heap    postgres    false    2    2    2    2    2    2    2    2            ?            1259    30120    main_veterinaria_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_veterinaria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.main_veterinaria_id_seq;
       public          postgres    false    246                        0    0    main_veterinaria_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.main_veterinaria_id_seq OWNED BY public.main_veterinaria.id;
          public          postgres    false    245            ?            1259    30141    main_veterinaria_servicios    TABLE     ?   CREATE TABLE public.main_veterinaria_servicios (
    id integer NOT NULL,
    veterinaria_id integer NOT NULL,
    servicio_id integer NOT NULL
);
 .   DROP TABLE public.main_veterinaria_servicios;
       public         heap    postgres    false            ?            1259    30139 !   main_veterinaria_servicios_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.main_veterinaria_servicios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.main_veterinaria_servicios_id_seq;
       public          postgres    false    248            !           0    0 !   main_veterinaria_servicios_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.main_veterinaria_servicios_id_seq OWNED BY public.main_veterinaria_servicios.id;
          public          postgres    false    247            ?            1259    26709 
   users_user    TABLE     ?  CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254)
);
    DROP TABLE public.users_user;
       public         heap    postgres    false            ?            1259    26724    users_user_groups    TABLE     ?   CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 %   DROP TABLE public.users_user_groups;
       public         heap    postgres    false            ?            1259    26722    users_user_groups_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.users_user_groups_id_seq;
       public          postgres    false    221            "           0    0    users_user_groups_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;
          public          postgres    false    220            ?            1259    26707    users_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    219            #           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;
          public          postgres    false    218            ?            1259    26732    users_user_user_permissions    TABLE     ?   CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 /   DROP TABLE public.users_user_user_permissions;
       public         heap    postgres    false            ?            1259    26730 "   users_user_user_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.users_user_user_permissions_id_seq;
       public          postgres    false    223            $           0    0 "   users_user_user_permissions_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;
          public          postgres    false    222            ?           2604    26773    account_emailaddress id    DEFAULT     ?   ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);
 F   ALTER TABLE public.account_emailaddress ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            ?           2604    26783    account_emailconfirmation id    DEFAULT     ?   ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);
 K   ALTER TABLE public.account_emailconfirmation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            ?           2604    26668    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            ?           2604    26678    auth_group_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            ?           2604    26660    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            ?           2604    26810    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            ?           2604    26650    django_content_type id    DEFAULT     ?   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            ?           2604    26639    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            ?           2604    26844    django_site id    DEFAULT     p   ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);
 =   ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            ?           2604    51685    main_adopcion id    DEFAULT     t   ALTER TABLE ONLY public.main_adopcion ALTER COLUMN id SET DEFAULT nextval('public.main_adopcion_id_seq'::regclass);
 ?   ALTER TABLE public.main_adopcion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    261    262            ?           2604    30168    main_animal id    DEFAULT     p   ALTER TABLE ONLY public.main_animal ALTER COLUMN id SET DEFAULT nextval('public.main_animal_id_seq'::regclass);
 =   ALTER TABLE public.main_animal ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    254    254            ?           2604    30179    main_animal_tratamiento id    DEFAULT     ?   ALTER TABLE ONLY public.main_animal_tratamiento ALTER COLUMN id SET DEFAULT nextval('public.main_animal_tratamiento_id_seq'::regclass);
 I   ALTER TABLE public.main_animal_tratamiento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    255    256            ?           2604    30069    main_comuna id    DEFAULT     p   ALTER TABLE ONLY public.main_comuna ALTER COLUMN id SET DEFAULT nextval('public.main_comuna_id_seq'::regclass);
 =   ALTER TABLE public.main_comuna ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            ?           2604    51674    main_cuidados id    DEFAULT     t   ALTER TABLE ONLY public.main_cuidados ALTER COLUMN id SET DEFAULT nextval('public.main_cuidados_id_seq'::regclass);
 ?   ALTER TABLE public.main_cuidados ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    259    260            ?           2604    30077    main_especie id    DEFAULT     r   ALTER TABLE ONLY public.main_especie ALTER COLUMN id SET DEFAULT nextval('public.main_especie_id_seq'::regclass);
 >   ALTER TABLE public.main_especie ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235    236            ?           2604    68075    main_galeria id    DEFAULT     r   ALTER TABLE ONLY public.main_galeria ALTER COLUMN id SET DEFAULT nextval('public.main_galeria_id_seq'::regclass);
 >   ALTER TABLE public.main_galeria ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    264    263    264            ?           2604    30087    main_provincia id    DEFAULT     v   ALTER TABLE ONLY public.main_provincia ALTER COLUMN id SET DEFAULT nextval('public.main_provincia_id_seq'::regclass);
 @   ALTER TABLE public.main_provincia ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    238    238            ?           2604    30095    main_provincia_comunas id    DEFAULT     ?   ALTER TABLE ONLY public.main_provincia_comunas ALTER COLUMN id SET DEFAULT nextval('public.main_provincia_comunas_id_seq'::regclass);
 H   ALTER TABLE public.main_provincia_comunas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239    240            ?           2604    42016    main_publicacion id    DEFAULT     z   ALTER TABLE ONLY public.main_publicacion ALTER COLUMN id SET DEFAULT nextval('public.main_publicacion_id_seq'::regclass);
 B   ALTER TABLE public.main_publicacion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    257    258            ?           2604    30152    main_region id    DEFAULT     p   ALTER TABLE ONLY public.main_region ALTER COLUMN id SET DEFAULT nextval('public.main_region_id_seq'::regclass);
 =   ALTER TABLE public.main_region ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    249    250            ?           2604    30160    main_region_provincias id    DEFAULT     ?   ALTER TABLE ONLY public.main_region_provincias ALTER COLUMN id SET DEFAULT nextval('public.main_region_provincias_id_seq'::regclass);
 H   ALTER TABLE public.main_region_provincias ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    252    252            ?           2604    30103    main_servicio id    DEFAULT     t   ALTER TABLE ONLY public.main_servicio ALTER COLUMN id SET DEFAULT nextval('public.main_servicio_id_seq'::regclass);
 ?   ALTER TABLE public.main_servicio ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242            ?           2604    30114    main_tratamiento id    DEFAULT     z   ALTER TABLE ONLY public.main_tratamiento ALTER COLUMN id SET DEFAULT nextval('public.main_tratamiento_id_seq'::regclass);
 B   ALTER TABLE public.main_tratamiento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    244    244            ?           2604    30125    main_veterinaria id    DEFAULT     z   ALTER TABLE ONLY public.main_veterinaria ALTER COLUMN id SET DEFAULT nextval('public.main_veterinaria_id_seq'::regclass);
 B   ALTER TABLE public.main_veterinaria ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    246    246            ?           2604    30144    main_veterinaria_servicios id    DEFAULT     ?   ALTER TABLE ONLY public.main_veterinaria_servicios ALTER COLUMN id SET DEFAULT nextval('public.main_veterinaria_servicios_id_seq'::regclass);
 L   ALTER TABLE public.main_veterinaria_servicios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    248    248            ?           2604    26712    users_user id    DEFAULT     n   ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            ?           2604    26727    users_user_groups id    DEFAULT     |   ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);
 C   ALTER TABLE public.users_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            ?           2604    26735    users_user_user_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);
 M   ALTER TABLE public.users_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            ?          0    26770    account_emailaddress 
   TABLE DATA           W   COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
    public          postgres    false    225   ʇ      ?          0    26780    account_emailconfirmation 
   TABLE DATA           ]   COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
    public          postgres    false    227   ??      ?          0    26665 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    215   ?      ?          0    26675    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    217   3?      ?          0    26657    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    213   ??      ?          0    26807    django_admin_log 
   TABLE DATA           ?   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    229   Ȍ      ?          0    26647    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    211   ??      ?          0    26636    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    209   ??      ?          0    26829    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    230   u?      ?          0    26841    django_site 
   TABLE DATA           7   COPY public.django_site (id, domain, name) FROM stdin;
    public          postgres    false    232   #?      ?          0    51682    main_adopcion 
   TABLE DATA           ?   COPY public.main_adopcion (id, created_at, updated_at, email, telefono, direccion, mensaje, estado, mascota_id, adoptante_id, aprobado) FROM stdin;
    public          postgres    false    262   P?      ?          0    30165    main_animal 
   TABLE DATA           ?   COPY public.main_animal (id, created_at, updated_at, nombre, fecha_nac, sexo, tamanho, peso, descripcion, foto_perfil, esterilizado, fecha_lleg, estado, especie_id, estado_animal, adoptante_id) FROM stdin;
    public          postgres    false    254   ??      ?          0    30176    main_animal_tratamiento 
   TABLE DATA           P   COPY public.main_animal_tratamiento (id, animal_id, tratamiento_id) FROM stdin;
    public          postgres    false    256   I?      ?          0    30066    main_comuna 
   TABLE DATA           Q   COPY public.main_comuna (id, created_at, updated_at, nombre, estado) FROM stdin;
    public          postgres    false    234   f?      ?          0    51671    main_cuidados 
   TABLE DATA           `   COPY public.main_cuidados (id, created_at, updated_at, nombre, descripcion, estado) FROM stdin;
    public          postgres    false    260   V?      ?          0    30074    main_especie 
   TABLE DATA           R   COPY public.main_especie (id, created_at, updated_at, nombre, estado) FROM stdin;
    public          postgres    false    236   Y?                0    68072    main_galeria 
   TABLE DATA           R   COPY public.main_galeria (id, created_at, updated_at, imagen, estado) FROM stdin;
    public          postgres    false    264   ?      ?          0    30084    main_provincia 
   TABLE DATA           T   COPY public.main_provincia (id, created_at, updated_at, nombre, estado) FROM stdin;
    public          postgres    false    238   ʬ      ?          0    30092    main_provincia_comunas 
   TABLE DATA           M   COPY public.main_provincia_comunas (id, provincia_id, comuna_id) FROM stdin;
    public          postgres    false    240   f?      ?          0    42013    main_publicacion 
   TABLE DATA           ?   COPY public.main_publicacion (id, created_at, updated_at, nombre, email, telefono, direccion, fecha, nombre_mascota, tamanho, sexo, microchip, servicio, fotografia, mensaje, estado, especie_id, aprobado) FROM stdin;
    public          postgres    false    258   ˭      ?          0    30149    main_region 
   TABLE DATA           Q   COPY public.main_region (id, created_at, updated_at, nombre, estado) FROM stdin;
    public          postgres    false    250   ?      ?          0    30157    main_region_provincias 
   TABLE DATA           M   COPY public.main_region_provincias (id, region_id, provincia_id) FROM stdin;
    public          postgres    false    252   ??      ?          0    30100    main_servicio 
   TABLE DATA           `   COPY public.main_servicio (id, created_at, updated_at, nombre, descripcion, estado) FROM stdin;
    public          postgres    false    242   ??      ?          0    30111    main_tratamiento 
   TABLE DATA           c   COPY public.main_tratamiento (id, created_at, updated_at, nombre, descripcion, estado) FROM stdin;
    public          postgres    false    244   ??      ?          0    30122    main_veterinaria 
   TABLE DATA           ?   COPY public.main_veterinaria (id, created_at, updated_at, nombre, direccion, geom, estado, comuna_id, telefono, imagen) FROM stdin;
    public          postgres    false    246   ֳ      ?          0    30141    main_veterinaria_servicios 
   TABLE DATA           U   COPY public.main_veterinaria_servicios (id, veterinaria_id, servicio_id) FROM stdin;
    public          postgres    false    248   ?      ?          0    25919    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    204   !?      ?          0    26709 
   users_user 
   TABLE DATA           ?   COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email) FROM stdin;
    public          postgres    false    219   >?      ?          0    26724    users_user_groups 
   TABLE DATA           B   COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    221   ??      ?          0    26732    users_user_user_permissions 
   TABLE DATA           Q   COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    223   ??      %           0    0    account_emailaddress_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);
          public          postgres    false    224            &           0    0     account_emailconfirmation_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);
          public          postgres    false    226            '           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);
          public          postgres    false    214            (           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 92, true);
          public          postgres    false    216            )           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 84, true);
          public          postgres    false    212            *           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 19, true);
          public          postgres    false    228            +           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);
          public          postgres    false    210            ,           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 41, true);
          public          postgres    false    208            -           0    0    django_site_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);
          public          postgres    false    231            .           0    0    main_adopcion_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.main_adopcion_id_seq', 22, true);
          public          postgres    false    261            /           0    0    main_animal_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.main_animal_id_seq', 15, true);
          public          postgres    false    253            0           0    0    main_animal_tratamiento_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.main_animal_tratamiento_id_seq', 1, false);
          public          postgres    false    255            1           0    0    main_comuna_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.main_comuna_id_seq', 21, true);
          public          postgres    false    233            2           0    0    main_cuidados_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.main_cuidados_id_seq', 10, true);
          public          postgres    false    259            3           0    0    main_especie_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.main_especie_id_seq', 6, true);
          public          postgres    false    235            4           0    0    main_galeria_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.main_galeria_id_seq', 14, true);
          public          postgres    false    263            5           0    0    main_provincia_comunas_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.main_provincia_comunas_id_seq', 22, true);
          public          postgres    false    239            6           0    0    main_provincia_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.main_provincia_id_seq', 4, true);
          public          postgres    false    237            7           0    0    main_publicacion_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.main_publicacion_id_seq', 16, true);
          public          postgres    false    257            8           0    0    main_region_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.main_region_id_seq', 1, true);
          public          postgres    false    249            9           0    0    main_region_provincias_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.main_region_provincias_id_seq', 4, true);
          public          postgres    false    251            :           0    0    main_servicio_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.main_servicio_id_seq', 9, true);
          public          postgres    false    241            ;           0    0    main_tratamiento_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.main_tratamiento_id_seq', 1, false);
          public          postgres    false    243            <           0    0    main_veterinaria_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.main_veterinaria_id_seq', 9, true);
          public          postgres    false    245            =           0    0 !   main_veterinaria_servicios_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.main_veterinaria_servicios_id_seq', 76, true);
          public          postgres    false    247            >           0    0    users_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.users_user_groups_id_seq', 4, true);
          public          postgres    false    220            ?           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);
          public          postgres    false    218            @           0    0 "   users_user_user_permissions_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);
          public          postgres    false    222            ?           2606    26803 3   account_emailaddress account_emailaddress_email_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);
 ]   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_email_key;
       public            postgres    false    225            ?           2606    26775 .   account_emailaddress account_emailaddress_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_pkey;
       public            postgres    false    225            ?           2606    26787 ;   account_emailconfirmation account_emailconfirmation_key_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);
 e   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_key_key;
       public            postgres    false    227            ?           2606    26785 8   account_emailconfirmation account_emailconfirmation_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_pkey;
       public            postgres    false    227            ?           2606    26705    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    215            ?           2606    26701 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    217    217            ?           2606    26680 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    217            ?           2606    26670    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    215            ?           2606    26687 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    213    213            ?           2606    26662 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    213            ?           2606    26816 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    229            ?           2606    26654 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    211    211            ?           2606    26652 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    211            ?           2606    26644 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    209            ?           2606    26836 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    230            ?           2606    26848 ,   django_site django_site_domain_a2e37b91_uniq 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);
 V   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_domain_a2e37b91_uniq;
       public            postgres    false    232            ?           2606    26846    django_site django_site_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
       public            postgres    false    232            *           2606    51690     main_adopcion main_adopcion_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.main_adopcion
    ADD CONSTRAINT main_adopcion_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.main_adopcion DROP CONSTRAINT main_adopcion_pkey;
       public            postgres    false    262                       2606    30173    main_animal main_animal_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.main_animal
    ADD CONSTRAINT main_animal_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.main_animal DROP CONSTRAINT main_animal_pkey;
       public            postgres    false    254                       2606    30257 V   main_animal_tratamiento main_animal_tratamiento_animal_id_tratamiento_id_53071bf9_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.main_animal_tratamiento
    ADD CONSTRAINT main_animal_tratamiento_animal_id_tratamiento_id_53071bf9_uniq UNIQUE (animal_id, tratamiento_id);
 ?   ALTER TABLE ONLY public.main_animal_tratamiento DROP CONSTRAINT main_animal_tratamiento_animal_id_tratamiento_id_53071bf9_uniq;
       public            postgres    false    256    256                        2606    30181 4   main_animal_tratamiento main_animal_tratamiento_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.main_animal_tratamiento
    ADD CONSTRAINT main_animal_tratamiento_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.main_animal_tratamiento DROP CONSTRAINT main_animal_tratamiento_pkey;
       public            postgres    false    256            ?           2606    30071    main_comuna main_comuna_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.main_comuna
    ADD CONSTRAINT main_comuna_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.main_comuna DROP CONSTRAINT main_comuna_pkey;
       public            postgres    false    234            &           2606    51679     main_cuidados main_cuidados_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.main_cuidados
    ADD CONSTRAINT main_cuidados_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.main_cuidados DROP CONSTRAINT main_cuidados_pkey;
       public            postgres    false    260            ?           2606    30081 $   main_especie main_especie_nombre_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.main_especie
    ADD CONSTRAINT main_especie_nombre_key UNIQUE (nombre);
 N   ALTER TABLE ONLY public.main_especie DROP CONSTRAINT main_especie_nombre_key;
       public            postgres    false    236            ?           2606    30079    main_especie main_especie_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.main_especie
    ADD CONSTRAINT main_especie_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.main_especie DROP CONSTRAINT main_especie_pkey;
       public            postgres    false    236            ,           2606    68077    main_galeria main_galeria_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.main_galeria
    ADD CONSTRAINT main_galeria_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.main_galeria DROP CONSTRAINT main_galeria_pkey;
       public            postgres    false    264            ?           2606    30097 2   main_provincia_comunas main_provincia_comunas_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.main_provincia_comunas
    ADD CONSTRAINT main_provincia_comunas_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.main_provincia_comunas DROP CONSTRAINT main_provincia_comunas_pkey;
       public            postgres    false    240                        2606    30194 R   main_provincia_comunas main_provincia_comunas_provincia_id_comuna_id_65f8cbab_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.main_provincia_comunas
    ADD CONSTRAINT main_provincia_comunas_provincia_id_comuna_id_65f8cbab_uniq UNIQUE (provincia_id, comuna_id);
 |   ALTER TABLE ONLY public.main_provincia_comunas DROP CONSTRAINT main_provincia_comunas_provincia_id_comuna_id_65f8cbab_uniq;
       public            postgres    false    240    240            ?           2606    30089 "   main_provincia main_provincia_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.main_provincia
    ADD CONSTRAINT main_provincia_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.main_provincia DROP CONSTRAINT main_provincia_pkey;
       public            postgres    false    238            $           2606    42021 &   main_publicacion main_publicacion_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.main_publicacion
    ADD CONSTRAINT main_publicacion_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.main_publicacion DROP CONSTRAINT main_publicacion_pkey;
       public            postgres    false    258                       2606    30154    main_region main_region_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.main_region
    ADD CONSTRAINT main_region_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.main_region DROP CONSTRAINT main_region_pkey;
       public            postgres    false    250                       2606    30162 2   main_region_provincias main_region_provincias_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.main_region_provincias
    ADD CONSTRAINT main_region_provincias_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.main_region_provincias DROP CONSTRAINT main_region_provincias_pkey;
       public            postgres    false    252                       2606    30237 R   main_region_provincias main_region_provincias_region_id_provincia_id_c46f27fa_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.main_region_provincias
    ADD CONSTRAINT main_region_provincias_region_id_provincia_id_c46f27fa_uniq UNIQUE (region_id, provincia_id);
 |   ALTER TABLE ONLY public.main_region_provincias DROP CONSTRAINT main_region_provincias_region_id_provincia_id_c46f27fa_uniq;
       public            postgres    false    252    252                       2606    30108     main_servicio main_servicio_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.main_servicio
    ADD CONSTRAINT main_servicio_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.main_servicio DROP CONSTRAINT main_servicio_pkey;
       public            postgres    false    242                       2606    30119 &   main_tratamiento main_tratamiento_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.main_tratamiento
    ADD CONSTRAINT main_tratamiento_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.main_tratamiento DROP CONSTRAINT main_tratamiento_pkey;
       public            postgres    false    244            	           2606    30130 &   main_veterinaria main_veterinaria_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.main_veterinaria
    ADD CONSTRAINT main_veterinaria_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.main_veterinaria DROP CONSTRAINT main_veterinaria_pkey;
       public            postgres    false    246                       2606    30223 Z   main_veterinaria_servicios main_veterinaria_servici_veterinaria_id_servicio__d61be3ad_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.main_veterinaria_servicios
    ADD CONSTRAINT main_veterinaria_servici_veterinaria_id_servicio__d61be3ad_uniq UNIQUE (veterinaria_id, servicio_id);
 ?   ALTER TABLE ONLY public.main_veterinaria_servicios DROP CONSTRAINT main_veterinaria_servici_veterinaria_id_servicio__d61be3ad_uniq;
       public            postgres    false    248    248                       2606    30146 :   main_veterinaria_servicios main_veterinaria_servicios_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.main_veterinaria_servicios
    ADD CONSTRAINT main_veterinaria_servicios_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.main_veterinaria_servicios DROP CONSTRAINT main_veterinaria_servicios_pkey;
       public            postgres    false    248            ?           2606    26721    users_user users_user_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.users_user DROP CONSTRAINT users_user_email_key;
       public            postgres    false    219            ?           2606    26729 (   users_user_groups users_user_groups_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_pkey;
       public            postgres    false    221            ?           2606    26751 B   users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);
 l   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq;
       public            postgres    false    221    221            ?           2606    26717    users_user users_user_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.users_user DROP CONSTRAINT users_user_pkey;
       public            postgres    false    219            ?           2606    26737 <   users_user_user_permissions users_user_user_permissions_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_pkey;
       public            postgres    false    223            ?           2606    26765 [   users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);
 ?   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq;
       public            postgres    false    223    223            ?           2606    26719 "   users_user users_user_username_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);
 L   ALTER TABLE ONLY public.users_user DROP CONSTRAINT users_user_username_key;
       public            postgres    false    219            ?           1259    26804 (   account_emailaddress_email_03be32b2_like    INDEX     ~   CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);
 <   DROP INDEX public.account_emailaddress_email_03be32b2_like;
       public            postgres    false    225            ?           1259    26794 %   account_emailaddress_user_id_2c513194    INDEX     i   CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);
 9   DROP INDEX public.account_emailaddress_user_id_2c513194;
       public            postgres    false    225            ?           1259    26801 3   account_emailconfirmation_email_address_id_5b7f8c58    INDEX     ?   CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);
 G   DROP INDEX public.account_emailconfirmation_email_address_id_5b7f8c58;
       public            postgres    false    227            ?           1259    26800 +   account_emailconfirmation_key_f43612bd_like    INDEX     ?   CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);
 ?   DROP INDEX public.account_emailconfirmation_key_f43612bd_like;
       public            postgres    false    227            ?           1259    26706    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    215            ?           1259    26702 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    217            ?           1259    26703 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    217            ?           1259    26688 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    213            ?           1259    26827 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    229            ?           1259    26828 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    229            ?           1259    26838 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    230            ?           1259    26837 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    230            ?           1259    26849     django_site_domain_a2e37b91_like    INDEX     n   CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);
 4   DROP INDEX public.django_site_domain_a2e37b91_like;
       public            postgres    false    232            '           1259    68054 #   main_adopcion_adoptante_id_c8e287a2    INDEX     e   CREATE INDEX main_adopcion_adoptante_id_c8e287a2 ON public.main_adopcion USING btree (adoptante_id);
 7   DROP INDEX public.main_adopcion_adoptante_id_c8e287a2;
       public            postgres    false    262            (           1259    51699 !   main_adopcion_mascota_id_0be6deda    INDEX     a   CREATE INDEX main_adopcion_mascota_id_0be6deda ON public.main_adopcion USING btree (mascota_id);
 5   DROP INDEX public.main_adopcion_mascota_id_0be6deda;
       public            postgres    false    262                       1259    42024 !   main_animal_adoptante_id_d2b3e926    INDEX     a   CREATE INDEX main_animal_adoptante_id_d2b3e926 ON public.main_animal USING btree (adoptante_id);
 5   DROP INDEX public.main_animal_adoptante_id_d2b3e926;
       public            postgres    false    254                       1259    30245    main_animal_especie_id_8696da46    INDEX     ]   CREATE INDEX main_animal_especie_id_8696da46 ON public.main_animal USING btree (especie_id);
 3   DROP INDEX public.main_animal_especie_id_8696da46;
       public            postgres    false    254                       1259    30258 *   main_animal_tratamiento_animal_id_e830a13b    INDEX     s   CREATE INDEX main_animal_tratamiento_animal_id_e830a13b ON public.main_animal_tratamiento USING btree (animal_id);
 >   DROP INDEX public.main_animal_tratamiento_animal_id_e830a13b;
       public            postgres    false    256            !           1259    30259 /   main_animal_tratamiento_tratamiento_id_246f98e5    INDEX     }   CREATE INDEX main_animal_tratamiento_tratamiento_id_246f98e5 ON public.main_animal_tratamiento USING btree (tratamiento_id);
 C   DROP INDEX public.main_animal_tratamiento_tratamiento_id_246f98e5;
       public            postgres    false    256            ?           1259    30182 !   main_especie_nombre_76e2c739_like    INDEX     p   CREATE INDEX main_especie_nombre_76e2c739_like ON public.main_especie USING btree (nombre varchar_pattern_ops);
 5   DROP INDEX public.main_especie_nombre_76e2c739_like;
       public            postgres    false    236            ?           1259    30196 )   main_provincia_comunas_comuna_id_fc3336f8    INDEX     q   CREATE INDEX main_provincia_comunas_comuna_id_fc3336f8 ON public.main_provincia_comunas USING btree (comuna_id);
 =   DROP INDEX public.main_provincia_comunas_comuna_id_fc3336f8;
       public            postgres    false    240                       1259    30195 ,   main_provincia_comunas_provincia_id_f6a280d5    INDEX     w   CREATE INDEX main_provincia_comunas_provincia_id_f6a280d5 ON public.main_provincia_comunas USING btree (provincia_id);
 @   DROP INDEX public.main_provincia_comunas_provincia_id_f6a280d5;
       public            postgres    false    240            "           1259    42036 $   main_publicacion_especie_id_3dc86226    INDEX     g   CREATE INDEX main_publicacion_especie_id_3dc86226 ON public.main_publicacion USING btree (especie_id);
 8   DROP INDEX public.main_publicacion_especie_id_3dc86226;
       public            postgres    false    258                       1259    30239 ,   main_region_provincias_provincia_id_3aff8ced    INDEX     w   CREATE INDEX main_region_provincias_provincia_id_3aff8ced ON public.main_region_provincias USING btree (provincia_id);
 @   DROP INDEX public.main_region_provincias_provincia_id_3aff8ced;
       public            postgres    false    252                       1259    30238 )   main_region_provincias_region_id_19a1c954    INDEX     q   CREATE INDEX main_region_provincias_region_id_19a1c954 ON public.main_region_provincias USING btree (region_id);
 =   DROP INDEX public.main_region_provincias_region_id_19a1c954;
       public            postgres    false    252                       1259    33813 #   main_veterinaria_comuna_id_7cd6fdfe    INDEX     e   CREATE INDEX main_veterinaria_comuna_id_7cd6fdfe ON public.main_veterinaria USING btree (comuna_id);
 7   DROP INDEX public.main_veterinaria_comuna_id_7cd6fdfe;
       public            postgres    false    246                       1259    30197    main_veterinaria_geom_id    INDEX     T   CREATE INDEX main_veterinaria_geom_id ON public.main_veterinaria USING gist (geom);
 ,   DROP INDEX public.main_veterinaria_geom_id;
       public            postgres    false    246    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2                       1259    30225 /   main_veterinaria_servicios_servicio_id_851ffcb8    INDEX     }   CREATE INDEX main_veterinaria_servicios_servicio_id_851ffcb8 ON public.main_veterinaria_servicios USING btree (servicio_id);
 C   DROP INDEX public.main_veterinaria_servicios_servicio_id_851ffcb8;
       public            postgres    false    248                       1259    30224 2   main_veterinaria_servicios_veterinaria_id_272f9036    INDEX     ?   CREATE INDEX main_veterinaria_servicios_veterinaria_id_272f9036 ON public.main_veterinaria_servicios USING btree (veterinaria_id);
 F   DROP INDEX public.main_veterinaria_servicios_veterinaria_id_272f9036;
       public            postgres    false    248            ?           1259    26739    users_user_email_243f6e77_like    INDEX     j   CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);
 2   DROP INDEX public.users_user_email_243f6e77_like;
       public            postgres    false    219            ?           1259    26753 #   users_user_groups_group_id_9afc8d0e    INDEX     e   CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);
 7   DROP INDEX public.users_user_groups_group_id_9afc8d0e;
       public            postgres    false    221            ?           1259    26752 "   users_user_groups_user_id_5f6f5a90    INDEX     c   CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);
 6   DROP INDEX public.users_user_groups_user_id_5f6f5a90;
       public            postgres    false    221            ?           1259    26767 2   users_user_user_permissions_permission_id_0b93982e    INDEX     ?   CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);
 F   DROP INDEX public.users_user_user_permissions_permission_id_0b93982e;
       public            postgres    false    223            ?           1259    26766 ,   users_user_user_permissions_user_id_20aca447    INDEX     w   CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);
 @   DROP INDEX public.users_user_user_permissions_user_id_20aca447;
       public            postgres    false    223            ?           1259    26738 !   users_user_username_06e46fe6_like    INDEX     p   CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);
 5   DROP INDEX public.users_user_username_06e46fe6_like;
       public            postgres    false    219            4           2606    26788 K   account_emailaddress account_emailaddress_user_id_2c513194_fk_users_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_user_id_2c513194_fk_users_user_id;
       public          postgres    false    219    225    3786            5           2606    26795 U   account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e    FK CONSTRAINT     ?   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e;
       public          postgres    false    225    227    3806            /           2606    26695 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    213    3770    217            .           2606    26690 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    3775    215    217            -           2606    26681 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    213    3765    211            6           2606    26817 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    229    211    3765            7           2606    26822 C   django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id;
       public          postgres    false    229    219    3786            E           2606    68055 B   main_adopcion main_adopcion_adoptante_id_c8e287a2_fk_users_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_adopcion
    ADD CONSTRAINT main_adopcion_adoptante_id_c8e287a2_fk_users_user_id FOREIGN KEY (adoptante_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.main_adopcion DROP CONSTRAINT main_adopcion_adoptante_id_c8e287a2_fk_users_user_id;
       public          postgres    false    3786    262    219            D           2606    59867 A   main_adopcion main_adopcion_mascota_id_0be6deda_fk_main_animal_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_adopcion
    ADD CONSTRAINT main_adopcion_mascota_id_0be6deda_fk_main_animal_id FOREIGN KEY (mascota_id) REFERENCES public.main_animal(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.main_adopcion DROP CONSTRAINT main_adopcion_mascota_id_0be6deda_fk_main_animal_id;
       public          postgres    false    262    3867    254            ?           2606    59872 >   main_animal main_animal_adoptante_id_d2b3e926_fk_users_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_animal
    ADD CONSTRAINT main_animal_adoptante_id_d2b3e926_fk_users_user_id FOREIGN KEY (adoptante_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.main_animal DROP CONSTRAINT main_animal_adoptante_id_d2b3e926_fk_users_user_id;
       public          postgres    false    3786    219    254            @           2606    59877 >   main_animal main_animal_especie_id_8696da46_fk_main_especie_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_animal
    ADD CONSTRAINT main_animal_especie_id_8696da46_fk_main_especie_id FOREIGN KEY (especie_id) REFERENCES public.main_especie(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.main_animal DROP CONSTRAINT main_animal_especie_id_8696da46_fk_main_especie_id;
       public          postgres    false    254    3833    236            A           2606    33803 Q   main_animal_tratamiento main_animal_tratamie_tratamiento_id_246f98e5_fk_main_trat    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_animal_tratamiento
    ADD CONSTRAINT main_animal_tratamie_tratamiento_id_246f98e5_fk_main_trat FOREIGN KEY (tratamiento_id) REFERENCES public.main_tratamiento(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.main_animal_tratamiento DROP CONSTRAINT main_animal_tratamie_tratamiento_id_246f98e5_fk_main_trat;
       public          postgres    false    244    256    3845            B           2606    33808 T   main_animal_tratamiento main_animal_tratamiento_animal_id_e830a13b_fk_main_animal_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_animal_tratamiento
    ADD CONSTRAINT main_animal_tratamiento_animal_id_e830a13b_fk_main_animal_id FOREIGN KEY (animal_id) REFERENCES public.main_animal(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.main_animal_tratamiento DROP CONSTRAINT main_animal_tratamiento_animal_id_e830a13b_fk_main_animal_id;
       public          postgres    false    3867    254    256            8           2606    30183 N   main_provincia_comunas main_provincia_comun_provincia_id_f6a280d5_fk_main_prov    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_provincia_comunas
    ADD CONSTRAINT main_provincia_comun_provincia_id_f6a280d5_fk_main_prov FOREIGN KEY (provincia_id) REFERENCES public.main_provincia(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.main_provincia_comunas DROP CONSTRAINT main_provincia_comun_provincia_id_f6a280d5_fk_main_prov;
       public          postgres    false    3835    240    238            9           2606    30188 R   main_provincia_comunas main_provincia_comunas_comuna_id_fc3336f8_fk_main_comuna_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_provincia_comunas
    ADD CONSTRAINT main_provincia_comunas_comuna_id_fc3336f8_fk_main_comuna_id FOREIGN KEY (comuna_id) REFERENCES public.main_comuna(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.main_provincia_comunas DROP CONSTRAINT main_provincia_comunas_comuna_id_fc3336f8_fk_main_comuna_id;
       public          postgres    false    3828    234    240            C           2606    59882 H   main_publicacion main_publicacion_especie_id_3dc86226_fk_main_especie_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_publicacion
    ADD CONSTRAINT main_publicacion_especie_id_3dc86226_fk_main_especie_id FOREIGN KEY (especie_id) REFERENCES public.main_especie(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.main_publicacion DROP CONSTRAINT main_publicacion_especie_id_3dc86226_fk_main_especie_id;
       public          postgres    false    236    3833    258            >           2606    30231 N   main_region_provincias main_region_provinci_provincia_id_3aff8ced_fk_main_prov    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_region_provincias
    ADD CONSTRAINT main_region_provinci_provincia_id_3aff8ced_fk_main_prov FOREIGN KEY (provincia_id) REFERENCES public.main_provincia(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.main_region_provincias DROP CONSTRAINT main_region_provinci_provincia_id_3aff8ced_fk_main_prov;
       public          postgres    false    252    3835    238            =           2606    30226 R   main_region_provincias main_region_provincias_region_id_19a1c954_fk_main_region_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_region_provincias
    ADD CONSTRAINT main_region_provincias_region_id_19a1c954_fk_main_region_id FOREIGN KEY (region_id) REFERENCES public.main_region(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.main_region_provincias DROP CONSTRAINT main_region_provincias_region_id_19a1c954_fk_main_region_id;
       public          postgres    false    3857    250    252            :           2606    59887 F   main_veterinaria main_veterinaria_comuna_id_7cd6fdfe_fk_main_comuna_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_veterinaria
    ADD CONSTRAINT main_veterinaria_comuna_id_7cd6fdfe_fk_main_comuna_id FOREIGN KEY (comuna_id) REFERENCES public.main_comuna(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.main_veterinaria DROP CONSTRAINT main_veterinaria_comuna_id_7cd6fdfe_fk_main_comuna_id;
       public          postgres    false    234    246    3828            <           2606    30217 Q   main_veterinaria_servicios main_veterinaria_ser_servicio_id_851ffcb8_fk_main_serv    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_veterinaria_servicios
    ADD CONSTRAINT main_veterinaria_ser_servicio_id_851ffcb8_fk_main_serv FOREIGN KEY (servicio_id) REFERENCES public.main_servicio(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.main_veterinaria_servicios DROP CONSTRAINT main_veterinaria_ser_servicio_id_851ffcb8_fk_main_serv;
       public          postgres    false    242    3843    248            ;           2606    30212 T   main_veterinaria_servicios main_veterinaria_ser_veterinaria_id_272f9036_fk_main_vete    FK CONSTRAINT     ?   ALTER TABLE ONLY public.main_veterinaria_servicios
    ADD CONSTRAINT main_veterinaria_ser_veterinaria_id_272f9036_fk_main_vete FOREIGN KEY (veterinaria_id) REFERENCES public.main_veterinaria(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.main_veterinaria_servicios DROP CONSTRAINT main_veterinaria_ser_veterinaria_id_272f9036_fk_main_vete;
       public          postgres    false    3849    246    248            1           2606    26745 F   users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id;
       public          postgres    false    221    215    3775            0           2606    26740 E   users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id;
       public          postgres    false    219    3786    221            3           2606    26759 T   users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm;
       public          postgres    false    3770    213    223            2           2606    26754 Y   users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id;
       public          postgres    false    223    219    3786            ?      x?????? ? ?      ?      x?????? ? ?      ?      x?3?tL????2?(M??L??????? L?      ?   >  x?һ??0C???bf????C8k[e??~??e??I]}??尗?{?b??=??`?????Xbb?0A֘(L?-&?^\???<??|r\?.???????????|qy???!????N?1y???(B^4!/??Kȋ???)/???N?˻??Ғ??E??&????rIy?R?????Q??)y???)|c(J^5%???WKɫ???-????N????u??????iy=??^Z^???yyc??qF?#o??7?ț{)?SF?,#o^V?>??5V?:+o?????ϵ????????w?Z??뻇???????W??>???)?d      ?   7  x?e?ͮ?0F??S?	?M??Dw?
	?+$dRS,?I??E??I<3???.????Μ?u?껍?\6???	?<?Wu??.??tMB??????K?m/?f?K?]?1?l?Ph??a??i?}W5)?v?? ?3???????Lw?)?c??m
??]?b??8?b????8?4E?????9??P?R????;?>????????tmNK??1???ݼ????>?j?p?????R????U????͋?,??Z?+?[=БQ?5P????	ծ??`???CD+=?}??O?2VS???]??z/q??3????g??/??s?~9??q??y??I?`?????}?fpn?????v[8?)?V???<??1??:?}??n??(?' ,c?`,???ղoa|?6???a????ۂ_?E+$?e?\?L??S???Jmz????Wu???-????.)?U'ʨ?N???5\?ZӅ1??ہ=?p???8?P?eR!Ԍ/c??]??tA???`?r?)???`ʚJ?n0崲?/?0?Ώ+H??S??
??9+?P??y?7t??Z???0??	????B?(?ɧ????@?F???~????4F?ʬ]? .0g?(x?	????Sb`Ք?~j?y9f?n|?????a8?`???8?`F?X?[?n??mr?n?A???AX??<Z??xcyk???e՞?G???r?t7?Ԝ??1?|3?P>?4????RC>^?!???{?s?A??[?$?bIy?B??0??w?)?擿?U??.?+5?	l1??,1?????a(?'?̏ι??aq      ?   !  x???َ?0@?ӯ??^?ݎ??"?0R?
9K[CM??a>
?	?c?$U??1?[??9??5?atBل
D?e?J??$D?	??^?}?xW?Y(|????????77]??t??i(a??ڇ
?׮	??|Ģ?9?#:b$\X?p̘????"?E<??? ?8??L?gV??r{?D?X?-??0eoq??Um?b??.?8-N???q??el?w??!ƹ$I??79Ug?z?9??1?▦v?:??t7:?6ln?D?1zz4??*C?)9??ȋxt?'???????zRvDfV+fZK?-??Y?+??o?.??ll??????+b???}bW???i??RY??TD)u`- ]?j?#??Y???M?.}]?*??|??#?Q+?e1?7?Q??ޛP?????K?????$????O????խ?L?!??kϥLֹE??{??C??޺:?;?????>??^l?/r????&??v??G6c9?????u??)ef@&$??Ɵ???????Ki??ljo?=ɇ??f??]|?mJ?h4?[Ǵ?      ?   ?   x?U?Kn!D??a????K6x:???@Ks??Б&?z?ʶrA"??r?????ȬAJ??4ɪ?e<C??eT??M?v_}???^?𰗿ހ?M-V?@??9??x??{?S4P?-h?????zC?y?????L`Sh??,S*??ל?̚6?Vz?y??+?Dҝ]&???
??N]?*???9??(J ??~?o/???8Vi?ȥ?˱lyt,ǲ+y?} ?/??o      ?   ?  x???kn?:?????)R???&?d8vƏb??Kɩ?tR4E????C?????q?禟??k3?Rھ???P!? ??W?Z????ƒ???~?Hcsޚp?!?_B/?c)???$?q?_?)V?A????õ/?4?C?+?K?????S?41c??"?oR?$?%???*?9?a?
?U?G>?p???Dl I?"?{?.Ns??s+?-?ƐcCI?#????cG?SH?=?`??$_4?? o?kOq?)??)4?8???LS<7_???V.?"?Z?????s%??C?I?ry\?R?nR?qX???X9@????*5?:?wq?????zx???TduT"{<K??A??5`?>po????K<O????#?????`ʰ?p|???ܐ??X?[T???&?7???x??}???s8????0b% B???Ss?7????G8L???~F?SBܘ?%u??>,}?gy???Rr??!=?uI#?'?6?W{???g??o7ھ"??j?b?"?w*r???F??+4JmA]?????:0????H?m?6????_C???>?k*?4??b[x??N?a???f???Kd??L?B???r??n?D??΁jƊ-??????{0(Ю???J?k??&?淗*??Lk?u{Z?26????-??w??Y???byͮ?d$e??Z??u?ٵ?xLw"??O??S>???W??ztɘ????I????,?Q̴????3Ld?`?aנ*T?p?\????L{vw???kr?2??]k?????????tJ'Z?vn?]?α???p2?Q^i??_???]????S?S?\E?ȭ>????D?LnO˄%?HB??9?TwC$D[mT???͚dJ???7??I?=-KAB??6Ֆ֕??u9??U///????       ?   ?	  x????n???uߧ?/p????\????ǲ?l8??y??O?Nw???J6?????O?ϩ*????y???????P?x??V?a?ӏ?:?????????tE???]????????????:?y>???5?????T?$x??񛾽?E??9????S:????I?;?_??zq?ۅ槬Jo?u??`?U9?W?,??4\?߀???~??P?C/?w??\Q_x?9???S?]? ??ޖw?$>??k>????I??S????[?(G??ы??[???%w?R??~??]???)?????N?!?ޓ?}???????B ?o~??+$6?6????/?,?6eS?a?????e?p叇?wE? ??????????????e???"?,??????p?????+?_????q??J??N??g՗?*?Nr"D?;Ü???>W?̏E ?R?????}?ei?x?\K¥W1J?Q??X???"??RnhI?V?6l5ky?W????w?1?8?B?$U?????? ?l?-??huhF^ J/̃m<?㥮?Q	??G????`?=?rPAY?m??J{2??bddĊ?ԏ????ڔ?Y?"??.??2Tk?a>C?Kэ2?$x??)???NWjk	8??+9?X%?d?j?1V???d?Q??=??{ݺ*(?[?!???E4'???<w	nuy?????_u ˤUЭ?BE???U??0????R4K????r???e?,ƹ؆???Ic???S??͒?.t?ƤG\w?ҵyE?[?˭t??JF?U)?R?V5??f?T???????Vbcla!(???|??ESD??e?Jª)?|?%????Ǖې?XP??J??oADeu9?p?????{???=??Fܦ??L?qkuMb??%?e??!?*?h?N&????}???+?(?m?K??;?????C??C?? LtU??8\?uk?J?:?B
??X ??m???,z?JT=NU??^?{\?M???b?W?յZZ?&c 4	?<|?\>??Gax??t5}??n???-??<?
??pFt@9?c%e?;\?G?
,???|?,p#.?????a0`??5@??`?W?q=c?r????????/?AO?-?۫?ݲ[r??ݸ??TNq???u?߻??s9?[O???r????-9?>d??3?????I_?_/g|{???~(???m?2-?$ ?l?-Q???V?@?}5?xX??^H???sk?+6D?@?m?a?᜖5y3g?????d???)3???????{	??:9茯?/??x?????M??kvE&??9????????E?????????????Z߾??);?????U??????????t{?~U?]????x{|???C梷????????v??T?s?Mf?g?Ø:??\???5(?ى????k????t???继????o??N?7??:??M?([???D?"D? ?^?,q????ˁ???3??y5?w/?U??sW????-;?+2??L=??d?>-??k????ԃ?????????|?'`>{??|???e7S?n??}?$ƌ?у???????(ۓ??]?:ǚ:`? ??p??ד7????:h:!????2??Z?;]?:p??mw?,'=? ?K?xɄ?h&?F??(?#?;]ɺ?e?>V???i?XT??/ :?d?????v?֝??$?PI?q?9U?2H?OL???C2S??Yw??]?bۅ!E?|??z??? ;?(iSwM?
,???JD??????Dn?[#??[? ?I???yM<?[?)N?֧e????B??!2u Z?QD??J?#?6&?U%9????jL??<¢89\?u?_!??-`q???!???q??R?u۠J?Dq??ˑ?]?pX뫐?? R??dH?:??Gɢ?t??J???u??z?e;?
?ȫ??Iڍ?Gݩj?xL[?i]??p??Jm٭?J????^Zy?.Q*U?y5??>?*??`???m*l
-????$K9?l7?Ӫ!ܝ??,2?m?^W??%?mu?R???I?~iS??,)?)??E<\??
{]?5e?pF??D???Ƚ??2T??'???2ݨ???u?+?6`X???Ƹ,?)D?????e1?R?ܸ??j\?}?k;?-!?xn?T?8.u???=I'V????_?|>\w??߃a6B??Ï݂6?,?$E)?F???A?G"Ȏ??.WVlb?-???Z?I??2?S???:h?"?;Yq?\??O]?W m?N????????t?k???C?u?K??t? C˯{\\????ps??M	\5?L̘eC?FQ@?(`???'??޾fdQ)??nlӑ?(K?aY?U??df7??MyǗ6v?um^m?,$(?[???Z%?Ȗ?????Ӣ??A?ѫf0yݓWhc??~?\??ӯj`=q??e?$??QL?N??s?????.W?mP?A?U?X_?|?'rP'      ?      x?3?L?H?-?I?K??Efs??qqq ?<	?      ?   ?  x??UI??0]?S???,ĊTe?ER?}o?$??A?L??r?|m?;??`?g?ޓ>JF}???De?u&??@??:? Rc4?h?C??ӄ?cb?$FjF???PE???	?=????&???r??u??bdQ.%:?'ף?^?K??KB?\?^ٙF?DiDb??2z?mB?é???>???Ӌ?w?????]l????8?X+???X?Q???w??i?W?"?~???ms??8?$?)W???.?????w?|B?r??AH??%??????9߈?A?~/s??^I!je7:??\?|?@?6[s?q?s?7#??E}&??ީ#?>??Zo6?,c3i???[??w9???S=???7???	??????H??]S??\?޺С !c?ݰ??t??gBb???;7?E??r??:?U?:ga?B?P??k????"??ꜯ+m?ڻ?(?!F<l?ԕ??????l?B?aX	n????A???1?Ct?S?R?'Q??Y??2?????h?"Y????HՎ+?}?v???s?K????????M]r0?1Hq????2;???J?Y???/??%????ɡk,?L??O???Υ?Z???\rL5<??;??\CGj??:.??D????O?r?<S ?P??G=?<????2???      ?   I  x???ݎ?6???O?????_w?6Io??? Z??Jdѕ???[}??XI?k[? ??????3$?u??"?"??????w??3?=?,dL???????2,??f?g?76???????o???????f??{??/??`?o?????~??\P?(?Yx???]?=?2(@es???1??q??_???a??+???B?L??n?ua??@De?P?="ƥZ2~t?cd1???.?&??c???C???z?83~???????+????-j?Ƣ?p?x?T?Lt?gx??<????EU*(????א??????L?.%|igG??0[???x???<?("$@I9-ֈ??n8???/"? ?|?|?????????u>?R2"???'???3???1VK*??<A??????%?28?L&???#??+?~?$%?r??N??>|?W????.(;?ϯS??3dH???ɯc!???????Pwfv?䶾??{???CH????X?Dɴf)S?⣫o??.?}r????;?F??<R?Icu?"}K??m????xk?k@???~):?5c??'??猯 1??@??Y@'h?>???N?MV?i??iyѵk+??$QO??5*?`(T?G?1?~֨???;w?)[?:???):fyCn?5Ĕ?Q1??????2??o?a???X??Z?Nv7???meӚ?UiR?&]??G?H5?:A?????u`b?F??G?գ"ms5???:Ϫj|?R?Ch??B??Tv2u8????n?|??3????f??t?S?{??/Q*
?H^????&;??Z??Y?nz?SD?%?_&??Z?~.??E??      ?      x?????? ? ?      ?   ?  x?}?M??@???S??tUw??2"?l??@ ???k??"G?2??K??ô???{zt?ze?A?p????!?Q>n?y??8^~L7??W"6?5??Ѻ?>2?g?|??s??>?I?"-n%|??S?%??Z?? ?]
?rl?ny?y:?????<Fѩ???q=?T?T?NG/?t?Lgv??.*??.O雕???S?ZJ??j?P4*??nj^??0𣢠??Aκ????}?6??JJ?zKV?hC?Myi?????9
?P?䆶????׽A?nJ?)?ъIm???pZ/?9r??.iP1ZBi???^u?ß????.?W??G??lv7?|x׸???D?l?.?nͽZ80v?z??@?5??ӆ???)?.{Um?	?"???WA۹???Q?v???? ???w??w???????&h?9??˹???#?
???v Q??}?Kp???NUӳ6(???p?~??kwm?'???~*?Ld      ?   ?  x??V?r?6?W_??c-???d???r??ENF?,*???`Y??\?rv???{@???+W?T?{zz?O?Y????Y?[.w?&+f???0????*cKn?hy??#XU????BT?[??ѵUe?6?*m?yէ?^?\?'??O?a??t[?s?l????[9)????m[??2rV??q??[?s?m???N?{?ح']?U?GR?"W?*B?@HP???W??Pk}6	?5??n??֛?l??????G?9??'??r\چ?	?ÁJv?PEj?<>
3???ǿq?
,??mq?C????	?;g?U5??w@|T`Uh%v?k?!???p!({????]?Er?nmN????|??6??|s???O???sx?f???ft#BJ?D?ڒ%U0c?uuJ??zȗ??kcp?)?+_?dU?]vS@?Wg?!?pA;%???7?L??L!?????V??,_??w???>?	??0?bO ??1%	~??>????=???!3?+ɓ???͗?#r?9??????W3*?Φ?W??]?????x????L??U????PňHJ!??b?+?=?z~wr?mM???	?z3??%?^	BDK???Y???-Վ?*???`???]?͖??l{?O???GiV?n???}R?O??*H????X!?>tO?@?I2	?*-FBF?3`?? ????E8Q	???T?Q??????<g?	?)Pr8*???`:{x???ĺR????Rֶ?kj???@?ɜ?quK?|??ۢ?y??S??:ͯ4?LRrI?)?u?=??jh[wc?U?
??*?#?sd~?????4ƹ????k?λ+%	Üeϙ???-?e?????P/V??KZ??y?IfI4?????? J?u:	$h}4?Z???XP.__$??!3m???-?jbߑІ=??s?/??#/-??`???5??n?g?b>_?w?^?>z_???_?o?'?e??5??B????j?L???6gٿ?????"?>x???ԝ????,?6??*??PBo???0??Ś?v?^??w??X?9?j??1^p?4Z&???X?Z??)UA?8 ?[?S5e`?Je????1/G|???,?J?S?OO????B?㠟&~???#9??BJ6??7?????8??N?+???Q,?5???y?ݮ~9+nB???*?'?5?:`5Z?uzč?-?S42Z?Hx-5?dw?IYo1??4?t?ѐ?:??X?8M??\?@?ǮI???
)y???=S?KOo??X?	B???>+??      ?   ?   x???1?0й9E/P?߱C???1?t???*???z1?H#1???o?:?i#鎂ES???IO?m^??fvV6%?Qϑ?*N??G6B???H?[R?R??iX^Cf???,ߊ??-,?O?C-?K????|?????x%?u?a???n?F V?U?"??߇?c6???{ U8         ?  x???Ѯ?0@??~??@?L;??????ɦ?B?r?I?~??Ȇn?>????? /??蝆??E???c?h?:?yN????6???C??Z?|A???Ǘ???(c?gz$?i???5p???T?{rB?@F?@?ƠA?Oz[
,*a/U}F?zЖ????b`%Z;6u????????-?'?+d??]Q????y??	?6Q?H)?G̙[?[?Kı-^QI??[?n????֌????x??R??![?d???ú.??%C?"??sB*???-??	?5ݷiN͘?C.?.-;???72??,??=홵1D???u?b"?-?/?UI?η?7?>?ﲹ??? h?72?h???~]??!?3?B-????????~?!?l?????`??B	??????i???}???>????NF      ?   ?   x?m?K
? ??q\?P????q'?e?H[?R(&?o?ƌ??&B?h?4Jv??[H?I2???3?	?^??w????z?[?luY?:55){???wr????2E?4???j9Pw?q??A|?@??a?q@ﭴN>?R???;?      ?   U   x?Ź11?̕fD}?l?q? ????r??d??Snnyx?E?zH1C???Q??>ю-t??n??/?ê=?{????!??      ?   B  x??V?r?6]C_?P?r%?ɸ{4?mf<0	?L)R?f??ʢ?Lw???zAP?n?P$??s?Ź??F??ͩH(??ǩ&Ę9?g?L??ɸ?J3#h??7?'?n]U?E???{?,??y????ޗ??yy??N
W%?.wms?<?+-?sEi???`f?(Z??F??ڼIl?)?;;??????m^6?/???O?5Z6>Y???m_v??7Ƹ:o??[?o???;|??s??&?ϨCu3q?L?P?Q?q????#.??g?`%?$c.n?\?m`??klt??;t?m]8tg??))N?%??f?FѬ??i-?zLyԌ??|?D?R??%??o??J?/??]?=?zZ?[n???w?*?@b??[[`?s??q?&$?$???*%/??"?3?????͗mAO??l??k?"?>???TjFǜ??m???h??&?%oJ?k??[Sg-??ӏ4??w"??u6?왹wI????]?|R֫?ol?t????????/???%A?fL?1İUN????ՙ??$?(??-?fO L??7??????eA3$?q?5v??ve??k???ʮV???0s?8?ң}ˌ*?:6?0j????f?aɠ?O?ee??px/?w?	F?F*??c??a?	?+?긼??ݖ????J??i?dϠn^??EGn?=|??b??&????S?Y*?? ?L/.K?CnA??!??'??F!?C?oc?Q??? ??W!????ص?{???)?q0{?B?ff,?6?e?\zu?L?	?&WRGd???`??Z??!:?k??o9ANr?2????ktH@?(??CacXQ???Ha!U*̀?ن?"???Iao)???x?-???+j>??<|????1?u~t2??t?f?`??f?Mt 7?Bz? ?????h??y???I? ???=?x<A???? ~??[???j?B7?5P????,??~?+??˗Ѷ7?hd?%d?)z??e?b˱??_h????Ar?Ua???<@?=?J?????k?jFG?????R2?	U?4^eWa8&??XY??/nO???DT???qk?ק?*??v????b????
??b??]?l6?̱?      ?   W   x?3?4202?5"s#C+cC+K=S#c]c???????????????????9H6"?S!(5=3?O!%U???Ҥ?T??=... >?X      ?      x?3?4?4?2??\&@҄+F??? !??      ?   ?   x???;j?0@k???????ֻ?u?Ti??Y??Xr?;??#??"'G? ???yH??" l0?D?
?r`?DJ7????8??]??X?V?-3?(?r???y??L$F?*??NF?ps?>?????R???
?HU,f??y?W???~D ??r*_1??qZcj?K?@ ???2z??????ni魭ZT??ֆ>?7??f?>??[nK???O???d?.?̂6ڬ%j*yK?	k	??i???l????/?c?M      ?      x?????? ? ?      ?   7  x???͎?6??????U9?o?hJB?&?"-=X?^?Q??\Y6оE!?????J??)J???{~???<B?pp?H?$?!bM%*??첋W?	ń????VT??7EW?e??ғ??fS??.?US?rW??ݔU??b?G??????8}???s3?"
?.?.Sy?┚%5???QqPV?L??q??C?E?T?Q*:>U?S{?$~??.?? $,LL%E?g?,a*f?qS???{_??ͱh???m?H???ޯ?f_6D(??$7e??y?>???j?M?sӓf R?r?Hƈ#??!????V}m'?R??%"9?V??1??????ѫC???mw?\????m?~O??3?~S,???:C?y??T?t????xɖM??&?c#A?9?N?<??C??-??ВgG??????mY?	pc^ܷ?V??@?z?B?\???C??!r?cݹ??&?GC(?ۖBL??sc~{?U!?r????2Z?eQwE䚣?k??s!f???uU?(s??\h?R6d?]&????R???9????!Vʄ??R9?u?s?晱!o?]?|?V?N?U??Γ?~?>}"@???*RAj?r?ϣ)H?l??Y??Q??????BM ??10l?9??AU??m3iTa??d,??͗?????:Ǘ??2dT??I???i?&?4?L??f\?]W?_?h??uu????;?h?[????tT?Y?t?N?d*1??  
??e}??mQ?nV??0??????@??g??D?? ??;]t??|?
????K???2??҃͹\gB('??	#5_?u~??/???g?X,?0      ?   ?   x????E!??;?????뿎?( ??g??IW??$SE??l?ǹ.?Z2d??[??,??\Y???GY? ?]?? ???Wѝ???tO?????????.@X0????????o??(???Њ?\??d^?d????^CO,?l???? }???7?e?U???m?fыG???? }?????@??&z???#̊???޼???@o??\s@h???@??~?U?#?????$???E?      ?      x?????? ? ?      ?   r  x?u?[O?0F??_ч?U??c'?#!?[?)?(??VB&?&i?\Zʯ?x/H?e>?F??????9??&??z6qq???_Um?v?,[???WQ~?(o??.N???????,b?j'W??a:?,??n{? ? 	 ?0?%?δ~?ѴΚ6?Z?"k?{?A1 n , ??y.7??y},??8Um)?Ui???C?JU?SS[?7???????=ѫ??}e?q?t???ۿ????݅???!`"???????ײ+Pd?o?_0??/?kC?7?????!Z??e??l?
??u?q&ؐ?p?۫?^??:?ԺV?r??u????4 ?|?g\??-?e???ߢ?=?{?m???QS?p????X??????      ?      x?3?4?4?2?4?4?2?4?c???? !??      ?      x?????? ? ?     