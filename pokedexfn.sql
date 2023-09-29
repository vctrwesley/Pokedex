PGDMP     :    +                {         	   pokedexfn    15.3    15.3 N    x           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            {           1262    16975 	   pokedexfn    DATABASE     �   CREATE DATABASE pokedexfn WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE pokedexfn;
                postgres    false            |           0    0    DATABASE pokedexfn    ACL     f   GRANT ALL ON DATABASE pokedexfn TO admin_user;
GRANT CONNECT ON DATABASE pokedexfn TO read_only_user;
                   postgres    false    3451            }           0    0    SCHEMA public    ACL     0   GRANT USAGE ON SCHEMA public TO read_only_user;
                   pg_database_owner    false    5            �            1255    17155    item_desconto()    FUNCTION     h  CREATE FUNCTION public.item_desconto() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.nome = 'Pokeball' THEN
        NEW.preco := NEW.preco * 0.9; -- Aplicar desconto de 10% para a pokebola
    ELSIF NEW.nome = 'Potion' THEN
        NEW.preco := NEW.preco * 0.8; -- Aplicar desconto de 20% para a potion
    END IF;


    RETURN NEW;
END;
$$;
 &   DROP FUNCTION public.item_desconto();
       public          postgres    false            �            1255    17154 .   new_user(character varying, character varying)    FUNCTION     �   CREATE FUNCTION public.new_user(p_nome character varying, p_email character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$ 
BEGIN 
INSERT INTO users (nome, email) 
VALUES (p_nome, p_email); 
END; 
$$;
 T   DROP FUNCTION public.new_user(p_nome character varying, p_email character varying);
       public          postgres    false            �            1259    17057    compra    TABLE     �   CREATE TABLE public.compra (
    cod_item character varying(30) NOT NULL,
    matricula integer NOT NULL,
    quantidade integer,
    data date
);
    DROP TABLE public.compra;
       public         heap    postgres    false            �            1259    17122    habilidade_especial    TABLE     w   CREATE TABLE public.habilidade_especial (
    matricula integer NOT NULL,
    cod_hm character varying(10) NOT NULL
);
 '   DROP TABLE public.habilidade_especial;
       public         heap    postgres    false            �            1259    17097    habilidades    TABLE     �   CREATE TABLE public.habilidades (
    cod_hab character varying(10) NOT NULL,
    id_num character varying(10) NOT NULL,
    cod_tm character varying(10),
    matricula integer NOT NULL,
    cod_hm character varying(10)
);
    DROP TABLE public.habilidades;
       public         heap    postgres    false            �            1259    17082    hm    TABLE       CREATE TABLE public.hm (
    cod_hm character varying(10) NOT NULL,
    nome character varying(30) NOT NULL,
    precisao integer,
    dano integer,
    descr_ataque character varying(150),
    matricula integer NOT NULL,
    nometip character varying(30) NOT NULL
);
    DROP TABLE public.hm;
       public         heap    postgres    false            �            1259    17012    info_pokemon    TABLE     �   CREATE TABLE public.info_pokemon (
    nome character varying(30) NOT NULL,
    regiao_capt character varying(50) NOT NULL,
    ginasio character varying(30) NOT NULL,
    descr_pok character varying(100),
    cod_ins character varying(20) NOT NULL
);
     DROP TABLE public.info_pokemon;
       public         heap    postgres    false            �            1259    17000    insignia    TABLE     �   CREATE TABLE public.insignia (
    cod_ins character varying(10) NOT NULL,
    nome character varying(50),
    descr_ins character varying(500),
    nometip character varying(20)
);
    DROP TABLE public.insignia;
       public         heap    postgres    false            �            1259    17052    itens    TABLE       CREATE TABLE public.itens (
    cod_item character varying(30) NOT NULL,
    nome character varying(30) NOT NULL,
    preco double precision NOT NULL,
    efeito character varying(100),
    descricao character varying(100),
    categoria character varying(30)
);
    DROP TABLE public.itens;
       public         heap    postgres    false            �            1259    17022    pokemon    TABLE     �   CREATE TABLE public.pokemon (
    id_num character varying(10) NOT NULL,
    nome character varying(20) NOT NULL,
    nivel integer,
    sexo character(1),
    velocidade integer,
    defesa integer,
    matricula integer NOT NULL
);
    DROP TABLE public.pokemon;
       public         heap    postgres    false            �            1259    17037    possui    TABLE     v   CREATE TABLE public.possui (
    id_num character varying(10) NOT NULL,
    nometip character varying(30) NOT NULL
);
    DROP TABLE public.possui;
       public         heap    postgres    false            �            1259    16976 	   professor    TABLE     k  CREATE TABLE public.professor (
    cpf character varying(11) NOT NULL,
    nome character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    senha character varying(50) NOT NULL,
    cep character varying(9),
    cidade character varying(20),
    bairro character varying(20),
    rua character varying(50),
    numero character varying(10)
);
    DROP TABLE public.professor;
       public         heap    postgres    false            �            1259    16983    tipos    TABLE     O  CREATE TABLE public.tipos (
    nometip character varying(50) NOT NULL,
    vantagens character varying(50),
    resistencia character varying(50),
    fraqueza1 character varying(50),
    fraqueza2 character varying(50),
    fraqueza3 character varying(50),
    fraqueza4 character varying(50),
    fraqueza5 character varying(50)
);
    DROP TABLE public.tipos;
       public         heap    postgres    false            �            1259    17072    tm    TABLE     �   CREATE TABLE public.tm (
    cod_tm character varying(10) NOT NULL,
    nome character varying(30) NOT NULL,
    precisao integer,
    dano integer,
    descr_ataque character varying(150),
    nometip character varying(20)
);
    DROP TABLE public.tm;
       public         heap    postgres    false            �            1259    16988 	   treinador    TABLE     %  CREATE TABLE public.treinador (
    matricula integer NOT NULL,
    nome character varying(30) NOT NULL,
    idade integer,
    email character varying(30) NOT NULL,
    senha character varying(30) NOT NULL,
    notas_pess character varying(100),
    obj_captu character varying(100),
    cpf character varying(11) NOT NULL,
    favorito1 character varying(30),
    favorito2 character varying(30),
    favorito3 character varying(30),
    favorito4 character varying(30),
    favorito5 character varying(30),
    favorito6 character varying(30)
);
    DROP TABLE public.treinador;
       public         heap    postgres    false            �            1259    17142    treinador_compra    VIEW     �  CREATE VIEW public.treinador_compra AS
 SELECT DISTINCT treinador.nome AS treinador_nome,
    treinador.email AS treinador_email,
    treinador.cpf AS treinador_cpf,
    compra.cod_item AS item_codigo,
    sum(compra.quantidade) AS item_quantidade,
    compra.data AS data_compra,
    itens.nome AS item_nome,
    itens.preco AS item_preco,
    sum(((compra.quantidade)::double precision * itens.preco)) AS valor_total_compra
   FROM ((public.treinador
     LEFT JOIN public.compra ON ((treinador.matricula = compra.matricula)))
     LEFT JOIN public.itens ON (((compra.cod_item)::text = (itens.cod_item)::text)))
  GROUP BY treinador.nome, treinador.email, treinador.cpf, compra.cod_item, compra.data, itens.nome, itens.preco
 HAVING (sum(compra.quantidade) > 0);
 #   DROP VIEW public.treinador_compra;
       public          postgres    false    216    216    216    216    221    221    221    222    222    222    222            �            1259    17137    treinador_pokemon_count    VIEW     �   CREATE VIEW public.treinador_pokemon_count AS
 SELECT tr.nome,
    count(poke.id_num) AS total_pokemon
   FROM (public.treinador tr
     LEFT JOIN public.pokemon poke ON ((tr.matricula = poke.matricula)))
  GROUP BY tr.nome;
 *   DROP VIEW public.treinador_pokemon_count;
       public          postgres    false    216    216    219    219            �            1259    17148    users    TABLE     x   CREATE TABLE public.users (
    id integer NOT NULL,
    nome character varying(50),
    email character varying(50)
);
    DROP TABLE public.users;
       public         heap    postgres    false            ~           0    0    TABLE users    ACL     e   GRANT ALL ON TABLE public.users TO admin_user;
GRANT SELECT ON TABLE public.users TO read_only_user;
          public          postgres    false    230            �            1259    17147    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    230                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    229            �           2604    17151    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            o          0    17057    compra 
   TABLE DATA           G   COPY public.compra (cod_item, matricula, quantidade, data) FROM stdin;
    public          postgres    false    222   �h       s          0    17122    habilidade_especial 
   TABLE DATA           @   COPY public.habilidade_especial (matricula, cod_hm) FROM stdin;
    public          postgres    false    226   ni       r          0    17097    habilidades 
   TABLE DATA           Q   COPY public.habilidades (cod_hab, id_num, cod_tm, matricula, cod_hm) FROM stdin;
    public          postgres    false    225   �i       q          0    17082    hm 
   TABLE DATA           \   COPY public.hm (cod_hm, nome, precisao, dano, descr_ataque, matricula, nometip) FROM stdin;
    public          postgres    false    224   Xj       k          0    17012    info_pokemon 
   TABLE DATA           V   COPY public.info_pokemon (nome, regiao_capt, ginasio, descr_pok, cod_ins) FROM stdin;
    public          postgres    false    218   }l       j          0    17000    insignia 
   TABLE DATA           E   COPY public.insignia (cod_ins, nome, descr_ins, nometip) FROM stdin;
    public          postgres    false    217   =n       n          0    17052    itens 
   TABLE DATA           T   COPY public.itens (cod_item, nome, preco, efeito, descricao, categoria) FROM stdin;
    public          postgres    false    221   co       l          0    17022    pokemon 
   TABLE DATA           [   COPY public.pokemon (id_num, nome, nivel, sexo, velocidade, defesa, matricula) FROM stdin;
    public          postgres    false    219   /q       m          0    17037    possui 
   TABLE DATA           1   COPY public.possui (id_num, nometip) FROM stdin;
    public          postgres    false    220   	r       g          0    16976 	   professor 
   TABLE DATA           ^   COPY public.professor (cpf, nome, email, senha, cep, cidade, bairro, rua, numero) FROM stdin;
    public          postgres    false    214   `r       h          0    16983    tipos 
   TABLE DATA           w   COPY public.tipos (nometip, vantagens, resistencia, fraqueza1, fraqueza2, fraqueza3, fraqueza4, fraqueza5) FROM stdin;
    public          postgres    false    215   Ft       p          0    17072    tm 
   TABLE DATA           Q   COPY public.tm (cod_tm, nome, precisao, dano, descr_ataque, nometip) FROM stdin;
    public          postgres    false    223   �u       i          0    16988 	   treinador 
   TABLE DATA           �   COPY public.treinador (matricula, nome, idade, email, senha, notas_pess, obj_captu, cpf, favorito1, favorito2, favorito3, favorito4, favorito5, favorito6) FROM stdin;
    public          postgres    false    216   |w       u          0    17148    users 
   TABLE DATA           0   COPY public.users (id, nome, email) FROM stdin;
    public          postgres    false    230   �y       �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    229            �           2606    17061    compra compra_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (cod_item, matricula);
 <   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_pkey;
       public            postgres    false    222    222            �           2606    17126 ,   habilidade_especial habilidade_especial_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.habilidade_especial
    ADD CONSTRAINT habilidade_especial_pkey PRIMARY KEY (matricula, cod_hm);
 V   ALTER TABLE ONLY public.habilidade_especial DROP CONSTRAINT habilidade_especial_pkey;
       public            postgres    false    226    226            �           2606    17101    habilidades habilidades_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.habilidades
    ADD CONSTRAINT habilidades_pkey PRIMARY KEY (cod_hab);
 F   ALTER TABLE ONLY public.habilidades DROP CONSTRAINT habilidades_pkey;
       public            postgres    false    225            �           2606    17086 
   hm hm_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.hm
    ADD CONSTRAINT hm_pkey PRIMARY KEY (cod_hm);
 4   ALTER TABLE ONLY public.hm DROP CONSTRAINT hm_pkey;
       public            postgres    false    224            �           2606    17016    info_pokemon info_pokemon_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.info_pokemon
    ADD CONSTRAINT info_pokemon_pkey PRIMARY KEY (nome);
 H   ALTER TABLE ONLY public.info_pokemon DROP CONSTRAINT info_pokemon_pkey;
       public            postgres    false    218            �           2606    17006    insignia insignia_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.insignia
    ADD CONSTRAINT insignia_pkey PRIMARY KEY (cod_ins);
 @   ALTER TABLE ONLY public.insignia DROP CONSTRAINT insignia_pkey;
       public            postgres    false    217            �           2606    17056    itens itens_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.itens
    ADD CONSTRAINT itens_pkey PRIMARY KEY (cod_item);
 :   ALTER TABLE ONLY public.itens DROP CONSTRAINT itens_pkey;
       public            postgres    false    221            �           2606    17026    pokemon pokemon_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_pkey PRIMARY KEY (id_num);
 >   ALTER TABLE ONLY public.pokemon DROP CONSTRAINT pokemon_pkey;
       public            postgres    false    219            �           2606    17041    possui possui_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.possui
    ADD CONSTRAINT possui_pkey PRIMARY KEY (id_num, nometip);
 <   ALTER TABLE ONLY public.possui DROP CONSTRAINT possui_pkey;
       public            postgres    false    220    220            �           2606    16982    professor professor_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.professor DROP CONSTRAINT professor_email_key;
       public            postgres    false    214            �           2606    16980    professor professor_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (cpf);
 B   ALTER TABLE ONLY public.professor DROP CONSTRAINT professor_pkey;
       public            postgres    false    214            �           2606    16987    tipos tipos_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.tipos
    ADD CONSTRAINT tipos_pkey PRIMARY KEY (nometip);
 :   ALTER TABLE ONLY public.tipos DROP CONSTRAINT tipos_pkey;
       public            postgres    false    215            �           2606    17076 
   tm tm_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tm
    ADD CONSTRAINT tm_pkey PRIMARY KEY (cod_tm);
 4   ALTER TABLE ONLY public.tm DROP CONSTRAINT tm_pkey;
       public            postgres    false    223            �           2606    16994    treinador treinador_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.treinador
    ADD CONSTRAINT treinador_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.treinador DROP CONSTRAINT treinador_email_key;
       public            postgres    false    216            �           2606    16992    treinador treinador_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.treinador
    ADD CONSTRAINT treinador_pkey PRIMARY KEY (matricula);
 B   ALTER TABLE ONLY public.treinador DROP CONSTRAINT treinador_pkey;
       public            postgres    false    216            �           2606    17153    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    230            �           2620    17156    itens aplicardescontotrigger    TRIGGER     z   CREATE TRIGGER aplicardescontotrigger BEFORE INSERT ON public.itens FOR EACH ROW EXECUTE FUNCTION public.item_desconto();
 5   DROP TRIGGER aplicardescontotrigger ON public.itens;
       public          postgres    false    232    221            �           2606    17062    compra compra_cod_item_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_cod_item_fkey FOREIGN KEY (cod_item) REFERENCES public.itens(cod_item) ON UPDATE CASCADE ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_cod_item_fkey;
       public          postgres    false    221    222    3255            �           2606    17067    compra compra_matricula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_matricula_fkey FOREIGN KEY (matricula) REFERENCES public.treinador(matricula) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_matricula_fkey;
       public          postgres    false    3245    222    216            �           2606    17132 3   habilidade_especial habilidade_especial_cod_hm_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.habilidade_especial
    ADD CONSTRAINT habilidade_especial_cod_hm_fkey FOREIGN KEY (cod_hm) REFERENCES public.hm(cod_hm) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public.habilidade_especial DROP CONSTRAINT habilidade_especial_cod_hm_fkey;
       public          postgres    false    224    226    3261            �           2606    17127 6   habilidade_especial habilidade_especial_matricula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.habilidade_especial
    ADD CONSTRAINT habilidade_especial_matricula_fkey FOREIGN KEY (matricula) REFERENCES public.treinador(matricula) ON UPDATE CASCADE ON DELETE SET NULL;
 `   ALTER TABLE ONLY public.habilidade_especial DROP CONSTRAINT habilidade_especial_matricula_fkey;
       public          postgres    false    3245    216    226            �           2606    17112 #   habilidades habilidades_cod_hm_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.habilidades
    ADD CONSTRAINT habilidades_cod_hm_fkey FOREIGN KEY (cod_hm) REFERENCES public.hm(cod_hm) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.habilidades DROP CONSTRAINT habilidades_cod_hm_fkey;
       public          postgres    false    225    224    3261            �           2606    17107 #   habilidades habilidades_cod_tm_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.habilidades
    ADD CONSTRAINT habilidades_cod_tm_fkey FOREIGN KEY (cod_tm) REFERENCES public.tm(cod_tm) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.habilidades DROP CONSTRAINT habilidades_cod_tm_fkey;
       public          postgres    false    3259    225    223            �           2606    17102 #   habilidades habilidades_id_num_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.habilidades
    ADD CONSTRAINT habilidades_id_num_fkey FOREIGN KEY (id_num) REFERENCES public.pokemon(id_num) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.habilidades DROP CONSTRAINT habilidades_id_num_fkey;
       public          postgres    false    3251    225    219            �           2606    17117 &   habilidades habilidades_matricula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.habilidades
    ADD CONSTRAINT habilidades_matricula_fkey FOREIGN KEY (matricula) REFERENCES public.treinador(matricula) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.habilidades DROP CONSTRAINT habilidades_matricula_fkey;
       public          postgres    false    3245    225    216            �           2606    17092    hm hm_matricula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hm
    ADD CONSTRAINT hm_matricula_fkey FOREIGN KEY (matricula) REFERENCES public.treinador(matricula) ON UPDATE CASCADE ON DELETE SET NULL;
 >   ALTER TABLE ONLY public.hm DROP CONSTRAINT hm_matricula_fkey;
       public          postgres    false    224    3245    216            �           2606    17087    hm hm_nometip_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hm
    ADD CONSTRAINT hm_nometip_fkey FOREIGN KEY (nometip) REFERENCES public.tipos(nometip) ON UPDATE CASCADE ON DELETE SET NULL;
 <   ALTER TABLE ONLY public.hm DROP CONSTRAINT hm_nometip_fkey;
       public          postgres    false    215    3241    224            �           2606    17017 &   info_pokemon info_pokemon_cod_ins_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.info_pokemon
    ADD CONSTRAINT info_pokemon_cod_ins_fkey FOREIGN KEY (cod_ins) REFERENCES public.insignia(cod_ins) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.info_pokemon DROP CONSTRAINT info_pokemon_cod_ins_fkey;
       public          postgres    false    3247    218    217            �           2606    17007    insignia insignia_nometip_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.insignia
    ADD CONSTRAINT insignia_nometip_fkey FOREIGN KEY (nometip) REFERENCES public.tipos(nometip) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.insignia DROP CONSTRAINT insignia_nometip_fkey;
       public          postgres    false    217    215    3241            �           2606    17027    pokemon pokemon_matricula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_matricula_fkey FOREIGN KEY (matricula) REFERENCES public.treinador(matricula) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.pokemon DROP CONSTRAINT pokemon_matricula_fkey;
       public          postgres    false    3245    219    216            �           2606    17032    pokemon pokemon_nome_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_nome_fkey FOREIGN KEY (nome) REFERENCES public.info_pokemon(nome) ON UPDATE CASCADE ON DELETE SET NULL;
 C   ALTER TABLE ONLY public.pokemon DROP CONSTRAINT pokemon_nome_fkey;
       public          postgres    false    219    3249    218            �           2606    17042    possui possui_id_num_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.possui
    ADD CONSTRAINT possui_id_num_fkey FOREIGN KEY (id_num) REFERENCES public.pokemon(id_num) ON UPDATE CASCADE ON DELETE SET NULL;
 C   ALTER TABLE ONLY public.possui DROP CONSTRAINT possui_id_num_fkey;
       public          postgres    false    220    219    3251            �           2606    17047    possui possui_nometip_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.possui
    ADD CONSTRAINT possui_nometip_fkey FOREIGN KEY (nometip) REFERENCES public.tipos(nometip) ON UPDATE CASCADE ON DELETE SET NULL;
 D   ALTER TABLE ONLY public.possui DROP CONSTRAINT possui_nometip_fkey;
       public          postgres    false    215    220    3241            �           2606    17077    tm tm_nometip_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tm
    ADD CONSTRAINT tm_nometip_fkey FOREIGN KEY (nometip) REFERENCES public.tipos(nometip) ON UPDATE CASCADE ON DELETE SET NULL;
 <   ALTER TABLE ONLY public.tm DROP CONSTRAINT tm_nometip_fkey;
       public          postgres    false    223    215    3241            �           2606    16995    treinador treinador_cpf_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.treinador
    ADD CONSTRAINT treinador_cpf_fkey FOREIGN KEY (cpf) REFERENCES public.professor(cpf) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.treinador DROP CONSTRAINT treinador_cpf_fkey;
       public          postgres    false    214    3239    216            o   v   x�e�;� �:�'l��v������c�e�7�D	bG&0$r����J�q�'7�����j��M%�9e�F�TX�B�wa}Ro��S�� �
;A���5���#��~�%�p��20      s   H   x�342600����\f�&0��c�1��DȀ9c.*c�ei`�r���(3�261�ɘs��qqq zHm      r   �   x�M�;!E��l#}��2�h�j���:�g���fz�f:>�B������i\�Jv���0F7�����4L����d�Y�-�;�y�h�2l�3Sg٭�jXY�gVX���{�`=��y���L)]C�5�      q     x��T͎�0>�O�7��m�#�"��(��I2m�&�0cG�7��x��c���-�JH�;��~�s���ljv��f�ef��'>�%��t`㢀 `KhȢmI�	��U�J�{b�9x�� �� �С�eG��50��������'[%03ϫ/f��w�}���o�t��sPc㵻�V��r��Kp���?���Fn,.n����p�ک ��n�55Vai�����5��D�p%�(�c�� bV��&,���#��C�]�A`���Q�w���8��=3/AO	���ts��4����:��6��5uJ�D����OE��m=u���M�T�o�yp|e�Pqkw5� ����pH���l��+t#���U�5.�D#4�X/����ڼ������P��|�����J���rz�W�$m4II��B���O}]j�F�
j�"D�q̚S�C�X�;;����W+��&�(f6O�gGu������<s��U#Bu|`��s[�%�9�����w��u�X��|x<�L~|F��      k   �  x���Mn�0���)�.�4h���d��@ 7-��H�x��p���G	�(r]��`�v"!^I"�}x���-V�X�E�"��=׌�8c��'�y
�+)�I����tu��������=�A_2X��|Mp*7�No����?,��\�b�i΄|4��:54O-L喬�<9�R�̣�73r�dT�'�����+m�@�bb�yl5o���F���*Xd�@4��J4�v�	'��� �'���an�?#��f��<��K��RQ����j�}�M�W�;�h �\�.L�H=�h��X�h]x;�%�W,[Q_[@=�mi#=�r:�ry�C�y[�%�\�n���[6��ځ��7i�.���w)>|�T~Ed_�NܗFG��F���)�@�ؠa�� ���×�%�O�y�y�-%�&*�K&�$�cT���      j     x���MN�0F��)|D�˲�&�.�،b+��z����(,Y��v�@��[�=}��u�Gd�K{*��R��22��,G�.9��PȔ=qaG�J�D&��Ñ.���ɴgႥQ�_�9�s6��	���"�B���Ϣz�J.���Ml�c�4�Oz�� ���lKaj%@����M�E��
8�kG�����Pg+xA?�������}�!��C��|��no]A�~���i4����,0�N�2�6I7���l~�f��8cC���]PJ ��0{      n   �  x��S�N�@��O1O�|I�(P �8ҥ�#�b�c��B�JQ����2k�˝t�P�d��~3������:�j�As�Η�[tE��=���Qݐ��h:z��"<Dl��R$�nGzG+�'+�7TŎ�ߜ�5o5eWI�P�J��E��cy؇^j}<�ԥ޶Q��<��>�� ��q�RY��L�Ii��-�A���R��f5���<�j}�^J6�'����\$�3��F��;l��\5KBoȎd�L�4A"�f�75��l�8��s���㾜�q_�D���mmR�E�5�[�	h��������Y{ݓ�?%t(��0�`�\ɕ~ԖUڀb7�z(1��C/cr�������PaW<}�ޑޒ���^�h�' _E�^-Etޒ��ѧhAwk��ӳ���Ȥ��I�216Y���߻.����I�e��      l   �   x�M��j�0D����=�˒�.r0
���Ա�l��OVQi`o�13[�T8�?�{����� �H%Q������BϠ�NB��,4q�r���Y��ұ Y�8\��\��'?���W�yP�g7�>Hb��z~����-�Bm^&h�_���3�`�~�؜`��¶�	-��'��,�ɭ�2�Y0������]Qwq�He      m   G   x�S602�t�9���(39�K�����-?�2�t/J�M1�Lc����2�<ܘ^
��@0-��=... ��      g   �  x�mS�n�@}�b �`x�M�Q�XAj^�2����¸�`K��~J�3K���/0#Ξs�̐-��u�)�4�'<���С�ICL� P�%|5δ{�t?8��UK^��;�@������r��%����f��,� �{}���H�a�7�>ȲT�L�ʩ�O�q��h���/�i����B��� /�Z��%�f���A������[�=�F����h<ʁ�6]�=��E�6�����/�La�΢���GKs��?	��Π�i|E�N���S��ِj���^��~���.�2
vxB-O�����I�ć�:��*f%�iK�39�J5�xF�MP�B<�(�����9�6���f�0�!<c�t�aK�:�M�?	*ڬ�b�(�e���� �v��J����zw�b	kOn �����<�[�F˼d�l�a�
;c�-�&t��G�&���cܱ Z�C{d/��2
����[E�z�'      h   p  x�mRKj�0]K��L�Ph
%��FmD����,]�.z
_�ּ7����43O��u����=���<��:w
Ѭ�����>z��y�
f�OљMt�3ǭ]�s���6����|?���i�zZ�2����p��;"*���"����Ѓ��NY��Jk]Q��#<ps�o�a��`��kh��e!��zz�G%*g%����G��$�Kq	`uC�!6���dg��?�d	nt�(��cM�f�ue|K��ݠ�yf2ً��2 $#h��2k��Il�8�GD\H$��Ŗ�3�Ѝ���R�ڵ��By��g���Y�������� ����g�Y>o�,��� �u�      p   �  x�e�AR�0E��S�	�l{	E�J'l�i,1V�Փ�<�\(�EVa.��=@Rl\vY�����^�em?c�}������D�G��o'qc��h�����5}��w�y���d��i�h���N,y�	�}��g�ny�J8�qJ��TM�7piW������F?/�ըQ��xo�<�>�O�v��rz'�p����ld��;�D��x�܇�{�Bg3`Y��8�yw4�"��70Ҽ���O�Ԉ�@� �{'�>�1��l�?�!a$�@���Ԋ:��c,�.\w��T{�G��cv�aLdX��Z~p]Vlj8	��Y��&���݆�J:�%��wo��%�8�a�@�d1znop�~m��kuɺ'��C�*2I;?b��<P�e.ow	:p
~=���^ͬ֊P�uQ�_Џ�w      i   :  x���Mn�0���S�,�O޵I� m���l���b,qT�r�ަȢ�.{]�C�vdC.
�����f�$�	|�����tO��~U�)/4W����#��^��=��p�|�`6�rR��8�l<�β��zU�3���۪�������L'�H���P-����P��)_N��<�ɩ�4��)��q]聛����Xt����^�S��H�N���\�¾6������!,�5ƅ�N�1�|�X�!�2v\��Wm�)���@���o��D�8�P�;]���.')���n��μ�6=md��kt/�א�`%uM�!�;��R=���bv%D�4E�B2�9�U�H�����Wv�;O��P,)N�T��_�jt�h#�]U-���l��]�L�v ��+��
��YzWv4J:���ό[T'���㎐�^�FԾ*��bV��yM�\�Cz��4�������.�
�)�/:�j�F�9���|(��"/���1��9{%O�������l�ΧF�?�D��}�g�5�����l�2:����v�F��h:%�xv��~��H���`0�G���      u      x������ � �     