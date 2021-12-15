PGDMP                         y           vet    12.4    12.4    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25611    vet    DATABASE     �   CREATE DATABASE vet WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Chile.1252' LC_CTYPE = 'Spanish_Chile.1252';
    DROP DATABASE vet;
                postgres    false                        3079    25612    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false                       0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2            �            1259    26770    account_emailaddress    TABLE     �   CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);
 (   DROP TABLE public.account_emailaddress;
       public         heap    postgres    false            �            1259    26768    account_emailaddress_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.account_emailaddress_id_seq;
       public          postgres    false    225                       0    0    account_emailaddress_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;
          public          postgres    false    224            �            1259    26780    account_emailconfirmation    TABLE     �   CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);
 -   DROP TABLE public.account_emailconfirmation;
       public         heap    postgres    false            �            1259    26778     account_emailconfirmation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.account_emailconfirmation_id_seq;
       public          postgres    false    227                       0    0     account_emailconfirmation_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;
          public          postgres    false    226            �            1259    26665 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    26663    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    215                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    214            �            1259    26675    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    26673    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    217                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    216            �            1259    26657    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    26655    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    213                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    212            �            1259    26807    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         heap    postgres    false            �            1259    26805    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    229                       0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    228            �            1259    26647    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    26645    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    211                       0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    210            �            1259    26636    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    26634    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    209                       0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    208            �            1259    26829    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    26841    django_site    TABLE     �   CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.django_site;
       public         heap    postgres    false            �            1259    26839    django_site_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.django_site_id_seq;
       public          postgres    false    232                       0    0    django_site_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;
          public          postgres    false    231                       1259    51682    main_adopcion    TABLE     �  CREATE TABLE public.main_adopcion (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    email character varying(254),
    telefono character varying(11),
    direccion character varying(300) NOT NULL,
    mensaje text NOT NULL,
    estado boolean NOT NULL,
    mascota_id integer,
    adoptante_id integer,
    aprobado boolean NOT NULL
);
 !   DROP TABLE public.main_adopcion;
       public         heap    postgres    false                       1259    51680    main_adopcion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_adopcion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.main_adopcion_id_seq;
       public          postgres    false    262                       0    0    main_adopcion_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.main_adopcion_id_seq OWNED BY public.main_adopcion.id;
          public          postgres    false    261            �            1259    30165    main_animal    TABLE     \  CREATE TABLE public.main_animal (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    fecha_nac date,
    sexo character varying(50) NOT NULL,
    tamanho character varying(50) NOT NULL,
    peso numeric(10,2),
    descripcion text NOT NULL,
    foto_perfil character varying(100),
    esterilizado character varying(50) NOT NULL,
    fecha_lleg date,
    estado boolean NOT NULL,
    especie_id integer,
    estado_animal character varying(50) NOT NULL,
    adoptante_id integer
);
    DROP TABLE public.main_animal;
       public         heap    postgres    false            �            1259    30163    main_animal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_animal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.main_animal_id_seq;
       public          postgres    false    254                       0    0    main_animal_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.main_animal_id_seq OWNED BY public.main_animal.id;
          public          postgres    false    253                        1259    30176    main_animal_tratamiento    TABLE     �   CREATE TABLE public.main_animal_tratamiento (
    id integer NOT NULL,
    animal_id integer NOT NULL,
    tratamiento_id integer NOT NULL
);
 +   DROP TABLE public.main_animal_tratamiento;
       public         heap    postgres    false            �            1259    30174    main_animal_tratamiento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_animal_tratamiento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.main_animal_tratamiento_id_seq;
       public          postgres    false    256                       0    0    main_animal_tratamiento_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.main_animal_tratamiento_id_seq OWNED BY public.main_animal_tratamiento.id;
          public          postgres    false    255            �            1259    30066    main_comuna    TABLE     �   CREATE TABLE public.main_comuna (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    estado boolean NOT NULL
);
    DROP TABLE public.main_comuna;
       public         heap    postgres    false            �            1259    30064    main_comuna_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_comuna_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.main_comuna_id_seq;
       public          postgres    false    234                       0    0    main_comuna_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.main_comuna_id_seq OWNED BY public.main_comuna.id;
          public          postgres    false    233                       1259    51671    main_cuidados    TABLE       CREATE TABLE public.main_cuidados (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text NOT NULL,
    estado boolean NOT NULL
);
 !   DROP TABLE public.main_cuidados;
       public         heap    postgres    false                       1259    51669    main_cuidados_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_cuidados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.main_cuidados_id_seq;
       public          postgres    false    260                       0    0    main_cuidados_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.main_cuidados_id_seq OWNED BY public.main_cuidados.id;
          public          postgres    false    259            �            1259    30074    main_especie    TABLE     �   CREATE TABLE public.main_especie (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    estado boolean NOT NULL
);
     DROP TABLE public.main_especie;
       public         heap    postgres    false            �            1259    30072    main_especie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_especie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.main_especie_id_seq;
       public          postgres    false    236                       0    0    main_especie_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.main_especie_id_seq OWNED BY public.main_especie.id;
          public          postgres    false    235                       1259    68072    main_galeria    TABLE     �   CREATE TABLE public.main_galeria (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    imagen character varying(100),
    estado boolean NOT NULL
);
     DROP TABLE public.main_galeria;
       public         heap    postgres    false                       1259    68070    main_galeria_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_galeria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.main_galeria_id_seq;
       public          postgres    false    264                       0    0    main_galeria_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.main_galeria_id_seq OWNED BY public.main_galeria.id;
          public          postgres    false    263            �            1259    30084    main_provincia    TABLE     �   CREATE TABLE public.main_provincia (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    estado boolean NOT NULL
);
 "   DROP TABLE public.main_provincia;
       public         heap    postgres    false            �            1259    30092    main_provincia_comunas    TABLE     �   CREATE TABLE public.main_provincia_comunas (
    id integer NOT NULL,
    provincia_id integer NOT NULL,
    comuna_id integer NOT NULL
);
 *   DROP TABLE public.main_provincia_comunas;
       public         heap    postgres    false            �            1259    30090    main_provincia_comunas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_provincia_comunas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.main_provincia_comunas_id_seq;
       public          postgres    false    240                       0    0    main_provincia_comunas_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.main_provincia_comunas_id_seq OWNED BY public.main_provincia_comunas.id;
          public          postgres    false    239            �            1259    30082    main_provincia_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_provincia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.main_provincia_id_seq;
       public          postgres    false    238                        0    0    main_provincia_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.main_provincia_id_seq OWNED BY public.main_provincia.id;
          public          postgres    false    237                       1259    42013    main_publicacion    TABLE     �  CREATE TABLE public.main_publicacion (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    email character varying(254),
    telefono character varying(11),
    direccion character varying(300) NOT NULL,
    fecha date,
    nombre_mascota character varying(255) NOT NULL,
    tamanho character varying(50) NOT NULL,
    sexo character varying(50) NOT NULL,
    microchip bigint,
    servicio character varying(50) NOT NULL,
    fotografia character varying(100),
    mensaje text NOT NULL,
    estado boolean NOT NULL,
    especie_id integer,
    aprobado boolean NOT NULL
);
 $   DROP TABLE public.main_publicacion;
       public         heap    postgres    false                       1259    42011    main_publicacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_publicacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.main_publicacion_id_seq;
       public          postgres    false    258            !           0    0    main_publicacion_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.main_publicacion_id_seq OWNED BY public.main_publicacion.id;
          public          postgres    false    257            �            1259    30149    main_region    TABLE     �   CREATE TABLE public.main_region (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    estado boolean NOT NULL
);
    DROP TABLE public.main_region;
       public         heap    postgres    false            �            1259    30147    main_region_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.main_region_id_seq;
       public          postgres    false    250            "           0    0    main_region_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.main_region_id_seq OWNED BY public.main_region.id;
          public          postgres    false    249            �            1259    30157    main_region_provincias    TABLE     �   CREATE TABLE public.main_region_provincias (
    id integer NOT NULL,
    region_id integer NOT NULL,
    provincia_id integer NOT NULL
);
 *   DROP TABLE public.main_region_provincias;
       public         heap    postgres    false            �            1259    30155    main_region_provincias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_region_provincias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.main_region_provincias_id_seq;
       public          postgres    false    252            #           0    0    main_region_provincias_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.main_region_provincias_id_seq OWNED BY public.main_region_provincias.id;
          public          postgres    false    251            �            1259    30100    main_servicio    TABLE       CREATE TABLE public.main_servicio (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text NOT NULL,
    estado boolean NOT NULL
);
 !   DROP TABLE public.main_servicio;
       public         heap    postgres    false            �            1259    30098    main_servicio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_servicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.main_servicio_id_seq;
       public          postgres    false    242            $           0    0    main_servicio_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.main_servicio_id_seq OWNED BY public.main_servicio.id;
          public          postgres    false    241            �            1259    30111    main_tratamiento    TABLE       CREATE TABLE public.main_tratamiento (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text NOT NULL,
    estado boolean NOT NULL
);
 $   DROP TABLE public.main_tratamiento;
       public         heap    postgres    false            �            1259    30109    main_tratamiento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_tratamiento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.main_tratamiento_id_seq;
       public          postgres    false    244            %           0    0    main_tratamiento_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.main_tratamiento_id_seq OWNED BY public.main_tratamiento.id;
          public          postgres    false    243            �            1259    30122    main_veterinaria    TABLE     �  CREATE TABLE public.main_veterinaria (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    direccion character varying(300) NOT NULL,
    geom public.geometry(Point,32718),
    estado boolean NOT NULL,
    comuna_id integer,
    telefono character varying(11),
    imagen character varying(100)
);
 $   DROP TABLE public.main_veterinaria;
       public         heap    postgres    false    2    2    2    2    2    2    2    2            �            1259    30120    main_veterinaria_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_veterinaria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.main_veterinaria_id_seq;
       public          postgres    false    246            &           0    0    main_veterinaria_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.main_veterinaria_id_seq OWNED BY public.main_veterinaria.id;
          public          postgres    false    245            �            1259    30141    main_veterinaria_servicios    TABLE     �   CREATE TABLE public.main_veterinaria_servicios (
    id integer NOT NULL,
    veterinaria_id integer NOT NULL,
    servicio_id integer NOT NULL
);
 .   DROP TABLE public.main_veterinaria_servicios;
       public         heap    postgres    false            �            1259    30139 !   main_veterinaria_servicios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_veterinaria_servicios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.main_veterinaria_servicios_id_seq;
       public          postgres    false    248            '           0    0 !   main_veterinaria_servicios_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.main_veterinaria_servicios_id_seq OWNED BY public.main_veterinaria_servicios.id;
          public          postgres    false    247            �            1259    26709 
   users_user    TABLE     �  CREATE TABLE public.users_user (
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
       public         heap    postgres    false            �            1259    26724    users_user_groups    TABLE     �   CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 %   DROP TABLE public.users_user_groups;
       public         heap    postgres    false            �            1259    26722    users_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.users_user_groups_id_seq;
       public          postgres    false    221            (           0    0    users_user_groups_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;
          public          postgres    false    220            �            1259    26707    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    219            )           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;
          public          postgres    false    218            �            1259    26732    users_user_user_permissions    TABLE     �   CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 /   DROP TABLE public.users_user_user_permissions;
       public         heap    postgres    false            �            1259    26730 "   users_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.users_user_user_permissions_id_seq;
       public          postgres    false    223            *           0    0 "   users_user_user_permissions_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;
          public          postgres    false    222            �           2604    26773    account_emailaddress id    DEFAULT     �   ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);
 F   ALTER TABLE public.account_emailaddress ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    26783    account_emailconfirmation id    DEFAULT     �   ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);
 K   ALTER TABLE public.account_emailconfirmation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    26668    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    26678    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    26660    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �           2604    26810    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    26650    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            �           2604    26639    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            �           2604    26844    django_site id    DEFAULT     p   ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);
 =   ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    51685    main_adopcion id    DEFAULT     t   ALTER TABLE ONLY public.main_adopcion ALTER COLUMN id SET DEFAULT nextval('public.main_adopcion_id_seq'::regclass);
 ?   ALTER TABLE public.main_adopcion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    262    262            �           2604    30168    main_animal id    DEFAULT     p   ALTER TABLE ONLY public.main_animal ALTER COLUMN id SET DEFAULT nextval('public.main_animal_id_seq'::regclass);
 =   ALTER TABLE public.main_animal ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    254    254            �           2604    30179    main_animal_tratamiento id    DEFAULT     �   ALTER TABLE ONLY public.main_animal_tratamiento ALTER COLUMN id SET DEFAULT nextval('public.main_animal_tratamiento_id_seq'::regclass);
 I   ALTER TABLE public.main_animal_tratamiento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    255    256            �           2604    30069    main_comuna id    DEFAULT     p   ALTER TABLE ONLY public.main_comuna ALTER COLUMN id SET DEFAULT nextval('public.main_comuna_id_seq'::regclass);
 =   ALTER TABLE public.main_comuna ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    51674    main_cuidados id    DEFAULT     t   ALTER TABLE ONLY public.main_cuidados ALTER COLUMN id SET DEFAULT nextval('public.main_cuidados_id_seq'::regclass);
 ?   ALTER TABLE public.main_cuidados ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    259    260            �           2604    30077    main_especie id    DEFAULT     r   ALTER TABLE ONLY public.main_especie ALTER COLUMN id SET DEFAULT nextval('public.main_especie_id_seq'::regclass);
 >   ALTER TABLE public.main_especie ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    68075    main_galeria id    DEFAULT     r   ALTER TABLE ONLY public.main_galeria ALTER COLUMN id SET DEFAULT nextval('public.main_galeria_id_seq'::regclass);
 >   ALTER TABLE public.main_galeria ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    264    263    264            �           2604    30087    main_provincia id    DEFAULT     v   ALTER TABLE ONLY public.main_provincia ALTER COLUMN id SET DEFAULT nextval('public.main_provincia_id_seq'::regclass);
 @   ALTER TABLE public.main_provincia ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    238    238            �           2604    30095    main_provincia_comunas id    DEFAULT     �   ALTER TABLE ONLY public.main_provincia_comunas ALTER COLUMN id SET DEFAULT nextval('public.main_provincia_comunas_id_seq'::regclass);
 H   ALTER TABLE public.main_provincia_comunas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239    240            �           2604    42016    main_publicacion id    DEFAULT     z   ALTER TABLE ONLY public.main_publicacion ALTER COLUMN id SET DEFAULT nextval('public.main_publicacion_id_seq'::regclass);
 B   ALTER TABLE public.main_publicacion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    257    258            �           2604    30152    main_region id    DEFAULT     p   ALTER TABLE ONLY public.main_region ALTER COLUMN id SET DEFAULT nextval('public.main_region_id_seq'::regclass);
 =   ALTER TABLE public.main_region ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    249    250            �           2604    30160    main_region_provincias id    DEFAULT     �   ALTER TABLE ONLY public.main_region_provincias ALTER COLUMN id SET DEFAULT nextval('public.main_region_provincias_id_seq'::regclass);
 H   ALTER TABLE public.main_region_provincias ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251    252            �           2604    30103    main_servicio id    DEFAULT     t   ALTER TABLE ONLY public.main_servicio ALTER COLUMN id SET DEFAULT nextval('public.main_servicio_id_seq'::regclass);
 ?   ALTER TABLE public.main_servicio ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242            �           2604    30114    main_tratamiento id    DEFAULT     z   ALTER TABLE ONLY public.main_tratamiento ALTER COLUMN id SET DEFAULT nextval('public.main_tratamiento_id_seq'::regclass);
 B   ALTER TABLE public.main_tratamiento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    244    244            �           2604    30125    main_veterinaria id    DEFAULT     z   ALTER TABLE ONLY public.main_veterinaria ALTER COLUMN id SET DEFAULT nextval('public.main_veterinaria_id_seq'::regclass);
 B   ALTER TABLE public.main_veterinaria ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245    246            �           2604    30144    main_veterinaria_servicios id    DEFAULT     �   ALTER TABLE ONLY public.main_veterinaria_servicios ALTER COLUMN id SET DEFAULT nextval('public.main_veterinaria_servicios_id_seq'::regclass);
 L   ALTER TABLE public.main_veterinaria_servicios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    248    248            �           2604    26712    users_user id    DEFAULT     n   ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    26727    users_user_groups id    DEFAULT     |   ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);
 C   ALTER TABLE public.users_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    26735    users_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);
 M   ALTER TABLE public.users_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �          0    26770    account_emailaddress 
   TABLE DATA           W   COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
    public          postgres    false    225   �      �          0    26780    account_emailconfirmation 
   TABLE DATA           ]   COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
    public          postgres    false    227   ,�      �          0    26665 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    215   I�      �          0    26675    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    217   x�      �          0    26657    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    213   Ǝ      �          0    26807    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    229   �      �          0    26647    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    211   ��      �          0    26636    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    209   ��      �          0    26829    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    230   ��      �          0    26841    django_site 
   TABLE DATA           7   COPY public.django_site (id, domain, name) FROM stdin;
    public          postgres    false    232   Ҝ                0    51682    main_adopcion 
   TABLE DATA           �   COPY public.main_adopcion (id, created_at, updated_at, email, telefono, direccion, mensaje, estado, mascota_id, adoptante_id, aprobado) FROM stdin;
    public          postgres    false    262   ��      �          0    30165    main_animal 
   TABLE DATA           �   COPY public.main_animal (id, created_at, updated_at, nombre, fecha_nac, sexo, tamanho, peso, descripcion, foto_perfil, esterilizado, fecha_lleg, estado, especie_id, estado_animal, adoptante_id) FROM stdin;
    public          postgres    false    254   �      �          0    30176    main_animal_tratamiento 
   TABLE DATA           P   COPY public.main_animal_tratamiento (id, animal_id, tratamiento_id) FROM stdin;
    public          postgres    false    256   ˝      �          0    30066    main_comuna 
   TABLE DATA           Q   COPY public.main_comuna (id, created_at, updated_at, nombre, estado) FROM stdin;
    public          postgres    false    234   �                0    51671    main_cuidados 
   TABLE DATA           `   COPY public.main_cuidados (id, created_at, updated_at, nombre, descripcion, estado) FROM stdin;
    public          postgres    false    260   ؟      �          0    30074    main_especie 
   TABLE DATA           R   COPY public.main_especie (id, created_at, updated_at, nombre, estado) FROM stdin;
    public          postgres    false    236   ۤ                0    68072    main_galeria 
   TABLE DATA           R   COPY public.main_galeria (id, created_at, updated_at, imagen, estado) FROM stdin;
    public          postgres    false    264   ��      �          0    30084    main_provincia 
   TABLE DATA           T   COPY public.main_provincia (id, created_at, updated_at, nombre, estado) FROM stdin;
    public          postgres    false    238   L�      �          0    30092    main_provincia_comunas 
   TABLE DATA           M   COPY public.main_provincia_comunas (id, provincia_id, comuna_id) FROM stdin;
    public          postgres    false    240   �                0    42013    main_publicacion 
   TABLE DATA           �   COPY public.main_publicacion (id, created_at, updated_at, nombre, email, telefono, direccion, fecha, nombre_mascota, tamanho, sexo, microchip, servicio, fotografia, mensaje, estado, especie_id, aprobado) FROM stdin;
    public          postgres    false    258   M�      �          0    30149    main_region 
   TABLE DATA           Q   COPY public.main_region (id, created_at, updated_at, nombre, estado) FROM stdin;
    public          postgres    false    250   4�      �          0    30157    main_region_provincias 
   TABLE DATA           M   COPY public.main_region_provincias (id, region_id, provincia_id) FROM stdin;
    public          postgres    false    252   ��      �          0    30100    main_servicio 
   TABLE DATA           `   COPY public.main_servicio (id, created_at, updated_at, nombre, descripcion, estado) FROM stdin;
    public          postgres    false    242   ǩ      �          0    30111    main_tratamiento 
   TABLE DATA           c   COPY public.main_tratamiento (id, created_at, updated_at, nombre, descripcion, estado) FROM stdin;
    public          postgres    false    244   Ī      �          0    30122    main_veterinaria 
   TABLE DATA           �   COPY public.main_veterinaria (id, created_at, updated_at, nombre, direccion, geom, estado, comuna_id, telefono, imagen) FROM stdin;
    public          postgres    false    246   �      �          0    30141    main_veterinaria_servicios 
   TABLE DATA           U   COPY public.main_veterinaria_servicios (id, veterinaria_id, servicio_id) FROM stdin;
    public          postgres    false    248   ��      �          0    25919    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    204   2�      �          0    26709 
   users_user 
   TABLE DATA           �   COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email) FROM stdin;
    public          postgres    false    219   O�      �          0    26724    users_user_groups 
   TABLE DATA           B   COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    221   ��      �          0    26732    users_user_user_permissions 
   TABLE DATA           Q   COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    223   �      +           0    0    account_emailaddress_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);
          public          postgres    false    224            ,           0    0     account_emailconfirmation_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);
          public          postgres    false    226            -           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);
          public          postgres    false    214            .           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 92, true);
          public          postgres    false    216            /           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 84, true);
          public          postgres    false    212            0           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 14, true);
          public          postgres    false    228            1           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);
          public          postgres    false    210            2           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 37, true);
          public          postgres    false    208            3           0    0    django_site_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);
          public          postgres    false    231            4           0    0    main_adopcion_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.main_adopcion_id_seq', 9, true);
          public          postgres    false    261            5           0    0    main_animal_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.main_animal_id_seq', 1, true);
          public          postgres    false    253            6           0    0    main_animal_tratamiento_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.main_animal_tratamiento_id_seq', 1, false);
          public          postgres    false    255            7           0    0    main_comuna_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.main_comuna_id_seq', 21, true);
          public          postgres    false    233            8           0    0    main_cuidados_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.main_cuidados_id_seq', 10, true);
          public          postgres    false    259            9           0    0    main_especie_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.main_especie_id_seq', 6, true);
          public          postgres    false    235            :           0    0    main_galeria_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.main_galeria_id_seq', 14, true);
          public          postgres    false    263            ;           0    0    main_provincia_comunas_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.main_provincia_comunas_id_seq', 22, true);
          public          postgres    false    239            <           0    0    main_provincia_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.main_provincia_id_seq', 4, true);
          public          postgres    false    237            =           0    0    main_publicacion_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.main_publicacion_id_seq', 3, true);
          public          postgres    false    257            >           0    0    main_region_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.main_region_id_seq', 1, true);
          public          postgres    false    249            ?           0    0    main_region_provincias_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.main_region_provincias_id_seq', 4, true);
          public          postgres    false    251            @           0    0    main_servicio_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.main_servicio_id_seq', 9, true);
          public          postgres    false    241            A           0    0    main_tratamiento_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.main_tratamiento_id_seq', 1, false);
          public          postgres    false    243            B           0    0    main_veterinaria_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.main_veterinaria_id_seq', 4, true);
          public          postgres    false    245            C           0    0 !   main_veterinaria_servicios_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.main_veterinaria_servicios_id_seq', 31, true);
          public          postgres    false    247            D           0    0    users_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, true);
          public          postgres    false    220            E           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);
          public          postgres    false    218            F           0    0 "   users_user_user_permissions_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);
          public          postgres    false    222            �           2606    26803 3   account_emailaddress account_emailaddress_email_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);
 ]   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_email_key;
       public            postgres    false    225            �           2606    26775 .   account_emailaddress account_emailaddress_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_pkey;
       public            postgres    false    225            �           2606    26787 ;   account_emailconfirmation account_emailconfirmation_key_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);
 e   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_key_key;
       public            postgres    false    227            �           2606    26785 8   account_emailconfirmation account_emailconfirmation_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_pkey;
       public            postgres    false    227            �           2606    26705    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    215            �           2606    26701 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    217    217            �           2606    26680 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    217            �           2606    26670    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    215            �           2606    26687 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    213    213            �           2606    26662 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    213            �           2606    26816 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    229            �           2606    26654 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    211    211            �           2606    26652 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    211            �           2606    26644 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    209            �           2606    26836 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    230            �           2606    26848 ,   django_site django_site_domain_a2e37b91_uniq 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);
 V   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_domain_a2e37b91_uniq;
       public            postgres    false    232            �           2606    26846    django_site django_site_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
       public            postgres    false    232            -           2606    51692 %   main_adopcion main_adopcion_email_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.main_adopcion
    ADD CONSTRAINT main_adopcion_email_key UNIQUE (email);
 O   ALTER TABLE ONLY public.main_adopcion DROP CONSTRAINT main_adopcion_email_key;
       public            postgres    false    262            0           2606    51690     main_adopcion main_adopcion_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.main_adopcion
    ADD CONSTRAINT main_adopcion_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.main_adopcion DROP CONSTRAINT main_adopcion_pkey;
       public            postgres    false    262                       2606    30173    main_animal main_animal_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.main_animal
    ADD CONSTRAINT main_animal_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.main_animal DROP CONSTRAINT main_animal_pkey;
       public            postgres    false    254                       2606    30257 V   main_animal_tratamiento main_animal_tratamiento_animal_id_tratamiento_id_53071bf9_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.main_animal_tratamiento
    ADD CONSTRAINT main_animal_tratamiento_animal_id_tratamiento_id_53071bf9_uniq UNIQUE (animal_id, tratamiento_id);
 �   ALTER TABLE ONLY public.main_animal_tratamiento DROP CONSTRAINT main_animal_tratamiento_animal_id_tratamiento_id_53071bf9_uniq;
       public            postgres    false    256    256                        2606    30181 4   main_animal_tratamiento main_animal_tratamiento_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.main_animal_tratamiento
    ADD CONSTRAINT main_animal_tratamiento_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.main_animal_tratamiento DROP CONSTRAINT main_animal_tratamiento_pkey;
       public            postgres    false    256            �           2606    30071    main_comuna main_comuna_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.main_comuna
    ADD CONSTRAINT main_comuna_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.main_comuna DROP CONSTRAINT main_comuna_pkey;
       public            postgres    false    234            )           2606    51679     main_cuidados main_cuidados_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.main_cuidados
    ADD CONSTRAINT main_cuidados_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.main_cuidados DROP CONSTRAINT main_cuidados_pkey;
       public            postgres    false    260            �           2606    30081 $   main_especie main_especie_nombre_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.main_especie
    ADD CONSTRAINT main_especie_nombre_key UNIQUE (nombre);
 N   ALTER TABLE ONLY public.main_especie DROP CONSTRAINT main_especie_nombre_key;
       public            postgres    false    236            �           2606    30079    main_especie main_especie_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.main_especie
    ADD CONSTRAINT main_especie_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.main_especie DROP CONSTRAINT main_especie_pkey;
       public            postgres    false    236            2           2606    68077    main_galeria main_galeria_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.main_galeria
    ADD CONSTRAINT main_galeria_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.main_galeria DROP CONSTRAINT main_galeria_pkey;
       public            postgres    false    264            �           2606    30097 2   main_provincia_comunas main_provincia_comunas_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.main_provincia_comunas
    ADD CONSTRAINT main_provincia_comunas_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.main_provincia_comunas DROP CONSTRAINT main_provincia_comunas_pkey;
       public            postgres    false    240                        2606    30194 R   main_provincia_comunas main_provincia_comunas_provincia_id_comuna_id_65f8cbab_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.main_provincia_comunas
    ADD CONSTRAINT main_provincia_comunas_provincia_id_comuna_id_65f8cbab_uniq UNIQUE (provincia_id, comuna_id);
 |   ALTER TABLE ONLY public.main_provincia_comunas DROP CONSTRAINT main_provincia_comunas_provincia_id_comuna_id_65f8cbab_uniq;
       public            postgres    false    240    240            �           2606    30089 "   main_provincia main_provincia_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.main_provincia
    ADD CONSTRAINT main_provincia_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.main_provincia DROP CONSTRAINT main_provincia_pkey;
       public            postgres    false    238            $           2606    42023 +   main_publicacion main_publicacion_email_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.main_publicacion
    ADD CONSTRAINT main_publicacion_email_key UNIQUE (email);
 U   ALTER TABLE ONLY public.main_publicacion DROP CONSTRAINT main_publicacion_email_key;
       public            postgres    false    258            '           2606    42021 &   main_publicacion main_publicacion_pkey 
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
   CONSTRAINT     �   ALTER TABLE ONLY public.main_region_provincias
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
   CONSTRAINT     �   ALTER TABLE ONLY public.main_veterinaria_servicios
    ADD CONSTRAINT main_veterinaria_servici_veterinaria_id_servicio__d61be3ad_uniq UNIQUE (veterinaria_id, servicio_id);
 �   ALTER TABLE ONLY public.main_veterinaria_servicios DROP CONSTRAINT main_veterinaria_servici_veterinaria_id_servicio__d61be3ad_uniq;
       public            postgres    false    248    248                       2606    30146 :   main_veterinaria_servicios main_veterinaria_servicios_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.main_veterinaria_servicios
    ADD CONSTRAINT main_veterinaria_servicios_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.main_veterinaria_servicios DROP CONSTRAINT main_veterinaria_servicios_pkey;
       public            postgres    false    248            �           2606    26721    users_user users_user_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.users_user DROP CONSTRAINT users_user_email_key;
       public            postgres    false    219            �           2606    26729 (   users_user_groups users_user_groups_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_pkey;
       public            postgres    false    221            �           2606    26751 B   users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);
 l   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq;
       public            postgres    false    221    221            �           2606    26717    users_user users_user_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.users_user DROP CONSTRAINT users_user_pkey;
       public            postgres    false    219            �           2606    26737 <   users_user_user_permissions users_user_user_permissions_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_pkey;
       public            postgres    false    223            �           2606    26765 [   users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq;
       public            postgres    false    223    223            �           2606    26719 "   users_user users_user_username_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);
 L   ALTER TABLE ONLY public.users_user DROP CONSTRAINT users_user_username_key;
       public            postgres    false    219            �           1259    26804 (   account_emailaddress_email_03be32b2_like    INDEX     ~   CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);
 <   DROP INDEX public.account_emailaddress_email_03be32b2_like;
       public            postgres    false    225            �           1259    26794 %   account_emailaddress_user_id_2c513194    INDEX     i   CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);
 9   DROP INDEX public.account_emailaddress_user_id_2c513194;
       public            postgres    false    225            �           1259    26801 3   account_emailconfirmation_email_address_id_5b7f8c58    INDEX     �   CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);
 G   DROP INDEX public.account_emailconfirmation_email_address_id_5b7f8c58;
       public            postgres    false    227            �           1259    26800 +   account_emailconfirmation_key_f43612bd_like    INDEX     �   CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);
 ?   DROP INDEX public.account_emailconfirmation_key_f43612bd_like;
       public            postgres    false    227            �           1259    26706    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    215            �           1259    26702 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    217            �           1259    26703 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    217            �           1259    26688 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    213            �           1259    26827 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    229            �           1259    26828 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    229            �           1259    26838 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    230            �           1259    26837 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    230            �           1259    26849     django_site_domain_a2e37b91_like    INDEX     n   CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);
 4   DROP INDEX public.django_site_domain_a2e37b91_like;
       public            postgres    false    232            *           1259    68054 #   main_adopcion_adoptante_id_c8e287a2    INDEX     e   CREATE INDEX main_adopcion_adoptante_id_c8e287a2 ON public.main_adopcion USING btree (adoptante_id);
 7   DROP INDEX public.main_adopcion_adoptante_id_c8e287a2;
       public            postgres    false    262            +           1259    51698 !   main_adopcion_email_d9de0b8c_like    INDEX     p   CREATE INDEX main_adopcion_email_d9de0b8c_like ON public.main_adopcion USING btree (email varchar_pattern_ops);
 5   DROP INDEX public.main_adopcion_email_d9de0b8c_like;
       public            postgres    false    262            .           1259    51699 !   main_adopcion_mascota_id_0be6deda    INDEX     a   CREATE INDEX main_adopcion_mascota_id_0be6deda ON public.main_adopcion USING btree (mascota_id);
 5   DROP INDEX public.main_adopcion_mascota_id_0be6deda;
       public            postgres    false    262                       1259    42024 !   main_animal_adoptante_id_d2b3e926    INDEX     a   CREATE INDEX main_animal_adoptante_id_d2b3e926 ON public.main_animal USING btree (adoptante_id);
 5   DROP INDEX public.main_animal_adoptante_id_d2b3e926;
       public            postgres    false    254                       1259    30245    main_animal_especie_id_8696da46    INDEX     ]   CREATE INDEX main_animal_especie_id_8696da46 ON public.main_animal USING btree (especie_id);
 3   DROP INDEX public.main_animal_especie_id_8696da46;
       public            postgres    false    254                       1259    30258 *   main_animal_tratamiento_animal_id_e830a13b    INDEX     s   CREATE INDEX main_animal_tratamiento_animal_id_e830a13b ON public.main_animal_tratamiento USING btree (animal_id);
 >   DROP INDEX public.main_animal_tratamiento_animal_id_e830a13b;
       public            postgres    false    256            !           1259    30259 /   main_animal_tratamiento_tratamiento_id_246f98e5    INDEX     }   CREATE INDEX main_animal_tratamiento_tratamiento_id_246f98e5 ON public.main_animal_tratamiento USING btree (tratamiento_id);
 C   DROP INDEX public.main_animal_tratamiento_tratamiento_id_246f98e5;
       public            postgres    false    256            �           1259    30182 !   main_especie_nombre_76e2c739_like    INDEX     p   CREATE INDEX main_especie_nombre_76e2c739_like ON public.main_especie USING btree (nombre varchar_pattern_ops);
 5   DROP INDEX public.main_especie_nombre_76e2c739_like;
       public            postgres    false    236            �           1259    30196 )   main_provincia_comunas_comuna_id_fc3336f8    INDEX     q   CREATE INDEX main_provincia_comunas_comuna_id_fc3336f8 ON public.main_provincia_comunas USING btree (comuna_id);
 =   DROP INDEX public.main_provincia_comunas_comuna_id_fc3336f8;
       public            postgres    false    240                       1259    30195 ,   main_provincia_comunas_provincia_id_f6a280d5    INDEX     w   CREATE INDEX main_provincia_comunas_provincia_id_f6a280d5 ON public.main_provincia_comunas USING btree (provincia_id);
 @   DROP INDEX public.main_provincia_comunas_provincia_id_f6a280d5;
       public            postgres    false    240            "           1259    42035 $   main_publicacion_email_607f472b_like    INDEX     v   CREATE INDEX main_publicacion_email_607f472b_like ON public.main_publicacion USING btree (email varchar_pattern_ops);
 8   DROP INDEX public.main_publicacion_email_607f472b_like;
       public            postgres    false    258            %           1259    42036 $   main_publicacion_especie_id_3dc86226    INDEX     g   CREATE INDEX main_publicacion_especie_id_3dc86226 ON public.main_publicacion USING btree (especie_id);
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
       public            postgres    false    248                       1259    30224 2   main_veterinaria_servicios_veterinaria_id_272f9036    INDEX     �   CREATE INDEX main_veterinaria_servicios_veterinaria_id_272f9036 ON public.main_veterinaria_servicios USING btree (veterinaria_id);
 F   DROP INDEX public.main_veterinaria_servicios_veterinaria_id_272f9036;
       public            postgres    false    248            �           1259    26739    users_user_email_243f6e77_like    INDEX     j   CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);
 2   DROP INDEX public.users_user_email_243f6e77_like;
       public            postgres    false    219            �           1259    26753 #   users_user_groups_group_id_9afc8d0e    INDEX     e   CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);
 7   DROP INDEX public.users_user_groups_group_id_9afc8d0e;
       public            postgres    false    221            �           1259    26752 "   users_user_groups_user_id_5f6f5a90    INDEX     c   CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);
 6   DROP INDEX public.users_user_groups_user_id_5f6f5a90;
       public            postgres    false    221            �           1259    26767 2   users_user_user_permissions_permission_id_0b93982e    INDEX     �   CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);
 F   DROP INDEX public.users_user_user_permissions_permission_id_0b93982e;
       public            postgres    false    223            �           1259    26766 ,   users_user_user_permissions_user_id_20aca447    INDEX     w   CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);
 @   DROP INDEX public.users_user_user_permissions_user_id_20aca447;
       public            postgres    false    223            �           1259    26738 !   users_user_username_06e46fe6_like    INDEX     p   CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);
 5   DROP INDEX public.users_user_username_06e46fe6_like;
       public            postgres    false    219            :           2606    26788 K   account_emailaddress account_emailaddress_user_id_2c513194_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_user_id_2c513194_fk_users_user_id;
       public          postgres    false    225    3786    219            ;           2606    26795 U   account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e;
       public          postgres    false    3806    227    225            5           2606    26695 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    3770    217    213            4           2606    26690 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    217    3775    215            3           2606    26681 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    213    211    3765            <           2606    26817 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    229    3765    211            =           2606    26822 C   django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id;
       public          postgres    false    229    3786    219            K           2606    68055 B   main_adopcion main_adopcion_adoptante_id_c8e287a2_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_adopcion
    ADD CONSTRAINT main_adopcion_adoptante_id_c8e287a2_fk_users_user_id FOREIGN KEY (adoptante_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.main_adopcion DROP CONSTRAINT main_adopcion_adoptante_id_c8e287a2_fk_users_user_id;
       public          postgres    false    219    262    3786            J           2606    59867 A   main_adopcion main_adopcion_mascota_id_0be6deda_fk_main_animal_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_adopcion
    ADD CONSTRAINT main_adopcion_mascota_id_0be6deda_fk_main_animal_id FOREIGN KEY (mascota_id) REFERENCES public.main_animal(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.main_adopcion DROP CONSTRAINT main_adopcion_mascota_id_0be6deda_fk_main_animal_id;
       public          postgres    false    262    254    3867            E           2606    59872 >   main_animal main_animal_adoptante_id_d2b3e926_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_animal
    ADD CONSTRAINT main_animal_adoptante_id_d2b3e926_fk_users_user_id FOREIGN KEY (adoptante_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.main_animal DROP CONSTRAINT main_animal_adoptante_id_d2b3e926_fk_users_user_id;
       public          postgres    false    254    3786    219            F           2606    59877 >   main_animal main_animal_especie_id_8696da46_fk_main_especie_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_animal
    ADD CONSTRAINT main_animal_especie_id_8696da46_fk_main_especie_id FOREIGN KEY (especie_id) REFERENCES public.main_especie(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.main_animal DROP CONSTRAINT main_animal_especie_id_8696da46_fk_main_especie_id;
       public          postgres    false    3833    236    254            G           2606    33803 Q   main_animal_tratamiento main_animal_tratamie_tratamiento_id_246f98e5_fk_main_trat    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_animal_tratamiento
    ADD CONSTRAINT main_animal_tratamie_tratamiento_id_246f98e5_fk_main_trat FOREIGN KEY (tratamiento_id) REFERENCES public.main_tratamiento(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.main_animal_tratamiento DROP CONSTRAINT main_animal_tratamie_tratamiento_id_246f98e5_fk_main_trat;
       public          postgres    false    244    256    3845            H           2606    33808 T   main_animal_tratamiento main_animal_tratamiento_animal_id_e830a13b_fk_main_animal_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_animal_tratamiento
    ADD CONSTRAINT main_animal_tratamiento_animal_id_e830a13b_fk_main_animal_id FOREIGN KEY (animal_id) REFERENCES public.main_animal(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.main_animal_tratamiento DROP CONSTRAINT main_animal_tratamiento_animal_id_e830a13b_fk_main_animal_id;
       public          postgres    false    256    254    3867            >           2606    30183 N   main_provincia_comunas main_provincia_comun_provincia_id_f6a280d5_fk_main_prov    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_provincia_comunas
    ADD CONSTRAINT main_provincia_comun_provincia_id_f6a280d5_fk_main_prov FOREIGN KEY (provincia_id) REFERENCES public.main_provincia(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.main_provincia_comunas DROP CONSTRAINT main_provincia_comun_provincia_id_f6a280d5_fk_main_prov;
       public          postgres    false    240    3835    238            ?           2606    30188 R   main_provincia_comunas main_provincia_comunas_comuna_id_fc3336f8_fk_main_comuna_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_provincia_comunas
    ADD CONSTRAINT main_provincia_comunas_comuna_id_fc3336f8_fk_main_comuna_id FOREIGN KEY (comuna_id) REFERENCES public.main_comuna(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.main_provincia_comunas DROP CONSTRAINT main_provincia_comunas_comuna_id_fc3336f8_fk_main_comuna_id;
       public          postgres    false    234    3828    240            I           2606    59882 H   main_publicacion main_publicacion_especie_id_3dc86226_fk_main_especie_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_publicacion
    ADD CONSTRAINT main_publicacion_especie_id_3dc86226_fk_main_especie_id FOREIGN KEY (especie_id) REFERENCES public.main_especie(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.main_publicacion DROP CONSTRAINT main_publicacion_especie_id_3dc86226_fk_main_especie_id;
       public          postgres    false    258    3833    236            D           2606    30231 N   main_region_provincias main_region_provinci_provincia_id_3aff8ced_fk_main_prov    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_region_provincias
    ADD CONSTRAINT main_region_provinci_provincia_id_3aff8ced_fk_main_prov FOREIGN KEY (provincia_id) REFERENCES public.main_provincia(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.main_region_provincias DROP CONSTRAINT main_region_provinci_provincia_id_3aff8ced_fk_main_prov;
       public          postgres    false    252    238    3835            C           2606    30226 R   main_region_provincias main_region_provincias_region_id_19a1c954_fk_main_region_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_region_provincias
    ADD CONSTRAINT main_region_provincias_region_id_19a1c954_fk_main_region_id FOREIGN KEY (region_id) REFERENCES public.main_region(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.main_region_provincias DROP CONSTRAINT main_region_provincias_region_id_19a1c954_fk_main_region_id;
       public          postgres    false    250    252    3857            @           2606    59887 F   main_veterinaria main_veterinaria_comuna_id_7cd6fdfe_fk_main_comuna_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_veterinaria
    ADD CONSTRAINT main_veterinaria_comuna_id_7cd6fdfe_fk_main_comuna_id FOREIGN KEY (comuna_id) REFERENCES public.main_comuna(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.main_veterinaria DROP CONSTRAINT main_veterinaria_comuna_id_7cd6fdfe_fk_main_comuna_id;
       public          postgres    false    234    246    3828            B           2606    30217 Q   main_veterinaria_servicios main_veterinaria_ser_servicio_id_851ffcb8_fk_main_serv    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_veterinaria_servicios
    ADD CONSTRAINT main_veterinaria_ser_servicio_id_851ffcb8_fk_main_serv FOREIGN KEY (servicio_id) REFERENCES public.main_servicio(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.main_veterinaria_servicios DROP CONSTRAINT main_veterinaria_ser_servicio_id_851ffcb8_fk_main_serv;
       public          postgres    false    3843    248    242            A           2606    30212 T   main_veterinaria_servicios main_veterinaria_ser_veterinaria_id_272f9036_fk_main_vete    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_veterinaria_servicios
    ADD CONSTRAINT main_veterinaria_ser_veterinaria_id_272f9036_fk_main_vete FOREIGN KEY (veterinaria_id) REFERENCES public.main_veterinaria(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.main_veterinaria_servicios DROP CONSTRAINT main_veterinaria_ser_veterinaria_id_272f9036_fk_main_vete;
       public          postgres    false    3849    246    248            7           2606    26745 F   users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id;
       public          postgres    false    215    221    3775            6           2606    26740 E   users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id;
       public          postgres    false    219    3786    221            9           2606    26759 T   users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm;
       public          postgres    false    3770    223    213            8           2606    26754 Y   users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id;
       public          postgres    false    223    3786    219            �      x������ � �      �      x������ � �      �      x�3�tL����2�(M��L������ L�      �   >  x�һ��0C���bf����C8k[e?�~��e��I]}��尗�{�b��=��`�����Xbb�0A֘(L�-&�^\�?�<��|r\�.����������|qy���!���N�1y���(B^4!/��Kȋ���)/���N�˻��Ғ��E��&���rIy�R���Q��)y���)|c(J^5%���WKɫ���-����N���u������iy=��^Z^���yyc��qF�#o��7�ț{)�SF�,#o^V�>��5V�:+o�����ϵ�������w�Z��뻇�������W��>���)�d      �   7  x�e�ͮ�0F��S�	�M��Dw�
	�+$dRS,�I��E��I<3���.����Μ�u�껍�\6���	�<�Wu��.��tMB�?����K�m/�f�K�]�1�l�Ph��a��i�}W5)�v�� �3�������Lw�)�c��m
��]�b��8�b����8�4E�����9��P�R����;�>��������tmNK��1���ݼ����>�j�p����R����U���͋�,��Z�+�[=БQ�5P����	ծ��`���CD+=�}��O�2VS���]��z/q��3����g��/��s�~9��q��y��I�`�����}�fpn�����v[8�)�V���<��1��:�}��n��(�' ,c�`,���ղoa|�6���a����ۂ_�E+$�e�\�L�S���Jmz���Wu���-����.)�U'ʨ�N���5\�ZӅ1��ہ=�p���8�P�eR!Ԍ/c��]��tA���`�r�)���`ʚJ�n0崲�/�0�Ώ+H��S��
��9+�P��y�7t��Z���0��	����B�(�ɧ����@�F���~����4F�ʬ]� .0g�(x�	��Sb`Ք�~j�y9f�n|�����a8�`���8�`F�X�[�n��mr�n�A���AX��<Z��xcyk��e՞�G���r�t7�Ԝ��1�|3�P>�4����RC>^�!���{�s�A��[�$�bIy�B��0��w�)�擿�U�.�+5�	l1��,1�����a(�'�̏ι��aq      �   z  x���]K�0���W��/&'MsU��;v9��k�E���a쿛�s�ͮ!����H(tDaD�O��ǡ ��a������֔���m�_�/��S�a�e�.���*�����JWoͺrel����zpԄqM$� ���	 �p1��rv`
K�8���ʵ��Ŀ[�MBM& �dM�=�����x����,'~�Ur7�BwU���1I�Ļo2��4�F�8��=(5�<huڮ���U���nPѥ��Ш�-�O�!���$�A^��O���7{��zR�Ƞ9�BaC���:-l��d�4��@���v�g�q�y�┨���=������i!5�XH"��� ��)-�m����N��lUغv������=��{��      �   �   x�U�Kn!D��a���K6x:���@Ks��Б&�z�ʶrA"��r�����ȬAJ��4ɪ�e<C��eT��M�v_}���^�𰗿ހ�M-V�@��9�?x��{�S4P�-h�����zC�y�����L`Sh��,S*��ל�̚6�Vz�y��+�Dҝ]&��
��N]�*���9��(J ��~�o/���8Vi�ȥ�˱lyt,ǲ+y�} �/��o      �   (  x����n�0��O��!R�.~���h� �N})ַ%��ӥH�"�������ϱ��s�vB�Os
���|h�k4Fe�!_�?�O�{��|�����KY���Rr�����V� �	U	������q<�iJC_*�S������RRa��*%/R���R�X�7tUQ[��Q�3��龄R�!K�*A[�.L��c�Ɩ�c�%����"��񶤱����g��k� �����r��ХC��q��p�q�џ�4�c��-��pAT9{ךGk S�P��='Eq~J��H�a9?'c� edP���3[�y�~l���?f:�]�ቛ�r��Q��~?,����� ���;�N��y8����V�[f��s
Ǐ�-��9N�E�A���]E�U$�0��|�w������FlD(��n���<h�1@��<�nJ����#X��xe>��a`�{���m����\r��.?�}I��g,�6+��������x��\i�Тm��B�S�*-�4�+l��k3j[�!0�ׁ���M}S�s���nxW�Ս��j��<�TW��J�W�����/���
m+�74���/u�96w�%l� �^hWi��� i+ͮ�\��аkliy{�Jۯ��[��e�c�hg/ђPiw�[:�r�ohb�[��Q�SVh��y���_]ڇ}���Яp��*g7-�FY�^Y3��k{t�G�����"�����+�����ѠК�粦�Wڑ��7�*��o۵vM?KsZhK�P���֮�kր�1t�y�"��"�7�9�J������?�,^�      �     x����n�F�u�)�F5RUH�Hڃ|��֍�e3�<?}���K�*+$,J�������rS/-q�V�}�5	
'���Wϡ�|{��м>'��;>'O����9���>�u}o�>_ߩ����弬�ʾ��5��}7�9۷S�\���u|������|�y33/�u5k�J�פ��2r��*�w�ɹ�v��8?�?뼉�.��ܧSd�6s�{���)��=��醢�C���Sf";6�'u�O��h�v)S-��CY��������gl^�&����)�����a�t�[48�]�8�߿C �0����� BӁN�x ���T' �
Ǐ�1(�r��Ly���߮��{��$4�D��Z�i�7�l]�SY$1m:�q	g���ׯ\����@���+dT��u=<�6���#'#\BTΐuc��\��<�	����[�I�s�X
��U!�e/ʺ�ׯ\Z])3 ��`kS�׳^3�����s�>��/�@Q���u���n�q]p�VW�F�J�;x�]X��%-��R��{m�kW|���(�t;�RP@Q�u9�bvEԆY��+�S/��VhPbP�1�8�RV$�����="���TN������NW�T��9`xk������D�P}��
�Z�A2�]���u��^�4@9�t�T$��"ƨ��&��\�Y*�#�~����іj�tKY(�xv����eJ/)[Y会�G���ikIY:c|
��F�2�e㨬��q��Ӊ뺘�Q��X�^��[:[hj�g��ZŬ�E]������9��=�Ko%�朲�^u�5^քrU0oQN�b�����Ǖ�hP��J˱�A@E4)��:���Z�t��=��@̠��u��[�kR,�?Oi�%t�PPE�zX*����u�|��X��ujøp?�PC��#�+��\d���/]�_	^�XH!�5�jr*,��U�<$9ʳ�*�;Rw^��=�� t�uY��R��k)k��*�A��D�q�l6t�����t]r��:ܮBם&ڲqL a��̒2ֆJ� <\w��_�h���g�0���L]�*J}T��/��\\�ؼ>a�1\?������7d�Sf'2�/fb'vd_�X\�]*3��u���Wb^ϳ���u}��y�}���/ω}9#��y�-ea�z���	��s��Ul��	�& �d;�x&'o�5R�m1ఛ���H&c������J�ђ�7�
t,J����*P�i�'9T~�yr��p]�������0jwwwq*�Y      �      x�3�L�H�-�I�K��Efs��qqq �<	�            x������ � �      �   �   x�=�?�0�����@�ki�ts0N�I\IL�k�I<��\̰0��|
4j%�XqD����,+W%�XU����V�¹�]�<FJK�B�@��<.�{j�/���r�����sl�DR��kӅLb�>$��|\�:�4���ih��KP�X-c��/�      �      x������ � �      �   �  x�}�M��@���S��tUw��2"�l�@ ���k��"G�2��K��ô���{zt�ze�A�p����!�Q>n�y��8^~L7��W"6�5��Ѻ�>2�g�|��s��>�I�"-n%|��S�%��Z�� �]
�rl�ny�y:�����<Fѩ���q=�T�T�NG/�t?Lgv�.*��.O雕���S�ZJ��j�P4*�nj^��0𣢠��Aκ����}�6��JJ�zKV�hC�Myi�����9
�P�䆶���׽A�nJ�)�ъIm���pZ/?9r��.iP1ZBi���^u�ß����.�W��G��lv7�|x׸���D�l�.�nͽZ80v�z��@�5��ӆ���)�.{Um�	�"���WA۹���Q�v���� ���w��w�������&h�9��˹���#�
���v Q��}�Kp���NUӳ6(��p�~�kwm�'���~*�Ld         �  x��V�r�6�W_��c-���d���r��ENF�,*���`Y��\�rv���{@���+W�T�{zz�O�Y����Y�[.w�&+f���0����*cKn�hy��#XU����BT?[��ѵUe�6�*m�yէ�^�\�'��O�a��t[�s�l���[9)���m[��2rV��q�[�s�m���N�{�ح']�U�GR�"W�*B�@HP��W��Pk}6	�5��n��֛�l������G�9��'��r\چ�	�ÁJv�PEj�<>
3���ǿq�
,��mq�C����	�;g�U5��w@|T`Uh%v�k�!���p!({����]�Er�nmN���|��6��|s���O���sx�f�ft#BJ�D�ڒ%U0c�uuJ��zȗ��kcp�)�+_�dU�]vS@�Wg�!�pA;%���7�L��L!�����V��,_��w���>�	��0�bO ��1%	~��>����=���!3�+ɓ���͗�#r�9������W3*�Φ�W��]�����x����L��U����PňHJ!�b�+�=�z~wr�mM���	�z3��%�^	BDK���Y���-Վ�*�`���]�͖��l{�O���GiV�n��}R�O��*H����X!�>tO�@�I2	�*-FBF�3`�� ���E8Q	��T�Q�����<g�	�)Pr8*���`:{x���ĺR����Rֶ�kj���@�ɜ�quK�|��ۢ�y��S��:ͯ4�LRrI�)�u�=��jh[wc�U�
��*�#�sd~����4ƹ����k�λ+%	Üeϙ���-�e����P/V��KZ��y�IfI4����� J�u:	$h}4�Z���XP.__$��!3m��-�jbߑІ=��s�/��#/-��`���5��n�g�b>_�w�^�>z_���_�o�'�e��5��B���j�L���6gٿ�����"�>x���ԝ����,�6��*��PBo���0��Ś�v�^��w��X�9�j��1^p�4Z&���X�Z��)UA�8 �[�S5e`�Je����1/G|���,�J�S�OO����B�㠟&~���#9�BJ6��7����8��N�+���Q,�5���y�ݮ~9+nB���*�'�5�:`5Z�uzč�-�S42Z�Hx-5�dw�IYo1��4�t�ѐ�:��X�8M��\�@�ǮI���
)y���=S�KOo��X�	B���>+��      �   �   x���1�0й9E/P�߱C���1�t��*���z1�H#1���o�:�i#鎂ES���IO�m^��fvV6%�Qϑ�*N��G6B��H�[R�R��iX^Cf���,ߊ��-,�O�C-�K���|�����x%�u�a�?�n�F V�U�"��߇�c6��{ U8         �  x���Ѯ�0@��~�?@�L;������ɦ�B�r�I�~��Ȇn�>���� /��蝆��E���c�h�:�yN���6���C��Z�|A���Ǘ��(c�gz$�i���5p���T�{rB�@F�@�ƠA�Oz[
,*a/U}F�zЖ�?��b`%Z;6u�������-�'�+d��]Q����y��	�6Q�H)�G̙[�[�Kı-^QI��[�n���֌����x��R��![�d���ú.��%C�"��sB*���-��	�5ݷiN͘�C.�.-;���72��,��=홵1D���u�b"�-�/�UI�η�7�>�ﲹ��� h�72�h���~]��!�3�B-��������~�!�l����`��B	��?���i���}���>����NF      �   �   x�m�K
� ��q\�P����q'�e�H[�R(&�o�ƌ��&B�h�4Jv��[H�I2���3�	�^��w���z�[�luY�:55){���wr����2E�4��j9Pw�q��A|�@�?a�q@ﭴN>�R���;�      �   U   x�Ź11�̕fD}�l�q� ����r��d��Snnyx�E�zH1C���Q��>ю-t��n��/�ê=�{���?!��         �   x�MMKN�0[���-�4�Ǵ�B,�q 6o�d�&%m��X�#��(!�¶d�6��V�ҭ�����i#���}�J�ޠ�NKg:��to�O���Ca<!�c3�\
�ۋa����範#G\��%���!<Jx[&P�v�7;��]]|F�)�@�]	�z���9]O��q~��\��>6�S9M�u8���B�ҟ������-	���am�E�4��P)      �   W   x�3�4202�5"s#C+cC+K=S#c]c�������������������9H6"�S!(5=3?O!%U���Ҥ�T��=... >�X      �      x�3�4�4�2��\&@҄+F��� !��      �   �   x���;j1@��S�3���C��҈�cf�H�&wr�#�b�I��JP��<Fv�;�O?B"��;���q��zJ.v]�i+��Z4J%|s�:�d&#c��f��χxv�E���o��^�L�	n�j�����=��ȴ���+tt1�GLպ4ooW������]ܽ���Pe4�Z��>�ߚ�}�ٷܶ.�����dk�KfAm����,��Y����}����X      �      x������ � �      �   �  x���݊�0���S�N'&''_�K�Q���+A�X�,�vIg�m|�}�y1�nݡۆ��z~�G� �"CAdҥ��� q��R��@�!C�Iä��b���cC���P߇����S�.������S�-c�2�--~��kz����,Ͽ/���8��"��^T�����֥A80��J�R5���(ȑ y��@s�59���]3w����c���\� T���$� \��ɔfR9v�.��'�S��Ǿ�E���f��:k/ܗAU^`�s_(���D�4EyU8m_��W3S^1�g��i���f
�<��cی��3�'F?�z�ЏT�s+���x��[��|�+�k]��O>����s�SO3�q2S�����
.m� }����{��p����ЏÔb����_,L���;�k�4�b�KW�%AA�n����Nf���l� ��      �   q   x���0�js��I��.�� PX���aFK[.m�u�0z��Z�b�<0�BGnt兞�k�"_D�P+-�_��b�0@�FOY���m� ��:�����	�I?(,      �      x������ � �      �   �   x�-��
�@����U�p�}��3�2�0J��S���
�>:���x���ǭ�K_f(=$�f��)޾�M�{[D��,�НA��vؿŮ��*�i��ý����� Gp ��
B�8J?d u�ԄLg�S�- \� A��P&,o�QJE-      �      x������ � �      �      x������ � �     