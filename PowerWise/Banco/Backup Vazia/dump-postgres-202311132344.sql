PGDMP      ,            
    {            postgres    16.1    16.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE        CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4818                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    5            �            1259    16398    alerta    TABLE     �   CREATE TABLE public.alerta (
    idalerta integer NOT NULL,
    data_hora date NOT NULL,
    watts double precision NOT NULL,
    iddispositivo integer NOT NULL
);
    DROP TABLE public.alerta;
       public         heap    postgres    false    5            �            1259    16401    alerta_idalerta_seq    SEQUENCE     �   ALTER TABLE public.alerta ALTER COLUMN idalerta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.alerta_idalerta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216    5            �            1259    16402    consumo    TABLE     �   CREATE TABLE public.consumo (
    idconsumo integer NOT NULL,
    watts double precision NOT NULL,
    iddispositivo integer NOT NULL,
    idusuario integer NOT NULL,
    data_hora integer NOT NULL
);
    DROP TABLE public.consumo;
       public         heap    postgres    false    5            �            1259    16405    consumo_idconsumo_seq    SEQUENCE     �   ALTER TABLE public.consumo ALTER COLUMN idconsumo ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.consumo_idconsumo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218    5            �            1259    16406    dispositivo    TABLE     r  CREATE TABLE public.dispositivo (
    iddispositivo integer NOT NULL,
    idusuario integer NOT NULL,
    nome_dispositivo character varying NOT NULL,
    categoria character varying NOT NULL,
    tipo character varying NOT NULL,
    observacao character varying NOT NULL,
    status boolean NOT NULL,
    data_cadastro date NOT NULL,
    data_ativacao date NOT NULL
);
    DROP TABLE public.dispositivo;
       public         heap    postgres    false    5            �            1259    16411    dispositivo_iddispositivo_seq    SEQUENCE     �   ALTER TABLE public.dispositivo ALTER COLUMN iddispositivo ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dispositivo_iddispositivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220    5            �            1259    16412    usuario    TABLE     !  CREATE TABLE public.usuario (
    idusuario integer NOT NULL,
    username character varying NOT NULL,
    nome character varying NOT NULL,
    sobrenome character varying NOT NULL,
    email character varying NOT NULL,
    senha character varying NOT NULL,
    status boolean NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false    5            �            1259    16417    usuario_idusuario_seq    SEQUENCE     �   ALTER TABLE public.usuario ALTER COLUMN idusuario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuario_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222    5            �          0    16398    alerta 
   TABLE DATA           K   COPY public.alerta (idalerta, data_hora, watts, iddispositivo) FROM stdin;
    public          postgres    false    216   ?$       �          0    16402    consumo 
   TABLE DATA           X   COPY public.consumo (idconsumo, watts, iddispositivo, idusuario, data_hora) FROM stdin;
    public          postgres    false    218   \$       �          0    16406    dispositivo 
   TABLE DATA           �   COPY public.dispositivo (iddispositivo, idusuario, nome_dispositivo, categoria, tipo, observacao, status, data_cadastro, data_ativacao) FROM stdin;
    public          postgres    false    220   y$       �          0    16412    usuario 
   TABLE DATA           ]   COPY public.usuario (idusuario, username, nome, sobrenome, email, senha, status) FROM stdin;
    public          postgres    false    222   �$       �           0    0    alerta_idalerta_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.alerta_idalerta_seq', 1, false);
          public          postgres    false    217            �           0    0    consumo_idconsumo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.consumo_idconsumo_seq', 1, false);
          public          postgres    false    219            �           0    0    dispositivo_iddispositivo_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.dispositivo_iddispositivo_seq', 1, false);
          public          postgres    false    221            �           0    0    usuario_idusuario_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usuario_idusuario_seq', 1, true);
          public          postgres    false    223            -           2606    16419    consumo PKCONSUMO 
   CONSTRAINT     X   ALTER TABLE ONLY public.consumo
    ADD CONSTRAINT "PKCONSUMO" PRIMARY KEY (idconsumo);
 =   ALTER TABLE ONLY public.consumo DROP CONSTRAINT "PKCONSUMO";
       public            postgres    false    218            +           2606    16421    alerta PKIDALERTA 
   CONSTRAINT     W   ALTER TABLE ONLY public.alerta
    ADD CONSTRAINT "PKIDALERTA" PRIMARY KEY (idalerta);
 =   ALTER TABLE ONLY public.alerta DROP CONSTRAINT "PKIDALERTA";
       public            postgres    false    216            /           2606    16423    dispositivo PKIDDISPOSITIVO 
   CONSTRAINT     f   ALTER TABLE ONLY public.dispositivo
    ADD CONSTRAINT "PKIDDISPOSITIVO" PRIMARY KEY (iddispositivo);
 G   ALTER TABLE ONLY public.dispositivo DROP CONSTRAINT "PKIDDISPOSITIVO";
       public            postgres    false    220            1           2606    16425    usuario PKIDUSUARIO 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT "PKIDUSUARIO" PRIMARY KEY (idusuario);
 ?   ALTER TABLE ONLY public.usuario DROP CONSTRAINT "PKIDUSUARIO";
       public            postgres    false    222            2           2606    16426    alerta fkalertadispositivo    FK CONSTRAINT     �   ALTER TABLE ONLY public.alerta
    ADD CONSTRAINT fkalertadispositivo FOREIGN KEY (iddispositivo) REFERENCES public.dispositivo(iddispositivo);
 D   ALTER TABLE ONLY public.alerta DROP CONSTRAINT fkalertadispositivo;
       public          postgres    false    220    4655    216            3           2606    16431    consumo fkconsumodispositivo    FK CONSTRAINT     �   ALTER TABLE ONLY public.consumo
    ADD CONSTRAINT fkconsumodispositivo FOREIGN KEY (iddispositivo) REFERENCES public.dispositivo(iddispositivo);
 F   ALTER TABLE ONLY public.consumo DROP CONSTRAINT fkconsumodispositivo;
       public          postgres    false    4655    218    220            4           2606    16436    consumo fkconsumousuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.consumo
    ADD CONSTRAINT fkconsumousuario FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 B   ALTER TABLE ONLY public.consumo DROP CONSTRAINT fkconsumousuario;
       public          postgres    false    4657    218    222            5           2606    16441     dispositivo fkdispositivousuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.dispositivo
    ADD CONSTRAINT fkdispositivousuario FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 J   ALTER TABLE ONLY public.dispositivo DROP CONSTRAINT fkdispositivousuario;
       public          postgres    false    4657    222    220            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     